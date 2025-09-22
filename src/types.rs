use std::collections::HashMap;

#[derive(Debug, Clone)]
pub struct Instruction {
    pub address: u32,
    pub machine_code: u32,
    pub mnemonic: String,
    pub operands: Vec<String>,
    pub raw_assembly: String,
}

#[derive(Debug)]
pub struct Section {
    pub name: String,
    pub instructions: Vec<Instruction>,
}

#[derive(Debug)]
pub struct Program {
    pub file_format: String,
    pub sections: Vec<Section>,
    pub labels: HashMap<u32, String>,
}

impl Program {
    pub fn new() -> Self {
        Self {
            file_format: String::new(),
            sections: Vec::new(),
            labels: HashMap::new(),
        }
    }

    pub fn add_label(&mut self, address: u32, label: String) {
        self.labels.insert(address, label);
    }

    pub fn get_label(&self, address: u32) -> Option<&String> {
        self.labels.get(&address)
    }

    pub fn get_instruction_count(&self) -> usize {
        self.sections.iter().map(|s| s.instructions.len()).sum()
    }

    pub fn print_program(&self) {
        println!("File format: {}", self.file_format);
        println!();

        for section in &self.sections {
            println!("Section: {}", section.name);
            println!("----------------------------------------");

            for instruction in &section.instructions {
                if let Some(label) = self.labels.get(&instruction.address) {
                    println!();
                    println!("{:08x} <{}>:", instruction.address, label);
                }

                println!("{:08x}:\t{:08x}\t\t{}",
                    instruction.address,
                    instruction.machine_code,
                    instruction.raw_assembly
                );
            }
            println!();
        }
    }
}

impl Default for Program {
    fn default() -> Self {
        Self::new()
    }
}