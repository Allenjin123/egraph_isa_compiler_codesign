#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
export BENCH_DIR="../../../benchmark/network/patricia"
BIN_SUFFIX="${BIN_SUFFIX}"
mkdir -p "$BENCH_DIR"

if [ -f "./patricia$BIN_SUFFIX" ]; then
    cp -f "./patricia$BIN_SUFFIX" "$BENCH_DIR/"
    if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
        "$RISCV/bin/riscv32-unknown-elf-objdump" -d -M no-aliases "./patricia$BIN_SUFFIX" > "$BENCH_DIR/patricia$BIN_SUFFIX.dump"
    fi
fi

if [ -f "./patricia$BIN_SUFFIX.s" ]; then
    cp -f "./patricia$BIN_SUFFIX.s" "$BENCH_DIR/"
fi

$MIBENCH_RUN ./patricia$BIN_SUFFIX large.udp > output_large.txt
