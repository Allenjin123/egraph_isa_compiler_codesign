# Benchmark program names and instruction definitions for train_test

# ============================================================================
# RISC-V instructions (capitalized mnemonics)
# ============================================================================

ALL_INSTRUCTIONS = {
    # RV32I ALU
    'Add', 'Sub',
    'And', 'Or', 'Xor',
    'Sll', 'Srl', 'Sra',
    'Slt', 'Sltu',
    # RV32I ALU immediate
    'Addi',
    'Andi', 'Ori', 'Xori',
    'Slli', 'Srli', 'Srai',
    'Slti', 'Sltiu',
    # Load
    'Lb', 'Lh', 'Lw',
    'Lbu', 'Lhu',
    # Store
    'Sb', 'Sh', 'Sw',
    # Branch
    'Beq', 'Bne',
    'Blt', 'Bge',
    'Bltu', 'Bgeu',
    # Jump
    'Jal', 'Jalr',
    # Upper immediate
    'Lui', 'Auipc',
    # System
    'Ecall', 'Ebreak',
    # Fence
    'Fence',
    # M extension: multiply
    'Mul', 'Mulh', 'Mulhsu', 'Mulhu',
    # M extension: divide
    'Div', 'Divu', 'Rem', 'Remu',
}

# ============================================================================
# Benchmark program names
# ============================================================================

MIBENCH = [
    'basicmath_small_O3',
    'bitcnts_O3',
    'qsort_large_O3',
    'qsort_small_O3',
    'dijkstra_small_O3',
    'patricia_O3',
    'rijndael_Oz',
    'sha_O3',
]

EMBENCH = [
    'mont64',
    'libedn',
    'libhuffbench',
    'matmult-int',
    'md5',
    'picojpeg_test',
    'primecount',
    'combined',
    'libslre',
    'libnsichneu',
    'libstatemate',
    'tarfind',
    'libud',
    'libwikisort',
]

ALL_BENCHMARKS = MIBENCH + EMBENCH
