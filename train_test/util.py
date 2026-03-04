# Benchmark program names and instruction definitions for train_test
import random

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
    # # System
    # 'Ecall', 'Ebreak',
    # # Fence
    # 'Fence',
    # M extension: multiply
    'Mul', 'Mulh', 'Mulhsu', 'Mulhu',
    # M extension: divide
    'Div', 'Divu', 'Rem', 'Remu',
}

# ============================================================================
# Benchmark program names (short names, matching ilp_input.json)
# ============================================================================

name_mapping = {
    'basicmath': 'basicmath_small_O3',
    'bitcnts': 'bitcnts_O3',
    'dijkstra': 'dijkstra_small_O3',
    'patricia': 'patricia_O3',
    'qsort_num': 'qsort_large_O3',
    'qsort_str': 'qsort_small_O3',
    'rijndael': 'rijndael_Oz',
    'sha': 'sha_O3',
    'mont64': 'mont64',
    'edn': 'libedn',
    'huffbench': 'libhuffbench',
    'matmult-int': 'matmult-int',
    'md5': 'md5',
    'nsichneu': 'libnsichneu',
    'picojpeg_test': 'picojpeg_test',
    'primecount': 'primecount',
    'combined': 'combined',
    'slre': 'libslre',
    'statemate': 'libstatemate',
    'tarfind': 'tarfind',
    'ud': 'libud',
    'wikisort': 'libwikisort',
}

MIBENCH = [
    'basicmath', 'bitcnts', 'dijkstra', 'patricia',
    'qsort_num', 'qsort_str', 'rijndael', 'sha',
]

EMBENCH = [
    'mont64', 'edn', 'huffbench', 'matmult-int', 'md5',
    'nsichneu', 'picojpeg_test', 'primecount', 'combined',
    'slre', 'statemate', 'tarfind', 'ud', 'wikisort',
]


ALL_BENCHMARKS = MIBENCH + EMBENCH

# ============================================================================
# Train / Test split
# ============================================================================

def random_split(seed=22, train_ratio=0.7):
    """Randomly shuffle ALL_BENCHMARKS and split into train/test."""
    benchmarks = ALL_BENCHMARKS.copy()
    random.seed(seed)
    random.shuffle(benchmarks)
    mid = int(len(benchmarks) * train_ratio)
    return benchmarks[:mid], benchmarks[mid:]

TRAIN_SET, TEST_SET = random_split()
