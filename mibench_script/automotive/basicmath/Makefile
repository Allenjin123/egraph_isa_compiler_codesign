FILE1 = basicmath_small.c   rad2deg.c  cubic.c   isqrt.c
FILE2 = basicmath_large.c   rad2deg.c  cubic.c   isqrt.c

# Allow external override from run-all.sh
OPTFLAGS ?= -O3
BIN_SUFFIX ?=
# ===== RISC-V 交叉工具链路径（按你的实际目录，可保持不变）=====
RISCV_SYSROOT     ?= $(RISCV)/riscv32-unknown-elf
GCC_TARGET_INCLUDE := $(firstword $(wildcard $(RISCV)/lib/gcc/riscv32-unknown-elf/*/include))

all: basicmath_small basicmath_large

basicmath_small: ${FILE1} Makefile
	$(CC) -static $(OPTFLAGS) ${FILE1} -o basicmath_small$(BIN_SUFFIX) -lm
basicmath_large: ${FILE2} Makefile
	$(CC) -static $(OPTFLAGS) ${FILE2} -o basicmath_large$(BIN_SUFFIX) -lm
# -------------------------------
# Extra: generate LLVM bitcode (.bc)
# -------------------------------
%.bc.o: %.c
	CPATH= C_INCLUDE_PATH= CPLUS_INCLUDE_PATH= OBJC_INCLUDE_PATH= \
	clang -target riscv32-unknown-elf \
	      --gcc-toolchain=$(RISCV_PREFIX) \
	      -isysroot $(RISCV_SYSROOT) \
	      -nostdinc \
	      $(if $(GCC_TARGET_INCLUDE),-isystem $(GCC_TARGET_INCLUDE),) \
	      -isystem $(RISCV_SYSROOT)/include \
	      -O0 -emit-llvm -c $< -o $@

basicmath_small.bc: basicmath_small.bc.o rad2deg.bc.o cubic.bc.o isqrt.bc.o
	llvm-link $^ -o $@

basicmath_large.bc: basicmath_large.bc.o rad2deg.bc.o cubic.bc.o isqrt.bc.o
	llvm-link $^ -o $@
# -------------------------------
# Extra: generate MachineSSA MIR
# -------------------------------
basicmath_small.mir: basicmath_small.bc
	llc -mtriple=riscv32 -stop-after=finalize-isel $< -o $@

basicmath_large.mir: basicmath_large.bc
	llc -mtriple=riscv32 -stop-after=finalize-isel $< -o $@
clean:
	rm -rf basicmath_small_* basicmath_large_* output* *.bc *.mir *.o
