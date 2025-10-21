#!/usr/bin/env bash
set -x
# 使用完整的rv32im_zicsr_zifencei ISA以支持pk
PK_PATH="${RISCV:-/home/yjrcs/riscv}/riscv32-unknown-elf/bin/pk"
if command -v pk >/dev/null 2>&1; then
    PK_PATH="$(command -v pk)"
fi
spike --isa=rv32im_zicsr_zifencei --ust-trace "$1/$2.trace" "$PK_PATH" "$2" "${@:3}"
