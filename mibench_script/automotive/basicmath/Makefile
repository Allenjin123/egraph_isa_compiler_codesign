FILE1 = basicmath_small.c

# Allow external override from run-all.sh
OPTFLAGS ?= -O3
BIN_SUFFIX ?=

all: basicmath_small

basicmath_small: ${FILE1} Makefile
	$(CC) -static $(OPTFLAGS) ${FILE1} -o basicmath_small$(BIN_SUFFIX) -lm
	$(CC) riscv32-unknown-elf-gcc -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm -mno-relax basicmath_small.c -o basicmath_small$(BIN_SUFFIX).s
clean:
	rm -rf basicmath_small$(BIN_SUFFIX) basicmath_small_* output* *.bc *.mir *.o *.s
