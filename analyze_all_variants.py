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
from typing import Union, List

# Add paths for imports
sys.path.insert(0, str(Path(__file__).parent))

import Saturation.data_structure as ds
import backend.area_parser as ap
import backend.latency_parser as lp
import matplotlib.pyplot as plt
from collections import defaultdict


def analyze_single_variant(variant_id, variants_dir, program_name, dsl_dir, enable_freq_analysis=False, core_name="ibex", enable_shift_constraints=False, enable_cache_latencies=False):
    """
    Analyze a single variant (to be called in parallel).

    Args:
        variant_id: ID of the variant to analyze (int or "original")
        variants_dir: Path to variants directory
        program_name: Name of the program
        dsl_dir: Directory to save DSL files
        enable_freq_analysis: If True, parse frequency and calculate latency in seconds
        core_name: Name of the core to synthesize (default: "ibex")
        enable_shift_constraints: If True, apply shift immediate constraints in DSL
        enable_cache_latencies: If True, add cache latency parameters to uarchaware DSL

    Returns:
        List of tuples, where each tuple is:
        (variant_id, constraint_type, subset, area, latency, frequency, num_blocks)
        - Regular variants with shift constraints: returns 2 tuples (baseline + uarchaware)
        - Other variants: returns 1 tuple
        Returns None on error
    """
    try:
        variant_path = Path(variants_dir) / f"variant_{variant_id}"

        if not variant_path.exists():
            print(f"Variant {variant_id}: Directory not found", file=sys.stderr)
            return None

        # Create text_program instance
        # Use consistent naming for original and gp variants
        if variant_id == "original":
            prog = ds.text_program(f"{program_name}_original")
        elif variant_id == "gp":
            prog = ds.text_program(f"{program_name}_gp")
        else:
            prog = ds.text_program(f"{program_name}_variant_{variant_id}")

        # Load from basic_blocks_ssa if available, otherwise basic_blocks
        # Pass base program_name to ensure execution counts are found
        if (variant_path / "basic_blocks_ssa").exists():
            prog.from_directory(str(variant_path), suffix="_ssa", base_program_name=program_name)
        elif (variant_path / "basic_blocks").exists():
            prog.from_directory(str(variant_path), suffix="", base_program_name=program_name)
        else:
            print(f"Variant {variant_id}: No basic blocks found", file=sys.stderr)
            return None

        # Calculate instruction subset and analyze shift immediates in single pass
        subset = set()
        shift_imm_dict = defaultdict(set)
        SHIFT_INSTRUCTIONS = {'slli', 'srli', 'srai'}

        for block in prog.basic_blocks:
            for instr in block.inst_list:
                # Add to instruction subset
                subset.add(instr.op_name)

                # Check if this is a shift instruction with immediate
                if instr.op_name in SHIFT_INSTRUCTIONS and instr.imm is not None:
                    # Use parse_immediate from text_inst class
                    if isinstance(instr.imm, str):
                        parsed_value = ds.text_inst.parse_immediate(instr.imm)
                    else:
                        parsed_value = instr.imm

                    # Add the parsed value to the set
                    # If it's None, skip it
                    if parsed_value is not None:
                        shift_imm_dict[instr.op_name].add(parsed_value)

        # Convert defaultdict to regular dict for cleaner output
        shift_imm_dict = dict(shift_imm_dict)

        # Determine if this variant should have dual runs (baseline + uarchaware)
        is_special_variant = variant_id in ["original", "gp"]
        should_run_dual = enable_shift_constraints and not is_special_variant

        results = []

        # Special handling for variant_gp
        if variant_id == "gp":
            print(f"Variant {variant_id}: Starting synthesis with EMPTY DSL (general purpose processor, full RV32IM)...")
            dsl_file_path = str(Path(dsl_dir) / f"{program_name}_variant_{variant_id}.dsl")
            start_time = time.time()
            area, frequency = ap.parse_area(subset, dsl_file_path, use_empty_dsl=True, enable_freq_analysis=enable_freq_analysis, core_name=core_name)
            synthesis_time = time.time() - start_time
            latency = lp.parse_latency(prog, frequency if enable_freq_analysis else None)

            if enable_freq_analysis and frequency:
                latency_str = f"Latency={latency:.2e}s"
                freq_str = f", Frequency={frequency:.2f} MHz"
            else:
                latency_str = f"Latency={latency} cycles"
                freq_str = ""
            print(f"Variant {variant_id}: ✓ Complete in {synthesis_time:.1f}s - "
                  f"Area={area:.2f} µm², {latency_str}{freq_str}, Instructions={len(subset)}")

            results.append((variant_id, "gp", subset, area, latency, frequency, len(prog.basic_blocks)))

        # Special handling for variant_original
        elif variant_id == "original":
            print(f"Variant {variant_id}: Starting synthesis...")
            dsl_file_path = str(Path(dsl_dir) / f"{program_name}_variant_{variant_id}.dsl")
            start_time = time.time()
            area, frequency = ap.parse_area(subset, dsl_file_path, enable_freq_analysis=enable_freq_analysis, core_name=core_name)
            synthesis_time = time.time() - start_time
            latency = lp.parse_latency(prog, frequency if enable_freq_analysis else None)

            if enable_freq_analysis and frequency:
                latency_str = f"Latency={latency:.2e}s"
                freq_str = f", Frequency={frequency:.2f} MHz"
            else:
                latency_str = f"Latency={latency} cycles"
                freq_str = ""
            print(f"Variant {variant_id}: ✓ Complete in {synthesis_time:.1f}s - "
                  f"Area={area:.2f} µm², {latency_str}{freq_str}, Instructions={len(subset)}")

            results.append((variant_id, "original", subset, area, latency, frequency, len(prog.basic_blocks)))

        # Dual run for regular variants when shift constraints are enabled
        elif should_run_dual:
            # Run 1: Baseline (without shift constraints, no --odc-analysis)
            print(f"Variant {variant_id}: Starting BASELINE synthesis (no shift constraints)...")
            dsl_file_path_baseline = str(Path(dsl_dir) / f"{program_name}_variant_{variant_id}_baseline.dsl")
            start_time = time.time()
            area_baseline, frequency_baseline = ap.parse_area(subset, dsl_file_path_baseline, enable_freq_analysis=enable_freq_analysis, core_name=core_name)
            synthesis_time_baseline = time.time() - start_time
            latency_baseline = lp.parse_latency(prog, frequency_baseline if enable_freq_analysis else None)

            if enable_freq_analysis and frequency_baseline:
                latency_str = f"Latency={latency_baseline:.2e}s"
                freq_str = f", Frequency={frequency_baseline:.2f} MHz"
            else:
                latency_str = f"Latency={latency_baseline} cycles"
                freq_str = ""
            print(f"Variant {variant_id} (baseline): ✓ Complete in {synthesis_time_baseline:.1f}s - "
                  f"Area={area_baseline:.2f} µm², {latency_str}{freq_str}")

            results.append((f"{variant_id}_baseline", "baseline", subset, area_baseline, latency_baseline, frequency_baseline, len(prog.basic_blocks)))

            # Run 2: Uarchaware (with shift constraints, --odc-analysis only if constraints exist, optionally with cache latencies)
            cache_msg = " + cache latencies" if enable_cache_latencies else ""
            print(f"Variant {variant_id}: Starting UARCHAWARE synthesis (with shift constraints{cache_msg})...")
            dsl_file_path_uarchaware = str(Path(dsl_dir) / f"{program_name}_variant_{variant_id}_uarchaware.dsl")
            start_time = time.time()
            area_uarchaware, frequency_uarchaware = ap.parse_area(subset, dsl_file_path_uarchaware, enable_freq_analysis=enable_freq_analysis, core_name=core_name, shift_imm_dict=shift_imm_dict, add_cache_latencies=enable_cache_latencies)
            synthesis_time_uarchaware = time.time() - start_time
            latency_uarchaware = lp.parse_latency(prog, frequency_uarchaware if enable_freq_analysis else None)

            if enable_freq_analysis and frequency_uarchaware:
                latency_str = f"Latency={latency_uarchaware:.2e}s"
                freq_str = f", Frequency={frequency_uarchaware:.2f} MHz"
            else:
                latency_str = f"Latency={latency_uarchaware} cycles"
                freq_str = ""
            print(f"Variant {variant_id} (uarchaware): ✓ Complete in {synthesis_time_uarchaware:.1f}s - "
                  f"Area={area_uarchaware:.2f} µm², {latency_str}{freq_str}")

            results.append((f"{variant_id}_uarchaware", "uarchaware", subset, area_uarchaware, latency_uarchaware, frequency_uarchaware, len(prog.basic_blocks)))

        # Single run for regular variants when shift constraints are disabled
        else:
            print(f"Variant {variant_id}: Starting synthesis with {len(subset)} instructions...")
            dsl_file_path = str(Path(dsl_dir) / f"{program_name}_variant_{variant_id}.dsl")
            start_time = time.time()
            area, frequency = ap.parse_area(subset, dsl_file_path, enable_freq_analysis=enable_freq_analysis, core_name=core_name)
            synthesis_time = time.time() - start_time
            latency = lp.parse_latency(prog, frequency if enable_freq_analysis else None)

            if enable_freq_analysis and frequency:
                latency_str = f"Latency={latency:.2e}s"
                freq_str = f", Frequency={frequency:.2f} MHz"
            else:
                latency_str = f"Latency={latency} cycles"
                freq_str = ""
            print(f"Variant {variant_id}: ✓ Complete in {synthesis_time:.1f}s - "
                  f"Area={area:.2f} µm², {latency_str}{freq_str}, Instructions={len(subset)}")

            results.append((variant_id, "single", subset, area, latency, frequency, len(prog.basic_blocks)))

        return results

    except Exception as e:
        print(f"Variant {variant_id}: ✗ Error - {e}", file=sys.stderr)
        import traceback
        traceback.print_exc(file=sys.stderr)
        return None


def main():
    if len(sys.argv) < 4:
        print("Usage: python analyze_all_variants.py <variants_dir> <program_name> <output_dir> [num_processes] [--enable-freq-analysis] [--enable-shift-constraints] [--enable-cache-latencies] [--core-name CORE]")
        print("Example: python analyze_all_variants.py output/backend/dijkstra_small_O3/variants dijkstra_small_O3 output/backend/dijkstra_small_O3 72")
        print("         python analyze_all_variants.py output/backend/dijkstra_small_O3/variants dijkstra_small_O3 output/backend/dijkstra_small_O3 72 --enable-freq-analysis")
        print("         python analyze_all_variants.py output/backend/dijkstra_small_O3/variants dijkstra_small_O3 output/backend/dijkstra_small_O3 72 --core-name rocket")
        print("         python analyze_all_variants.py output/backend/dijkstra_small_O3/variants dijkstra_small_O3 output/backend/dijkstra_small_O3 72 --enable-shift-constraints --enable-cache-latencies")
        sys.exit(1)

    variants_dir = sys.argv[1]
    program_name = sys.argv[2]
    output_dir = sys.argv[3]

    # Check for frequency analysis flag
    enable_freq_analysis = "--enable-freq-analysis" in sys.argv

    # Check for shift constraints flag
    enable_shift_constraints = "--enable-shift-constraints" in sys.argv

    # Check for cache latencies flag
    enable_cache_latencies = "--enable-cache-latencies" in sys.argv

    # Check for core name
    core_name = "ibex"  # default
    for i, arg in enumerate(sys.argv):
        if arg == "--core-name" and i + 1 < len(sys.argv):
            core_name = sys.argv[i + 1]
            break

    # Parse num_processes (skip the flags if present)
    args_without_flags = [arg for i, arg in enumerate(sys.argv[4:], 4)
                         if arg != "--enable-freq-analysis" and
                         arg != "--enable-shift-constraints" and
                         arg != "--enable-cache-latencies" and
                         (i == 4 or sys.argv[i-1] != "--core-name") and
                         arg != "--core-name"]
    num_processes = int(args_without_flags[0]) if len(args_without_flags) > 0 else 72  # Default to 72

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
    print(f"Core name: {core_name}")
    print(f"Parallel processes: {num_processes}")
    print(f"Frequency analysis: {'ENABLED (latency in seconds)' if enable_freq_analysis else 'DISABLED (latency in cycles)'}")
    print(f"Shift constraints: {'ENABLED (v2 DSL format)' if enable_shift_constraints else 'DISABLED'}")
    print(f"Cache latencies: {'ENABLED (uarchaware only)' if enable_cache_latencies else 'DISABLED'}")
    print(f"DSL files: {dsl_dir}")
    print("=" * 80)
    print()

    try:
        # Find all variant directories
        variant_dirs = [d for d in variants_path.iterdir() if d.is_dir() and d.name.startswith("variant_")]

        # Separate special variants (original, gp) from numbered variants
        original_variant = None
        gp_variant = None
        numbered_variants = []
        for d in variant_dirs:
            if d.name == "variant_original":
                original_variant = d
            elif d.name == "variant_gp":
                gp_variant = d
            else:
                numbered_variants.append(d)

        numbered_variants = sorted(numbered_variants)
        num_variants = len(numbered_variants)

        # Create list of variant IDs to process (can be int for numbered variants or str for special variants)
        variant_ids: List[Union[int, str]] = list(range(num_variants))
        special_variants_count = 0
        if original_variant:
            variant_ids.append("original")
            special_variants_count += 1
        if gp_variant:
            variant_ids.append("gp")
            special_variants_count += 1

        if special_variants_count > 0:
            special_names = []
            if original_variant:
                special_names.append("original program")
            if gp_variant:
                special_names.append("general purpose processor")
            print(f"Found {num_variants} optimized variants + {special_variants_count} baseline ({', '.join(special_names)})")
        else:
            print(f"Found {num_variants} variants")

        print(f"Starting parallel synthesis with {num_processes} processes...")
        print()

        # Create partial function with fixed arguments
        analyze_func = partial(analyze_single_variant,
                              variants_dir=str(variants_path),
                              program_name=program_name,
                              dsl_dir=str(dsl_dir),
                              enable_freq_analysis=enable_freq_analysis,
                              core_name=core_name,
                              enable_shift_constraints=enable_shift_constraints,
                              enable_cache_latencies=enable_cache_latencies)

        # Run analysis in parallel
        overall_start = time.time()
        with Pool(processes=num_processes) as pool:
            results = pool.map(analyze_func, variant_ids)
        overall_time = time.time() - overall_start

        # Filter out None results (failed analyses) and flatten list of lists
        # Each variant may return 1 or 2 results (baseline + uarchaware)
        valid_results = []
        for r in results:
            if r is not None:
                # r is now a list of tuples
                valid_results.extend(r)

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
        frequencies = {}
        num_blocks = {}
        constraint_types = {}

        for variant_id, constraint_type, subset, area, latency, frequency, blocks in valid_results:
            subsets[variant_id] = subset
            areas[variant_id] = area
            latencies[variant_id] = latency
            frequencies[variant_id] = frequency
            num_blocks[variant_id] = blocks
            constraint_types[variant_id] = constraint_type

        # Show baseline stats if available
        if "original" in areas:
            print(f"Original Program Baseline:")
            if enable_freq_analysis and frequencies.get('original'):
                latency_str = f"{latencies['original']:.2e} seconds"
            else:
                latency_str = f"{latencies['original']} cycles"
            print(f"  Area = {areas['original']:.2f} µm², Latency = {latency_str}, Instructions = {len(subsets['original'])}")
            print()

        if "gp" in areas:
            print(f"General Purpose Processor Baseline (Full RV32IM):")
            if enable_freq_analysis and frequencies.get('gp'):
                latency_str = f"{latencies['gp']:.2e} seconds"
            else:
                latency_str = f"{latencies['gp']} cycles"
            print(f"  Area = {areas['gp']:.2f} µm², Latency = {latency_str}, Instructions = {len(subsets['gp'])}")
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
            constraint_type = constraint_types.get(variant_id, "")
            if variant_id == "original":
                marker = " [ORIGINAL]"
            elif variant_id == "gp":
                marker = " [GENERAL PURPOSE]"
            elif constraint_type == "baseline":
                marker = " [BASELINE]"
            elif constraint_type == "uarchaware":
                marker = " [UARCH-AWARE]"
            else:
                marker = ""
            if enable_freq_analysis and frequencies.get(variant_id):
                latency_str = f"{latency:.2e} seconds"
            else:
                latency_str = f"{latency} cycles"
            print(f"  Variant {variant_id}: Area = {area:.2f} µm², Latency = {latency_str}{marker}")
        print()

        # Generate visualization (matching backend_parser style)
        plot_path = output_path / "pareto_frontier.png"
        print(f"Generating Pareto frontier plot...")

        plt.figure(figsize=(10, 6))

        # Separate variants by constraint type
        original_area = None
        original_latency = None
        gp_area = None
        gp_latency = None
        baseline_areas = []
        baseline_latencies = []
        uarchaware_areas = []
        uarchaware_latencies = []
        single_areas = []
        single_latencies = []

        for variant_id in areas.keys():
            constraint_type = constraint_types[variant_id]
            if variant_id == "original":
                original_area = areas[variant_id]
                original_latency = latencies[variant_id]
            elif variant_id == "gp":
                gp_area = areas[variant_id]
                gp_latency = latencies[variant_id]
            elif constraint_type == "baseline":
                baseline_areas.append(areas[variant_id])
                baseline_latencies.append(latencies[variant_id])
            elif constraint_type == "uarchaware":
                uarchaware_areas.append(areas[variant_id])
                uarchaware_latencies.append(latencies[variant_id])
            else:  # single
                single_areas.append(areas[variant_id])
                single_latencies.append(latencies[variant_id])

        # Plot baseline variants (no shift constraints)
        if baseline_areas:
            plt.scatter(baseline_areas, baseline_latencies, color='blue', marker='o',
                       label='ISA constraint', alpha=0.6, s=20)

        # Plot uarchaware variants (with shift constraints)
        if uarchaware_areas:
            plt.scatter(uarchaware_areas, uarchaware_latencies, color='green', marker='^',
                       label='microarch-aware constraint', alpha=0.6, s=20)

        # Plot single variants (when shift constraints disabled)
        if single_areas:
            plt.scatter(single_areas, single_latencies, color='blue', marker='o',
                       label='Rewritten Variants', alpha=0.6, s=20)

        # Plot original program with distinct marker
        if original_area is not None:
            plt.scatter([original_area], [original_latency], color='red', marker='*',
                       label='Original Program', s=150, edgecolors='black', linewidths=1.5, zorder=10)

        # Plot general purpose processor with distinct marker
        if gp_area is not None:
            plt.scatter([gp_area], [gp_latency], color='orange', marker='s',
                       label='General Purpose (RV32IM)', s=100, edgecolors='black', linewidths=1.5, zorder=10)

        # Highlight Pareto frontier with black edge
        pareto_areas = [p[1] for p in pareto_frontier]
        pareto_latencies = [p[2] for p in pareto_frontier]
        plt.scatter(pareto_areas, pareto_latencies, facecolors='none', edgecolors='red',
                   label='Pareto Frontier', s=100, linewidths=2, zorder=5)

        plt.title(f'Pareto Frontier for {program_name}')
        plt.xlabel('Area (µm²)')
        if enable_freq_analysis:
            plt.ylabel('Latency (seconds)')
        else:
            plt.ylabel('Latency (cycles)')
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

        # Sort: original and gp first, then numbered variants
        def sort_key(x):
            if x == "original":
                return (0, 0, x)
            elif x == "gp":
                return (0, 1, x)
            else:
                return (1, 0, x)

        for variant_id in sorted(subsets.keys(), key=sort_key):
            constraint_type = constraint_types[variant_id]

            # Extract base variant number for baseline/uarchaware variants
            base_variant = None
            if "_baseline" in str(variant_id):
                base_variant = int(str(variant_id).replace("_baseline", ""))
            elif "_uarchaware" in str(variant_id):
                base_variant = int(str(variant_id).replace("_uarchaware", ""))

            variant_data = {
                "variant_id": variant_id,
                "constraint_type": constraint_type,
                "base_variant": base_variant,
                "area": areas[variant_id],
                "latency": latencies[variant_id],
                "frequency": frequencies[variant_id],
                "instruction_subset": sorted(list(subsets[variant_id])),
                "num_instructions": len(subsets[variant_id]),
                "num_blocks": num_blocks[variant_id],
                "is_pareto_optimal": any(p[0] == variant_id for p in pareto_frontier),
                "is_original": variant_id == "original",
                "is_general_purpose": variant_id == "gp",
                "has_shift_constraints": constraint_type == "uarchaware"
            }
            results_data["variants"].append(variant_data)

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
