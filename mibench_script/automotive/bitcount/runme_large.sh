#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
BENCH_DIR="../../../benchmark/automotive/bitcount"
mkdir -p "$BENCH_DIR"
if [ -f ./bitcnts ]; then
cp -f ./bitcnts "$BENCH_DIR/"
if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
"$RISCV/bin/riscv32-unknown-elf-objdump" -d ./bitcnts > "$BENCH_DIR/bitcnts.dump"
fi
fi
$MIBENCH_RUN ./bitcnts 1125000 > output_large.txt
