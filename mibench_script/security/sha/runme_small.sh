#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
export BENCH_DIR="../../../benchmark/security/sha"
BIN_SUFFIX="${BIN_SUFFIX}"
mkdir -p "$BENCH_DIR"

BIN="./sha$BIN_SUFFIX"
ASM="./sha$BIN_SUFFIX.s"
INPUT="input_small.asc"
OUT="output_small.txt"

if [ ! -x "$BIN" ]; then
    echo "missing binary: $BIN" >&2
    exit 1
fi

cp -f "$BIN" "$BENCH_DIR/"

if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
    "$RISCV/bin/riscv32-unknown-elf-objdump" -d -M no-aliases "$BIN" > "$BENCH_DIR/$(basename "$BIN").dump"
fi

if [ -f "$ASM" ]; then
    cp -f "$ASM" "$BENCH_DIR/"
fi

$MIBENCH_RUN "$BIN" "$INPUT" > "$OUT"
