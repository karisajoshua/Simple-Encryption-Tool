# Simple Encryption Tool Design Document

## Table of Contents
- [Introduction](#introduction)
- [Project Overview](#project-overview)
- [System Architecture](#system-architecture)
- [Functional Requirements](#functional-requirements)
- [Non-functional Requirements](#non-functional-requirements)
- [Detailed Design](#detailed-design)
  - [Main Program (`main.asm`)](#main-program-mainasm)
  - [Encryption Function (`encryption.asm`)](#encryption-function-encryptionasm)
  - [Utility Functions (`utils.asm`)](#utility-functions-utilsasm)
- [Error Handling](#error-handling)
- [Security Considerations](#security-considerations)
- [Testing Strategy](#testing-strategy)

## Introduction
This document provides a detailed design for the Simple Encryption Tool project. The project is implemented in x86 assembly language and aims to provide a basic command-line encryption tool using XOR encryption.

## Project Overview
The Simple Encryption Tool allows users to input text, which is then encrypted using a simple XOR cipher. The tool is designed to be straightforward and efficient, providing an opportunity to explore low-level programming and security concepts in assembly language.

## System Architecture
The system consists of three main components:
1. **Main Program (`main.asm`)**: Handles user input/output and orchestrates the encryption process.
2. **Encryption Function (`encryption.asm`)**: Performs the XOR encryption on the input text.
3. **Utility Functions (`utils.asm`)**: Provides helper functions for string operations, such as printing and reading strings.

## Functional Requirements
1. The tool should prompt the user to enter text.
2. The tool should read the user's input.
3. The tool should encrypt the input text using XOR encryption.
4. The tool should display the encrypted text.

## Non-functional Requirements
1. The tool should handle input up to 128 characters.
2. The tool should provide clear and concise output.
3. The tool should be efficient and responsive.

## Detailed Design

### Main Program (`main.asm`)
The main program is responsible for the following tasks:
- Displaying prompts to the user.
- Reading user input.
- Calling the encryption function.
- Displaying the encrypted text.

#### Key Steps
1. **Display Prompt**: Uses the `print_string` utility function to display a message prompting the user to enter text.
2. **Read Input**: Uses the `read_string` utility function to read the user's input and store it in a buffer.
3. **Encrypt Input**: Calls the `encrypt` function, passing the input buffer and its length.
4. **Display Encrypted Text**: Uses the `print_string` utility function to display the encrypted text.

### Encryption Function (`encryption.asm`)
The encryption function performs XOR encryption on the input text.

#### Key Steps
1. **Initialize Counter**: Sets up a counter to iterate through each byte of the input text.
2. **XOR Operation**: XORs each byte with a predefined key (0xAA in this case).
3. **Loop Through Input**: Repeats the XOR operation for each byte of the input text.

### Utility Functions (`utils.asm`)
The utility functions provide helper methods for common operations such as printing and reading strings.

#### Key Functions
1. **print_string**: Prints a null-terminated string to stdout.
2. **read_string**: Reads a string from stdin into a buffer.

## Error Handling
Error handling is minimal in this project due to its simplicity. However, some considerations include:
- Ensuring input does not exceed the buffer size (128 characters).
- Handling invalid or unexpected input gracefully.

## Security Considerations
- **Buffer Overflow**: Ensure that input is properly bounded to avoid buffer overflow vulnerabilities.
- **Sensitive Data**: Handle and encrypt sensitive data securely to prevent unauthorized access.

## Testing Strategy
The testing strategy involves the following steps:
1. **Unit Testing**: Write test cases for individual functions such as `encrypt`, `print_string`, and `read_string`.
2. **Integration Testing**: Test the complete workflow from input to encryption to output.
3. **Edge Cases**: Test edge cases such as maximum input size, empty input, and special characters.

### Example Test Cases
1. **Basic Functionality**: Ensure that typical input is encrypted correctly.
2. **Maximum Input Size**: Test the tool with input that is exactly 128 characters long.
3. **Empty Input**: Ensure the tool handles empty input gracefully.
4. **Special Characters**: Test input containing special characters and verify the output.

By following this design, the Simple Encryption Tool project can be implemented effectively, providing a robust and educational example of assembly language programming and basic encryption techniques.
