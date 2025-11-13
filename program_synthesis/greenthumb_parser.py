"""
Parse RISC-V Greenthumb rewrite rules and convert to egglog format.

Greenthumb provides instruction synthesis results showing how to implement
one instruction using a sequence of other instructions. This module converts
those sequential representations into nested egglog rewrite rules.
"""

from __future__ import annotations
import os
import sys
from pathlib import Path
from typing import List, Dict, Optional, Tuple

# Add parent directory to path to import from Saturation
sys.path.insert(0, str(Path(__file__).parent.parent))
from Saturation.data_structure import text_inst


# Pseudo-instruction expansion definitions
PSEUDO_EXPANSIONS = {
    'neg': lambda rd, rs: text_inst('sub', rd=rd, rs1='x0', rs2=rs),
    'not': lambda rd, rs: text_inst('xori', rd=rd, rs1=rs, imm=-1),
    'seqz': lambda rd, rs: text_inst('sltiu', rd=rd, rs1=rs, imm=1),
    'snez': lambda rd, rs: text_inst('sltu', rd=rd, rs1='x0', rs2=rs),
}


def filter_dummy_instructions(instructions: List[text_inst]) -> List[text_inst]:
    """
    Remove greenthumb spacer instructions (writes to x0 register).

    Greenthumb uses `sub x0, x0, x0` as padding/alignment.
    These are NOPs in RISC-V since x0 is hardwired to zero.

    Args:
        instructions: List of parsed instructions

    Returns:
        Filtered list without dummy instructions
    """
    return [inst for inst in instructions if inst.rd != 'x0']


def expand_pseudo_instruction(inst: text_inst, avoid_instruction: Optional[str] = None) -> List[text_inst]:
    """
    Expand RISC-V pseudo-instruction to its base form, avoiding circular dependencies.

    Expansions (default):
        neg rd, rs  → sub rd, x0, rs
        not rd, rs  → xori rd, rs, -1
        seqz rd, rs → sltiu rd, rs, 1
        snez rd, rs → sltu rd, x0, rs

    Alternative expansions (when avoiding target instruction):
        neg (avoid sub) → xori temp, rs, -1; addi rd, temp, 1  (two's complement)
        not (avoid xori) → Keep as-is (xori is the natural expansion)

    Args:
        inst: Instruction to expand
        avoid_instruction: Instruction type to avoid (e.g., 'sub' when synthesizing sub)

    Returns:
        List of expanded instructions (or [original] if not pseudo)
    """
    if inst.op_name not in PSEUDO_EXPANSIONS:
        return [inst]  # Not a pseudo-instruction

    # Handle neg special case: avoid sub by using two's complement
    if inst.op_name == 'neg' and avoid_instruction == 'sub':
        # Two's complement: ~rs + 1 (avoids sub)
        return [
            text_inst('xori', rd=f'{inst.rd}_tmp', rs1=inst.rs1, imm=-1),
            text_inst('addi', rd=inst.rd, rs1=f'{inst.rd}_tmp', imm=1)
        ]

    # Handle not: xori is the natural form, keep it even if avoiding xori
    # (There's no better alternative)

    # Default expansion
    return [PSEUDO_EXPANSIONS[inst.op_name](inst.rd, inst.rs1)]


def parse_greenthumb_file(file_path: str, avoid_instruction: Optional[str] = None) -> List[text_inst]:
    """
    Parse a greenthumb .s file and return cleaned instruction list.

    Steps:
    1. Parse each line using text_inst.parse_instruction()
    2. Filter out dummy instructions (rd == x0)
    3. Expand pseudo-instructions (neg, not, etc.) while avoiding circular dependencies

    Args:
        file_path: Path to .s file
        avoid_instruction: Instruction type to avoid in expansions (e.g., 'sub' when synthesizing sub)

    Returns:
        List of cleaned and expanded instructions
    """
    instructions = []

    with open(file_path, 'r') as f:
        for line in f:
            inst = text_inst.parse_instruction(line)
            if inst:
                # Expand pseudo-instructions (may return multiple instructions)
                expanded = expand_pseudo_instruction(inst, avoid_instruction)
                instructions.extend(expanded)

    # Filter dummy instructions
    return filter_dummy_instructions(instructions)


class InstructionNode:
    """
    Node in the instruction DAG.

    Represents either:
    - An instruction that computes a value (has children)
    - A leaf node (input register or constant)
    """

    def __init__(self, inst: Optional[text_inst] = None, register: Optional[str] = None):
        self.inst = inst              # The instruction (None for leaf nodes)
        self.register = register      # Register name this node represents
        self.children: List[InstructionNode] = []  # Operand nodes
        self.is_leaf = (inst is None)  # True if this is an input register

    def __str__(self):
        if self.is_leaf:
            return f"Leaf({self.register})"
        else:
            return f"{self.inst.op_name}({self.register})"


def build_instruction_dag(instructions: List[text_inst], target: text_inst) -> InstructionNode:
    """
    Build DAG from sequential greenthumb instructions.

    The DAG represents data flow:
    - Leaf nodes: Input registers from target instruction
    - Internal nodes: Instructions that compute intermediate values
    - Root node: Final instruction producing the result

    Args:
        instructions: Sequential instruction list (after filtering/expanding)
        target: Original target instruction (e.g., add x1, x2, x3)

    Returns:
        Root node of the DAG (instruction producing final result)

    Example:
        target: add x1, x2, x3
        instructions: [sub x2, x0, x2, sub x1, x3, x2]

        Builds:
            sub_node(x1) [root]
              ├─ leaf(x3)
              └─ sub_node(x2)
                  ├─ leaf(x0)
                  └─ leaf(x2)
    """
    # Track which node produces each register
    # Start with input registers as leaves
    reg_values: Dict[str, InstructionNode] = {}

    # Create leaf nodes for target instruction's inputs
    if target.rs1 and target.rs1 != 'x0':
        reg_values[target.rs1] = InstructionNode(register=target.rs1)
    if target.rs2 and target.rs2 != 'x0':
        reg_values[target.rs2] = InstructionNode(register=target.rs2)

    # x0 is always a constant leaf
    reg_values['x0'] = InstructionNode(register='x0')

    # Process each instruction in sequence
    for inst in instructions:
        node = InstructionNode(inst=inst, register=inst.rd)

        # Link to child nodes (operands)
        # For rs1
        if inst.rs1:
            if inst.rs1 in reg_values:
                node.children.append(reg_values[inst.rs1])
            else:
                # Create new leaf if not seen before
                leaf = InstructionNode(register=inst.rs1)
                reg_values[inst.rs1] = leaf
                node.children.append(leaf)

        # For rs2
        if inst.rs2:
            if inst.rs2 in reg_values:
                node.children.append(reg_values[inst.rs2])
            else:
                # Create new leaf if not seen before
                leaf = InstructionNode(register=inst.rs2)
                reg_values[inst.rs2] = leaf
                node.children.append(leaf)

        # For immediate (not a child node, but store for later)
        # (immediates are handled differently in egglog expressions)

        # Update reg_values with this node
        reg_values[inst.rd] = node

    # Root is the node that produces the target's destination register
    # Typically x1 for greenthumb
    root_register = target.rd if target.rd else 'x1'
    if root_register not in reg_values:
        raise ValueError(f"Final result register {root_register} not found in instruction sequence")

    return reg_values[root_register]


def abstract_register_mapping(target: text_inst) -> Dict[str, str]:
    """
    Create mapping from greenthumb concrete registers to egglog variables.

    Uses RISC-V naming convention:
    - Target rd → 'result' (implicit, not in pattern)
    - Target rs1 → 'rs1'
    - Target rs2 → 'rs2'
    - x0 → '(RegVal "x0")'

    Args:
        target: The target instruction being synthesized

    Returns:
        Dictionary mapping register names to egglog variable names
    """
    reg_map = {'x0': '(RegVal "x0")'}

    if target.rs1:
        reg_map[target.rs1] = 'rs1'
    if target.rs2:
        reg_map[target.rs2] = 'rs2'

    return reg_map


def dag_to_egglog_expr(node: InstructionNode, reg_map: Dict[str, str]) -> str:
    """
    Recursively convert DAG node to nested egglog expression.

    Uses post-order traversal: process children first, then current node.
    Uses explicit pattern matching on instruction names for clarity and scalability.

    Args:
        node: Current DAG node
        reg_map: Mapping from register names to egglog variables

    Returns:
        Nested egglog expression as string
    """
    # Base case: leaf node (input register)
    if node.is_leaf:
        # Look up egglog variable name
        if node.register in reg_map:
            return reg_map[node.register]
        else:
            # Unknown register - shouldn't happen if DAG is correct
            return f'(RegVal "{node.register}")'

    # Recursive case: instruction node
    inst = node.inst
    op = inst.op_name.lower()

    # Convert children to egglog expressions
    child_exprs = [dag_to_egglog_expr(child, reg_map) for child in node.children]

    # Helper to format immediate values
    def format_imm(imm_value):
        """Format immediate value for egglog expression"""
        if imm_value is None:
            raise ValueError(f"Immediate value is None for instruction: {inst}")
        if isinstance(imm_value, int):
            return f"(ImmVal {imm_value})"
        elif isinstance(imm_value, str):
            # Symbolic immediate (e.g., %hi(.LC1), %lo(.LC1))
            return f"(ImmLabel \"{imm_value}\")"
        else:
            raise ValueError(f"Invalid immediate type {type(imm_value)} for instruction: {inst}")

    # Build egglog expression using explicit instruction type matching
    # This approach is more maintainable and matches the pattern used in local_saturation.py
    match op:
        # R-type instructions: (Op rs1 rs2)
        # RV32I base instructions
        case 'add' | 'sub' | 'and' | 'or' | 'xor' | 'sll' | 'srl' | 'sra' | 'slt' | 'sltu':
            if len(child_exprs) < 2:
                raise ValueError(f"R-type instruction {inst} missing operand children")
            return f"({op.capitalize()} {child_exprs[0]} {child_exprs[1]})"

        # RV32M extension instructions
        case 'mul' | 'mulh' | 'mulhsu' | 'mulhu' | 'div' | 'divu' | 'rem' | 'remu':
            if len(child_exprs) < 2:
                raise ValueError(f"R-type instruction {inst} missing operand children")
            return f"({op.capitalize()} {child_exprs[0]} {child_exprs[1]})"

        # I-type arithmetic/logic instructions: (Op rs1 imm)
        case 'addi' | 'slti' | 'sltiu' | 'xori' | 'ori' | 'andi' | 'slli' | 'srli' | 'srai':
            if len(child_exprs) < 1:
                raise ValueError(f"I-type instruction {inst} missing rs1 child")
            return f"({op.capitalize()} {child_exprs[0]} {format_imm(inst.imm)})"

        # Load instructions: (Op base offset)
        case 'lw' | 'lh' | 'lb' | 'lhu' | 'lbu':
            if len(child_exprs) < 1:
                raise ValueError(f"Load instruction {inst} missing base register child")
            op_map = {'lw': 'Lw', 'lh': 'Lh', 'lb': 'Lb', 'lhu': 'Lhu', 'lbu': 'Lbu'}
            return f"({op_map[op]} {child_exprs[0]} {format_imm(inst.imm)})"

        # Store instructions: (Op base data offset)
        case 'sw' | 'sh' | 'sb':
            if len(child_exprs) < 2:
                raise ValueError(f"Store instruction {inst} missing operand children")
            op_map = {'sw': 'Sw', 'sh': 'Sh', 'sb': 'Sb'}
            return f"({op_map[op]} {child_exprs[0]} {child_exprs[1]} {format_imm(inst.imm)})"

        # U-type instructions: (Op imm) - no source registers
        case 'lui' | 'auipc':
            # U-type instructions don't have source registers, only immediate
            return f"({op.capitalize()} {format_imm(inst.imm)})"

        # Branch instructions: (Op rs1 rs2 offset)
        case 'beq' | 'bne' | 'blt' | 'bge' | 'bltu' | 'bgeu':
            if len(child_exprs) < 2:
                raise ValueError(f"Branch instruction {inst} missing operand children")
            return f"({op.capitalize()} {child_exprs[0]} {child_exprs[1]} {format_imm(inst.imm)})"

        # Pseudo branch instructions
        case 'beqz':  # beqz rs, offset -> beq rs, x0, offset
            if len(child_exprs) < 1:
                raise ValueError(f"beqz instruction {inst} missing rs1 child")
            return f"(Beq {child_exprs[0]} (RegVal \"x0\") {format_imm(inst.imm)})"

        case 'bnez':  # bnez rs, offset -> bne rs, x0, offset
            if len(child_exprs) < 1:
                raise ValueError(f"bnez instruction {inst} missing rs1 child")
            return f"(Bne {child_exprs[0]} (RegVal \"x0\") {format_imm(inst.imm)})"

        # Jump instructions
        case 'jal':
            return f"(Jal {format_imm(inst.imm)})"

        case 'jalr':
            if len(child_exprs) < 1:
                raise ValueError(f"jalr instruction {inst} missing rs1 child")
            return f"(Jalr {child_exprs[0]} {format_imm(inst.imm)})"

        # Unsupported instruction
        case _:
            raise ValueError(
                f"Unsupported instruction for DAG conversion: {inst}\n"
                f"If this is a valid RISC-V instruction, add it to dag_to_egglog_expr() in greenthumb_parser.py"
            )


def normalize_rewrite_pattern(rewrite_str: str) -> str:
    """
    Extract and normalize the rewrite pattern for duplicate detection.

    Extracts just the (birewrite ...) part, removing comments and whitespace.

    Args:
        rewrite_str: Complete rewrite rule string with comments

    Returns:
        Normalized rewrite pattern (just the birewrite expression)
    """
    lines = rewrite_str.split('\n')
    # Find lines starting with (birewrite
    birewrite_lines = []
    in_birewrite = False

    for line in lines:
        stripped = line.strip()
        if stripped.startswith('(birewrite'):
            in_birewrite = True
            birewrite_lines.append(stripped)
        elif in_birewrite and stripped:
            birewrite_lines.append(stripped)
            if stripped.endswith(')') and stripped.count(')') >= 2:
                # Likely end of birewrite
                break

    # Join and normalize whitespace
    pattern = ' '.join(birewrite_lines)
    # Remove extra whitespace
    pattern = ' '.join(pattern.split())
    return pattern


def generate_rewrite_rule(target: text_inst, sequence: List[text_inst],
                          source_file: str = "") -> Tuple[str, str]:
    """
    Generate nested egglog rewrite rule from greenthumb sequence.

    Args:
        target: Target instruction being synthesized
        sequence: Cleaned greenthumb instruction sequence
        source_file: Source file name for documentation

    Returns:
        Tuple of (complete_rule_string, normalized_pattern_for_dedup)
    """
    # Build DAG
    dag_root = build_instruction_dag(sequence, target)

    # Create register abstraction
    reg_map = abstract_register_mapping(target)

    # Convert DAG to nested egglog expression
    nested_expr = dag_to_egglog_expr(dag_root, reg_map)

    # Generate target pattern (LHS of rewrite)
    target_op = target.op_name.capitalize()
    if target.rs1 and target.rs2:
        target_pattern = f"({target_op} rs1 rs2)"
    elif target.rs1 and target.imm is not None:
        target_pattern = f"({target_op} rs1 (ImmVal {target.imm}))"
    else:
        raise ValueError(f"Unsupported target instruction pattern: {target}")

    # Build complete rewrite rule
    lines = []
    lines.append(f";; Length {len(sequence)}: {source_file}")
    lines.append(f";; Greenthumb sequence:")
    for i, inst in enumerate(sequence, 1):
        lines.append(f";;   {i}. {inst}")
    lines.append(f"(birewrite {target_pattern}")
    lines.append(f"           {nested_expr})")

    rule_str = "\n".join(lines)

    # Create normalized pattern for deduplication
    normalized = f"(birewrite {target_pattern} {nested_expr})"

    return rule_str, normalized


def process_instruction_directory(inst_name: str, inst_dir: Path, verbose: bool = False) -> str:
    """
    Process all rewrite files for one instruction.

    Args:
        inst_name: Instruction name (e.g., 'add', 'sub')
        inst_dir: Path to instruction directory
        verbose: Print progress

    Returns:
        Egglog rewrite rules for this instruction (deduplicated)
    """
    lines = []
    lines.append(f";; {'='*60}")
    lines.append(f";; {inst_name.upper()} Rewrites (Greenthumb-generated)")
    lines.append(f";; {'='*60}")

    # Parse target instruction from <inst>.s
    target_file = inst_dir / f"{inst_name}.s"
    if not target_file.exists():
        if verbose:
            print(f"  Warning: {inst_name}.s not found, skipping")
        return ""

    target_insts = parse_greenthumb_file(str(target_file))
    if not target_insts or len(target_insts) == 0:
        if verbose:
            print(f"  Warning: No target instruction found in {inst_name}.s")
        return ""

    target = target_insts[0]  # First instruction is the target

    # Process each best-len-N.s file
    rewrite_files = sorted(inst_dir.glob("best-len*.s"))

    # Track seen patterns for deduplication
    seen_patterns = set()
    generated_count = 0
    skipped_count = 0

    for rewrite_file in rewrite_files:
        try:
            # Parse rewrite sequence, avoiding the target instruction to prevent circular rewrites
            sequence = parse_greenthumb_file(str(rewrite_file), avoid_instruction=target.op_name)

            if not sequence:
                if verbose:
                    print(f"  Skipping {rewrite_file.name}: no instructions")
                continue

            # Generate rewrite rule
            rewrite_rule, normalized_pattern = generate_rewrite_rule(target, sequence, rewrite_file.name)

            # Check for duplicates
            if normalized_pattern in seen_patterns:
                if verbose:
                    print(f"  Skipping {rewrite_file.name}: duplicate pattern")
                skipped_count += 1
                continue

            # Add to output
            seen_patterns.add(normalized_pattern)
            lines.append("")
            lines.append(rewrite_rule)
            generated_count += 1

            if verbose:
                print(f"  Generated rewrite for {rewrite_file.name}")

        except Exception as e:
            if verbose:
                print(f"  Error processing {rewrite_file.name}: {e}")
            # Add as comment for debugging
            lines.append("")
            lines.append(f";; ERROR processing {rewrite_file.name}: {e}")

    if verbose and skipped_count > 0:
        print(f"  Deduplicated: kept {generated_count}, skipped {skipped_count} duplicates")

    lines.append("")
    return "\n".join(lines)


def process_all_greenthumb(greenthumb_results_dir: str, output_file: str, verbose: bool = False) -> int:
    """
    Process all greenthumb instruction directories and generate complete rewrite file.

    Args:
        greenthumb_results_dir: Path to riscv_greenthumb/riscv/results/
        output_file: Output .egg file path
        verbose: Print progress

    Returns:
        Number of instructions processed
    """
    results_path = Path(greenthumb_results_dir)

    if not results_path.exists():
        print(f"Error: Greenthumb results directory not found: {greenthumb_results_dir}")
        return 0

    # Header for output file
    output_lines = []
    output_lines.append(";; " + "="*60)
    output_lines.append(";; Greenthumb-Generated Rewrite Rules")
    output_lines.append(";; Auto-generated from riscv_greenthumb synthesis results")
    output_lines.append(";; " + "="*60)
    output_lines.append("")

    # Process each instruction directory
    inst_count = 0
    inst_dirs = sorted([d for d in results_path.iterdir() if d.is_dir()])

    for inst_dir in inst_dirs:
        inst_name = inst_dir.name

        if verbose:
            print(f"\nProcessing {inst_name}...")

        try:
            rewrites = process_instruction_directory(inst_name, inst_dir, verbose)
            if rewrites:
                output_lines.append(rewrites)
                inst_count += 1
        except Exception as e:
            if verbose:
                print(f"  Error processing {inst_name}: {e}")
            output_lines.append(f";; ERROR: Could not process {inst_name}: {e}")
            output_lines.append("")

    # Write output file
    output_path = Path(output_file)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text("\n".join(output_lines))

    print(f"\nGenerated rewrites for {inst_count} instructions")
    print(f"Output: {output_file}")

    return inst_count


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(
        description='Convert Greenthumb rewrite rules to egglog format',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Process all greenthumb results
  python greenthumb_parser.py

  # With verbose output
  python greenthumb_parser.py -v

  # Custom paths
  python greenthumb_parser.py -i ../riscv_greenthumb/riscv/results -o rewrites/custom.egg

Output:
  Generates Saturation/rewrites/greenthumb_rewrites.egg with nested rewrite rules
        '''
    )

    parser.add_argument('-i', '--input',
                       default='../riscv_greenthumb/riscv/results',
                       help='Path to greenthumb results directory')
    parser.add_argument('-o', '--output',
                       default='rewrites/greenthumb_rewrites.egg',
                       help='Output egglog file path')
    parser.add_argument('-v', '--verbose', action='store_true',
                       help='Verbose output')

    args = parser.parse_args()

    total = process_all_greenthumb(args.input, args.output, args.verbose)

    if total == 0:
        exit(1)
