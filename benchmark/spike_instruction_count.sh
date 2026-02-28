#!/bin/bash
###############################################################################
# DEBUG VERSION - Spike instruction count with verbose output
###############################################################################

# Don't use set -e so we can see errors
# set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
NC='\033[0m'

echo -e "${MAGENTA}=== DEBUG MODE ===${NC}"
echo ""

# Check arguments
if [ $# -lt 1 ]; then
    echo "Usage: $0 <assembly_file.s> [program_args]"
    exit 1
fi

ASM_FILE="$1"
shift
PROG_ARGS="$@"

echo -e "${BLUE}[DEBUG] Input file: $ASM_FILE${NC}"
echo -e "${BLUE}[DEBUG] Program args: $PROG_ARGS${NC}"
echo ""


if [ ! -f "$ASM_FILE" ]; then
    echo -e "${RED}Error: File not found: $ASM_FILE${NC}"
    exit 1
fi

# Check for spike
echo -e "${YELLOW}[DEBUG] Checking for spike...${NC}"
which spike
if ! command -v spike &> /dev/null; then
    echo -e "${RED}Error: spike not found in PATH${NC}"
    echo "PATH=$PATH"
    exit 1
fi
echo -e "${GREEN}[DEBUG] Spike found${NC}"
echo ""

# Configuration
RISCV_ARCH="rv32im_zicsr_zifencei"
RISCV_ABI="ilp32"
SPIKE_ISA="rv32im_zicsr_zifencei"
BASE_NAME=$(basename "$ASM_FILE" .s)

# Timeout for spike execution (seconds). Override with env TIMEOUT if desired.
TIMEOUT="${TIMEOUT:-60}"

echo -e "${BLUE}[DEBUG] Configuration:${NC}"
echo "  RISCV_ARCH: $RISCV_ARCH"
echo "  RISCV_ABI: $RISCV_ABI"
echo "  SPIKE_ISA: $SPIKE_ISA"
echo "  BASE_NAME: $BASE_NAME"
echo "  TIMEOUT: ${TIMEOUT}s"
echo ""

# Find pk (proxy kernel)
echo -e "${YELLOW}[DEBUG] Looking for proxy kernel...${NC}"
echo "  RISCV env variable: '$RISCV'"

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

echo -e "${BLUE}[DEBUG] Using pk: $PK${NC}"

# Check if pk exists
if ! command -v "$PK" &> /dev/null && [ ! -f "$PK" ]; then
    echo -e "${YELLOW}[WARNING] pk might not be available${NC}"
fi
echo ""

# Create work directory - use local tmp instead of /tmp
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOCAL_TMP_DIR="$SCRIPT_DIR/tmp"
mkdir -p "$LOCAL_TMP_DIR"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
WORK_DIR="$LOCAL_TMP_DIR/${BASE_NAME}_${TIMESTAMP}"
mkdir -p "$WORK_DIR"
echo -e "${BLUE}[DEBUG] Work directory: $WORK_DIR${NC}"
echo -e "${BLUE}[DEBUG] Contents will be preserved on error for debugging${NC}"
echo ""

# Set up cleanup (but we'll make it conditional for debugging)
cleanup() {
    if [ "$KEEP_TEMP" = "1" ]; then
        echo -e "${YELLOW}[DEBUG] Keeping temp directory for debugging: $WORK_DIR${NC}"
    else
        echo -e "${BLUE}[DEBUG] Cleaning up $WORK_DIR${NC}"
        rm -rf "$WORK_DIR"
    fi
}
trap cleanup EXIT

###############################################################################
# Step 1: Compile
###############################################################################
echo -e "${MAGENTA}=== Step 1: Compiling ===${NC}"

EXE_FILE="$WORK_DIR/$BASE_NAME"
echo -e "${BLUE}[DEBUG] Output executable: $EXE_FILE${NC}"

echo -e "${BLUE}[DEBUG] Running compilation command:${NC}"
echo "riscv32-unknown-elf-gcc -march=$RISCV_ARCH -mabi=$RISCV_ABI -static -g -Wl,--no-relax $ASM_FILE -o $EXE_FILE"

if riscv32-unknown-elf-gcc \
    -march="$RISCV_ARCH" \
    -mabi="$RISCV_ABI" \
    -static \
    -g \
    -Wl,--no-relax \
    "$ASM_FILE" \
    -o "$EXE_FILE" 2> "$WORK_DIR/compile_errors.txt"; then
    echo -e "${GREEN}[DEBUG] Compilation successful${NC}"
    echo -e "${BLUE}[DEBUG] Executable size: $(ls -lh "$EXE_FILE" | awk '{print $5}')${NC}"
else
    echo -e "${RED}[DEBUG] Compilation failed!${NC}"
    echo -e "${RED}[DEBUG] Error output:${NC}"
    cat "$WORK_DIR/compile_errors.txt"
    KEEP_TEMP=1
    exit 1
fi
echo ""

###############################################################################
# Step 2: Get disassembly
###############################################################################
echo -e "${MAGENTA}=== Step 2: Getting disassembly ===${NC}"

echo -e "${BLUE}[DEBUG] Running objdump...${NC}"
riscv32-unknown-elf-objdump -d "$EXE_FILE" > "$WORK_DIR/objdump.txt"

OBJDUMP_LINES=$(wc -l < "$WORK_DIR/objdump.txt")
echo -e "${GREEN}[DEBUG] Objdump generated $OBJDUMP_LINES lines${NC}"

echo -e "${BLUE}[DEBUG] Generating full disassembly with source line mapping...${NC}"
riscv32-unknown-elf-objdump -d -l "$EXE_FILE" > "$WORK_DIR/full.dump"
FULL_DUMP_LINES=$(wc -l < "$WORK_DIR/full.dump")
echo -e "${GREEN}[DEBUG] Full disassembly with line info generated: $FULL_DUMP_LINES lines${NC}"
echo ""

###############################################################################
# Step 3: Select PC histogram mode (-g)
###############################################################################
echo -e "${MAGENTA}=== Step 3: Selecting logging mode ===${NC}"

# Always use PC histogram for fast per-PC execution counts
SPIKE_LOG_OPT="-g"
echo -e "${GREEN}[DEBUG] Using Spike PC histogram (-g)${NC}"
echo -e "${BLUE}[DEBUG] Will use spike option: $SPIKE_LOG_OPT${NC}"
echo ""

###############################################################################
# Step 4: Run spike with logging
###############################################################################
echo -e "${MAGENTA}=== Step 4: Running spike ===${NC}"
echo -e "${YELLOW}[DEBUG] This may take a while...${NC}"

SPIKE_CMD="spike --isa=$SPIKE_ISA $SPIKE_LOG_OPT $PK $EXE_FILE $PROG_ARGS"
echo -e "${BLUE}[DEBUG] Command: $SPIKE_CMD${NC}"

# Show what we're running
echo -e "${BLUE}[DEBUG] Starting spike at $(date)${NC}"

# Run spike with configurable timeout; capture both stdout+stderr in spike.log
if [ -n "$PROG_ARGS" ]; then
    echo -e "${BLUE}[DEBUG] Running with args: $PROG_ARGS${NC}"
    # Redirect stdin from /dev/null, capture both stdout and stderr (for -g histogram)
    timeout "$TIMEOUT" spike --isa="$SPIKE_ISA" $SPIKE_LOG_OPT "$PK" "$EXE_FILE" $PROG_ARGS < /dev/null > "$WORK_DIR/spike.log" 2>&1
    SPIKE_EXIT=$?
else
    echo -e "${BLUE}[DEBUG] Running without args${NC}"
    timeout "$TIMEOUT" spike --isa="$SPIKE_ISA" $SPIKE_LOG_OPT "$PK" "$EXE_FILE" < /dev/null \
        > "$WORK_DIR/spike.log" 2>&1
    SPIKE_EXIT=$?
fi

echo -e "${BLUE}[DEBUG] Spike finished at $(date) with exit code: $SPIKE_EXIT${NC}"

if [ $SPIKE_EXIT -eq 124 ]; then
    echo -e "${YELLOW}[DEBUG] Spike timed out after ${TIMEOUT} seconds${NC}"
elif [ $SPIKE_EXIT -ne 0 ]; then
    echo -e "${YELLOW}[DEBUG] Spike exited with code $SPIKE_EXIT${NC}"
fi

# Check output files
echo -e "${BLUE}[DEBUG] Spike log size: $(wc -c < "$WORK_DIR/spike.log") bytes${NC}"

if [ ! -s "$WORK_DIR/spike.log" ]; then
    echo -e "${RED}[DEBUG] No log generated!${NC}"
    echo -e "${YELLOW}[DEBUG] First 20 lines of combined output (if any):${NC}"
    head -20 "$WORK_DIR/spike.log" || true
    KEEP_TEMP=1
    exit 1
fi

echo -e "${GREEN}[DEBUG] Log file generated${NC}"
echo -e "${BLUE}[DEBUG] First 10 lines of log:${NC}"
head -10 "$WORK_DIR/spike.log"
echo ""

###############################################################################
# Step 5: Parse PC histogram
###############################################################################
echo -e "${MAGENTA}=== Step 5: Parsing PC histogram ===${NC}"

# Spike -g typically prints lines like: 0xADDR COUNT
grep -E '^(0x)?[0-9a-fA-F]+\s+[0-9]+' "$WORK_DIR/spike.log" | \
    awk '{addr=$1; cnt=$2; if (substr(addr,1,2)!="0x") addr="0x" addr; print addr, cnt}' \
    > "$WORK_DIR/addr_counts.txt" || true

if [ ! -s "$WORK_DIR/addr_counts.txt" ]; then
    echo -e "${RED}[DEBUG] No histogram entries found in spike.log${NC}"
    echo -e "${YELLOW}[DEBUG] Showing tail of spike.log for context:${NC}"
    tail -50 "$WORK_DIR/spike.log" || true
    KEEP_TEMP=1
    exit 1
fi

echo -e "${BLUE}[DEBUG] Parsed $(wc -l < "$WORK_DIR/addr_counts.txt") histogram entries${NC}"
echo -e "${BLUE}[DEBUG] Top 10 entries (PC count):${NC}"
sort -k2 -rn "$WORK_DIR/addr_counts.txt" | head -10
echo ""

###############################################################################
# Step 6: Count executions
###############################################################################
echo -e "${MAGENTA}=== Step 6: Summary ===${NC}"
UNIQUE_ADDRS=$(wc -l < "$WORK_DIR/addr_counts.txt")
TOTAL_COUNT=$(awk '{s+=$2} END{print s+0}' "$WORK_DIR/addr_counts.txt")
echo -e "${BLUE}[DEBUG] Unique PCs: $UNIQUE_ADDRS${NC}"
echo -e "${BLUE}[DEBUG] Total executed instructions (approx by PCs): $TOTAL_COUNT${NC}"
echo ""

###############################################################################
# Step 7: Generate assembly-to-execution mapping
###############################################################################
echo -e "${MAGENTA}=== Step 7: Generating assembly-to-execution mapping ===${NC}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MAP_SCRIPT="$SCRIPT_DIR/map_asm_to_execution.py"

if [ -f "$MAP_SCRIPT" ]; then
    echo -e "${BLUE}[DEBUG] Running mapping script...${NC}"
    if python3 "$MAP_SCRIPT" \
        "$ASM_FILE" \
        "$WORK_DIR/full.dump" \
        "$WORK_DIR/addr_counts.txt" \
        "$WORK_DIR/asm_execution_map.txt"; then
        echo -e "${GREEN}[DEBUG] Mapping generated successfully${NC}"
        echo -e "${BLUE}[DEBUG] Output: $WORK_DIR/asm_execution_map.txt${NC}"
        echo -e "${BLUE}[DEBUG] Preview (first 10 lines):${NC}"
        head -12 "$WORK_DIR/asm_execution_map.txt"
    else
        echo -e "${YELLOW}[WARNING] Mapping script failed${NC}"
    fi
else
    echo -e "${YELLOW}[WARNING] Mapping script not found: $MAP_SCRIPT${NC}"
fi
echo ""

###############################################################################
# Final status
###############################################################################
echo -e "${MAGENTA}=== Debug Summary ===${NC}"
echo "Work directory: $WORK_DIR"
echo "Files created:"
ls -la "$WORK_DIR"
echo ""
echo -e "${GREEN}To examine the files:${NC}"
echo "  cd $WORK_DIR"
echo "  cat spike.log | less              # View spike log"
echo "  cat addr_counts.txt               # View execution counts by PC"
echo "  cat asm_execution_map.txt | less  # View assembly-to-execution mapping"
echo "  cat full.dump | less              # View full disassembly with source lines"
echo ""
echo -e "${YELLOW}To clean up manually:${NC}"
echo "  rm -rf $WORK_DIR"
echo ""

# Keep temp files for debugging
KEEP_TEMP=1

echo -e "${MAGENTA}=== End of Debug ===${NC}"