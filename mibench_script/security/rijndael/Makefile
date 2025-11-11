OPTFLAGS ?= -O3
BIN_SUFFIX ?=

rijndael: aes.c aes.h aestab.h aesxam.c Makefile
	xxd -i input_small.asc > input_small.h
	xxd -i input_large.asc > input_large.h
	xxd -i output_small.enc > enc_small.h
	${CC} -static -O3 -o rijndael$(BIN_SUFFIX) aes.c aesxam.c -Wstringop-overflow=0
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm aes.c -o rijndael$(BIN_SUFFIX).s

clean:
	rm -rf rijndael rijndael$(BIN_SUFFIX) *.s *.bc *.mir *.o