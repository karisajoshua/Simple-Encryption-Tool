# Makefile for the Simple Encryption Tool

# Define the assembler and linker
NASM = nasm
LD = ld

# Define the source files
SRC = src/main.asm src/encryption.asm src/utils.asm

# Define the object files
OBJ = main.o encryption.o utils.o

# Define the output executable
OUTPUT = encryption_tool

# Default target
all: $(OUTPUT)

# Build the executable
$(OUTPUT): $(OBJ)
	$(LD) -s -o $(OUTPUT) $(OBJ)

# Compile main.asm
main.o: src/main.asm
	$(NASM) -f elf64 src/main.asm -o main.o

# Compile encryption.asm
encryption.o: src/encryption.asm
	$(NASM) -f elf64 src/encryption.asm -o encryption.o

# Compile utils.asm
utils.o: src/utils.asm
	$(NASM) -f elf64 src/utils.asm -o utils.o

# Clean the build
clean:
	rm -f *.o $(OUTPUT)

# Phony targets
.PHONY: all clean
