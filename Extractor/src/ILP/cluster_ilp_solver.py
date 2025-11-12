#!/usr/bin/env python3
"""
Cluster ILP Solver
==================

Runs ILP optimization on merged e-graphs from multiple programs in a cluster.
Generates multiple variants using different scaling factors.

Usage:
    python cluster_ilp_solver.py --programs prog1 prog2 --scales "0 1 10" --best-k 3
"""

import argparse
import json
import os
import sys
import time
from pathlib import Path
from typing import List, Dict

# Add project paths
extractor_dir = Path(__file__).resolve().parents[2]  # Extractor/
project_root = extractor_dir.parent  # egraph_isa_compiler_codesign/
sys.path.insert(0, str(extractor_dir))
sys.path.insert(0, str(project_root))

from src.cluster_egraph_merger import ClusterEGraphMerger
from src.egraph import EGraph, ENode, EClass, collect_program_json_files
from src.ILP.ilp_gen import generate_ilp_file
from src.ILP.ilp_solver import run_gurobi_solver, parse_solution_file, extract_solution, analyze_solution


class ClusterILPSolver:
    """Solves ILP for a cluster of programs with multiple scaling factors."""

    ### saturation result is stored in the frontend
    def __init__(
        self,
        cluster_programs: List[str],
        base_dir: str = "output/frontend",
        program_roots_cache: Dict = None
    ):
        """
        Initialize cluster ILP solver.

        Args:
            cluster_programs: List of program names in the cluster
            base_dir: Base directory containing program outputs
            program_roots_cache: Pre-computed {program_name: root_ec_en} dict
        """
        self.cluster_programs = cluster_programs
        self.base_dir = Path(base_dir)
        self.merger = ClusterEGraphMerger(base_dir=str(base_dir))
        self.program_roots_cache = program_roots_cache or {}

        # Generate cluster identifier
        self.cluster_name = self.merger.get_cluster_name(cluster_programs)

    def _add_roots_from_union(self, egraph_merged):
        """Create per-block roots matching individual e-graph structure."""
        
        # Group roots by prefix (program_block)
        prefix_roots = {}
        for prog_name in self.cluster_programs:
            for root_eclass in self.program_roots_cache.get(prog_name, []):
                # Extract prefix: "dijkstra_small_O3_0_eclass_Inst_8" -> "dijkstra_small_O3_0"
                prefix = '_'.join(root_eclass.split('_eclass')[0].split('_')[:3])  # prog_block
                if prefix not in prefix_roots:
                    prefix_roots[prefix] = []
                prefix_roots[prefix].append(root_eclass)
        
        # Create per-block synthetic roots (matching add_pseudo_root structure)
        for prefix, orphan_ecs in prefix_roots.items():
            root_eclass_id = f"{prefix}_eclass_root"
            root_enode_id = f"{prefix}_enode_root"
            
            # Create root enode
            egraph_merged.enodes[root_enode_id] = ENode(
                eclass_id=root_eclass_id,
                enode_id=root_enode_id,
                op="root",
                children=orphan_ecs,  # Actual root eclasses
                cost=0
            )
            
            # Create/update root eclass
            if root_eclass_id not in egraph_merged.eclasses:
                egraph_merged.eclasses[root_eclass_id] = EClass(root_eclass_id)
            egraph_merged.eclasses[root_eclass_id].member_enodes.add(root_enode_id)
            
            # Add to root_ec_en
            egraph_merged.root_ec_en[root_eclass_id] = root_enode_id
            
            # Update parent links
            for orphan_ec in orphan_ecs:
                if orphan_ec in egraph_merged.eclasses:
                    egraph_merged.eclasses[orphan_ec].parent_enodes.add(root_enode_id)

    def solve_with_multiple_scales(
        self,
        scales: List[float],
        best_k: int = 3,
        cost_mode: str = "program_size",
        timeout: int = 900,
        output_dir: str = None
    ) -> Dict:
        """
        Run ILP optimization with multiple scaling factors.

        Args:
            scales: List of node cost scaling factors
            best_k: Number of solutions per scaling factor
            cost_mode: Cost optimization mode ("program_size" or "latency")
            timeout: ILP solver timeout in seconds
            output_dir: Base output directory

        Returns:
            Dictionary with results for each scale
        """
        if output_dir is None:
            output_dir = f"output/ilp/cluster_{self.cluster_name}"

        output_path = Path(output_dir)
        output_path.mkdir(parents=True, exist_ok=True)

        print("=" * 80)
        print("Cluster ILP Solver - Multi-Scale Optimization")
        print("=" * 80)
        print(f"Cluster programs: {self.cluster_programs}")
        print(f"Cluster name: {self.cluster_name}")
        print(f"Scaling factors: {scales}")
        print(f"Solutions per scale: {best_k}")
        print(f"Cost mode: {cost_mode}")
        print(f"ILP timeout: {timeout}s")
        print(f"Output directory: {output_path}")
        print("=" * 80)
        print()

        # Step 1: Merge e-graphs from all programs
        print("Step 1: Merging e-graphs from cluster programs...")
        merged_json_path = self.merger.merge_cluster(
            self.cluster_programs,
            output_path=str(output_path / "merged.json")
        )
        print()

        # Step 2: Load merged e-graph
        print("Step 2: Loading merged e-graph...")
        start_load = time.time()

        # Load JSON data from file
        with open(merged_json_path, 'r') as f:
            merged_data = json.load(f)

        # Create EGraph and load data
        egraph = EGraph(cost_mode=cost_mode)  # Create empty e-graph with cost mode

        # Load execution counts from all programs in cluster (BEFORE loading enodes)
        # This must happen before from_json_file() because costs are computed during loading
        if cost_mode == "latency":
            egraph.load_execution_counts_for_cluster(self.cluster_programs)

        egraph.from_json_file(merged_data)  # Load from dictionary

        # CRITICAL: Add accurate root eclasses from pre-computed individual programs
        # Union roots from all programs in this cluster
        print("  Adding accurate roots from individual program cache...")
        self._add_roots_from_union(egraph)

        load_time = time.time() - start_load
        print(f"✓ E-graph loaded in {load_time:.2f}s")
        print(f"  Nodes: {len(egraph.enodes)}")
        print(f"  Eclasses: {len(egraph.eclasses)}")
        print(f"  Root eclasses: {len(egraph.root_ec_en)}")

        if len(egraph.root_ec_en) == 0:
            print("  ❌ WARNING: No root eclasses found! ILP will return empty solution.")
        print()

        # Step 3: Run ILP for each scaling factor
        all_results = {}
        total_solutions = 0

        for scale_idx, scale in enumerate(scales):
            scale_name = f"scale_{scale}"
            print(f"\nStep 3.{scale_idx + 1}: Running ILP with scale={scale}...")
            print("-" * 60)

            # Create scale-specific output directories
            scale_output = output_path / scale_name
            scale_lp_dir = scale_output / "lp"
            scale_sol_dir = scale_output / "sol"
            scale_result_dir = scale_output / "result"

            scale_lp_dir.mkdir(parents=True, exist_ok=True)
            scale_sol_dir.mkdir(parents=True, exist_ok=True)
            scale_result_dir.mkdir(parents=True, exist_ok=True)

            # Generate ILP file
            lp_file = scale_lp_dir / "problem.lp"
            print(f"  Generating ILP formulation (scale={scale})...")
            start_ilp = time.time()
            generate_ilp_file(
                egraph,
                str(lp_file),
                zero_nodes=None,
                node_cost_scale=scale
            )
            ilp_time = time.time() - start_ilp
            print(f"  ✓ ILP file generated in {ilp_time:.2f}s")

            # Solve ILP
            sol_file = scale_sol_dir / "solution.sol"
            log_file = scale_output / "solver.log"

            print(f"  Solving ILP (timeout={timeout}s, solutions={best_k})...")
            start_solve = time.time()

            success = run_gurobi_solver(
                lp_file=str(lp_file),
                sol_file=str(sol_file),
                log_file=str(log_file),
                timeout=timeout,
                mst_file=None,
                best_k=best_k,
                threads=0  # 0 = use all available cores
            )

            solve_time = time.time() - start_solve

            if not success:
                print(f"  ✗ ILP solving failed for scale={scale}")
                all_results[scale_name] = {
                    'success': False,
                    'scale': scale,
                    'error': 'ILP solver failed'
                }
                continue

            print(f"  ✓ Solving completed in {solve_time:.2f}s")

            # Parse solutions
            solution_files = []
            if best_k == 1:
                solution_files = [str(sol_file)]
            else:
                for k in range(best_k):
                    sol_k = str(sol_file).replace('.sol', f'_{k}.sol')
                    if os.path.exists(sol_k):
                        solution_files.append(sol_k)

            print(f"  Found {len(solution_files)} solution(s)")

            # Process each solution
            scale_solutions = []
            for sol_idx, sol_path in enumerate(solution_files):
                # Parse solution
                variables = parse_solution_file(sol_path)
                choices = extract_solution(egraph, variables)
                analysis = analyze_solution(egraph, choices, variables)

                # Save result
                result_file = scale_result_dir / f"result_{sol_idx}.json"
                result_data = {
                    'cluster_programs': self.cluster_programs,
                    'cluster_name': self.cluster_name,
                    'scale': scale,
                    'solution_id': sol_idx,
                    'solution_file': sol_path,
                    'statistics': analysis,
                    'choices': choices,
                    'times': {
                        'ilp_gen': ilp_time,
                        'solve': solve_time
                    }
                }

                with open(result_file, 'w') as f:
                    json.dump(result_data, f, indent=2)

                scale_solutions.append({
                    'variant_id': total_solutions,
                    'global_variant_id': total_solutions,
                    'scale': scale,
                    'scale_variant_id': sol_idx,
                    'instruction_set': sorted(analysis['ilp_activated_ops']),
                    'num_operators': analysis['num_op_types_ilp'],
                    'result_file': str(result_file),
                    'solution_file': sol_path
                })

                total_solutions += 1

            all_results[scale_name] = {
                'success': True,
                'scale': scale,
                'solutions': scale_solutions,
                'times': {
                    'ilp_gen': ilp_time,
                    'solve': solve_time
                }
            }

            print(f"  ✓ Scale {scale}: {len(scale_solutions)} variants generated")

        # Summary
        print("\n" + "=" * 80)
        print("Cluster ILP Optimization Summary")
        print("=" * 80)
        print(f"Cluster: {self.cluster_programs}")
        print(f"Scales processed: {len([r for r in all_results.values() if r['success']])}/{len(scales)}")
        print(f"Total variants generated: {total_solutions}")
        print("=" * 80)

        # Save summary
        summary_file = output_path / "ilp_summary.json"
        summary = {
            'cluster_programs': self.cluster_programs,
            'cluster_name': self.cluster_name,
            'scales': scales,
            'best_k': best_k,
            'timeout': timeout,
            'total_variants': total_solutions,
            'scale_results': all_results
        }

        with open(summary_file, 'w') as f:
            json.dump(summary, f, indent=2)

        print(f"Summary saved to: {summary_file}")

        return summary


def main():
    parser = argparse.ArgumentParser(
        description="ILP optimization for program clusters"
    )
    parser.add_argument(
        '--programs',
        nargs='+',
        required=True,
        help="List of program names in the cluster"
    )
    parser.add_argument(
        '--scales',
        type=str,
        default="0 0.1 0.5 1 10 100",
        help="Space-separated scaling factors (default: '0 0.1 0.5 1 10 100')"
    )
    parser.add_argument(
        '--best-k',
        type=int,
        default=3,
        help="Number of solutions per scaling factor (default: 3)"
    )
    parser.add_argument(
        '--timeout',
        type=int,
        default=900,
        help="ILP solver timeout in seconds (default: 900)"
    )
    parser.add_argument(
        '--base-dir',
        default="output/frontend",
        help="Base directory containing program outputs (default: output/frontend)"
    )
    parser.add_argument(
        '--output',
        help="Output directory (default: output/ilp/cluster_<name>)"
    )

    args = parser.parse_args()

    # Parse scales
    scales = [float(s) for s in args.scales.split()]

    print(f"Programs to cluster: {args.programs}")
    print(f"Scales: {scales}")
    print()

    # Run cluster ILP solver
    solver = ClusterILPSolver(args.programs, base_dir=args.base_dir)
    results = solver.solve_with_multiple_scales(
        scales=scales,
        best_k=args.best_k,
        timeout=args.timeout,
        output_dir=args.output
    )

    print("\n✓ Cluster ILP optimization complete!")
    return 0


if __name__ == "__main__":
    sys.exit(main())
