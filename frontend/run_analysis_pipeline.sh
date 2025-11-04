#!/bin/bash
# 完整的前端分析流程脚本
# 示例：以dijkstra_small_O3为例

set -e  # 遇到错误立即退出

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# 输入输出路径
BENCHMARK_DIR="$PROJECT_ROOT/benchmark"
OUTPUT_BASE="$PROJECT_ROOT/output/frontend"

# 示例程序
PROGRAM_NAME="dijkstra_small_O3"
ASM_FILE="$BENCHMARK_DIR/network/dijkstra/${PROGRAM_NAME}_clean.s"
OUTPUT_DIR="$OUTPUT_BASE/$PROGRAM_NAME"

echo -e "${BLUE}=================================${NC}"
echo -e "${BLUE}前端分析流程 - $PROGRAM_NAME${NC}"
echo -e "${BLUE}=================================${NC}"
echo ""

# 检查输入文件
if [ ! -f "$ASM_FILE" ]; then
    echo -e "${RED}错误: 找不到汇编文件: $ASM_FILE${NC}"
    exit 1
fi

echo -e "${GREEN}步骤 1/4: 分析基本块${NC}"
echo "输入: $ASM_FILE"
echo "输出: $OUTPUT_DIR/basic_blocks/"
python3 "$SCRIPT_DIR/analyze_asm_blocks.py" "$ASM_FILE" -o "$OUTPUT_BASE"
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

echo -e "${GREEN}步骤 2/4: 构建控制流图（CFG）${NC}"
echo "输出: $OUTPUT_DIR/cfg.json"
python3 "$SCRIPT_DIR/build_cfg.py" "$OUTPUT_DIR" -v
echo ""

echo -e "${GREEN}步骤 3/4: 分析DEF/USE信息${NC}"
echo "输出: $OUTPUT_DIR/defuse.json"
python3 "$SCRIPT_DIR/analyze_defuse.py" "$OUTPUT_DIR" -v
echo ""

echo -e "${GREEN}步骤 4/4: 分析寄存器活性${NC}"
echo "输出: $OUTPUT_DIR/liveness.json"
python3 "$SCRIPT_DIR/analyze_liveness.py" "$OUTPUT_DIR" -v
echo ""

echo -e "${BLUE}=================================${NC}"
echo -e "${GREEN}✓ 分析完成！${NC}"
echo -e "${BLUE}=================================${NC}"
echo ""
echo "生成的文件："
echo "  - $OUTPUT_DIR/basic_blocks/*.txt"
echo "  - $OUTPUT_DIR/label_to_block.json"
echo "  - $OUTPUT_DIR/cfg.json"
echo "  - $OUTPUT_DIR/defuse.json"
echo "  - $OUTPUT_DIR/liveness.json"
echo ""
echo "统计信息："
BLOCK_COUNT=$(ls -1 "$OUTPUT_DIR/basic_blocks"/*.txt 2>/dev/null | wc -l)
echo "  - 基本块数量: $BLOCK_COUNT"

if command -v jq &> /dev/null; then
    LABEL_COUNT=$(jq '. | length' "$OUTPUT_DIR/label_to_block.json" 2>/dev/null || echo "N/A")
    echo "  - 标签数量: $LABEL_COUNT"
    
    CFG_BLOCKS=$(jq '.cfg | length' "$OUTPUT_DIR/cfg.json" 2>/dev/null || echo "N/A")
    echo "  - CFG块数量: $CFG_BLOCKS"
fi

echo ""
echo -e "${YELLOW}提示: 你可以查看生成的JSON文件来检查分析结果${NC}"

