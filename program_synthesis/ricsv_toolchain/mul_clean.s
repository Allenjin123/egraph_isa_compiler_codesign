    .align 2
__mul:
    addi   sp, sp, -8
    sw     a2, 0(sp)
    sw     a3, 4(sp)
    add    a2, a0, x0
    addi   a0, x0, 0
.Mul_loop:
    andi   a3, a1, 1
    beq    a3, x0, .Mul_skip
    add    a0, a0, a2
.Mul_skip:
    srli   a1, a1, 1
    slli   a2, a2, 1
    bne    a1, x0, .Mul_loop
    lw     a2, 0(sp)
    lw     a3, 4(sp)
    addi   sp, sp, 8
    jalr   x0, ra, 0