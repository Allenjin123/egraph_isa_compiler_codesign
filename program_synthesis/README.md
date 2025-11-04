# Program Synthesis Tools

This directory contains tools for parsing and converting RISC-V instruction synthesis results (from Greenthumb) into egglog rewrite rules.

## Overview

**Greenthumb** is a program synthesis tool that discovers alternative ways to implement RISC-V instructions using sequences of other instructions. This module converts those discoveries into nested egglog rewrite rules for program optimization.

## How It Works

### Input: Greenthumb Results

Greenthumb produces synthesis results in this format:

```
riscv_greenthumb/riscv/results/
├── add/
│   ├── add.s              # Original instruction: add x1, x2, x3
│   ├── best-len2.s        # 2-instruction equivalent
│   ├── best-len3.s        # 3-instruction equivalent
│   └── best-len4.s        # 4+ instruction alternatives
├── sub/
├── mul/
└── ... (30+ instructions)
```

Each `.s` file contains assembly instructions showing an alternative implementation.

**Example** (`add/best-len2.s`):
```asm
neg x2, x2
sub x1, x3, x2
```
This shows: `add x1, x2, x3` can be implemented as `neg x2; sub x1, x3, x2`

### Processing Pipeline

```
Greenthumb .s files
  ↓
1. Parse assembly instructions
  ↓
2. Filter dummy instructions (sub x0, x0, x0)
  ↓
3. Expand pseudo-instructions (neg → sub, not → xori)
  ↓
4. Build DAG/tree structure
   - Track register data flow
   - Identify dependencies
  ↓
5. Convert to nested egglog expression
   - Abstract register names (x1→result, x2→rs1, x3→rs2)
   - Build nested functional composition
  ↓
6. Generate egglog rewrite rule
   - Deduplicate patterns
   - Add documentation comments
  ↓
Output: program_synthesis/rewrites/greenthumb_rewrites.egg
```

### DAG Building Example

**Greenthumb sequence:**
```asm
sub x2, x0, x2     # x2 = 0 - x2 (negate)
sub x1, x3, x2     # x1 = x3 - x2_new
```

**DAG representation:**
```
     sub (x1) [root]
      ├─ x3 [leaf - input]
      └─ sub (x2) [intermediate]
          ├─ x0 [constant]
          └─ x2 [leaf - input]
```

**Generated egglog (nested):**
```lisp
(birewrite (Add rs1 rs2)
           (Sub rs2 (Sub (RegVal "x0") rs1)))
```

This means: `a + b = b - (-a)` using only subtraction!

## Key Features

### 1. Deduplication
Different greenthumb files may produce equivalent rewrites. The parser automatically detects and removes duplicates.

**Example:**
- `best-len3.s` and `best-len4.s` both produce: `(Sub rs1 (Sub (RegVal "x0") rs2))`
- Only the first occurrence is kept

**Stats:**
- ADD: 3 files → 2 unique rewrites (1 duplicate removed)
- SUB: 4 files → 1 unique rewrite (3 duplicates removed)

### 2. Pseudo-Instruction Expansion

Greenthumb uses RISC-V pseudo-instructions that need expansion:

| Pseudo | Expansion | Egglog |
|--------|-----------|--------|
| `neg rd, rs` | `sub rd, x0, rs` | `(Sub (RegVal "x0") rs)` |
| `not rd, rs` | `xori rd, rs, -1` | `(Xori rs (ImmVal -1))` |
| `seqz rd, rs` | `sltiu rd, rs, 1` | `(Sltiu rs (ImmVal 1))` |
| `snez rd, rs` | `sltu rd, x0, rs` | `(Sltu (RegVal "x0") rs)` |

### 3. Register Abstraction

Converts concrete greenthumb registers to egglog pattern variables:

| Greenthumb | Purpose | Egglog Variable |
|------------|---------|-----------------|
| x1 | Destination | result (implicit) |
| x2 | First source | rs1 |
| x3 | Second source | rs2 |
| x0 | Zero register | (RegVal "x0") |

### 4. Nested Composition

Sequential instructions become nested expressions:

**Sequential (Greenthumb):**
```
1. ori x1, x0, 5      # x1 = 5
2. add x1, x2, x1     # x1 = x2 + 5
```

**Nested (Egglog):**
```lisp
(Add rs1 (Ori (RegVal "x0") (ImmVal 5)))
```

## Usage

### Basic Usage

```bash
cd /home/allenjin/Codes/egraph_isa_compiler_codesign/program_synthesis

# Generate all greenthumb rewrites
python greenthumb_parser.py

# With verbose output (shows deduplication stats)
python greenthumb_parser.py -v
```

### Custom Paths

```bash
# Custom input/output
python greenthumb_parser.py \
  -i ../riscv_greenthumb/riscv/results \
  -o custom_rewrites.egg \
  -v
```

### Command-Line Options

```
-i, --input DIR     Greenthumb results directory
                    (default: ../riscv_greenthumb/riscv/results)

-o, --output FILE   Output egglog file
                    (default: rewrites/greenthumb_rewrites.egg)

-v, --verbose       Show detailed progress and deduplication stats
```

## Output Format

### Generated Rewrite Rules

Each rewrite includes:
1. Documentation comments
2. Source file reference
3. Original greenthumb sequence
4. Nested egglog rewrite rule

**Example:**

```lisp
;; ============================================================
;; ADD Rewrites (Greenthumb-generated)
;; ============================================================

;; Length 2: best-len2.s
;; Greenthumb sequence:
;;   1.     sub rd=x2 rs1=x0 rs2=x2
;;   2.     sub rd=x1 rs1=x3 rs2=x2
(birewrite (Add rs1 rs2)
           (Sub rs2 (Sub (RegVal "x0") rs1)))

;; Length 2: best-len3.s
;; Greenthumb sequence:
;;   1.     sub rd=x3 rs1=x0 rs2=x3
;;   2.     sub rd=x1 rs1=x2 rs2=x3
(birewrite (Add rs1 rs2)
           (Sub rs1 (Sub (RegVal "x0") rs2)))
```

### Output Statistics

- **27 instructions processed** (all RV32I + RV32M with greenthumb results)
- **24 unique rewrite rules** (duplicates removed)
- **305 lines** total output

### Complex Example (XOR)

```lisp
;; Length 4: best-len4.s
;; Greenthumb sequence:
;;   1.     or rd=x1 rs1=x3 rs2=x2
;;   2.     and rd=x2 rs1=x2 rs2=x3
;;   3.     xori rd=x2 rs1=x2 imm=-1
;;   4.     and rd=x1 rs1=x2 rs2=x1
(birewrite (Xor rs1 rs2)
           (And (Xori (And rs1 rs2) (ImmVal -1)) (Or rs2 rs1)))
```

This 4-deep nesting shows XOR can be synthesized using: or, and, xori, and!

## File Locations

```
program_synthesis/
├── greenthumb_parser.py          # Main parser (this tool)
└── rewrites/
    └── greenthumb_rewrites.egg   # Generated rewrite rules (output)
```

## Integration with Saturation

The generated rewrites can be included in egglog programs:

```lisp
; In your .egg file
(include "../program_synthesis/rewrites/greenthumb_rewrites.egg")

; Now you can use the rewrites
(let result (Add rs1_val rs2_val))
(run 10)  ; Egglog will apply greenthumb rewrites
```

## Limitations (Current Implementation)

### Supported:
✓ Fixed immediate values (e.g., `ori x1, x0, 5` → `(ImmVal 5)`)
✓ R-type and I-type instructions
✓ Pseudo-instruction expansion
✓ Nested composition (no Seq2 usage)
✓ Deduplication of equivalent patterns

### Not Yet Supported:
✗ Variable immediates (parametric rewrites)
✗ Memory operations (load/store)
✗ Branch/jump instructions
✗ Register reuse cycles (detected and skipped)

## Technical Details

### DAG Algorithm

The key innovation is converting **sequential** greenthumb instructions into **nested functional** egglog expressions:

1. **Track register values**: Map each register to the instruction that produces it
2. **Build dependency tree**: Each instruction node has children (its operands)
3. **Recursive nesting**: Convert tree to nested expression (post-order traversal)

**Code snippet:**
```python
reg_values = {}  # Register → InstructionNode

for inst in instructions:
    node = InstructionNode(inst)

    # Link to operand nodes
    if inst.rs1 in reg_values:
        node.children.append(reg_values[inst.rs1])
    if inst.rs2 in reg_values:
        node.children.append(reg_values[inst.rs2])

    # Update registry
    reg_values[inst.rd] = node

# Root is final result
return reg_values['x1']
```

### Deduplication

Rewrites are normalized for comparison:
```python
# Extract just the birewrite pattern
pattern = "(birewrite (Add rs1 rs2) (Sub rs2 (Sub (RegVal \"x0\") rs1)))"

# Track in set
seen_patterns.add(pattern)
```

## See Also

- [Saturation/base.egg](../Saturation/base.egg) - Core egglog instruction definitions
- [Saturation/local_saturation.py](../Saturation/local_saturation.py) - Program → egglog conversion
- [riscv_greenthumb/](../riscv_greenthumb/) - Original greenthumb synthesis results

## Future Work

- [ ] Support for parameterized immediates (variable shift amounts, etc.)
- [ ] Memory operation rewrites
- [ ] Cost-based rewrite selection (shorter sequences preferred)
- [ ] Semantic validation (verify rewrites are correct)
- [ ] Integration with backend synthesis tools
