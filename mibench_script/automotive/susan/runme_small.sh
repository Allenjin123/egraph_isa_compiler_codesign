#!/bin/sh  Write the output to the standard output, and let the host create the file by redirecting
$RISCV/bin/true >/dev/null 2>&1 || true
BENCH_DIR="../../../benchmark/automotive/susan"
mkdir -p "$BENCH_DIR"
if [ -f ./susan ]; then
cp -f ./susan "$BENCH_DIR/"
if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
"$RISCV/bin/riscv32-unknown-elf-objdump" -d ./susan > "$BENCH_DIR/susan.dump"
fi
fi
$MIBENCH_RUN ./susan input_small.pgm - -s > output_small.smoothing.pgm
$MIBENCH_RUN ./susan input_small.pgm - -e > output_small.edges.pgm
$MIBENCH_RUN ./susan input_small.pgm - -c > output_small.corners.pgm

