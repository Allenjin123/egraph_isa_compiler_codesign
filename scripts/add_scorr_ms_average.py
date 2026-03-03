#!/usr/bin/env python3
"""
Remove all scorr-related fields from timing.json, then append scorr_ms_average
computed from /tmp/aesip_result_final_09/backend/<program>/analysis_results.json:
    scorr_ms_average = total_synthesis_time / 27 * 1000
"""

import json
import os

TIMING_JSON = os.path.join(os.path.dirname(__file__), "timing.json")
BACKEND_RESULT_DIR = "/tmp/aesip_result_final_09/backend"
OUTPUT_BACKEND_DIR = os.path.join(
    os.path.dirname(__file__), "..", "output", "backend"
)

SCORR_KEYS_TOP = {"scorr_ms", "scorr_ok", "scorr_ms_average"}
SCORR_KEYS_VARIANT = {"scorr_ms", "scorr_ok"}


def main():
    with open(TIMING_JSON) as f:
        data = json.load(f)

    programs_in_output = set(os.listdir(OUTPUT_BACKEND_DIR))

    for prog_name, prog_info in data["programs"].items():
        if prog_name not in programs_in_output:
            print(f"[SKIP] {prog_name} not found in output/backend")
            continue

        # Remove scorr fields from top-level program entry
        for key in SCORR_KEYS_TOP:
            prog_info.pop(key, None)

        # Remove scorr fields from each variant
        for variant in prog_info.get("variants", []):
            for key in SCORR_KEYS_VARIANT:
                variant.pop(key, None)

        # Read total_synthesis_time from analysis_results.json
        result_path = os.path.join(
            BACKEND_RESULT_DIR, prog_name, "analysis_results.json"
        )
        if not os.path.exists(result_path):
            print(f"[WARN] {result_path} not found, skipping scorr_ms_average")
            continue

        with open(result_path) as f:
            result = json.load(f)

        total_synthesis_time = result.get("total_synthesis_time")
        if total_synthesis_time is None:
            print(f"[WARN] {prog_name}: total_synthesis_time missing")
            continue

        scorr_ms_average = total_synthesis_time / 27 * 1000
        prog_info["scorr_ms_average"] = round(scorr_ms_average, 2)
        print(f"[OK]   {prog_name}: total_synthesis_time={total_synthesis_time:.3f}s -> scorr_ms_average={scorr_ms_average:.2f}ms")

    # Collect per-program averages for summary stats
    scorr_avgs = []
    extract_avgs = []
    sat_ms_list = []
    for prog_info in data["programs"].values():
        s = prog_info.get("scorr_ms_average")
        e = prog_info.get("extraction_ms_average")
        sat = prog_info.get("saturation_ms")
        if s is not None:
            scorr_avgs.append(s)
        if e is not None:
            extract_avgs.append(e)
        if sat is not None:
            sat_ms_list.append(sat)

    summary = data.setdefault("summary", {})

    if scorr_avgs:
        summary["global_scorr_ms_average"] = round(sum(scorr_avgs) / len(scorr_avgs), 4)
        sorted_scorr = sorted(scorr_avgs)
        n = len(sorted_scorr)
        mid = n // 2
        median = sorted_scorr[mid] if n % 2 else (sorted_scorr[mid - 1] + sorted_scorr[mid]) / 2
        summary["global_scorr_ms_median"] = round(median, 4)
        summary["scorr_avg_max"] = round(max(scorr_avgs), 4)
        summary["scorr_avg_min"] = round(min(scorr_avgs), 4)

    if extract_avgs:
        summary["extract_avg_max"] = round(max(extract_avgs), 4)
        summary["extract_avg_min"] = round(min(extract_avgs), 4)

    if sat_ms_list:
        summary["sat_ms_max"] = max(sat_ms_list)
        summary["sat_ms_min"] = min(sat_ms_list)

    # E2E per variant: saturation_ms + extraction_ms + scorr_ms_average (22*27=594 total)
    e2e_list = []
    for prog_info in data["programs"].values():
        sat = prog_info.get("saturation_ms")
        scorr = prog_info.get("scorr_ms_average")
        if sat is None or scorr is None:
            continue
        for variant in prog_info.get("variants", []):
            ext = variant.get("extraction_ms")
            if ext is not None:
                e2e_list.append(sat + ext + scorr)

    if e2e_list:
        e2e_sorted = sorted(e2e_list)
        n = len(e2e_sorted)
        mid = n // 2
        e2e_median = e2e_sorted[mid] if n % 2 else (e2e_sorted[mid - 1] + e2e_sorted[mid]) / 2
        summary["e2e_ms_count"]  = n
        summary["e2e_ms_mean"]   = round(sum(e2e_list) / n, 4)
        summary["e2e_ms_median"] = round(e2e_median, 4)
        summary["e2e_ms_max"]    = round(max(e2e_list), 4)
        summary["e2e_ms_min"]    = round(min(e2e_list), 4)

    with open(TIMING_JSON, "w") as f:
        json.dump(data, f, indent=2)
    print("\nDone. timing.json updated.")
    if scorr_avgs:
        print(f"  global_scorr_ms_average = {summary['global_scorr_ms_average']:.4f} ms")
        print(f"  global_scorr_ms_median  = {summary['global_scorr_ms_median']:.4f} ms")
        print(f"  scorr_avg:   max={summary['scorr_avg_max']:.4f}  min={summary['scorr_avg_min']:.4f} ms")
    if extract_avgs:
        print(f"  extract_avg: max={summary['extract_avg_max']:.4f}  min={summary['extract_avg_min']:.4f} ms")
    if sat_ms_list:
        print(f"  sat_ms:      max={summary['sat_ms_max']}  min={summary['sat_ms_min']} ms")
    if e2e_list:
        print(f"  e2e_ms ({summary['e2e_ms_count']} runs): mean={summary['e2e_ms_mean']:.2f}  median={summary['e2e_ms_median']:.2f}  max={summary['e2e_ms_max']:.2f}  min={summary['e2e_ms_min']:.2f} ms")


if __name__ == "__main__":
    main()