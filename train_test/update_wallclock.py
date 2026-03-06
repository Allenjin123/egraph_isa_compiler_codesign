#!/usr/bin/env python3
"""
用 output_rtl chip CSV 中的 wallclock_s 更新 output/backend/程序名/analysis_results.json 中对应 variant 的 latency。
匹配方式：CSV variant_dir (e.g. variant_0, variant_original) -> JSON variant_id (0, "original", "gp", ...)
"""

import csv
import json
import os

BASE = "/home/yjrcs/Egglog_DSL/egraph_isa_compiler_codesign/train_test"
OUTPUT_RTL = os.path.join(BASE, "output_rtl")
OUTPUT = os.path.join(BASE, "output")

for chip in sorted(os.listdir(OUTPUT_RTL)):
    chip_rtl_dir = os.path.join(OUTPUT_RTL, chip)
    if not os.path.isdir(chip_rtl_dir):
        continue
    chip_out_dir = os.path.join(OUTPUT, chip, "backend")

    # Find CSV file
    csv_files = [f for f in os.listdir(chip_rtl_dir) if f.endswith(".csv")]
    if not csv_files:
        print(f"[{chip}] No CSV found, skipping")
        continue

    csv_path = os.path.join(chip_rtl_dir, csv_files[0])

    # Build cycles lookup: (benchmark, variant_id_str) -> cycles
    # variant_dir = "variant_0" -> variant_id_str = "0"
    # variant_dir = "variant_original" -> variant_id_str = "original"
    wallclock_map = {}
    with open(csv_path, newline="") as f:
        for row in csv.DictReader(f):
            if row.get("status", "").strip() != "PASS":
                continue
            benchmark = row["benchmark"]
            variant_dir = row["variant_dir"]
            prefix = "variant_"
            vid_str = variant_dir[len(prefix):] if variant_dir.startswith(prefix) else variant_dir
            try:
                cycles = int(row["cycles"])
            except (ValueError, KeyError):
                continue
            wallclock_map[(benchmark, vid_str)] = cycles

    if not os.path.isdir(chip_out_dir):
        print(f"[{chip}] No backend dir, skipping")
        continue

    # Update each program's analysis_results.json
    for prog in sorted(os.listdir(chip_out_dir)):
        json_path = os.path.join(chip_out_dir, prog, "analysis_results.json")
        if not os.path.isfile(json_path):
            continue

        with open(json_path) as f:
            data = json.load(f)

        program_name = data.get("program_name", prog)
        changed = False

        for variant in data.get("variants", []):
            vid = variant["variant_id"]
            vid_str = str(vid)
            key = (program_name, vid_str)
            if key in wallclock_map:
                old = variant["latency"]
                variant["latency"] = wallclock_map[key]
                print(f"[{chip}] {program_name}/{vid_str}: latency {old} -> {wallclock_map[key]} cycles")
                changed = True
            else:
                print(f"[{chip}] {program_name}/{vid_str}: not found in CSV, keeping {variant['latency']}")

        # Also update pareto_frontier latency values
        variant_map = {v["variant_id"]: v for v in data.get("variants", [])}
        for pf in data.get("pareto_frontier", []):
            vid = pf["variant_id"]
            v = variant_map.get(vid)
            if v:
                pf["latency"] = v["latency"]

        if changed:
            with open(json_path, "w") as f:
                json.dump(data, f, indent=2)
            print(f"[{chip}] Saved {json_path}")

print("Done.")
