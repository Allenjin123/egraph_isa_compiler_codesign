susan: susan.c Makefile
	$(CC) -static $(OPTFLAGS) -DFOPENB -std=gnu89 -Wno-implicit-int -Wno-implicit-function-declaration -Wno-old-style-definition -o susan$(BIN_SUFFIX) susan.c -lm
	$(CC) -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm -DFOPENB -std=gnu89 susan.c -o susan$(BIN_SUFFIX).s 

clean:
	rm -rf susan susan$(BIN_SUFFIX) output* *.s
