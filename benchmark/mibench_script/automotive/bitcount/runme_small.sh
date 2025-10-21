#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
BENCH_DIR="../../../benchmark/automotive/bitcount"
BIN_SUFFIX="${BIN_SUFFIX}"
mkdir -p "$BENCH_DIR"
if [ -f ./bitcnts$BIN_SUFFIX ]; then
cp -f ./bitcnts$BIN_SUFFIX "$BENCH_DIR/bitcnts_small$BIN_SUFFIX"
if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
"$RISCV/bin/riscv32-unknown-elf-objdump" -d -M no-aliases ./bitcnts$BIN_SUFFIX > "$BENCH_DIR/bitcnts_small$BIN_SUFFIX.dump"
fi
fi
$MIBENCH_RUN ./bitcnts$BIN_SUFFIX 75000 > output_small.txt