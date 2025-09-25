susan: susan.c Makefile
	$(CC) -static $(OPTFLAGS) -DFOPENB -std=gnu89 -Wno-implicit-int -Wno-implicit-function-declaration -Wno-old-style-definition -o susan$(BIN_SUFFIX) susan.c -lm 

clean:
	rm -rf susan susan$(BIN_SUFFIX) output*
