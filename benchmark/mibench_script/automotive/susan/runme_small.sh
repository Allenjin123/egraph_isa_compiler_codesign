#!/bin/sh
# Write the output to the standard output, and let the host create the file by redirecting
$RISCV/bin/true >/dev/null 2>&1 || true
BENCH_DIR="../../../benchmark/automotive/susan"
BIN_SUFFIX="${BIN_SUFFIX}"
mkdir -p "$BENCH_DIR"
if [ -f ./susan$BIN_SUFFIX ]; then
cp -f ./susan$BIN_SUFFIX "$BENCH_DIR/susan_small$BIN_SUFFIX"
if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
"$RISCV/bin/riscv32-unknown-elf-objdump" -d -M no-aliases ./susan$BIN_SUFFIX > "$BENCH_DIR/susan_small$BIN_SUFFIX.dump"
fi
fi
$MIBENCH_RUN ./susan$BIN_SUFFIX input_small.pgm - -s > output_small.smoothing.pgm
$MIBENCH_RUN ./susan$BIN_SUFFIX input_small.pgm - -e > output_small.edges.pgm
$MIBENCH_RUN ./susan$BIN_SUFFIX input_small.pgm - -c > output_small.corners.pgm

