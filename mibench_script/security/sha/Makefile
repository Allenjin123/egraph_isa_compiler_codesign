OPTFLAGS ?= -O3
BIN_SUFFIX ?=
NO_BUILTIN_FLAGS := -fno-builtin -fno-builtin-memcpy -fno-builtin-memset 

ASMFLAGS = -S $(OPTFLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm -mno-relax
SHA_DEFS = -DUSE_MODIFIED_SHA -DLITTLE_ENDIAN
SOURCES = sha_driver.c
TARGET = sha$(BIN_SUFFIX)
ASM_OUT = $(TARGET).s

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SOURCES) Makefile
	$(CC) -static $(OPTFLAGS) $(NO_BUILTIN_FLAGS) $(SHA_DEFS) $(SOURCES) -o $@
	$(CC) $(ASMFLAGS) $(NO_BUILTIN_FLAGS) $(SHA_DEFS) sha_driver.c -o $(ASM_OUT)

clean:
	rm -rf $(TARGET) $(ASM_OUT) *.o sha output*
