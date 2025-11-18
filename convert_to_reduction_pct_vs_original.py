#!/usr/bin/env python3
"""
Convert to percentage reduction relative to ORIGINAL program (not GP).

Shows how much improvement variants achieve compared to the original compiler output.
Reduction % = (original_value - variant_value) / original_value * 100

Positive % = improvement (reduction)
Negative % = degradation (worse than original)

Usage:
    python convert_to_reduction_pct_vs_original.py <input_csv> <output_csv>
"""

import sys
import csv
from pathlib import Path


def convert_to_reduction_vs_original(input_csv: str, output_csv: str):
    """Convert to reduction percentages relative to original program."""

    # Read input CSV
    with open(input_csv, 'r') as f:
        reader = csv.DictReader(f)
        rows = list(reader)

    # Process each row
    output_rows = []
    for row in rows:
        # Base info
        output_row = {
            'application_name': row['application_name'],
            'gp_area': row.get('gp_area'),
            'gp_freq': row.get('gp_freq'),
            'gp_latency': row.get('gp_latency'),
            'gp_power': row.get('gp_power'),
            'original_area': row.get('original_area'),
            'original_freq': row.get('original_freq'),
            'original_latency': row.get('original_latency'),
            'original_power': row.get('original_power'),
        }

        # Get original values for baseline
        orig_area = float(row['original_area']) if row.get('original_area') else None
        orig_freq = float(row['original_freq']) if row.get('original_freq') else None
        orig_latency = float(row['original_latency']) if row.get('original_latency') else None
        orig_power = float(row['original_power']) if row.get('original_power') else None

        # Min area variant - calculate reduction vs original
        output_row['min_area_variant'] = row.get('min_area_variant')

        if row.get('min_area_value') and orig_area:
            min_area = float(row['min_area_value'])
            output_row['min_area_value'] = min_area
            output_row['area_reduction_pct'] = (orig_area - min_area) / orig_area * 100

        if row.get('min_area_freq') and orig_freq:
            min_freq = float(row['min_area_freq'])
            output_row['min_area_freq'] = min_freq
            # For frequency, higher is better (improvement = positive)
            output_row['freq_improvement_pct'] = (min_freq - orig_freq) / orig_freq * 100

        if row.get('min_area_latency') and orig_latency:
            min_latency = float(row['min_area_latency'])
            output_row['min_area_latency'] = min_latency
            output_row['latency_reduction_pct'] = (orig_latency - min_latency) / orig_latency * 100

        if row.get('min_area_power') and orig_power:
            min_power = float(row['min_area_power'])
            output_row['min_area_power'] = min_power
            output_row['power_reduction_pct'] = (orig_power - min_power) / orig_power * 100

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

        # Calculate summary statistics
        print()
        print("="*80)
        print("Summary Statistics - Improvement vs Original (for paper):")
        print("="*80)

        area_reductions = [float(r['area_reduction_pct']) for r in output_rows if 'area_reduction_pct' in r]
        if area_reductions:
            print(f"Area Reduction (vs Original):")
            print(f"  Min:     {min(area_reductions):+.1f}%")
            print(f"  Max:     {max(area_reductions):+.1f}%")
            print(f"  Average: {sum(area_reductions)/len(area_reductions):+.1f}%")

        freq_improvements = [float(r['freq_improvement_pct']) for r in output_rows if 'freq_improvement_pct' in r]
        if freq_improvements:
            print(f"\nFrequency Improvement (vs Original):")
            print(f"  Min:     {min(freq_improvements):+.1f}%")
            print(f"  Max:     {max(freq_improvements):+.1f}%")
            print(f"  Average: {sum(freq_improvements)/len(freq_improvements):+.1f}%")

        latency_reductions = [float(r['latency_reduction_pct']) for r in output_rows if 'latency_reduction_pct' in r]
        if latency_reductions:
            print(f"\nLatency Reduction (vs Original):")
            print(f"  Min:     {min(latency_reductions):+.1f}%")
            print(f"  Max:     {max(latency_reductions):+.1f}%")
            print(f"  Average: {sum(latency_reductions)/len(latency_reductions):+.1f}%")

        power_reductions = [float(r['power_reduction_pct']) for r in output_rows if 'power_reduction_pct' in r]
        if power_reductions:
            print(f"\nPower Reduction (vs Original):")
            print(f"  Min:     {min(power_reductions):+.1f}%")
            print(f"  Max:     {max(power_reductions):+.1f}%")
            print(f"  Average: {sum(power_reductions)/len(power_reductions):+.1f}%")

        print("="*80)


def main():
    if len(sys.argv) < 3:
        print("Usage: python convert_to_reduction_pct_vs_original.py <input_csv> <output_csv>")
        print("Example: python convert_to_reduction_pct_vs_original.py results_normalized_power.csv results_reduction_vs_original.csv")
        sys.exit(1)

    input_csv = sys.argv[1]
    output_csv = sys.argv[2]

    print("="*80)
    print("Converting to Reduction % vs Original Program")
    print("="*80)
    print(f"Input:  {input_csv}")
    print(f"Output: {output_csv}")
    print("="*80)
    print()

    convert_to_reduction_vs_original(input_csv, output_csv)

    print()
    print("✓ Conversion complete!")
    print()
    print("Note: Positive % = improvement, Negative % = degradation")


if __name__ == "__main__":
    main()
