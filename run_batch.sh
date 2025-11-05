#!/bin/bash
# 批量运行多个程序的优化流程
# 使用方法: ./run_batch.sh [program1] [program2] ...
# 如果不指定程序，将运行所有默认程序

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
MAGENTA='\033[0;35m'
NC='\033[0m'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 默认程序列表
DEFAULT_PROGRAMS=(
    "dijkstra_small_O3"
    "bitcnts_small_O3"
    "sha_driver_O3"
    "rijndael_O3"
    "basicmath_small_O3"
    "qsort_small_O3"
    "patricia_O3"
)

# 如果没有参数，使用默认程序列表
if [ $# -eq 0 ]; then
    PROGRAMS=("${DEFAULT_PROGRAMS[@]}")
    echo -e "${BLUE}运行所有默认程序的优化流程${NC}"
else
    PROGRAMS=("$@")
    echo -e "${BLUE}运行指定程序的优化流程${NC}"
fi

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}批量优化流程${NC}"
echo -e "${BLUE}========================================${NC}"
echo -e "程序列表:"
for prog in "${PROGRAMS[@]}"; do
    echo -e "  - ${GREEN}$prog${NC}"
done
echo ""

# 统计变量
TOTAL=${#PROGRAMS[@]}
SUCCESS=0
FAILED=0
FAILED_PROGRAMS=()

# 开始时间
START_TIME=$(date +%s)

# 运行每个程序
for i in "${!PROGRAMS[@]}"; do
    PROGRAM="${PROGRAMS[$i]}"
    CURRENT=$((i + 1))

    echo -e "${MAGENTA}========================================${NC}"
    echo -e "${MAGENTA}[$CURRENT/$TOTAL] 处理程序: $PROGRAM${NC}"
    echo -e "${MAGENTA}========================================${NC}"

    if "$SCRIPT_DIR/run_pipeline.sh" "$PROGRAM"; then
        SUCCESS=$((SUCCESS + 1))
        echo -e "${GREEN}✓ $PROGRAM 优化成功${NC}"
    else
        FAILED=$((FAILED + 1))
        FAILED_PROGRAMS+=("$PROGRAM")
        echo -e "${RED}✗ $PROGRAM 优化失败${NC}"
    fi

    echo ""
done

# 结束时间
END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

# 将秒转换为时分秒格式
HOURS=$((DURATION / 3600))
MINUTES=$(((DURATION % 3600) / 60))
SECONDS=$((DURATION % 60))

# 显示汇总
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}批量优化完成${NC}"
echo -e "${BLUE}========================================${NC}"
echo -e "总计: ${YELLOW}$TOTAL${NC} 个程序"
echo -e "成功: ${GREEN}$SUCCESS${NC} 个"
echo -e "失败: ${RED}$FAILED${NC} 个"

if [ ${#FAILED_PROGRAMS[@]} -gt 0 ]; then
    echo -e "${RED}失败的程序:${NC}"
    for prog in "${FAILED_PROGRAMS[@]}"; do
        echo -e "  - ${RED}$prog${NC}"
    done
fi

echo ""
echo -e "运行时间: ${YELLOW}${HOURS}小时 ${MINUTES}分钟 ${SECONDS}秒${NC}"
echo ""

# 生成汇总报告
REPORT_FILE="$SCRIPT_DIR/optimization_report_$(date +%Y%m%d_%H%M%S).txt"
echo "生成汇总报告: $REPORT_FILE"
{
    echo "E-Graph ISA 编译器协同设计优化报告"
    echo "=================================="
    echo "生成时间: $(date)"
    echo ""
    echo "程序优化结果:"
    echo "--------------"

    for prog in "${PROGRAMS[@]}"; do
        echo ""
        echo "程序: $prog"

        # 检查输出文件是否存在
        REWRITE_FILE=$(find "$SCRIPT_DIR/benchmark" -name "${prog}_rewrite.s" 2>/dev/null | head -1)
        if [ -f "$REWRITE_FILE" ]; then
            echo "  状态: 成功"
            echo "  优化文件: $REWRITE_FILE"

            # 统计基本块数量
            BLOCKS_DIR="$SCRIPT_DIR/output/frontend/$prog/basic_blocks_rewrite"
            if [ -d "$BLOCKS_DIR" ]; then
                BLOCK_COUNT=$(ls -1 "$BLOCKS_DIR"/*.txt 2>/dev/null | wc -l)
                echo "  重写基本块: $BLOCK_COUNT"
            fi

            # 如果有 ILP 解，显示优化信息
            SOL_FILE="$SCRIPT_DIR/output/ilp/$prog/sol/solution.sol"
            if [ -f "$SOL_FILE" ]; then
                echo "  ILP 求解: 完成"
            fi
        else
            echo "  状态: 失败"
        fi
    done

    echo ""
    echo "汇总统计:"
    echo "----------"
    echo "总程序数: $TOTAL"
    echo "成功: $SUCCESS"
    echo "失败: $FAILED"
    echo "运行时间: ${HOURS}小时 ${MINUTES}分钟 ${SECONDS}秒"
} > "$REPORT_FILE"

echo -e "${GREEN}报告已保存${NC}"