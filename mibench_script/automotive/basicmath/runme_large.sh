#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
BENCH_DIR="../../../benchmark/automotive/basicmath"
mkdir -p "$BENCH_DIR"
if [ -f ./basicmath_large ]; then
cp -f ./basicmath_large "$BENCH_DIR/"
if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
"$RISCV/bin/riscv32-unknown-elf-objdump" -d ./basicmath_large > "$BENCH_DIR/basicmath_large.dump"
fi
fi
$MIBENCH_RUN ./basicmath_large > output_large.txt