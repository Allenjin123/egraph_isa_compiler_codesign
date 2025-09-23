# ISA Minimization Toy Example

This directory contains a toy example demonstrating ISA (Instruction Set Architecture) minimization using egglog. The example shows how to use cost models to encourage the use of fewer instruction types, which is useful for ISA design and compiler optimization.

## Overview

The example implements a cost model that penalizes instruction type diversity, encouraging the optimizer to decompose complex instructions (like `MulH` - multiply high) into sequences of simpler, more basic instructions.

## Files

- `isa_minimization.egg` - The main egglog file demonstrating ISA minimization with cost-driven extraction

## Key Concepts

### Cost Model Components
1. **Base Cost** - Basic execution cost of each instruction
2. **Type Penalty** - Additional cost for using diverse instruction types (models ISA complexity)
3. **Sequence Length** - Penalty for longer instruction sequences

### Instruction Hierarchy
- **Basic ALU** (Add, And, Shr, Shl): Cost 1, Type penalty 0
- **Immediate Instructions** (Addi, Andi, Shri, Shli): Cost 1, Type penalty 1
- **Complex Instructions** (Mul: Cost 30+5, MulH: Cost 3000+10)

## Running the Example

### Option 1: Standard egglog (Limited Cost Support)
```bash
egglog toy_examples/isa_minimization.egg
```

**Limitations**: Standard egglog only supports constructor-based costs (`:cost` annotations in datatypes). The advanced `set-cost` and `with-dynamic-cost` features are not available.

### Option 2: egglog-experimental (Full Cost Support)
```bash
# Install egglog-experimental first
cargo install --git https://github.com/egraphs-good/egglog-experimental.git

# Run with experimental version
egglog-experimental toy_examples/isa_minimization.egg
```

**Advantages**: Supports `with-dynamic-cost` and `set-cost` for fine-grained, dynamic cost control.

## Expected Output

The program starts with:
```
MulH(X1, X2, X3) ; Seq(Andi(X4, X1, 255), Shri(X5, X4, 8))
```

After optimization, `MulH` is decomposed into ~15 basic ALU operations:
```
Seq(Andi(T1, X2, 4294967295), Seq(Andi(T2, X3, 4294967295), ...))
```

This demonstrates successful ISA minimization - the expensive `MulH` instruction is replaced with a sequence of cheaper, more basic instructions.

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