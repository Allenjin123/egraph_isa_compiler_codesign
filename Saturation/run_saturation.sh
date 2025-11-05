#!/bin/bash
# E-graph 饱和分析流程
# 使用方法: ./run_saturation.sh <program_name>
# 示例: ./run_saturation.sh dijkstra_small_O3

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# 使用环境变量 EGGLOG_PATH，如果设置了的话
# 优先级：环境变量 > PATH中的 > cargo安装的
if [ ! -z "$EGGLOG_PATH" ]; then
    EGGLOG="$EGGLOG_PATH"
elif command -v egglog &> /dev/null; then
    EGGLOG=$(which egglog)
else
    EGGLOG="$HOME/.cargo/bin/egglog"
fi

echo -e "${GREEN}使用 egglog: $EGGLOG${NC}"

# 检查参数
if [ $# -eq 0 ]; then
    # 批量模式
    PROGRAMS=(
        "dijkstra_small_O3"
        "bitcnts_small_O3"
        "sha_driver_O3"
        "rijndael_O3"
        "basicmath_small_O3"
        "qsort_small_O3"
        "patricia_O3"
    )

    echo ""
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}批量 E-graph 饱和分析流程${NC}"
    echo -e "${BLUE}总共 ${#PROGRAMS[@]} 个程序${NC}"
    echo -e "${BLUE}========================================${NC}"
else
    # 单个程序模式
    PROGRAMS=("$1")
fi

# 处理每个程序
for i in "${!PROGRAMS[@]}"; do
    PROGRAM="${PROGRAMS[$i]}"

    if [ ${#PROGRAMS[@]} -gt 1 ]; then
        echo ""
        echo -e "${CYAN}========================================${NC}"
        echo -e "${CYAN}程序 [$((i+1))/${#PROGRAMS[@]}]: $PROGRAM${NC}"
        echo -e "${CYAN}========================================${NC}"
    fi

    OUTPUT_DIR="$PROJECT_ROOT/output/frontend/$PROGRAM"

    # 检查输入目录
    if [ ! -d "$OUTPUT_DIR/basic_blocks_ssa" ]; then
        # 如果没有SSA文件夹，可能需要先运行SSA转换
        echo -e "${YELLOW}未找到SSA文件，尝试运行SSA转换...${NC}"

        if [ -f "$PROJECT_ROOT/SSA/convert_to_ssa.py" ]; then
            python3 "$PROJECT_ROOT/SSA/convert_to_ssa.py" "$PROGRAM"
        else
            # 如果SSA转换脚本不存在，使用frontend的转换
            python3 "$PROJECT_ROOT/frontend/convert_to_ssa.py" "$OUTPUT_DIR"
        fi
    fi

    # 检查输出目录是否存在
    if [ ! -d "$OUTPUT_DIR" ]; then
        echo -e "${RED}错误: 找不到程序目录 $OUTPUT_DIR${NC}"
        echo "请先运行前端分析: ./frontend/run_analysis_pipeline.sh $PROGRAM"
        continue
    fi

    echo -e "${GREEN}找到程序目录: $OUTPUT_DIR${NC}"

    # 步骤 1: 生成 .egg 文件
    echo ""
    echo -e "${MAGENTA}步骤 1/3: 生成 E-graph 文件 (.egg)${NC}"
    echo "输入: $OUTPUT_DIR/basic_blocks_ssa/"
    echo "输出: $OUTPUT_DIR/basic_blocks_egglog/"

    python3 "$SCRIPT_DIR/local_saturation.py" "$OUTPUT_DIR"

    # 步骤 2: 运行 egglog
    echo ""
    echo -e "${MAGENTA}步骤 2/3: 运行 E-graph 饱和分析${NC}"
    echo "输入: $OUTPUT_DIR/basic_blocks_egglog/*.egg"
    echo "输出: $OUTPUT_DIR/basic_blocks_json/"

    python3 "$SCRIPT_DIR/run_egglog_all.py" "$OUTPUT_DIR"

    # 步骤 3: 合并 JSON（可选）
    if [ -f "$PROJECT_ROOT/Extractor/src/egraph_parser.py" ]; then
        echo ""
        echo -e "${MAGENTA}步骤 3/3: 合并 JSON 文件${NC}"
        python3 "$PROJECT_ROOT/Extractor/src/egraph_parser.py" "$PROGRAM"
    fi

    echo -e "${GREEN}✓ $PROGRAM 饱和分析完成${NC}"
done

if [ ${#PROGRAMS[@]} -gt 1 ]; then
    echo ""
    echo -e "${BLUE}========================================${NC}"
    echo -e "${GREEN}✓ 批量饱和分析完成！${NC}"
    echo -e "${BLUE}========================================${NC}"
fi