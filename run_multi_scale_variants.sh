#!/bin/bash
# ============================================================================
# Multi-Scale Variant Generation Script
#
# Runs ILP extraction with multiple scaling factors and reconstructs all variants
# Each scaling factor generates K variants, resulting in N*K total variants
#
# Usage: ./run_multi_scale_variants.sh <program_name> [options]
# ============================================================================

set -e  # Exit on error

# Default configuration
DEFAULT_SCALES="0 0.0005 0.001 0.002 0.005 0.01 0.1 0.5 1 10"
DEFAULT_K=3
DEFAULT_TIMEOUT=180
DEFAULT_PROGRAM_PARALLEL=4     # Number of programs to process in parallel
DEFAULT_ILP_PARALLEL=24        # Number of ILP scaling factors to run in parallel per program
DEFAULT_SYNTH_PARALLEL=38      # Number of synthesis processes to run in parallel
DEFAULT_CLEAN=true             # Clean old outputs by default
DEFAULT_RUN_SATURATION=true    # Run saturation by default
# DEFAULT_PROGRAMS is now dynamically determined from available clean.s files

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# Script directories
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRACTOR_DIR="$SCRIPT_DIR/Extractor"
FRONTEND_DIR="$SCRIPT_DIR/frontend"
OUTPUT_BASE="$SCRIPT_DIR/output"
BACKEND_OUTPUT="$SCRIPT_DIR/output/backend"
BENCHMARK_DIR="$SCRIPT_DIR/benchmark"

# Function to discover available programs from clean.s files
discover_available_programs() {
    local programs=()

    # Find all *_clean.s files in benchmark directory
    while IFS= read -r clean_file; do
        # Extract program name (remove _clean.s suffix)
        local filename=$(basename "$clean_file")
        local program_name="${filename%_clean.s}"
        programs+=("$program_name")
    done < <(find "$BENCHMARK_DIR" -name "*_clean.s" -type f | \
             grep -E "(automotive|network|security|embench-iot)/[^/]+/[^/]+_clean\.s$" | sort)

    echo "${programs[@]}"
}

# Function to display usage
usage() {
    echo "使用方法: $0 [program_names...] [options]"
    echo ""
    echo "参数:"
    echo "  program_names              程序名称列表（可选，默认运行所有发现的基准程序）"
    echo ""
    echo "选项:"
    echo "  -s, --scales SCALES        空格分隔的缩放因子列表 (默认: '$DEFAULT_SCALES')"
    echo "  -k, --best-k K             每个缩放因子的变体数 (默认: $DEFAULT_K)"
    echo "  -t, --timeout TIMEOUT      ILP 求解器超时秒数 (默认: $DEFAULT_TIMEOUT)"
    echo "  -p, --program-parallel N   同时处理的程序数量 (默认: $DEFAULT_PROGRAM_PARALLEL)"
    echo "  -i, --ilp-parallel N       每个程序并行运行的ILP缩放因子数 (默认: $DEFAULT_ILP_PARALLEL)"
    echo "  -sy, --synth-parallel N    并行合成进程数 (默认: $DEFAULT_SYNTH_PARALLEL)"
    echo "  -o, --output-dir DIR       输出目录基础路径 (默认: output/backend/)"
    echo "  --clean                    清理旧输出（默认：是）"
    echo "  --no-clean                 不清理旧输出"
    echo "  --skip-frontend            skip front end processing"
    echo "  --skip-saturation          跳过饱和步骤（使用现有 JSON 文件）"
    echo "  -r, --reconstruct-only     仅重建汇编文件（跳过 ILP 提取）"
    echo "  -h, --help                 显示此帮助信息"
    echo ""
    echo "可用基准程序 (自动发现):"
    local available_programs=$(discover_available_programs)
    local program_count=$(echo "$available_programs" | wc -w)
    echo "  找到 $program_count 个程序: $available_programs"
    echo ""
    echo "示例:"
    echo "  $0                                                     # 运行所有发现的基准程序"
    echo "  $0 dijkstra_small_O3                                   # 运行单个程序"
    echo "  $0 dijkstra_small_O3 basicmath_small_O3                # 运行2个程序"
    echo "  $0 -s '0 1 100' -k 5                                   # 所有程序，3个缩放因子，每个5个变体"
    echo "  $0 -p 4                                                # 同时处理4个程序"
    echo "  $0 -p 6 -i 10                                          # 6个程序并行，每个程序10个ILP并行"
    echo "  $0 dijkstra_small_O3 -i 10 -t 300                      # 单个程序，10个ILP并行任务，300秒超时"
    echo "  $0 dijkstra_small_O3 -sy 72                            # 单个程序，72个并行合成进程"
    echo "  $0 --skip-saturation --no-clean                        # 所有程序，跳过清理和饱和"
    echo ""
    exit 1
}

# Parse command line arguments
# Check for help first
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    usage
fi

PROGRAM_NAMES=()
SCALES="$DEFAULT_SCALES"
BEST_K="$DEFAULT_K"
TIMEOUT="$DEFAULT_TIMEOUT"
PROGRAM_PARALLEL="$DEFAULT_PROGRAM_PARALLEL"
ILP_PARALLEL="$DEFAULT_ILP_PARALLEL"
SYNTH_PARALLEL="$DEFAULT_SYNTH_PARALLEL"
OUTPUT_BASE_DIR=""
RECONSTRUCT_ONLY=false
CLEAN_OUTPUTS="$DEFAULT_CLEAN"
SKIP_FRONTEND=false
RUN_SATURATION="$DEFAULT_RUN_SATURATION"

# Parse all arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -s|--scales)
            SCALES="$2"
            shift 2
            ;;
        -k|--best-k)
            BEST_K="$2"
            shift 2
            ;;
        -t|--timeout)
            TIMEOUT="$2"
            shift 2
            ;;
        -p|--program-parallel)
            PROGRAM_PARALLEL="$2"
            shift 2
            ;;
        -i|--ilp-parallel)
            ILP_PARALLEL="$2"
            shift 2
            ;;
        -sy|--synth-parallel)
            SYNTH_PARALLEL="$2"
            shift 2
            ;;
        -o|--output-dir)
            OUTPUT_BASE_DIR="$2"
            shift 2
            ;;
        --clean)
            CLEAN_OUTPUTS=true
            shift
            ;;
        --no-clean)
            CLEAN_OUTPUTS=false
            shift
            ;;
        --skip-frontend)
            SKIP_FRONTEND=true
            shift
            ;;
        --skip-saturation)
            RUN_SATURATION=false
            shift
            ;;
        -r|--reconstruct-only)
            RECONSTRUCT_ONLY=true
            shift
            ;;
        -h|--help)
            usage
            ;;
        -*)
            echo -e "${RED}错误: 未知选项 $1${NC}"
            usage
            ;;
        *)
            # This is a program name
            PROGRAM_NAMES+=("$1")
            shift
            ;;
    esac
done

# If no program names provided, discover all available programs
if [ ${#PROGRAM_NAMES[@]} -eq 0 ]; then
    echo -e "${YELLOW}未指定程序，自动发现所有可用基准程序...${NC}"

    # Discover available programs from clean.s files
    DISCOVERED_PROGRAMS=$(discover_available_programs)
    if [ -z "$DISCOVERED_PROGRAMS" ]; then
        echo -e "${RED}错误: 未找到任何 *_clean.s 文件在 benchmark/ 目录${NC}"
        echo -e "${RED}请确保 benchmark/ 目录包含正确结构的 clean.s 文件${NC}"
        exit 1
    fi

    IFS=' ' read -ra PROGRAM_NAMES <<< "$DISCOVERED_PROGRAMS"
    echo -e "${GREEN}发现 ${#PROGRAM_NAMES[@]} 个程序: ${PROGRAM_NAMES[*]}${NC}"
fi

# Set output base directory if not specified
if [ -z "$OUTPUT_BASE_DIR" ]; then
    OUTPUT_BASE_DIR="$BACKEND_OUTPUT"
fi

# Convert scales string to array
IFS=' ' read -ra SCALE_ARRAY <<< "$SCALES"
NUM_SCALES=${#SCALE_ARRAY[@]}
TOTAL_VARIANTS_PER_PROGRAM=$((NUM_SCALES * BEST_K))
NUM_PROGRAMS=${#PROGRAM_NAMES[@]}
TOTAL_PROGRAMS_VARIANTS=$((TOTAL_VARIANTS_PER_PROGRAM * NUM_PROGRAMS))

# ============================================================================
# Display global configuration
# ============================================================================
echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}多缩放因子变体生成 - 批处理模式${NC}"
echo -e "${CYAN}========================================${NC}"
echo -e "程序数量: ${GREEN}${NUM_PROGRAMS}${NC}"
echo -e "程序列表: ${GREEN}${PROGRAM_NAMES[*]}${NC}"
echo -e "缩放因子: ${GREEN}${SCALES}${NC} (${NUM_SCALES} 个)"
echo -e "每个缩放因子变体数: ${GREEN}${BEST_K}${NC}"
echo -e "每个程序变体数: ${GREEN}${TOTAL_VARIANTS_PER_PROGRAM}${NC}"
echo -e "总变体数 (所有程序): ${GREEN}${TOTAL_PROGRAMS_VARIANTS}${NC}"
echo -e "ILP 超时: ${GREEN}${TIMEOUT}秒${NC}"
echo -e "程序并行数: ${GREEN}${PROGRAM_PARALLEL}${NC} (同时处理的程序数)"
echo -e "ILP 并行数: ${GREEN}${ILP_PARALLEL}${NC} (每个程序的缩放因子并行数)"
echo -e "合成并行数: ${GREEN}${SYNTH_PARALLEL}${NC} (并行合成进程数)"
echo -e "输出基础目录: ${GREEN}${OUTPUT_BASE_DIR}${NC}"
echo -e "${CYAN}========================================${NC}"
echo ""

# ============================================================================
# Function to process a single program
# ============================================================================
process_single_program() {
    local PROGRAM_NAME="$1"
    local PROGRAM_NUM="$2"
    local NUM_PROGRAMS="$3"

    # Create a log file for this program
    local LOG_FILE="${OUTPUT_BASE}/logs/${PROGRAM_NAME}_process.log"
    mkdir -p "$(dirname "$LOG_FILE")"

    # Redirect all output for this program to both console and log file
    exec 3>&1 4>&2
    exec 1> >(tee -a "$LOG_FILE")
    exec 2>&1

    echo ""
    echo -e "${MAGENTA}================================================================================${NC}"
    echo -e "${MAGENTA}处理程序 ${PROGRAM_NUM}/${NUM_PROGRAMS}: ${PROGRAM_NAME}${NC}"
    echo -e "${MAGENTA}================================================================================${NC}"
    echo ""

    # Set output directory for this program
    OUTPUT_DIR="$OUTPUT_BASE_DIR/$PROGRAM_NAME"

    # Temporarily disable exit on error for this program (allow continuation if one program fails)
    set +e
    PROGRAM_FAILED=0

# ============================================================================
# Step 0: Clean old outputs (if enabled)
# ============================================================================
if [ "$CLEAN_OUTPUTS" = true ]; then
    echo -e "${BLUE}步骤 0: 清理旧输出...${NC}"

    # Clean ILP outputs for this program
    if [ -d "$OUTPUT_BASE/ilp" ]; then
        echo -e "${CYAN}  清理 ILP 输出: output/ilp/${PROGRAM_NAME}*${NC}"
        rm -rf "$OUTPUT_BASE/ilp/${PROGRAM_NAME}"*
    fi

    # Clean backend outputs for this program
    if [ -d "$BACKEND_OUTPUT/$PROGRAM_NAME" ]; then
        echo -e "${CYAN}  清理后端输出: output/backend/${PROGRAM_NAME}${NC}"
        rm -rf "$BACKEND_OUTPUT/$PROGRAM_NAME"
    fi

    # Clean synthesis outputs
    SYNTH_OUTPUT_DIR="$SCRIPT_DIR/PdatScorrWrapper/ScorrPdat/output"
    if [ -d "$SYNTH_OUTPUT_DIR" ]; then
        echo -e "${CYAN}  清理合成输出: PdatScorrWrapper/ScorrPdat/output/variant_*${NC}"
        rm -rf "$SYNTH_OUTPUT_DIR"/variant_*
    fi

    echo -e "${GREEN}  ✓ 清理完成${NC}"
    echo ""
fi

# ============================================================================
# Step 0.4: Run frontend analysis if needed
# ============================================================================
FRONTEND_OUTPUT_DIR="$OUTPUT_BASE/frontend/$PROGRAM_NAME"

if [ ! -d "$FRONTEND_OUTPUT_DIR/basic_blocks_ssa" ]; then
    echo -e "${BLUE}步骤 0.4: 运行前端分析（生成 SSA 基本块）...${NC}"
    echo -e "${YELLOW}  前端输出不存在，开始分析...${NC}"

    FRONTEND_SCRIPT="$FRONTEND_DIR/run_full_analysis.sh"
    if [ ! -f "$FRONTEND_SCRIPT" ]; then
        echo -e "${RED}错误: 前端分析脚本未找到: $FRONTEND_SCRIPT${NC}"
        PROGRAM_FAILED=1
    else
        echo -e "${CYAN}  运行: cd frontend && ./run_full_analysis.sh $PROGRAM_NAME${NC}"

        # Run frontend analysis
        if ! (cd "$FRONTEND_DIR" && bash run_full_analysis.sh "$PROGRAM_NAME"); then
            echo -e "${RED}✗ 程序 ${PROGRAM_NAME} 前端分析失败，跳过此程序${NC}"
            PROGRAM_FAILED=1
        else
            echo -e "${GREEN}  ✓ 前端分析完成${NC}"
        fi
    fi

    # Check if program failed
    if [ $PROGRAM_FAILED -eq 1 ]; then
        echo -e "${RED}程序 ${PROGRAM_NAME} 失败${NC}"
        # Restore file descriptors before returning
        exec 1>&3 2>&4
        exec 3>&- 4>&-
        return 2  # Return failure status
    fi
    echo ""
else
    echo -e "${YELLOW}步骤 0.4: 前端输出已存在，跳过前端分析${NC}"
    echo ""
fi

# ============================================================================
# Step 0.45: Run complete analysis (spike instruction count + block execution)
# ============================================================================
echo -e "${BLUE}步骤 0.45: 运行完整分析（Spike 指令计数 + 块执行分析）...${NC}"

# Check if run_complete_analysis.sh exists
COMPLETE_ANALYSIS_SCRIPT="$BENCHMARK_DIR/run_complete_analysis.sh"
if [ "$SKIP_FRONTEND" = true ]; then
    if [ -f "$COMPLETE_ANALYSIS_SCRIPT" ]; then
        echo -e "${CYAN}  运行: cd benchmark && ./run_complete_analysis.sh${NC}"

        # Run the complete analysis script
        if (cd "$BENCHMARK_DIR" && bash run_complete_analysis.sh); then
            echo -e "${GREEN}  ✓ 完整分析完成${NC}"
        else
            echo -e "${YELLOW}  ⚠ 完整分析失败（非致命错误，继续）${NC}"
        fi
    else
        echo -e "${YELLOW}  ⚠ 完整分析脚本不存在: $COMPLETE_ANALYSIS_SCRIPT${NC}"
        echo -e "${YELLOW}  跳过完整分析${NC}"
    fi
fi

echo ""

# ============================================================================
# Step 0.5: Run saturation (if enabled)
# ============================================================================
if [ "$RUN_SATURATION" = true ]; then
    echo -e "${BLUE}步骤 0.5: 运行饱和（E-graph 生成与重写）...${NC}"

    SATURATION_DIR="$SCRIPT_DIR/Saturation"
    SATURATION_SCRIPT="$SATURATION_DIR/run_saturation.sh"

    if [ ! -f "$SATURATION_SCRIPT" ]; then
        echo -e "${RED}错误: 饱和脚本未找到: $SATURATION_SCRIPT${NC}"
        PROGRAM_FAILED=1
    else
        echo -e "${CYAN}  运行: cd Saturation && ./run_saturation.sh $PROGRAM_NAME${NC}"

        # Run saturation
        if ! (cd "$SATURATION_DIR" && bash run_saturation.sh "$PROGRAM_NAME"); then
            echo -e "${RED}✗ 程序 ${PROGRAM_NAME} 饱和失败，跳过此程序${NC}"
            PROGRAM_FAILED=1
        fi
    fi

    if [ $PROGRAM_FAILED -eq 0 ]; then
        echo -e "${GREEN}  ✓ 饱和完成${NC}"
    fi
    echo ""
fi

# Skip to next program if this one failed
if [ $PROGRAM_FAILED -eq 1 ]; then
    echo -e "${RED}程序 ${PROGRAM_NAME} 饱和失败${NC}"
    # Restore file descriptors before returning
    exec 1>&3 2>&4
    exec 3>&- 4>&-
    return 2  # Return failure status
fi

# Create output directory and subdirectories
mkdir -p "$OUTPUT_DIR"
ILP_INTERMEDIATE="$OUTPUT_DIR/ilp_intermediate"
mkdir -p "$ILP_INTERMEDIATE"

# ============================================================================
# Step 1: Generate merged.json (only once)
# ============================================================================
if [ "$RECONSTRUCT_ONLY" = false ]; then
    echo -e "${BLUE}步骤 1/6: 生成 merged.json...${NC}"

    # Check if merged.json already exists
    MERGED_JSON="$OUTPUT_BASE/ilp/$PROGRAM_NAME/merged.json"
    if [ -f "$MERGED_JSON" ]; then
        echo -e "${YELLOW}  merged.json 已存在，跳过生成${NC}"
    else
        if ! python3 "$EXTRACTOR_DIR/src/egraph.py" "$PROGRAM_NAME"; then
            echo -e "${RED}错误: 程序 ${PROGRAM_NAME} 生成 merged.json 失败，跳过此程序${NC}"
            PROGRAM_FAILED=1
        else
            echo -e "${GREEN}  ✓ merged.json 生成成功${NC}"
        fi
    fi

    # Check if program failed
    if [ $PROGRAM_FAILED -eq 1 ]; then
        echo -e "${RED}程序 ${PROGRAM_NAME} 失败${NC}"
        # Restore file descriptors before returning
        exec 1>&3 2>&4
        exec 3>&- 4>&-
        return 2  # Return failure status
    fi
    echo ""

    # ============================================================================
    # Step 2: Run ILP extraction with different scaling factors in parallel
    # ============================================================================
    echo -e "${BLUE}步骤 2/6: 并行运行 ILP 提取（${NUM_SCALES} 个缩放因子 × ${BEST_K} 个变体）...${NC}"

    # Create temporary directory for job scripts
    JOBS_DIR="$ILP_INTERMEDIATE/jobs"
    mkdir -p "$JOBS_DIR"

    # Create job script for each scaling factor
    JOB_PIDS=()
    for i in "${!SCALE_ARRAY[@]}"; do
        SCALE="${SCALE_ARRAY[$i]}"
        JOB_SCRIPT="$JOBS_DIR/job_scale_${i}.sh"

        # Create job script
        cat > "$JOB_SCRIPT" << EOF
#!/bin/bash
echo -e "${MAGENTA}[缩放因子 $SCALE] 开始 ILP 提取...${NC}"

# Create scale-specific output directory
SCALE_OUTPUT="$OUTPUT_BASE/ilp/${PROGRAM_NAME}_scale_${SCALE}"
mkdir -p "\$SCALE_OUTPUT"

# Run ILP solver with scaling factor
python3 "$EXTRACTOR_DIR/src/ILP/ilp_solver.py" "$PROGRAM_NAME" \\
    --node-cost-scale "$SCALE" \\
    --best_k "$BEST_K" \\
    --timeout "$TIMEOUT" \\
    --cost-mode latency \\
    --output "\$SCALE_OUTPUT" 2>&1 | tee "$ILP_INTERMEDIATE/ilp_scale_${SCALE}.log"

if [ \$? -eq 0 ]; then
    echo -e "${GREEN}[缩放因子 $SCALE] ✓ 完成${NC}"

    # Copy solution files to main ILP directory with scale suffix
    for ((j=0; j<$BEST_K; j++)); do
        VARIANT_ID=\$((i * $BEST_K + j))
        # Handle both numbered and unnumbered solution files
        if [ $BEST_K -eq 1 ]; then
            SRC_SOL="\$SCALE_OUTPUT/${PROGRAM_NAME}/sol/solution.sol"
        else
            SRC_SOL="\$SCALE_OUTPUT/${PROGRAM_NAME}/sol/solution_\${j}.sol"
        fi
        DST_SOL="$OUTPUT_BASE/ilp/$PROGRAM_NAME/sol/solution_\${VARIANT_ID}.sol"

        if [ -f "\$SRC_SOL" ]; then
            mkdir -p "$(dirname "\$DST_SOL")"
            cp "\$SRC_SOL" "\$DST_SOL"
            echo "  复制: \$(basename \$SRC_SOL) -> solution_\${VARIANT_ID}.sol"
        fi
    done
else
    echo -e "${RED}[缩放因子 $SCALE] ✗ 失败${NC}"
    exit 1
fi
EOF

        chmod +x "$JOB_SCRIPT"

        # Run job in background (with job control)
        if [ ${#JOB_PIDS[@]} -ge $ILP_PARALLEL ]; then
            # Wait for at least one job to finish
            wait -n
        fi

        bash "$JOB_SCRIPT" &
        JOB_PIDS+=($!)
        echo -e "${CYAN}  启动任务: 缩放因子 $SCALE (PID: ${JOB_PIDS[-1]})${NC}"
    done

    # Wait for all jobs to complete
    echo ""
    echo -e "${YELLOW}等待所有 ILP 任务完成...${NC}"

    FAILED_JOBS=0
    for pid in "${JOB_PIDS[@]}"; do
        if wait $pid; then
            echo -e "${GREEN}  任务 $pid 成功${NC}"
        else
            echo -e "${RED}  任务 $pid 失败${NC}"
            FAILED_JOBS=$((FAILED_JOBS + 1))
        fi
    done

    if [ $FAILED_JOBS -gt 0 ]; then
        echo -e "${RED}警告: ${FAILED_JOBS} 个任务失败${NC}"
    else
        echo -e "${GREEN}所有 ILP 任务成功完成${NC}"
    fi
    echo ""

    # ============================================================================
    # Step 2.5: Collect all solution files into main ILP directory
    # ============================================================================
    echo -e "${BLUE}步骤 2.5/6: 收集所有解文件...${NC}"

    # Clear existing solution files
    rm -f "$OUTPUT_BASE/ilp/$PROGRAM_NAME/sol/solution_*.sol" 2>/dev/null

    # Copy solutions with proper numbering
    SOLUTION_IDX=0
    for i in "${!SCALE_ARRAY[@]}"; do
        SCALE="${SCALE_ARRAY[$i]}"
        SOL_DIR="$OUTPUT_BASE/ilp/${PROGRAM_NAME}_scale_${SCALE}/${PROGRAM_NAME}/sol"

        if [ -d "$SOL_DIR" ]; then
            # Handle both numbered (solution_0.sol) and unnumbered (solution.sol) files
            for sol_file in "$SOL_DIR"/solution*.sol; do
                if [ -f "$sol_file" ]; then
                    DEST_FILE="$OUTPUT_BASE/ilp/$PROGRAM_NAME/sol/solution_${SOLUTION_IDX}.sol"
                    mkdir -p "$(dirname "$DEST_FILE")"
                    cp "$sol_file" "$DEST_FILE"
                    echo -e "${GREEN}  复制: scale $SCALE → solution_${SOLUTION_IDX}.sol${NC}"
                    SOLUTION_IDX=$((SOLUTION_IDX + 1))
                fi
            done
        fi
    done

    echo -e "${GREEN}总共收集了 ${SOLUTION_IDX} 个解文件${NC}"
    echo ""
fi

# ============================================================================
# Step 3: Reconstruct assembly files for all variants
# ============================================================================
echo -e "${BLUE}步骤 3/6: 重建所有变体的汇编文件...${NC}"

# Use the solution count from the collection step
if [ "$RECONSTRUCT_ONLY" = false ]; then
    ACTUAL_VARIANTS=$SOLUTION_IDX
else
    # Count actual solution files for reconstruct-only mode
    ACTUAL_VARIANTS=$(find "$OUTPUT_BASE/ilp/$PROGRAM_NAME/sol" -name "solution_*.sol" 2>/dev/null | wc -l)
fi

if [ $ACTUAL_VARIANTS -eq 0 ]; then
    echo -e "${RED}错误: 程序 ${PROGRAM_NAME} 未找到任何解文件，跳过此程序${NC}"
    PROGRAM_FAILED=1
else
    echo -e "${GREEN}准备重建 ${ACTUAL_VARIANTS} 个变体...${NC}"

    # Run reconstruction with all variants
    echo "运行重建脚本..."
    if ! bash "$FRONTEND_DIR/run_reconstruct.sh" "$PROGRAM_NAME" "$ACTUAL_VARIANTS"; then
        echo -e "${RED}错误: 程序 ${PROGRAM_NAME} 重建失败，跳过此程序${NC}"
        PROGRAM_FAILED=1
    fi
fi

# Check if program failed during reconstruction
if [ $PROGRAM_FAILED -eq 1 ]; then
    echo -e "${RED}程序 ${PROGRAM_NAME} 重建失败${NC}"
    # Restore file descriptors before returning
    exec 1>&3 2>&4
    exec 3>&- 4>&-
    return 2  # Return failure status
fi

# ============================================================================
# Step 4: Organize output files
# ============================================================================
echo ""
echo -e "${BLUE}步骤 4/6: 组织输出文件...${NC}"

# Create organized output directory
FINAL_OUTPUT="$OUTPUT_DIR/variants"
mkdir -p "$FINAL_OUTPUT"

# Copy and rename variant files with scale information
VARIANT_COUNT=0
for i in "${!SCALE_ARRAY[@]}"; do
    SCALE="${SCALE_ARRAY[$i]}"

    for ((j=0; j<$BEST_K; j++)); do
        VARIANT_ID=$((i * BEST_K + j))
        SRC_FILE=$(find "$SCRIPT_DIR/benchmark" -name "${PROGRAM_NAME}_rewrite_variant_${VARIANT_ID}.s" 2>/dev/null | head -1)

        if [ -f "$SRC_FILE" ]; then
            # Create variant subdirectory
            VARIANT_DIR="$FINAL_OUTPUT/variant_${VARIANT_ID}"
            mkdir -p "$VARIANT_DIR"

            # Copy assembly file to variant directory
            DST_FILE="$VARIANT_DIR/${PROGRAM_NAME}_scale_${SCALE}_variant_${j}.s"
            cp "$SRC_FILE" "$DST_FILE"
            echo -e "${GREEN}  ✓ 变体 ${VARIANT_ID} (缩放因子 ${SCALE}, 变体 ${j}): variant_${VARIANT_ID}/$(basename "$DST_FILE")${NC}"
            VARIANT_COUNT=$((VARIANT_COUNT + 1))
        else
            echo -e "${YELLOW}  ⚠ 缺失: 变体 ${VARIANT_ID} (缩放因子 ${SCALE}, 变体 ${j})${NC}"
        fi
    done
done

# ============================================================================
# Step 4.5: Add original program as baseline variant
# ============================================================================
echo ""
echo -e "${BLUE}步骤 4.5/6: 添加原始程序作为基线变体...${NC}"

# Find the original clean.s file
ORIGINAL_ASM=$(find "$SCRIPT_DIR/benchmark" -name "${PROGRAM_NAME}_clean.s" -type f | head -1)

if [ -f "$ORIGINAL_ASM" ]; then
    # Create variant_original directory
    ORIGINAL_VARIANT_DIR="$FINAL_OUTPUT/variant_original"
    mkdir -p "$ORIGINAL_VARIANT_DIR"

    # Copy original assembly file
    cp "$ORIGINAL_ASM" "$ORIGINAL_VARIANT_DIR/${PROGRAM_NAME}_original.s"
    echo -e "${GREEN}  ✓ 原始程序: $(basename "$ORIGINAL_ASM")${NC}"

    # Link to original frontend outputs (basic_blocks_ssa, etc.)
    # This avoids re-analyzing the original program
    ORIGINAL_FRONTEND="$OUTPUT_BASE/frontend/$PROGRAM_NAME"
    if [ -d "$ORIGINAL_FRONTEND/basic_blocks" ]; then
        ln -sf "$ORIGINAL_FRONTEND/basic_blocks" "$ORIGINAL_VARIANT_DIR/basic_blocks"
        echo -e "${CYAN}    链接: basic_blocks/${NC}"
    fi
    if [ -d "$ORIGINAL_FRONTEND/basic_blocks_ssa" ]; then
        ln -sf "$ORIGINAL_FRONTEND/basic_blocks_ssa" "$ORIGINAL_VARIANT_DIR/basic_blocks_ssa"
        echo -e "${CYAN}    链接: basic_blocks_ssa/${NC}"
    fi

    # Copy metadata files if they exist
    for meta_file in label_to_block.json label_metadata.json; do
        if [ -f "$ORIGINAL_FRONTEND/$meta_file" ]; then
            cp "$ORIGINAL_FRONTEND/$meta_file" "$ORIGINAL_VARIANT_DIR/"
        fi
    done

    echo -e "${GREEN}  ✓ 原始程序已添加为 variant_original${NC}"
else
    echo -e "${YELLOW}  ⚠ 未找到原始程序: ${PROGRAM_NAME}_clean.s${NC}"
fi
echo ""

# ============================================================================
# Step 4.6: Add general purpose processor variant (variant_gp)
# ============================================================================
echo ""
echo -e "${BLUE}步骤 4.6/6: 添加通用处理器变体 (variant_gp)...${NC}"

# variant_gp uses the same program as variant_original
# but will be synthesized with empty DSL (no instruction constraints)
if [ -f "$ORIGINAL_ASM" ]; then
    # Create variant_gp directory
    GP_VARIANT_DIR="$FINAL_OUTPUT/variant_gp"
    mkdir -p "$GP_VARIANT_DIR"

    # Copy original assembly file
    cp "$ORIGINAL_ASM" "$GP_VARIANT_DIR/${PROGRAM_NAME}_gp.s"
    echo -e "${GREEN}  ✓ 通用处理器: $(basename "$ORIGINAL_ASM")${NC}"

    # Link to original frontend outputs (basic_blocks_ssa, etc.)
    # This avoids re-analyzing the original program
    ORIGINAL_FRONTEND="$OUTPUT_BASE/frontend/$PROGRAM_NAME"
    if [ -d "$ORIGINAL_FRONTEND/basic_blocks" ]; then
        ln -sf "$ORIGINAL_FRONTEND/basic_blocks" "$GP_VARIANT_DIR/basic_blocks"
        echo -e "${CYAN}    链接: basic_blocks/${NC}"
    fi
    if [ -d "$ORIGINAL_FRONTEND/basic_blocks_ssa" ]; then
        ln -sf "$ORIGINAL_FRONTEND/basic_blocks_ssa" "$GP_VARIANT_DIR/basic_blocks_ssa"
        echo -e "${CYAN}    链接: basic_blocks_ssa/${NC}"
    fi

    # Copy metadata files if they exist
    for meta_file in label_to_block.json label_metadata.json; do
        if [ -f "$ORIGINAL_FRONTEND/$meta_file" ]; then
            cp "$ORIGINAL_FRONTEND/$meta_file" "$GP_VARIANT_DIR/"
        fi
    done

    echo -e "${GREEN}  ✓ 通用处理器已添加为 variant_gp (将使用空 DSL 合成)${NC}"
else
    echo -e "${YELLOW}  ⚠ 未找到原始程序: ${PROGRAM_NAME}_clean.s${NC}"
fi
echo ""

# ============================================================================
# Step 5: Copy basic blocks and generate SSA for each variant
# ============================================================================
echo ""
echo -e "${BLUE}步骤 5/6: 为每个变体复制基本块并生成 SSA 形式...${NC}"

# Path to the rewritten basic blocks from ILP (created by restructure.py)
FRONTEND_OUTPUT="$SCRIPT_DIR/output/frontend/$PROGRAM_NAME"
REWRITE_BASE="${FRONTEND_OUTPUT}/basic_blocks_rewrite"

if [ ! -d "$REWRITE_BASE" ]; then
    echo -e "${RED}错误: 找不到重写的基本块目录: $REWRITE_BASE${NC}"
    echo -e "${YELLOW}restructure.py 可能未运行或失败${NC}"
    exit 1
fi

SSA_COUNT=0
for ((i=0; i<$VARIANT_COUNT; i++)); do
    VARIANT_DIR="$FINAL_OUTPUT/variant_${i}"
    echo -e "${CYAN}  处理变体 ${i}...${NC}"

    # Source: rewritten basic blocks from ILP
    SRC_BB_DIR="$REWRITE_BASE/variant_${i}"

    if [ ! -d "$SRC_BB_DIR" ]; then
        echo -e "${YELLOW}    ⚠ 源基本块目录不存在: $SRC_BB_DIR${NC}"
        continue
    fi

    # Step 5.1: Copy rewritten basic blocks directly
    DST_BB_DIR="$VARIANT_DIR/basic_blocks"
    if [ -d "$SRC_BB_DIR" ] && [ "$(ls -A $SRC_BB_DIR/*.txt 2>/dev/null)" ]; then
        mkdir -p "$DST_BB_DIR"
        cp -r "$SRC_BB_DIR"/*.txt "$DST_BB_DIR/" 2>/dev/null || {
            echo -e "${YELLOW}    ⚠ 复制基本块失败${NC}"
            continue
        }
        echo -e "${GREEN}    ✓ 基本块已复制 ($(ls "$DST_BB_DIR"/*.txt 2>/dev/null | wc -l) 个文件)${NC}"
    else
        echo -e "${YELLOW}    ⚠ 源基本块目录为空${NC}"
        continue
    fi

    # Also copy label mapping files from original program
    ORIG_LABEL_FILE="$FRONTEND_OUTPUT/label_to_block.json"
    ORIG_META_FILE="$FRONTEND_OUTPUT/label_metadata.json"
    [ -f "$ORIG_LABEL_FILE" ] && cp "$ORIG_LABEL_FILE" "$VARIANT_DIR/"
    [ -f "$ORIG_META_FILE" ] && cp "$ORIG_META_FILE" "$VARIANT_DIR/"

    # Step 5.2: Convert basic blocks to SSA form
    if [ -d "$DST_BB_DIR" ] && [ "$(ls -A $DST_BB_DIR)" ]; then
        python3 "$FRONTEND_DIR/convert_to_ssa.py" "$VARIANT_DIR" 2>/dev/null || {
            echo -e "${YELLOW}    ⚠ SSA 转换失败${NC}"
            continue
        }

        # Check if SSA was created
        SSA_DIR="$VARIANT_DIR/basic_blocks_ssa"
        if [ -d "$SSA_DIR" ] && [ "$(ls -A $SSA_DIR)" ]; then
            echo -e "${GREEN}    ✓ SSA 生成成功${NC}"
            SSA_COUNT=$((SSA_COUNT + 1))
        else
            echo -e "${YELLOW}    ⚠ SSA 目录为空${NC}"
        fi
    fi
done

echo -e "${GREEN}成功处理 ${SSA_COUNT}/${VARIANT_COUNT} 个变体的 SSA 转换${NC}"

# ============================================================================
# Step 6: Analyze area and latency for all variants + Pareto frontier
# ============================================================================
echo ""
echo -e "${BLUE}步骤 6/6: 并行分析所有变体的面积和延迟 (${SYNTH_PARALLEL} 个进程)...${NC}"

# Use parallel analysis with configurable number of synthesis processes
python3 "$SCRIPT_DIR/analyze_all_variants.py" "$FINAL_OUTPUT" "$PROGRAM_NAME" "$OUTPUT_DIR" "$SYNTH_PARALLEL"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Pareto 分析完成${NC}"
    ANALYSIS_SUCCESS=1
else
    echo -e "${YELLOW}⚠ 分析失败（可能缺少合成工具）${NC}"
    ANALYSIS_SUCCESS=0
fi

# ============================================================================
# Final Summary
# ============================================================================
echo ""
echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}完成汇总${NC}"
echo -e "${CYAN}========================================${NC}"
echo -e "程序: ${GREEN}$PROGRAM_NAME${NC}"
echo -e "期望变体数: ${GREEN}${TOTAL_VARIANTS}${NC}"
echo -e "实际生成: ${GREEN}${VARIANT_COUNT}${NC}"
echo -e "SSA 转换: ${GREEN}${SSA_COUNT}${NC}"
if [ $ANALYSIS_SUCCESS -eq 1 ]; then
    echo -e "面积/延迟分析: ${GREEN}完成${NC}"
    echo -e "Pareto 前沿图: ${GREEN}pareto_frontier.png${NC}"
else
    echo -e "面积/延迟分析: ${YELLOW}未完成${NC}"
fi
echo -e "输出目录: ${GREEN}${FINAL_OUTPUT}${NC}"
echo ""

# List all generated variant directories
echo -e "${BLUE}生成的变体目录:${NC}"
for ((i=0; i<$VARIANT_COUNT; i++)); do
    VARIANT_DIR="$FINAL_OUTPUT/variant_${i}"
    if [ -d "$VARIANT_DIR" ]; then
        echo -e "  variant_${i}/"
        ls "$VARIANT_DIR" 2>/dev/null | sed 's/^/    /'
    fi
done

echo ""
echo -e "${GREEN}✓ 多缩放因子变体生成完成！${NC}"
echo -e "${CYAN}========================================${NC}"

# Create summary report
SUMMARY_FILE="$OUTPUT_DIR/summary.txt"
cat > "$SUMMARY_FILE" << EOF
Multi-Scale Variant Generation Summary
=====================================
Program: $PROGRAM_NAME
Date: $(date)

Configuration:
- Scaling factors: $SCALES
- Variants per scale: $BEST_K
- Total variants expected: $TOTAL_VARIANTS
- Total variants generated: $VARIANT_COUNT
- SSA conversions successful: $SSA_COUNT
- Area/Latency analysis: $([ $ANALYSIS_SUCCESS -eq 1 ] && echo "Completed" || echo "Not completed")
- ILP timeout: ${TIMEOUT}s
- ILP parallel jobs: $ILP_PARALLEL
- Synthesis parallel processes: $SYNTH_PARALLEL

Pareto Analysis:
$(if [ -f "$OUTPUT_DIR/pareto_frontier.png" ]; then
    echo "- Pareto plot: pareto_frontier.png"
    echo "- Results JSON: analysis_results.json"
    echo "- DSL files: dsl_files/"
else
    echo "- No Pareto analysis generated"
fi)

Generated Variant Directories:
$(for ((i=0; i<$VARIANT_COUNT; i++)); do
    VARIANT_DIR="$FINAL_OUTPUT/variant_${i}"
    if [ -d "$VARIANT_DIR" ]; then
        echo "variant_${i}/"
        if [ -d "$VARIANT_DIR/basic_blocks" ]; then
            echo "  - basic_blocks/ ($(ls "$VARIANT_DIR/basic_blocks" 2>/dev/null | wc -l) files)"
        fi
        if [ -d "$VARIANT_DIR/basic_blocks_ssa" ]; then
            echo "  - basic_blocks_ssa/ ($(ls "$VARIANT_DIR/basic_blocks_ssa" 2>/dev/null | wc -l) files)"
        fi
        S_FILES=$(ls "$VARIANT_DIR"/*.s 2>/dev/null)
        if [ -n "$S_FILES" ]; then
            for S_FILE in $S_FILES; do
                echo "  - $(basename "$S_FILE")"
            done
        fi
    fi
done)

Logs:
$(ls -1 "$ILP_INTERMEDIATE"/*.log 2>/dev/null || echo "None")
EOF

echo ""
echo -e "${YELLOW}汇总报告已保存至: $SUMMARY_FILE${NC}"

    # Restore original file descriptors
    exec 1>&3 2>&4
    exec 3>&- 4>&-

    # Return status (0 = success, 1 = partial success/warning, 2 = failure)
    if [ $ANALYSIS_SUCCESS -eq 1 ]; then
        echo -e "${GREEN}✓ 程序 ${PROGRAM_NAME} 完成${NC}"
        return 0
    else
        echo -e "${YELLOW}⚠ 程序 ${PROGRAM_NAME} 完成但分析未成功${NC}"
        return 1
    fi
}

# ============================================================================
# Main processing with program-level parallelism
# ============================================================================
GLOBAL_START_TIME=$(date +%s)

# Arrays to track program processing
declare -a PROGRAM_PIDS
declare -a PROGRAM_STATUS
declare -a PROGRAM_NAMES_ARRAY

# Initialize arrays
for i in "${!PROGRAM_NAMES[@]}"; do
    PROGRAM_NAMES_ARRAY[$i]="${PROGRAM_NAMES[$i]}"
done

echo -e "${CYAN}开始处理 ${#PROGRAM_NAMES[@]} 个程序 (最多 ${PROGRAM_PARALLEL} 个并行)...${NC}"
echo ""

# Process programs with parallelism control
ACTIVE_JOBS=0
PROGRAM_INDEX=0
TOTAL_PROGRAMS=${#PROGRAM_NAMES[@]}

while [ $PROGRAM_INDEX -lt $TOTAL_PROGRAMS ] || [ $ACTIVE_JOBS -gt 0 ]; do
    # Launch new jobs if we have capacity and programs remaining
    while [ $ACTIVE_JOBS -lt $PROGRAM_PARALLEL ] && [ $PROGRAM_INDEX -lt $TOTAL_PROGRAMS ]; do
        PROGRAM_NAME="${PROGRAM_NAMES[$PROGRAM_INDEX]}"
        PROGRAM_NUM=$((PROGRAM_INDEX + 1))

        echo -e "${BLUE}启动程序 ${PROGRAM_NUM}/${TOTAL_PROGRAMS}: ${PROGRAM_NAME}${NC}"

        # Launch program processing in background
        process_single_program "$PROGRAM_NAME" "$PROGRAM_NUM" "$TOTAL_PROGRAMS" &
        PID=$!
        PROGRAM_PIDS[$PROGRAM_INDEX]=$PID

        echo -e "${CYAN}  PID: $PID${NC}"

        ACTIVE_JOBS=$((ACTIVE_JOBS + 1))
        PROGRAM_INDEX=$((PROGRAM_INDEX + 1))
    done

    # Wait for at least one job to finish if we're at capacity
    if [ $ACTIVE_JOBS -ge $PROGRAM_PARALLEL ] || [ $PROGRAM_INDEX -ge $TOTAL_PROGRAMS ]; then
        # Wait for any job to complete
        wait -n

        # Check which jobs have completed
        for i in "${!PROGRAM_PIDS[@]}"; do
            PID=${PROGRAM_PIDS[$i]}
            if [ -n "$PID" ] && ! kill -0 "$PID" 2>/dev/null; then
                # Job has completed, get exit status
                wait "$PID"
                STATUS=$?
                PROGRAM_STATUS[$i]=$STATUS
                unset PROGRAM_PIDS[$i]
                ACTIVE_JOBS=$((ACTIVE_JOBS - 1))

                # Log completion
                PROG_NAME="${PROGRAM_NAMES_ARRAY[$i]}"
                if [ $STATUS -eq 0 ]; then
                    echo -e "${GREEN}✓ 程序 ${PROG_NAME} (PID: $PID) 成功完成${NC}"
                elif [ $STATUS -eq 1 ]; then
                    echo -e "${YELLOW}⚠ 程序 ${PROG_NAME} (PID: $PID) 完成但有警告${NC}"
                else
                    echo -e "${RED}✗ 程序 ${PROG_NAME} (PID: $PID) 失败${NC}"
                fi
            fi
        done
    fi
done

# Wait for all remaining jobs
echo ""
echo -e "${CYAN}等待所有剩余任务完成...${NC}"
for i in "${!PROGRAM_PIDS[@]}"; do
    PID=${PROGRAM_PIDS[$i]}
    if [ -n "$PID" ]; then
        wait "$PID"
        STATUS=$?
        PROGRAM_STATUS[$i]=$STATUS
        PROG_NAME="${PROGRAM_NAMES_ARRAY[$i]}"
        if [ $STATUS -eq 0 ]; then
            echo -e "${GREEN}✓ 程序 ${PROG_NAME} (PID: $PID) 成功完成${NC}"
        elif [ $STATUS -eq 1 ]; then
            echo -e "${YELLOW}⚠ 程序 ${PROG_NAME} (PID: $PID) 完成但有警告${NC}"
        else
            echo -e "${RED}✗ 程序 ${PROG_NAME} (PID: $PID) 失败${NC}"
        fi
    fi
done

# Count successes and failures
SUCCESSFUL_PROGRAMS=0
WARNING_PROGRAMS=0
FAILED_PROGRAMS=0

for STATUS in "${PROGRAM_STATUS[@]}"; do
    if [ $STATUS -eq 0 ]; then
        SUCCESSFUL_PROGRAMS=$((SUCCESSFUL_PROGRAMS + 1))
    elif [ $STATUS -eq 1 ]; then
        WARNING_PROGRAMS=$((WARNING_PROGRAMS + 1))
    else
        FAILED_PROGRAMS=$((FAILED_PROGRAMS + 1))
    fi
done

# ============================================================================
# Global Summary (All Programs)
# ============================================================================
GLOBAL_END_TIME=$(date +%s)
GLOBAL_DURATION=$((GLOBAL_END_TIME - GLOBAL_START_TIME))
GLOBAL_DURATION_MIN=$((GLOBAL_DURATION / 60))
GLOBAL_DURATION_SEC=$((GLOBAL_DURATION % 60))

echo ""
echo -e "${CYAN}================================================================================${NC}"
echo -e "${CYAN}全局汇总 - 所有程序处理完成${NC}"
echo -e "${CYAN}================================================================================${NC}"
echo -e "处理程序数: ${GREEN}${NUM_PROGRAMS}${NC}"
echo -e "成功: ${GREEN}${SUCCESSFUL_PROGRAMS}${NC}"
if [ $WARNING_PROGRAMS -gt 0 ]; then
    echo -e "警告: ${YELLOW}${WARNING_PROGRAMS}${NC}"
fi
if [ $FAILED_PROGRAMS -gt 0 ]; then
    echo -e "失败: ${RED}${FAILED_PROGRAMS}${NC}"
fi
echo -e "总耗时: ${GREEN}${GLOBAL_DURATION_MIN}分${GLOBAL_DURATION_SEC}秒${NC}"
echo -e "输出目录: ${GREEN}${OUTPUT_BASE_DIR}${NC}"
echo ""

echo -e "${BLUE}各程序输出目录:${NC}"
for PROGRAM_NAME in "${PROGRAM_NAMES[@]}"; do
    PROG_OUTPUT="$OUTPUT_BASE_DIR/$PROGRAM_NAME"
    if [ -d "$PROG_OUTPUT" ]; then
        VARIANT_COUNT=$(ls -d "$PROG_OUTPUT/variants/variant_"* 2>/dev/null | wc -l)
        if [ -f "$PROG_OUTPUT/pareto_frontier.png" ]; then
            echo -e "  ${GREEN}✓${NC} $PROGRAM_NAME (${VARIANT_COUNT} 变体, Pareto图已生成)"
        else
            echo -e "  ${YELLOW}⚠${NC} $PROGRAM_NAME (${VARIANT_COUNT} 变体, 无Pareto图)"
        fi
    else
        echo -e "  ${RED}✗${NC} $PROGRAM_NAME (未找到输出)"
    fi
done

echo ""
echo -e "${GREEN}✓ 批处理完成！${NC}"
echo -e "${CYAN}================================================================================${NC}"

exit 0