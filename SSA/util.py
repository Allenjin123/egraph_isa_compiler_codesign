# Shared utilities for SSA processing
# Provides common branch instruction predicates for RISC-V disassembly handling.

BRANCH_INSTRUCTIONS = {
    # Unconditional jumps / calls
    'jal', 'jalr',
    # Pseudo instructions
    'j', 'jr',
    # Conditional branches (standard)
    'beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu',
    # Conditional branches (pseudo)
    'beqz', 'bnez', 'blez', 'bgez', 'bltz', 'bgtz',
    # Compressed forms
    'c.j', 'c.jr', 'c.jal', 'c.jalr',
    'c.beqz', 'c.bnez',
    # Other control flow
    'ret', 'call', 'tail',
    # Traps / env calls
    'ecall', 'ebreak',
}

# Pseudo instructions within BRANCH_INSTRUCTIONS
PSEUDO_BRANCH_INSTRUCTIONS = {
    'j', 'jr', 'beqz', 'bnez', 'blez', 'bgez', 'bltz', 'bgtz', 'ret', 'call', 'tail'
}

# Global dict to track used pseudo instructions
USED_PSEUDO_INSTRUCTIONS = {}

def is_branch_mnemonic(mnemonic: str) -> bool:
    """Return True if mnemonic terminates a basic block (control-flow)."""
    if not mnemonic:
        return False
    return mnemonic in BRANCH_INSTRUCTIONS

def is_pseudo_mnemonic(mnemonic: str) -> bool:
    """Return True if mnemonic is a pseudo instruction."""
    return mnemonic in PSEUDO_BRANCH_INSTRUCTIONS

def normalize_mnemonic(mnemonic: str) -> str:
    """Normalize a mnemonic (lowercase for comparison)."""
    return mnemonic.lower() if mnemonic else mnemonic
