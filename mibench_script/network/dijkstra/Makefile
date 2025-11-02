OPTFLAGS ?= -O3
BIN_SUFFIX ?=

ASMFLAGS = -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm -mno-relax

.PHONY: all clean

all: dijkstra_small$(BIN_SUFFIX)
	
dijkstra_small$(BIN_SUFFIX): dijkstra_small.c Makefile
	$(CC) -static $(OPTFLAGS) $< -o $@
	$(CC) $(ASMFLAGS) $< -o $@.s

dijkstra_large$(BIN_SUFFIX): dijkstra_large.c Makefile
	$(CC) -static $(OPTFLAGS) $< -o $@
	$(CC) $(ASMFLAGS) $< -o $@.s

clean:
	rm -rf dijkstra_small$(BIN_SUFFIX) dijkstra_large$(BIN_SUFFIX) dijkstra_small_* dijkstra_large_* output* *.bc *.mir *.o *.s
