#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
export BENCH_DIR="../../../benchmark/automotive/bitcount"
BIN_SUFFIX="${BIN_SUFFIX}"
mkdir -p "$BENCH_DIR"
if [ -f ./bitcnts$BIN_SUFFIX ]; then
cp -f ./bitcnts$BIN_SUFFIX "$BENCH_DIR/bitcnts_large$BIN_SUFFIX"
if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
"$RISCV/bin/riscv32-unknown-elf-objdump" -d -M no-aliases ./bitcnts$BIN_SUFFIX > "$BENCH_DIR/bitcnts_large$BIN_SUFFIX.dump"
fi
fi
if [ -f ./bitcnts$BIN_SUFFIX.s ]; then
cp -f ./bitcnt_1$BIN_SUFFIX.s "$BENCH_DIR/"
cp -f ./bitcnt_2$BIN_SUFFIX.s "$BENCH_DIR/"
cp -f ./bitcnt_3$BIN_SUFFIX.s "$BENCH_DIR/"
cp -f ./bitcnt_4$BIN_SUFFIX.s "$BENCH_DIR/"
cp -f ./bitcnts$BIN_SUFFIX.s "$BENCH_DIR/"
cp -f ./bitfiles$BIN_SUFFIX.s "$BENCH_DIR/"
cp -f ./bitstrng$BIN_SUFFIX.s "$BENCH_DIR/"
cp -f ./bstr_i$BIN_SUFFIX.s "$BENCH_DIR/"
fi
$MIBENCH_RUN ./bitcnts$BIN_SUFFIX 1125000 > output_large.txt