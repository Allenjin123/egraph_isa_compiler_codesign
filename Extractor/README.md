1. Two Cost Optimization Modes

  Mode 1: program_size (default)
  - Goal: Minimize instruction count (code size)
  - Cost: 1 for all instruction enodes
  - Use case: Memory-constrained environments

  Mode 2: latency
  - Goal: Minimize execution time based on profiling
  - Cost: instruction_latency × block_execution_count
  - Use case: Performance-critical applications


  # Program size mode (default)
  python3 Extractor/src/ILP/ilp_solver.py dijkstra_small_O3 \
      --best_k 3 \
      --node-cost-scale 1.0 \
      --cost-mode program_size \
      --timeout 180

  # Latency mode
  python3 Extractor/src/ILP/ilp_solver.py dijkstra_small_O3 \
      --best_k 3 \
      --node-cost-scale 1.0 \
      --cost-mode latency \
      --timeout 180