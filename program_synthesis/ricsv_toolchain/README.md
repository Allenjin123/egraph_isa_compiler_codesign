### Additional rewrite rules based on ricsv library

Register	Meaning
a0	Accumulator (final product)
a1	Multiplier
a2	Multiplicand
a3	Temporary bit test

Algorithm:

Initialize accumulator (a0) = 0

For each bit of a1 (the multiplier):

If the least significant bit (LSB) of a1 is 1 → add a2 (the current multiplicand) to a0

Shift a1 right by 1 (move to next bit)

Shift a2 left by 1 (equivalent to multiplying by 2)

Stop when a1 becomes 0

Return the final a0 = product

This is a pure RV32I implementation — no mul instruction is needed.

The Algorithm: Binary Long Division

  The core is __udivdi3 (unsigned division), which implements binary long division - the same algorithm you'd use by hand in binary!

  Phase 1: Align the Divisor (.L1)

  .L1:
    blez  a2, .L2         # Stop if divisor sign bit set
    slli  a2, a2, 1       # divisor <<= 1
    slli  a3, a3, 1       # bit_position <<= 1  
    bgtu  a1, a2, .L1     # Continue while dividend > divisor

  Goal: Shift divisor left until it's just larger than dividend.

  Phase 2: Subtract and Shift (.L3-.L4)

  .L3:
    bltu  a1, a2, .L4     # if dividend < divisor, skip
    sub   a1, a1, a2      # dividend -= divisor
    or    a0, a0, a3      # quotient |= bit_position (set this bit)
  .L4:
    srli  a3, a3, 1       # bit_position >>= 1
    srli  a2, a2, 1       # divisor >>= 1
    bnez  a3, .L3         # Repeat until bit_position == 0

  Goal: For each bit position, if we can subtract, do it and set that bit in the quotient.

  Example: 17 ÷ 5

  Initial:
    dividend (a1) = 17 = 0b10001
    divisor  (a2) = 5  = 0b00101
    bit_pos  (a3) = 1  = 0b00001
    quotient (a0) = 0

  Phase 1 - Align:
    a2=5,  a3=1  → 17 > 5, continue
    a2=10, a3=2  → 17 > 10, continue  
    a2=20, a3=4  → 17 < 20, stop alignment

  Phase 2 - Divide:
    Iteration 1: a2=20, a3=4
      17 < 20 → skip, just shift right
      
    Iteration 2: a2=10, a3=2
      17 >= 10 → subtract: 17-10=7, quotient |= 2 = 2
      
    Iteration 3: a2=5, a3=1
      7 >= 5 → subtract: 7-5=2, quotient |= 1 = 3
      
    Iteration 4: a2=2, a3=0
      Stop (bit_position = 0)

  Result: quotient=3, remainder=2 ✓

  The Other Operations

  __umoddi3 (unsigned modulo)

  jal   __udivdi3    # Compute division
  move  a0, a1       # Return remainder (already in a1!)
  Clever! Division already computes remainder as a side effect.

  __divdi3 (signed division)

  .L10:
    neg   a0, a0              # dividend = -dividend
  .L11:
    neg   a1, a1              # divisor = -divisor
  .L12:
    jal   __udivdi3           # Do unsigned division
    neg   a0, a0              # Negate result based on signs
  Strategy: Convert to unsigned, divide, then fix the sign.

  __moddi3 (signed modulo)

  Similar: handle signs, call unsigned division, return signed remainder.

  Why This Matters

  Performance comparison:

  Summary Table

  | Operation | Instructions     | Conservative Cycles | vs Hardware M-ext                  |
  |-----------|------------------|---------------------|------------------------------------|
  | mul       | ~7/iter × 16 avg | ~320 cycles         | 40-80× slower (M-ext: 2-4 cycles)  |
  | divu      | 21               | ~400 cycles         | 75-150× slower (M-ext: 2-4 cycles) |
  | div       | 31               | ~430 cycles         | 80-165× slower (M-ext: 2-4 cycles) |
  | remu      | 22               | ~400 cycles         | 75-150× slower (M-ext: 2-4 cycles) |
  | rem       | 32               | ~400 cycles         | 80-165× slower (M-ext: 2-4 cycles) |



