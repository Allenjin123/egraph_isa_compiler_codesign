#!/bin/bash
###############################################################################
# Run analyze_block_execution.py for all workloads
# Requires: spike_instruction_count.sh already run to generate asm_execution_map.txt
###############################################################################

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Get directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
cd "$SCRIPT_DIR"

# Dynamically find all *_clean.s files and generate program names
readarray -t SOURCE_PATHS < <(find "$SCRIPT_DIR" -name "*_clean.s" -type f | \
    grep -E "(automotive|network|security|embench-iot)/[^/]+/[^/]+_clean\.s$" | \
    sed "s|$SCRIPT_DIR/||" | sort)

declare -a PROGRAMS=()
for source_path in "${SOURCE_PATHS[@]}"; do
    # Extract program name from filename (remove _clean.s suffix)
    filename=$(basename "$source_path")
    program_name="${filename%_clean.s}"
    PROGRAMS+=("$program_name")
done

echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}Running Block Execution Analysis${NC}"
echo -e "${CYAN}Total workloads: ${#PROGRAMS[@]}${NC}"
echo -e "${CYAN}========================================${NC}"
echo ""

SUCCESS_COUNT=0
FAIL_COUNT=0
declare -a FAILED_PROGRAMS

for i in "${!PROGRAMS[@]}"; do
    program="${PROGRAMS[$i]}"
    source_path="${SOURCE_PATHS[$i]}"

    echo -e "${BLUE}[$((i+1))/${#PROGRAMS[@]}] Processing: $program${NC}"

    # Paths
    source_file="$SCRIPT_DIR/$source_path"
    frontend_dir="$PROJECT_ROOT/output/frontend/$program"
    basic_blocks_dir="$frontend_dir/basic_blocks"
    output_file="$frontend_dir/block_execution_counts.txt"

    # Find most recent asm_execution_map.txt for this program
    map_file=$(find "$SCRIPT_DIR/tmp" -name "${program}_clean_*" -type d | sort -r | head -1)
    if [ -z "$map_file" ]; then
        echo -e "  ${RED}✗ No spike output found in tmp/${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$program (no spike output)")
        echo ""
        continue
    fi
    map_file="$map_file/asm_execution_map.txt"

    # Check if all required files exist
    if [ ! -f "$source_file" ]; then
        echo -e "  ${RED}✗ Source not found: $source_file${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$program (source not found)")
        echo ""
        continue
    fi

    if [ ! -f "$map_file" ]; then
        echo -e "  ${RED}✗ Execution map not found: $map_file${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$program (map not found)")
        echo ""
        continue
    fi

    if [ ! -d "$basic_blocks_dir" ]; then
        echo -e "  ${RED}✗ Basic blocks not found: $basic_blocks_dir${NC}"
        echo -e "  ${YELLOW}  Hint: Run frontend/run_full_analysis.sh $program first${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$program (basic blocks not found)")
        echo ""
        continue
    fi

    # Run analysis
    echo -e "  ${YELLOW}Source: $source_file${NC}"
    echo -e "  ${YELLOW}Map: $(basename $(dirname $map_file))${NC}"
    echo -e "  ${YELLOW}Blocks: $basic_blocks_dir${NC}"
    echo -e "  ${YELLOW}Output: $output_file${NC}"

    if python3 "$SCRIPT_DIR/analyze_block_execution.py" \
        "$source_file" \
        "$map_file" \
        "$basic_blocks_dir" \
        "$output_file" > /dev/null 2>&1; then

        echo -e "  ${GREEN}✓ Success${NC}"

        # Show summary
        blocks=$(grep "Total blocks:" "$output_file" | awk '{print $3}')
        analyzed=$(grep "Successfully analyzed:" "$output_file" | awk '{print $3}')
        echo -e "  ${GREEN}  Analyzed: $analyzed/$blocks blocks${NC}"

        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        echo -e "  ${RED}✗ Analysis failed${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$program (analysis failed)")
    fi

    echo ""
done

echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}Analysis Complete${NC}"
echo -e "${CYAN}========================================${NC}"
echo ""
echo -e "Total: ${#PROGRAMS[@]} workloads"
echo -e "${GREEN}Success: $SUCCESS_COUNT${NC}"
echo -e "${RED}Failed: $FAIL_COUNT${NC}"

if [ $FAIL_COUNT -gt 0 ]; then
    echo ""
    echo -e "${RED}Failed workloads:${NC}"
    for failed in "${FAILED_PROGRAMS[@]}"; do
        echo -e "  ${RED}✗${NC} $failed"
    done
fi

echo ""
echo -e "${BLUE}Output files:${NC}"
for program in "${PROGRAMS[@]}"; do
    output_file="$PROJECT_ROOT/output/frontend/$program/block_execution_counts.txt"
    if [ -f "$output_file" ]; then
        echo -e "  ${GREEN}✓${NC} $output_file"
    fi
done

echo ""
echo -e "${MAGENTA}Done!${NC}"

# Exit with error if any failed
if [ $FAIL_COUNT -gt 0 ]; then
    exit 1
fi

exit 0
