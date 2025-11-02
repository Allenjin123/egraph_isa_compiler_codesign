FILE = bitcnts.c

OPTFLAGS ?= -O3
BIN_SUFFIX ?=

bitcnts: ${FILE} Makefile
	$(CC) -static ${FILE} $(OPTFLAGS) -o bitcnts$(BIN_SUFFIX)
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm -mno-relax bitcnts.c -o bitcnts$(BIN_SUFFIX).s

clean:
	rm -rf bitcnts bitcnts$(BIN_SUFFIX) output* *.s
