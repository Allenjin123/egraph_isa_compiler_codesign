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

echo "Found ${#WORKLOADS[@]} clean.s files to process"

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
        echo "Processing: $workload"
        echo "  Last line: '$last_line'"
        echo "  Appending mul_clean.s and div_clean.s..."

        # Append mul_clean.s and div_clean.s (order matters!)
        cat "$MUL_CLEAN" >> "$file"
        cat "$DIV_CLEAN" >> "$file"

        echo "  Done!"
    else
        echo "Skipping: $workload (already ends with '# end of subroutine')"
    fi
done

echo "Processing complete!"