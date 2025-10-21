# RV32IM Instruction Set

RV32IM is the RISC-V 32-bit instruction set architecture consisting of the base integer instructions (RV32I) and the standard extension for integer multiplication and division (M). Below is a comprehensive list of all supported instructions, organized by extension and category. Each entry includes the mnemonic (with typical operands), format/type, and a brief description. This list is based on the standard RISC-V specifications.

## RV32I: Base Integer Instructions

### Immediate Instructions (U-type)
| Mnemonic | Format | Description |
|----------|--------|-------------|
| LUI rd, imm | U-type | Load the upper 20 bits of rd with imm (lower 12 bits zeroed). |
| AUIPC rd, imm | U-type | Add the upper immediate (shifted left by 12) to the PC and store in rd. |

### Jump Instructions
| Mnemonic | Format | Description |
|----------|--------|-------------|
| JAL rd, offset | J-type | Jump to PC + offset and link (store PC + 4 in rd). |
| JALR rd, rs1, offset | I-type | Jump to rs1 + offset (LSB cleared) and link (store PC + 4 in rd). |

### Branch Instructions (B-type)
| Mnemonic | Format | Description |
|----------|--------|-------------|
| BEQ rs1, rs2, offset | B-type | Branch if rs1 == rs2. |
| BNE rs1, rs2, offset | B-type | Branch if rs1 ≠ rs2. |
| BLT rs1, rs2, offset | B-type | Branch if rs1 < rs2 (signed). |
| BGE rs1, rs2, offset | B-type | Branch if rs1 ≥ rs2 (signed). |
| BLTU rs1, rs2, offset | B-type | Branch if rs1 < rs2 (unsigned). |
| BGEU rs1, rs2, offset | B-type | Branch if rs1 ≥ rs2 (unsigned). |

### Load Instructions (I-type)
| Mnemonic | Format | Description |
|----------|--------|-------------|
| LB rd, offset(rs1) | I-type | Load signed byte from memory. |
| LH rd, offset(rs1) | I-type | Load signed halfword from memory. |
| LW rd, offset(rs1) | I-type | Load word from memory. |
| LBU rd, offset(rs1) | I-type | Load unsigned byte from memory. |
| LHU rd, offset(rs1) | I-type | Load unsigned halfword from memory. |

### Store Instructions (S-type)
| Mnemonic | Format | Description |
|----------|--------|-------------|
| SB rs2, offset(rs1) | S-type | Store byte to memory. |
| SH rs2, offset(rs1) | S-type | Store halfword to memory. |
| SW rs2, offset(rs1) | S-type | Store word to memory. |

### Register-Immediate Arithmetic/Logical (I-type)
| Mnemonic | Format | Description |
|----------|--------|-------------|
| ADDI rd, rs1, imm | I-type | Add immediate to rs1. |
| SLTI rd, rs1, imm | I-type | Set rd to 1 if rs1 < imm (signed). |
| SLTIU rd, rs1, imm | I-type | Set rd to 1 if rs1 < imm (unsigned). |
| XORI rd, rs1, imm | I-type | XOR rs1 with imm. |
| ORI rd, rs1, imm | I-type | OR rs1 with imm. |
| ANDI rd, rs1, imm | I-type | AND rs1 with imm. |
| SLLI rd, rs1, shamt | I-type | Logical left shift by immediate. |
| SRLI rd, rs1, shamt | I-type | Logical right shift by immediate. |
| SRAI rd, rs1, shamt | I-type | Arithmetic right shift by immediate. |

### Register-Register Arithmetic/Logical (R-type)
| Mnemonic | Format | Description |
|----------|--------|-------------|
| ADD rd, rs1, rs2 | R-type | Add rs1 and rs2. |
| SUB rd, rs1, rs2 | R-type | Subtract rs2 from rs1. |
| SLL rd, rs1, rs2 | R-type | Logical left shift rs1 by rs2[4:0]. |
| SLT rd, rs1, rs2 | R-type | Set rd to 1 if rs1 < rs2 (signed). |
| SLTU rd, rs1, rs2 | R-type | Set rd to 1 if rs1 < rs2 (unsigned). |
| XOR rd, rs1, rs2 | R-type | XOR rs1 and rs2. |
| SRL rd, rs1, rs2 | R-type | Logical right shift rs1 by rs2[4:0]. |
| SRA rd, rs1, rs2 | R-type | Arithmetic right shift rs1 by rs2[4:0]. |
| OR rd, rs1, rs2 | R-type | OR rs1 and rs2. |
| AND rd, rs1, rs2 | R-type | AND rs1 and rs2. |

### Memory Ordering
| Mnemonic | Format | Description |
|----------|--------|-------------|
| FENCE pred, succ | I-type | Memory fence for ordering accesses. |
| FENCE.I | I-type | Instruction fetch fence. |

### System Instructions (I-type)
| Mnemonic | Format | Description |
|----------|--------|-------------|
| ECALL | I-type | Environment call (system call). |
| EBREAK | I-type | Environment breakpoint. |
| PAUSE | I-type | Pause hint for waiting loops. |

**Note:** NOP is a pseudoinstruction (ADDI x0, x0, 0) and not a distinct opcode.

## RV32M: Integer Multiplication and Division Extension (R-type)
| Mnemonic | Format | Description |
|----------|--------|-------------|
| MUL rd, rs1, rs2 | R-type | Multiply rs1 and rs2 (lower 32 bits). |
| MULH rd, rs1, rs2 | R-type | Multiply signed, result high bits. |
| MULHSU rd, rs1, rs2 | R-type | Multiply signed rs1 by unsigned rs2, high bits. |
| MULHU rd, rs1, rs2 | R-type | Multiply unsigned, high bits. |
| DIV rd, rs1, rs2 | R-type | Signed division. |
| DIVU rd, rs1, rs2 | R-type | Unsigned division. |
| REM rd, rs1, rs2 | R-type | Signed remainder. |
| REMU rd, rs1, rs2 | R-type | Unsigned remainder. |