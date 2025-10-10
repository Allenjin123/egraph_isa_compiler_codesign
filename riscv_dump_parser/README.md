# RISC-V Dump Parser

A Rust-based parser for RISC-V disassembly dump files, designed to parse objdump output into structured data for analysis and processing.

## Features

- **Parse RISC-V disassembly files**: Extracts instructions, addresses, machine code, and assembly mnemonics
- **Section support**: Handles multiple sections (e.g., `.text`, `.data`)
- **Label tracking**: Identifies and tracks labels with their addresses
- **Structured output**: Organizes parsed data into clean Rust data structures
- **Comprehensive testing**: Unit tests for all parsing functionality

## Usage

### Basic Usage

```bash
# Build the project
cargo build --release

# Run the parser on a dump file
cargo run <dump_file>
```

### Example

```bash
# Parse a RISC-V objdump file
cargo run sample.dump
```

The parser expects objdump output in the following format:
```
a.out:     file format elf64-littleriscv

Disassembly of section .text:

80000000 <_start>:
80000000:	00000093		li	ra,0
80000004:	00100113		li	sp,1
```

## Project Structure

```
src/
├── lib.rs      # Library root and module declarations
├── main.rs     # CLI interface and main function
├── parser.rs   # Parsing logic for dump files
└── types.rs    # Data structures (Instruction, Section, Program)
```

## Data Structures

- **`Instruction`**: Represents a single assembly instruction with address, machine code, mnemonic, and operands
- **`Section`**: Contains a collection of instructions for a specific section
- **`Program`**: Top-level structure containing all sections, labels, and file format information

## Testing

Run the test suite:

```bash
cargo test
```

## Sample Code
* rv32I support