	.file	"tarfind.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	bge	zero, a0, .L39
	addi	sp,sp,-64
	sw	s8,28(sp)
	lui	s8,%hi(seed)
	lw	a5,%lo(seed)(s8)
	sw	s2,52(sp)
	sw	s7,32(sp)
	lui	s2,%hi(heap)
	lui	t2,%hi(heap+8995)
	lui	s7,%hi(heap+5654)
	lui	a7, 524288
	lui	t3, 269413
	lui	t1, 3
	lui	a6, 322639
	sw	s1,56(sp)
	sw	s3,48(sp)
	sw	s4,44(sp)
	sw	s5,40(sp)
	sw	s6,36(sp)
	sw	s9,24(sp)
	sw	s10,20(sp)
	sw	s0,60(sp)
	sw	s11,16(sp)
	addi	s2,s2,%lo(heap)
	addi	t2,t2,%lo(heap+8995)
	addi	s7,s7,%lo(heap+5654)
	addi	t3,t3,-403
	addi	t1,t1,57
	addi	a7,a7,-1
	addi	a6,a6,-945
	addi	a1, zero, 0
	lui	s9,%hi(heap+5)
	lui	s10,%hi(heap+4369)
	addi	s3, zero, 257
	addi	s5, zero, 1
	addi	s4, zero, 3
	addi	s6, zero, 2
	addi	s1, zero, 48
	addi	t4, zero, 26
.L17:
	addi	a3,s9,%lo(heap+5)
	addi	a2, s2, 0
	addi	s0, zero, 0
	sw	a1,12(sp)
	addi	s11, a0, 0
.L8:
	sub	a1, zero, a2
	andi	a4,a1,3
	beq	a4,zero,.L18
	sb	zero,0(a2)
	andi	a1,a1,2
	beq	a1,zero,.L19
	sb	zero,1(a2)
	bne	a4,s4,.L20
	sb	zero,2(a2)
	addi	t5, s4, 0
	addi	t0, zero, 254
.L3:
	sub	a0,s3,a4
	add	a4,a4,s0
	add	a4,s2,a4
	andi	t6,a0,-4
	add	a1,t6,a4
.L5:
	sw	zero,0(a4)
	addi	a4,a4,4
	bne	a1,a4,.L5
	beq	t6,a0,.L6
	add	t5,t6,t5
	add	t5,a2,t5
	sb	zero,0(t5)
	sub	t0,t0,t6
	beq	t0,s5,.L6
	sb	zero,1(t5)
	beq	t0,s6,.L6
	sb	zero,2(t5)
.L6:
	sb	s1,156(a2)
	addi	a0, a2, 0
.L7:
	mul	a5,a5,t3
	addi	a0,a0,1
	add	a5,a5,t1
	and	a5,a5,a7
	srai	a4,a5,16
	mulhu	a1,a4,a6
	srli	a1,a1,3
	mul	a1,a1,t4
	sub	a4,a4,a1
	addi	a4,a4,65
	sb	a4,-1(a0)
	bne	a3,a0,.L7
	sb	s1,124(a2)
	addi	a2,a2,257
	addi	a3,a3,258
	addi	s0,s0,257
	bne	a2,t2,.L8
	lw	a1,12(sp)
	addi	a0, s11, 0
	addi	t0,s10,%lo(heap+4369)
.L16:
	addi	t6, s2, 0
.L15:
	lbu	a3,0(t6)
	addi	a2, t6, 0
	addi	a4, t0, 0
	bne	a3,zero,.L9
	jal	zero, .L10
.L43:
	bne	a3,t5,.L13
	lbu	a3,0(a2)
	beq	a3,zero,.L10
.L9:
	lbu	t5,0(a4)
	addi	a2,a2,1
	addi	a4,a4,1
	bne	t5,zero,.L43
.L13:
	addi	t6,t6,257
	bne	t6,t2,.L15
.L14:
	addi	t0,t0,257
	bne	t0,s7,.L16
	addi	a1,a1,1
	bne	a1,a0,.L17
	lw	s0,60(sp)
	lui	a4,%hi(heap+8996)
	lui	a3, 2
	addi	a4,a4,%lo(heap+8996)
	lui	a0,%hi(heap_ptr)
	lui	a1,%hi(heap_end)
	addi	a3,a3,804
	lui	a2,%hi(heap_requested)
	sw	a5,%lo(seed)(s8)
	sw	a4,%lo(heap_ptr)(a0)
	sw	a4,%lo(heap_end)(a1)
	sw	a3,%lo(heap_requested)(a2)
	lw	s1,56(sp)
	lw	s2,52(sp)
	lw	s3,48(sp)
	lw	s4,44(sp)
	lw	s5,40(sp)
	lw	s6,36(sp)
	lw	s7,32(sp)
	lw	s8,28(sp)
	lw	s9,24(sp)
	lw	s10,20(sp)
	lw	s11,16(sp)
	addi	sp,sp,64
	jalr	zero, ra, 0
.L10:
	lbu	a4,0(a4)
	beq	a4,zero,.L14
	addi	t6,t6,257
	bne	t6,t2,.L15
	jal	zero, .L14
.L19:
	addi	t5, zero, 1
	addi	t0, zero, 256
	jal	zero, .L3
.L18:
	addi	t5, zero, 0
	addi	t0, zero, 257
	jal	zero, .L3
.L20:
	addi	t5, zero, 2
	addi	t0, zero, 255
	jal	zero, .L3
.L39:
	jalr	zero, ra, 0
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.type	benchmark_body.constprop.0, @function
benchmark_body.constprop.0:
	addi	sp,sp,-48
	sw	s4,28(sp)
	lui	s4,%hi(seed)
	lw	a1,%lo(seed)(s4)
	sw	s2,36(sp)
	lui	t6,%hi(heap)
	lui	t4,%hi(heap+8995)
	lui	s2,%hi(heap+5654)
	lui	a6, 524288
	lui	t1, 269413
	lui	a7, 3
	lui	a0, 322639
	sw	s0,44(sp)
	sw	s1,40(sp)
	sw	s3,32(sp)
	sw	s5,24(sp)
	sw	s6,20(sp)
	sw	s7,16(sp)
	sw	s8,12(sp)
	sw	s9,8(sp)
	sw	s10,4(sp)
	sw	s11,0(sp)
	addi	t6,t6,%lo(heap)
	addi	t4,t4,%lo(heap+8995)
	addi	s2,s2,%lo(heap+5654)
	addi	t1,t1,-403
	addi	a7,a7,57
	addi	a6,a6,-1
	addi	a0,a0,-945
	addi	s3, zero, 47
	lui	s6,%hi(heap+5)
	lui	s5,%hi(heap+4369)
	addi	t0, zero, 257
	addi	s0, zero, 1
	addi	t2, zero, 3
	addi	s1, zero, 2
	addi	t5, zero, 48
	addi	t3, zero, 26
.L59:
	addi	a2,s6,%lo(heap+5)
	addi	s7, t6, 0
	addi	s8, zero, 0
.L50:
	sub	a4, zero, s7
	andi	a5,a4,3
	beq	a5,zero,.L60
	sb	zero,0(s7)
	andi	a4,a4,2
	beq	a4,zero,.L61
	sb	zero,1(s7)
	bne	a5,t2,.L62
	sb	zero,2(s7)
	addi	a4, t2, 0
	addi	a3, zero, 254
.L45:
	sub	s9,t0,a5
	add	a5,a5,s8
	add	a5,t6,a5
	andi	s11,s9,-4
	add	s10,s11,a5
.L47:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	s10,a5,.L47
	beq	s11,s9,.L48
	add	a4,s11,a4
	add	a4,s7,a4
	sb	zero,0(a4)
	sub	a3,a3,s11
	beq	a3,s0,.L48
	sb	zero,1(a4)
	beq	a3,s1,.L48
	sb	zero,2(a4)
.L48:
	sb	t5,156(s7)
	addi	a3, s7, 0
.L49:
	mul	a1,a1,t1
	addi	a3,a3,1
	add	a1,a1,a7
	and	a1,a1,a6
	srai	a5,a1,16
	mulhu	a4,a5,a0
	srli	a4,a4,3
	mul	a4,a4,t3
	sub	a5,a5,a4
	addi	a5,a5,65
	sb	a5,-1(a3)
	bne	a2,a3,.L49
	sb	t5,124(s7)
	addi	s7,s7,257
	addi	a2,a2,258
	addi	s8,s8,257
	bne	s7,t4,.L50
	addi	s8,s5,%lo(heap+4369)
	addi	s9, zero, 0
.L58:
	addi	s7, t6, 0
.L57:
	lbu	a4,0(s7)
	addi	a3, s7, 0
	addi	a5, s8, 0
	bne	a4,zero,.L51
	jal	zero, .L52
.L78:
	bne	a2,a4,.L55
	lbu	a4,0(a3)
	beq	a4,zero,.L52
.L51:
	lbu	a2,0(a5)
	addi	a3,a3,1
	addi	a5,a5,1
	bne	a2,zero,.L78
.L55:
	addi	s7,s7,257
	bne	s7,t4,.L57
	addi	s8,s8,257
	bne	s8,s2,.L58
.L79:
	addi	s3,s3,-1
	bne	s3,zero,.L59
	lw	s0,44(sp)
	lui	a5,%hi(heap+8996)
	lui	a4, 2
	addi	a5,a5,%lo(heap+8996)
	lui	a6,%hi(heap_ptr)
	lui	a2,%hi(heap_end)
	addi	a4,a4,804
	lui	a3,%hi(heap_requested)
	addi	a0,s9,-5
	sw	a1,%lo(seed)(s4)
	sw	a5,%lo(heap_ptr)(a6)
	sw	a5,%lo(heap_end)(a2)
	sw	a4,%lo(heap_requested)(a3)
	lw	s1,40(sp)
	lw	s2,36(sp)
	lw	s3,32(sp)
	lw	s4,28(sp)
	lw	s5,24(sp)
	lw	s6,20(sp)
	lw	s7,16(sp)
	lw	s8,12(sp)
	lw	s9,8(sp)
	lw	s10,4(sp)
	lw	s11,0(sp)
	sltiu	a0, a0, 1
	addi	sp,sp,48
	jalr	zero, ra, 0
.L52:
	lbu	a5,0(a5)
	bne	a5,zero,.L55
	addi	s8,s8,257
	addi	s9,s9,1
	bne	s8,s2,.L58
	jal	zero, .L79
.L61:
	addi	a4, zero, 1
	addi	a3, zero, 256
	jal	zero, .L45
.L60:
	addi	a4, zero, 0
	addi	a3, zero, 257
	jal	zero, .L45
.L62:
	addi	a4, zero, 2
	addi	a3, zero, 255
	jal	zero, .L45
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
	.align	2
	.globl	initialise_board
	.type	initialise_board, @function
initialise_board:
	jalr	zero, ra, 0
	.size	initialise_board, .-initialise_board
	.align	2
	.globl	start_trigger
	.type	start_trigger, @function
start_trigger:
	jalr	zero, ra, 0
	.size	start_trigger, .-start_trigger
	.align	2
	.globl	stop_trigger
	.type	stop_trigger, @function
stop_trigger:
	jalr	zero, ra, 0
	.size	stop_trigger, .-stop_trigger
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	jalr	zero, ra, 0
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	warm_caches
	.type	warm_caches, @function
warm_caches:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_1:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_1)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_2:
	auipc	ra, %pcrel_hi(benchmark_body.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_2)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	benchmark, .-benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	addi	a0, zero, 1
	sw	ra,28(sp)
.Lpcrel_3:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_3)
.Lpcrel_4:
	auipc	ra, %pcrel_hi(benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_4)
	sw	a0,12(sp)
	lw	a0,12(sp)
	lw	ra,28(sp)
	addi	a0,a0,-1
	sltu	a0, zero, a0
	addi	sp,sp,32
	jalr	zero, ra, 0
	.size	main, .-main
	.text
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	addi	a0,a0,-1
	sltiu	a0, a0, 1
	jalr	zero, ra, 0
	.size	verify_benchmark, .-verify_benchmark
	.bss
	.align	2
	.type	heap, @object
	.size	heap, 8996
heap:
	.zero	8996
	.section	.sbss,"aw",@nobits
	.align	2
	.type	heap_requested, @object
	.size	heap_requested, 4
heap_requested:
	.zero	4
	.type	heap_end, @object
	.size	heap_end, 4
heap_end:
	.zero	4
	.type	heap_ptr, @object
	.size	heap_ptr, 4
heap_ptr:
	.zero	4
	.type	seed, @object
	.size	seed, 4
seed:
	.zero	4
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits


    .text
    .align 2
__mul:
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
    jalr   x0, ra, 0

.text
.align 2

# Signed 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_divsi3
__riscv_div_lib_divsi3:
    blt   a0, zero, __riscv_div_lib_L10      # bltz a0 -> blt a0, zero
    blt   a1, zero, __riscv_div_lib_L11      # bltz a1 -> blt a1, zero
    # Since the quotient is positive, fall into udivsi3

# Unsigned 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_udivsi3
__riscv_div_lib_udivsi3:
    addi  a2, a1, 0                           # mv a2, a1 -> addi a2, a1, 0
    addi  a1, a0, 0                           # mv a1, a0 -> addi a1, a0, 0
    addi  a0, zero, -1                        # li a0, -1 -> addi a0, zero, -1
    beq   a2, zero, __riscv_div_lib_L5       # beqz a2 -> beq a2, zero
    addi  a3, zero, 1                         # li a3, 1 -> addi a3, zero, 1
    bgeu  a2, a1, __riscv_div_lib_L2
__riscv_div_lib_L1:
    bge   zero, a2, __riscv_div_lib_L2       # blez a2 -> bge zero, a2
    slli  a2, a2, 1
    slli  a3, a3, 1
    bltu  a2, a1, __riscv_div_lib_L1         # bgtu a1, a2 -> bltu a2, a1
__riscv_div_lib_L2:
    addi  a0, zero, 0                         # li a0, 0 -> addi a0, zero, 0
__riscv_div_lib_L3:
    bltu  a1, a2, __riscv_div_lib_L4
    sub   a1, a1, a2
    or    a0, a0, a3
__riscv_div_lib_L4:
    srli  a3, a3, 1
    srli  a2, a2, 1
    bne   a3, zero, __riscv_div_lib_L3       # bnez a3 -> bne a3, zero
__riscv_div_lib_L5:
    jalr  zero, ra, 0                         # ret -> jalr zero, ra, 0

# Unsigned 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_umodsi3
__riscv_div_lib_umodsi3:
    # Call udivsi3(a0, a1), then return the remainder, which is in a1
    addi  t0, ra, 0                           # mv t0, ra -> addi t0, ra, 0
.Lpcrel_div1:
    auipc ra, %pcrel_hi(__riscv_div_lib_udivsi3)
    jalr  ra, ra, %pcrel_lo(.Lpcrel_div1)
    addi  a0, a1, 0                           # mv a0, a1 -> addi a0, a1, 0
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0

# Handle negative arguments to divsi3
__riscv_div_lib_L10:
    sub   a0, zero, a0                        # neg a0, a0 -> sub a0, zero, a0
    # Zero is handled as a negative so that the result will not be inverted
    blt   zero, a1, __riscv_div_lib_L12      # bgtz a1 -> blt zero, a1

    sub   a1, zero, a1                        # neg a1, a1 -> sub a1, zero, a1
    jal   zero, __riscv_div_lib_udivsi3      # j __riscv_div_lib_udivsi3 -> jal zero
__riscv_div_lib_L11:                         # Compute udivsi3(a0, -a1), then negate
    sub   a1, zero, a1                        # neg a1, a1 -> sub a1, zero, a1
__riscv_div_lib_L12:
    addi  t0, ra, 0                           # mv t0, ra -> addi t0, ra, 0
.Lpcrel_div2:
    auipc ra, %pcrel_hi(__riscv_div_lib_udivsi3)
    jalr  ra, ra, %pcrel_lo(.Lpcrel_div2)
    sub   a0, zero, a0                        # neg a0, a0 -> sub a0, zero, a0
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0

# Signed 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_modsi3
__riscv_div_lib_modsi3:
    addi  t0, ra, 0                           # mv t0, ra -> addi t0, ra, 0
    blt   a1, zero, __riscv_div_lib_L31      # bltz a1 -> blt a1, zero
    blt   a0, zero, __riscv_div_lib_L32      # bltz a0 -> blt a0, zero
__riscv_div_lib_L30:
.Lpcrel_div3:
    auipc ra, %pcrel_hi(__riscv_div_lib_udivsi3)
    jalr  ra, ra, %pcrel_lo(.Lpcrel_div3)
    addi  a0, a1, 0                           # mv a0, a1 -> addi a0, a1, 0
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0
__riscv_div_lib_L31:
    sub   a1, zero, a1                        # neg a1, a1 -> sub a1, zero, a1
    bge   a0, zero, __riscv_div_lib_L30      # bgez a0 -> bge a0, zero
__riscv_div_lib_L32:
    sub   a0, zero, a0                        # neg a0, a0 -> sub a0, zero, a0
.Lpcrel_div4:
    auipc ra, %pcrel_hi(__riscv_div_lib_udivsi3)
    jalr  ra, ra, %pcrel_lo(.Lpcrel_div4)
    sub   a0, zero, a1                        # neg a0, a1 -> sub a0, zero, a1
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0

# end of subrountine