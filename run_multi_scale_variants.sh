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
DEFAULT_SCALES="0 0.1 0.2 0.3 0.4 0.5 1 10 100 1000 10000"
DEFAULT_K=3
DEFAULT_TIMEOUT=180
DEFAULT_PARALLEL_JOBS=24
DEFAULT_SYNTH_JOBS=72  # Parallel synthesis processes
DEFAULT_CLEAN=true     # Clean old outputs by default
DEFAULT_RUN_SATURATION=true  # Run saturation by default

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

# Function to display usage
usage() {
    echo "使用方法: $0 <program_name> [options]"
    echo ""
    echo "选项:"
    echo "  -s, --scales SCALES        空格分隔的缩放因子列表 (默认: '$DEFAULT_SCALES')"
    echo "  -k, --best-k K             每个缩放因子的变体数 (默认: $DEFAULT_K)"
    echo "  -t, --timeout TIMEOUT      ILP 求解器超时秒数 (默认: $DEFAULT_TIMEOUT)"
    echo "  -j, --jobs JOBS            ILP 并行任务数 (默认: $DEFAULT_PARALLEL_JOBS)"
    echo "  -sj, --synth-jobs JOBS     合成并行进程数 (默认: $DEFAULT_SYNTH_JOBS)"
    echo "  -o, --output-dir DIR       输出目录 (默认: output/backend/<program>)"
    echo "  --clean                    清理旧输出（默认：是）"
    echo "  --no-clean                 不清理旧输出"
    echo "  --skip-saturation          跳过饱和步骤（使用现有 JSON 文件）"
    echo "  -r, --reconstruct-only     仅重建汇编文件（跳过 ILP 提取）"
    echo "  -h, --help                 显示此帮助信息"
    echo ""
    echo "示例:"
    echo "  $0 dijkstra_small_O3                                    # 完整流程：清理+饱和+ILP+Pareto"
    echo "  $0 dijkstra_small_O3 -s '0 1 100' -k 5                 # 3个缩放因子，每个5个变体"
    echo "  $0 dijkstra_small_O3 -j 10 -t 300                      # 10个ILP并行任务，300秒超时"
    echo "  $0 dijkstra_small_O3 -sj 72                            # 72个并行合成进程"
    echo "  $0 dijkstra_small_O3 --skip-saturation --no-clean      # 跳过清理和饱和"
    echo ""
    exit 1
}

# Parse command line arguments
if [ $# -eq 0 ]; then
    usage
fi

# Check for help first
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    usage
fi

PROGRAM_NAME=""
SCALES="$DEFAULT_SCALES"
BEST_K="$DEFAULT_K"
TIMEOUT="$DEFAULT_TIMEOUT"
PARALLEL_JOBS="$DEFAULT_PARALLEL_JOBS"
SYNTH_JOBS="$DEFAULT_SYNTH_JOBS"
OUTPUT_DIR=""
RECONSTRUCT_ONLY=false
CLEAN_OUTPUTS="$DEFAULT_CLEAN"
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
        -j|--jobs)
            PARALLEL_JOBS="$2"
            shift 2
            ;;
        -sj|--synth-jobs)
            SYNTH_JOBS="$2"
            shift 2
            ;;
        -o|--output-dir)
            OUTPUT_DIR="$2"
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
            # This is the program name
            if [ -z "$PROGRAM_NAME" ]; then
                PROGRAM_NAME="$1"
            else
                echo -e "${RED}错误: 多余的参数 $1${NC}"
                usage
            fi
            shift
            ;;
    esac
done

# Check if program name was provided
if [ -z "$PROGRAM_NAME" ]; then
    echo -e "${RED}错误: 必须提供程序名称${NC}"
    usage
fi

# Set output directory if not specified
if [ -z "$OUTPUT_DIR" ]; then
    OUTPUT_DIR="$BACKEND_OUTPUT/$PROGRAM_NAME"
fi

# Convert scales string to array
IFS=' ' read -ra SCALE_ARRAY <<< "$SCALES"
NUM_SCALES=${#SCALE_ARRAY[@]}
TOTAL_VARIANTS=$((NUM_SCALES * BEST_K))

# ============================================================================
# Display configuration
# ============================================================================
echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}多缩放因子变体生成${NC}"
echo -e "${CYAN}========================================${NC}"
echo -e "程序名称: ${GREEN}$PROGRAM_NAME${NC}"
echo -e "缩放因子: ${GREEN}${SCALES}${NC} (${NUM_SCALES} 个)"
echo -e "每个缩放因子变体数: ${GREEN}${BEST_K}${NC}"
echo -e "总变体数: ${GREEN}${TOTAL_VARIANTS}${NC}"
echo -e "ILP 超时: ${GREEN}${TIMEOUT}秒${NC}"
echo -e "ILP 并行任务数: ${GREEN}${PARALLEL_JOBS}${NC}"
echo -e "合成并行进程数: ${GREEN}${SYNTH_JOBS}${NC}"
echo -e "输出目录: ${GREEN}${OUTPUT_DIR}${NC}"
echo -e "${CYAN}========================================${NC}"
echo ""

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
# Step 0.5: Run saturation (if enabled)
# ============================================================================
if [ "$RUN_SATURATION" = true ]; then
    echo -e "${BLUE}步骤 0.5: 运行饱和（E-graph 生成与重写）...${NC}"

    SATURATION_DIR="$SCRIPT_DIR/Saturation"
    SATURATION_SCRIPT="$SATURATION_DIR/run_saturation.sh"

    if [ ! -f "$SATURATION_SCRIPT" ]; then
        echo -e "${RED}错误: 饱和脚本未找到: $SATURATION_SCRIPT${NC}"
        exit 1
    fi

    echo -e "${CYAN}  运行: cd Saturation && ./run_saturation.sh $PROGRAM_NAME${NC}"

    # Run saturation
    (cd "$SATURATION_DIR" && bash run_saturation.sh "$PROGRAM_NAME") || {
        echo -e "${RED}✗ 饱和失败${NC}"
        exit 1
    }

    echo -e "${GREEN}  ✓ 饱和完成${NC}"
    echo ""
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
        python3 "$EXTRACTOR_DIR/src/egraph.py" "$PROGRAM_NAME" || {
            echo -e "${RED}错误: 生成 merged.json 失败${NC}"
            exit 1
        }
        echo -e "${GREEN}  ✓ merged.json 生成成功${NC}"
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
        if [ ${#JOB_PIDS[@]} -ge $PARALLEL_JOBS ]; then
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
    echo -e "${RED}错误: 未找到任何解文件${NC}"
    exit 1
fi

echo -e "${GREEN}准备重建 ${ACTUAL_VARIANTS} 个变体...${NC}"

# Run reconstruction with all variants
echo "运行重建脚本..."
bash "$FRONTEND_DIR/run_reconstruct.sh" "$PROGRAM_NAME" "$ACTUAL_VARIANTS" || {
    echo -e "${RED}错误: 重建失败${NC}"
    exit 1
}

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
# Step 5: Generate basic blocks and SSA for each variant
# ============================================================================
echo ""
echo -e "${BLUE}步骤 5/6: 为每个变体生成基本块和 SSA 形式...${NC}"

SSA_COUNT=0
for ((i=0; i<$VARIANT_COUNT; i++)); do
    VARIANT_DIR="$FINAL_OUTPUT/variant_${i}"

    # Find the .s file in this variant directory
    S_FILE=$(find "$VARIANT_DIR" -name "*.s" 2>/dev/null | head -1)

    if [ -f "$S_FILE" ]; then
        echo -e "${CYAN}  处理变体 ${i}...${NC}"

        # Step 5.1: Extract basic blocks from .s file
        # Run analyze_asm_blocks.py to extract basic blocks
        python3 "$FRONTEND_DIR/analyze_asm_blocks.py" "$S_FILE" -o "$VARIANT_DIR" 2>/dev/null || {
            echo -e "${YELLOW}    ⚠ 基本块提取失败${NC}"
            continue
        }

        # The script creates a subdirectory with the filename stem
        # Find the created directory and move basic_blocks to the correct location
        S_FILE_STEM=$(basename "$S_FILE" .s)
        CREATED_DIR="$VARIANT_DIR/$S_FILE_STEM"
        BB_DIR="$VARIANT_DIR/basic_blocks"

        if [ -d "$CREATED_DIR/basic_blocks" ]; then
            # Move basic_blocks to variant directory
            mv "$CREATED_DIR/basic_blocks" "$BB_DIR"
            # Also move the json files if they exist
            [ -f "$CREATED_DIR/label_to_block.json" ] && mv "$CREATED_DIR/label_to_block.json" "$VARIANT_DIR/"
            [ -f "$CREATED_DIR/label_metadata.json" ] && mv "$CREATED_DIR/label_metadata.json" "$VARIANT_DIR/"
            # Remove the now-empty created directory
            rmdir "$CREATED_DIR" 2>/dev/null
        fi

        # Check if basic blocks were created
        if [ -d "$BB_DIR" ] && [ "$(ls -A $BB_DIR)" ]; then
            # Step 5.2: Convert basic blocks to SSA form
            # This will create basic_blocks_ssa directory automatically
            python3 "$FRONTEND_DIR/convert_to_ssa.py" "$VARIANT_DIR" 2>/dev/null || {
                echo -e "${YELLOW}    ⚠ SSA 转换失败${NC}"
                continue
            }

            # Check if SSA was created
            SSA_DIR="$VARIANT_DIR/basic_blocks_ssa"
            if [ -d "$SSA_DIR" ] && [ "$(ls -A $SSA_DIR)" ]; then
                echo -e "${GREEN}    ✓ 基本块和 SSA 生成成功${NC}"
                SSA_COUNT=$((SSA_COUNT + 1))
            else
                echo -e "${YELLOW}    ⚠ SSA 目录为空${NC}"
            fi
        else
            echo -e "${YELLOW}    ⚠ 基本块目录为空${NC}"
        fi
    else
        echo -e "${YELLOW}  ⚠ 变体 ${i} 缺少 .s 文件${NC}"
    fi
done

echo -e "${GREEN}成功处理 ${SSA_COUNT}/${VARIANT_COUNT} 个变体的 SSA 转换${NC}"

# ============================================================================
# Step 6: Analyze area and latency for all variants + Pareto frontier
# ============================================================================
echo ""
echo -e "${BLUE}步骤 6/6: 并行分析所有变体的面积和延迟 (${SYNTH_JOBS} 个进程)...${NC}"

# Use parallel analysis with configurable number of synthesis processes
python3 "$SCRIPT_DIR/analyze_all_variants.py" "$FINAL_OUTPUT" "$PROGRAM_NAME" "$OUTPUT_DIR" "$SYNTH_JOBS"

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
- ILP parallel jobs: $PARALLEL_JOBS
- Synthesis parallel processes: $SYNTH_JOBS

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

exit 0