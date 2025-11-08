#!/usr/bin/env python3
"""
Analyze all variants in parallel using multiprocessing.
This script parallelizes the synthesis step for maximum performance.

Usage:
    python analyze_all_variants.py <variants_dir> <program_name> <output_dir> [num_processes]
"""

import sys
import json
import time
from pathlib import Path
from multiprocessing import Pool
from functools import partial

# Add paths for imports
sys.path.insert(0, str(Path(__file__).parent))

import Saturation.data_structure as ds
import backend.area_parser as ap
import backend.latency_parser as lp
import matplotlib.pyplot as plt


def analyze_single_variant(variant_id, variants_dir, program_name, dsl_dir):
    """
    Analyze a single variant (to be called in parallel).

    Args:
        variant_id: ID of the variant to analyze (int or "original")
        variants_dir: Path to variants directory
        program_name: Name of the program
        dsl_dir: Directory to save DSL files

    Returns:
        Tuple of (variant_id, subset, area, latency, num_blocks) or None on error
    """
    try:
        variant_path = Path(variants_dir) / f"variant_{variant_id}"

        if not variant_path.exists():
            print(f"Variant {variant_id}: Directory not found", file=sys.stderr)
            return None

        # Create text_program instance
        # Use consistent naming for original variant
        if variant_id == "original":
            prog = ds.text_program(f"{program_name}_original")
        else:
            prog = ds.text_program(f"{program_name}_variant_{variant_id}")

        # Load from basic_blocks_ssa if available, otherwise basic_blocks
        if (variant_path / "basic_blocks_ssa").exists():
            prog.from_directory(str(variant_path), suffix="_ssa")
        elif (variant_path / "basic_blocks").exists():
            prog.from_directory(str(variant_path), suffix="")
        else:
            print(f"Variant {variant_id}: No basic blocks found", file=sys.stderr)
            return None

        # Calculate instruction subset
        subset = set()
        for block in prog.basic_blocks:
            for instr in block.inst_list:
                subset.add(instr.op_name)

        # Generate DSL file path
        dsl_file_path = str(Path(dsl_dir) / f"variant_{variant_id}.dsl")

        # Calculate area (this runs synthesis - the slow part)
        # area_parser.py will create the output directory automatically
        print(f"Variant {variant_id}: Starting synthesis with {len(subset)} instructions...")
        start_time = time.time()
        area = ap.parse_area(subset, dsl_file_path)
        synthesis_time = time.time() - start_time

        # Calculate latency
        latency = lp.parse_latency(prog)

        print(f"Variant {variant_id}: ✓ Complete in {synthesis_time:.1f}s - "
              f"Area={area:.2f} µm², Latency={latency}, Instructions={len(subset)}")

        return (variant_id, subset, area, latency, len(prog.basic_blocks))

    except Exception as e:
        print(f"Variant {variant_id}: ✗ Error - {e}", file=sys.stderr)
        import traceback
        traceback.print_exc(file=sys.stderr)
        return None


def main():
    if len(sys.argv) < 4:
        print("Usage: python analyze_all_variants.py <variants_dir> <program_name> <output_dir> [num_processes]")
        print("Example: python analyze_all_variants.py output/backend/dijkstra_small_O3/variants dijkstra_small_O3 output/backend/dijkstra_small_O3 72")
        sys.exit(1)

    variants_dir = sys.argv[1]
    program_name = sys.argv[2]
    output_dir = sys.argv[3]
    num_processes = int(sys.argv[4]) if len(sys.argv) > 4 else 72  # Default to 72

    variants_path = Path(variants_dir)
    output_path = Path(output_dir)

    if not variants_path.exists():
        print(f"Error: Variants directory not found: {variants_path}")
        sys.exit(1)

    # Create DSL directory
    dsl_dir = output_path / "dsl_files"
    dsl_dir.mkdir(parents=True, exist_ok=True)

    print("=" * 80)
    print(f"Parallel Variant Analysis")
    print("=" * 80)
    print(f"Variants directory: {variants_path}")
    print(f"Program name: {program_name}")
    print(f"Output directory: {output_path}")
    print(f"Parallel processes: {num_processes}")
    print(f"DSL files: {dsl_dir}")
    print("=" * 80)
    print()

    try:
        # Find all variant directories
        variant_dirs = [d for d in variants_path.iterdir() if d.is_dir() and d.name.startswith("variant_")]

        # Separate original variant from numbered variants
        original_variant = None
        numbered_variants = []
        for d in variant_dirs:
            if d.name == "variant_original":
                original_variant = d
            else:
                numbered_variants.append(d)

        numbered_variants = sorted(numbered_variants)
        num_variants = len(numbered_variants)

        # Create list of variant IDs to process
        variant_ids = list(range(num_variants))
        if original_variant:
            variant_ids.append("original")
            print(f"Found {num_variants} optimized variants + 1 original program")
        else:
            print(f"Found {num_variants} variants")

        print(f"Starting parallel synthesis with {num_processes} processes...")
        print()

        # Create partial function with fixed arguments
        analyze_func = partial(analyze_single_variant,
                              variants_dir=str(variants_path),
                              program_name=program_name,
                              dsl_dir=str(dsl_dir))

        # Run analysis in parallel
        overall_start = time.time()
        with Pool(processes=num_processes) as pool:
            results = pool.map(analyze_func, variant_ids)
        overall_time = time.time() - overall_start

        # Filter out None results (failed analyses)
        valid_results = [r for r in results if r is not None]

        print()
        print("=" * 80)
        print(f"Synthesis Complete: {len(valid_results)}/{num_variants} successful")
        print(f"Total time: {overall_time:.1f}s ({overall_time/60:.1f} minutes)")
        if len(valid_results) > 0:
            print(f"Average per variant: {overall_time/len(valid_results):.1f}s")
        print("=" * 80)
        print()

        if len(valid_results) == 0:
            print("Error: No variants analyzed successfully")
            sys.exit(1)

        # Organize results
        subsets = {}
        areas = {}
        latencies = {}
        num_blocks = {}

        for variant_id, subset, area, latency, blocks in valid_results:
            subsets[variant_id] = subset
            areas[variant_id] = area
            latencies[variant_id] = latency
            num_blocks[variant_id] = blocks

        # Show original program stats if available
        if "original" in areas:
            print(f"Original Program Baseline:")
            print(f"  Area = {areas['original']:.2f} µm², Latency = {latencies['original']}, Instructions = {len(subsets['original'])}")
            print()

        # Calculate Pareto frontier
        print("Calculating Pareto frontier...")
        pareto_frontier = []
        for i in subsets.keys():
            dominated = False
            for j in subsets.keys():
                if i != j:
                    if (areas[j] <= areas[i] and latencies[j] < latencies[i]) or \
                       (areas[j] < areas[i] and latencies[j] <= latencies[i]):
                        dominated = True
                        break
            if not dominated:
                pareto_frontier.append((i, areas[i], latencies[i]))

        print(f"Pareto Frontier ({len(pareto_frontier)} optimal variants):")
        for variant_id, area, latency in sorted(pareto_frontier, key=lambda x: x[1]):
            marker = " [ORIGINAL]" if variant_id == "original" else ""
            print(f"  Variant {variant_id}: Area = {area:.2f} µm², Latency = {latency}{marker}")
        print()

        # Generate visualization (matching backend_parser style)
        plot_path = output_path / "pareto_frontier.png"
        print(f"Generating Pareto frontier plot...")

        plt.figure(figsize=(10, 6))

        # Separate original variant from optimized variants
        original_area = None
        original_latency = None
        optimized_areas = []
        optimized_latencies = []

        for variant_id in areas.keys():
            if variant_id == "original":
                original_area = areas[variant_id]
                original_latency = latencies[variant_id]
            else:
                optimized_areas.append(areas[variant_id])
                optimized_latencies.append(latencies[variant_id])

        # Plot optimized variants
        if optimized_areas:
            plt.scatter(optimized_areas, optimized_latencies, color='blue', label='Optimized Variants', alpha=0.6, s=50)

        # Plot original program with distinct marker
        if original_area is not None:
            plt.scatter([original_area], [original_latency], color='green', marker='*',
                       label='Original Program', s=300, edgecolors='black', linewidths=1.5, zorder=10)

        # Highlight Pareto frontier
        pareto_areas = [p[1] for p in pareto_frontier]
        pareto_latencies = [p[2] for p in pareto_frontier]
        plt.scatter(pareto_areas, pareto_latencies, color='red', label='Pareto Frontier', s=100, zorder=5)

        plt.title('Pareto Frontier of Program Variants')
        plt.xlabel('Area (µm²)')
        plt.ylabel('Latency')
        plt.legend()
        plt.grid(True)
        plt.savefig(str(plot_path))
        plt.close()

        print(f"Plot saved to: {plot_path}")
        print()

        # Save detailed results to JSON
        results_file = output_path / "analysis_results.json"
        results_data = {
            "program_name": program_name,
            "num_variants": len(valid_results),
            "num_processes": num_processes,
            "total_synthesis_time": overall_time,
            "variants": []
        }

        for variant_id in sorted(subsets.keys(), key=lambda x: (x != "original", x)):
            results_data["variants"].append({
                "variant_id": variant_id,
                "area": areas[variant_id],
                "latency": latencies[variant_id],
                "instruction_subset": sorted(list(subsets[variant_id])),
                "num_instructions": len(subsets[variant_id]),
                "num_blocks": num_blocks[variant_id],
                "is_pareto_optimal": any(p[0] == variant_id for p in pareto_frontier),
                "is_original": variant_id == "original"
            })

        results_data["pareto_frontier"] = [
            {
                "variant_id": p[0],
                "area": p[1],
                "latency": p[2]
            }
            for p in sorted(pareto_frontier, key=lambda x: x[1])
        ]

        with open(results_file, 'w') as f:
            json.dump(results_data, f, indent=2)

        print(f"Results saved to: {results_file}")
        print()
        print("✓ Analysis complete!")

    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)


if __name__ == "__main__":
    main()
