#!/bin/sh
$RISCV/bin/true >/dev/null 2>&1 || true
export BENCH_DIR="../../../benchmark/network/dijkstra"
BIN_SUFFIX="${BIN_SUFFIX}"
mkdir -p "$BENCH_DIR"

BIN_PATH="./dijkstra_small$BIN_SUFFIX"

if [ ! -x "$BIN_PATH" ]; then
    echo "[ERROR] 未找到可执行文件 $BIN_PATH ，请先运行 make。" >&2
    exit 1
fi

cp -f "$BIN_PATH" "$BENCH_DIR/"
if [ -x "$RISCV/bin/riscv32-unknown-elf-objdump" ]; then
    "$RISCV/bin/riscv32-unknown-elf-objdump" -d -M no-aliases "$BIN_PATH" > "$BENCH_DIR/dijkstra_small$BIN_SUFFIX.dump"
fi

if [ -f "$BIN_PATH.s" ]; then
    cp -f "$BIN_PATH.s" "$BENCH_DIR/"
fi

$MIBENCH_RUN "$BIN_PATH" input.dat > output_small.txt
