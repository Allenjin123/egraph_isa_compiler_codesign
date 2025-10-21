use std::io;
use riscv_dump_parser::DumpParser;

fn main() -> io::Result<()> {
    let args: Vec<String> = std::env::args().collect();
    if args.len() != 2 {
        eprintln!("Usage: {} <dump_file>", args[0]);
        std::process::exit(1);
    }

    let filename = &args[1];

    match DumpParser::parse_file(filename) {
        Ok(program) => {
            println!("Successfully parsed: {}", filename);
            println!();
            program.print_program();
        }
        Err(e) => {
            eprintln!("Error parsing file {}: {}", filename, e);
            std::process::exit(1);
        }
    }

    Ok(())
}

/* metadata for compiler: compile only when test */
#[cfg(test)]
mod tests {
    use riscv_dump_parser::{Instruction, Program};

    #[test]
    fn test_instruction_creation() {
        let instruction = Instruction {
            address: 0x80000000,
            machine_code: 0x00000093,
            mnemonic: "li".to_string(),
            operands: vec!["ra".to_string(), "0".to_string()],
            raw_assembly: "li\tra,0".to_string(),
        };

        assert_eq!(instruction.address, 0x80000000);
        assert_eq!(instruction.mnemonic, "li");
        assert_eq!(instruction.operands.len(), 2);
    }

    #[test]
    fn test_program_creation() {
        let mut program = Program::new();
        program.add_label(0x80000000, "_start".to_string());

        assert!(program.labels.contains_key(&0x80000000));
        assert_eq!(program.labels.get(&0x80000000), Some(&"_start".to_string()));
    }
}