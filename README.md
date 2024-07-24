# Simple Encryption Tool

## Table of Contents
- [Description](#description)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [File Structure](#file-structure)
- [Development](#development)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

## Description
This project implements a simple encryption tool in x86 assembly language using XOR encryption. It provides a command-line interface for users to input text, which is then encrypted using a basic XOR algorithm.

## Features
- Command-line interface for text input
- XOR-based encryption
- Simple and efficient assembly code

## Installation
### Prerequisites
- NASM (Netwide Assembler)
- GCC (GNU Compiler Collection) for linking
- Git for version control

### Setup
1. **Clone the Repository**:
   ```sh
   git clone https://github.com/yourusername/yourrepository.git
   cd yourrepository
   ```

2. **Install NASM**:
   - **Ubuntu/Debian**:
     ```sh
     sudo apt-get install nasm
     ```
   - **macOS**:
     ```sh
     brew install nasm
     ```

3. **Install GCC**:
   - **Ubuntu/Debian**:
     ```sh
     sudo apt-get install build-essential
     ```
   - **macOS**:
     ```sh
     xcode-select --install
     ```

## Usage
### Building the Project
Compile the project using the provided Makefile:
```sh
make
```

### Running the Tool
Run the tool:
```sh
./encryption_tool
```

Enter the text to be encrypted and press Enter. The encrypted text will be displayed.

## File Structure
```
encryption_tool/
├── README.md
├── LICENSE
├── Makefile
├── src/
│   ├── main.asm
│   ├── encryption.asm
│   └── utils.asm
├── docs/
│   └── design.md
└── tests/
    ├── test_cases.asm
    └── test_runner.sh
```

- **src/**: Contains the assembly source files.
  - `main.asm`: Main program that handles user input and output.
  - `encryption.asm`: Contains the encryption function.
  - `utils.asm`: Utility functions (if any).

- **docs/**: Documentation files.
  - `design.md`: Detailed design documentation.

- **tests/**: Test cases and test runner script.
  - `test_cases.asm`: Assembly code for test cases.
  - `test_runner.sh`: Script to compile and run tests.

## Development
### Adding New Features
1. **Create a new branch**:
   ```sh
   git checkout -b feature-name
   ```

2. **Make your changes**.

3. **Commit your changes**:
   ```sh
   git add .
   git commit -m "Add feature description"
   ```

4. **Push to your branch**:
   ```sh
   git push origin feature-name
   ```

5. **Create a Pull Request** on GitHub.

### Code Guidelines
- Follow the existing coding style.
- Write clear and concise comments.
- Ensure code is secure and handles errors properly.

## Testing
### Writing Tests
Add test cases in `tests/test_cases.asm` and include them in the test runner script.

### Running Tests
Run the test runner script:
```sh
./tests/test_runner.sh
```

Check the output to see if tests passed or failed.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any enhancements, bug fixes, or documentation updates.

### Issues
- Describe the issue clearly.
- Provide steps to reproduce the issue.

### Pull Requests
- Fork the repository.
- Create a new branch for your feature or bug fix.
- Make your changes and commit them.
- Submit a pull request with a detailed description of your changes.

