#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
export BENCH_DIR="../../../benchmark/automotive/basicmath"
BIN_SUFFIX="${BIN_SUFFIX}"
mkdir -p "$BENCH_DIR"
if [ -f ./basicmath_large$BIN_SUFFIX ]; then
cp -f ./basicmath_large$BIN_SUFFIX "$BENCH_DIR/"
if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
"$RISCV/bin/riscv32-unknown-elf-objdump" -d -M no-aliases ./basicmath_large$BIN_SUFFIX > "$BENCH_DIR/basicmath_large$BIN_SUFFIX.dump"
fi
fi
if [ -f ./basicmath_large$BIN_SUFFIX.s ]; then
cp -f ./basicmath_large$BIN_SUFFIX.s "$BENCH_DIR/"
cp -f ./rad2deg$BIN_SUFFIX.s "$BENCH_DIR/"
cp -f ./cubic$BIN_SUFFIX.s "$BENCH_DIR/"
cp -f ./isqrt$BIN_SUFFIX.s "$BENCH_DIR/"
fi
$MIBENCH_RUN ./basicmath_large$BIN_SUFFIX > output_large.txt