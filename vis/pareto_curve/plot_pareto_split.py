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


def extract_variants(data: Dict):
    baseline_areas, baseline_latencies = [], []
    uarchaware_areas, uarchaware_latencies = [], []
    single_areas, single_latencies = [], []
    original_area = original_latency = None
    gp_area = gp_latency = None

    for variant in data.get('variants', []):
        variant_id = variant['variant_id']
        constraint_type = variant.get('constraint_type', 'single')
        area = variant['area']
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
                        row: int, col: int, n_rows: int = 2, n_cols: int = 4):
    v = extract_variants(data)

    if v['baseline_areas']:
        ax.scatter(v['baseline_areas'], v['baseline_latencies'], color='blue',
                   marker='o', label='aeSIP: ISA level constraint',
                   alpha=0.6, s=100, zorder=3)

    if v['uarchaware_areas']:
        ax.scatter(v['uarchaware_areas'], v['uarchaware_latencies'], color='green',
                   marker='^', label='aeSIP: uarch aware constraint',
                   alpha=0.6, s=100, zorder=3)

    if v['gp_area'] is not None:
        ax.scatter([v['gp_area']], [v['gp_latency']], color='orange', marker='s',
                   label='Baseline Ibex (RV32IM)', s=300,
                   edgecolors='black', linewidths=1.5, zorder=10)

    if v['original_area'] is not None:
        ax.scatter([v['original_area']], [v['original_latency']], color='red',
                   marker='*', label='PDAG', s=400,
                   edgecolors='black', linewidths=1.5, zorder=15)

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
                   facecolors='none', edgecolors='red', s=200,
                   linewidths=2, zorder=5, label='Pareto frontier')

    if row == n_rows - 1:
        ax.set_xlabel(r'Area ($\mu m^2$)', fontsize=32, fontproperties=BOLD_FP)
    if col == 0:
        ax.set_ylabel('Latency (s)', fontsize=32, fontproperties=BOLD_FP)

    ax.set_title(program_name, fontsize=32, fontproperties=BOLD_FP)
    ax.grid(True, alpha=0.3)
    ax.tick_params(labelsize=32)
    ax.locator_params(axis='x', nbins=4)
    ax.locator_params(axis='y', nbins=4)


# ── Embench: aggregated subplot ──────────────────────────────────────────────

# Distinct markers so benchmarks are distinguishable beyond colour alone
_MARKERS = ['o', 's', '^', 'D', 'v', '<', '>', 'p', 'h', 'P', 'X', 'd', '8', 'H']

def plot_embench_aggregate(ax, backend_dir: Path):
    import matplotlib.colors as mcolors

    # 14 well-separated colours: combine tab10 + Set2 for variety
    base_colors = (list(plt.cm.tab10.colors[:10])
                   + list(plt.cm.Set2.colors[:4]))
    base_colors = base_colors[:len(EMBENCH_PROGRAMS)]

    for idx, pname in enumerate(EMBENCH_PROGRAMS):
        data = load_program_results(pname, backend_dir)
        if data is None:
            continue

        v = extract_variants(data)
        display = NAME_MAPPING.get(pname, pname)
        color = base_colors[idx]
        marker = _MARKERS[idx % len(_MARKERS)]

        bench_areas = v['baseline_areas'] + v['uarchaware_areas'] + v['single_areas']
        bench_lats = v['baseline_latencies'] + v['uarchaware_latencies'] + v['single_latencies']
        if v['original_area'] is not None:
            bench_areas.append(v['original_area'])
            bench_lats.append(v['original_latency'])
        if v['gp_area'] is not None:
            bench_areas.append(v['gp_area'])
            bench_lats.append(v['gp_latency'])

        if not bench_areas:
            continue

        # Per-benchmark Pareto frontier (only frontier shown, no background scatter)
        pareto_idx = find_pareto_frontier(bench_areas, bench_lats)
        if len(pareto_idx) == 1:
            # Single optimal point — emphasise with a larger marker
            pi = pareto_idx[0]
            ax.scatter([bench_areas[pi]], [bench_lats[pi]], color=color,
                       marker=marker, s=200, edgecolors='black', linewidths=0.8,
                       zorder=6, label=display)
        elif len(pareto_idx) > 1:
            # Sort frontier by area, connect with line + markers
            sorted_frontier = sorted(pareto_idx, key=lambda i: bench_areas[i])
            fa = [bench_areas[i] for i in sorted_frontier]
            fl = [bench_lats[i] for i in sorted_frontier]
            ax.plot(fa, fl, color=color, linewidth=0.8, alpha=0.35,
                    zorder=4)
            ax.scatter(fa, fl, color=color, marker=marker, s=120,
                       edgecolors='black', linewidths=0.6, zorder=6,
                       label=display)

    ax.set_xlabel(r'Area ($\mu m^2$)', fontsize=32, fontproperties=BOLD_FP)
    ax.set_ylabel('Latency (s)', fontsize=32, fontproperties=BOLD_FP)
    ax.set_title('Embench-IoT', fontsize=32, fontproperties=BOLD_FP)
    ax.set_yscale('log')
    ax.grid(True, alpha=0.3, which='both')
    ax.tick_params(labelsize=24)
    ax.locator_params(axis='x', nbins=5)
    ax.legend(loc='upper right', fontsize=14, framealpha=0.9, ncol=2,
              handletextpad=0.3, columnspacing=0.6, markerscale=0.8,
              borderpad=0.3, labelspacing=0.3)


# ── main ─────────────────────────────────────────────────────────────────────

def main():
    script_dir = Path(__file__).resolve().parent
    project_root = script_dir.parent.parent
    backend_dir = project_root / "output" / "backend"
    output_path = str(script_dir / "pareto_split.pdf")

    # GridSpec: 2 rows x 11 columns
    #   MiBench  : cols 0-1, 2-3, 4-5, 6-7  (4 subplots per row)
    #   Embench  : cols 8-10 spanning both rows
    fig = plt.figure(figsize=(55, 12))
    gs = gridspec.GridSpec(2, 11, figure=fig, wspace=0.35, hspace=0.35)

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
        plot_mibench_single(ax, data, display, r, c)
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
               loc='upper center', bbox_to_anchor=(0.36, 1.0),
               ncol=len(by_label), fontsize=28, framealpha=0.9)

    # ── Embench aggregated (right, spanning both rows) ──
    ax_embench = fig.add_subplot(gs[:, 8:])
    plot_embench_aggregate(ax_embench, backend_dir)

    plt.savefig(output_path, dpi=300, bbox_inches='tight')
    print(f"Combined figure saved to: {output_path}")
    plt.close()

    print("Complete!")


if __name__ == "__main__":
    main()
