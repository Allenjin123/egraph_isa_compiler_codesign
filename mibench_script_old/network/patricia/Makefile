SOURCES = patricia.c patricia_test.c

# Allow external override from run-all.sh
OPTFLAGS ?= -O3
BIN_SUFFIX ?=

ASMFLAGS = -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm

.PHONY: all clean

all: patricia$(BIN_SUFFIX)

patricia$(BIN_SUFFIX): $(SOURCES) patricia.h Makefile
	$(CC) -static $(OPTFLAGS) $(SOURCES) -o patricia$(BIN_SUFFIX)
	$(CC) $(ASMFLAGS) patricia_test.c -o patricia$(BIN_SUFFIX).s

clean:
	rm -rf patricia patricia$(BIN_SUFFIX) output* *.bc *.mir *.o *.s
