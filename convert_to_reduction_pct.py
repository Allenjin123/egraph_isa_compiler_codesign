#!/usr/bin/env python3
"""
Convert normalized values to percentage reduction.

Reads CSV with normalized values and converts them to reduction percentages.
Reduction % = (gp_value - variant_value) / gp_value * 100

Positive % = improvement (reduction)
Negative % = worse than GP

Usage:
    python convert_to_reduction_pct.py <input_csv> <output_csv>
"""

import sys
import csv
from pathlib import Path


def convert_to_reduction_pct(input_csv: str, output_csv: str):
    """Convert normalized values to reduction percentages."""

    # Read input CSV
    with open(input_csv, 'r') as f:
        reader = csv.DictReader(f)
        rows = list(reader)

    # Process each row
    output_rows = []
    for row in rows:
        output_row = {
            'application_name': row['application_name'],
            'gp_area': row.get('gp_area'),
            'gp_freq': row.get('gp_freq'),
            'gp_latency': row.get('gp_latency'),
            'gp_power': row.get('gp_power'),  # Add power if exists
        }

        # Convert original normalized values to reduction %
        # Reduction % = (1 - normalized) * 100
        # Or: (gp - value) / gp * 100

        # Original reductions
        if row.get('original_area'):
            output_row['original_area'] = row['original_area']
        if row.get('original_area_norm'):
            output_row['original_area_reduction_pct'] = (1 - float(row['original_area_norm'])) * 100

        if row.get('original_freq'):
            output_row['original_freq'] = row['original_freq']
        if row.get('original_freq_norm'):
            # For frequency, higher is better, so flip the sign
            output_row['original_freq_improvement_pct'] = (float(row['original_freq_norm']) - 1) * 100

        if row.get('original_latency'):
            output_row['original_latency'] = row['original_latency']
        if row.get('original_latency_norm'):
            output_row['original_latency_reduction_pct'] = (1 - float(row['original_latency_norm'])) * 100

        if row.get('original_power'):
            output_row['original_power'] = row['original_power']
        if row.get('original_power_norm'):
            output_row['original_power_reduction_pct'] = (1 - float(row['original_power_norm'])) * 100

        # Min area variant
        output_row['min_area_variant'] = row.get('min_area_variant')
        if row.get('min_area_value'):
            output_row['min_area_value'] = row['min_area_value']
        if row.get('min_area_norm'):
            output_row['min_area_reduction_pct'] = (1 - float(row['min_area_norm'])) * 100

        if row.get('min_area_freq'):
            output_row['min_area_freq'] = row['min_area_freq']
        if row.get('min_freq_norm'):
            output_row['min_area_freq_improvement_pct'] = (float(row['min_freq_norm']) - 1) * 100

        if row.get('min_area_latency'):
            output_row['min_area_latency'] = row['min_area_latency']
        if row.get('min_latency_norm'):
            output_row['min_area_latency_reduction_pct'] = (1 - float(row['min_latency_norm'])) * 100

        if row.get('min_area_power'):
            output_row['min_area_power'] = row['min_area_power']
        if row.get('min_power_norm'):
            output_row['min_area_power_reduction_pct'] = (1 - float(row['min_power_norm'])) * 100

        output_rows.append(output_row)

    # Write output CSV
    if output_rows:
        fieldnames = output_rows[0].keys()
        with open(output_csv, 'w', newline='') as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(output_rows)

        print(f"Converted CSV written to: {output_csv}")
        print(f"Total programs: {len(output_rows)}")

        # Calculate summary statistics for min area variants
        print()
        print("="*80)
        print("Summary Statistics (for paper):")
        print("="*80)

        area_reductions = [float(r['min_area_reduction_pct']) for r in output_rows if 'min_area_reduction_pct' in r]
        if area_reductions:
            print(f"Area Reduction (vs GP):")
            print(f"  Min:     {min(area_reductions):.1f}%")
            print(f"  Max:     {max(area_reductions):.1f}%")
            print(f"  Average: {sum(area_reductions)/len(area_reductions):.1f}%")

        latency_reductions = [float(r['min_area_latency_reduction_pct']) for r in output_rows if 'min_area_latency_reduction_pct' in r]
        if latency_reductions:
            print(f"\nLatency Reduction (vs GP):")
            print(f"  Min:     {min(latency_reductions):.1f}%")
            print(f"  Max:     {max(latency_reductions):.1f}%")
            print(f"  Average: {sum(latency_reductions)/len(latency_reductions):.1f}%")

        power_reductions = [float(r['min_area_power_reduction_pct']) for r in output_rows if 'min_area_power_reduction_pct' in r]
        if power_reductions:
            print(f"\nPower Reduction (vs GP):")
            print(f"  Min:     {min(power_reductions):.1f}%")
            print(f"  Max:     {max(power_reductions):.1f}%")
            print(f"  Average: {sum(power_reductions)/len(power_reductions):.1f}%")

        print("="*80)


def main():
    if len(sys.argv) < 3:
        print("Usage: python convert_to_reduction_pct.py <input_csv> <output_csv>")
        print("Example: python convert_to_reduction_pct.py results_normalized_power.csv results_reduction_pct.csv")
        sys.exit(1)

    input_csv = sys.argv[1]
    output_csv = sys.argv[2]

    print("="*80)
    print("Converting Normalized Values to Reduction Percentages")
    print("="*80)
    print(f"Input:  {input_csv}")
    print(f"Output: {output_csv}")
    print("="*80)
    print()

    convert_to_reduction_pct(input_csv, output_csv)

    print()
    print("✓ Conversion complete!")


if __name__ == "__main__":
    main()
