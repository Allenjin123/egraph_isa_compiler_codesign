FILE = bitcnt_1.c bitcnt_2.c bitcnt_3.c bitcnt_4.c bitcnts.c bitfiles.c bitstrng.c bstr_i.c 

OPTFLAGS ?= -O3
BIN_SUFFIX ?=

bitcnts: ${FILE} Makefile
	$(CC) -static ${FILE} $(OPTFLAGS) -o bitcnts$(BIN_SUFFIX)

clean:
	rm -rf bitcnts bitcnts$(BIN_SUFFIX) output*
