#!/bin/bash
# 重构和重建汇编 - 使用方法: ./run_reconstruct.sh <program_name>
# 示例: ./run_reconstruct.sh dijkstra_small_O3

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $# -eq 0 ]; then
    echo "用法: $0 <program_name>"
    echo "示例: $0 dijkstra_small_O3"
    exit 1
fi

PROGRAM="$1"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# 查找对应的 _clean.s 文件
CLEAN_FILE=$(find "$PROJECT_ROOT/benchmark" -name "${PROGRAM}_clean.s" -type f | head -1)

if [ -z "$CLEAN_FILE" ]; then
    echo "错误: 找不到 ${PROGRAM}_clean.s 文件"
    exit 1
fi

echo "步骤 1/2: 从 ILP 解生成重写后的基本块..."
python3 "$SCRIPT_DIR/restructure.py" "$PROGRAM" || exit 1

echo ""
echo "步骤 2/2: 重建完整汇编文件..."
python3 "$SCRIPT_DIR/reconstruct_rewritten_asm.py" "$CLEAN_FILE" -o "$PROJECT_ROOT/output/frontend" || exit 1

echo ""
echo "✓ 完成！查看 benchmark/ 目录下的 *_rewrite.s 文件"

