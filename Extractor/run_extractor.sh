#!/bin/bash
# ILP 提取器 - 使用方法: ./run_extractor.sh <program_name> [best_k]
# 示例: ./run_extractor.sh dijkstra_small_O3
#       ./run_extractor.sh dijkstra_small_O3 5
module load gurobi
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

FRONTEND_DIR="$SCRIPT_DIR/../output/frontend"
BEST_K="${2:-1}"  # 默认 best_k=1

if [ $# -eq 0 ]; then
    echo "未指定程序名，运行所有程序..."
    for dir in "$FRONTEND_DIR"/*/; do
        PROGRAM=$(basename "$dir")
        echo "========================================"
        echo "运行 ILP 提取器: $PROGRAM (best_k=$BEST_K)"
        python3 "$SCRIPT_DIR/src/ILP/ilp_solver.py" "$PROGRAM" --best_k "$BEST_K"
    done
    exit 0
fi

PROGRAM="$1"

# # 第一步: 生成 merged.json
# echo "步骤 1: 生成 merged.json..."
# python3 "$SCRIPT_DIR/src/egraph.py" "$PROGRAM"
# if [ $? -ne 0 ]; then
#     echo "错误: 生成 merged.json 失败"
#     exit 1
# fi

echo "运行 ILP 提取器: $PROGRAM (best_k=$BEST_K)"
python3 "$SCRIPT_DIR/src/ILP/ilp_solver.py" "$PROGRAM" --best_k "$BEST_K"
