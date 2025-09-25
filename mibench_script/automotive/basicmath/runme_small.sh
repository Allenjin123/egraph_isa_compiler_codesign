#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
BENCH_DIR="../../../benchmark/automotive/basicmath"
mkdir -p "$BENCH_DIR"
if [ -f ./basicmath_small ]; then
cp -f ./basicmath_small "$BENCH_DIR/"
if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
"$RISCV/bin/riscv32-unknown-elf-objdump" -d ./basicmath_small > "$BENCH_DIR/basicmath_small.dump"
fi
fi
$MIBENCH_RUN ./basicmath_small > output_small.txt