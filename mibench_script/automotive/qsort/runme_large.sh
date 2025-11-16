#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
export BENCH_DIR="../../../benchmark/automotive/qsort_large"
BIN_SUFFIX="${BIN_SUFFIX}"
mkdir -p "$BENCH_DIR"
if [ -f ./qsort_large$BIN_SUFFIX ]; then
cp -f ./qsort_large$BIN_SUFFIX "$BENCH_DIR/"
if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
"$RISCV/bin/riscv32-unknown-elf-objdump" -d -M no-aliases ./qsort_large$BIN_SUFFIX > "$BENCH_DIR/qsort_large$BIN_SUFFIX.dump"
fi
fi
if [ -f ./qsort_large$BIN_SUFFIX.s ]; then
cp -f ./qsort_large$BIN_SUFFIX.s "$BENCH_DIR/"
fi
$MIBENCH_RUN ./qsort_large$BIN_SUFFIX > output_large.txt