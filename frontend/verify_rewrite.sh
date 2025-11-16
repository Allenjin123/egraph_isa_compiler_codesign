#!/bin/bash
###############################################################################
# Script to verify *_rewrite.s files against *_clean.s and reference outputs
# Usage: ./verify_rewrite.sh <program_name>
# Example: ./verify_rewrite.sh dijkstra_small_O3
###############################################################################

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
BENCHMARK_DIR="$PROJECT_ROOT/benchmark"
MIBENCH_DIR="$PROJECT_ROOT/mibench_script"

###############################################################################
# Usage
###############################################################################
usage() {
    echo "Usage: $0 <program_name> [diff]"
    echo ""
    echo "Arguments:"
    echo "  program_name  - Name of the program to verify"
    echo "  diff          - Optional: generate diff file between clean and rewrite versions"
    echo ""
    echo "Examples:"
    echo "  $0 dijkstra_small_O3          # Verify without generating diff"
    echo "  $0 dijkstra_small_O3 diff     # Verify and generate diff file"
    echo "  $0 qsort_large_O3 diff"
    echo ""
    echo "The script will search for <program_name>_rewrite.s and <program_name>_clean.s"
    echo "in the benchmark directory."
    exit 1
}

# Check argument
if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo -e "${RED}Error: Invalid number of arguments${NC}"
    echo ""
    usage
fi

PROGRAM_NAME="$1"
GENERATE_DIFF=0

# Check if second argument is "diff"
if [ $# -eq 2 ]; then
    if [ "$2" = "diff" ]; then
        GENERATE_DIFF=1
    else
        echo -e "${RED}Error: Second argument must be 'diff'${NC}"
        echo ""
        usage
    fi
fi

###############################################################################
# Function to determine program arguments based on benchmark name
###############################################################################
get_program_args() {
    local prog_name="$1"
    local size_type="$2"
    
    case "$prog_name" in
        bitcount|bitcnts)
            if [ "$size_type" = "small" ]; then
                echo "75000"
            else
                echo "1125000"
            fi
            ;;
        *)
            echo ""
            ;;
    esac
}

###############################################################################
# Function to extract program info from filename
# Input: dijkstra_small_O3
# Output: prog_name=dijkstra, size_type=small
###############################################################################
parse_program_name() {
    local name="$1"
    
    # Try to extract size (small/large)
    local size_type="small"  # Default
    if [[ "$name" =~ _large ]]; then
        size_type="large"
        name="${name%_large*}"
    elif [[ "$name" =~ _small ]]; then
        size_type="small"
        name="${name%_small*}"
    fi
    
    # Remove optimization flags like _O3, _O2, etc
    name="${name%_O[0-3]}"
    name="${name%_O[0-3]s}"
    # Also handle Oz variants
    name="${name%_Oz}"
    name="${name%_Ozs}"
    
    echo "$name|$size_type"
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
    
    # Search in network and automotive directories
    for category in network automotive security; do
        for subdir in "$MIBENCH_DIR/$category"/*; do
            if [ -d "$subdir" ]; then
                local dir_name=$(basename "$subdir")
                # Match by program name
                if [[ "$dir_name" == "$prog_name"* ]] || [[ "$prog_name" == "$dir_name"* ]]; then
                    echo "$subdir"
                    return 0
                fi
            fi
        done
    done
    
    return 1
}

###############################################################################
# Find rewrite and clean files
###############################################################################
echo "========================================="
echo "RISC-V Rewrite Assembly Verification"
echo "========================================="
echo ""

echo "Searching for: ${PROGRAM_NAME}_rewrite.s and ${PROGRAM_NAME}_clean.s"
echo ""

# Find rewrite file
REWRITE_FILES=($(find "$BENCHMARK_DIR" -name "${PROGRAM_NAME}_rewrite_variant_0.s" -type f))

if [ ${#REWRITE_FILES[@]} -eq 0 ]; then
    echo -e "${RED}Error: No ${PROGRAM_NAME}_rewrite_variant_0.s found in benchmark directory${NC}"
    exit 1
elif [ ${#REWRITE_FILES[@]} -gt 1 ]; then
    echo -e "${RED}Error: Multiple ${PROGRAM_NAME}_rewrite_variant_0.s files found:${NC}"
    for f in "${REWRITE_FILES[@]}"; do
        echo "  - $f"
    done
    exit 1
fi

REWRITE_ASM="${REWRITE_FILES[0]}"

# Find clean file
CLEAN_FILES=($(find "$BENCHMARK_DIR" -name "${PROGRAM_NAME}_clean.s" -type f))

if [ ${#CLEAN_FILES[@]} -eq 0 ]; then
    echo -e "${RED}Error: No ${PROGRAM_NAME}_clean.s found in benchmark directory${NC}"
    exit 1
elif [ ${#CLEAN_FILES[@]} -gt 1 ]; then
    echo -e "${RED}Error: Multiple ${PROGRAM_NAME}_clean.s files found:${NC}"
    for f in "${CLEAN_FILES[@]}"; do
        echo "  - $f"
    done
    exit 1
fi

CLEAN_ASM="${CLEAN_FILES[0]}"

echo "Rewrite file: $REWRITE_ASM"
echo "Clean file:   $CLEAN_ASM"
echo ""

# Parse program name
parse_result=$(parse_program_name "$PROGRAM_NAME")
prog_name="${parse_result%|*}"
size_type="${parse_result#*|}"

echo "Program: $prog_name"
echo "Size:    $size_type"
echo ""

# Find mibench directory
if ! mibench_dir=$(find_mibench_dir "$prog_name"); then
    echo -e "${RED}Error: Cannot find mibench directory for $prog_name${NC}"
    exit 1
fi

REF_OUTPUT="$mibench_dir/old_output/output_${size_type}.txt"
if [ ! -f "$REF_OUTPUT" ]; then
    echo -e "${RED}Error: Reference output not found: $REF_OUTPUT${NC}"
    exit 1
fi

echo "Reference:    $REF_OUTPUT"
echo ""

# Get program arguments
prog_args=$(get_program_args "$prog_name" "$size_type")
if [ -n "$prog_args" ]; then
    echo "Arguments:    $prog_args"
    echo ""
fi

# Generate diff (optional)
if [ $GENERATE_DIFF -eq 1 ]; then
    DIFF_DIR="$PROJECT_ROOT/output/diff"
    mkdir -p "$DIFF_DIR"
    DIFF_FILE="$DIFF_DIR/${PROGRAM_NAME}.diff"

    echo "Generating diff between clean and rewrite versions..."
    diff -u "$CLEAN_ASM" "$REWRITE_ASM" > "$DIFF_FILE" 2>&1 || true
    echo -e "${GREEN}✓ Diff saved to: $DIFF_FILE${NC}"
    echo ""
else
    echo "Skipping diff generation (use 'diff' argument to enable)"
    echo ""
fi

# RISC-V settings
RISCV_ARCH="rv32im_zicsr_zifencei"
RISCV_ABI="ilp32"
SPIKE_ISA="rv32im_zicsr_zifencei"

# Find pk
if [ -z "$RISCV" ]; then
    PK="pk"
else
    PK="$RISCV/riscv32-unknown-elf/bin/pk"
    if [ ! -f "$PK" ]; then
        PK="pk"
    fi
fi

# Create temp directory
BUILD_DIR=$(mktemp -d)
# Save outputs to project directory for inspection
OUTPUT_SAVE_DIR="$PROJECT_ROOT/output/verify_outputs"
mkdir -p "$OUTPUT_SAVE_DIR"
trap "rm -rf $BUILD_DIR" EXIT

###############################################################################
# Test Clean version
###############################################################################
echo "========================================="
echo "Testing CLEAN version"
echo "========================================="

CLEAN_EXE="$BUILD_DIR/${PROGRAM_NAME}_clean"
echo "Compiling clean.s..."
if ! riscv32-unknown-elf-gcc \
    -march="$RISCV_ARCH" \
    -mabi="$RISCV_ABI" \
    -static \
    "$CLEAN_ASM" \
    -o "$CLEAN_EXE" 2>&1 | head -20; then
    echo -e "${RED}✗ Clean compilation failed${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Compilation succeeded${NC}"

echo "Running with spike..."
CLEAN_OUTPUT="$BUILD_DIR/output_clean.txt"

if [ -n "$prog_args" ]; then
    if ! timeout 300 spike --isa="$SPIKE_ISA" "$PK" "$CLEAN_EXE" $prog_args < /dev/null > "$CLEAN_OUTPUT" 2>/dev/null; then
        exit_code=$?
        if [ $exit_code -eq 124 ]; then
            echo -e "${RED}✗ Execution timeout${NC}"
            exit 1
        fi
        echo -e "${YELLOW}⚠ Exited with code $exit_code${NC}"
    fi
else
    if ! timeout 300 spike --isa="$SPIKE_ISA" "$PK" "$CLEAN_EXE" < /dev/null > "$CLEAN_OUTPUT" 2>/dev/null; then
        exit_code=$?
        if [ $exit_code -eq 124 ]; then
            echo -e "${RED}✗ Execution timeout${NC}"
            exit 1
        fi
        echo -e "${YELLOW}⚠ Exited with code $exit_code${NC}"
    fi
fi
echo -e "${GREEN}✓ Execution completed${NC}"

echo "Comparing with reference..."
if diff -q "$CLEAN_OUTPUT" "$REF_OUTPUT" > /dev/null 2>&1; then
    echo -e "${GREEN}✓ Clean output matches reference${NC}"
else
    echo -e "${RED}✗ Clean output differs from reference${NC}"
    echo "First differences:"
    diff "$CLEAN_OUTPUT" "$REF_OUTPUT" | head -10
fi
echo ""

###############################################################################
# Test Rewrite version
###############################################################################
echo "========================================="
echo "Testing REWRITE version"
echo "========================================="

REWRITE_EXE="$BUILD_DIR/${PROGRAM_NAME}_rewrite"
echo "Compiling rewrite.s..."
if ! riscv32-unknown-elf-gcc \
    -march="$RISCV_ARCH" \
    -mabi="$RISCV_ABI" \
    -static \
    "$REWRITE_ASM" \
    -o "$REWRITE_EXE" 2>&1 | head -20; then
    echo -e "${RED}✗ Rewrite compilation failed${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Compilation succeeded${NC}"

echo "Running with spike..."
REWRITE_OUTPUT="$BUILD_DIR/output_rewrite.txt"

if [ -n "$prog_args" ]; then
    if ! timeout 300 spike --isa="$SPIKE_ISA" "$PK" "$REWRITE_EXE" $prog_args < /dev/null > "$REWRITE_OUTPUT" 2>/dev/null; then
        exit_code=$?
        if [ $exit_code -eq 124 ]; then
            echo -e "${RED}✗ Execution timeout${NC}"
            exit 1
        fi
        echo -e "${YELLOW}⚠ Exited with code $exit_code${NC}"
    fi
else
    if ! timeout 300 spike --isa="$SPIKE_ISA" "$PK" "$REWRITE_EXE" < /dev/null > "$REWRITE_OUTPUT" 2>/dev/null; then
        exit_code=$?
        if [ $exit_code -eq 124 ]; then
            echo -e "${RED}✗ Execution timeout${NC}"
            exit 1
        fi
        echo -e "${YELLOW}⚠ Exited with code $exit_code${NC}"
    fi
fi
echo -e "${GREEN}✓ Execution completed${NC}"

echo "Comparing with reference..."
if diff -q "$REWRITE_OUTPUT" "$REF_OUTPUT" > /dev/null 2>&1; then
    echo -e "${GREEN}✓ Rewrite output matches reference${NC}"
    REWRITE_PASS=1
else
    echo -e "${RED}✗ Rewrite output differs from reference${NC}"
    echo "First differences:"
    diff "$REWRITE_OUTPUT" "$REF_OUTPUT" | head -10
    REWRITE_PASS=0
fi
echo ""

###############################################################################
# Compare Clean vs Rewrite
###############################################################################
echo "========================================="
echo "Comparing CLEAN vs REWRITE outputs"
echo "========================================="

if diff -q "$CLEAN_OUTPUT" "$REWRITE_OUTPUT" > /dev/null 2>&1; then
    echo -e "${GREEN}✓ Clean and Rewrite outputs are IDENTICAL${NC}"
else
    echo -e "${YELLOW}⚠ Clean and Rewrite outputs differ${NC}"
    echo ""
    echo "--- CLEAN OUTPUT ---"
    cat "$CLEAN_OUTPUT"
    echo ""
    echo "--- REWRITE OUTPUT ---"
    cat "$REWRITE_OUTPUT"
    echo ""
    echo "--- DIFF (Clean vs Rewrite) ---"
    diff "$CLEAN_OUTPUT" "$REWRITE_OUTPUT"
fi
echo ""

###############################################################################
# Summary
###############################################################################
echo "========================================="
echo "Summary"
echo "========================================="
echo "Clean version:   ✓ (baseline)"
if [ $REWRITE_PASS -eq 1 ]; then
    echo -e "Rewrite version: ${GREEN}✓ PASSED${NC}"
    echo ""
    echo -e "${GREEN}Rewrite version produces correct output!${NC}"
    exit 0
else
    echo -e "Rewrite version: ${RED}✗ FAILED${NC}"
    echo ""
    echo -e "${RED}Rewrite version output is incorrect${NC}"
    exit 1
fi
