#!/usr/bin/env python3
"""
Create 2x2 grid of Pareto frontier plots from analysis results.
Parses existing JSON files without rerunning analysis.

Usage:
    python plot_pareto_grid.py [program1] [program2] [program3] [program4]

If no programs specified, will automatically select 4 programs.
"""

import sys
import json
import matplotlib.pyplot as plt
import scienceplots
from pathlib import Path
from typing import List, Dict, Optional

plt.style.use(['science', 'no-latex'])


def load_program_results(program_name: str, backend_dir: Path) -> Optional[Dict]:
    """Load analysis results for a single program."""
    json_path = backend_dir / program_name / "analysis_results.json"

    if not json_path.exists():
        return None

    try:
        with open(json_path, 'r') as f:
            data = json.load(f)
        return data
    except Exception as e:
        print(f"Error loading {program_name}: {e}")
        return None


def plot_pareto_single(ax, data: Dict, program_name: str, subplot_idx: int):
    """Plot Pareto frontier for a single program on given axes.

    Args:
        ax: Matplotlib axes
        data: Program analysis data
        program_name: Name of the program
        subplot_idx: Index in 2x2 grid (0-3)
    """

    variants = data.get('variants', [])
    if not variants:
        return

    # Organize data by constraint type
    baseline_areas = []
    baseline_latencies = []
    uarchaware_areas = []
    uarchaware_latencies = []
    single_areas = []
    single_latencies = []
    original_area = None
    original_latency = None
    gp_area = None
    gp_latency = None

    for variant in variants:
        variant_id = variant['variant_id']
        constraint_type = variant.get('constraint_type', 'single')
        area = variant['area']
        latency = variant['latency']

        if variant_id == 'original' or constraint_type == 'original':
            original_area = area
            original_latency = latency
        elif variant_id == 'gp' or constraint_type == 'gp':
            gp_area = area
            gp_latency = latency
        elif constraint_type == 'baseline':
            baseline_areas.append(area)
            baseline_latencies.append(latency)
        elif constraint_type == 'uarchaware':
            uarchaware_areas.append(area)
            uarchaware_latencies.append(latency)
        else:  # single
            single_areas.append(area)
            single_latencies.append(latency)

    # Plot different variant types
    if baseline_areas:
        ax.scatter(baseline_areas, baseline_latencies, color='blue', marker='o',
                  label='aeSIP: ISA level constraint', alpha=0.6, s=100)

    if uarchaware_areas:
        ax.scatter(uarchaware_areas, uarchaware_latencies, color='green', marker='^',
                  label='aeSIP: uarch aware constraint', alpha=0.6, s=100)

    # if single_areas:
    #     ax.scatter(single_areas, single_latencies, color='blue', marker='o',
    #               label='Variants', alpha=0.6, s=100)

    if original_area is not None:
        ax.scatter([original_area], [original_latency], color='red', marker='*',
                  label='PDAG', s=400, edgecolors='black', linewidths=1.5, zorder=10)

    if gp_area is not None:
        ax.scatter([gp_area], [gp_latency], color='orange', marker='s',
                  label='Baseline Ibex (RV32IM)', s=300, edgecolors='black', linewidths=1.5, zorder=10)

    # Calculate and plot Pareto frontier
    all_areas = []
    all_latencies = []
    all_areas.extend(baseline_areas)
    all_areas.extend(uarchaware_areas)
    all_areas.extend(single_areas)
    all_latencies.extend(baseline_latencies)
    all_latencies.extend(uarchaware_latencies)
    all_latencies.extend(single_latencies)

    if original_area:
        all_areas.append(original_area)
        all_latencies.append(original_latency)
    if gp_area:
        all_areas.append(gp_area)
        all_latencies.append(gp_latency)

    # Find Pareto frontier
    pareto_indices = []
    for i in range(len(all_areas)):
        dominated = False
        for j in range(len(all_areas)):
            if i != j:
                if (all_areas[j] <= all_areas[i] and all_latencies[j] < all_latencies[i]) or \
                   (all_areas[j] < all_areas[i] and all_latencies[j] <= all_latencies[i]):
                    dominated = True
                    break
        if not dominated:
            pareto_indices.append(i)

    if pareto_indices:
        pareto_areas = [all_areas[i] for i in pareto_indices]
        pareto_latencies = [all_latencies[i] for i in pareto_indices]
        ax.scatter(pareto_areas, pareto_latencies, facecolors='none', edgecolors='red',
                  s=200, linewidths=2, zorder=5, label='Pareto frontier')

    # Configure axes based on position in grid
    # Grid layout: [0, 1]  (top row)
    #              [2, 3]  (bottom row)

    # Bottom row only: show x-axis label
    if subplot_idx >= 2:
        ax.set_xlabel('Area ($\mu m^2$)', fontsize=32, fontweight='bold')

    # Left column only: show y-axis label
    if subplot_idx % 2 == 0:
        ax.set_ylabel('Latency (s)', fontsize=32, fontweight='bold')

    ax.set_title(program_name, fontsize=32, fontweight='bold')
    ax.grid(True, alpha=0.3)
    ax.tick_params(labelsize=32)

    # Reduce number of ticks for cleaner look
    ax.locator_params(axis='x', nbins=4)
    ax.locator_params(axis='y', nbins=4)


def create_pareto_grid(program_names: List[str], backend_dir: Path, output_path: str):
    """Create 2x2 grid of Pareto frontier plots."""

    # Optional: Name mapping for cleaner display names
    NAME_MAPPING = {
        'basicmath_small_O3': 'basicmath',
        'bitcnts_O3': 'bitcnts',
        'dijkstra_small_O3': 'dijkstra',
        'matmult-int': 'matmult',
        'qsort_large_O3': 'qsort-large',
        'qsort_small_O3': 'qsort-small',
        'libhuffbench': 'huffbench',
        'combined': 'combined',
        # Add more mappings as needed
    }

    # Load data for all programs
    program_data = []
    for pname in program_names[:4]:  # Limit to 4 programs
        data = load_program_results(pname, backend_dir)
        if data:
            display_name = NAME_MAPPING.get(pname, pname)
            program_data.append((display_name, data))

    if len(program_data) == 0:
        print("No valid program data found!")
        return

    # Create 2x2 subplot grid
    fig, axes = plt.subplots(2, 2, figsize=(16, 12))
    axes = axes.flatten()

    # Plot each program
    for idx, (pname, data) in enumerate(program_data):
        if idx < 4:
            plot_pareto_single(axes[idx], data, pname, idx)

    # Hide unused subplots
    for idx in range(len(program_data), 4):
        axes[idx].axis('off')

    # Create single shared legend at the top with more space
    handles, labels = axes[0].get_legend_handles_labels()
    # Remove duplicate labels
    by_label = dict(zip(labels, handles))
    fig.legend(by_label.values(), by_label.keys(),
              loc='upper center', bbox_to_anchor=(0.5, 1.0),
              ncol=3, fontsize=32, framealpha=0.9)

    # Adjust layout to make room for legend (more space at top)
    plt.tight_layout(rect=[0, 0, 1, 0.85])

    # Save figure
    plt.savefig(output_path, dpi=300, bbox_inches='tight')
    print(f"Pareto grid saved to: {output_path}")
    plt.close()


def main():
    # Parse arguments
    if len(sys.argv) > 1 and sys.argv[1] in ['-h', '--help']:
        print(__doc__)
        sys.exit(0)

    # Get program names from arguments or auto-select
    script_dir = Path(__file__).parent
    backend_dir = script_dir / "output" / "backend"

    if len(sys.argv) > 1:
        # Use specified programs
        program_names = sys.argv[1:5]  # Take up to 4 programs
    else:
        # Auto-select 4 programs
        all_programs = [d.name for d in backend_dir.iterdir() if d.is_dir()]
        program_names = sorted(all_programs)[:4]

    print("="*80)
    print("Creating Pareto Frontier Grid (2x2)")
    print("="*80)
    print(f"Programs: {', '.join(program_names)}")
    print("="*80)
    print()

    output_path = "pareto_grid.pdf"
    create_pareto_grid(program_names, backend_dir, output_path)

    print()
    print("✓ Complete!")


if __name__ == "__main__":
    main()
