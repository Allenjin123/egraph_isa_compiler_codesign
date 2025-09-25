#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
BENCH_DIR="../../../benchmark/automotive/qsort"
mkdir -p "$BENCH_DIR"
if [ -f ./qsort_small ]; then
cp -f ./qsort_small "$BENCH_DIR/"
if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
"$RISCV/bin/riscv32-unknown-elf-objdump" -d ./qsort_small > "$BENCH_DIR/qsort_small.dump"
fi
fi
$MIBENCH_RUN ./qsort_small input_small.dat > output_small.txt
