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
        writer = csv.DictWriter(f, fieldnames=fieldnames, extrasaction='ignore')
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
                                prefix: str, _caption, _label,
                                constraints, metrics, output_path: str):
    """Core LaTeX table generator with configurable constraints and metrics.

    Uses booktabs for professional formatting. Values < 1.0 are bolded
    to highlight improvements over baseline.
    """
    geomean_m1 = compute_geomean_row(summaries_m1)
    geomean_m2 = compute_geomean_row(summaries_m2)

    modes = [('SKY130', summaries_m1, geomean_m1),
             ('PPDK', summaries_m2, geomean_m2)]

    n_metrics = len(metrics)
    n_modes = len(modes)
    group_width = n_modes * n_metrics
    total_data_cols = group_width * len(constraints)
    col_spec = '@{}l' + 'c' * total_data_cols + '@{}'

    lines = []
    lines.append('% Auto-generated by parse_results_power.py — do not edit manually')
    lines.append(f'\\begin{{tabular}}{{{col_spec}}}')
    lines.append('\\toprule')

    # Row 1: constraint labels (only if multiple constraints)
    if len(constraints) > 1:
        col_idx = 2
        cmidrule_parts = []
        for _ in constraints:
            start = col_idx
            end = col_idx + group_width - 1
            cmidrule_parts.append(f'\\cmidrule(lr){{{start}-{end}}}')
            col_idx = end + 1

        h1 = ['']
        for _, clabel in constraints:
            h1.append(f'\\multicolumn{{{group_width}}}{{c}}{{{clabel}}}')
        lines.append(' & '.join(h1) + ' \\\\')
        lines.append(' '.join(cmidrule_parts))

    # Row 2: mode labels (SKY130 / PPDK)
    col_idx = 2
    mode_cmidrule_parts = []
    for _ in constraints:
        for _ in modes:
            start = col_idx
            end = col_idx + n_metrics - 1
            mode_cmidrule_parts.append(f'\\cmidrule(lr){{{start}-{end}}}')
            col_idx = end + 1

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
            for _, mlabel, _ in metrics:
                h3.append(mlabel)
    lines.append(' & '.join(h3) + ' \\\\')
    lines.append('\\midrule')

    def fmt(val):
        if val is None:
            return '--'
        return f'{val:.2f}'

    def fmt_bold(val):
        if val is None:
            return '--'
        return f'\\textbf{{{val:.2f}}}'

    # Data rows
    for i in range(len(summaries_m1)):
        raw_name = summaries_m1[i]['application_name']
        name = display_name(raw_name).replace('_', '\\_')
        parts = [f'\\texttt{{{name}}}']
        for cf_label, _ in constraints:
            key_prefix = f'{prefix}_{cf_label}'
            for _, sums, _ in modes:
                for msuffix, _, hb in metrics:
                    parts.append(fmt(sums[i].get(f'{key_prefix}_{msuffix}')))
        lines.append(' & '.join(parts) + ' \\\\')

    # Geomean row (bold)
    lines.append('\\addlinespace[3pt]')
    lines.append('\\midrule')
    parts = ['\\textbf{Geomean}']
    for cf_label, _ in constraints:
        key_prefix = f'{prefix}_{cf_label}'
        for _, _, gm in modes:
            for msuffix, _, hb in metrics:
                parts.append(fmt_bold(gm.get(f'{key_prefix}_{msuffix}')))
    lines.append(' & '.join(parts) + ' \\\\')
    lines.append('\\bottomrule')

    lines.append('\\end{tabular}')

    content = '\n'.join(lines)
    with open(output_path, 'w') as f:
        f.write(content + '\n')

    print(f"  Written: {output_path}")


def generate_latex_table_minA(summaries_m1, summaries_m2, output_path):
    """Generate Table A (Minimum Area): A and P (iso-freq), both constraints."""
    constraints = [('1.2x', 'Min-area ($1.2\\times$ latency)'),
                   ('unconstrained', 'Min-area (unconstrained)')]
    metrics = [('area_norm', 'Area', False), ('power_iso_norm', 'Power', False)]
    _generate_latex_table_core(summaries_m1, summaries_m2,
                               'minA', None, None,
                               constraints, metrics, output_path)


def _fmt_abs_val(val, metric_suffix):
    """Format an absolute value in scientific notation with aligned decimals."""
    if val is None or val == 0:
        return '--'
    if metric_suffix in ('area', 'freq'):
        # Scientific notation: 1.27e+05 -> $1.27 \times 10^{5}$
        s = f'{val:.2e}'  # e.g. '1.27e+05'
        mantissa, exp_part = s.split('e')
        exp = int(exp_part)
        return f'${mantissa} \\times 10^{{{exp}}}$'
    elif metric_suffix == 'power':
        return f'{val:.1f}'
    return f'{val:.2f}'


def generate_latex_table_minA_abs(summaries_m1, summaries_m2, output_path):
    """Generate min-area table with PDAG baseline abs values and reduction %.

    Layout:
      PDAG (baseline)          | 1.2x constraint        | unconstrained
      SKY130     | PPDK        | SKY130     | PPDK       | SKY130     | PPDK
      Area | Pwr | Area | Pwr  | ΔA%  | ΔP% | ΔA% | ΔP% | ΔA%  | ΔP% | ΔA% | ΔP%
    """
    geomean_m1 = compute_geomean_row(summaries_m1)
    geomean_m2 = compute_geomean_row(summaries_m2)

    modes = [('SKY130', summaries_m1, geomean_m1),
             ('PPDK', summaries_m2, geomean_m2)]

    constraints = [('1.2x', r'$1.2\times$ latency'),
                   ('unconstrained', 'Unconstrained')]
    metrics = [('area_norm', 'Area', 'area'),
               ('power_iso_norm', 'Power', 'power')]

    n_metrics = len(metrics)
    n_modes = len(modes)
    # PDAG group: n_modes * n_metrics columns
    pdag_mode_width = n_metrics
    pdag_group_width = n_modes * pdag_mode_width
    # Constraint group: n_modes * n_metrics columns (reduction %)
    constr_mode_width = n_metrics
    constr_group_width = n_modes * constr_mode_width
    total_data_cols = pdag_group_width + constr_group_width * len(constraints)
    col_spec = '@{}l' + 'c' * total_data_cols + '@{}'

    lines = []
    lines.append('% Auto-generated by parse_results_power.py — do not edit manually')
    lines.append('% PDAG columns: absolute area/power; constraint columns: reduction %')
    lines.append(f'\\begin{{tabular}}{{{col_spec}}}')
    lines.append('\\toprule')

    # Row 1: top-level group headers (PDAG | constraint1 | constraint2)
    col_idx = 2
    h1 = ['']
    h1.append(f'\\multicolumn{{{pdag_group_width}}}{{c}}{{\\textbf{{PDAG (baseline)}}}}')
    cmidrule_parts = [f'\\cmidrule(lr){{{col_idx}-{col_idx + pdag_group_width - 1}}}']
    col_idx += pdag_group_width
    for _, clabel in constraints:
        h1.append(f'\\multicolumn{{{constr_group_width}}}{{c}}{{\\textbf{{{clabel}}}}}')
        cmidrule_parts.append(f'\\cmidrule(lr){{{col_idx}-{col_idx + constr_group_width - 1}}}')
        col_idx += constr_group_width
    lines.append(' & '.join(h1) + ' \\\\')
    lines.append(' '.join(cmidrule_parts))

    # Row 2: technology labels (SKY130 / PPDK) under each group
    col_idx = 2
    h2 = ['']
    mode_cmidrule_parts = []
    # PDAG group
    for mlabel, _, _ in modes:
        h2.append(f'\\multicolumn{{{pdag_mode_width}}}{{c}}{{{mlabel}}}')
        mode_cmidrule_parts.append(f'\\cmidrule(lr){{{col_idx}-{col_idx + pdag_mode_width - 1}}}')
        col_idx += pdag_mode_width
    # Constraint groups
    for _ in constraints:
        for mlabel, _, _ in modes:
            h2.append(f'\\multicolumn{{{constr_mode_width}}}{{c}}{{{mlabel}}}')
            mode_cmidrule_parts.append(f'\\cmidrule(lr){{{col_idx}-{col_idx + constr_mode_width - 1}}}')
            col_idx += constr_mode_width
    lines.append(' & '.join(h2) + ' \\\\')
    lines.append(' '.join(mode_cmidrule_parts))

    # Row 3: metric column headers
    h3 = ['Benchmark']
    # PDAG: absolute Area, Power per mode (with units)
    unit_map = {'Area': r'Area ($\mu m^2$)', 'Power': 'Power (mW)'}
    for _ in modes:
        for _, mlabel, _ in metrics:
            h3.append(unit_map.get(mlabel, mlabel))
    # Constraints: reduction % per mode per metric
    for _ in constraints:
        for _ in modes:
            for _, mlabel, _ in metrics:
                h3.append(f'$\\Delta${mlabel}')
    lines.append(' & '.join(h3) + ' \\\\')
    lines.append('\\midrule')

    def fmt_reduction(ratio):
        """Format reduction % from norm ratio: negative = reduction."""
        if ratio is None:
            return '--'
        red = (ratio - 1.0) * 100
        return f'{red:.1f}\\%'

    def fmt_reduction_bold(ratio):
        if ratio is None:
            return '--'
        red = (ratio - 1.0) * 100
        return f'\\textbf{{{red:.1f}\\%}}'

    # Data rows
    for i in range(len(summaries_m1)):
        raw_name = summaries_m1[i]['application_name']
        name = display_name(raw_name).replace('_', '\\_')
        parts = [f'\\texttt{{{name}}}']
        # PDAG abs values
        for _, sums, _ in modes:
            for _, _, abs_suffix in metrics:
                abs_val = sums[i].get(f'baseline_{abs_suffix}_abs')
                parts.append(_fmt_abs_val(abs_val, abs_suffix))
        # Constraint reduction %
        for cf_label, _ in constraints:
            key_prefix = f'minA_{cf_label}'
            for _, sums, _ in modes:
                for norm_key, _, _ in metrics:
                    ratio = sums[i].get(f'{key_prefix}_{norm_key}')
                    parts.append(fmt_reduction(ratio))
        lines.append(' & '.join(parts) + ' \\\\')

    # Geomean row
    lines.append('\\addlinespace[3pt]')
    lines.append('\\midrule')
    parts = ['\\textbf{Geomean}']
    # PDAG: leave blank
    for _ in modes:
        for _ in metrics:
            parts.append('')
    # Constraint reduction % (bold)
    for cf_label, _ in constraints:
        key_prefix = f'minA_{cf_label}'
        for _, _, gm in modes:
            for norm_key, _, _ in metrics:
                val = gm.get(f'{key_prefix}_{norm_key}')
                parts.append(fmt_reduction_bold(val))
    lines.append(' & '.join(parts) + ' \\\\')

    lines.append('\\bottomrule')
    lines.append('\\end{tabular}')

    content = '\n'.join(lines)
    with open(output_path, 'w') as f:
        f.write(content + '\n')
    print(f"  Written: {output_path}")


def generate_latex_table_minE(summaries_m1, summaries_m2, output_path):
    """Generate Table B (Minimum Energy): Area, Power, Freq, Energy, unconstrained only."""
    constraints = [('unconstrained', 'Min-energy (unconstrained)')]
    metrics = [('area_norm', 'Area', False), ('power_norm', 'Power', False),
               ('freq_norm', 'Freq', True), ('energy_norm', 'Energy', False)]
    _generate_latex_table_core(summaries_m1, summaries_m2,
                               'minE', None, None,
                               constraints, metrics, output_path)


def load_m1_summaries(pnr_csv_path: Path, sim_cycles: Dict) -> List[Dict]:
    """Load M1 (SKY130) real PNR data.

    The M1 CSV has absolute area/power/freq for baseline and each
    (objective, constraint) combination.  We normalize to baseline and
    compute energy using RTL sim cycles.
    """
    if not pnr_csv_path.exists():
        print(f"Warning: M1 PNR CSV not found at {pnr_csv_path}")
        return []

    summaries = []
    with open(pnr_csv_path, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            app_name = row['application_name']
            if not app_name or app_name == 'GEOMEAN':
                continue

            baseline_area = float(row['baseline_Total Area'])
            baseline_power = float(row['baseline_Total Power (mW)'])
            baseline_freq = float(row['baseline_Max Freq (MHz)'])

            orig_cycles = sim_cycles.get((app_name, 'original'))
            summary = {
                'application_name': app_name,
                'baseline_area_abs': baseline_area,
                'baseline_power_abs': baseline_power,
                'baseline_freq_abs': baseline_freq,
            }

            for prefix, obj_tag in [('minA', 'minA'), ('minE', 'minE')]:
                for cf_label, csv_tag in [('1.2x', '1.2x'),
                                          ('unconstrained', 'unconstrained')]:
                    key_prefix = f'{prefix}_{cf_label}'
                    csv_key = f'{obj_tag}_{csv_tag}'

                    variant_id = row.get(f'{csv_key}_variant', '')
                    v_area = float(row[f'{csv_key}_Total Area'])
                    v_power = float(row[f'{csv_key}_Total Power (mW)'])
                    v_freq = float(row[f'{csv_key}_Max Freq (MHz)'])

                    area_norm = v_area / baseline_area
                    power_iso_norm = v_power / baseline_power
                    freq_norm = v_freq / baseline_freq
                    # Scale iso-freq power by freq ratio: P_dynamic ∝ freq
                    power_norm = power_iso_norm * freq_norm

                    sim_key = variant_id_to_sim_key(variant_id)
                    v_cycles = sim_cycles.get((app_name, sim_key))
                    if orig_cycles and v_cycles:
                        cycle_norm = v_cycles / orig_cycles
                    else:
                        cycle_norm = 1.0

                    latency_norm = cycle_norm / freq_norm
                    energy_norm = power_norm * latency_norm

                    summary[f'{key_prefix}_variant'] = variant_id
                    summary[f'{key_prefix}_area_norm'] = area_norm
                    summary[f'{key_prefix}_cycle_norm'] = cycle_norm
                    summary[f'{key_prefix}_freq_norm'] = freq_norm
                    summary[f'{key_prefix}_latency_norm'] = latency_norm
                    summary[f'{key_prefix}_power_norm'] = power_norm
                    summary[f'{key_prefix}_power_iso_norm'] = power_iso_norm
                    summary[f'{key_prefix}_energy_norm'] = energy_norm
                    summary[f'{key_prefix}_area_abs'] = v_area
                    summary[f'{key_prefix}_power_abs'] = v_power
                    summary[f'{key_prefix}_freq_abs'] = v_freq

            summaries.append(summary)

    print(f"  Loaded {len(summaries)} benchmarks from M1 PNR data")
    return summaries


def load_m2_area_from_json(backend_dir: Path) -> Dict:
    """Load area data from output_m2 JSON files.

    Returns dict mapping (app_name, variant_id) -> area.
    """
    area_map = {}
    json_files = find_all_result_jsons(backend_dir)
    for json_path in json_files:
        try:
            with open(json_path, 'r') as f:
                data = json.load(f)
            program_name = data.get('program_name', json_path.parent.name)
            for variant in data.get('variants', []):
                area_map[(program_name, variant['variant_id'])] = variant['area']
        except Exception as e:
            print(f"  Warning: error reading {json_path}: {e}")
    return area_map


def load_m2_summaries(m2_csv_path: Path, backend_dir_m2: Path,
                      sim_cycles: Dict) -> List[Dict]:
    """Load M2 (PPDK) data: power/freq from PNR CSV, area from output_m2 JSON.

    The M2 CSV has:
    - Period (ns) for frequency
    - Total Power @ 5.87Hz (mW) for iso-freq power
    - Total Power @ CSV Freq (mW) for power at max freq
    Area comes from output_m2/backend JSON files.
    """
    if not m2_csv_path.exists():
        print(f"Warning: M2 CSV not found at {m2_csv_path}")
        return []

    print("  Loading M2 area from output_m2 JSON...")
    area_map = load_m2_area_from_json(backend_dir_m2)
    print(f"  Loaded {len(area_map)} variant areas from JSON")

    summaries = []
    with open(m2_csv_path, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            app_name = row['application_name']
            if not app_name or app_name == 'GEOMEAN':
                continue

            baseline_period = float(row['baseline_Period (ns)'])
            baseline_power_iso = float(row['baseline_Total Power @ 5.87Hz (mW)'])
            baseline_power_maxf = float(row['baseline_Total Power @ CSV Freq (mW)'])
            baseline_area = area_map.get((app_name, 'original'))

            baseline_freq = 1e9 / baseline_period  # Hz
            orig_cycles = sim_cycles.get((app_name, 'original'))
            summary = {
                'application_name': app_name,
                'baseline_area_abs': baseline_area or 0,
                'baseline_power_abs': baseline_power_iso,
                'baseline_freq_abs': baseline_freq,
            }

            for prefix, obj_tag in [('minA', 'minA'), ('minE', 'minE')]:
                for cf_label, csv_tag in [('1.2x', '1.2x'),
                                          ('unconstrained', 'unconstrained')]:
                    key_prefix = f'{prefix}_{cf_label}'
                    csv_key = f'{obj_tag}_{csv_tag}'

                    variant_id = row.get(f'{csv_key}_variant', '')
                    v_period = float(row[f'{csv_key}_Period (ns)'])
                    v_power_iso = float(row[f'{csv_key}_Total Power @ 5.87Hz (mW)'])
                    v_power_maxf = float(row[f'{csv_key}_Total Power @ CSV Freq (mW)'])

                    # Area from JSON
                    v_area = area_map.get((app_name, variant_id))
                    if baseline_area and v_area:
                        area_norm = v_area / baseline_area
                    else:
                        area_norm = 1.0

                    power_iso_norm = v_power_iso / baseline_power_iso
                    power_norm = v_power_maxf / baseline_power_maxf
                    freq_norm = baseline_period / v_period
                    v_freq = 1e9 / v_period  # Hz

                    sim_key = variant_id_to_sim_key(variant_id)
                    v_cycles = sim_cycles.get((app_name, sim_key))
                    if orig_cycles and v_cycles:
                        cycle_norm = v_cycles / orig_cycles
                    else:
                        cycle_norm = 1.0

                    latency_norm = cycle_norm / freq_norm
                    energy_norm = power_norm * latency_norm

                    summary[f'{key_prefix}_variant'] = variant_id
                    summary[f'{key_prefix}_area_norm'] = area_norm
                    summary[f'{key_prefix}_cycle_norm'] = cycle_norm
                    summary[f'{key_prefix}_freq_norm'] = freq_norm
                    summary[f'{key_prefix}_latency_norm'] = latency_norm
                    summary[f'{key_prefix}_power_norm'] = power_norm
                    summary[f'{key_prefix}_power_iso_norm'] = power_iso_norm
                    summary[f'{key_prefix}_energy_norm'] = energy_norm
                    summary[f'{key_prefix}_area_abs'] = v_area or 0
                    summary[f'{key_prefix}_power_abs'] = v_power_iso
                    summary[f'{key_prefix}_freq_abs'] = v_freq

            summaries.append(summary)

    print(f"  Loaded {len(summaries)} benchmarks from M2 data")
    return summaries


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
    backend_dir_m2 = project_dir / "output_m2" / "backend"
    sim_csv_path = project_dir / "sim_results.csv"
    m1_csv_path = script_dir / "AESIP result - m1_pnr.csv"
    m2_csv_path = script_dir / "AESIP result - m2_energy_two_freq.csv"

    # Load RTL simulation cycle counts
    sim_cycles = load_sim_results(sim_csv_path)

    print("="*80)
    print("Parsing Analysis Results (Real PNR Data)")
    print("="*80)
    print(f"M1 (SKY130) PNR: {m1_csv_path}")
    print(f"M2 (PPDK) PNR:   {m2_csv_path}")
    print(f"M2 area (JSON):  {backend_dir_m2}")
    print(f"Sim results:     {sim_csv_path} ({len(sim_cycles)} entries)")
    print(f"Output: {output_m1} (SKY130)")
    print(f"        {output_m2} (PPDK)")
    print("="*80)
    print()

    # --- SKY130 (M1): Real PNR data ---
    print("Loading SKY130 (M1) PNR data...")
    summaries_m1 = load_m1_summaries(m1_csv_path, sim_cycles)
    generate_csv(summaries_m1, output_m1)

    # --- PPDK (M2): Real PNR data (power/freq from CSV, area from JSON) ---
    print()
    print("Loading PPDK (M2) PNR data...")
    summaries_m2 = load_m2_summaries(m2_csv_path, backend_dir_m2, sim_cycles)
    generate_csv(summaries_m2, output_m2)

    # Generate LaTeX tables
    print()
    generate_latex_table_minA(summaries_m1, summaries_m2,
                              str(script_dir / 'table_minA.tex'))
    generate_latex_table_minA_abs(summaries_m1, summaries_m2,
                                  str(script_dir / 'table_minA_abs.tex'))
    generate_latex_table_minE(summaries_m1, summaries_m2,
                              str(script_dir / 'table_minE.tex'))

    print()
    print_summary(summaries_m1, "SKY130 (M1)")
    print_summary(summaries_m2, "PPDK (M2)")

    print("Analysis complete!")


if __name__ == "__main__":
    main()
