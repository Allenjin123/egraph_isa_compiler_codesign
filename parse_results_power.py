#!/usr/bin/env python3
"""
Parse analysis results from all programs and generate CSV summary with
analytical power and energy estimates, including frequency DSE.

All metrics are normalized to the original program (original = 1.0).

Each variant runs at its max synthesized frequency (optimal for energy).
Power model with separate dynamic/static scaling:
  Dynamic power: P_dyn(f) = dyn_frac * [1 - (2/3)*(1 - area_norm)] * (f/f_ref)
    (2/3 rule accounts for non-scaling overhead like clock tree, I/O)
  Static power:  P_static  = static_frac * area_norm
    (leakage scales exactly with area / transistor count)
  Total: P(f) = P_dyn(f) + P_static

Energy model:
  energy_norm = power(f) * cycle_norm / freq_norm
  where freq_norm = f / original_freq, cycle_norm = variant_cycles / original_cycles

Two modes produce separate CSVs:
  Mode 1: 99% dynamic, 1% static  → *_m1.csv
  Mode 2: 1% dynamic, 99% static  → *_m2.csv

Usage:
    python parse_results_power.py [output_base]

Default output: results_summary_power_m1.csv, results_summary_power_m2.csv
"""

import sys
import json
import csv
import math
from pathlib import Path
from typing import Dict, List, Optional, Tuple

# Latency constraints: variant wall-clock time <= factor * original wall-clock time
# float('inf') = unconstrained (no latency limit)
LATENCY_CONSTRAINTS = [1.0, 1.2, 1.5, 2.0, float('inf')]


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


def compute_cycles(latency, freq):
    """Compute cycle count from latency (seconds) and frequency (MHz)."""
    if latency is not None and freq is not None:
        return latency * freq * 1e6
    return None


def compute_dynamic_power_base(area_norm):
    """Dynamic power scaling from area (2/3 rule): accounts for non-scaling overhead."""
    if area_norm is not None:
        return 1.0 - (2.0 / 3.0) * (1.0 - area_norm)
    return None


def constraint_label(cf):
    """Human-readable label for a latency constraint factor."""
    if math.isinf(cf):
        return "unconstrained"
    return f"{cf:.1f}x"


def parse_all_variants(json_path: Path):
    """Parse JSON and return (program_name, original_data, candidates)."""
    try:
        with open(json_path, 'r') as f:
            data = json.load(f)

        program_name = data.get('program_name', 'unknown')
        variants = data.get('variants', [])

        if not variants:
            return None

        original_data = None
        candidates = []

        for variant in variants:
            variant_id = variant['variant_id']
            constraint_type = variant.get('constraint_type', 'single')

            if variant_id == 'original' or constraint_type == 'original':
                original_data = variant
            elif constraint_type not in ['gp', 'original']:
                candidates.append(variant)

        if not original_data:
            return None

        return (program_name, original_data, candidates)

    except Exception as e:
        print(f"Error parsing {json_path}: {e}", file=sys.stderr)
        return None


def compute_summary(program_name: str, original: Dict, candidates: List[Dict],
                    dyn_frac: float) -> Dict:
    """Compute summary for a given power mode (dyn_frac)."""
    original_area = original['area']
    original_freq = original['frequency']
    original_latency = original['latency']
    original_cycles = compute_cycles(original_latency, original_freq)
    f_ref = original_freq

    def safe_div(a, b):
        if a is not None and b is not None and b != 0:
            return a / b
        return None

    # Pre-compute per-variant metrics, including original as a candidate
    # so the optimizer can always choose "don't optimize" if no variant helps
    enriched = []

    # Add original itself (all norms = 1.0)
    enriched.append({
        'variant': {'variant_id': 'original'},
        'area_norm': 1.0,
        'cycle_norm': 1.0,
        'dyn_power_base': 1.0,
        'variant_freq': original_freq,
    })

    for v in candidates:
        v_freq = v['frequency']
        v_cycles = compute_cycles(v['latency'], v['frequency'])

        area_norm = safe_div(v['area'], original_area)
        cycle_norm = safe_div(v_cycles, original_cycles)
        dyn_power_base = compute_dynamic_power_base(area_norm)

        if area_norm is None or cycle_norm is None or dyn_power_base is None:
            continue

        enriched.append({
            'variant': v,
            'area_norm': area_norm,
            'cycle_norm': cycle_norm,
            'dyn_power_base': dyn_power_base,
            'variant_freq': v_freq,
        })

    def evaluate_at_max_freq(e):
        """Compute power/energy at variant's max frequency."""
        f_opt = e['variant_freq']
        freq_norm = f_opt / f_ref
        # Dynamic power: 2/3 area rule + frequency scaling
        # Static power (leakage): scales exactly with area
        power = (dyn_frac * e['dyn_power_base'] * freq_norm
                 + (1 - dyn_frac) * e['area_norm'])
        # latency_norm = wall-clock time ratio = cycle_norm / freq_norm
        latency_norm = e['cycle_norm'] / freq_norm
        # energy = power * latency_norm
        energy = power * latency_norm
        return {
            'variant': e['variant'],
            'area_norm': e['area_norm'],
            'cycle_norm': e['cycle_norm'],
            'freq': f_opt,
            'freq_norm': freq_norm,
            'latency_norm': latency_norm,
            'power_norm': power,
            'energy_norm': energy,
        }

    def find_best(constraint_factor, objective):
        """Find best variant under latency constraint and objective."""
        results = []
        for e in enriched:
            f_opt = e['variant_freq']
            freq_norm = f_opt / f_ref
            latency_norm = e['cycle_norm'] / freq_norm

            # Feasibility: wall-clock time <= factor * original time
            # i.e., latency_norm <= factor
            if not math.isinf(constraint_factor):
                if latency_norm > constraint_factor:
                    continue

            results.append(evaluate_at_max_freq(e))

        if not results:
            return None

        if objective == 'min_area':
            return min(results, key=lambda r: r['area_norm'])
        elif objective == 'min_energy':
            return min(results, key=lambda r: r['energy_norm'])
        return None

    # Build summary
    summary = {
        'application_name': program_name,
        'original_area': original_area,
        'original_freq': original_freq,
        'original_latency': original_latency,
        'original_cycles': original_cycles,
    }

    for cf in LATENCY_CONSTRAINTS:
        cf_label = constraint_label(cf)
        for obj, prefix in [('min_area', 'minA'), ('min_energy', 'minE')]:
            key_prefix = f"{prefix}_{cf_label}"
            # Original is always in the candidate pool, so best is never None
            best = find_best(cf, obj)
            summary[f'{key_prefix}_variant'] = best['variant']['variant_id']
            summary[f'{key_prefix}_area_norm'] = best['area_norm']
            summary[f'{key_prefix}_cycle_norm'] = best['cycle_norm']
            summary[f'{key_prefix}_freq'] = best['freq']
            summary[f'{key_prefix}_freq_norm'] = best['freq_norm']
            summary[f'{key_prefix}_latency_norm'] = best['latency_norm']
            summary[f'{key_prefix}_power_norm'] = best['power_norm']
            summary[f'{key_prefix}_energy_norm'] = best['energy_norm']

    return summary


def build_fieldnames():
    """Build CSV fieldnames dynamically from LATENCY_CONSTRAINTS."""
    fieldnames = [
        'application_name',
        'original_area', 'original_freq', 'original_latency', 'original_cycles',
    ]

    for cf in LATENCY_CONSTRAINTS:
        cf_label = constraint_label(cf)
        for prefix in ['minA', 'minE']:
            key_prefix = f"{prefix}_{cf_label}"
            fieldnames.extend([
                f'{key_prefix}_variant',
                f'{key_prefix}_area_norm',
                f'{key_prefix}_cycle_norm',
                f'{key_prefix}_freq',
                f'{key_prefix}_freq_norm',
                f'{key_prefix}_latency_norm',
                f'{key_prefix}_power_norm',
                f'{key_prefix}_energy_norm',
            ])

    return fieldnames


def compute_geomean_row(summaries: List[Dict]) -> Dict:
    """Compute geometric mean across all benchmarks for normalized columns."""
    geomean_row = {'application_name': 'GEOMEAN'}

    # Geo mean only applies to normalized numeric columns
    norm_suffixes = ['_area_norm', '_cycle_norm', '_freq_norm',
                     '_latency_norm', '_power_norm', '_energy_norm']

    fieldnames = build_fieldnames()
    for col in fieldnames:
        if col == 'application_name':
            continue

        is_norm = any(col.endswith(s) for s in norm_suffixes)
        if is_norm:
            vals = []
            for s in summaries:
                v = s.get(col)
                if v is not None and isinstance(v, (int, float)) and v > 0:
                    vals.append(v)
            if vals:
                log_sum = sum(math.log(v) for v in vals)
                geomean_row[col] = math.exp(log_sum / len(vals))
            else:
                geomean_row[col] = None
        elif col.endswith('_variant'):
            geomean_row[col] = None
        else:
            # Raw columns (original_area, etc.) — leave blank for geomean
            geomean_row[col] = None

    return geomean_row


def generate_csv(summaries: List[Dict], output_path: str):
    """Generate CSV file from summaries with geo mean row."""
    if not summaries:
        print("No valid results found!")
        return

    fieldnames = build_fieldnames()
    geomean_row = compute_geomean_row(summaries)

    with open(output_path, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(summaries)
        writer.writerow(geomean_row)

    print(f"  Written: {output_path}")


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


def display_name(raw_name):
    """Map raw benchmark name to display name for LaTeX."""
    return NAME_MAPPING.get(raw_name, raw_name)


def generate_latex_table(summaries_m1: List[Dict], summaries_m2: List[Dict],
                         objective: str, output_path: str):
    """Generate a LaTeX table merging Mode 1 and Mode 2 for a given objective."""
    prefix = 'minA' if objective == 'min_area' else 'minE'
    obj_label = 'Minimum Area' if objective == 'min_area' else 'Minimum Energy'

    geomean_m1 = compute_geomean_row(summaries_m1)
    geomean_m2 = compute_geomean_row(summaries_m2)

    constraints = [('1.2x', '$1.2\\times$ Latency Constraint'),
                   ('unconstrained', 'Unconstrained')]
    modes = [('M1', summaries_m1, geomean_m1),
             ('M2', summaries_m2, geomean_m2)]
    metrics = [('area_norm', 'A'), ('power_norm', 'P'),
               ('latency_norm', 'L'), ('energy_norm', 'E')]

    n_metrics = len(metrics)
    n_modes = len(modes)
    # Per constraint group: n_modes * n_metrics columns
    group_width = n_modes * n_metrics
    col_spec = 'l|' + '|'.join(['c' * group_width] * len(constraints))

    lines = []
    lines.append('\\begin{table*}[t]')
    lines.append('\\centering')
    lines.append('\\small')
    lines.append(f'\\caption{{{obj_label}}}')
    lines.append(f'\\begin{{tabular}}{{{col_spec}}}')
    lines.append('\\hline')

    # Row 1: constraint labels
    h1 = ['']
    for _, clabel in constraints:
        h1.append(f'\\multicolumn{{{group_width}}}{{c}}{{{clabel}}}')
    lines.append(' & '.join(h1) + ' \\\\')

    # Row 2: mode labels within each constraint
    h2 = ['']
    for _ in constraints:
        for mlabel, _, _ in modes:
            h2.append(f'\\multicolumn{{{n_metrics}}}{{c}}{{{mlabel}}}')
    lines.append(' & '.join(h2) + ' \\\\')

    # Row 3: metric names
    h3 = ['Benchmark']
    for _ in constraints:
        for _ in modes:
            for _, mlabel in metrics:
                h3.append(mlabel)
    lines.append(' & '.join(h3) + ' \\\\')
    lines.append('\\hline')

    def fmt(val):
        if val is None:
            return '--'
        return f'{val:.2f}'

    # Data rows — iterate by index (m1 and m2 have same order)
    for i in range(len(summaries_m1)):
        raw_name = summaries_m1[i]['application_name']
        name = display_name(raw_name).replace('_', '\\_').replace('-', '-')
        parts = [name]
        for cf_label, _ in constraints:
            key_prefix = f'{prefix}_{cf_label}'
            for _, sums, _ in modes:
                for msuffix, _ in metrics:
                    parts.append(fmt(sums[i].get(f'{key_prefix}_{msuffix}')))
        lines.append(' & '.join(parts) + ' \\\\')

    # GEOMEAN row
    lines.append('\\hline')
    parts = ['\\textbf{Geo. Mean}']
    for cf_label, _ in constraints:
        key_prefix = f'{prefix}_{cf_label}'
        for _, _, gm in modes:
            for msuffix, _ in metrics:
                parts.append(f'\\textbf{{{fmt(gm.get(f"{key_prefix}_{msuffix}"))}}}')
    lines.append(' & '.join(parts) + ' \\\\')
    lines.append('\\hline')

    lines.append('\\end{tabular}')
    lines.append('\\end{table*}')

    content = '\n'.join(lines)
    with open(output_path, 'w') as f:
        f.write(content + '\n')

    print(f"  Written: {output_path}")


def print_summary(summaries: List[Dict], mode_label: str):
    """Print summary statistics using geometric mean."""
    geomean = compute_geomean_row(summaries)

    print(f"  {mode_label} (geometric mean across {len(summaries)} benchmarks):")
    for cf in LATENCY_CONSTRAINTS:
        cf_label = constraint_label(cf)

        for prefix, label in [('minA', 'Min-area'), ('minE', 'Min-energy')]:
            key_prefix = f"{prefix}_{cf_label}"
            a = geomean.get(f'{key_prefix}_area_norm')
            p = geomean.get(f'{key_prefix}_power_norm')
            e = geomean.get(f'{key_prefix}_energy_norm')

            if a is not None and p is not None and e is not None:
                print(f"    {cf_label:15s} {label}: "
                      f"area {a:.4f}, power {p:.4f}, energy {e:.4f}")

    print()


def main():
    # Determine output file names
    if len(sys.argv) > 1:
        base = sys.argv[1]
        if base.endswith('.csv'):
            base = base[:-4]
        output_m1 = f"{base}_m1.csv"
        output_m2 = f"{base}_m2.csv"
    else:
        output_m1 = "results_summary_power_m1.csv"
        output_m2 = "results_summary_power_m2.csv"

    script_dir = Path(__file__).parent
    backend_dir = script_dir / "output" / "backend"

    constraint_strs = ', '.join(constraint_label(c) for c in LATENCY_CONSTRAINTS)

    print("="*80)
    print("Parsing Analysis Results (Frequency DSE + Power & Energy Model)")
    print("="*80)
    print(f"Backend directory: {backend_dir}")
    print(f"Output: {output_m1} (Mode 1: 99% dynamic)")
    print(f"        {output_m2} (Mode 2: 99% static)")
    print(f"Baseline: original program (= 1.0)")
    print(f"Frequency DSE: each variant runs at its max synthesized freq")
    print(f"Power model: P(f) = dyn_frac * P_dyn_base * f/f_ref + static_frac * area_norm")
    print(f"  Dynamic: P_dyn_base = 1 - (2/3)*(1 - area_norm)")
    print(f"  Static (leakage): scales exactly with area")
    print(f"Energy model: E = P(f) * cycles / f")
    print(f"Latency constraints: {constraint_strs}")
    print("="*80)
    print()

    # Parse all JSON files
    json_files = find_all_result_jsons(backend_dir)
    print(f"Found {len(json_files)} analysis result files")
    print()

    parsed = []
    for json_path in json_files:
        program_name = json_path.parent.name
        print(f"Parsing {program_name}...", end=" ")

        result = parse_all_variants(json_path)
        if result:
            parsed.append(result)
            print("OK")
        else:
            print("SKIP")

    print()
    print(f"Total programs: {len(parsed)}")
    print()

    # Mode 1: 99% dynamic, 1% static
    summaries_m1 = [compute_summary(*p, dyn_frac=0.99) for p in parsed]
    generate_csv(summaries_m1, output_m1)

    # Mode 2: 1% dynamic, 99% static
    summaries_m2 = [compute_summary(*p, dyn_frac=0.01) for p in parsed]
    generate_csv(summaries_m2, output_m2)

    # Generate LaTeX tables (2 tables: minE and minA, each merging M1/M2)
    print()
    generate_latex_table(summaries_m1, summaries_m2, 'min_energy',
                         'table_minE.tex')
    generate_latex_table(summaries_m1, summaries_m2, 'min_area',
                         'table_minA.tex')

    print()
    print_summary(summaries_m1, "Mode 1 (99% dynamic, 1% static)")
    print_summary(summaries_m2, "Mode 2 (1% dynamic, 99% static)")

    print("Analysis complete!")


if __name__ == "__main__":
    main()
