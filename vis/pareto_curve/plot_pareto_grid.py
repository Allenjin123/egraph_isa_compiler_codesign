#!/usr/bin/env python3
"""
Create 2x4 grid of Pareto frontier plots from analysis results.
Parses existing JSON files without rerunning analysis.

Usage:
    python plot_pareto_grid.py [program1] ... [program8]

If no programs specified, will automatically select 8 programs.
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


def plot_pareto_single(ax, data: Dict, program_name: str, subplot_idx: int,
                       n_cols: int = 4, n_rows: int = 2):
    """Plot Pareto frontier for a single program on given axes.

    Args:
        ax: Matplotlib axes
        data: Program analysis data
        program_name: Name of the program
        subplot_idx: Index in grid (0-7)
        n_cols: Number of columns in grid
        n_rows: Number of rows in grid
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
                  label='aeSIP: ISA level constraint', alpha=0.6, s=100, zorder=3)

    if uarchaware_areas:
        ax.scatter(uarchaware_areas, uarchaware_latencies, color='green', marker='^',
                  label='aeSIP: uarch aware constraint', alpha=0.6, s=100, zorder=3)

    # if single_areas:
    #     ax.scatter(single_areas, single_latencies, color='blue', marker='o',
    #               label='Variants', alpha=0.6, s=100)

    if gp_area is not None:
        ax.scatter([gp_area], [gp_latency], color='orange', marker='s',
                  label='Baseline Ibex (RV32IM)', s=300, edgecolors='black', linewidths=1.5, zorder=10)

    if original_area is not None:
        ax.scatter([original_area], [original_latency], color='red', marker='*',
                  label='PDAG', s=400, edgecolors='black', linewidths=1.5, zorder=15)

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
    row = subplot_idx // n_cols
    col = subplot_idx % n_cols

    # Bottom row only: show x-axis label
    if row == n_rows - 1:
        ax.set_xlabel(r'Area ($\mu m^2$)', fontsize=32, fontweight='bold')

    # Left column only: show y-axis label
    if col == 0:
        ax.set_ylabel('Latency (s)', fontsize=32, fontweight='bold')

    ax.set_title(program_name, fontsize=32, fontweight='bold')
    ax.grid(True, alpha=0.3)
    ax.tick_params(labelsize=32)

    # Reduce number of ticks for cleaner look
    ax.locator_params(axis='x', nbins=4)
    ax.locator_params(axis='y', nbins=4)


def create_pareto_grid(program_names: List[str], backend_dir: Path, output_path: str):
    """Create 2x4 grid of Pareto frontier plots."""

    NAME_MAPPING = {
        'basicmath_small_O3': 'basicmath',
        'bitcnts_O3': 'bitcnts',
        'dijkstra_small_O3': 'dijkstra',
        'matmult-int': 'matmult',
        'qsort_large_O3': 'qsort-large',
        'qsort_small_O3': 'qsort-small',
        'sha_O3': 'sha',
        'patricia_O3': 'patricia',
        'picojpeg_test': 'picojpeg',
        'rijndael_Oz': 'rijndael',
        'libhuffbench': 'huffbench',
        'combined': 'combined',
        'libedn': 'edn',
        'libnsichneu': 'nsichneu',
        'libslre': 'slre',
        'libstatemate': 'statemate',
        'libud': 'ud',
        'libwikisort': 'wikisort',
        'md5': 'md5sum',
        'mont64': 'mont64',
        'primecount': 'primecount',
        'tarfind': 'tarfind',
    }

    N_ROWS, N_COLS = 2, 5

    # Load data for all programs
    program_data = []
    for pname in program_names[:N_ROWS * N_COLS]:
        data = load_program_results(pname, backend_dir)
        if data:
            display_name = NAME_MAPPING.get(pname, pname)
            program_data.append((display_name, data))

    if len(program_data) == 0:
        print("No valid program data found!")
        return

    # Create 2x4 subplot grid (double-column figure)
    fig, axes = plt.subplots(N_ROWS, N_COLS, figsize=(40, 12))
    axes = axes.flatten()

    # Plot each program
    for idx, (pname, data) in enumerate(program_data):
        plot_pareto_single(axes[idx], data, pname, idx,
                           n_cols=N_COLS, n_rows=N_ROWS)

    # Hide unused subplots
    for idx in range(len(program_data), N_ROWS * N_COLS):
        axes[idx].axis('off')

    # Create single shared legend at the top
    handles, labels = axes[0].get_legend_handles_labels()
    by_label = dict(zip(labels, handles))
    fig.legend(by_label.values(), by_label.keys(),
              loc='upper center', bbox_to_anchor=(0.5, 1.0),
              ncol=len(by_label), fontsize=32, framealpha=0.9)

    plt.tight_layout(rect=[0, 0, 1, 0.92])

    # Save figure
    plt.savefig(output_path, dpi=300, bbox_inches='tight')
    print(f"Pareto grid saved to: {output_path}")
    plt.close()


def main():
    if len(sys.argv) > 1 and sys.argv[1] in ['-h', '--help']:
        print(__doc__)
        sys.exit(0)

    script_dir = Path(__file__).resolve().parent
    project_root = script_dir.parent.parent
    backend_dir = project_root / "output" / "backend"

    # Default 10 programs, sorted alphabetically by display name
    DEFAULT_PROGRAMS = [
        'basicmath_small_O3',  # basicmath
        'bitcnts_O3',          # bitcnts
        'combined',            # combined
        'dijkstra_small_O3',   # dijkstra
        'matmult-int',         # matmult
        'mont64',              # mont64
        'qsort_small_O3',     # qsort-small
        'rijndael_Oz',         # rijndael
        'libud',               # ud
        'libwikisort',         # wikisort
    ]

    # MiBench (8) + wikisort + mont64, sorted alphabetically by display name
    MIBENCH_PLUS = [
        'basicmath_small_O3',  # basicmath
        'bitcnts_O3',          # bitcnts
        'dijkstra_small_O3',   # dijkstra
        'mont64',              # mont64
        'patricia_O3',         # patricia
        'qsort_large_O3',     # qsort-large
        'qsort_small_O3',     # qsort-small
        'rijndael_Oz',         # rijndael
        'sha_O3',              # sha
        'libwikisort',         # wikisort
    ]

    if len(sys.argv) > 1:
        program_names = sys.argv[1:11]
        print("="*80)
        print("Creating Pareto Frontier Grid (2x5)")
        print("="*80)
        print(f"Programs: {', '.join(program_names)}")
        print("="*80)
        print()
        output_path = str(script_dir / "pareto_grid.pdf")
        create_pareto_grid(program_names, backend_dir, output_path)
    else:
        # Figure 1: default 10 programs
        print("="*80)
        print("Figure 1: Default selection (2x5)")
        print("="*80)
        print(f"Programs: {', '.join(DEFAULT_PROGRAMS)}")
        print("="*80)
        print()
        output_path = str(script_dir / "pareto_grid.pdf")
        create_pareto_grid(DEFAULT_PROGRAMS, backend_dir, output_path)

        # Figure 2: MiBench + wikisort + mont64
        print()
        print("="*80)
        print("Figure 2: MiBench + wikisort + mont64 (2x5)")
        print("="*80)
        print(f"Programs: {', '.join(MIBENCH_PLUS)}")
        print("="*80)
        print()
        output_path2 = str(script_dir / "pareto_grid_mibench.pdf")
        create_pareto_grid(MIBENCH_PLUS, backend_dir, output_path2)

    print()
    print("Complete!")


if __name__ == "__main__":
    main()
