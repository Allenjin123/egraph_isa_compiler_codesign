#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
export BENCH_DIR="../../../benchmark/automotive/susan"
BIN_SUFFIX="${BIN_SUFFIX}"
mkdir -p "$BENCH_DIR"
if [ -f ./susan$BIN_SUFFIX ]; then
cp -f ./susan$BIN_SUFFIX "$BENCH_DIR/susan_large$BIN_SUFFIX"
if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
"$RISCV/bin/riscv32-unknown-elf-objdump" -d -M no-aliases ./susan$BIN_SUFFIX > "$BENCH_DIR/susan_large$BIN_SUFFIX.dump"
fi
fi
if [ -f ./susan$BIN_SUFFIX.s ]; then
cp -f ./susan$BIN_SUFFIX.s "$BENCH_DIR/susan_large$BIN_SUFFIX.s"
fi
$MIBENCH_RUN ./susan$BIN_SUFFIX input_large.pgm - -s > output_large.smoothing.pgm
$MIBENCH_RUN ./susan$BIN_SUFFIX input_large.pgm - -e > output_large.edges.pgm
$MIBENCH_RUN ./susan$BIN_SUFFIX input_large.pgm - -c > output_large.corners.pgm
