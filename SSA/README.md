# SSA Processing Pipeline for RISC-V Assembly

This directory contains tools for processing RISC-V assembly dumps into SSA (Static Single Assignment) form, organized as basic blocks for compiler optimization and analysis.

## Overview

The SSA pipeline processes RISC-V assembly dumps through three stages:
1. **Parse sections** - Extract functions from dump files
2. **Split basic blocks** - Divide functions into basic blocks at control flow boundaries
3. **Strip prefixes** - Clean instructions for easier processing

## Files Description

### Core Pipeline Files

#### `process_dump.py`
**Purpose**: Main entry point for processing RISC-V assembly dumps through the complete pipeline.

**Usage**:
```bash
# Process a single dump file
python process_dump.py <dump_file> [options]

# Examples:
python process_dump.py ../benchmark/im_inputs/dhrystone.riscv.dump
python process_dump.py input.dump --output my_output --verbose

# Process all dumps in a directory
python process_dump.py --batch ../benchmark/im_inputs/

# List basic blocks from processed output
python process_dump.py --list outputs/dhrystone.riscv --max-display 20
```

**Options**:
- `-o, --output`: Specify output directory (default: `outputs/<filename>`)
- `-b, --batch`: Process all dump files in a directory
- `-l, --list`: List basic blocks from a processed output
- `-v, --verbose`: Print detailed progress
- `--max-display`: Maximum blocks to display (default: 10)

---

#### `parse_sections.py`
**Purpose**: Extracts individual functions/sections from assembly dump files.

**How it works**:
- Identifies section headers (e.g., `000100b4 <exit>:`)
- Creates a directory for each function
- Saves assembly code to `section.txt` in each directory

**Standalone usage**:
```python
from parse_sections import parse_dump_file, create_folders_and_files

sections = parse_dump_file("input.dump")
create_folders_and_files(sections, "output_dir")
```

---

#### `split_basic_blocks.py`
**Purpose**: Divides functions into basic blocks for control flow analysis.

**How it works**:
- Identifies control flow instructions (branches, jumps, calls)
- Creates new blocks at jump targets and after branches
- Numbers blocks sequentially (0.txt, 1.txt, etc.)

**Standalone usage**:
```python
from split_basic_blocks import BasicBlockSplitter

splitter = BasicBlockSplitter()
splitter.process_section_file("sections/main")
# or process all sections:
splitter.process_all_sections("sections/")
```

---

#### `strip_prefixes.py`
**Purpose**: Cleans assembly instructions by removing addresses and machine code.

**What it removes**:
- Address prefixes (e.g., `100b4:`)
- Machine code hex values
- Comments after `#`
- Symbol annotations in `<>`

**Standalone usage**:
```bash
# Strip prefixes from all basic blocks in-place
python strip_prefixes.py --sections-dir outputs/dhrystone.riscv/sections

# Dry run (preview without modifying)
python strip_prefixes.py --sections-dir outputs/dhrystone.riscv/sections --dry-run
```

---

#### `analyze_blocks.py`
**Purpose**: Analyze and generate statistics about processed basic blocks.

**Usage**:
```bash
# Analyze basic blocks
python analyze_blocks.py outputs/dhrystone.riscv

# Export block list to file
python analyze_blocks.py outputs/dhrystone.riscv --export block_list.txt
```

**Output includes**:
- Block size distribution
- Instruction counts per section
- Largest/smallest blocks
- Detailed statistics

---

#### `util.py`
**Purpose**: Shared utilities and constants for RISC-V instruction processing.

**Contents**:
- `BRANCH_INSTRUCTIONS`: Set of control flow instructions
- `is_branch_mnemonic()`: Check if instruction is a branch
- Common helper functions

---

#### `ssa_builder.py`
**Purpose**: Placeholder for future SSA construction logic (currently empty).

---

#### `convert_to_ssa.py`
**Purpose**: Convert RISC-V basic blocks to SSA (Static Single Assignment) form by versioning registers.

**How it works**:
- Each register assignment gets a unique version number (e.g., `sp_0`, `sp_1`, `sp_2`)
- Version counters are maintained locally for each basic block
- Handles complex cases like self-modifying instructions (e.g., `addi sp, sp, -16` → `addi sp_1, sp_0, -16`)

**Usage**:
```bash
# Convert a single block file
python convert_to_ssa.py outputs/dhrystone.riscv/sections/main/0.txt

# Convert all blocks in a section
python convert_to_ssa.py outputs/dhrystone.riscv/sections/main/

# Convert entire program
python convert_to_ssa.py outputs/dhrystone.riscv/

# Convert ALL programs in outputs folder to a new folder
python convert_to_ssa.py outputs -o outputs_ssa

# Convert with custom output directory
python convert_to_ssa.py outputs/dhrystone.riscv/ -o ssa_output/

# Verbose mode to see register versioning details
python convert_to_ssa.py outputs/dhrystone.riscv/ -v

# Run test examples
python convert_to_ssa.py --test
```

**Output**:
- Creates `.ssa` files alongside original `.txt` files
- Each register reference is versioned uniquely within its block
- Preserves instruction semantics while ensuring single assignment

**Example conversion**:
```
# Original (0.txt):
addi sp, sp, -16
sw s2, 0(sp)
lw a5, 0(s2)

# SSA form (0.ssa):
addi sp_1, sp_0, -16
sw s2_0, 0(sp_1)
lw a5_0, 0(s2_0)
```

---

## Output Structure

After processing, the output directory structure looks like:

```
outputs/
└── dhrystone.riscv/
    └── sections/
        ├── main/
        │   ├── section.txt    # Original function assembly
        │   ├── 0.txt          # Basic block 0 (cleaned)
        │   ├── 0.ssa          # Basic block 0 in SSA form
        │   ├── 1.txt          # Basic block 1 (cleaned)
        │   ├── 1.ssa          # Basic block 1 in SSA form
        │   └── ...
        ├── exit/
        │   ├── section.txt
        │   ├── 0.txt
        │   ├── 0.ssa
        │   └── ...
        └── ...
```

## Complete Workflow Examples

### 1. Process a Single Benchmark

```bash
# Navigate to SSA directory
cd SSA/

# Process dhrystone benchmark
python process_dump.py ../benchmark/im_inputs/dhrystone.riscv.dump

# Convert to SSA form
python convert_to_ssa.py outputs/dhrystone.riscv -v

# View the results
python analyze_blocks.py outputs/dhrystone.riscv

# List specific blocks
python process_dump.py --list outputs/dhrystone.riscv
```

### 2. Batch Process Multiple Benchmarks

```bash
# Process all dumps in benchmark directory
python process_dump.py --batch ../benchmark/im_inputs/

# Process automotive benchmarks
python process_dump.py --batch ../benchmark/automotive/basicmath/
```

### 3. Custom Processing Pipeline

```python
# Python script for custom processing
import sys
sys.path.append('.')

from process_dump import process_single_dump

# Process with custom settings
stats = process_single_dump(
    "input.dump",
    output_base_dir="custom_output",
    verbose=True
)

print(f"Processed {stats['sections']} sections")
print(f"Created {stats['basic_blocks']} basic blocks")
```

### 4. Generate Current Outputs

To generate the current outputs folder with dhrystone example:

```bash
# From the SSA directory
cd /home/allenjin/Codes/egraph_isa_compiler_codesign/SSA

# Process dhrystone benchmark
python process_dump.py ../benchmark/im_inputs/dhrystone.riscv.dump

# The output will be in:
# outputs/dhrystone.riscv/sections/

# To verify the output
python analyze_blocks.py outputs/dhrystone.riscv
```

## Input Requirements

The pipeline expects RISC-V assembly dump files generated by `objdump`:

```bash
# Generate a dump file from an executable
riscv32-unknown-elf-objdump -d program.riscv > program.riscv.dump
```

Input format example:
```
000100b4 <exit>:
   100b4:	1141                	c.addi	sp,-16
   100b6:	4581                	c.li	a1,0
   100b8:	c422                	c.swsp	s0,8(sp)
```

## Integration with Other Tools

The processed output can be used with:
- **Saturation**: Convert basic blocks to e-graphs for optimization
- **Compiler Analysis**: Study control flow and instruction patterns
- **SSA Generation**: Build SSA form for dataflow analysis

## Configuration Files

### `.gitignore`
Excludes generated outputs and Python cache files from version control:
- `outputs/`
- `__pycache__/`
- `*_sections/`
- `*_blocks.txt`

## Example Dump Files

- `basicmath_small_O0.dump`: Sample MiBench automotive benchmark
- Located in: `benchmark/im_inputs/` for more examples

## Troubleshooting

### Common Issues

1. **No output generated**: Ensure the dump file exists and has the correct format
2. **Empty sections**: Check if the dump file contains valid disassembly
3. **Missing blocks**: Verify that branch instructions are correctly identified in `util.py`

### Debug Mode

Use verbose flag for detailed processing information:
```bash
python process_dump.py input.dump --verbose
```

## Performance

Typical processing times on standard hardware:
- Small program (<1000 instructions): <1 second
- Medium program (1000-10000 instructions): 1-5 seconds
- Large program (>10000 instructions): 5-20 seconds

## Future Enhancements

- [x] SSA conversion with register versioning (`convert_to_ssa.py`)
- [ ] Phi functions for SSA at block merge points
- [ ] Data flow analysis
- [ ] Register allocation tracking
- [ ] Control flow graph visualization
- [ ] Integration with LLVM/GCC backends

## License

Part of the egraph_isa_compiler_codesign project.

## Contact

For questions or issues, please open an issue in the project repository.