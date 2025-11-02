# Single-file implementation
SOURCE = patricia_test.c

# Allow external override from run-all.sh
OPTFLAGS ?= -O3
BIN_SUFFIX ?=

ASMFLAGS = -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm -mno-relax

.PHONY: all clean

all: patricia$(BIN_SUFFIX)

patricia$(BIN_SUFFIX): $(SOURCE) Makefile
	$(CC) -static $(OPTFLAGS) $(SOURCE) -o patricia$(BIN_SUFFIX)
	$(CC) $(ASMFLAGS) $(SOURCE) -o patricia$(BIN_SUFFIX).s

clean:
	rm -rf patricia patricia$(BIN_SUFFIX) output* *.bc *.mir *.o *.s
