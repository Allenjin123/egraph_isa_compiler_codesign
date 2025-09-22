use std::fs;
use std::io::{self, BufRead, BufReader};
use crate::types::{Instruction, Section, Program};

pub struct DumpParser;

impl DumpParser {
    pub fn parse_file(filename: &str) -> io::Result<Program> {
        let file = fs::File::open(filename)?;
        let reader = BufReader::new(file);
        let mut program = Program::new();
        let mut current_section: Option<Section> = None;

        for line in reader.lines() {
            let line = line?;
            let trimmed = line.trim();

            if trimmed.is_empty() {
                continue;
            }

            if let Some(file_format) = Self::parse_file_format(trimmed) {
                program.file_format = file_format;
                continue;
            }

            if let Some(section_name) = Self::parse_section_header(trimmed) {
                if let Some(section) = current_section.take() {
                    program.sections.push(section);
                }
                current_section = Some(Section {
                    name: section_name,
                    instructions: Vec::new(),
                });
                continue;
            }

            if let Some((address, label)) = Self::parse_label_line(trimmed) {
                program.add_label(address, label);
                continue;
            }

            if let Some(instruction) = Self::parse_instruction_line(trimmed) {
                if let Some(ref mut section) = current_section {
                    section.instructions.push(instruction);
                }
            }
        }

        if let Some(section) = current_section {
            program.sections.push(section);
        }

        Ok(program)
    }

    fn parse_file_format(line: &str) -> Option<String> {
        if line.contains("file format") {
            let parts: Vec<&str> = line.split_whitespace().collect();
            if parts.len() >= 4 {
                return Some(parts[parts.len() - 1].to_string());
            }
        }
        None
    }

    fn parse_section_header(line: &str) -> Option<String> {
        if line.starts_with("Disassembly of section") {
            return line
                .strip_prefix("Disassembly of section ")?
                .trim_end_matches(':')
                .to_string()
                .into();
        }
        None
    }

    fn parse_label_line(line: &str) -> Option<(u32, String)> {
        if line.contains('<') && line.ends_with(">:") {
            let space_pos = line.find(' ')?;
            let address = u32::from_str_radix(&line[..space_pos], 16).ok()?;

            let label_part = &line[space_pos + 1..];
            let start = label_part.find('<')?;
            let end = label_part.find('>')?;
            let label = label_part[start + 1..end].to_string();

            return Some((address, label));
        }
        None
    }

    fn parse_instruction_line(line: &str) -> Option<Instruction> {
        let colon_pos = line.find(':')?;

        // Skip label lines
        if line.contains('<') && line.contains('>') {
            return None;
        }

        let address = u32::from_str_radix(&line[..colon_pos], 16).ok()?;
        let rest = &line[colon_pos + 1..];

        let parts = Self::split_instruction_parts(rest);
        if parts.len() < 2 {
            return None;
        }

        let machine_code = u32::from_str_radix(&parts[0], 16).ok()?;
        let assembly_part = parts[1..].join(" ");

        let (mnemonic, operands) = Self::parse_assembly_parts(&assembly_part);

        Some(Instruction {
            address,
            machine_code,
            mnemonic,
            operands,
            raw_assembly: assembly_part,
        })
    }

    fn split_instruction_parts(input: &str) -> Vec<String> {
        let mut parts = Vec::new();
        for part in input.split('\t') {
            let trimmed = part.trim();
            if !trimmed.is_empty() {
                parts.push(trimmed.to_string());
            }
        }
        parts
    }

    fn parse_assembly_parts(assembly: &str) -> (String, Vec<String>) {
        let asm_parts: Vec<&str> = assembly.split_whitespace().collect();
        let mnemonic = asm_parts.first().unwrap_or(&"").to_string();

        let operands = if asm_parts.len() > 1 {
            let operand_str = asm_parts[1..].join(" ");
            let clean_operands = Self::remove_comments(&operand_str);

            if clean_operands.trim().is_empty() {
                Vec::new()
            } else {
                clean_operands
                    .split(',')
                    .map(|s| s.trim().to_string())
                    .collect()
            }
        } else {
            Vec::new()
        };

        (mnemonic, operands)
    }

    fn remove_comments(input: &str) -> String {
        if let Some(comment_pos) = input.find('#') {
            input[..comment_pos].trim().to_string()
        } else {
            input.to_string()
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_parse_file_format() {
        let line = "a.out:     file format elf64-littleriscv";
        let result = DumpParser::parse_file_format(line);
        assert_eq!(result, Some("elf64-littleriscv".to_string()));
    }

    #[test]
    fn test_parse_section_header() {
        let line = "Disassembly of section .text:";
        let result = DumpParser::parse_section_header(line);
        assert_eq!(result, Some(".text".to_string()));
    }

    #[test]
    fn test_parse_label_line() {
        let line = "80000000 <_start>:";
        let result = DumpParser::parse_label_line(line);
        assert_eq!(result, Some((0x80000000, "_start".to_string())));
    }

    #[test]
    fn test_parse_instruction_line() {
        let line = "80000000:\t00000093\t\tli\tra,0";
        let result = DumpParser::parse_instruction_line(line);

        assert!(result.is_some());
        let instruction = result.unwrap();
        assert_eq!(instruction.address, 0x80000000);
        assert_eq!(instruction.machine_code, 0x00000093);
        assert_eq!(instruction.mnemonic, "li");
        assert_eq!(instruction.operands, vec!["ra", "0"]);
    }

    #[test]
    fn test_remove_comments() {
        let input = "ra,0 # load immediate";
        let result = DumpParser::remove_comments(input);
        assert_eq!(result, "ra,0");
    }

    #[test]
    fn test_parse_assembly_parts() {
        let assembly = "li ra,0 # load immediate";
        let (mnemonic, operands) = DumpParser::parse_assembly_parts(assembly);
        assert_eq!(mnemonic, "li");
        assert_eq!(operands, vec!["ra", "0"]);
    }
}