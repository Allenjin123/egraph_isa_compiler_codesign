#!/bin/bash
# 完整的前端分析流程脚本（步骤 1-5）
# 使用方法: ./run_full_analysis.sh [program_name1] [program_name2] [...]
# 示例: ./run_full_analysis.sh                          # 运行所有程序
#       ./run_full_analysis.sh dijkstra_small_O3        # 运行单个程序
#       ./run_full_analysis.sh dijkstra_small_O3 basicmath_small_O3  # 运行多个程序

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# 检查参数 - 如果没有提供参数，则运行所有程序
if [ $# -eq 0 ]; then
    echo -e "${YELLOW}未提供程序名，将运行所有可用程序${NC}"
    echo ""

    # 自动发现所有程序
    readarray -t PROGRAMS < <(find "$PROJECT_ROOT/benchmark" -name "*_clean.s" -type f | while read file; do
        basename "$file" .s | sed 's/_clean$//'
    done | sort -u)

    echo "发现 ${#PROGRAMS[@]} 个程序:"
    printf '  - %s\n' "${PROGRAMS[@]}"
    echo ""
else
    # 使用提供的参数
    PROGRAMS=("$@")
fi

# 统计变量
TOTAL_PROGRAMS=${#PROGRAMS[@]}
SUCCESS_COUNT=0
FAIL_COUNT=0
declare -a FAILED_PROGRAMS

# 处理单个程序的函数
process_program() {
    local PROGRAM_NAME="$1"
    local PROGRAM_INDEX="$2"
    
    echo -e "${CYAN}=================================${NC}"
    echo -e "${CYAN}程序 [$PROGRAM_INDEX/$TOTAL_PROGRAMS]: $PROGRAM_NAME${NC}"
    echo -e "${CYAN}=================================${NC}"
    echo ""
    
    # 在 benchmark 目录下查找对应的 _clean.s 文件
    echo -e "${YELLOW}正在查找汇编文件...${NC}"
    local ASM_FILE=$(find "$PROJECT_ROOT/benchmark" -name "${PROGRAM_NAME}_clean.s" -type f | head -1)
    
    if [ -z "$ASM_FILE" ]; then
        echo -e "${RED}错误: 找不到文件 ${PROGRAM_NAME}_clean.s${NC}"
        echo ""
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$PROGRAM_NAME (文件未找到)")
        return 1
    fi
    
    echo -e "${GREEN}找到文件: $ASM_FILE${NC}"
    echo ""
    
    # 输出路径
    local OUTPUT_BASE="$PROJECT_ROOT/output/frontend"
    local OUTPUT_DIR="$OUTPUT_BASE/$PROGRAM_NAME"
    
    echo "输出目录: $OUTPUT_DIR"
    echo ""
    
    # ============================================================
    # 步骤 1/5: 分析基本块
    # ============================================================
    echo -e "${GREEN}步骤 1/5: 分析基本块${NC}"
    echo "输入: $ASM_FILE"
    echo "输出: $OUTPUT_DIR/basic_blocks/"
    
    if ! python3 "$SCRIPT_DIR/analyze_asm_blocks.py" "$ASM_FILE" -o "$OUTPUT_BASE"; then
        echo -e "${RED}步骤 1 失败${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$PROGRAM_NAME (步骤1失败)")
        return 1
    fi
    echo ""
    
    # 移动新生成的文件（去掉_clean后缀，保留原有文件）
    if [ -d "${OUTPUT_DIR}_clean" ]; then
        echo "移动新生成的文件: ${PROGRAM_NAME}_clean -> $PROGRAM_NAME"
        mkdir -p "$OUTPUT_DIR"
        
        # 移动basic_blocks目录
        if [ -d "${OUTPUT_DIR}_clean/basic_blocks" ]; then
            rm -rf "$OUTPUT_DIR/basic_blocks"
            mv "${OUTPUT_DIR}_clean/basic_blocks" "$OUTPUT_DIR/"
        fi
        
        # 移动label_to_block.json
        if [ -f "${OUTPUT_DIR}_clean/label_to_block.json" ]; then
            mv "${OUTPUT_DIR}_clean/label_to_block.json" "$OUTPUT_DIR/"
        fi
        
        # 删除临时的_clean目录
        rm -rf "${OUTPUT_DIR}_clean"
    fi
    
    # ============================================================
    # 步骤 2/5: 构建控制流图（CFG）
    # ============================================================
    echo -e "${GREEN}步骤 2/5: 构建控制流图（CFG）${NC}"
    echo "输出: $OUTPUT_DIR/cfg.json"
    
    if ! python3 "$SCRIPT_DIR/build_cfg.py" "$OUTPUT_DIR" -v; then
        echo -e "${RED}步骤 2 失败${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$PROGRAM_NAME (步骤2失败)")
        return 1
    fi
    echo ""
    
    # ============================================================
    # 步骤 3/5: 分析DEF/USE信息
    # ============================================================
    echo -e "${GREEN}步骤 3/5: 分析DEF/USE信息${NC}"
    echo "输出: $OUTPUT_DIR/defuse.json"
    
    if ! python3 "$SCRIPT_DIR/analyze_defuse.py" "$OUTPUT_DIR" -v; then
        echo -e "${RED}步骤 3 失败${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$PROGRAM_NAME (步骤3失败)")
        return 1
    fi
    echo ""
    
    # ============================================================
    # 步骤 4/5: 分析寄存器活性
    # ============================================================
    echo -e "${GREEN}步骤 4/5: 分析寄存器活性${NC}"
    echo "输出: $OUTPUT_DIR/liveness.json"
    
    if ! python3 "$SCRIPT_DIR/analyze_liveness.py" "$OUTPUT_DIR" -v; then
        echo -e "${RED}步骤 4 失败${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$PROGRAM_NAME (步骤4失败)")
        return 1
    fi
    echo ""
    
    # ============================================================
    # 步骤 5/5: 转换为 SSA 形式
    # ============================================================
    echo -e "${GREEN}步骤 5/5: 转换为 SSA 形式${NC}"
    echo "输出: $OUTPUT_DIR/basic_blocks_ssa/"
    
    if ! python3 "$SCRIPT_DIR/convert_to_ssa.py" "$OUTPUT_DIR" -v; then
        echo -e "${RED}步骤 5 失败${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$PROGRAM_NAME (步骤5失败)")
        return 1
    fi
    echo ""
    
    # ============================================================
    # 完成统计
    # ============================================================
    echo -e "${BLUE}--------------------------------${NC}"
    echo -e "${GREEN}✓ $PROGRAM_NAME 分析完成！${NC}"
    echo -e "${BLUE}--------------------------------${NC}"
    echo ""
    echo "生成的文件："
    echo "  - $OUTPUT_DIR/basic_blocks/*.txt"
    echo "  - $OUTPUT_DIR/basic_blocks_ssa/*.txt"
    echo "  - $OUTPUT_DIR/label_to_block.json"
    echo "  - $OUTPUT_DIR/cfg.json"
    echo "  - $OUTPUT_DIR/defuse.json"
    echo "  - $OUTPUT_DIR/liveness.json"
    echo ""
    
    local BLOCK_COUNT=$(ls -1 "$OUTPUT_DIR/basic_blocks"/*.txt 2>/dev/null | wc -l)
    echo "统计: $BLOCK_COUNT 个基本块"
    echo ""
    
    SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    return 0
}

# ============================================================
# 主循环：处理所有程序
# ============================================================
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}批量前端分析流程${NC}"
echo -e "${BLUE}总共 $TOTAL_PROGRAMS 个程序${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

PROGRAM_INDEX=0
for PROGRAM_NAME in "${PROGRAMS[@]}"; do
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
echo -e "${YELLOW}提示: 你可以查看生成的JSON文件来检查分析结果${NC}"
echo -e "${YELLOW}下一步: 可以继续运行 egglog 优化流程${NC}"
echo ""

# 如果有失败的程序，返回非零退出码
if [ $FAIL_COUNT -gt 0 ]; then
    exit 1
fi

exit 0

