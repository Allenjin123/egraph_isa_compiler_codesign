#!/bin/bash
###############################################################################
# Script to verify dijkstra_small_O3_rewrite.s
###############################################################################

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "========================================="
echo "RISC-V Rewrite Assembly Verification"
echo "========================================="
echo ""

# Files
CLEAN_ASM="$PROJECT_ROOT/benchmark/network/dijkstra/dijkstra_small_O3_clean.s"
REWRITE_ASM="$PROJECT_ROOT/benchmark/network/dijkstra/dijkstra_small_O3_rewrite.s"
REF_OUTPUT="$PROJECT_ROOT/mibench_script/network/dijkstra/old_output/output_small.txt"
PROGRAM_NAME="dijkstra_small_O3"

# Generate diff
DIFF_DIR="$PROJECT_ROOT/output/diff"
mkdir -p "$DIFF_DIR"
DIFF_FILE="$DIFF_DIR/${PROGRAM_NAME}.diff"

echo "Generating diff between clean and rewrite versions..."
diff -u "$CLEAN_ASM" "$REWRITE_ASM" > "$DIFF_FILE" 2>&1 || true
echo -e "${GREEN}✓ Diff saved to: $DIFF_FILE${NC}"
echo ""

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

# Check reference output exists
if [ ! -f "$REF_OUTPUT" ]; then
    echo -e "${RED}Error: Reference output not found: $REF_OUTPUT${NC}"
    exit 1
fi

# Create temp directory
BUILD_DIR=$(mktemp -d)
trap "rm -rf $BUILD_DIR" EXIT

echo "Building directory: $BUILD_DIR"
echo ""

###############################################################################
# Test Clean version
###############################################################################
echo "========================================="
echo "Testing CLEAN version"
echo "========================================="

CLEAN_EXE="$BUILD_DIR/dijkstra_clean"
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
if ! timeout 300 spike --isa="$SPIKE_ISA" "$PK" "$CLEAN_EXE" > "$CLEAN_OUTPUT" 2>/dev/null; then
    exit_code=$?
    if [ $exit_code -eq 124 ]; then
        echo -e "${RED}✗ Execution timeout${NC}"
        exit 1
    fi
    echo -e "${YELLOW}⚠ Exited with code $exit_code${NC}"
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

REWRITE_EXE="$BUILD_DIR/dijkstra_rewrite"
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
if ! timeout 300 spike --isa="$SPIKE_ISA" "$PK" "$REWRITE_EXE" > "$REWRITE_OUTPUT" 2>/dev/null; then
    exit_code=$?
    if [ $exit_code -eq 124 ]; then
        echo -e "${RED}✗ Execution timeout${NC}"
        exit 1
    fi
    echo -e "${YELLOW}⚠ Exited with code $exit_code${NC}"
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
    echo "Differences:"
    diff "$CLEAN_OUTPUT" "$REWRITE_OUTPUT" | head -20
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

