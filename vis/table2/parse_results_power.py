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

# Constraints to include in CSV output
CSV_LATENCY_CONSTRAINTS = [1.2, float('inf')]


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
            status = row['status']
            if status != 'PASS':
                continue
            # Strip 'variant_' prefix to get key: 'original', 'gp', '0', '1', ...
            variant_key = variant_dir.replace('variant_', '', 1)
            sim_cycles[(benchmark, variant_key)] = int(row['cycles'])

    return sim_cycles


def variant_id_to_sim_key(variant_id: str) -> str:
    """Map JSON variant_id to sim_results variant_key.

    'original' -> 'original', 'gp' -> 'gp', '0_baseline' -> '0', '3_power' -> '3'
    """
    if variant_id in ('original', 'gp'):
        return variant_id
    # Extract number before first underscore
    parts = variant_id.split('_', 1)
    return parts[0]


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
                    dyn_frac: float, sim_cycles: Dict = None) -> Dict:
    """Compute summary for a given power mode (dyn_frac).

    If sim_cycles is provided, use RTL simulation cycle counts instead of
    analytical latency*freq estimates.
    """
    original_area = original['area']
    original_freq = original['frequency']
    original_latency = original['latency']
    f_ref = original_freq

    # Use RTL sim cycles if available, else fall back to analytical
    orig_sim_key = (program_name, 'original')
    if sim_cycles and orig_sim_key in sim_cycles:
        original_cycles = sim_cycles[orig_sim_key]
    else:
        original_cycles = compute_cycles(original_latency, original_freq)

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
        v_id = v['variant_id']
        sim_key = (program_name, variant_id_to_sim_key(v_id))

        if sim_cycles and sim_key in sim_cycles:
            v_cycles = sim_cycles[sim_key]
        else:
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
        # Iso-frequency power: power at original frequency (freq_norm=1)
        power_iso = (dyn_frac * e['dyn_power_base']
                     + (1 - dyn_frac) * e['area_norm'])
        return {
            'variant': e['variant'],
            'area_norm': e['area_norm'],
            'cycle_norm': e['cycle_norm'],
            'freq': f_opt,
            'freq_norm': freq_norm,
            'latency_norm': latency_norm,
            'power_norm': power,
            'power_iso_norm': power_iso,
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
            summary[f'{key_prefix}_power_iso_norm'] = best['power_iso_norm']
            summary[f'{key_prefix}_energy_norm'] = best['energy_norm']

    return summary


def build_fieldnames(constraints=None):
    """Build CSV fieldnames dynamically from given constraints."""
    if constraints is None:
        constraints = CSV_LATENCY_CONSTRAINTS
    fieldnames = [
        'application_name',
        'original_area', 'original_freq', 'original_latency', 'original_cycles',
    ]

    for cf in constraints:
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
                f'{key_prefix}_power_iso_norm',
                f'{key_prefix}_energy_norm',
            ])

    return fieldnames


def compute_geomean_row(summaries: List[Dict]) -> Dict:
    """Compute geometric mean across all benchmarks for normalized columns."""
    geomean_row = {'application_name': 'GEOMEAN'}

    # Geo mean only applies to normalized numeric columns
    norm_suffixes = ['_area_norm', '_cycle_norm', '_freq_norm',
                     '_latency_norm', '_power_norm', '_power_iso_norm',
                     '_energy_norm']

    # Use all constraints so geomean covers both CSV and LaTeX table keys
    fieldnames = build_fieldnames(constraints=LATENCY_CONSTRAINTS)
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


def _generate_latex_table_core(summaries_m1: List[Dict], summaries_m2: List[Dict],
                                prefix: str, obj_label: str, label: str,
                                constraints, metrics, output_path: str):
    """Core LaTeX table generator with configurable constraints and metrics.

    Uses booktabs for professional formatting. Values < 1.0 are bolded
    to highlight improvements over baseline.
    """
    geomean_m1 = compute_geomean_row(summaries_m1)
    geomean_m2 = compute_geomean_row(summaries_m2)

    modes = [('M1', summaries_m1, geomean_m1),
             ('M2', summaries_m2, geomean_m2)]

    n_metrics = len(metrics)
    n_modes = len(modes)
    group_width = n_modes * n_metrics
    # Total data columns
    total_data_cols = group_width * len(constraints)
    col_spec = 'l' + 'c' * total_data_cols

    lines = []
    lines.append('\\begin{table*}[t]')
    lines.append('\\centering')
    lines.append('\\small')
    lines.append(f'\\caption{{{obj_label}}}')
    lines.append(f'\\label{{tab:{label}}}')
    lines.append(f'\\begin{{tabular}}{{{col_spec}}}')
    lines.append('\\toprule')

    # Build cmidrule ranges for constraint groups
    # Column 1 is the benchmark name, data starts at column 2
    col_idx = 2
    cmidrule_parts = []
    for _ in constraints:
        start = col_idx
        end = col_idx + group_width - 1
        cmidrule_parts.append(f'\\cmidrule(lr){{{start}-{end}}}')
        col_idx = end + 1

    # Row 1: constraint labels
    h1 = ['']
    for _, clabel in constraints:
        h1.append(f'\\multicolumn{{{group_width}}}{{c}}{{{clabel}}}')
    lines.append(' & '.join(h1) + ' \\\\')
    lines.append(' '.join(cmidrule_parts))

    # Build cmidrule ranges for mode subgroups
    col_idx = 2
    mode_cmidrule_parts = []
    for _ in constraints:
        for _ in modes:
            start = col_idx
            end = col_idx + n_metrics - 1
            mode_cmidrule_parts.append(f'\\cmidrule(lr){{{start}-{end}}}')
            col_idx = end + 1

    # Row 2: mode labels within each constraint
    h2 = ['']
    for _ in constraints:
        for mlabel, _, _ in modes:
            h2.append(f'\\multicolumn{{{n_metrics}}}{{c}}{{{mlabel}}}')
    lines.append(' & '.join(h2) + ' \\\\')
    lines.append(' '.join(mode_cmidrule_parts))

    # Row 3: metric names
    h3 = ['Benchmark']
    for _ in constraints:
        for _ in modes:
            for _, mlabel in metrics:
                h3.append(mlabel)
    lines.append(' & '.join(h3) + ' \\\\')
    lines.append('\\midrule')

    def fmt(val):
        """Format value; bold if < 1.0 (improvement over baseline)."""
        if val is None:
            return '--'
        s = f'{val:.2f}'
        if val < 0.995:  # will display as <= 0.99
            return f'\\textbf{{{s}}}'
        return s

    def fmt_geomean(val):
        if val is None:
            return '--'
        s = f'{val:.2f}'
        return f'\\textbf{{{s}}}'

    # Data rows
    for i in range(len(summaries_m1)):
        raw_name = summaries_m1[i]['application_name']
        name = display_name(raw_name).replace('_', '\\_')
        parts = [f'\\texttt{{{name}}}']
        for cf_label, _ in constraints:
            key_prefix = f'{prefix}_{cf_label}'
            for _, sums, _ in modes:
                for msuffix, _ in metrics:
                    parts.append(fmt(sums[i].get(f'{key_prefix}_{msuffix}')))
        lines.append(' & '.join(parts) + ' \\\\')

    # GEOMEAN row
    lines.append('\\midrule')
    parts = ['\\textbf{Geo.\\ Mean}']
    for cf_label, _ in constraints:
        key_prefix = f'{prefix}_{cf_label}'
        for _, _, gm in modes:
            for msuffix, _ in metrics:
                parts.append(fmt_geomean(gm.get(f'{key_prefix}_{msuffix}')))
    lines.append(' & '.join(parts) + ' \\\\')
    lines.append('\\bottomrule')

    lines.append('\\end{tabular}')
    lines.append('\\end{table*}')

    content = '\n'.join(lines)
    with open(output_path, 'w') as f:
        f.write(content + '\n')

    print(f"  Written: {output_path}")


def generate_latex_table_minA(summaries_m1, summaries_m2, output_path):
    """Generate Table A (Minimum Area): A and P (iso-freq), both constraints."""
    constraints = [('1.2x', '$1.2\\times$ Latency Constraint'),
                   ('unconstrained', 'Unconstrained')]
    # A = area, P = iso-frequency power (no L or E)
    metrics = [('area_norm', 'A'), ('power_iso_norm', 'P')]
    _generate_latex_table_core(summaries_m1, summaries_m2,
                               'minA', 'Minimum Area', 'min_area',
                               constraints, metrics, output_path)


def generate_latex_table_minE(summaries_m1, summaries_m2, output_path):
    """Generate Table B (Minimum Energy): A and E, unconstrained only."""
    constraints = [('unconstrained', 'Unconstrained')]
    # A = area, E = energy (no P or L)
    metrics = [('area_norm', 'A'), ('energy_norm', 'E')]
    _generate_latex_table_core(summaries_m1, summaries_m2,
                               'minE', 'Minimum Energy', 'min_energy',
                               constraints, metrics, output_path)


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
    script_dir = Path(__file__).parent
    if len(sys.argv) > 1:
        base = sys.argv[1]
        if base.endswith('.csv'):
            base = base[:-4]
        output_m1 = f"{base}_m1.csv"
        output_m2 = f"{base}_m2.csv"
    else:
        output_m1 = str(script_dir / "results_summary_power_m1.csv")
        output_m2 = str(script_dir / "results_summary_power_m2.csv")

    project_dir = script_dir.parent.parent
    backend_dir = project_dir / "output" / "backend"
    sim_csv_path = project_dir / "sim_results.csv"

    # Load RTL simulation cycle counts
    sim_cycles = load_sim_results(sim_csv_path)

    constraint_strs = ', '.join(constraint_label(c) for c in LATENCY_CONSTRAINTS)

    print("="*80)
    print("Parsing Analysis Results (Frequency DSE + Power & Energy Model)")
    print("="*80)
    print(f"Backend directory: {backend_dir}")
    print(f"Sim results: {sim_csv_path} ({len(sim_cycles)} entries)")
    print(f"Output: {output_m1} (Mode 1: 99% dynamic)")
    print(f"        {output_m2} (Mode 2: 99% static)")
    print(f"Baseline: original program (= 1.0)")
    print(f"Cycle counts: RTL simulation (sim_results.csv)")
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
    summaries_m1 = [compute_summary(*p, dyn_frac=0.99, sim_cycles=sim_cycles)
                    for p in parsed]
    generate_csv(summaries_m1, output_m1)

    # Mode 2: 1% dynamic, 99% static
    summaries_m2 = [compute_summary(*p, dyn_frac=0.01, sim_cycles=sim_cycles)
                    for p in parsed]
    generate_csv(summaries_m2, output_m2)

    # Generate LaTeX tables
    print()
    generate_latex_table_minA(summaries_m1, summaries_m2,
                              str(script_dir / 'table_minA.tex'))
    generate_latex_table_minE(summaries_m1, summaries_m2,
                              str(script_dir / 'table_minE.tex'))

    print()
    print_summary(summaries_m1, "Mode 1 (99% dynamic, 1% static)")
    print_summary(summaries_m2, "Mode 2 (1% dynamic, 99% static)")

    print("Analysis complete!")


if __name__ == "__main__":
    main()
