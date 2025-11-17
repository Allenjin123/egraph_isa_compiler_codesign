import argparse
from pathlib import Path
from typing import Optional
from backend.global_parameter import get_required_set, get_removed_instructions

# call PdatScorrWrapper
# create a DSL representation of the input instructions
# example DSL representation: /home/allenjin/Codes/egraph_isa_compiler_codesign/PdatScorrWrapper/PdatDsl/workload/rv32im_no_add.dsl

def create_empty_dsl(output_path: Optional[str] = None) -> str:
    """
    Create an empty DSL file for a general-purpose processor with no constraints.

    This DSL represents a full RV32IM instruction set with no outlawed instructions,
    suitable for a general-purpose processor baseline.

    Args:
        output_path: Optional path to write DSL file. If None, returns DSL as string.

    Returns:
        Path to created DSL file, or DSL content as string if output_path is None

    Example:
        >>> create_empty_dsl('workload/general_purpose.dsl')
        'workload/general_purpose.dsl'
    """
    # Build DSL content for full instruction set
    dsl_lines = []

    # Header comment
    dsl_lines.append("# General-purpose processor DSL (full RV32IM instruction set)")
    dsl_lines.append("# No instruction constraints - all instructions available")
    dsl_lines.append("")

    # Specify full instruction set
    dsl_lines.append("# Full instruction set extensions")
    dsl_lines.append("require RV32I")
    dsl_lines.append("require RV32M")
    dsl_lines.append("")
    dsl_lines.append("# No instructions outlawed - general purpose processor")
    dsl_lines.append("")

    # Join all lines
    dsl_content = "\n".join(dsl_lines)

    # Write to file if output_path is specified
    if output_path:
        output_file = Path(output_path)
        output_file.parent.mkdir(parents=True, exist_ok=True)
        output_file.write_text(dsl_content)
        return str(output_file)
    else:
        # Return DSL content as string
        return dsl_content

def create_dsl(isa_subset: set, output_path: Optional[str] = None) -> str:
    """
    Create a DSL file for PdatScorrWrapper based on the instruction subset.

    The DSL file specifies:
    1. Required instruction set extensions (RV32I, RV32M)
    2. Instructions that can be outlawed (removed from hardware)

    Args:
        isa_subset: Set of instruction opcodes used by the program
        output_path: Optional path to write DSL file. If None, returns DSL as string.

    Returns:
        Path to created DSL file, or DSL content as string if output_path is None

    Raises:
        ValueError: If isa_subset contains unknown instructions

    Example:
        >>> create_dsl({'add', 'sub', 'mul', 'lw'}, 'workload/my_program.dsl')
        'workload/my_program.dsl'
    """
    # Determine the required instruction set (RV32I or RV32IM)
    required_set = get_required_set(isa_subset)

    # Get instructions that can be removed (outlawed)
    removable_instructions = get_removed_instructions(isa_subset, required_set)

    # Build DSL content
    dsl_lines = []

    # Header comment
    dsl_lines.append("# Auto-generated DSL file for instruction subset optimization")
    dsl_lines.append("#")
    dsl_lines.append(f"# Program uses {len(isa_subset)} instructions: {sorted(isa_subset)}")
    dsl_lines.append(f"# Required instruction set: {required_set}")
    dsl_lines.append(f"# Outlawing {len(removable_instructions)} unused instructions")
    dsl_lines.append("")

    # Specify required instruction extensions
    dsl_lines.append("# Specify which instruction extensions are valid (positive constraints)")
    dsl_lines.append("# This tells the optimizer that ONLY instructions from these extensions are valid")
    dsl_lines.append("require RV32I")
    if required_set == "RV32IM":
        dsl_lines.append("require RV32M")
    dsl_lines.append("")

    # Outlaw unused instructions
    if removable_instructions:
        dsl_lines.append("# Outlaw unused instructions (can be removed from hardware)")
        dsl_lines.append("# These instructions are not used by the program")
        for inst in removable_instructions:
            # DSL format uses uppercase instruction names
            dsl_lines.append(f"instruction {inst.upper()}")
        dsl_lines.append("")

    # Join all lines
    dsl_content = "\n".join(dsl_lines)

    # Write to file if output_path is specified
    if output_path:
        output_file = Path(output_path)
        output_file.parent.mkdir(parents=True, exist_ok=True)
        output_file.write_text(dsl_content)
        return str(output_file)
    else:
        # Return DSL content as string
        return dsl_content

def parse_area(isa_subset: set, output_path: Optional[str] = None, use_empty_dsl: bool = False, enable_freq_analysis: bool = False, core_name: str = "ibex"):
    """
    Generate DSL file, run synthesis, and extract chip area and optionally frequency.

    This function:
    1. Creates a DSL file from the instruction subset (or empty DSL if use_empty_dsl=True)
    2. Runs synthesis with the DSL constraints using synth_ibex_with_constraints.sh
    3. Parses the chip area from the synthesis log
    4. Optionally parses frequency from synthesis log if enable_freq_analysis is True

    Args:
        isa_subset: Set of instruction opcodes used by the program
        output_path: Optional path for DSL file. If None, generates in temp location.
        use_empty_dsl: If True, create empty DSL (general purpose processor) instead of using isa_subset
        enable_freq_analysis: If True, parse and return frequency information
        core_name: Name of the core to synthesize (default: "ibex")

    Returns:
        Tuple of (chip_area, frequency) where:
        - chip_area: Area in µm² (micrometers squared)
        - frequency: Frequency in MHz if enable_freq_analysis=True, otherwise None

    Raises:
        ValueError: If synthesis fails or area cannot be parsed
        FileNotFoundError: If synthesis script is not found

    Example:
        >>> area = parse_area({'add', 'sub', 'mul', 'lw'})
        >>> print(f"Chip area: {area} µm²")
        >>> area_gp = parse_area(set(), use_empty_dsl=True)  # General purpose processor
        >>> print(f"GP Chip area: {area_gp} µm²")
    """
    import subprocess
    import re
    import tempfile
    from pathlib import Path

    # Step 1: Create DSL file
    if output_path is None:
        # Create temporary DSL file
        with tempfile.NamedTemporaryFile(mode='w', suffix='.dsl', delete=False, dir='/tmp') as f:
            dsl_path = f.name
            if use_empty_dsl:
                dsl_content = create_empty_dsl()
            else:
                dsl_content = create_dsl(isa_subset)
            f.write(dsl_content)
    else:
        if use_empty_dsl:
            dsl_path = create_empty_dsl(output_path)
        else:
            dsl_path = create_dsl(isa_subset, output_path)

    # Convert to absolute path for synthesis (which runs from different cwd)
    dsl_path_abs = str(Path(dsl_path).absolute())
    print(f"Created DSL file: {dsl_path_abs}")

    # Step 2: Call synthesis script
    # Path to synthesis script
    synth_script = Path(__file__).parent.parent / "PdatScorrWrapper" / "ScorrPdat" / "synth_core_simplified.sh"

    if not synth_script.exists():
        raise FileNotFoundError(f"Synthesis script not found: {synth_script}")

    # Determine output directory for synthesis
    # synth_core.sh creates subdirectory based on DSL filename (e.g., program_variant_0.dsl -> output/program_variant_0/)
    # So we just pass the base 'output' directory
    synth_output_base = synth_script.parent / "output"

    # Run synthesis (use absolute path so it works from any cwd)
    print(f"Running synthesis with {dsl_path_abs}...")
    try:
        result = subprocess.run(
            [str(synth_script), 
             "--gates", 
             "--config", f"configs/{core_name}.yaml",
             dsl_path_abs, 
             str(synth_output_base)],
            capture_output=True,
            text=True,
            timeout=600,  # 10 minute timeout for synthesis
            cwd=synth_script.parent
        )

        # Combine stdout and stderr for parsing (synthesis writes area to stdout)
        synthesis_output = result.stdout + "\n" + result.stderr

        # Note: synth_core.sh may return non-zero even on success due to warnings
        # We'll try to parse the output anyway and only fail if we can't find chip area
        if result.returncode != 0:
            print(f"Warning: Synthesis returned code {result.returncode}, but attempting to parse output...")

    except subprocess.TimeoutExpired:
        raise ValueError("Synthesis timed out after 10 minutes")
    except Exception as e:
        raise ValueError(f"Failed to run synthesis: {e}")

    # Step 3: Parse chip area from output
    # Looking for line: "Total chip area: 59283.107200 µm²"
    area_pattern = r'Total chip area:\s+([\d.]+)\s+µm²'
    match = re.search(area_pattern, synthesis_output)

    if not match:
        # Try alternate pattern without µm² symbol
        area_pattern_alt = r'Total chip area:\s+([\d.]+)'
        match = re.search(area_pattern_alt, synthesis_output)

    if not match:
        # Print output for debugging
        print("Synthesis output (last 50 lines):")
        print('\n'.join(synthesis_output.split('\n')[-50:]))
        raise ValueError("Could not parse chip area from synthesis output")

    chip_area = float(match.group(1))

    print(f"Parsed chip area: {chip_area} µm²")
    print(f"PDK: Skywater SKY130 (sky130_fd_sc_hd, tt corner)")
    print(f"Corner: tt_025C_1v80 (typical, 25°C, 1.8V)")

    # Step 4: Parse frequency from output if enabled
    frequency = None
    if enable_freq_analysis:
        # Looking for pattern: "Timing (10ns target period):" followed by "Optimized: XX.XX MHz"
        frequency_pattern = r'Timing \(\d+ns target period\):\s*\n\s*Optimized:\s+([\d.]+)\s+MHz'
        freq_match = re.search(frequency_pattern, synthesis_output, re.MULTILINE)

        if freq_match:
            frequency = float(freq_match.group(1))
            print(f"Parsed frequency: {frequency} MHz")
        else:
            print("Warning: Could not parse frequency from synthesis output")

    # Clean up temporary file if created
    if output_path is None:
        try:
            Path(dsl_path_abs).unlink()
        except:
            pass

    return chip_area, frequency