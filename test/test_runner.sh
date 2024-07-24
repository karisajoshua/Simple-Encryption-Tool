#!/bin/bash

# Compile the test cases
nasm -f elf64 src/encryption.asm -o encryption.o
nasm -f elf64 tests/test_cases.asm -o test_cases.o
ld -s -o test_cases test_cases.o encryption.o

# Run the test cases
echo "Running test cases..."
./test_cases

# Clean up
rm test_cases test_cases.o encryption.o
