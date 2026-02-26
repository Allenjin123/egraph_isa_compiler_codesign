#!/usr/bin/env python3
"""
Create 2x5 grid of Pareto frontier plots using RTL simulation data.

Computes actual latency = cycles / (frequency * 1e6), where:
  - cycles come from RTL simulation (sim_results.csv)
  - frequency (MHz) comes from synthesis (analysis_results.json)

Usage:
    python plot_pareto_grid_rtl.py [program1] ... [program10]

If no programs specified, will use default 10 programs.
"""

import sys
import json
import csv
import matplotlib.pyplot as plt
import scienceplots
from pathlib import Path
from typing import List, Dict, Optional, Tuple
from collections import defaultdict

plt.style.use(['science', 'no-latex'])


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


def load_sim_results(csv_path: Path) -> Dict[str, Dict[str, int]]:
    """Load RTL simulation cycles from CSV.

    Returns: {benchmark: {variant_key: cycles}}
    where variant_key is 'original', 'gp', or '0'..'26'
    """
    results = defaultdict(dict)
    with open(csv_path, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            if row['status'] != 'PASS':
                continue
            bench = row['benchmark']
            vdir = row['variant_dir']  # e.g. variant_original, variant_gp, variant_0
            key = vdir.replace('variant_', '')
            results[bench][key] = int(row['cycles'])
    return dict(results)


def load_json_variants(backend_dir: Path, program_name: str) -> Optional[Dict]:
    """Load area data from analysis_results.json."""
    json_path = backend_dir / program_name / "analysis_results.json"
    if not json_path.exists():
        return None
    with open(json_path, 'r') as f:
        return json.load(f)


def plot_pareto_single(ax, json_data: Dict, sim_cycles: Dict[str, int],
                       program_name: str, subplot_idx: int,
                       n_cols: int = 5, n_rows: int = 2):
    """Plot Pareto frontier for a single program: area vs latency.

    Latency = cycles / (frequency_MHz * 1e6), where cycles come from RTL
    simulation and frequency comes from synthesis results.
    """

    variants = json_data.get('variants', [])
    if not variants:
        return

    # Group JSON variants by number prefix
    baseline_points = []   # (area, latency)
    uarchaware_points = []
    original_point = None
    gp_point = None

    for v in variants:
        vid = v['variant_id']
        ctype = v.get('constraint_type', 'single')
        area = v['area']
        freq_mhz = v.get('frequency', 0)

        if freq_mhz <= 0:
            continue

        if vid == 'original' or ctype == 'original':
            if 'original' in sim_cycles:
                latency = sim_cycles['original'] / (freq_mhz * 1e6)
                original_point = (area, latency)
        elif vid == 'gp' or ctype == 'gp':
            if 'gp' in sim_cycles:
                latency = sim_cycles['gp'] / (freq_mhz * 1e6)
                gp_point = (area, latency)
        else:
            # Extract number prefix: e.g. '0_baseline' -> '0'
            num = vid.split('_')[0]
            if num in sim_cycles:
                latency = sim_cycles[num] / (freq_mhz * 1e6)
                point = (area, latency)
                if ctype == 'baseline':
                    baseline_points.append(point)
                elif ctype == 'uarchaware':
                    uarchaware_points.append(point)
                else:
                    baseline_points.append(point)

    # Plot (order matters: PDAG last so it's on top)
    if baseline_points:
        ba, bl = zip(*baseline_points)
        ax.scatter(ba, bl, color='blue', marker='o',
                   label='aeSIP: ISA level constraint', alpha=0.6, s=100, zorder=3)

    if uarchaware_points:
        ua, ul = zip(*uarchaware_points)
        ax.scatter(ua, ul, color='green', marker='^',
                   label='aeSIP: uarch aware constraint', alpha=0.6, s=100, zorder=3)

    if gp_point:
        ax.scatter([gp_point[0]], [gp_point[1]], color='orange', marker='s',
                   label='Baseline Ibex (RV32IM)', s=300, edgecolors='black',
                   linewidths=1.5, zorder=10)

    if original_point:
        ax.scatter([original_point[0]], [original_point[1]], color='red', marker='*',
                   label='PDAG', s=400, edgecolors='black', linewidths=1.5, zorder=15)

    # Compute Pareto frontier across all points
    all_points = baseline_points + uarchaware_points
    if original_point:
        all_points.append(original_point)
    if gp_point:
        all_points.append(gp_point)

    pareto_front = []
    for i, (ai, li) in enumerate(all_points):
        dominated = False
        for j, (aj, lj) in enumerate(all_points):
            if i != j:
                if (aj <= ai and lj < li) or (aj < ai and lj <= li):
                    dominated = True
                    break
        if not dominated:
            pareto_front.append((ai, li))

    if pareto_front:
        pa, pl = zip(*pareto_front)
        ax.scatter(pa, pl, facecolors='none', edgecolors='red',
                   s=200, linewidths=2, zorder=5, label='Pareto frontier')

    # Axis labels based on grid position
    row = subplot_idx // n_cols
    col = subplot_idx % n_cols

    if row == n_rows - 1:
        ax.set_xlabel(r'Area ($\mu m^2$)', fontsize=32, fontweight='bold')
    if col == 0:
        ax.set_ylabel('Latency (s)', fontsize=32, fontweight='bold')

    ax.set_title(program_name, fontsize=32, fontweight='bold')
    ax.grid(True, alpha=0.3)
    ax.tick_params(labelsize=32)
    ax.locator_params(axis='x', nbins=4)
    ax.locator_params(axis='y', nbins=4)


def create_pareto_grid(program_names: List[str], backend_dir: Path,
                       sim_data: Dict, output_path: str):
    """Create 2x5 grid of Pareto frontier plots."""
    N_ROWS, N_COLS = 2, 5

    program_data = []
    for pname in program_names[:N_ROWS * N_COLS]:
        json_data = load_json_variants(backend_dir, pname)
        sim_cycles = sim_data.get(pname, {})
        if json_data and sim_cycles:
            display_name = NAME_MAPPING.get(pname, pname)
            program_data.append((display_name, json_data, sim_cycles))
        else:
            print(f"  Skipping {pname}: json={'OK' if json_data else 'MISSING'}, "
                  f"sim={'OK' if sim_cycles else 'MISSING'}")

    if not program_data:
        print("No valid program data found!")
        return

    fig, axes = plt.subplots(N_ROWS, N_COLS, figsize=(40, 12))
    axes = axes.flatten()

    for idx, (pname, json_data, sim_cycles) in enumerate(program_data):
        plot_pareto_single(axes[idx], json_data, sim_cycles, pname, idx,
                           n_cols=N_COLS, n_rows=N_ROWS)

    # Hide unused subplots
    for idx in range(len(program_data), N_ROWS * N_COLS):
        axes[idx].axis('off')

    # Shared legend
    handles, labels = axes[0].get_legend_handles_labels()
    by_label = dict(zip(labels, handles))
    fig.legend(by_label.values(), by_label.keys(),
               loc='upper center', bbox_to_anchor=(0.5, 1.0),
               ncol=len(by_label), fontsize=32, framealpha=0.9)

    plt.tight_layout(rect=[0, 0, 1, 0.92])

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
    csv_path = project_root / "sim_results.csv"

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

    sim_data = load_sim_results(csv_path)
    print(f"Loaded RTL data for {len(sim_data)} benchmarks")
    print()

    if len(sys.argv) > 1:
        program_names = sys.argv[1:11]
        print("=" * 80)
        print("Creating Pareto Frontier Grid (2x5) — RTL Simulation")
        print("=" * 80)
        print(f"Programs: {', '.join(program_names)}")
        print("=" * 80)
        print()
        output_path = str(script_dir / "pareto_grid_rtl.pdf")
        create_pareto_grid(program_names, backend_dir, sim_data, output_path)
    else:
        # Figure 1: default 10 programs
        print("=" * 80)
        print("Figure 1: Default selection (2x5) — RTL Simulation")
        print("=" * 80)
        print(f"Programs: {', '.join(DEFAULT_PROGRAMS)}")
        print("=" * 80)
        print()
        output_path = str(script_dir / "pareto_grid_rtl.pdf")
        create_pareto_grid(DEFAULT_PROGRAMS, backend_dir, sim_data, output_path)

        # Figure 2: MiBench + wikisort + mont64
        print()
        print("=" * 80)
        print("Figure 2: MiBench + wikisort + mont64 (2x5) — RTL Simulation")
        print("=" * 80)
        print(f"Programs: {', '.join(MIBENCH_PLUS)}")
        print("=" * 80)
        print()
        output_path2 = str(script_dir / "pareto_grid_rtl_mibench.pdf")
        create_pareto_grid(MIBENCH_PLUS, backend_dir, sim_data, output_path2)

    print()
    print("Complete!")


if __name__ == "__main__":
    main()
