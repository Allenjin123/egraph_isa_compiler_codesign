#!/bin/bash
# 单独运行优化流程中的某个步骤
# 使用方法: ./run_step.sh <step> <program_name> [options]
# 示例: ./run_step.sh saturation dijkstra_small_O3

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 显示帮助
show_help() {
    echo -e "${BLUE}E-Graph ISA 编译器协同设计 - 单步运行工具${NC}"
    echo ""
    echo "用法: $0 <step> <program_name> [options]"
    echo ""
    echo "可用步骤:"
    echo "  1, frontend   - 运行前端分析"
    echo "  2, saturation - 运行 E-图饱和优化"
    echo "  3, extract    - 运行 ILP 提取"
    echo "  4, reconstruct- 运行汇编重构"
    echo ""
    echo "示例:"
    echo "  $0 frontend dijkstra_small_O3"
    echo "  $0 saturation dijkstra_small_O3"
    echo "  $0 extract dijkstra_small_O3 5    # 提取5个最优解"
    echo "  $0 reconstruct dijkstra_small_O3"
    echo ""
    echo "快捷运行（按顺序运行多个步骤）:"
    echo "  $0 1-2 dijkstra_small_O3   # 运行步骤1和2"
    echo "  $0 2-4 dijkstra_small_O3   # 运行步骤2到4"
    echo "  $0 all dijkstra_small_O3   # 运行所有步骤"
    exit 0
}

# 检查参数
if [ $# -lt 2 ]; then
    show_help
fi

STEP="$1"
PROGRAM="$2"
EXTRA_ARG="${3:-}"

# 设置环境
setup_environment() {
    source /home/allenjin/miniconda3/etc/profile.d/conda.sh
    conda activate egglog-python
    export PATH=/home/allenjin/egglog/target/release:$PATH
    if command -v module &> /dev/null; then
        module load gurobi 2>/dev/null || true
    fi
}

# 运行步骤
run_frontend() {
    echo -e "${YELLOW}运行 Frontend Analysis: $PROGRAM${NC}"
    cd "$SCRIPT_DIR/frontend"
    ./run_full_analysis.sh "$PROGRAM"
}

run_saturation() {
    echo -e "${YELLOW}运行 E-Graph Saturation: $PROGRAM${NC}"
    cd "$SCRIPT_DIR/Saturation"
    ./run_saturation.sh "$PROGRAM"
}

run_extract() {
    local best_k="${1:-1}"
    echo -e "${YELLOW}运行 ILP Extraction: $PROGRAM (best_k=$best_k)${NC}"
    cd "$SCRIPT_DIR/Extractor"
    ./run_extractor.sh "$PROGRAM" "$best_k"
}

run_reconstruct() {
    echo -e "${YELLOW}运行 Assembly Reconstruction: $PROGRAM${NC}"
    cd "$SCRIPT_DIR/frontend"
    ./run_reconstruct.sh "$PROGRAM"
}

# 设置环境
setup_environment

# 执行指定的步骤
case "$STEP" in
    1|frontend)
        run_frontend
        ;;
    2|saturation)
        run_saturation
        ;;
    3|extract)
        run_extract "$EXTRA_ARG"
        ;;
    4|reconstruct)
        run_reconstruct
        ;;
    1-2)
        run_frontend
        run_saturation
        ;;
    1-3)
        run_frontend
        run_saturation
        run_extract "$EXTRA_ARG"
        ;;
    1-4|all)
        run_frontend
        run_saturation
        run_extract "$EXTRA_ARG"
        run_reconstruct
        ;;
    2-3)
        run_saturation
        run_extract "$EXTRA_ARG"
        ;;
    2-4)
        run_saturation
        run_extract "$EXTRA_ARG"
        run_reconstruct
        ;;
    3-4)
        run_extract "$EXTRA_ARG"
        run_reconstruct
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        echo -e "${RED}错误: 未知的步骤 '$STEP'${NC}"
        echo ""
        show_help
        ;;
esac

echo -e "${GREEN}✓ 完成${NC}"