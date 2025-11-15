#!/bin/bash
###############################################################################
# Run spike_instruction_count.sh for all workloads in parallel
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

# Dynamically find all *_clean.s files in benchmark directory
# Structure should be: category/benchmark/benchmark_name_clean.s
readarray -t WORKLOADS < <(find "$SCRIPT_DIR" -name "*_clean.s" -type f | \
    grep -E "(automotive|network|security|embench-iot)/[^/]+/[^/]+_clean\.s$" | \
    sed "s|$SCRIPT_DIR/||" | sort)

echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}Running Spike Instruction Counts${NC}"
echo -e "${CYAN}Total workloads: ${#WORKLOADS[@]}${NC}"
echo -e "${CYAN}========================================${NC}"
echo ""

# Arrays to track PIDs and workload names
declare -a PIDS
declare -a NAMES

# Start all jobs in parallel
for workload in "${WORKLOADS[@]}"; do
    name=$(basename "$workload" .s)
    echo -e "${BLUE}Starting: $name${NC}"

    # Run in background and capture PID
    ./spike_instruction_count.sh "$workload" > "tmp/${name}_spike_run.log" 2>&1 &
    pid=$!

    PIDS+=($pid)
    NAMES+=($name)

    echo -e "  ${YELLOW}PID: $pid${NC}"
done

echo ""
echo -e "${MAGENTA}All jobs started. Waiting for completion...${NC}"
echo ""

# Wait for all jobs and track results
SUCCESS_COUNT=0
FAIL_COUNT=0
declare -a FAILED_NAMES

for i in "${!PIDS[@]}"; do
    pid=${PIDS[$i]}
    name=${NAMES[$i]}

    echo -e "${YELLOW}Waiting for: $name (PID: $pid)${NC}"

    if wait $pid; then
        echo -e "  ${GREEN}✓ $name completed successfully${NC}"
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        echo -e "  ${RED}✗ $name failed${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_NAMES+=($name)
    fi
done

echo ""
echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}All Jobs Completed${NC}"
echo -e "${CYAN}========================================${NC}"
echo ""
echo -e "Total: ${#WORKLOADS[@]} workloads"
echo -e "${GREEN}Success: $SUCCESS_COUNT${NC}"
echo -e "${RED}Failed: $FAIL_COUNT${NC}"

if [ $FAIL_COUNT -gt 0 ]; then
    echo ""
    echo -e "${RED}Failed workloads:${NC}"
    for name in "${FAILED_NAMES[@]}"; do
        echo -e "  ${RED}✗${NC} $name"
        echo -e "    Log: tmp/${name}_spike_run.log"
    done
fi

echo ""
echo -e "${BLUE}Output directories:${NC}"
for name in "${NAMES[@]}"; do
    latest=$(ls -td tmp/${name}_* 2>/dev/null | head -1)
    if [ -n "$latest" ]; then
        echo -e "  - $latest"
    fi
done

echo ""
echo -e "${MAGENTA}Done!${NC}"

# Exit with error if any failed
if [ $FAIL_COUNT -gt 0 ]; then
    exit 1
fi

exit 0
