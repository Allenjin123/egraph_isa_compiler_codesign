#!/usr/bin/env python3
"""
Single figure with MiBench 2x4 grid + Embench aggregated side by side.

Layout (GridSpec 2 rows x 11 cols):
  - Columns 0–7  (2x4): one subplot per MiBench benchmark
  - Columns 8–10 (2-row span): aggregated Embench-IoT plot,
    each benchmark in a different colour.

Usage:
    python plot_pareto_split.py
"""

import sys
import json
import csv
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
import scienceplots
import numpy as np
from pathlib import Path
from typing import List, Dict, Optional
from matplotlib.font_manager import FontProperties

plt.style.use(['science', 'no-latex'])

BOLD_FP = FontProperties(family='DejaVu Serif', weight='bold')

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

MIBENCH_PROGRAMS = [
    'basicmath_small_O3',
    'bitcnts_O3',
    'dijkstra_small_O3',
    'patricia_O3',
    'qsort_large_O3',
    'qsort_small_O3',
    'rijndael_Oz',
    'sha_O3',
]

EMBENCH_PROGRAMS = [
    'combined',
    'libedn',
    'libhuffbench',
    'matmult-int',
    'md5',
    'mont64',
    'libnsichneu',
    'picojpeg_test',
    'primecount',
    'libslre',
    'libstatemate',
    'tarfind',
    'libud',
    'libwikisort',
]


def load_sim_results(csv_path: Path) -> Dict:
    """Load RTL simulation cycle counts from sim_results.csv.

    Returns dict keyed by (benchmark, variant_key) -> cycles.
    variant_key is 'original', 'gp', '0', '1', etc.
    """
    sim_cycles = {}
    if not csv_path.exists():
        print(f"Warning: sim_results.csv not found at {csv_path}")
        return sim_cycles
    with open(csv_path, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            benchmark = row['benchmark']
            variant_dir = row['variant_dir']
            if row['status'] != 'PASS':
                continue
            variant_key = variant_dir.replace('variant_', '', 1)
            sim_cycles[(benchmark, variant_key)] = int(row['cycles'])
    return sim_cycles


def _variant_id_to_sim_key(variant_id: str) -> str:
    """Map JSON variant_id to sim_results variant_key.

    'original' -> 'original', 'gp' -> 'gp', '0_baseline' -> '0', '3_uarchaware' -> '3'
    """
    if variant_id in ('original', 'gp'):
        return variant_id
    return variant_id.split('_', 1)[0]


def load_program_results(program_name: str, backend_dir: Path) -> Optional[Dict]:
    json_path = backend_dir / program_name / "analysis_results.json"
    if not json_path.exists():
        return None
    try:
        with open(json_path, 'r') as f:
            return json.load(f)
    except Exception as e:
        print(f"Error loading {program_name}: {e}")
        return None


def extract_variants(data: Dict, sim_cycles: Dict = None):
    """Extract variant areas and latencies.

    If sim_cycles is provided, latency is recomputed as sim_cycles / frequency
    (wall-clock time from RTL simulation).  Otherwise falls back to JSON latency.
    """
    program_name = data.get('program_name', '')

    baseline_areas, baseline_latencies = [], []
    uarchaware_areas, uarchaware_latencies = [], []
    single_areas, single_latencies = [], []
    original_area = original_latency = None
    gp_area = gp_latency = None

    for variant in data.get('variants', []):
        variant_id = variant['variant_id']
        constraint_type = variant.get('constraint_type', 'single')
        area = variant['area']
        freq = variant['frequency']  # MHz

        # Compute latency from sim cycles if available
        if sim_cycles is not None:
            sim_key = (program_name, _variant_id_to_sim_key(variant_id))
            cyc = sim_cycles.get(sim_key)
            if cyc is not None and freq > 0:
                latency = cyc / (freq * 1e6)
            else:
                latency = variant['latency']  # fallback
        else:
            latency = variant['latency']

        if variant_id == 'original' or constraint_type == 'original':
            original_area, original_latency = area, latency
        elif variant_id == 'gp' or constraint_type == 'gp':
            gp_area, gp_latency = area, latency
        elif constraint_type == 'baseline':
            baseline_areas.append(area)
            baseline_latencies.append(latency)
        elif constraint_type == 'uarchaware':
            uarchaware_areas.append(area)
            uarchaware_latencies.append(latency)
        else:
            single_areas.append(area)
            single_latencies.append(latency)

    return dict(
        baseline_areas=baseline_areas, baseline_latencies=baseline_latencies,
        uarchaware_areas=uarchaware_areas, uarchaware_latencies=uarchaware_latencies,
        single_areas=single_areas, single_latencies=single_latencies,
        original_area=original_area, original_latency=original_latency,
        gp_area=gp_area, gp_latency=gp_latency,
    )


def find_pareto_frontier(areas, latencies):
    pareto = []
    for i in range(len(areas)):
        dominated = False
        for j in range(len(areas)):
            if i != j:
                if (areas[j] <= areas[i] and latencies[j] < latencies[i]) or \
                   (areas[j] < areas[i] and latencies[j] <= latencies[i]):
                    dominated = True
                    break
        if not dominated:
            pareto.append(i)
    return pareto


# ── MiBench: single-benchmark subplot ────────────────────────────────────────

def plot_mibench_single(ax, data: Dict, program_name: str,
                        row: int, col: int, n_rows: int = 2, n_cols: int = 4,
                        sim_cycles: Dict = None):
    v = extract_variants(data, sim_cycles=sim_cycles)

    if v['baseline_areas']:
        ax.scatter(v['baseline_areas'], v['baseline_latencies'], color='blue',
                   marker='o', label='aeSIP: ISA level constraint',
                   alpha=0.6, s=30, zorder=3)

    if v['uarchaware_areas']:
        ax.scatter(v['uarchaware_areas'], v['uarchaware_latencies'], color='green',
                   marker='^', label='aeSIP: uarch aware constraint',
                   alpha=0.6, s=30, zorder=3)

    if v['gp_area'] is not None:
        ax.scatter([v['gp_area']], [v['gp_latency']], color='orange', marker='s',
                   label='Baseline Ibex (RV32IM)', s=80,
                   edgecolors='black', linewidths=1, zorder=10)

    if v['original_area'] is not None:
        ax.scatter([v['original_area']], [v['original_latency']], color='red',
                   marker='*', label='PDAG', s=120,
                   edgecolors='black', linewidths=1, zorder=15)

    # Pareto frontier
    all_a = v['baseline_areas'] + v['uarchaware_areas'] + v['single_areas']
    all_l = v['baseline_latencies'] + v['uarchaware_latencies'] + v['single_latencies']
    if v['original_area']:
        all_a.append(v['original_area']); all_l.append(v['original_latency'])
    if v['gp_area']:
        all_a.append(v['gp_area']); all_l.append(v['gp_latency'])

    pareto_idx = find_pareto_frontier(all_a, all_l)
    if pareto_idx:
        ax.scatter([all_a[i] for i in pareto_idx],
                   [all_l[i] for i in pareto_idx],
                   facecolors='none', edgecolors='red', s=60,
                   linewidths=1.5, zorder=5, label='Pareto frontier')

    if row == n_rows - 1:
        ax.set_xlabel(r'Area ($\mu m^2$)', fontsize=16, fontproperties=BOLD_FP)
    if col == 0:
        ax.set_ylabel('Latency (s)', fontsize=16, fontproperties=BOLD_FP)

    ax.set_title(program_name, fontsize=26, fontproperties=BOLD_FP)
    ax.grid(True, alpha=0.3)
    ax.tick_params(labelsize=18)
    ax.locator_params(axis='x', nbins=4)
    ax.locator_params(axis='y', nbins=4)


# ── Embench: bar plot of area reduction at different latency budgets ──────────

LATENCY_BUDGETS = [1.0, 1.2, 5.0, 10.0]

def plot_embench_aggregate(ax, backend_dir: Path, sim_cycles: Dict = None):
    """Bar plot: x = relative latency budget, y = geomean area reduction vs PDAG.

    For each latency budget, find the minimum-area aeSIP variant per benchmark
    whose latency <= budget * gp_latency, compute area reduction vs PDAG,
    then take geomean across benchmarks.  An extra "Uncon." bar shows the
    best achievable area reduction with no latency constraint.
    """
    import seaborn as sns
    sns.set_palette("Set2")

    # Per-benchmark data
    bench_data = []

    for pname in EMBENCH_PROGRAMS:
        data = load_program_results(pname, backend_dir)
        if data is None:
            continue
        v = extract_variants(data, sim_cycles=sim_cycles)
        if v['gp_area'] is None or v['gp_latency'] is None:
            continue
        if v['original_area'] is None:
            continue

        pdag_area = v['original_area']
        gp_area = v['gp_area']
        gp_lat = v['gp_latency']

        var_areas = v['baseline_areas'] + v['uarchaware_areas']
        var_lats = v['baseline_latencies'] + v['uarchaware_latencies']
        variants = list(zip(var_areas, var_lats))

        bench_data.append((pdag_area, gp_area, gp_lat, variants))

    if not bench_data:
        return

    def _geomean_reduction(reductions):
        arr = np.array(reductions)
        if np.all(arr == 0):
            return 0
        return np.exp(np.mean(np.log(arr + 1))) - 1

    # Budgeted bars — collect per-benchmark reductions for geomean + error bars
    all_reductions = []  # list of lists, one per budget
    geomean_reductions = []
    for budget in LATENCY_BUDGETS:
        reductions = []
        for pdag_area, gp_area, gp_lat, variants in bench_data:
            lat_limit = budget * gp_lat
            feasible = [(a, l) for a, l in variants if l <= lat_limit]
            if feasible:
                best_area = min(a for a, l in feasible)
            else:
                best_area = pdag_area
            reduction = (pdag_area - best_area) / pdag_area * 100
            reductions.append(max(reduction, 0))
        all_reductions.append(reductions)
        geomean_reductions.append(_geomean_reduction(reductions))

    # Unconstrained bar (no latency limit)
    reductions_unc = []
    for pdag_area, gp_area, gp_lat, variants in bench_data:
        if variants:
            best_area = min(a for a, l in variants)
        else:
            best_area = pdag_area
        reduction = (pdag_area - best_area) / pdag_area * 100
        reductions_unc.append(max(reduction, 0))
    all_reductions.append(reductions_unc)
    geomean_reductions.append(_geomean_reduction(reductions_unc))

    # Error bars: min and max reduction across benchmarks
    err_low = [gm - min(reds) for gm, reds in zip(geomean_reductions, all_reductions)]
    err_high = [max(reds) - gm for gm, reds in zip(geomean_reductions, all_reductions)]

    # Labels
    labels = [f'{b:.2g}x' for b in LATENCY_BUDGETS] + ['Uncon.']
    n = len(labels)
    x = np.arange(n)

    colors = [sns.color_palette("Set2")[0]] * len(LATENCY_BUDGETS) + \
             [sns.color_palette("Set2")[1]]

    YLIM = 20  # cap y-axis at 20%

    bars = ax.bar(x, geomean_reductions, width=0.6, yerr=[err_low, err_high],
                  capsize=4, error_kw=dict(lw=1.2, capthick=1.2),
                  color=colors, edgecolor='black', linewidth=0.6, alpha=0.85)

    # Geomean label just above the bar top; max value at ylim if error bar exceeds it
    for bar, val, reds in zip(bars, geomean_reductions, all_reductions):
        bx = bar.get_x() + bar.get_width() / 2
        if val > 0:
            ax.text(bx, val + 0.4, f'{val:.1f}%',
                    ha='center', va='bottom', fontsize=14, fontweight='bold')
        max_red = max(reds)
        if max_red > YLIM:
            ax.text(bx, YLIM - 0.3, f'{max_red:.0f}%',
                    ha='center', va='top', fontsize=11, fontstyle='italic')

    # Separator before unconstrained
    ax.axvline(x=n - 1.5, color='black', linestyle='-', linewidth=0.8, alpha=0.4)

    ax.set_ylim(0, YLIM)
    ax.set_xticks(x)
    ax.set_xticklabels(labels, fontsize=18)
    ax.set_xlabel('Normalised Latency', fontsize=16,
                  fontproperties=BOLD_FP)
    ax.set_ylabel('Area Reduction vs PDAG (%)', fontsize=16,
                  fontproperties=BOLD_FP)
    ax.set_title('Embench-IoT', fontsize=26, fontproperties=BOLD_FP)
    ax.tick_params(axis='y', labelsize=18)
    ax.grid(axis='y', alpha=0.3, linestyle='--')


# ── main ─────────────────────────────────────────────────────────────────────

def main():
    script_dir = Path(__file__).resolve().parent
    project_root = script_dir.parent.parent
    backend_dir = project_root / "output_m1_final" / "backend"
    sim_csv_path = project_root / "sim_results.csv"
    output_path = str(script_dir / "pareto_split_sim.pdf")

    # Load RTL simulation cycle counts
    sim_cycles = load_sim_results(sim_csv_path)
    print(f"Loaded {len(sim_cycles)} sim cycle entries from {sim_csv_path}")

    # GridSpec: 2 rows x 10 columns
    #   MiBench  : cols 0-1, 2-3, 4-5, 6-7  (4 subplots per row)
    #   Embench  : cols 8-9 spanning both rows
    fig = plt.figure(figsize=(28, 7))
    # 11 columns: 0-7 MiBench (2 cols each), 8 spacer, 9-10 Embench
    gs = gridspec.GridSpec(2, 11, figure=fig,
                           width_ratios=[1,1,1,1,1,1,1,1, 0.5, 1,1],
                           wspace=0.35, hspace=0.35)

    # ── MiBench 2x4 grid ──
    mibench_axes = []
    for r in range(2):
        for c in range(4):
            ax = fig.add_subplot(gs[r, c * 2 : c * 2 + 2])
            mibench_axes.append((r, c, ax))

    plotted = 0
    for i, pname in enumerate(MIBENCH_PROGRAMS):
        data = load_program_results(pname, backend_dir)
        if data is None:
            continue
        if i >= len(mibench_axes):
            break
        r, c, ax = mibench_axes[i]
        display = NAME_MAPPING.get(pname, pname)
        plot_mibench_single(ax, data, display, r, c, sim_cycles=sim_cycles)
        plotted += 1

    # Hide unused MiBench subplots
    for j in range(plotted, len(mibench_axes)):
        _, _, ax = mibench_axes[j]
        ax.axis('off')

    # Shared MiBench legend (from first subplot)
    _, _, first_ax = mibench_axes[0]
    handles, labels = first_ax.get_legend_handles_labels()
    by_label = dict(zip(labels, handles))
    # Place legend above the MiBench columns only (centre of cols 0-7 ≈ x=0.36)
    fig.legend(by_label.values(), by_label.keys(),
               loc='upper center', bbox_to_anchor=(0.42, 1.0),
               ncol=len(by_label), fontsize=18, framealpha=0.9)

    # ── Embench aggregated (right, spanning both rows) ──
    ax_embench = fig.add_subplot(gs[:, 9:11])
    plot_embench_aggregate(ax_embench, backend_dir, sim_cycles=sim_cycles)

    plt.savefig(output_path, dpi=300, bbox_inches='tight')
    print(f"Combined figure saved to: {output_path}")
    plt.close()

    print("Complete!")


if __name__ == "__main__":
    main()
