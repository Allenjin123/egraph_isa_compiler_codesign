#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
BENCH_DIR="../../../benchmark/automotive/susan"
mkdir -p "$BENCH_DIR"
if [ -f ./susan ]; then
cp -f ./susan "$BENCH_DIR/"
if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
"$RISCV/bin/riscv32-unknown-elf-objdump" -d ./susan > "$BENCH_DIR/susan.dump"
fi
fi
$MIBENCH_RUN ./susan input_large.pgm - -s > output_large.smoothing.pgm
$MIBENCH_RUN ./susan input_large.pgm - -e > output_large.edges.pgm
$MIBENCH_RUN ./susan input_large.pgm - -c > output_large.corners.pgm

