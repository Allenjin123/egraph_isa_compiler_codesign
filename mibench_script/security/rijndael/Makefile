OPTFLAGS ?= -Oz
BIN_SUFFIX ?=
NO_BUILTIN_FLAGS := -fno-builtin -fno-builtin-memcpy -fno-builtin-memset -fno-builtin-strlen

ASMFLAGS = -S $(OPTFLAGS) $(NO_BUILTIN_FLAGS) -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm -mno-relax

SOURCES = aesxam.c
TARGET = rijndael$(BIN_SUFFIX)
ASM_OUT = $(TARGET).s

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SOURCES) Makefile
	$(CC) -static $(OPTFLAGS) $(NO_BUILTIN_FLAGS) $(SOURCES) -o $@
	$(CC) $(ASMFLAGS) aesxam.c -o $(ASM_OUT)

clean:
	rm -rf $(TARGET) $(ASM_OUT) rijndael rijndael_* output* *.o
