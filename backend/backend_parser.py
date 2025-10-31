import argparse
import matplotlib.pyplot as plt
from pathlib import Path
from typing import Optional
import backend.global_parameter as gp
import backend.latency_parser as lp
import backend.area_parser as ap
import Saturation.data_structure as ds
# parse user input arguments
# - input_files: path to the input files
# parse input_files, maintain a set structures for each file to analyze how many instructions are used
# example input_files: 
# └── bitcnts_small_O3
#     ├── variant_0
#     │   ├── basic_blocks
#     │       └── 0.txt
#     │       └── 1.txt
#     └── variant_1
#         ├── basic_blocks
#             └── 0.txt
#             └── 1.txt



class program():
    def __init__(self, name, path):
        self.name = name
        # path to the rewritten program directory - convert to Path object
        self.path = Path(path) if isinstance(path, str) else path
        # variants, a list of text program data structures
        self.variants = []
        # summary information for each variant
        self.subsets = []
        self.areas = []
        self.delays = []

    def parse_variants(self):
        """
        Parse all variant directories in the program path.

        Raises:
            FileNotFoundError: If path doesn't exist
            ValueError: If path is not a directory
        """
        # Validate path exists
        if not self.path.exists():
            raise FileNotFoundError(f"Program path does not exist: {self.path}")

        # Validate path is a directory
        if not self.path.is_dir():
            raise ValueError(f"Program path is not a directory: {self.path}")

        # Parse each variant directory
        variant_count = 0
        for variant_path in sorted(self.path.iterdir()):
            if variant_path.is_dir():
                prog = ds.text_program(f"{self.name}_variant_{variant_count}")
                # Each variant has a 'sections' subdirectory containing section folders
                sections_path = variant_path / "sections"
                prog.from_directory(str(sections_path), suffix="")
                self.variants.append(prog)
                variant_count += 1

        if variant_count == 0:
            print(f"Warning: No variant directories found in {self.path}")

    def parse_subsets(self, output_dir: Optional[str] = None):
        """
        Parse instruction subsets, areas, and delays for each variant.

        Args:
            output_dir: Optional directory to save intermediate DSL files.
                       If provided, creates <output_dir>/variant_<i>.dsl for each variant.

        Raises:
            ValueError: If variants haven't been parsed yet
        """
        if not self.variants:
            raise ValueError("No variants found. Call parse_variants() first.")

        # Create output directory if specified
        if output_dir:
            output_path = Path(output_dir)
            output_path.mkdir(parents=True, exist_ok=True)
            print(f"Saving intermediate DSL files to: {output_path}")

        for i, variant in enumerate(self.variants):
            subset = set()
            # count number of unique instructions in the variant
            for section in variant.sections.values():
                for block in section.basic_blocks:
                    for instr in block.inst_list:  # Fixed: was 'instructions'
                        subset.add(instr.op_name)  # Fixed: was 'opcode'
            self.subsets.append(subset)

            # Generate DSL file path for this variant
            dsl_file_path = None
            if output_dir:
                dsl_file_path = str(Path(output_dir) / f"variant_{i}.dsl")

            # Parse area and latency for this variant
            self.areas.append(ap.parse_area(subset, dsl_file_path))
            self.delays.append(lp.parse_latency(variant))

            print(f"Variant {i}: {len(subset)} unique instructions, area: {self.areas[-1]} µm², latency: {self.delays[-1]}")
            if dsl_file_path:
                print(f"  DSL saved to: {dsl_file_path}")
    
    def get_pareto_frontier(self):
        pareto_frontier = []
        for i in range(len(self.variants)):
            dominated = False
            for j in range(len(self.variants)):
                if i != j:
                    if (self.areas[j] <= self.areas[i] and self.delays[j] < self.delays[i]) or \
                       (self.areas[j] < self.areas[i] and self.delays[j] <= self.delays[i]):
                        dominated = True
                        break
            if not dominated:
                pareto_frontier.append((i, self.areas[i], self.delays[i]))
        return pareto_frontier
    
    def visualize_pareto_frontier(self, output_path, pareto_frontier=None):

        plt.figure(figsize=(10, 6))
        plt.scatter(self.areas, self.delays, color='blue', label='Variants')

        if pareto_frontier is None:
            pareto_frontier = self.get_pareto_frontier()
        pareto_areas = [p[1] for p in pareto_frontier]
        pareto_delays = [p[2] for p in pareto_frontier]
        plt.scatter(pareto_areas, pareto_delays, color='red', label='Pareto Frontier')

        plt.title('Pareto Frontier of Program Variants')
        plt.xlabel('Area (µm²)')
        plt.ylabel('Latency')
        plt.legend()
        plt.grid(True)
        plt.savefig(output_path)
        plt.close()
    
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Parse program variants for instruction subsets, area, and latency.")
    #parser.add_argument("input_path", type=str, help="Path to the program directory containing variants.")
    args = parser.parse_args()


    prog = program("test", "../ilp_outputs/test")
    prog.parse_variants()
    prog.parse_subsets()

    pareto_frontier = prog.get_pareto_frontier()
    print("Pareto Frontier (Variant Index, Area (µm²), Latency):")
    for variant_index, area, latency in pareto_frontier:
        print(f"Variant {variant_index}: Area = {area} µm², Latency = {latency}")    

    prog.visualize_pareto_frontier("pareto_frontier.png")

