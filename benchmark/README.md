1. benchmark/run_all_spike_counts.sh - Run Spike for all workloads in parallel

  Runs spike_instruction_count.sh for all 6 workloads in parallel:
  - patricia_O3
  - dijkstra_small_O3
  - basicmath_small_O3
  - bitcnts_O3
  - qsort_small_O3
  - qsort_large_O3

  Output: Creates tmp/{program}_spike_run.log for each workload's execution log, plus the usual spike output directories.

  2. benchmark/run_all_block_analysis.sh - Run block execution analysis for all workloads

  Runs analyze_block_execution.py for all workloads to generate block_execution_counts.txt files.

  Requirements:
  - Spike counts must be run first
  - Basic blocks must exist in output/frontend/{program}/basic_blocks/

  Output: Creates output/frontend/{program}/block_execution_counts.txt for each workload.

  3. benchmark/run_complete_analysis.sh - Complete pipeline (both steps)

  Runs both steps in sequence:
  1. Spike instruction counts (parallel)
  2. Block execution analysis (sequential)

  Usage:

  # Run complete pipeline (recommended)
  cd benchmark
  ./run_complete_analysis.sh

  # Or run individually:
  ./run_all_spike_counts.sh      # Step 1: Spike counts
  ./run_all_block_analysis.sh     # Step 2: Block analysis

  # Or run single workload:
  ./spike_instruction_count.sh network/patricia/patricia_O3_clean.s