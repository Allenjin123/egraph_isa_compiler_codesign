FILE1 = basicmath_small.c   rad2deg.c  cubic.c   isqrt.c
FILE2 = basicmath_large.c   rad2deg.c  cubic.c   isqrt.c

# Allow external override from run-all.sh
OPTFLAGS ?= -O3
BIN_SUFFIX ?=

all: basicmath_small basicmath_large

basicmath_small: ${FILE1} Makefile
	$(CC) -static $(OPTFLAGS) ${FILE1} -o basicmath_small$(BIN_SUFFIX) -lm
basicmath_large: ${FILE2} Makefile
	$(CC) -static $(OPTFLAGS) ${FILE2} -o basicmath_large$(BIN_SUFFIX) -lm

clean:
	rm -rf basicmath_small basicmath_large basicmath_small$(BIN_SUFFIX) basicmath_large$(BIN_SUFFIX) output*
