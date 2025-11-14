#!/bin/bash

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Path to the mul and div clean files
MUL_CLEAN="../program_synthesis/ricsv_toolchain/mul_clean.s"
DIV_CLEAN="../program_synthesis/ricsv_toolchain/div_clean.s"

# Check if the required files exist
if [[ ! -f "$MUL_CLEAN" ]]; then
    echo "Error: $MUL_CLEAN not found!"
    exit 1
fi

if [[ ! -f "$DIV_CLEAN" ]]; then
    echo "Error: $DIV_CLEAN not found!"
    exit 1
fi

# Dynamically find all *_clean.s files in benchmark directory
# Structure should be: category/benchmark/benchmark_name_clean.s
readarray -t WORKLOADS < <(find "$SCRIPT_DIR" -name "*_clean.s" -type f | \
    grep -E "(automotive|network|security|embench-iot)/[^/]+/[^/]+_clean\.s$" | \
    sed "s|$SCRIPT_DIR/||" | sort)

echo "DRY RUN MODE - No files will be modified"
echo "Found ${#WORKLOADS[@]} clean.s files to check"
echo

needs_update=0
already_done=0

# Process each file
for workload in "${WORKLOADS[@]}"; do
    file="$SCRIPT_DIR/$workload"

    # Check if file exists (safety check)
    if [[ ! -f "$file" ]]; then
        echo "Warning: File $file not found, skipping..."
        continue
    fi

    # Get the last line of the file (trim whitespace)
    last_line=$(tail -1 "$file" | sed 's/[[:space:]]*$//')

    # Check if it ends with "# end of subroutine"
    if [[ "$last_line" != "# end of subroutine" ]]; then
        echo "WOULD UPDATE: $workload"
        echo "  Current last line: '$last_line'"
        ((needs_update++))
    else
        ((already_done++))
    fi
done

echo
echo "Summary:"
echo "  Files that need updating: $needs_update"
echo "  Files already done: $already_done"
echo "  Total files checked: ${#WORKLOADS[@]}"