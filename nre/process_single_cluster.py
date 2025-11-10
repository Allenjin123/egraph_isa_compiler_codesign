#!/usr/bin/env python3
"""
Process Single Cluster
=======================

Main cluster processor with CLI interface. Handles one cluster for one K value:
1. Load cluster configuration
2. Run ILP optimization with multiple scales
3. Generate assembly variants
4. Synthesize variants (Level 3 parallelism - multiprocessing.Pool)
5. Select best ASIP based on geometric mean

This is called by run_k_parallel.sh for Level 2 parallelism (clusters).

Usage:
    python process_single_cluster.py \
        --k 2 \
        --cluster-id 0 \
        --clustering multi_k_clustering.json \
        --roots roots_cache.json \
        --scales "0 0.1 1 10 100" \
        --best-k 3 \
        --ilp-timeout 900 \
        --synth-jobs 18 \
        --output-dir output/cluster_asips
"""

import argparse
import json
import sys
from functools import partial
from multiprocessing import Pool
from pathlib import Path
from typing import Dict, List

# Add project paths
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))
sys.path.insert(0, str(project_root / "Extractor"))

from Extractor.src.ILP.cluster_ilp_solver import ClusterILPSolver
from nre.cluster_utils import reconstruct_program, synthesize_single, select_best_asip


def load_cluster_config(clustering_file: str, k: int, cluster_id: int) -> Dict:
    """Load cluster configuration from clustering JSON."""
    with open(clustering_file, 'r') as f:
        data = json.load(f)

    k_key = f"k{k}"
    if k_key not in data['clusterings']:
        raise ValueError(f"K={k} not found in clustering file")

    cluster_key = f"cluster_{cluster_id}"
    if cluster_key not in data['clusterings'][k_key]['clusters']:
        raise ValueError(f"Cluster {cluster_id} not found for K={k}")

    cluster_info = data['clusterings'][k_key]['clusters'][cluster_key]
    return {
        'programs': cluster_info['programs'],
        'size': cluster_info['size']
    }


def run_cluster_ilp(
    cluster_programs: List[str],
    scales: List[float],
    best_k: int,
    timeout: int,
    roots_cache: Dict,
    output_dir: Path
) -> Dict:
    """Run ILP optimization for cluster."""
    print(f"\n{'='*60}")
    print(f"Running ILP for {len(cluster_programs)} programs")
    print(f"{'='*60}")
    print(f"Programs: {cluster_programs}")
    print(f"Scales: {scales}")
    print(f"Variants per scale: {best_k}")
    print(f"Timeout: {timeout}s")
    print()

    solver = ClusterILPSolver(
        cluster_programs,
        base_dir="output/frontend",
        program_roots_cache=roots_cache
    )

    result = solver.solve_with_multiple_scales(
        scales=scales,
        best_k=best_k,
        timeout=timeout,
        output_dir=str(output_dir)
    )

    return result


def generate_variants(
    cluster_programs: List[str],
    cluster_id: int,
    ilp_result: Dict,
    k_output: Path
) -> List[Dict]:
    """
    Generate assembly variants for each ILP solution.

    Returns:
        List of variant data with assembly paths
    """
    print(f"\n{'='*60}")
    print(f"Generating Assembly Variants")
    print(f"{'='*60}")

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
                asm_path = reconstruct_program(
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

    print(f"\n  Generated {len(variants)} variants for cluster {cluster_id}")
    return variants


def synthesize_variants(
    cluster_id: int,
    cluster_programs: List[str],
    variants: List[Dict],
    k_output: Path,
    num_processes: int
) -> Dict:
    """
    Synthesize all variants and measure area/latency.

    Level 3 parallelism: multiprocessing.Pool for synthesis jobs.

    Returns:
        {variant_id: {program_name: {area, latency, area_latency}}}
    """
    print(f"\n{'='*60}")
    print(f"Synthesizing Variants (Level 3 Parallelism)")
    print(f"{'='*60}")
    print(f"  Variants: {len(variants)}")
    print(f"  Programs per variant: {len(cluster_programs)}")
    print(f"  Total synthesis jobs: {len(variants) * len(cluster_programs)}")
    print(f"  Parallel processes: {num_processes}")
    print()

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

    # Run synthesis in parallel using multiprocessing.Pool
    synthesis_func = partial(
        synthesize_single,
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

    print(f"\n  ✓ Synthesis complete: {len([r for r in results if r])}/{len(jobs)} successful")

    return organized


def main():
    parser = argparse.ArgumentParser(description="Process a single cluster for ASIP building")
    parser.add_argument('--k', type=int, required=True,
                       help="K value (number of clusters)")
    parser.add_argument('--cluster-id', type=int, required=True,
                       help="Cluster ID (0, 1, 2...)")
    parser.add_argument('--clustering', required=True,
                       help="Path to clustering JSON file")
    parser.add_argument('--roots', required=True,
                       help="Path to roots cache JSON file")
    parser.add_argument('--scales', required=True,
                       help="Space-separated scaling factors (e.g., '0 0.1 1 10 100')")
    parser.add_argument('--best-k', type=int, default=3,
                       help="Number of variants per scale (default: 3)")
    parser.add_argument('--ilp-timeout', type=int, default=900,
                       help="ILP solver timeout in seconds (default: 900)")
    parser.add_argument('--synth-jobs', type=int, default=18,
                       help="Number of parallel synthesis processes (default: 18)")
    parser.add_argument('--output-dir', default='output/cluster_asips',
                       help="Output directory base (default: output/cluster_asips)")

    args = parser.parse_args()

    # Parse scales
    scales = [float(s) for s in args.scales.split()]

    # Setup paths
    output_base = Path(args.output_dir)
    k_output = output_base / f"k{args.k}"
    cluster_output = k_output / f"cluster_{args.cluster_id}"
    cluster_output.mkdir(parents=True, exist_ok=True)

    print("="*80)
    print(f"Processing Cluster {args.cluster_id} for K={args.k}")
    print("="*80)
    print(f"Output directory: {cluster_output}")
    print(f"Scales: {scales}")
    print(f"Variants per scale: {args.best_k}")
    print(f"Total expected variants: {len(scales) * args.best_k}")
    print("="*80)
    print()

    # Load cluster configuration
    cluster_config = load_cluster_config(args.clustering, args.k, args.cluster_id)
    cluster_programs = cluster_config['programs']

    print(f"Cluster programs ({len(cluster_programs)}):")
    for prog in cluster_programs:
        print(f"  - {prog}")
    print()

    # Load roots cache
    with open(args.roots, 'r') as f:
        roots_cache = json.load(f)

    print(f"Loaded roots cache for {len(roots_cache)} programs")
    print()

    # Step 1: Run ILP optimization
    ilp_result = run_cluster_ilp(
        cluster_programs=cluster_programs,
        scales=scales,
        best_k=args.best_k,
        timeout=args.ilp_timeout,
        roots_cache=roots_cache,
        output_dir=cluster_output
    )

    # Step 2: Generate assembly variants
    variants = generate_variants(
        cluster_programs=cluster_programs,
        cluster_id=args.cluster_id,
        ilp_result=ilp_result,
        k_output=k_output
    )

    # Step 3: Synthesize variants (Level 3 parallelism)
    synthesis_results = synthesize_variants(
        cluster_id=args.cluster_id,
        cluster_programs=cluster_programs,
        variants=variants,
        k_output=k_output,
        num_processes=args.synth_jobs
    )

    # Step 4: Select best ASIP
    print(f"\n{'='*60}")
    print(f"Selecting Best ASIP")
    print(f"{'='*60}")

    best_asip = select_best_asip(
        cluster_programs=cluster_programs,
        variants=variants,
        synthesis_results=synthesis_results
    )

    if best_asip:
        print(f"\n✓ Best ASIP for Cluster {args.cluster_id}:")
        print(f"  Variant ID: {best_asip['variant_id']}")
        print(f"  Geomean(area×latency): {best_asip['geomean']:.2f}")
        print(f"  ISA size: {best_asip['num_instructions']} instructions")
        print(f"  Coverage: {best_asip['coverage']}/{len(cluster_programs)} programs")
    else:
        print(f"\n⚠ No valid ASIP could be selected (synthesis may have failed)")

    # Step 5: Save results
    results_file = cluster_output / "cluster_results.json"
    results_data = {
        'k': args.k,
        'cluster_id': args.cluster_id,
        'programs': cluster_programs,
        'ilp_result': ilp_result,
        'variants': variants,
        'synthesis_results': synthesis_results,
        'best_asip': best_asip
    }

    with open(results_file, 'w') as f:
        json.dump(results_data, f, indent=2)

    print(f"\n✓ Cluster results saved to: {results_file}")
    print()
    print("="*80)
    print(f"✓ Cluster {args.cluster_id} Complete")
    print("="*80)

    return 0


if __name__ == "__main__":
    sys.exit(main())
