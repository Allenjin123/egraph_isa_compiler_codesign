    .text
    .align 2
    .globl __udivsi3
    .type __udivsi3, @function
__udivsi3:
    addi   sp, sp, -24
    sw     x1, 0(sp)
    sw     x4, 4(sp)
    sw     x5, 8(sp)
    sw     x6, 12(sp)
    sw     x7, 16(sp)
    sw     x8, 20(sp)
    add    x2, a0, x0
    add    x3, a1, x0
    bne    x3, x0, .Ldivu_start
    addi   x1, x0, -1
    jal    x0, .Ldivu_done
.Ldivu_start:
    addi   x5, x0, 1
    add    x6, x2, x0
    add    x4, x3, x0
    bltu   x4, x6, .Ldivu_align
    addi   x1, x0, 0
    jal    x0, .Ldivu_loop
.Ldivu_align:
    slli   x7, x4, 1
    srai   x8, x4, 31
    bne    x8, x0, .Ldivu_loop_init
    slli   x4, x4, 1
    slli   x5, x5, 1
    bgtu   x6, x4, .Ldivu_align
.Ldivu_loop_init:
    addi   x1, x0, 0
.Ldivu_loop:
    bltu   x6, x4, .Ldivu_skip
    sub    x6, x6, x4
    or     x1, x1, x5
.Ldivu_skip:
    srli   x5, x5, 1
    srli   x4, x4, 1
    bne    x5, x0, .Ldivu_loop
.Ldivu_done:
    add    a0, x1, x0
    lw     x1, 0(sp)
    lw     x4, 4(sp)
    lw     x5, 8(sp)
    lw     x6, 12(sp)
    lw     x7, 16(sp)
    lw     x8, 20(sp)
    addi   sp, sp, 24
    jalr   x0, ra, 0
    .align 2
    .globl __umodsi3
    .type __umodsi3, @function
__umodsi3:
    addi   sp, sp, -24
    sw     x1, 0(sp)
    sw     x4, 4(sp)
    sw     x5, 8(sp)
    sw     x6, 12(sp)
    sw     x7, 16(sp)
    sw     x8, 20(sp)
    add    x2, a0, x0
    add    x3, a1, x0
    bne    x3, x0, .Lremu_start
    add    x1, x2, x0
    jal    x0, .Lremu_done
.Lremu_start:
    addi   x5, x0, 1
    add    x6, x2, x0
    add    x4, x3, x0
    bltu   x4, x6, .Lremu_align
    addi   x7, x0, 0
    jal    x0, .Lremu_loop
.Lremu_align:
    slli   x7, x4, 1
    srai   x8, x4, 31
    bne    x8, x0, .Lremu_loop_init
    slli   x4, x4, 1
    slli   x5, x5, 1
    bgtu   x6, x4, .Lremu_align
.Lremu_loop_init:
    addi   x7, x0, 0
.Lremu_loop:
    bltu   x6, x4, .Lremu_skip
    sub    x6, x6, x4
    or     x7, x7, x5
.Lremu_skip:
    srli   x5, x5, 1
    srli   x4, x4, 1
    bne    x5, x0, .Lremu_loop
    add    x1, x6, x0
.Lremu_done:
    add    a0, x1, x0
    lw     x1, 0(sp)
    lw     x4, 4(sp)
    lw     x5, 8(sp)
    lw     x6, 12(sp)
    lw     x7, 16(sp)
    lw     x8, 20(sp)
    addi   sp, sp, 24
    jalr   x0, ra, 0
    .align 2
    .globl __divsi3
    .type __divsi3, @function
__divsi3:
    addi   sp, sp, -56
    sw     x1, 0(sp)
    sw     x4, 4(sp)
    sw     x5, 8(sp)
    sw     x6, 12(sp)
    sw     x7, 16(sp)
    sw     x8, 20(sp)
    sw     x9, 24(sp)
    sw     x10, 28(sp)
    sw     x11, 32(sp)
    sw     x12, 36(sp)
    sw     x13, 40(sp)
    sw     x14, 44(sp)
    sw     x15, 48(sp)
    sw     x16, 52(sp)
    add    x2, a0, x0
    add    x3, a1, x0
    xor    x7, x2, x3
    srai   x7, x7, 31
    srai   x8, x2, 31
    xor    x9, x2, x8
    sub    x9, x9, x8
    srai   x10, x3, 31
    xor    x11, x3, x10
    sub    x11, x11, x10
    bne    x11, x0, .Ldiv_start
    addi   x1, x0, -1
    jal    x0, .Ldiv_apply_sign
.Ldiv_start:
    addi   x5, x0, 1
    add    x6, x9, x0
    add    x4, x11, x0
    bltu   x4, x6, .Ldiv_align
    addi   x1, x0, 0
    jal    x0, .Ldiv_loop
.Ldiv_align:
    slli   x12, x4, 1
    srai   x13, x4, 31
    bne    x13, x0, .Ldiv_loop_init
    slli   x4, x4, 1
    slli   x5, x5, 1
    bgtu   x6, x4, .Ldiv_align
.Ldiv_loop_init:
    addi   x1, x0, 0
.Ldiv_loop:
    bltu   x6, x4, .Ldiv_skip
    sub    x6, x6, x4
    or     x1, x1, x5
.Ldiv_skip:
    srli   x5, x5, 1
    srli   x4, x4, 1
    bne    x5, x0, .Ldiv_loop
.Ldiv_apply_sign:
    xor    x1, x1, x7
    sub    x1, x1, x7
    add    a0, x1, x0
    lw     x1, 0(sp)
    lw     x4, 4(sp)
    lw     x5, 8(sp)
    lw     x6, 12(sp)
    lw     x7, 16(sp)
    lw     x8, 20(sp)
    lw     x9, 24(sp)
    lw     x10, 28(sp)
    lw     x11, 32(sp)
    lw     x12, 36(sp)
    lw     x13, 40(sp)
    lw     x14, 44(sp)
    lw     x15, 48(sp)
    lw     x16, 52(sp)
    addi   sp, sp, 56
    jalr   x0, ra, 0
    .align 2
    .globl __modsi3
    .type __modsi3, @function
__modsi3:
    addi   sp, sp, -56
    sw     x1, 0(sp)
    sw     x4, 4(sp)
    sw     x5, 8(sp)
    sw     x6, 12(sp)
    sw     x7, 16(sp)
    sw     x8, 20(sp)
    sw     x9, 24(sp)
    sw     x10, 28(sp)
    sw     x11, 32(sp)
    sw     x12, 36(sp)
    sw     x13, 40(sp)
    sw     x14, 44(sp)
    sw     x15, 48(sp)
    sw     x16, 52(sp)
    add    x2, a0, x0
    add    x3, a1, x0
    srai   x7, x2, 31
    srai   x8, x2, 31
    xor    x9, x2, x8
    sub    x9, x9, x8
    srai   x10, x3, 31
    xor    x11, x3, x10
    sub    x11, x11, x10
    bne    x11, x0, .Lrem_start
    add    x1, x2, x0
    jal    x0, .Lrem_apply_sign
.Lrem_start:
    addi   x5, x0, 1
    add    x6, x9, x0
    add    x4, x11, x0
    bltu   x4, x6, .Lrem_align
    addi   x12, x0, 0
    jal    x0, .Lrem_loop
.Lrem_align:
    slli   x12, x4, 1
    srai   x13, x4, 31
    bne    x13, x0, .Lrem_loop_init
    slli   x4, x4, 1
    slli   x5, x5, 1
    bgtu   x6, x4, .Lrem_align
.Lrem_loop_init:
    addi   x12, x0, 0
.Lrem_loop:
    bltu   x6, x4, .Lrem_skip
    sub    x6, x6, x4
    or     x12, x12, x5
.Lrem_skip:
    srli   x5, x5, 1
    srli   x4, x4, 1
    bne    x5, x0, .Lrem_loop
    add    x1, x6, x0
.Lrem_apply_sign:
    xor    x1, x1, x7
    sub    x1, x1, x7
    add    a0, x1, x0
    lw     x1, 0(sp)
    lw     x4, 4(sp)
    lw     x5, 8(sp)
    lw     x6, 12(sp)
    lw     x7, 16(sp)
    lw     x8, 20(sp)
    lw     x9, 24(sp)
    lw     x10, 28(sp)
    lw     x11, 32(sp)
    lw     x12, 36(sp)
    lw     x13, 40(sp)
    lw     x14, 44(sp)
    lw     x15, 48(sp)
    lw     x16, 52(sp)
    addi   sp, sp, 56
    jalr   x0, ra, 0
