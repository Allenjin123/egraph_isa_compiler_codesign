#!/bin/bash
# ILP 提取器 - 使用方法: ./run_extractor.sh <program_name> [best_k]
# 示例: ./run_extractor.sh dijkstra_small_O3
#       ./run_extractor.sh dijkstra_small_O3 5

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $# -eq 0 ]; then
    echo "用法: $0 <program_name> [best_k]"
    echo "示例: $0 dijkstra_small_O3"
    echo "      $0 dijkstra_small_O3 5"
    exit 1
fi

PROGRAM="$1"
BEST_K="${2:-1}"  # 默认 best_k=1

echo "运行 ILP 提取器: $PROGRAM (best_k=$BEST_K)"
python3 "$SCRIPT_DIR/src/ILP/ilp_solver.py" "$PROGRAM" --best_k "$BEST_K" --timeout 180

