#!/bin/bash
# 完整的分析流程脚本
# 使用方法: ./run_pipeline.sh <program_name1> [program_name2] [...]
#           ./run_pipeline.sh <category_name>
#           ./run_pipeline.sh clean
# 示例: ./run_pipeline.sh dijkstra_small_O3
#       ./run_pipeline.sh dijkstra_small_O3 basicmath_small_O3
#       ./run_pipeline.sh automotive
#       ./run_pipeline.sh embench-iot
#       ./run_pipeline.sh clean              # 清理所有 .s 文件（替换伪指令并追加 mul/div）

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FRONTEND_DIR="$SCRIPT_DIR/frontend"
SATURATION_DIR="$SCRIPT_DIR/Saturation"
EXTRACTOR_DIR="$SCRIPT_DIR/Extractor"
OUTPUT_BASE="$SCRIPT_DIR/output"
BENCHMARK_DIR="$SCRIPT_DIR/benchmark"

# 检查参数
if [ $# -eq 0 ]; then
    echo -e "${RED}错误: 请提供至少一个程序名或类别名${NC}"
    echo "用法: $0 <program_name1> [program_name2] [...]"
    echo "      $0 <category_name>"
    echo "      $0 clean"
    echo ""
    echo "示例:"
    echo "  $0 dijkstra_small_O3"
    echo "  $0 dijkstra_small_O3 basicmath_small_O3"
    echo "  $0 automotive          # 运行 automotive 类别下所有程序"
    echo "  $0 embench-iot          # 运行 embench-iot 类别下所有程序"
    echo "  $0 network              # 运行 network 类别下所有程序"
    echo "  $0 security             # 运行 security 类别下所有程序"
    echo "  $0 clean                # 清理所有 .s 文件（替换伪指令并追加 mul/div）"
    exit 1
fi

###############################################################################
# 函数：执行 clean 操作
###############################################################################
run_clean() {
    echo -e "${CYAN}========================================${NC}"
    echo -e "${CYAN}执行 Clean 操作${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo ""
    
    # 步骤 1: 删除所有 _placeholder.s 文件
    echo -e "${BLUE}步骤 1/3: 删除 _placeholder.s 文件...${NC}"
    placeholder_files=($(find "$BENCHMARK_DIR" -name "*_placeholder.s" -type f))
    if [ ${#placeholder_files[@]} -gt 0 ]; then
        echo "  找到 ${#placeholder_files[@]} 个 _placeholder.s 文件"
        for file in "${placeholder_files[@]}"; do
            echo "  删除: $file"
            rm -f "$file"
        done
        echo -e "${GREEN}✓ 步骤 1 完成（已删除 ${#placeholder_files[@]} 个文件）${NC}"
    else
        echo "  未找到 _placeholder.s 文件"
        echo -e "${GREEN}✓ 步骤 1 完成${NC}"
    fi
    echo ""
    
    # 步骤 2: 运行 replace_pseudo_clean.py
    echo -e "${BLUE}步骤 2/3: 替换伪指令...${NC}"
    if ! python3 "$FRONTEND_DIR/replace_pseudo_clean.py"; then
        echo -e "${RED}✗ 步骤 2 失败: replace_pseudo_clean.py${NC}"
        return 1
    fi
    echo -e "${GREEN}✓ 步骤 2 完成${NC}"
    echo ""
    
    # 步骤 3: 运行 append_mul_div.sh
    echo -e "${BLUE}步骤 3/3: 追加 mul/div 函数...${NC}"
    if ! bash "$BENCHMARK_DIR/append_mul_div.sh"; then
        echo -e "${RED}✗ 步骤 3 失败: append_mul_div.sh${NC}"
        return 1
    fi
    echo -e "${GREEN}✓ 步骤 3 完成${NC}"
    echo ""
    
    echo -e "${BLUE}--------------------------------${NC}"
    echo -e "${GREEN}✓ Clean 操作完成！${NC}"
    echo -e "${BLUE}--------------------------------${NC}"
    echo ""
    
    return 0
}

# 检查是否是 clean 命令
if [ "$1" = "clean" ]; then
    if run_clean; then
        exit 0
    else
        exit 1
    fi
fi

# 默认参数
DEFAULT_SCALE="0.001"
DEFAULT_BEST_K="1"
DEFAULT_TIMEOUT="180"

# 统计变量
SUCCESS_COUNT=0
FAIL_COUNT=0
declare -a FAILED_PROGRAMS

###############################################################################
# 函数：检查是否是 category 名称，如果是则提取所有程序名
###############################################################################
expand_category() {
    local input="$1"
    local category_dir="$BENCHMARK_DIR/$input"
    
    # 检查是否是 category 目录
    if [ -d "$category_dir" ]; then
        echo -e "${YELLOW}检测到类别: $input${NC}"
        echo "正在查找该类别下的所有程序..."
        
        # 查找所有 *_clean.s 文件
        local clean_files=($(find "$category_dir" -name "*_clean.s" -type f | sort))
        
        if [ ${#clean_files[@]} -eq 0 ]; then
            echo -e "${RED}警告: 在 $input 类别下未找到任何 *_clean.s 文件${NC}"
            return 1
        fi
        
        echo -e "${GREEN}找到 ${#clean_files[@]} 个程序${NC}"
        
        # 从文件路径中提取程序名
        # 格式: category/subdir/program_name_clean.s
        # 提取: program_name (去掉 _clean.s 后缀)
        local programs=()
        for file in "${clean_files[@]}"; do
            # 获取文件名（不含路径）
            local basename_file=$(basename "$file")
            # 去掉 _clean.s 后缀
            local program_name="${basename_file%_clean.s}"
            programs+=("$program_name")
        done
        
        # 输出找到的程序
        echo "程序列表:"
        for prog in "${programs[@]}"; do
            echo "  - $prog"
        done
        echo ""
        
        # 返回程序名数组（通过全局变量）
        EXPANDED_PROGRAMS=("${programs[@]}")
        return 0
    else
        # 不是 category，返回原输入
        EXPANDED_PROGRAMS=("$input")
        return 0
    fi
}

###############################################################################
# 展开所有参数（处理 category）
###############################################################################
declare -a ALL_PROGRAMS

for arg in "$@"; do
    if expand_category "$arg"; then
        # 将展开的程序添加到总列表
        for prog in "${EXPANDED_PROGRAMS[@]}"; do
            ALL_PROGRAMS+=("$prog")
        done
    else
        # 展开失败，跳过这个参数
        echo -e "${RED}警告: 跳过无效的参数: $arg${NC}"
    fi
done

# 检查是否有程序需要处理
if [ ${#ALL_PROGRAMS[@]} -eq 0 ]; then
    echo -e "${RED}错误: 没有找到任何需要处理的程序${NC}"
    exit 1
fi

TOTAL_PROGRAMS=${#ALL_PROGRAMS[@]}

# 处理单个程序的函数
process_program() {
    local PROGRAM_NAME="$1"
    local PROGRAM_INDEX="$2"
    
    echo -e "${CYAN}========================================${NC}"
    echo -e "${CYAN}程序 [$PROGRAM_INDEX/$TOTAL_PROGRAMS]: $PROGRAM_NAME${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo ""
    
    # ============================================================
    # 步骤 1/5: 运行完整前端分析 (run_full_analysis)
    # ============================================================
    echo -e "${BLUE}步骤 1/5: 运行完整前端分析...${NC}"
    if ! (cd "$FRONTEND_DIR" && bash run_full_analysis.sh "$PROGRAM_NAME"); then
        echo -e "${RED}✗ 步骤 1 失败: run_full_analysis${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$PROGRAM_NAME (步骤1失败)")
        return 1
    fi
    echo -e "${GREEN}✓ 步骤 1 完成${NC}"
    echo ""
    
    # ============================================================
    # 步骤 2/5: 运行饱和分析 (saturation)
    # ============================================================
    echo -e "${BLUE}步骤 2/5: 运行饱和分析...${NC}"
    if ! (cd "$SATURATION_DIR" && bash run_saturation.sh "$PROGRAM_NAME"); then
        echo -e "${RED}✗ 步骤 2 失败: saturation${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$PROGRAM_NAME (步骤2失败)")
        return 1
    fi
    echo -e "${GREEN}✓ 步骤 2 完成${NC}"
    echo ""
    
    # ============================================================
    # 步骤 3/5: 运行提取 (extraction - ILP)
    # ============================================================
    echo -e "${BLUE}步骤 3/5: 运行 ILP 提取...${NC}"
    
    # 首先生成 merged.json
    MERGED_JSON="$OUTPUT_BASE/ilp/$PROGRAM_NAME/merged.json"
    if [ ! -f "$MERGED_JSON" ]; then
        echo "  生成 merged.json..."
        if ! python3 "$EXTRACTOR_DIR/src/egraph.py" "$PROGRAM_NAME"; then
            echo -e "${RED}✗ 生成 merged.json 失败${NC}"
            FAIL_COUNT=$((FAIL_COUNT + 1))
            FAILED_PROGRAMS+=("$PROGRAM_NAME (步骤3-merged失败)")
            return 1
        fi
    else
        echo "  merged.json 已存在，跳过生成"
    fi
    
    # 运行 ILP solver
    SCALE_OUTPUT="$OUTPUT_BASE/ilp/${PROGRAM_NAME}_scale_${DEFAULT_SCALE}"
    mkdir -p "$SCALE_OUTPUT"
    
    echo "  运行 ILP solver (scale=$DEFAULT_SCALE, best_k=$DEFAULT_BEST_K)..."
    if ! python3 "$EXTRACTOR_DIR/src/ILP/ilp_solver.py" "$PROGRAM_NAME" \
        --node-cost-scale "$DEFAULT_SCALE" \
        --best_k "$DEFAULT_BEST_K" \
        --timeout "$DEFAULT_TIMEOUT" \
        --cost-mode latency \
        --output "$SCALE_OUTPUT"; then
        echo -e "${RED}✗ ILP 提取失败${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$PROGRAM_NAME (步骤3-ILP失败)")
        return 1
    fi
    
    # 复制解文件到主目录
    mkdir -p "$OUTPUT_BASE/ilp/$PROGRAM_NAME/sol"
    if [ "$DEFAULT_BEST_K" -eq 1 ]; then
        SRC_SOL="$SCALE_OUTPUT/$PROGRAM_NAME/sol/solution.sol"
    else
        SRC_SOL="$SCALE_OUTPUT/$PROGRAM_NAME/sol/solution_0.sol"
    fi
    
    if [ -f "$SRC_SOL" ]; then
        cp "$SRC_SOL" "$OUTPUT_BASE/ilp/$PROGRAM_NAME/sol/solution_0.sol"
        echo "  解文件已复制"
    fi
    
    echo -e "${GREEN}✓ 步骤 3 完成${NC}"
    echo ""
    
    # ============================================================
    # 步骤 4/5: 运行重建 (reconstruction)
    # ============================================================
    echo -e "${BLUE}步骤 4/5: 运行重建...${NC}"
    if ! bash "$FRONTEND_DIR/run_reconstruct.sh" "$PROGRAM_NAME" "$DEFAULT_BEST_K"; then
        echo -e "${RED}✗ 步骤 4 失败: reconstruction${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$PROGRAM_NAME (步骤4失败)")
        return 1
    fi
    echo -e "${GREEN}✓ 步骤 4 完成${NC}"
    echo ""
    
    # ============================================================
    # 步骤 5/5: 运行验证 (verify)
    # ============================================================
    echo -e "${BLUE}步骤 5/5: 运行验证...${NC}"
    if ! bash "$FRONTEND_DIR/verify_rewrite.sh" "$PROGRAM_NAME"; then
        echo -e "${RED}✗ 步骤 5 失败: verify${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$PROGRAM_NAME (步骤5失败)")
        return 1
    fi
    echo -e "${GREEN}✓ 步骤 5 完成${NC}"
    echo ""
    
    # ============================================================
    # 完成统计
    # ============================================================
    echo -e "${BLUE}--------------------------------${NC}"
    echo -e "${GREEN}✓ $PROGRAM_NAME 完整流程完成！${NC}"
    echo -e "${BLUE}--------------------------------${NC}"
    echo ""
    
    SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    return 0
}

# ============================================================
# 主循环：处理所有程序
# ============================================================
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}完整分析流程${NC}"
echo -e "${BLUE}总共 $TOTAL_PROGRAMS 个程序${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo "默认参数:"
echo "  - Scale: $DEFAULT_SCALE"
echo "  - Best K: $DEFAULT_BEST_K"
echo "  - Timeout: ${DEFAULT_TIMEOUT}秒"
echo ""

PROGRAM_INDEX=0
for PROGRAM_NAME in "${ALL_PROGRAMS[@]}"; do
    PROGRAM_INDEX=$((PROGRAM_INDEX + 1))
    
    # 处理每个程序，即使失败也继续处理下一个
    process_program "$PROGRAM_NAME" "$PROGRAM_INDEX" || true
done

# ============================================================
# 最终总结
# ============================================================
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}批量处理完成！${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "总计: $TOTAL_PROGRAMS 个程序"
echo -e "${GREEN}成功: $SUCCESS_COUNT${NC}"
echo -e "${RED}失败: $FAIL_COUNT${NC}"

if [ $FAIL_COUNT -gt 0 ]; then
    echo ""
    echo -e "${RED}失败的程序:${NC}"
    for failed in "${FAILED_PROGRAMS[@]}"; do
        echo -e "  ${RED}✗${NC} $failed"
    done
fi

echo ""

# 如果有失败的程序，返回非零退出码
if [ $FAIL_COUNT -gt 0 ]; then
    exit 1
fi

exit 0

