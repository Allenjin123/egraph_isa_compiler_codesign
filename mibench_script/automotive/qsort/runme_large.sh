#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
BENCH_DIR="../../../benchmark/automotive/qsort"
mkdir -p "$BENCH_DIR"
if [ -f ./qsort_large ]; then
cp -f ./qsort_large "$BENCH_DIR/"
if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
"$RISCV/bin/riscv32-unknown-elf-objdump" -d ./qsort_large > "$BENCH_DIR/qsort_large.dump"
fi
fi
$MIBENCH_RUN ./qsort_large input_large.dat > output_large.txt
