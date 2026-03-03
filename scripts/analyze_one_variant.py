#!/usr/bin/env python3
"""
Analyze a single variant (single-threaded), record synthesis_time_s per variant.

Usage:
    python analyze_one_variant.py <variants_dir> <program_name> <output_dir> <variant_id>
                                  [--enable-freq-analysis] [--enable-shift-constraints]
                                  [--enable-cache-latencies] [--core-name CORE]

    variant_id: integer (0, 1, 2, ...), "original", or "gp"

Output:
    <output_dir>/analysis_results_<variant_id>.json
"""

import sys
import json
import time
from pathlib import Path
from collections import defaultdict

# Add project root for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

import Saturation.data_structure as ds
import backend.area_parser as ap
import backend.latency_parser as lp


def main():
    if len(sys.argv) < 5:
        print("Usage: python analyze_one_variant.py <variants_dir> <program_name> <output_dir> <variant_id> [options]")
        print("  variant_id: integer, 'original', or 'gp'")
        print("  options: --enable-freq-analysis  --enable-shift-constraints  --enable-cache-latencies  --core-name CORE")
        sys.exit(1)

    variants_dir  = sys.argv[1]
    program_name  = sys.argv[2]
    output_dir    = sys.argv[3]
    raw_id        = sys.argv[4]

    # Parse variant_id
    if raw_id in ("original", "gp"):
        variant_id = raw_id
    else:
        variant_id = int(raw_id)

    # Flags
    enable_freq_analysis    = "--enable-freq-analysis"    in sys.argv
    enable_shift_constraints= "--enable-shift-constraints" in sys.argv
    enable_cache_latencies  = "--enable-cache-latencies"  in sys.argv

    core_name = "ibex"
    for i, arg in enumerate(sys.argv):
        if arg == "--core-name" and i + 1 < len(sys.argv):
            core_name = sys.argv[i + 1]
            break

    variants_path = Path(variants_dir)
    output_path   = Path(output_dir)

    if not variants_path.exists():
        print(f"Error: variants directory not found: {variants_path}")
        sys.exit(1)

    dsl_dir = output_path / "dsl_files"
    dsl_dir.mkdir(parents=True, exist_ok=True)

    print("=" * 60)
    print(f"Single-variant analysis")
    print(f"  program   : {program_name}")
    print(f"  variant   : {variant_id}")
    print(f"  core      : {core_name}")
    print(f"  freq mode : {enable_freq_analysis}")
    print(f"  shift cstr: {enable_shift_constraints}")
    print(f"  cache lat : {enable_cache_latencies}")
    print("=" * 60)

    # ------------------------------------------------------------------ #
    # Load variant
    # ------------------------------------------------------------------ #
    variant_path = variants_path / f"variant_{variant_id}"
    if not variant_path.exists():
        print(f"Error: variant directory not found: {variant_path}")
        sys.exit(1)

    if variant_id == "original":
        prog = ds.text_program(f"{program_name}_original")
    elif variant_id == "gp":
        prog = ds.text_program(f"{program_name}_gp")
    else:
        prog = ds.text_program(f"{program_name}_variant_{variant_id}")

    if (variant_path / "basic_blocks_ssa").exists():
        prog.from_directory(str(variant_path), suffix="_ssa", base_program_name=program_name)
    elif (variant_path / "basic_blocks").exists():
        prog.from_directory(str(variant_path), suffix="", base_program_name=program_name)
    else:
        print(f"Error: no basic_blocks directory found in {variant_path}")
        sys.exit(1)

    # Instruction subset + shift immediate analysis
    subset = set()
    shift_imm_dict = defaultdict(set)
    SHIFT_INSTRUCTIONS = {'slli', 'srli', 'srai'}

    for block in prog.basic_blocks:
        for instr in block.inst_list:
            subset.add(instr.op_name)
            if instr.op_name in SHIFT_INSTRUCTIONS and instr.imm is not None:
                if isinstance(instr.imm, str):
                    parsed_value = ds.text_inst.parse_immediate(instr.imm)
                else:
                    parsed_value = instr.imm
                if parsed_value is not None:
                    shift_imm_dict[instr.op_name].add(parsed_value)
    shift_imm_dict = dict(shift_imm_dict)

    # ------------------------------------------------------------------ #
    # Synthesis
    # ------------------------------------------------------------------ #
    is_special = variant_id in ("original", "gp")
    should_run_dual = enable_shift_constraints and not is_special

    results = []  # list of dicts

    def run_synthesis(label, dsl_suffix, use_empty_dsl=False, use_shift_imm=False, use_cache_lat=False):
        dsl_file = str(dsl_dir / f"{program_name}_variant_{variant_id}{dsl_suffix}.dsl")
        print(f"  [{label}] synthesis starting ({len(subset)} instructions)...")
        t0 = time.time()
        area, frequency = ap.parse_area(
            subset, dsl_file,
            use_empty_dsl=use_empty_dsl,
            enable_freq_analysis=enable_freq_analysis,
            core_name=core_name,
            shift_imm_dict=shift_imm_dict if use_shift_imm else None,
            add_cache_latencies=use_cache_lat,
        )
        synthesis_time = time.time() - t0
        latency = lp.parse_latency(prog, frequency if enable_freq_analysis else None)

        if enable_freq_analysis and frequency:
            lat_str = f"{latency:.2e}s"
            freq_str = f", freq={frequency:.2f} MHz"
        else:
            lat_str = f"{latency} cycles"
            freq_str = ""
        print(f"  [{label}] done in {synthesis_time:.1f}s — area={area:.2f} µm², latency={lat_str}{freq_str}")

        return {
            "label": label,
            "area": area,
            "latency": latency,
            "frequency": frequency,
            "synthesis_time_s": synthesis_time,
        }

    if variant_id == "gp":
        r = run_synthesis("gp", "", use_empty_dsl=True)
        r["constraint_type"] = "gp"
        results.append(r)

    elif variant_id == "original":
        r = run_synthesis("original", "")
        r["constraint_type"] = "original"
        results.append(r)

    elif should_run_dual:
        r_base = run_synthesis("baseline", "_baseline")
        r_base["constraint_type"] = "baseline"
        results.append(r_base)

        r_ua = run_synthesis("uarchaware", "_uarchaware",
                             use_shift_imm=True, use_cache_lat=enable_cache_latencies)
        r_ua["constraint_type"] = "uarchaware"
        results.append(r_ua)

    else:
        r = run_synthesis("single", "")
        r["constraint_type"] = "single"
        results.append(r)

    # ------------------------------------------------------------------ #
    # Save JSON
    # ------------------------------------------------------------------ #
    output_data = {
        "program_name": program_name,
        "variant_id": raw_id,
        "core_name": core_name,
        "instruction_subset": sorted(subset),
        "num_instructions": len(subset),
        "num_blocks": len(prog.basic_blocks),
        "results": results,
    }

    out_file = output_path / f"analysis_results_{raw_id}.json"
    with open(out_file, "w") as f:
        json.dump(output_data, f, indent=2)

    print()
    print(f"Saved to: {out_file}")
    print("Done.")


if __name__ == "__main__":
    main()
