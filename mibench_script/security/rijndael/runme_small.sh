#!/bin/sh
# ./rijndael input_small.asc output_small.enc e 1234567890abcdeffedcba09876543211234567890abcdeffedcba0987654321
# ./rijndael output_small.enc output_small.dec d 1234567890abcdeffedcba09876543211234567890abcdeffedcba0987654321


#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
export BENCH_DIR="../../../benchmark/security/rijndael"
BIN_SUFFIX="${BIN_SUFFIX}"
mkdir -p "$BENCH_DIR"
if [ -f ./rijndael$BIN_SUFFIX ]; then
cp -f ./rijndael$BIN_SUFFIX "$BENCH_DIR/"
if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
"$RISCV/bin/riscv32-unknown-elf-objdump" -d -M no-aliases ./rijndael$BIN_SUFFIX > "$BENCH_DIR/rijndael$BIN_SUFFIX.dump"
fi
fi
if [ -f ./rijndael$BIN_SUFFIX.s ]; then
cp -f ./rijndael$BIN_SUFFIX.s "$BENCH_DIR/"
fi
$MIBENCH_RUN ./rijndael$BIN_SUFFIX S e 1234567890abcdeffedcba09876543211234567890abcdeffedcba0987654321 > run_output_small.enc
$MIBENCH_RUN ./rijndael$BIN_SUFFIX S d 1234567890abcdeffedcba09876543211234567890abcdeffedcba0987654321 > run_output_small.dec
diff run_output_small.enc output_small.enc
diff run_output_small.dec input_small.asc