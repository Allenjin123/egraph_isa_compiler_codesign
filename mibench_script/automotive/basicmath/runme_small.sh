#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
BENCH_DIR="../../../benchmark/automotive/basicmath"
BIN_SUFFIX="${BIN_SUFFIX}"
mkdir -p "$BENCH_DIR"
if [ -f ./basicmath_small$BIN_SUFFIX ]; then
cp -f ./basicmath_small$BIN_SUFFIX "$BENCH_DIR/"
if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
"$RISCV/bin/riscv32-unknown-elf-objdump" -d ./basicmath_small$BIN_SUFFIX > "$BENCH_DIR/basicmath_small$BIN_SUFFIX.dump"
fi
fi
$MIBENCH_RUN ./basicmath_small$BIN_SUFFIX > output_small.txt