# ISA Minimization Toy Example

This directory contains a toy example demonstrating ISA (Instruction Set Architecture) minimization using egglog. The example shows how to use cost models to encourage the use of fewer instruction types, which is useful for ISA design and compiler optimization.

## Overview

The example implements a cost model that penalizes instruction type diversity, encouraging the optimizer to decompose complex instructions (like `MulH` - multiply high) into sequences of simpler, more basic instructions.

## Files

- `isa_minimization.egg` - The main egglog file demonstrating ISA minimization with cost-driven extraction
- `riscv_ssa.egg` - RISC-V SSA form optimization example with instruction cost modeling and canonicalization

## Key Concepts

### Cost Model Components
1. **Base Cost** - Basic execution cost of each instruction
2. **Type Penalty** - Additional cost for using diverse instruction types (models ISA complexity)
3. **Sequence Length** - Penalty for longer instruction sequences

### Instruction Hierarchy
- **Basic ALU** (Add, And, Shr, Shl): Cost 1, Type penalty 0
- **Immediate Instructions** (Addi, Andi, Shri, Shli): Cost 1, Type penalty 1
- **Complex Instructions** (Mul: Cost 30+5, MulH: Cost 3000+10)

## Running the Examples

### ISA Minimization Example

#### Option 1: Standard egglog (Limited Cost Support)
```bash
egglog toy_examples/isa_minimization.egg
```

**Limitations**: Standard egglog only supports constructor-based costs (`:cost` annotations in datatypes). The advanced `set-cost` and `with-dynamic-cost` features are not available.

#### Option 2: egglog-experimental (Full Cost Support)
```bash
# Install egglog-experimental first
cargo install --git https://github.com/egraphs-good/egglog-experimental.git

# Run with experimental version
egglog-experimental toy_examples/isa_minimization.egg
```

**Advantages**: Supports `with-dynamic-cost` and `set-cost` for fine-grained, dynamic cost control.

### RISC-V SSA Example

```bash
egglog-experimental toy_examples/riscv_ssa.egg
```

This example requires egglog-experimental as it uses advanced cost modeling features and complex type constructors.

## Expected Output

### ISA Minimization Example

The program starts with:
```
MulH(X1, X2, X3) ; Seq(Andi(X4, X1, 255), Shri(X5, X4, 8))
```

After optimization, `MulH` is decomposed into ~15 basic ALU operations:
```
Seq(Andi(T1, X2, 4294967295), Seq(Andi(T2, X3, 4294967295), ...))
```

This demonstrates successful ISA minimization - the expensive `MulH` instruction is replaced with a sequence of cheaper, more basic instructions.

### RISC-V SSA Example

The RISC-V SSA example models a program that:
1. Takes an input value (val)
2. Computes `(val / 10) << 4`
3. Computes `val % 10`
4. Combines results with OR operation
5. Converts final result to 8-bit

The optimization pipeline shows:
- **Cost model**: Different instruction costs (DIV: 20, SLL: 1, REM: 20, OR: 1, Convert: 1)
- **Canonicalization**: Commutativity rules (OR operations are reordered)
- **Final extraction**: `(SSAVar 5 (I8))` with cost 3, representing the optimized program result

## Key Lessons Learned

### 1. Cost Model Integration
**Problem**: Initially, extraction showed the same program before and after optimization despite cost changes.

**Root Cause**: egglog's extractor wasn't using the custom `total_cost` function - it only used default AST-size costs.

**Solutions**:
- **Standard egglog**: Use constructor costs (`:cost 3010` in datatype definitions)
- **egglog-experimental**: Use `set-cost` rules to connect custom cost functions to the extractor

### 2. Two Approaches to Cost Modeling

#### Constructor Costs (Standard egglog)
```egglog
(datatype Inst
    (MulH Reg Reg Reg :cost 3010)  ; High cost discourages usage
    (Add Reg Reg Reg)              ; Default cost 1
    ...)
```

#### Dynamic Costs (egglog-experimental)
```egglog
(with-dynamic-cost
    (datatype Inst
        (MulH Reg Reg Reg)  ; No fixed cost
        ...))

; Set costs dynamically based on analysis
(rule ((MulH rd rs1 rs2)) ((set-cost (MulH rd rs1 rs2) 3010)))
```

### 3. Function vs. Extraction Costs
- **Function costs** (like `total_cost`) are for analysis and can be extracted/printed
- **Extraction costs** (constructor `:cost` or `set-cost`) determine which representation the extractor chooses
- These are separate systems that need to be connected explicitly

### 4. When to Use Each Version
- **Standard egglog**: When constructor costs are sufficient for your cost model
- **egglog-experimental**: When you need:
  - Dynamic cost calculation based on runtime analysis
  - Complex cost models that depend on context
  - Integration between analysis functions and extraction costs

## Implementation Details

The example demonstrates several advanced egglog techniques:
- Multi-component cost models with different penalty types
- Complex rewrite rules for instruction decomposition
- Cost-driven extraction to achieve optimization goals
- Integration between analysis (cost calculation) and synthesis (extraction)

This serves as a template for implementing cost-driven optimizations in domain-specific compilers and code generators.

## Troubleshooting

### Common egglog-experimental Syntax Errors

If you encounter parse errors when running the examples, check for these common issues:

#### 1. Constructor Call Syntax
**Error**: `Unbound symbol I32`
**Problem**: Type constructors used as bare identifiers
**Solution**: Wrap constructors in parentheses
```egglog
# Wrong
(SSAVar 0 I32)

# Correct
(SSAVar 0 (I32))
```

#### 2. Operation Constructor Syntax
**Error**: `Unbound symbol DIV`
**Problem**: Operation constructors used as bare identifiers
**Solution**: Wrap operation constructors in parentheses
```egglog
# Wrong
(BinOp result DIV x y)

# Correct
(BinOp result (DIV) x y)
```

#### 3. Extraction Target Issues
**Error**: `Unbound symbol program_result`
**Problem**: Trying to extract variables that only exist locally in rule bodies
**Solution**: Extract concrete constructors or globally defined values
```egglog
# Wrong (if program_result is only defined locally)
(extract program_result)

# Correct
(extract (SSAVar 5 (I8)))
```

#### 4. Type Mismatches in Rewrite Rules
**Error**: `Expect expression to have type SSAValue, but get type Instruction`
**Problem**: Mixing instruction types and value types in patterns
**Solution**: Ensure pattern matching respects the type system defined in your constructors

These fixes were applied to `riscv_ssa.egg` to make it compatible with egglog-experimental's stricter parsing and type checking.