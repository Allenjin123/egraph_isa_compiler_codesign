#!/usr/bin/env python3
"""
Finalize Cluster ASIP Results
==============================

Post-processing script that:
1. Reads cluster results from all K values
2. Computes geometric mean of area×latency for each K
3. Generates K vs performance plot
4. Saves summary table and JSON

Called by run_k_parallel.sh after all K values complete.

Usage:
    python finalize_results.py \
        --k-values "1 2 3 6" \
        --output-dir output/cluster_asips
"""

import argparse
import json
import sys
from pathlib import Path
from typing import Dict, List

import matplotlib.pyplot as plt
import numpy as np


def load_cluster_results(output_dir: Path, k_values: List[int]) -> Dict:
    """
    Load cluster results for all K values.

    Returns:
        {k: {cluster_id: cluster_results_dict}}
    """
    all_results = {}

    for k in k_values:
        k_dir = output_dir / f"k{k}"
        if not k_dir.exists():
            print(f"Warning: K={k} directory not found: {k_dir}")
            continue

        all_results[k] = {}

        # Find all cluster result files
        for cluster_file in k_dir.glob("cluster_*/cluster_results.json"):
            cluster_id = int(cluster_file.parent.name.split('_')[1])

            with open(cluster_file, 'r') as f:
                cluster_data = json.load(f)

            all_results[k][cluster_id] = cluster_data

        print(f"Loaded K={k}: {len(all_results[k])} clusters")

    return all_results


def compute_k_performance(all_results: Dict) -> Dict:
    """
    Compute overall performance for each K value.

    For each K:
    1. Collect area×latency for ALL programs across ALL clusters
    2. Compute geometric mean

    Returns:
        {k: {'geomean': float, 'program_scores': {prog: score}, 'num_programs': int}}
    """
    k_performance = {}

    for k, clusters in all_results.items():
        # Collect scores for all programs
        program_scores = {}

        for cluster_id, cluster_data in clusters.items():
            best_asip = cluster_data.get('best_asip')
            if not best_asip:
                print(f"  Warning: K={k} cluster {cluster_id} has no best ASIP")
                continue

            synthesis_results = cluster_data.get('synthesis_results', {})
            best_variant_id = best_asip['variant_id']

            if best_variant_id not in synthesis_results:
                print(f"  Warning: K={k} cluster {cluster_id} best variant not in synthesis results")
                continue

            prog_results = synthesis_results[best_variant_id]

            # Add scores for each program
            for prog_name, metrics in prog_results.items():
                program_scores[prog_name] = metrics['area_latency']

        # Compute geometric mean across all programs
        if program_scores:
            all_scores = list(program_scores.values())
            geomean = np.exp(np.mean(np.log(all_scores)))

            k_performance[k] = {
                'geomean': geomean,
                'program_scores': program_scores,
                'num_programs': len(program_scores)
            }

            print(f"K={k}: geomean={geomean:.2e} ({len(program_scores)} programs)")
        else:
            print(f"K={k}: No valid program scores")

    return k_performance


def plot_k_vs_performance(k_performance: Dict, output_file: Path):
    """
    Generate K vs geomean(area×latency) plot.

    Args:
        k_performance: {k: {'geomean': float, ...}}
        output_file: Path to save plot
    """
    if not k_performance:
        print("No performance data to plot")
        return

    # Sort by K
    k_values = sorted(k_performance.keys())
    geomeans = [k_performance[k]['geomean'] for k in k_values]

    # Find optimal K (minimum geomean)
    min_idx = np.argmin(geomeans)
    optimal_k = k_values[min_idx]
    optimal_geomean = geomeans[min_idx]

    # Create plot
    fig, ax = plt.subplots(figsize=(10, 6))

    # Plot line with markers
    ax.plot(k_values, geomeans, 'o-', linewidth=2, markersize=8, label='Geomean(Area×Latency)')

    # Highlight optimal K
    ax.plot(optimal_k, optimal_geomean, 'r*', markersize=20, label=f'Optimal K={optimal_k}')

    # Formatting
    ax.set_xlabel('K (Number of Specialized Processors)', fontsize=12)
    ax.set_ylabel('Geomean(Area × Latency)', fontsize=12)
    ax.set_title('K vs Performance: Cluster-Based ASIP Optimization', fontsize=14, fontweight='bold')
    ax.grid(True, alpha=0.3)
    ax.legend(fontsize=10)

    # Set x-axis to show only integer K values
    ax.set_xticks(k_values)

    # Format y-axis with scientific notation
    ax.ticklabel_format(axis='y', style='scientific', scilimits=(0,0))

    plt.tight_layout()
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    print(f"\n✓ Plot saved to: {output_file}")

    plt.close()


def save_summary_table(k_performance: Dict, output_file: Path):
    """
    Save K vs performance summary as text table.

    Args:
        k_performance: {k: {'geomean': float, ...}}
        output_file: Path to save table
    """
    if not k_performance:
        print("No performance data to save")
        return

    # Sort by K
    k_values = sorted(k_performance.keys())

    # Calculate improvement vs K=1 baseline
    baseline_geomean = k_performance[k_values[0]]['geomean'] if k_values else 0

    lines = []
    lines.append("K vs Performance Summary")
    lines.append("="*70)
    lines.append(f"{'K':>5} {'Geomean(Area×Latency)':>25} {'Improvement vs K=1':>25}")
    lines.append("-"*70)

    optimal_k = None
    best_geomean = float('inf')

    for k in k_values:
        geomean = k_performance[k]['geomean']
        improvement = ((baseline_geomean - geomean) / baseline_geomean) * 100

        marker = ""
        if geomean < best_geomean:
            best_geomean = geomean
            optimal_k = k
            marker = " ← Optimal"

        lines.append(f"{k:5d} {geomean:25.2e} {improvement:23.1f}%{marker}")

    lines.append("="*70)
    lines.append(f"\nOptimal K: {optimal_k} (geomean = {best_geomean:.2e})")
    lines.append(f"Improvement vs K=1 baseline: {((baseline_geomean - best_geomean) / baseline_geomean) * 100:.1f}%")

    # Write to file
    with open(output_file, 'w') as f:
        f.write('\n'.join(lines))

    # Also print to console
    print()
    for line in lines:
        print(line)

    print(f"\n✓ Summary table saved to: {output_file}")


def save_summary_json(all_results: Dict, k_performance: Dict, output_file: Path):
    """
    Save complete summary as JSON.

    Args:
        all_results: Full cluster results
        k_performance: Performance metrics
        output_file: Path to save JSON
    """
    summary = {
        'k_performance': {
            str(k): {
                'geomean': float(data['geomean']),
                'num_programs': data['num_programs'],
                'program_scores': data['program_scores']
            }
            for k, data in k_performance.items()
        },
        'cluster_details': {
            str(k): {
                str(cluster_id): {
                    'programs': cluster_data['programs'],
                    'best_asip': cluster_data.get('best_asip')
                }
                for cluster_id, cluster_data in clusters.items()
            }
            for k, clusters in all_results.items()
        }
    }

    with open(output_file, 'w') as f:
        json.dump(summary, f, indent=2)

    print(f"✓ Summary JSON saved to: {output_file}")


def main():
    parser = argparse.ArgumentParser(description="Finalize cluster ASIP results and generate plots")
    parser.add_argument('--k-values', required=True,
                       help="Space-separated K values (e.g., '1 2 3 6')")
    parser.add_argument('--output-dir', default='output/cluster_asips',
                       help="Output directory base (default: output/cluster_asips)")

    args = parser.parse_args()

    # Parse K values
    k_values = [int(k) for k in args.k_values.split()]

    output_dir = Path(args.output_dir)

    print("="*80)
    print("Finalizing Cluster ASIP Results")
    print("="*80)
    print(f"K values: {k_values}")
    print(f"Output directory: {output_dir}")
    print("="*80)
    print()

    # Step 1: Load all cluster results
    print("Step 1: Loading cluster results...")
    all_results = load_cluster_results(output_dir, k_values)
    print()

    # Step 2: Compute performance for each K
    print("Step 2: Computing K performance metrics...")
    k_performance = compute_k_performance(all_results)
    print()

    # Step 3: Generate plot
    print("Step 3: Generating K vs performance plot...")
    plot_file = output_dir / "k_vs_performance.png"
    plot_k_vs_performance(k_performance, plot_file)
    print()

    # Step 4: Save summary table
    print("Step 4: Saving summary table...")
    table_file = output_dir / "k_vs_performance_table.txt"
    save_summary_table(k_performance, table_file)
    print()

    # Step 5: Save summary JSON
    print("Step 5: Saving summary JSON...")
    json_file = output_dir / "asip_summary.json"
    save_summary_json(all_results, k_performance, json_file)
    print()

    print("="*80)
    print("✓ Finalization Complete")
    print("="*80)
    print(f"\nOutputs:")
    print(f"  - Plot: {plot_file}")
    print(f"  - Table: {table_file}")
    print(f"  - JSON: {json_file}")
    print()

    return 0


if __name__ == "__main__":
    sys.exit(main())
