#!/bin/bash
###############################################################################
# Complete analysis pipeline:
# 1. Append mul/div subroutines to clean.s files if needed
# 2. Run spike instruction counts for all workloads (parallel)
# 3. Run block execution analysis for all workloads (sequential)
###############################################################################

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo -e "${MAGENTA}============================================================${NC}"
echo -e "${MAGENTA}Complete Analysis Pipeline${NC}"
echo -e "${MAGENTA}============================================================${NC}"
echo ""

# Step 1: Append mul/div subroutines (skipped if already done by run_multi_scale_variants.sh Step -2)
# Check if any clean.s file needs mul/div by looking for __mul label
NEEDS_APPEND=false
for f in $(find "$SCRIPT_DIR" -name "*_clean.s" -type f | grep -E "(automotive|network|security|embench-iot_[0-9]+)/" | head -5); do
    if ! grep -q '^__mul:' "$f" 2>/dev/null; then
        NEEDS_APPEND=true
        break
    fi
done

if [ "$NEEDS_APPEND" = true ]; then
    echo -e "${CYAN}Step 1: Appending mul/div subroutines to clean.s files${NC}"
    echo ""

    if ! ./append_mul_div.sh; then
        echo ""
        echo -e "${RED}Failed to append mul/div subroutines!${NC}"
        exit 1
    fi

    echo ""
    echo -e "${GREEN}✓ Mul/div subroutines appended to clean.s files${NC}"
else
    echo -e "${YELLOW}Step 1: Skipping mul/div append (already present)${NC}"
fi
echo ""

# Create tmp directory for logs and outputs
mkdir -p tmp

# Step 2: Run spike counts
echo -e "${CYAN}Step 2: Running Spike instruction counts (parallel)${NC}"
echo ""

if ! ./run_all_spike_counts.sh; then
    echo ""
    echo -e "${RED}Spike instruction counts failed!${NC}"
    echo -e "${YELLOW}Check logs in benchmark/tmp/*_spike_run.log${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}✓ Spike instruction counts completed${NC}"
echo ""

# Step 3: Run block analysis
echo -e "${CYAN}Step 3: Running block execution analysis${NC}"
echo ""

if ! ./run_all_block_analysis.sh; then
    echo ""
    echo -e "${RED}Block execution analysis failed!${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}✓ Block execution analysis completed${NC}"
echo ""

# Summary
echo -e "${MAGENTA}============================================================${NC}"
echo -e "${MAGENTA}Pipeline Complete!${NC}"
echo -e "${MAGENTA}============================================================${NC}"
echo ""
echo -e "${GREEN}All analyses completed successfully.${NC}"
echo ""
echo -e "${BLUE}Generated files:${NC}"
echo -e "  1. Spike outputs: benchmark/tmp/*/"
echo -e "     - asm_execution_map.txt (line -> execution count)"
echo -e "     - addr_counts.txt (PC -> execution count)"
echo -e "     - full.dump (disassembly with source mapping)"
echo ""
echo -e "  2. Block execution counts: output/frontend/*/block_execution_counts.txt"
echo -e "     - Shows execution count for each basic block"
echo ""

exit 0
