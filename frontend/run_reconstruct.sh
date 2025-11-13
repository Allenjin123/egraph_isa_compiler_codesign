#!/bin/bash
# 重构和重建汇编 - 使用方法: ./run_reconstruct.sh <program_name> [num_variants]
# 示例: ./run_reconstruct.sh dijkstra_small_O3
#       ./run_reconstruct.sh dijkstra_small_O3 5

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $# -eq 0 ]; then
    echo "用法: $0 <program_name> [num_variants]"
    echo "示例: $0 dijkstra_small_O3      # 默认5个变体"
    echo "      $0 dijkstra_small_O3 3    # 3个变体"
    exit 1
fi

PROGRAM="$1"
NUM_VARIANTS="${2:-5}"  # 默认5个变体
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# 查找对应的 _clean.s 文件
CLEAN_FILE=$(find "$PROJECT_ROOT/benchmark" -name "${PROGRAM}_clean.s" -type f | head -1)

if [ -z "$CLEAN_FILE" ]; then
    echo "错误: 找不到 ${PROGRAM}_clean.s 文件"
    exit 1
fi

echo "========================================"
echo "程序: $PROGRAM"
echo "变体数量: $NUM_VARIANTS"
echo "========================================"
echo ""

echo "步骤 1/2: 从 ILP 解生成重写后的基本块 ($NUM_VARIANTS 个变体)..."
python3 "$SCRIPT_DIR/restructure.py" "$PROGRAM" --variants "$NUM_VARIANTS" || exit 1

echo ""
echo "步骤 2/2: 重建完整汇编文件..."

# 为每个变体重建汇编文件
REWRITE_BASE="$PROJECT_ROOT/output/frontend/${PROGRAM}/basic_blocks_rewrite"

# 先移动整个 basic_blocks_rewrite 目录（只在第一次）
if [ -d "$REWRITE_BASE" ] && [ ! -L "$REWRITE_BASE" ]; then
    # 保存到临时位置
    mv "$REWRITE_BASE" "${REWRITE_BASE}_orig"
fi

for ((i=0; i<NUM_VARIANTS; i++)); do
    VARIANT_DIR="${REWRITE_BASE}_orig/variant_${i}"

    if [ ! -d "$VARIANT_DIR" ]; then
        echo "警告: 变体目录不存在: $VARIANT_DIR"
        continue
    fi

    echo ""
    echo "处理变体 ${i}..."

    # 创建符号链接到当前变体
    rm -f "$REWRITE_BASE"
    ln -sfn "${REWRITE_BASE}_orig/variant_${i}" "$REWRITE_BASE"

    # 调用重建脚本（不需要额外参数，它会自动找到 basic_blocks_rewrite）
    python3 "$SCRIPT_DIR/reconstruct_rewritten_asm.py" "$CLEAN_FILE" \
        -o "$PROJECT_ROOT/output/frontend" || {
        echo "  错误: 重建变体 ${i} 失败"
        continue
    }

    # 重命名输出文件以包含变体号
    # 查找实际生成的文件（可能在子目录中）
    REWRITE_FILE=$(find "$PROJECT_ROOT/benchmark" -name "${PROGRAM}_rewrite.s" -type f | head -1)
    if [ -n "$REWRITE_FILE" ]; then
        DIR_PATH=$(dirname "$REWRITE_FILE")
        NEW_FILE="${DIR_PATH}/${PROGRAM}_rewrite_variant_${i}.s"
        mv "$REWRITE_FILE" "$NEW_FILE"
        echo "  ✓ 生成: ${NEW_FILE#$PROJECT_ROOT/}"
    fi
done

# 恢复原始目录
if [ -d "${REWRITE_BASE}_orig" ]; then
    # Remove symlink if it exists
    if [ -L "$REWRITE_BASE" ]; then
        rm -f "$REWRITE_BASE"
    fi
    # Restore original directory
    mv "${REWRITE_BASE}_orig" "$REWRITE_BASE"
fi

echo ""
echo "========================================"
echo "✓ 完成！已生成的文件："
find "$PROJECT_ROOT/benchmark" -name "${PROGRAM}_rewrite_variant_*.s" -type f | sort | while read f; do
    echo "  ${f#$PROJECT_ROOT/}"
done
echo "========================================"

