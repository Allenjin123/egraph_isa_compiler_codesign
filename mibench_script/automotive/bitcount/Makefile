FILE = bitcnt_1.c bitcnt_2.c bitcnt_3.c bitcnt_4.c bitcnts.c bitfiles.c bitstrng.c bstr_i.c 

OPTFLAGS ?= -O3
BIN_SUFFIX ?=

bitcnts: ${FILE} Makefile
	$(CC) -static ${FILE} $(OPTFLAGS) -o bitcnts$(BIN_SUFFIX)
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm bitcnt_1.c -o bitcnt_1$(BIN_SUFFIX).s
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm bitcnt_2.c -o bitcnt_2$(BIN_SUFFIX).s
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm bitcnt_3.c -o bitcnt_3$(BIN_SUFFIX).s
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm bitcnt_4.c -o bitcnt_4$(BIN_SUFFIX).s
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm bitcnts.c -o bitcnts$(BIN_SUFFIX).s
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm bitfiles.c -o bitfiles$(BIN_SUFFIX).s
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm bitstrng.c -o bitstrng$(BIN_SUFFIX).s
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm bstr_i.c -o bstr_i$(BIN_SUFFIX).s

clean:
	rm -rf bitcnts bitcnts$(BIN_SUFFIX) output* *.s
