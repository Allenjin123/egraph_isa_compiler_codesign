#!/usr/bin/env python3
"""
Parse analysis results from all programs and generate CSV summary.
Reads existing JSON files without modifying anything or rerunning analysis.

Usage:
    python parse_results.py [output_csv]

Default output: results_summary.csv
"""

import sys
import json
import csv
from pathlib import Path
from typing import Dict, List, Optional, Tuple


def find_all_result_jsons(backend_dir: Path) -> List[Path]:
    """Find all analysis_results.json files in backend directory."""
    json_files = []

    if not backend_dir.exists():
        return json_files

    # Look for analysis_results.json in each program directory
    for program_dir in backend_dir.iterdir():
        if program_dir.is_dir():
            json_file = program_dir / "analysis_results.json"
            if json_file.exists():
                json_files.append(json_file)

    return sorted(json_files)


def parse_json_results(json_path: Path) -> Optional[Dict]:
    """Parse a single analysis_results.json file and extract summary data."""
    try:
        with open(json_path, 'r') as f:
            data = json.load(f)

        program_name = data.get('program_name', 'unknown')
        variants = data.get('variants', [])

        if not variants:
            return None

        # Find GP, original, and all other variants
        gp_data = None
        original_data = None
        all_variants = []

        for variant in variants:
            variant_id = variant['variant_id']
            constraint_type = variant.get('constraint_type', 'single')

            if variant_id == 'gp' or constraint_type == 'gp':
                gp_data = variant
            elif variant_id == 'original' or constraint_type == 'original':
                original_data = variant
            else:
                # Only consider non-baseline, non-gp, non-original variants
                # Skip baseline variants for min area calculation
                if constraint_type not in ['baseline', 'gp', 'original']:
                    all_variants.append(variant)

        # Find variant with minimum area
        min_area_variant = None
        if all_variants:
            min_area_variant = min(all_variants, key=lambda x: x['area'])

        # Extract values for normalization
        gp_area = gp_data['area'] if gp_data else None
        gp_freq = gp_data['frequency'] if gp_data else None
        gp_latency = gp_data['latency'] if gp_data else None

        original_area = original_data['area'] if original_data else None
        original_freq = original_data['frequency'] if original_data else None
        original_latency = original_data['latency'] if original_data else None

        min_area_value = min_area_variant['area'] if min_area_variant else None
        min_area_freq = min_area_variant['frequency'] if min_area_variant else None
        min_area_latency = min_area_variant['latency'] if min_area_variant else None

        # Calculate normalized values (relative to GP)
        # normalized = value / gp_value (< 1 means better than GP, > 1 means worse)
        def normalize(value, gp_value):
            if value is not None and gp_value is not None and gp_value != 0:
                return value / gp_value
            return None

        # Build summary with normalized values
        summary = {
            'application_name': program_name,
            'gp_area': gp_area,
            'gp_freq': gp_freq,
            'gp_latency': gp_latency,
            'original_area': original_area,
            'original_freq': original_freq,
            'original_latency': original_latency,
            'original_area_norm': normalize(original_area, gp_area),
            'original_freq_norm': normalize(original_freq, gp_freq),
            'original_latency_norm': normalize(original_latency, gp_latency),
            'min_area_variant': min_area_variant['variant_id'] if min_area_variant else None,
            'min_area_value': min_area_value,
            'min_area_freq': min_area_freq,
            'min_area_latency': min_area_latency,
            'min_area_norm': normalize(min_area_value, gp_area),
            'min_freq_norm': normalize(min_area_freq, gp_freq),
            'min_latency_norm': normalize(min_area_latency, gp_latency),
        }

        return summary

    except Exception as e:
        print(f"Error parsing {json_path}: {e}", file=sys.stderr)
        return None


def generate_csv(summaries: List[Dict], output_path: str):
    """Generate CSV file from summaries."""
    if not summaries:
        print("No valid results found!")
        return

    # Define CSV columns
    fieldnames = [
        'application_name',
        'gp_area', 'gp_freq', 'gp_latency',
        'original_area', 'original_freq', 'original_latency',
        'original_area_norm', 'original_freq_norm', 'original_latency_norm',
        'min_area_variant', 'min_area_value', 'min_area_freq', 'min_area_latency',
        'min_area_norm', 'min_freq_norm', 'min_latency_norm'
    ]

    with open(output_path, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(summaries)

    print(f"CSV summary written to: {output_path}")
    print(f"Total programs: {len(summaries)}")


def main():
    # Parse command line arguments
    output_csv = sys.argv[1] if len(sys.argv) > 1 else "results_summary.csv"

    # Find project root
    script_dir = Path(__file__).parent
    backend_dir = script_dir / "output" / "backend"

    print("="*80)
    print("Parsing Analysis Results")
    print("="*80)
    print(f"Backend directory: {backend_dir}")
    print(f"Output CSV: {output_csv}")
    print("="*80)
    print()

    # Find all JSON files
    json_files = find_all_result_jsons(backend_dir)
    print(f"Found {len(json_files)} analysis result files")
    print()

    # Parse each JSON
    summaries = []
    for json_path in json_files:
        program_name = json_path.parent.name
        print(f"Parsing {program_name}...", end=" ")

        summary = parse_json_results(json_path)
        if summary:
            summaries.append(summary)
            print("✓")
        else:
            print("✗ (skipped)")

    print()

    # Generate CSV
    generate_csv(summaries, output_csv)

    print()
    print("✓ Analysis complete!")


if __name__ == "__main__":
    main()
