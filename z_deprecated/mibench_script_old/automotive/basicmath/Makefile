FILE1 = basicmath_small.c   rad2deg.c  cubic.c   isqrt.c
FILE2 = basicmath_large.c   rad2deg.c  cubic.c   isqrt.c

# Allow external override from run-all.sh
OPTFLAGS ?= -O3
BIN_SUFFIX ?=

all: basicmath_small basicmath_large

basicmath_small: ${FILE1} Makefile
	$(CC) -static $(OPTFLAGS) ${FILE1} -o basicmath_small$(BIN_SUFFIX) -lm
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm basicmath_small.c -o basicmath_small$(BIN_SUFFIX).s
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm rad2deg.c -o rad2deg$(BIN_SUFFIX).s
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm cubic.c -o cubic$(BIN_SUFFIX).s
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm isqrt.c -o isqrt$(BIN_SUFFIX).s
basicmath_large: ${FILE2} Makefile
	$(CC) -static $(OPTFLAGS) ${FILE2} -o basicmath_large$(BIN_SUFFIX) -lm
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm basicmath_large.c -o basicmath_large$(BIN_SUFFIX).s
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm rad2deg.c -o rad2deg$(BIN_SUFFIX).s
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm cubic.c -o cubic$(BIN_SUFFIX).s
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm isqrt.c -o isqrt$(BIN_SUFFIX).s
clean:
	rm -rf basicmath_small_* basicmath_large_* output* *.bc *.mir *.o *.s
