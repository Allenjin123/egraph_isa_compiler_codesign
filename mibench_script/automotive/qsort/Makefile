FILE1 = qsort_small.c
FILE2 = qsort_large.c

OPTFLAGS ?= -O3
BIN_SUFFIX ?=
NO_BUILTIN_FLAGS := -fno-builtin -fno-builtin-memcpy
ASMFLAGS = -S $(OPTFLAGS) $(NO_BUILTIN_FLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm -mno-relax
all: qsort_small qsort_large

qsort_small: qsort_small.c Makefile
	$(CC) -static qsort_small.c $(OPTFLAGS) $(NO_BUILTIN_FLAGS) -o qsort_small$(BIN_SUFFIX) -lm
	$(CC) $(ASMFLAGS) qsort_small.c -o qsort_small$(BIN_SUFFIX).s
qsort_large: qsort_large.c Makefile
	$(CC) -static qsort_large.c $(OPTFLAGS) $(NO_BUILTIN_FLAGS) -o qsort_large$(BIN_SUFFIX) -lm
	$(CC) $(ASMFLAGS) qsort_large.c -o qsort_large$(BIN_SUFFIX).s

clean:
	rm -rf qsort_small qsort_large qsort_small$(BIN_SUFFIX) qsort_large$(BIN_SUFFIX) output* *.s
