#!/usr/bin/env python3
"""
Analyze all variants using the backend_parser.program class.
This script wraps the existing backend analysis infrastructure.

Usage:
    python analyze_all_variants.py <variants_dir> <program_name> <output_dir>
"""

import sys
from pathlib import Path

# Add paths for imports
sys.path.insert(0, str(Path(__file__).parent))

from backend.backend_parser import program


def main():
    if len(sys.argv) != 4:
        print("Usage: python analyze_all_variants.py <variants_dir> <program_name> <output_dir>")
        print("Example: python analyze_all_variants.py output/backend/dijkstra_small_O3/variants dijkstra_small_O3 output/backend/dijkstra_small_O3")
        sys.exit(1)

    variants_dir = sys.argv[1]
    program_name = sys.argv[2]
    output_dir = sys.argv[3]

    variants_path = Path(variants_dir)
    output_path = Path(output_dir)

    if not variants_path.exists():
        print(f"Error: Variants directory not found: {variants_path}")
        sys.exit(1)

    print(f"Analyzing variants in: {variants_path}")
    print(f"Program name: {program_name}")
    print(f"Output directory: {output_path}")
    print()

    try:
        # Create program instance
        prog = program(program_name, variants_path)

        # Parse all variants
        print(f"Parsing variant directories...")
        prog.parse_variants()
        print(f"Found {len(prog.variants)} variants")
        print()

        # Parse subsets, areas, and delays
        # Save DSL files to output_dir/dsl_files
        dsl_dir = output_path / "dsl_files"
        print(f"Analyzing instruction subsets, areas, and latencies...")
        print(f"DSL files will be saved to: {dsl_dir}")
        print()
        prog.parse_subsets(str(dsl_dir))
        print()

        # Get Pareto frontier
        pareto_frontier = prog.get_pareto_frontier()
        print(f"Pareto Frontier ({len(pareto_frontier)} optimal variants):")
        for variant_index, area, latency in sorted(pareto_frontier, key=lambda x: x[1]):
            print(f"  Variant {variant_index}: Area = {area:.2f} µm², Latency = {latency}")
        print()

        # Generate visualization
        plot_path = output_path / "pareto_frontier.png"
        print(f"Generating Pareto frontier plot...")
        prog.visualize_pareto_frontier(str(plot_path), pareto_frontier)
        print(f"Plot saved to: {plot_path}")
        print()

        # Save detailed results to JSON
        import json
        results_file = output_path / "analysis_results.json"
        results = {
            "program_name": program_name,
            "num_variants": len(prog.variants),
            "variants": []
        }

        for i in range(len(prog.variants)):
            results["variants"].append({
                "variant_id": i,
                "area": prog.areas[i],
                "latency": prog.delays[i],
                "instruction_subset": list(prog.subsets[i]),
                "num_instructions": len(prog.subsets[i]),
                "is_pareto_optimal": any(p[0] == i for p in pareto_frontier)
            })

        results["pareto_frontier"] = [
            {
                "variant_id": p[0],
                "area": p[1],
                "latency": p[2]
            }
            for p in pareto_frontier
        ]

        with open(results_file, 'w') as f:
            json.dump(results, f, indent=2)

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
