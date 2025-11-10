#!/usr/bin/env python3
"""
Build Application-Specific ISA Processors (ASIP) for Program Clusters
======================================================================

This script performs cluster-based ISA optimization:
1. Loads clustering results for multiple K values
2. For each cluster, merges e-graphs and runs multi-scale ILP optimization
3. Generates assembly variants for each cluster's ASIP
4. Synthesizes all variants to measure area and latency
5. Selects best ASIP per cluster based on geometric mean(area×latency)
6. Plots K vs. overall performance

Usage:
    python build_cluster_asips.py --clustering multi_k_clustering.json
    python build_cluster_asips.py --clustering multi_k_clustering.json --k-values 2 3
"""

import argparse
import json
import sys
import time
import subprocess
import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path
from typing import Dict, List, Tuple
from multiprocessing import Pool
from functools import partial

# Add project paths
sys.path.insert(0, str(Path(__file__).parent))
sys.path.insert(0, str(Path(__file__).parent / "Extractor"))

from Extractor.src.ILP.cluster_ilp_solver import ClusterILPSolver
from Extractor.src.egraph import EGraph
import Saturation.data_structure as ds
import backend.area_parser as ap
import backend.latency_parser as lp


class ClusterASIPBuilder:
    """Builds application-specific ISA processors for program clusters."""

    def __init__(
        self,
        clustering_file: str,
        base_dir: str = "output/frontend",
        output_dir: str = "output/cluster_asips"
    ):
        """
        Initialize ASIP builder.

        Args:
            clustering_file: Path to multi_k_clustering.json
            base_dir: Base directory with frontend outputs
            output_dir: Output directory for ASIP results
        """
        self.base_dir = Path(base_dir)
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(parents=True, exist_ok=True)

        # Load clustering results
        with open(clustering_file, 'r') as f:
            self.clustering_data = json.load(f)

        self.programs = self.clustering_data['programs']
        self.clusterings = self.clustering_data['clusterings']

        print("="*80)
        print("Cluster-Based ASIP Builder")
        print("="*80)
        print(f"Programs: {len(self.programs)}")
        print(f"K values available: {sorted([int(k[1:]) for k in self.clusterings.keys()])}")
        print(f"Output directory: {self.output_dir}")
        print("="*80)
        print()

        # Pre-compute accurate roots for all programs (reuse across all K values)
        print("Pre-computing accurate root eclasses for all programs...")
        self.program_roots = {}
        for prog_name in self.programs:
            try:
                # Load individual program (calls add_pseudo_root() internally)
                individual_egraph = EGraph(prog_name)

                # Extract ACTUAL roots (children of synthetic root enodes)
                actual_roots = []
                for root_eclass_id, root_enode_id in individual_egraph.root_ec_en.items():
                    if root_enode_id in individual_egraph.enodes:
                        root_enode = individual_egraph.enodes[root_enode_id]
                        # Children are the actual root eclasses
                        # Filter out synthetic roots (ending with _root)
                        actual_children = [
                            child for child in root_enode.children
                            if not (child.endswith('_eclass_root') or child.endswith('_enode_root'))
                        ]
                        actual_roots.extend(actual_children)

                # Store as list of actual root eclass IDs (remove duplicates)
                self.program_roots[prog_name] = list(set(actual_roots))
                print(f"  ✓ {prog_name}: {len(self.program_roots[prog_name])} actual roots")
            except Exception as e:
                print(f"  ✗ {prog_name}: Failed to load - {e}")
                self.program_roots[prog_name] = []

        total_roots = sum(len(roots) for roots in self.program_roots.values())
        print(f"✓ Pre-computed {total_roots} total roots across {len(self.programs)} programs")
        print()

    def build_asips_for_k(
        self,
        k: int,
        scales: List[float],
        best_k: int,
        ilp_timeout: int,
        synth_jobs: int
    ) -> Dict:
        """
        Build ASIPs for all clusters at a given K value.

        Args:
            k: Number of clusters
            scales: ILP scaling factors
            best_k: Variants per scale
            ilp_timeout: ILP timeout in seconds
            synth_jobs: Parallel synthesis jobs

        Returns:
            Results dictionary for this K
        """
        k_key = f'k{k}'
        if k_key not in self.clusterings:
            print(f"Warning: K={k} not found in clustering results")
            return None

        k_data = self.clusterings[k_key]
        k_output = self.output_dir / k_key
        k_output.mkdir(exist_ok=True)

        print("\n" + "="*80)
        print(f"Building ASIPs for K={k} ({k_data['n_clusters']} clusters)")
        print("="*80)

        cluster_results = {}

        # Process each cluster
        for cluster_key, cluster_data in k_data['clusters'].items():
            cluster_id = int(cluster_key.split('_')[1])
            cluster_programs = cluster_data['programs']

            print(f"\n{'='*60}")
            print(f"Cluster {cluster_id}: {cluster_programs}")
            print(f"{'='*60}")

            # Step 1: Run ILP optimization for this cluster
            print(f"\nStep 1: Running multi-scale ILP for cluster {cluster_id}...")
            ilp_result = self._run_cluster_ilp(
                cluster_id=cluster_id,
                cluster_programs=cluster_programs,
                scales=scales,
                best_k=best_k,
                timeout=ilp_timeout,
                k_output=k_output
            )

            if ilp_result is None:
                print(f"✗ ILP failed for cluster {cluster_id}, skipping")
                continue

            # Step 2: Generate assembly variants
            print(f"\nStep 2: Generating assembly variants for cluster {cluster_id}...")
            variants = self._generate_cluster_variants(
                cluster_id=cluster_id,
                cluster_programs=cluster_programs,
                ilp_result=ilp_result,
                k_output=k_output
            )

            if not variants:
                print(f"✗ Variant generation failed for cluster {cluster_id}, skipping")
                continue

            # Step 3: Synthesize and measure all variants
            print(f"\nStep 3: Synthesizing variants (parallel={synth_jobs})...")
            synthesis_results = self._synthesize_variants(
                cluster_id=cluster_id,
                cluster_programs=cluster_programs,
                variants=variants,
                k_output=k_output,
                num_processes=synth_jobs
            )

            # Step 4: Select best ASIP
            print(f"\nStep 4: Selecting best ASIP based on geomean(area×latency)...")
            best_asip = self._select_best_asip(
                cluster_programs=cluster_programs,
                synthesis_results=synthesis_results
            )

            cluster_results[cluster_id] = {
                'programs': cluster_programs,
                'ilp_result': ilp_result,
                'synthesis_results': synthesis_results,
                'best_asip': best_asip
            }

            if best_asip:
                print(f"\n✓ Cluster {cluster_id} complete:")
                print(f"  Best variant: {best_asip['variant_id']}")
                print(f"  Geomean(area×latency): {best_asip['geomean']:.2f}")
                if 'num_instructions' in best_asip:
                    print(f"  ISA size: {best_asip['num_instructions']} instructions")
            else:
                print(f"\n⚠ Cluster {cluster_id} completed with warnings:")
                print(f"  No valid ASIP could be selected (synthesis may have failed)")

        # Save K-level results
        k_results_file = k_output / "asip_results.json"
        with open(k_results_file, 'w') as f:
            json.dump(cluster_results, f, indent=2)

        print(f"\n✓ K={k} results saved to: {k_results_file}")

        return cluster_results

    def _run_cluster_ilp(
        self,
        cluster_id: int,
        cluster_programs: List[str],
        scales: List[float],
        best_k: int,
        timeout: int,
        k_output: Path
    ) -> Dict:
        """Run ILP optimization for a cluster."""
        try:
            solver = ClusterILPSolver(
                cluster_programs,
                base_dir=str(self.base_dir),
                program_roots_cache=self.program_roots
            )
            cluster_output = k_output / f"cluster_{cluster_id}"

            result = solver.solve_with_multiple_scales(
                scales=scales,
                best_k=best_k,
                timeout=timeout,
                output_dir=str(cluster_output)
            )

            return result

        except Exception as e:
            print(f"Error in ILP optimization: {e}")
            import traceback
            traceback.print_exc()
            return None

    def _generate_cluster_variants(
        self,
        cluster_id: int,
        cluster_programs: List[str],
        ilp_result: Dict,
        k_output: Path
    ) -> List[Dict]:
        """
        Generate assembly variants for a cluster's ASIP.

        For each ILP solution, reconstructs assembly for ALL programs in the cluster.
        """
        variants = []
        variant_idx = 0

        # Iterate through all scales and their solutions
        for scale_name, scale_data in ilp_result.get('scale_results', {}).items():
            if not scale_data.get('success'):
                print(f"  Skipping {scale_name} (failed)")
                continue

            print(f"\n  Processing {scale_name} ({len(scale_data.get('solutions', []))} solutions)...")

            for solution in scale_data.get('solutions', []):
                instruction_set = solution['instruction_set']
                result_file = solution['result_file']
                solution_file = solution['solution_file']

                print(f"\n  Variant {variant_idx}:")
                print(f"    Scale: {solution['scale']}")
                print(f"    ISA size: {len(instruction_set)} instructions")
                print(f"    Instructions: {', '.join(instruction_set[:10])}{'...' if len(instruction_set) > 10 else ''}")
                print(f"    Solution file: {solution_file}")

                # Load full result data with choices
                with open(result_file, 'r') as f:
                    full_result = json.load(f)

                choices = full_result.get('choices', {})
                print(f"    ILP choices: {len(choices)} eclasses selected")

                # Generate assembly for each program using this ISA/solution
                variant_data = {
                    'variant_id': variant_idx,
                    'scale': solution['scale'],
                    'scale_variant_id': solution['scale_variant_id'],
                    'instruction_set': instruction_set,
                    'programs': {}
                }

                for prog_name in cluster_programs:
                    # Reconstruct assembly for this program
                    print(f"    Reconstructing {prog_name}...")
                    asm_path = self._reconstruct_program(
                        program_name=prog_name,
                        solution_file=solution_file,
                        variant_id=variant_idx,
                        cluster_id=cluster_id,
                        k_output=k_output
                    )

                    if asm_path:
                        variant_data['programs'][prog_name] = {
                            'assembly_path': asm_path
                        }
                        print(f"      ✓ Success: {asm_path}")
                    else:
                        print(f"      ✗ Failed")

                variants.append(variant_data)
                variant_idx += 1

        print(f"  Generated {len(variants)} variants for cluster {cluster_id}")
        return variants

    def _reconstruct_program(
        self,
        program_name: str,
        solution_file: str,
        variant_id: int,
        cluster_id: int,
        k_output: Path
    ) -> str:
        """
        Reconstruct assembly for a single program using ILP solution.

        Simple approach: Use standard paths, then copy final output.
        """
        try:
            import shutil
            project_root = Path(__file__).parent

            # Final output location
            variant_dir = k_output / f"cluster_{cluster_id}" / "variants" / f"variant_{variant_id}"
            variant_dir.mkdir(parents=True, exist_ok=True)

            # Step 1: Call restructure.py with unique output directory per variant
            blocks_dir = variant_dir / program_name / "blocks"
            blocks_dir.mkdir(parents=True, exist_ok=True)

            print(f"      [1/4] Running restructure.py...")
            print(f"        Solution: {Path(solution_file).name}")
            print(f"        Output blocks: {blocks_dir}")

            cmd1 = [
                "python3",
                str(project_root / "frontend" / "restructure.py"),
                program_name,
                "--solution", solution_file,
                "--output", str(blocks_dir),
                "--single-variant"
            ]

            result1 = subprocess.run(cmd1, capture_output=True, text=True, timeout=300)
            if result1.returncode != 0:
                print(f"        ✗ restructure.py failed:")
                print(f"        {result1.stderr[:300]}")
                return None

            # Check if blocks were created
            block_files = list(blocks_dir.glob("*.txt"))
            print(f"        ✓ Created {len(block_files)} block files")

            # Step 2: Create symlink and copy required metadata files
            # reconstruct_rewritten_asm.py expects: <output_dir>/<program_name>/basic_blocks_rewrite
            print(f"      [2/4] Setting up reconstruction environment...")
            program_dir = variant_dir / program_name
            program_dir.mkdir(parents=True, exist_ok=True)

            # Create symlink: variant_dir/program_name/basic_blocks_rewrite -> blocks_dir
            rewrite_symlink = program_dir / "basic_blocks_rewrite"
            if rewrite_symlink.exists() or rewrite_symlink.is_symlink():
                if rewrite_symlink.is_symlink():
                    rewrite_symlink.unlink()
                else:
                    shutil.rmtree(str(rewrite_symlink))

            rewrite_symlink.symlink_to(blocks_dir.resolve())
            print(f"        Symlink: {rewrite_symlink} -> {blocks_dir}")

            # Copy metadata files from original frontend output
            original_frontend = project_root / "output" / "frontend" / program_name
            for metadata_file in ["label_metadata.json", "label_to_block.json"]:
                src_metadata = original_frontend / metadata_file
                if src_metadata.exists():
                    dst_metadata = program_dir / metadata_file
                    shutil.copy2(str(src_metadata), str(dst_metadata))
                    print(f"        Copied: {metadata_file}")
                else:
                    print(f"        Warning: {metadata_file} not found in original frontend")

            # Step 3: Find clean.s and call reconstruct_rewritten_asm.py
            # Tell it to use our isolated frontend directory
            print(f"      [3/4] Running reconstruct_rewritten_asm.py...")
            clean_file = list(project_root.glob(f"benchmark/**/{program_name}_clean.s"))
            if not clean_file:
                print(f"        ✗ clean.s not found for {program_name}")
                return None

            print(f"        Clean file: {clean_file[0]}")
            print(f"        Output dir: {variant_dir}")

            # Output to variant directory (not program subdirectory)
            # reconstruct_rewritten_asm.py will look for <output_dir>/<program_name>/basic_blocks_rewrite
            cmd2 = [
                "python3",
                str(project_root / "frontend" / "reconstruct_rewritten_asm.py"),
                str(clean_file[0]),
                "-o", str(variant_dir)  # Points to variant_dir/ (parent of program_name/)
            ]

            result2 = subprocess.run(cmd2, capture_output=True, text=True, timeout=300)
            if result2.returncode != 0:
                print(f"        ✗ reconstruct_rewritten_asm.py failed:")
                print(f"        {result2.stderr[:300]}")
                return None

            print(f"        ✓ reconstruct_rewritten_asm.py completed")

            # Step 4: Find the generated .s file
            print(f"      [4/4] Locating generated .s file...")

            # Check in benchmark/ (standard location)
            rewrite_file = list(project_root.glob(f"benchmark/**/{program_name}_rewrite.s"))
            if rewrite_file:
                print(f"        Found in benchmark/: {rewrite_file[0]}")
                asm_output = variant_dir / f"{program_name}_rewrite_variant_{variant_id}.s"
                shutil.move(str(rewrite_file[0]), str(asm_output))
                print(f"        Moved to: {asm_output}")
                return str(asm_output)

            # Also check in variant directory
            variant_rewrite = list(variant_dir.rglob(f"{program_name}_rewrite.s"))
            if variant_rewrite:
                print(f"        Found in variant dir: {variant_rewrite[0]}")
                asm_output = variant_dir / f"{program_name}_rewrite_variant_{variant_id}.s"
                shutil.move(str(variant_rewrite[0]), str(asm_output))
                print(f"        Moved to: {asm_output}")
                return str(asm_output)

            print(f"        ✗ No .s file found in:")
            print(f"          - benchmark/**/{program_name}_rewrite.s")
            print(f"          - {variant_dir}/**/{program_name}_rewrite.s")
            return None

        except Exception as e:
            print(f"      Error: {e}")
            return None

    def _generate_basic_blocks_ssa(self, asm_file: str, variant_dir: Path) -> bool:
        """
        Generate basic_blocks and basic_blocks_ssa from a reconstructed .s file.

        This is needed for latency calculation in synthesis.

        Args:
            asm_file: Path to .s assembly file
            variant_dir: Directory to output basic_blocks

        Returns:
            True if successful
        """
        try:
            project_root = Path(__file__).parent

            # Step 1: Extract basic blocks
            cmd1 = [
                "python3",
                str(project_root / "frontend" / "analyze_asm_blocks.py"),
                asm_file,
                "-o", str(variant_dir)
            ]

            result1 = subprocess.run(cmd1, capture_output=True, text=True, timeout=300)
            if result1.returncode != 0:
                print(f"        analyze_asm_blocks.py failed: {result1.stderr[:200]}")
                return False

            # Step 2: Convert to SSA
            cmd2 = [
                "python3",
                str(project_root / "frontend" / "convert_to_ssa.py"),
                str(variant_dir)
            ]

            result2 = subprocess.run(cmd2, capture_output=True, text=True, timeout=300)
            if result2.returncode != 0:
                print(f"        convert_to_ssa.py failed: {result2.stderr[:200]}")
                return False

            # Check if SSA was created
            if (variant_dir / "basic_blocks_ssa").exists():
                return True
            else:
                return False

        except Exception as e:
            print(f"        Error generating basic blocks: {e}")
            return False

    def _synthesize_variants(
        self,
        cluster_id: int,
        cluster_programs: List[str],
        variants: List[Dict],
        k_output: Path,
        num_processes: int
    ) -> Dict:
        """
        Synthesize all variants and measure area/latency.

        Returns:
            {variant_id: {program_name: {area, latency, area_latency}}}
        """
        print(f"  Synthesizing {len(variants)} variants × {len(cluster_programs)} programs...")
        print(f"  Total synthesis jobs: {len(variants) * len(cluster_programs)}")

        # Build list of synthesis jobs
        jobs = []
        for variant_data in variants:
            variant_id = variant_data['variant_id']
            for prog_name, prog_data in variant_data['programs'].items():
                if 'assembly_path' in prog_data:
                    jobs.append((
                        variant_id,
                        prog_name,
                        prog_data['assembly_path'],
                        variant_data['instruction_set']
                    ))

        if not jobs:
            print(f"  ✗ No synthesis jobs created (reconstruction failed for all variants)")
            return {}

        print(f"  Actual synthesis jobs created: {len(jobs)}")

        # Run synthesis in parallel
        synthesis_func = partial(
            self._synthesize_single,
            k_output=k_output,
            cluster_id=cluster_id
        )

        with Pool(processes=num_processes) as pool:
            results = pool.map(synthesis_func, jobs)

        # Organize results
        organized = {}
        for result in results:
            if result:
                variant_id, prog_name, area, latency = result
                if variant_id not in organized:
                    organized[variant_id] = {}
                organized[variant_id][prog_name] = {
                    'area': area,
                    'latency': latency,
                    'area_latency': area * latency
                }

        print(f"  ✓ Synthesis complete: {len([r for r in results if r])}/{len(jobs)} successful")

        return organized

    def _synthesize_single(
        self,
        job: Tuple,
        k_output: Path,
        cluster_id: int
    ) -> Tuple:
        """Synthesize a single variant for a single program."""
        variant_id, prog_name, asm_path, instruction_set = job

        try:
            # variant_dir should be the directory we want to write basic_blocks to
            # asm_path is like: .../variant_0/patricia_O3_rewrite_variant_0.s
            # We want basic_blocks in: .../variant_0/ (not .../variant_0/patricia_O3/)
            asm_file = Path(asm_path)
            variant_dir = asm_file.parent  # This is the variant_X directory

            prog = ds.text_program(f"{prog_name}_cluster{cluster_id}_v{variant_id}")

            # Try to load from basic_blocks_ssa if available
            if (variant_dir / "basic_blocks_ssa").exists():
                prog.from_directory(str(variant_dir), suffix="_ssa")
            elif (variant_dir / "basic_blocks").exists():
                prog.from_directory(str(variant_dir), suffix="")
            else:
                # Generate basic blocks from .s file
                print(f"    Generating basic blocks for {prog_name} variant {variant_id}...")
                if not self._generate_basic_blocks_ssa(str(asm_file), variant_dir):
                    print(f"    Warning: Failed to generate basic blocks for {prog_name} variant {variant_id}")
                    return None

                # Try loading again
                if (variant_dir / "basic_blocks_ssa").exists():
                    prog.from_directory(str(variant_dir), suffix="_ssa")
                else:
                    print(f"    Warning: No basic blocks_ssa after generation for {prog_name} variant {variant_id}")
                    return None

            # Calculate latency
            latency = lp.parse_latency(prog)

            # Generate DSL for synthesis
            dsl_dir = k_output / f"cluster_{cluster_id}" / "dsl_files"
            dsl_dir.mkdir(parents=True, exist_ok=True)
            dsl_file = dsl_dir / f"variant_{variant_id}_{prog_name}.dsl"

            # Calculate area (runs synthesis)
            area = ap.parse_area(set(instruction_set), str(dsl_file))

            return (variant_id, prog_name, area, latency)

        except Exception as e:
            print(f"    Error synthesizing {prog_name} variant {variant_id}: {e}")
            return None

    def _select_best_asip(
        self,
        cluster_programs: List[str],
        synthesis_results: Dict
    ) -> Dict:
        """
        Select best ASIP variant based on geometric mean of area×latency.

        Args:
            cluster_programs: Programs in this cluster
            synthesis_results: {variant_id: {prog: {area, latency, area_latency}}}

        Returns:
            Best ASIP info with geomean score
        """
        variant_scores = {}

        for variant_id, prog_results in synthesis_results.items():
            # Calculate area×latency for each program
            products = []
            for prog_name in cluster_programs:
                if prog_name in prog_results:
                    products.append(prog_results[prog_name]['area_latency'])

            # Geometric mean
            if products and len(products) == len(cluster_programs):
                geomean = np.exp(np.mean(np.log(products)))
                variant_scores[variant_id] = {
                    'geomean': geomean,
                    'products': products,
                    'coverage': len(products)
                }

        if not variant_scores:
            return None

        # Select minimum geomean
        best_variant_id = min(variant_scores, key=lambda v: variant_scores[v]['geomean'])
        best_data = variant_scores[best_variant_id]

        # Get instruction set for best variant
        best_instruction_set = None
        for variant in synthesis_results.keys():
            if variant == best_variant_id:
                # Need to get instruction set from somewhere
                # For now, extract from synthesis results
                break

        return {
            'variant_id': best_variant_id,
            'geomean': best_data['geomean'],
            'products': best_data['products'],
            'coverage': best_data['coverage'],
            'programs': cluster_programs
        }

    def compute_overall_performance(self, k_results: Dict) -> Dict:
        """
        Compute overall performance metric for each K.

        Args:
            k_results: {k: {cluster_id: {..., best_asip: {...}}}}

        Returns:
            {k: geomean_across_all_programs}
        """
        k_performance = {}

        for k, clusters in k_results.items():
            all_program_scores = []

            # For each cluster, get best ASIP's performance on its programs
            for cluster_id, cluster_data in clusters.items():
                best_asip = cluster_data.get('best_asip')
                if not best_asip:
                    continue

                # Add area×latency products for all programs in this cluster
                all_program_scores.extend(best_asip['products'])

            # Overall geometric mean
            if all_program_scores:
                overall_geomean = np.exp(np.mean(np.log(all_program_scores)))
                k_performance[k] = overall_geomean
            else:
                k_performance[k] = None

        return k_performance

    def plot_k_vs_performance(
        self,
        k_performance: Dict,
        output_path: str = None
    ):
        """
        Plot K vs geometric mean of area×latency.

        Args:
            k_performance: {k: geomean}
            output_path: Output image path
        """
        if output_path is None:
            output_path = self.output_dir / "k_vs_performance.png"

        # Filter out None values
        valid_k_perf = {k: v for k, v in k_performance.items() if v is not None}

        if not valid_k_perf:
            print("No valid performance data to plot")
            return

        k_values = sorted(valid_k_perf.keys())
        geomeans = [valid_k_perf[k] for k in k_values]

        # Create plot
        plt.figure(figsize=(10, 6))

        plt.plot(k_values, geomeans, 'o-', linewidth=2, markersize=10, color='blue')

        # Annotate optimal K
        optimal_k = k_values[np.argmin(geomeans)]
        optimal_score = valid_k_perf[optimal_k]

        plt.scatter([optimal_k], [optimal_score], color='red', s=300, marker='*',
                   edgecolors='black', linewidths=2, zorder=10, label='Optimal K')

        plt.annotate(
            f'Optimal K={optimal_k}\nScore={optimal_score:.2e}',
            xy=(optimal_k, optimal_score),
            xytext=(15, 15), textcoords='offset points',
            fontsize=11, color='red', fontweight='bold',
            arrowprops=dict(arrowstyle='->', color='red', lw=1.5),
            bbox=dict(boxstyle='round,pad=0.5', facecolor='yellow', alpha=0.7)
        )

        plt.xlabel('Number of Clusters (K)', fontsize=12)
        plt.ylabel('Geomean(Area × Latency) [µm²·cycles]', fontsize=12)
        plt.title('Application-Specific ISA Performance vs. Specialization Level', fontsize=14)
        plt.grid(True, alpha=0.3)
        plt.legend()
        plt.xticks(k_values)

        plt.tight_layout()
        plt.savefig(output_path, dpi=150, bbox_inches='tight')
        plt.close()

        print(f"\n✓ Performance plot saved to: {output_path}")

        # Also create a summary table
        table_path = Path(str(output_path).replace('.png', '_table.txt'))
        with open(table_path, 'w') as f:
            f.write("K vs Performance Summary\n")
            f.write("="*60 + "\n")
            f.write(f"{'K':>5s} {'Geomean(Area×Latency)':>25s} {'Improvement vs K=1':>20s}\n")
            f.write("-"*60 + "\n")

            baseline = valid_k_perf[min(k_values)]
            for k in k_values:
                geomean = valid_k_perf[k]
                improvement = (1 - geomean / baseline) * 100
                f.write(f"{k:>5d} {geomean:>25.2e} {improvement:>19.1f}%\n")

        print(f"  Performance table saved to: {table_path}")

    def run(
        self,
        k_values: List[int],
        scales: List[float],
        best_k: int,
        ilp_timeout: int,
        synth_jobs: int
    ) -> Dict:
        """
        Run complete ASIP building pipeline for multiple K values.

        Returns:
            {k: cluster_results}
        """
        all_k_results = {}

        for k in k_values:
            print(f"\n\n{'#'*80}")
            print(f"# Processing K={k}")
            print(f"{'#'*80}\n")

            k_results = self.build_asips_for_k(
                k=k,
                scales=scales,
                best_k=best_k,
                ilp_timeout=ilp_timeout,
                synth_jobs=synth_jobs
            )

            if k_results:
                all_k_results[k] = k_results

        # Compute overall performance
        print(f"\n\n{'='*80}")
        print("Computing overall performance metrics...")
        print("="*80)
        k_performance = self.compute_overall_performance(all_k_results)

        for k, score in sorted(k_performance.items()):
            if score:
                print(f"  K={k}: Geomean(area×latency) = {score:.2e}")

        # Plot results
        self.plot_k_vs_performance(k_performance)

        # Save final summary
        summary = {
            'k_values': k_values,
            'k_performance': {k: float(v) if v else None for k, v in k_performance.items()},
            'k_results': all_k_results
        }

        summary_file = self.output_dir / "asip_summary.json"
        with open(summary_file, 'w') as f:
            json.dump(summary, f, indent=2)

        print(f"\n✓ Final summary saved to: {summary_file}")

        return summary


def main():
    parser = argparse.ArgumentParser(
        description="Build application-specific ISA processors for program clusters"
    )
    parser.add_argument(
        '--clustering',
        required=True,
        help="Path to multi_k_clustering.json from analyze_program_similarity.py"
    )
    parser.add_argument(
        '--k-values',
        nargs='+',
        type=int,
        default=[1, 2, 3, 6],
        help="K values to build ASIPs for (default: 1 2 3 6)"
    )
    parser.add_argument(
        '--scales',
        type=str,
        default="0 0.1 0.5 1 10 100",
        help="ILP scaling factors (default: '0 0.1 0.5 1 10 100')"
    )
    parser.add_argument(
        '--best-k',
        type=int,
        default=3,
        help="Variants per scaling factor (default: 3)"
    )
    parser.add_argument(
        '--ilp-timeout',
        type=int,
        default=900,
        help="ILP solver timeout in seconds (default: 900)"
    )
    parser.add_argument(
        '--synth-jobs',
        type=int,
        default=72,
        help="Parallel synthesis processes (default: 72)"
    )
    parser.add_argument(
        '--base-dir',
        default="output/frontend",
        help="Base directory with frontend outputs (default: output/frontend)"
    )
    parser.add_argument(
        '--output-dir',
        default="output/cluster_asips",
        help="Output directory (default: output/cluster_asips)"
    )

    args = parser.parse_args()

    # Parse scales
    scales = [float(s) for s in args.scales.split()]

    print(f"Configuration:")
    print(f"  Clustering file: {args.clustering}")
    print(f"  K values: {args.k_values}")
    print(f"  ILP scales: {scales}")
    print(f"  Variants per scale: {args.best_k}")
    print(f"  ILP timeout: {args.ilp_timeout}s")
    print(f"  Synthesis jobs: {args.synth_jobs}")
    print()

    # Build ASIPs
    builder = ClusterASIPBuilder(
        clustering_file=args.clustering,
        base_dir=args.base_dir,
        output_dir=args.output_dir
    )

    results = builder.run(
        k_values=args.k_values,
        scales=scales,
        best_k=args.best_k,
        ilp_timeout=args.ilp_timeout,
        synth_jobs=args.synth_jobs
    )

    print(f"\n\n{'='*80}")
    print("✓ ASIP Building Complete!")
    print(f"{'='*80}")
    print(f"Results directory: {args.output_dir}")
    print(f"  - k_vs_performance.png")
    print(f"  - asip_summary.json")
    print(f"  - k*/cluster_*/")
    print("="*80)

    return 0


if __name__ == "__main__":
    sys.exit(main())
