# Shared utilities for SSA processing
# Provides common branch instruction predicates for RISC-V disassembly handling.

BRANCH_INSTRUCTIONS = {
    # Unconditional jumps / calls
    'jal', 'jalr',
    # Pseudo instructions
    'j', 'jr',
    # Conditional branches
    'beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu',
    # Compressed forms
    'c.j', 'c.jr', 'c.jal', 'c.jalr',
    'c.beqz', 'c.bnez',
    # Other control flow
    'ret', 'call', 'tail',
    # Traps / env calls
    'ecall', 'ebreak',
}

def is_branch_mnemonic(mnemonic: str) -> bool:
    """Return True if mnemonic terminates a basic block (control-flow)."""
    if not mnemonic:
        return False
    return mnemonic in BRANCH_INSTRUCTIONS

def normalize_mnemonic(mnemonic: str) -> str:
    """Normalize a mnemonic (lowercase for comparison)."""
    return mnemonic.lower() if mnemonic else mnemonic
