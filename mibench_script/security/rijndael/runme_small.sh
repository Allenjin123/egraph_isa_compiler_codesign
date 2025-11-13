#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
export BENCH_DIR="../../../benchmark/security/rijndael"
BIN_SUFFIX="${BIN_SUFFIX}"
mkdir -p "$BENCH_DIR"

BIN="./rijndael$BIN_SUFFIX"
ASM="./rijndael$BIN_SUFFIX.s"
INPUT="input_small.asc"
OUT_DEC="output_small.dec"

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

: > "$OUT_DEC"

if ! $MIBENCH_RUN "$BIN" > "$OUT_DEC"; then
    echo "program execution failed: $BIN" >&2
    exit 1
fi
