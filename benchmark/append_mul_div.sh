#!/bin/bash

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Path to the mul and div clean files
MUL_CLEAN="../program_synthesis/ricsv_toolchain/mul_clean.s"
DIV_CLEAN="../program_synthesis/ricsv_toolchain/div_clean.s"
REPORT="$SCRIPT_DIR/rem_div_mul_report.json"

# Check if the required files exist
if [[ ! -f "$MUL_CLEAN" ]]; then
    echo "Error: $MUL_CLEAN not found!"
    exit 1
fi

if [[ ! -f "$DIV_CLEAN" ]]; then
    echo "Error: $DIV_CLEAN not found!"
    exit 1
fi

if [[ ! -f "$REPORT" ]]; then
    echo "Error: $REPORT not found! Run frontend/extract_instructions.py first."
    exit 1
fi

# Helper: query rem_div_mul_report.json for a benchmark stem
# Usage: query_report <stem> <key>   -> prints "true" or "false"
query_report() {
    local stem="$1"
    local key="$2"
    python3 -c "
import json, sys
data = json.load(open('$REPORT'))
entry = data.get('$stem')
if entry is None:
    sys.exit(1)
print(str(entry.get('$key', False)).lower())
"
}

# Dynamically find all *_clean.s files in benchmark directory
# Structure should be: category/benchmark/benchmark_name_clean.s
readarray -t WORKLOADS < <(find "$SCRIPT_DIR" -name "*_clean.s" -type f | \
    grep -E "(automotive|network|security|embench-iot_[0-9]+)/[^/]+/[^/]+_clean\.s$" | \
    sed "s|$SCRIPT_DIR/||" | sort)

echo "Found ${#WORKLOADS[@]} clean.s files to process"

# Process each file
for workload in "${WORKLOADS[@]}"; do
    file="$SCRIPT_DIR/$workload"

    # Check if file exists (safety check)
    if [[ ! -f "$file" ]]; then
        echo "Warning: File $file not found, skipping..."
        continue
    fi

    # Derive benchmark stem (strip _clean suffix)
    filename=$(basename "$file" _clean.s)

    # Check if mul/div routines are already present in the file
    if grep -q '^__mul:' "$file" 2>/dev/null || grep -q '^__riscv_div_lib_divsi3:' "$file" 2>/dev/null; then
        echo "Skipping: $workload (already has mul/div appended)"
        continue
    fi

    # Look up which patches are needed
    need_div=$(query_report "$filename" "div" 2>/dev/null || echo "true")
    need_mul=$(query_report "$filename" "mul" 2>/dev/null || echo "true")

    # Also treat rem as requiring div patch (rem/remu are implemented via div)
    has_rem=$(query_report "$filename" "rem" 2>/dev/null || echo "false")
    if [[ "$has_rem" == "true" ]]; then
        need_div="true"
    fi

    if [[ "$need_mul" != "true" && "$need_div" != "true" ]]; then
        echo "Skipping: $workload (no mul/div/rem instructions, no patch needed)"
        continue
    fi

    echo "Processing: $workload"
    echo "  Last line: '$last_line'"
    echo "  Appending: mul=$need_mul, div/rem=$need_div"

    echo >> "$file"
    echo >> "$file"

    if [[ "$need_mul" == "true" ]]; then
        cat "$MUL_CLEAN" >> "$file"
        echo >> "$file"
        echo >> "$file"
    fi

    if [[ "$need_div" == "true" ]]; then
        cat "$DIV_CLEAN" >> "$file"
    fi

    echo "  Done!"
done

echo "Processing complete!"
