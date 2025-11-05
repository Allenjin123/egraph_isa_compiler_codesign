#!/bin/bash
# E-Graph ISA Compiler Co-design Pipeline
# 完整运行流程：Frontend -> Saturation -> Extractor -> Reconstruct
# 使用方法: ./run_pipeline.sh <program_name>
# 示例: ./run_pipeline.sh dijkstra_small_O3

set -e  # 遇到错误时停止

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 获取脚本目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 检查参数
if [ $# -eq 0 ]; then
    echo -e "${RED}错误: 缺少程序名参数${NC}"
    echo "用法: $0 <program_name> [best_k]"
    echo "示例: $0 dijkstra_small_O3"
    echo "      $0 bitcnts_small_O3 5"
    echo ""
    echo "可用的程序:"
    echo "  - dijkstra_small_O3"
    echo "  - bitcnts_small_O3"
    echo "  - sha_driver_O3"
    echo "  - rijndael_O3"
    echo "  - basicmath_small_O3"
    echo "  - qsort_small_O3"
    echo "  - patricia_O3"
    exit 1
fi

PROGRAM="$1"
BEST_K="${2:-1}"  # 默认 best_k=1

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}E-Graph ISA 编译器协同设计优化流程${NC}"
echo -e "${BLUE}========================================${NC}"
echo -e "程序: ${GREEN}$PROGRAM${NC}"
echo -e "ILP 最优解数量: ${GREEN}$BEST_K${NC}"
echo ""

# 函数：运行命令并检查结果
run_step() {
    local step_name="$1"
    local command="$2"

    echo -e "${YELLOW}>>> $step_name${NC}"
    echo -e "${BLUE}命令: $command${NC}"

    if eval "$command"; then
        echo -e "${GREEN}✓ $step_name 成功${NC}"
        echo ""
        return 0
    else
        echo -e "${RED}✗ $step_name 失败${NC}"
        echo ""
        return 1
    fi
}

# 激活 conda 环境并设置 PATH
setup_environment() {
    echo -e "${YELLOW}>>> 设置环境${NC}"
    source /home/allenjin/miniconda3/etc/profile.d/conda.sh
    conda activate egglog-python
    export PATH=/home/allenjin/egglog/target/release:$PATH

    # 验证 egglog 路径
    EGGLOG_PATH=$(which egglog)
    echo -e "使用 egglog: ${GREEN}$EGGLOG_PATH${NC}"

    # 加载 Gurobi（如果可用）
    if command -v module &> /dev/null; then
        module load gurobi 2>/dev/null || true
    fi
    echo ""
}

# 设置环境
setup_environment

# 步骤 1: Frontend Analysis - 分析程序并生成 SSA 形式
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}步骤 1/4: Frontend Analysis${NC}"
echo -e "${BLUE}========================================${NC}"
run_step "前端分析" "cd '$SCRIPT_DIR/frontend' && ./run_full_analysis.sh '$PROGRAM'"

# 步骤 2: Saturation - E-图饱和优化
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}步骤 2/4: E-Graph Saturation${NC}"
echo -e "${BLUE}========================================${NC}"
run_step "E-图饱和优化" "cd '$SCRIPT_DIR/Saturation' && ./run_saturation.sh '$PROGRAM'"

# 步骤 3: Extractor - ILP 提取最优解
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}步骤 3/4: ILP Extraction${NC}"
echo -e "${BLUE}========================================${NC}"

# 检查是否有 Gurobi
if command -v gurobi_cl &> /dev/null || [ -f /home/allenjin/Codes/egraph_isa_compiler_codesign/Extractor/src/ILP/gurobi/gurobi_solver ]; then
    run_step "ILP 提取" "cd '$SCRIPT_DIR/Extractor' && ./run_extractor.sh '$PROGRAM' '$BEST_K'"
else
    echo -e "${YELLOW}⚠ Gurobi 未安装，跳过 ILP 提取步骤${NC}"
    echo -e "${YELLOW}  如需使用此功能，请安装 Gurobi 并运行 'module load gurobi'${NC}"
    echo ""
fi

# 步骤 4: Reconstruct - 重构优化后的汇编代码
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}步骤 4/4: Assembly Reconstruction${NC}"
echo -e "${BLUE}========================================${NC}"
run_step "重构汇编" "cd '$SCRIPT_DIR/frontend' && ./run_reconstruct.sh '$PROGRAM'"

# 完成
echo -e "${BLUE}========================================${NC}"
echo -e "${GREEN}✓ 优化流程完成！${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "输出文件位置:"
echo -e "  - 优化后的汇编: ${GREEN}benchmark/*/\*/${PROGRAM}_rewrite.s${NC}"
echo -e "  - E-图 JSON: ${GREEN}output/frontend/$PROGRAM/basic_blocks_json/${NC}"
echo -e "  - ILP 解: ${GREEN}output/ilp/$PROGRAM/sol/${NC}"
echo -e "  - 重写的基本块: ${GREEN}output/frontend/$PROGRAM/basic_blocks_rewrite/${NC}"
echo ""

# 可选：显示优化统计
if [ -f "$SCRIPT_DIR/output/ilp/$PROGRAM/sol/solution.sol" ]; then
    echo -e "${BLUE}优化统计:${NC}"
    # 提取一些关键信息
    ORIG_BLOCKS=$(ls -1 "$SCRIPT_DIR/output/frontend/$PROGRAM/basic_blocks/" 2>/dev/null | wc -l)
    REWRITE_BLOCKS=$(ls -1 "$SCRIPT_DIR/output/frontend/$PROGRAM/basic_blocks_rewrite/" 2>/dev/null | wc -l)
    echo -e "  - 基本块数量: ${GREEN}$ORIG_BLOCKS${NC}"
    echo -e "  - 重写块数量: ${GREEN}$REWRITE_BLOCKS${NC}"

    # 如果有 ILP 日志，提取算子类型数量
    LOG_FILE="$SCRIPT_DIR/output/ilp/$PROGRAM/log/extraction_gurobi.log"
    if [ -f "$LOG_FILE" ]; then
        OBJ_VALUE=$(grep -oP "Best objective \K[\d.]+" "$LOG_FILE" 2>/dev/null | head -1)
        if [ ! -z "$OBJ_VALUE" ]; then
            echo -e "  - ILP 目标值: ${GREEN}$OBJ_VALUE${NC}"
        fi
    fi
fi

echo ""
echo -e "${BLUE}提示:${NC}"
echo -e "  - 查看原始与优化后的差异: ${YELLOW}diff -u benchmark/*/\*/${PROGRAM}_clean.s benchmark/*/\*/${PROGRAM}_rewrite.s${NC}"
echo -e "  - 验证正确性: ${YELLOW}spike pk benchmark/*/\*/${PROGRAM}_rewrite${NC}"