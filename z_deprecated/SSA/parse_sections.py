import re
import os

def parse_dump_file(file_path):
    sections = {}
    current_section = None
    current_code = []

    with open(file_path, 'r') as f:
        lines = f.readlines()

    for line in lines:
        # Match section header like "000100b4 <exit>:"
        match = re.match(r'(\w+) <([^>]+)>:', line.strip())
        if match:
            if current_section:
                sections[current_section] = '\n'.join(current_code)
            current_section = match.group(2)
            current_code = [line.strip()]
        elif current_section:
            current_code.append(line.strip())

    if current_section:
        sections[current_section] = '\n'.join(current_code)

    return sections

def create_folders_and_files(sections, base_dir, target_sections=None):
    """
    Create folders and files for parsed sections.
    
    Args:
        sections: Dictionary of section_name -> code
        base_dir: Base directory for output
        target_sections: List of section names to process (None = process all)
    """
    for section_name, code in sections.items():
        # If target_sections is specified, only process those sections
        if target_sections is not None and section_name not in target_sections:
            continue
            
        folder_path = os.path.join(base_dir, section_name)
        os.makedirs(folder_path, exist_ok=True)
        file_path = os.path.join(folder_path, 'section.txt')
        with open(file_path, 'w') as f:
            f.write(code)

if __name__ == "__main__":
    dump_file = "/home/yjrcs/Egglog_DSL/SSA/basicmath_small_O0.dump"
    base_dir = "/home/yjrcs/Egglog_DSL/SSA/sections"
    os.makedirs(base_dir, exist_ok=True)
    sections = parse_dump_file(dump_file)
    create_folders_and_files(sections, base_dir)
    print(f"Created {len(sections)} section folders.")