#!/bin/bash
###############################################################################
# Script to compile, run, and verify all *_clean.s files in benchmark directory
# 
# For each *_clean.s file:
# 1. Compile the .s file to executable
# 2. Run with spike and capture output
# 3. Compare with reference output in mibench_script/*/old_output/
###############################################################################

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MIBENCH_DIR="$SCRIPT_DIR/../mibench_script"

# Check for required tools
if ! command -v riscv32-unknown-elf-gcc &> /dev/null; then
    echo -e "${RED}Error: riscv32-unknown-elf-gcc not found in PATH${NC}"
    echo "Please set up RISC-V toolchain"
    exit 1
fi

if ! command -v spike &> /dev/null; then
    echo -e "${RED}Error: spike not found in PATH${NC}"
    echo "Please install RISC-V spike simulator"
    exit 1
fi

# Find pk (proxy kernel) for spike
if [ -z "$RISCV" ]; then
    echo -e "${YELLOW}Warning: RISCV environment variable not set${NC}"
    PK="pk"
else
    PK="$RISCV/riscv32-unknown-elf/bin/pk"
    if [ ! -f "$PK" ]; then
        PK="pk"
    fi
fi

# RISC-V compilation flags
RISCV_ARCH="rv32im_zicsr_zifencei"
RISCV_ABI="ilp32"
SPIKE_ISA="rv32im_zicsr_zifencei"

###############################################################################
# Function to determine program arguments based on benchmark name
###############################################################################
get_program_args() {
    local prog_name="$1"
    local size_type="$2"
    
    case "$prog_name" in
        *)
            echo ""
            ;;
    esac
}

###############################################################################
# Function to extract program info from filename
# Input: dijkstra_small_O3_clean.s
# Output: prog_name=dijkstra, size_type=small
###############################################################################
parse_filename() {
    local filename="$1"
    local basename="${filename%.s}"        # Remove .s
    basename="${basename%_clean}"          # Remove _clean
    
    # Try to extract size (small/large)
    local size_type="small"  # Default
    if [[ "$basename" =~ _large ]]; then
        size_type="large"
        basename="${basename%_large*}"
    elif [[ "$basename" =~ _small ]]; then
        size_type="small"
        basename="${basename%_small*}"
    fi
    
    # Remove optimization flags like _O3, _O2, etc
    basename="${basename%_O[0-3]}"
    basename="${basename%_O[0-3]s}"
    
    echo "$basename|$size_type"
}

###############################################################################
# Function to find corresponding mibench directory
###############################################################################
find_mibench_dir() {
    local prog_name="$1"
    
    # Special mappings for known aliases
    case "$prog_name" in
        bitcnts)
            prog_name="bitcount"
            ;;
    esac
    
    # Search in all category directories under mibench_script
    for category_dir in "$MIBENCH_DIR"/*; do
        if [ ! -d "$category_dir" ]; then
            continue
        fi
        for subdir in "$category_dir"/*; do
            if [ ! -d "$subdir" ]; then
                continue
            fi
            local dir_name
            dir_name=$(basename "$subdir")
            # Match by program name
            if [[ "$dir_name" == "$prog_name"* ]] || [[ "$prog_name" == "$dir_name"* ]]; then
                echo "$subdir"
                return 0
            fi
        done
    done
    
    return 1
}

###############################################################################
# Main processing
###############################################################################

echo "========================================="
echo "RISC-V Clean Assembly Verification"
echo "========================================="
echo ""


# Option: --compile-only (only check compilation, skip output verification)
VERIFY_OUTPUT=1
POSITIONAL=()
while [[ $# -gt 0 ]]; do
    case $1 in
        --compile-only)
            VERIFY_OUTPUT=0
            shift
            ;;
        *)
            POSITIONAL+=("$1")
            shift
            ;;
    esac
done
set -- "${POSITIONAL[@]}"

# Check if a specific file is provided
if [ $# -gt 0 ]; then
    # Process specific file
    if [ ! -f "$1" ]; then
        echo -e "${RED}Error: File not found: $1${NC}"
        exit 1
    fi
    clean_files=("$1")
    echo "Mode: Single file"
else
    # Find all *_clean.s files
    clean_files=($(find "$SCRIPT_DIR" -name "*_clean.s" -type f | sort))
    echo "Mode: All files"
fi

if [ ${#clean_files[@]} -eq 0 ]; then
    echo -e "${YELLOW}No *_clean.s files found in benchmark directory${NC}"
    exit 0
fi

echo "Found ${#clean_files[@]} *_clean.s files"
echo ""

# Statistics
total=0
passed=0
failed=0
skipped=0

# Process each file
for asm_file in "${clean_files[@]}"; do
    total=$((total + 1))
    
    # Get relative path
    rel_path="${asm_file#$SCRIPT_DIR/}"
    echo "[$total/${#clean_files[@]}] Processing: $rel_path"
    
    # Parse filename
    filename=$(basename "$asm_file")
    parse_result=$(parse_filename "$filename")
    prog_name="${parse_result%|*}"
    size_type="${parse_result#*|}"
    
    echo "  Program: $prog_name, Size: $size_type"
    
    suite="mibench"
    category="${rel_path%%/*}"
    if [[ "$category" == "embench-iot" ]]; then
        suite="embench"
    fi
    echo "  Suite: $suite"

    # Only check for reference output if VERIFY_OUTPUT==1 and suite==mibench
    if [ "$VERIFY_OUTPUT" -eq 1 ] && [[ "$suite" == "mibench" ]]; then
        if ! mibench_dir=$(find_mibench_dir "$prog_name"); then
            echo -e "  ${YELLOW}⚠ Cannot find mibench directory for $prog_name, skipping${NC}"
            skipped=$((skipped + 1))
            echo ""
            continue
        fi

        ref_output="$mibench_dir/old_output/output_${size_type}.txt"
        if [ ! -f "$ref_output" ]; then
            echo -e "  ${YELLOW}⚠ Reference output not found: $ref_output${NC}"
            skipped=$((skipped + 1))
            echo ""
            continue
        fi
    fi
    
    # Create temporary directory for build
    build_dir=$(mktemp -d)
    trap "rm -rf $build_dir" EXIT
    
    # Compile .s to executable
    exe_file="$build_dir/${prog_name}_${size_type}"
    echo "  Compiling..."
    
    if ! riscv32-unknown-elf-gcc \
        -march="$RISCV_ARCH" \
        -mabi="$RISCV_ABI" \
        -static \
        "$asm_file" \
        -o "$exe_file" 2>&1 | head -20; then
        echo -e "  ${RED}✗ Compilation failed${NC}"
        failed=$((failed + 1))
        rm -rf "$build_dir"
        echo ""
        continue
    fi
    
    # Get program arguments
    prog_args=$(get_program_args "$prog_name" "$size_type")

    if [ "$VERIFY_OUTPUT" -eq 0 ]; then
        echo "  [Compile-only mode] Skipping spike run and output verification."
        passed=$((passed + 1))
        rm -rf "$build_dir"
        echo ""
        continue
    fi

    # Run with spike (with 300 second timeout)
    output_file="$build_dir/output_${size_type}.txt"
    echo "  Running with spike..."

    if [ -n "$prog_args" ]; then
        echo "    Arguments: $prog_args"
        # Run spike with timeout, capture stdout only (stderr to /dev/null)
        set +e
        timeout 300 spike --isa="$SPIKE_ISA" "$PK" "$exe_file" $prog_args < /dev/null > "$output_file" 2>/dev/null
        exit_code=$?
        set -e
        if [ $exit_code -eq 124 ]; then
            echo -e "  ${RED}✗ Execution timeout (300s)${NC}"
            failed=$((failed + 1))
            rm -rf "$build_dir"
            echo ""
            continue
        elif [ $exit_code -ne 0 ]; then
            echo -e "  ${YELLOW}⚠ Program exited with code $exit_code (continuing)${NC}"
        fi
    else
        # Run spike with timeout, capture stdout only (stderr to /dev/null)
        echo "Running: timeout 300 spike --isa=\"$SPIKE_ISA\" \"$PK\" \"$exe_file\" < /dev/null > \"$output_file\" 2>/dev/null"
        set +e
        timeout 300 spike --isa="$SPIKE_ISA" "$PK" "$exe_file" < /dev/null > "$output_file" 2>/dev/null
        exit_code=$?
        set -e
        if [ $exit_code -eq 124 ]; then
            echo -e "  ${RED}✗ Execution timeout (300s)${NC}"
            failed=$((failed + 1))
            rm -rf "$build_dir"
            echo ""
            continue
        elif [ $exit_code -ne 0 ]; then
            echo -e "  ${YELLOW}⚠ Program exited with code $exit_code (continuing)${NC}"
        fi
    fi

    if [[ "$suite" == "mibench" ]]; then
        echo "  Comparing with reference output..."

        if diff -q "$output_file" "$ref_output" > /dev/null 2>&1; then
            echo -e "  ${GREEN}✓ Output matches reference${NC}"
            passed=$((passed + 1))
        else
            echo -e "  ${RED}✗ Output differs from reference${NC}"
            echo "    Reference: $ref_output"
            echo "    Generated: $output_file"

            echo "    First differences:"
            diff "$output_file" "$ref_output" | head -10 | sed 's/^/      /'

            failed=$((failed + 1))
        fi
    else
        if [ $exit_code -eq 0 ]; then
            echo -e "  ${GREEN}✓ Spike execution completed (no reference output)${NC}"
            passed=$((passed + 1))
        else
            echo -e "  ${RED}✗ Spike execution failed with code $exit_code${NC}"
            failed=$((failed + 1))
        fi
    fi

    # Clean up
    rm -rf "$build_dir"
    echo ""
done

# Summary
echo "========================================="
echo "Summary"
echo "========================================="
echo "Total files:   $total"
echo -e "${GREEN}Passed:        $passed${NC}"
echo -e "${RED}Failed:        $failed${NC}"
echo -e "${YELLOW}Skipped:       $skipped${NC}"
echo ""

if [ $failed -eq 0 ] && [ $passed -gt 0 ]; then
    echo -e "${GREEN}All tests passed!${NC}"
    exit 0
else
    exit 1
fi

