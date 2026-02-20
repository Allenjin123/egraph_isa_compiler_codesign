#!/usr/bin/env python3
"""
Parse instruction counts from analysis results and generate CSV summary.
Shows number of unique instructions used in original vs minimal area variant,
broken down by category: Simple Arithmetic, Complex Arithmetic, Branch, Memory.

Usage:
    python parse_instruction_counts.py [output_csv]

Default output: instruction_counts.csv

● Here's the summary:                                                                                                                                                                                                                                   
                                      
  ┌───────────────┬──────────────┬───────────────┬───────────────┬─────────────┐                                                                                                                                                                        
  │   Category    │ Avg Original │ Avg Rewritten │ Avg Reduction │ % Reduction │                                                                                                                                                                        
  ├───────────────┼──────────────┼───────────────┼───────────────┼─────────────┤
  │ Simple Arith  │ 13.2         │ 8.5           │ -4.7          │ 35.7%       │                                                                                                                                                                        
  ├───────────────┼──────────────┼───────────────┼───────────────┼─────────────┤
  │ Complex Arith │ 1.5          │ 0.0           │ -1.5          │ 97.1%       │
  ├───────────────┼──────────────┼───────────────┼───────────────┼─────────────┤
  │ Branch        │ 7.8          │ 5.0           │ -2.8          │ 36.0%       │
  ├───────────────┼──────────────┼───────────────┼───────────────┼─────────────┤
  │ Memory        │ 3.7          │ 3.7           │ 0.0           │ 0.0%        │
  ├───────────────┼──────────────┼───────────────┼───────────────┼─────────────┤
  │ Total         │ 26.3         │ 17.2          │ -9.0          │ 34.4%       │
  └───────────────┴──────────────┴───────────────┴───────────────┴─────────────┘

  Key takeaways:
  - Complex Arith (mul/div) is nearly fully eliminated (97.1% reduction) — these get replaced by software emulation
  - Simple Arith and Branch reduce by ~36% each — the egraph rewriting finds equivalent programs using fewer instruction types
  - Memory instructions are untouched (0% reduction) — loads/stores cannot be substituted
  - Overall 34.4% reduction in unique instruction types (26.3 → 17.2 on average)


"""
# The numbers are back: avg 26.3 → 17.2 with 34.1% average reduction, vs the      
# incorrect 26.3 → 20.0 with 23.3% reduction from before.

import sys
import json
import csv
from pathlib import Path
from typing import Dict, List, Optional, Tuple
import scienceplots
# Add paths for imports
sys.path.insert(0, str(Path(__file__).parent))
import matplotlib.pyplot as plt
plt.style.use(['science', 'no-latex'])
import seaborn as sns
import numpy as np


# Instruction category definitions
COMPLEX_ARITH = {'mul', 'mulh', 'mulhsu', 'mulhu', 'div', 'divu', 'rem', 'remu'}
BRANCH = {'beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu', 'beqz', 'bnez', 'jal', 'jalr', 'ret'}
MEMORY = {'lb', 'lh', 'lw', 'lbu', 'lhu', 'sb', 'sh', 'sw'}
# Everything else is Simple Arithmetic

CATEGORIES = ['Simple Arith', 'Complex Arith', 'Branch', 'Memory']


def categorize_instructions(instruction_subset: List[str]) -> Dict[str, int]:
    """Categorize a list of unique instructions into 4 groups.

    Returns:
        Dict with keys from CATEGORIES and integer counts.
    """
    counts = {cat: 0 for cat in CATEGORIES}
    for instr in instruction_subset:
        if instr in COMPLEX_ARITH:
            counts['Complex Arith'] += 1
        elif instr in BRANCH:
            counts['Branch'] += 1
        elif instr in MEMORY:
            counts['Memory'] += 1
        else:
            counts['Simple Arith'] += 1
    return counts


def find_all_result_jsons(backend_dir: Path) -> List[Path]:
    """Find all analysis_results.json files in backend directory."""
    json_files = []

    if not backend_dir.exists():
        return json_files

    for program_dir in backend_dir.iterdir():
        if program_dir.is_dir():
            json_file = program_dir / "analysis_results.json"
            if json_file.exists():
                json_files.append(json_file)

    return sorted(json_files)


def parse_instruction_counts(json_path: Path) -> Optional[Dict]:
    """Parse instruction counts from a single analysis_results.json file."""
    try:
        with open(json_path, 'r') as f:
            data = json.load(f)

        program_name = data.get('program_name', 'unknown')
        variants = data.get('variants', [])

        if not variants:
            return None

        # Find original, min area variant, and min instruction variant
        original_data = None
        min_area_variant = None
        min_instr_variant = None

        for variant in variants:
            variant_id = variant['variant_id']
            constraint_type = variant.get('constraint_type', 'single')

            if variant_id == 'original' or constraint_type == 'original':
                original_data = variant
            else:
                if constraint_type not in ['gp', 'original']:
                    if min_area_variant is None or variant['area'] < min_area_variant['area']:
                        min_area_variant = variant
                    if min_instr_variant is None or variant['num_instructions'] < min_instr_variant['num_instructions']:
                        min_instr_variant = variant

        # Categorize instructions for original
        orig_cats = categorize_instructions(original_data['instruction_subset']) if original_data else None
        original_instr_count = original_data['num_instructions'] if original_data else None

        # Categorize instructions for min area variant
        min_area_cats = categorize_instructions(min_area_variant['instruction_subset']) if min_area_variant else None

        # Categorize instructions for min instruction variant
        min_instr_cats = categorize_instructions(min_instr_variant['instruction_subset']) if min_instr_variant else None

        summary = {
            'application': program_name,
            'original_num_instructions': original_instr_count,
            'original_cats': orig_cats,
            'min_area_variant': min_area_variant['variant_id'] if min_area_variant else None,
            'min_area_num_instructions': min_area_variant['num_instructions'] if min_area_variant else None,
            'min_area_cats': min_area_cats,
            'min_area_value': min_area_variant['area'] if min_area_variant else None,
            'min_area_latency': min_area_variant['latency'] if min_area_variant else None,
            'min_instr_variant': min_instr_variant['variant_id'] if min_instr_variant else None,
            'min_instr_count': min_instr_variant['num_instructions'] if min_instr_variant else None,
            'min_instr_cats': min_instr_cats,
            'min_instr_area': min_instr_variant['area'] if min_instr_variant else None,
            'min_instr_latency': min_instr_variant['latency'] if min_instr_variant else None,
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

    fieldnames = [
        'application',
        'original_num_instructions',
        'original_simple_arith',
        'original_complex_arith',
        'original_branch',
        'original_memory',
        'min_area_variant',
        'min_area_num_instructions',
        'min_area_simple_arith',
        'min_area_complex_arith',
        'min_area_branch',
        'min_area_memory',
        'min_area_value',
        'min_area_latency',
        'min_instr_variant',
        'min_instr_count',
        'min_instr_area',
        'min_instr_latency',
    ]

    rows = []
    for s in summaries:
        row = {
            'application': s['application'],
            'original_num_instructions': s['original_num_instructions'],
            'min_area_variant': s['min_area_variant'],
            'min_area_num_instructions': s['min_area_num_instructions'],
            'min_area_value': s['min_area_value'],
            'min_area_latency': s['min_area_latency'],
            'min_instr_variant': s['min_instr_variant'],
            'min_instr_count': s['min_instr_count'],
            'min_instr_area': s['min_instr_area'],
            'min_instr_latency': s['min_instr_latency'],
        }
        if s['original_cats']:
            row['original_simple_arith'] = s['original_cats']['Simple Arith']
            row['original_complex_arith'] = s['original_cats']['Complex Arith']
            row['original_branch'] = s['original_cats']['Branch']
            row['original_memory'] = s['original_cats']['Memory']
        if s['min_area_cats']:
            row['min_area_simple_arith'] = s['min_area_cats']['Simple Arith']
            row['min_area_complex_arith'] = s['min_area_cats']['Complex Arith']
            row['min_area_branch'] = s['min_area_cats']['Branch']
            row['min_area_memory'] = s['min_area_cats']['Memory']
        rows.append(row)

    with open(output_path, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

    print(f"CSV written to: {output_path}")
    print(f"Total programs: {len(summaries)}")


def visualize_results(summaries: List[Dict], output_path: str = "instruction_analysis.pdf"):
    """Create stacked bar chart of instruction counts by category.

    Each program gets two side-by-side bars (Original, Rewritten), each stacked
    by: Simple Arith, Complex Arith, Branch, Memory.
    """
    if not summaries:
        print("No data to visualize!")
        return

    sns.set_palette("Set2")

    NAME_MAPPING = {
        'basicmath_small_O3': 'basicmath',
        'bitcnts_O3': 'bitcnts',
        'dijkstra_small_O3': 'dijkstra',
        'matmult-int': 'matmult-int',
        'qsort_large_O3': 'qsort-num',
        'qsort_small_O3': 'qsort-str',
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
    }

    # Prepare data — use min_instr variant (fewest unique instructions) as in original script
    applications = [NAME_MAPPING.get(s['application'], s['application']) for s in summaries]
    orig_instr = [s['original_num_instructions'] for s in summaries]
    min_instr = [s['min_instr_count'] if s['min_instr_count'] else 0 for s in summaries]

    # Per-category counts for original
    orig_simple = [s['original_cats']['Simple Arith'] if s['original_cats'] else 0 for s in summaries]
    orig_complex = [s['original_cats']['Complex Arith'] if s['original_cats'] else 0 for s in summaries]
    orig_branch = [s['original_cats']['Branch'] if s['original_cats'] else 0 for s in summaries]
    orig_memory = [s['original_cats']['Memory'] if s['original_cats'] else 0 for s in summaries]

    # Per-category counts for min instruction variant
    rewr_simple = [s['min_instr_cats']['Simple Arith'] if s['min_instr_cats'] else 0 for s in summaries]
    rewr_complex = [s['min_instr_cats']['Complex Arith'] if s['min_instr_cats'] else 0 for s in summaries]
    rewr_branch = [s['min_instr_cats']['Branch'] if s['min_instr_cats'] else 0 for s in summaries]
    rewr_memory = [s['min_instr_cats']['Memory'] if s['min_instr_cats'] else 0 for s in summaries]

    # Fixed benchmark order: sorted by code-size blowup ratio (ascending),
    # shared across all plots so figures are consistent
    BENCHMARK_ORDER = [
        'qsort-str', 'sha', 'rijndael', 'statemate', 'huffbench',
        'nsichneu', 'md5sum', 'slre', 'patricia', 'primecount',
        'wikisort', 'picojpeg', 'combined', 'edn', 'bitcnts',
        'matmult-int', 'qsort-num', 'tarfind', 'ud', 'dijkstra',
        'mont64', 'basicmath',
    ]
    order_map = {name: i for i, name in enumerate(BENCHMARK_ORDER)}
    sorted_indices = sorted(range(len(applications)),
                            key=lambda i: order_map.get(applications[i], 999))
    applications = [applications[i] for i in sorted_indices]
    orig_instr = [orig_instr[i] for i in sorted_indices]
    min_instr = [min_instr[i] for i in sorted_indices]
    orig_simple = [orig_simple[i] for i in sorted_indices]
    orig_complex = [orig_complex[i] for i in sorted_indices]
    orig_branch = [orig_branch[i] for i in sorted_indices]
    orig_memory = [orig_memory[i] for i in sorted_indices]
    rewr_simple = [rewr_simple[i] for i in sorted_indices]
    rewr_complex = [rewr_complex[i] for i in sorted_indices]
    rewr_branch = [rewr_branch[i] for i in sorted_indices]
    rewr_memory = [rewr_memory[i] for i in sorted_indices]

    # Append "Average" at the end
    n = len(applications)
    applications.append('Average')
    avg = lambda lst: sum(lst) / len(lst)
    orig_instr.append(avg(orig_instr))
    min_instr.append(avg(min_instr))
    orig_simple.append(avg(orig_simple)); orig_complex.append(avg(orig_complex))
    orig_branch.append(avg(orig_branch)); orig_memory.append(avg(orig_memory))
    rewr_simple.append(avg(rewr_simple)); rewr_complex.append(avg(rewr_complex))
    rewr_branch.append(avg(rewr_branch)); rewr_memory.append(avg(rewr_memory))

    # Color = instruction category, Texture = original vs rewritten
    cat_colors = sns.color_palette("Set2", 4)
    ORIG_HATCH = ''        # solid fill for original
    REWR_HATCH = '///'     # hatched for rewritten

    fig, ax = plt.subplots(figsize=(16, 6))

    x = np.arange(len(applications))
    width = 0.35

    # --- Original bars (left, solid) ---
    orig_bottom = np.zeros(len(applications))
    orig_data = [orig_simple, orig_complex, orig_branch, orig_memory]

    for i, (cat_name, data) in enumerate(zip(CATEGORIES, orig_data)):
        ax.bar(x - width / 2, data, width, bottom=orig_bottom,
               color=cat_colors[i], hatch=ORIG_HATCH,
               edgecolor='black', linewidth=0.5, alpha=0.85,
               label=cat_name)
        orig_bottom += np.array(data)

    # --- Rewritten bars (right, hatched) ---
    rewr_bottom = np.zeros(len(applications))
    rewr_data = [rewr_simple, rewr_complex, rewr_branch, rewr_memory]

    for i, (cat_name, data) in enumerate(zip(CATEGORIES, rewr_data)):
        ax.bar(x + width / 2, data, width, bottom=rewr_bottom,
               color=cat_colors[i], hatch=REWR_HATCH,
               edgecolor='black', linewidth=0.5, alpha=0.85)
        rewr_bottom += np.array(data)

    # Vertical separator before Average
    ax.axvline(x=len(applications) - 1.5, color='black', linestyle='-', linewidth=0.8, alpha=0.4)

    # Configure axes
    ax.set_ylabel('Number of Unique Instructions', fontsize=16, fontweight='bold')
    ax.set_xticks(x)
    xlabels = ax.set_xticklabels(applications, rotation=45, ha='right', fontsize=14)
    xlabels[-1].set_fontweight('bold')
    ax.tick_params(axis='y', labelsize=14)
    ax.grid(axis='y', alpha=0.3, linestyle='--')

    # Build two-column legend (matplotlib ncol fills column-major):
    #   Column 1: Instruction types (4 color patches)
    #   Column 2: Original / Rewritten (2 texture patches + 2 blank spacers)
    from matplotlib.patches import Patch
    blank = Patch(facecolor='none', edgecolor='none', label=' ')
    col1 = [Patch(facecolor=cat_colors[i], edgecolor='black', linewidth=0.5,
                   label=CATEGORIES[i]) for i in range(4)]
    col2 = [Patch(facecolor='white', edgecolor='black', hatch=ORIG_HATCH,
                   linewidth=0.5, label='Original'),
            Patch(facecolor='white', edgecolor='black', hatch=REWR_HATCH,
                   linewidth=0.5, label='Rewritten'),
            blank, blank]
    # Column-major: first 4 items → col 1, next 4 → col 2
    ax.legend(handles=col1 + col2, loc='upper left',
              framealpha=0.9, fontsize=14, ncol=2)

    plt.tight_layout()
    plt.savefig(output_path, dpi=300, bbox_inches='tight')
    print(f"Visualization saved to: {output_path}")
    plt.close()

    # ---- Statistics ----
    print()
    print("=" * 80)
    print("Instruction Usage Statistics (for paper):")
    print("=" * 80)

    orig_valid = [o for o in orig_instr if o is not None]
    if orig_valid:
        print(f"Original Programs:")
        print(f"  Min instructions:     {min(orig_valid)}")
        print(f"  Max instructions:     {max(orig_valid)}")
        print(f"  Average instructions: {sum(orig_valid)/len(orig_valid):.1f}")

    min_instr_valid = [m for m in min_instr if m is not None and m > 0]
    if min_instr_valid:
        print(f"\nMin Instruction Variants:")
        print(f"  Min instructions:     {min(min_instr_valid)}")
        print(f"  Max instructions:     {max(min_instr_valid)}")
        print(f"  Average instructions: {sum(min_instr_valid)/len(min_instr_valid):.1f}")

    reductions = []
    for o, m in zip(orig_instr, min_instr):
        if o and m and o > 0:
            reductions.append(((o - m) / o) * 100)

    if reductions:
        print(f"\nInstruction Count Reduction (Original -> Min Instr):")
        print(f"  Min reduction:        {min(reductions):.1f}%")
        print(f"  Max reduction:        {max(reductions):.1f}%")
        print(f"  Average reduction:    {sum(reductions)/len(reductions):.1f}%")

    # Per-category summary
    print(f"\nPer-category breakdown (Original -> Min Instr):")
    print(f"  {'Category':<16} {'Avg Orig':>10} {'Avg Rewr':>10} {'Avg Diff':>10}")
    print(f"  {'-'*16} {'-'*10} {'-'*10} {'-'*10}")
    for cat, od, ad in zip(CATEGORIES,
                           [orig_simple, orig_complex, orig_branch, orig_memory],
                           [rewr_simple, rewr_complex, rewr_branch, rewr_memory]):
        avg_o = sum(od) / len(od)
        avg_a = sum(ad) / len(ad)
        print(f"  {cat:<16} {avg_o:>10.1f} {avg_a:>10.1f} {avg_a - avg_o:>+10.1f}")

    print("=" * 80)


def main():
    output_csv = sys.argv[1] if len(sys.argv) > 1 else "instruction_counts.csv"

    script_dir = Path(__file__).parent
    backend_dir = script_dir / "output" / "backend"
    frontend_dir = script_dir / "output" / "frontend"

    print("=" * 80)
    print("Parsing Instruction Counts from Analysis Results")
    print("=" * 80)
    print(f"Backend directory: {backend_dir}")
    print(f"Output CSV: {output_csv}")
    print("=" * 80)
    print()

    json_files = find_all_result_jsons(backend_dir)
    print(f"Found {len(json_files)} analysis result files")
    print()

    summaries = []
    for json_path in json_files:
        program_name = json_path.parent.name
        print(f"Parsing {program_name}...", end=" ")

        summary = parse_instruction_counts(json_path)
        if summary:
            summaries.append(summary)
            print("OK")
        else:
            print("(skipped)")

    print()

    generate_csv(summaries, output_csv)

    print()

    plot_path = output_csv.replace('.csv', '.pdf')
    visualize_results(summaries, plot_path)

    print()
    print("Analysis complete!")


if __name__ == "__main__":
    main()
