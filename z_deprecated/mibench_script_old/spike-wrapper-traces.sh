#!/usr/bin/env bash
set -x
# 使用完整的rv32im_zicsr_zifencei ISA以支持pk
PK_PATH="${RISCV:-/home/yjrcs/riscv}/riscv32-unknown-elf/bin/pk"
if command -v pk >/dev/null 2>&1; then
    PK_PATH="$(command -v pk)"
fi
# 提取可执行文件的基本名称（去掉路径前缀如./）
BINARY=$(basename "$1")
TRACE_FILE="$BENCH_DIR/${BINARY}.trace"
spike --isa=rv32im_zicsr_zifencei -l --log="$TRACE_FILE" "$PK_PATH" "$1" "${@:2}"
#spike --isa=rv32im_zicsr_zifencei --log --log-commits "$PK_PATH"  "$1" "${@:2}" 2> "$TRACE_FILE"