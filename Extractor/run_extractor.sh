#!/bin/bash
# ILP 提取器 - 使用方法: ./run_extractor.sh <program_name> [best_k] [-s scale] [--ban-ops op1 op2 ...]
# 示例: ./run_extractor.sh dijkstra_small_O3
#       ./run_extractor.sh dijkstra_small_O3 5
#       ./run_extractor.sh dijkstra_small_O3 3 -s 0.001
#       ./run_extractor.sh dijkstra_small_O3 3 --scale 0.001
#       ./run_extractor.sh dijkstra_small_O3 1 --ban-ops Mul Div
#       ./run_extractor.sh dijkstra_small_O3 3 -s 0.001 --ban-ops Mul Div Rem
module load gurobi
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

FRONTEND_DIR="$SCRIPT_DIR/../output/frontend"
OUTPUT_BASE="$SCRIPT_DIR/../output/ilp"

# Parse arguments: first two positional args are program and best_k
PROGRAM=""
BEST_K=1
SCALE=""
BAN_OPS=()

POS=0
while [[ $# -gt 0 ]]; do
    case $1 in
        -s|--scale)
            SCALE="$2"
            shift 2
            ;;
        --ban-ops)
            shift
            # Collect all subsequent non-flag arguments as banned ops
            while [[ $# -gt 0 && ! "$1" =~ ^- ]]; do
                BAN_OPS+=("$1")
                shift
            done
            ;;
        -*)
            echo "未知选项: $1"
            exit 1
            ;;
        *)
            if [ $POS -eq 0 ]; then
                PROGRAM="$1"
            elif [ $POS -eq 1 ]; then
                BEST_K="$1"
            fi
            POS=$((POS + 1))
            shift
            ;;
    esac
done

# 与 run_multi_scale_variants.sh 对齐：有 scale 时输出到 <prog>_scale_<scale>/，否则到默认目录
EXTRA_ARGS=""
if [ -n "$SCALE" ]; then
    EXTRA_ARGS="--node-cost-scale $SCALE --output $OUTPUT_BASE/${PROGRAM}_scale_${SCALE}"
fi
if [ ${#BAN_OPS[@]} -gt 0 ]; then
    EXTRA_ARGS="$EXTRA_ARGS --ban-ops ${BAN_OPS[*]}"
fi

if [ -z "$PROGRAM" ]; then
    echo "未指定程序名，运行所有程序..."
    for dir in "$FRONTEND_DIR"/*/; do
        PROG=$(basename "$dir")
        echo "========================================"
        echo "运行 ILP 提取器: $PROG (best_k=$BEST_K${SCALE:+, scale=$SCALE}${BAN_OPS:+, ban-ops=${BAN_OPS[*]}})"
        PROG_EXTRA_ARGS=""
        if [ -n "$SCALE" ]; then
            PROG_EXTRA_ARGS="--node-cost-scale $SCALE --output $OUTPUT_BASE/${PROG}_scale_${SCALE}"
        fi
        if [ ${#BAN_OPS[@]} -gt 0 ]; then
            PROG_EXTRA_ARGS="$PROG_EXTRA_ARGS --ban-ops ${BAN_OPS[*]}"
        fi
        python3 "$SCRIPT_DIR/src/ILP/ilp_solver.py" "$PROG" --best_k "$BEST_K" $PROG_EXTRA_ARGS
    done
    exit 0
fi

# # 第一步: 生成 merged.json
# echo "步骤 1: 生成 merged.json..."
# python3 "$SCRIPT_DIR/src/egraph.py" "$PROGRAM"
# if [ $? -ne 0 ]; then
#     echo "错误: 生成 merged.json 失败"
#     exit 1
# fi

echo "运行 ILP 提取器: $PROGRAM (best_k=$BEST_K${SCALE:+, scale=$SCALE}${BAN_OPS:+, ban-ops=${BAN_OPS[*]}})"
echo "  输出目录: ${SCALE:+$OUTPUT_BASE/${PROGRAM}_scale_${SCALE}}${SCALE:-$OUTPUT_BASE/$PROGRAM}"
python3 "$SCRIPT_DIR/src/ILP/ilp_solver.py" "$PROGRAM" --best_k "$BEST_K" $EXTRA_ARGS
