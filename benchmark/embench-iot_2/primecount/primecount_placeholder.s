	.file	"primecount.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	initialise_board
	.type	initialise_board, @function
initialise_board:
	jalr	zero,ra,0
	.size	initialise_board, .-initialise_board
	.align	2
	.globl	start_trigger
	.type	start_trigger, @function
start_trigger:
	jalr	zero,ra,0
	.size	start_trigger, .-start_trigger
	.align	2
	.globl	stop_trigger
	.type	stop_trigger, @function
stop_trigger:
	jalr	zero,ra,0
	.size	stop_trigger, .-stop_trigger
	.align	2
	.globl	countPrimes
	.type	countPrimes, @function
countPrimes:
	addi	sp,sp,-336
	addi	a7,zero,2
	addi	a5,zero,4
	addi	a0,zero,1
	sw	a5,168(sp)
	sw	a7,0(sp)
	addi	t1,a0,0
	addi	a4,zero,3
.L6:
	callmul	a5,a7,a7
	bge	a4,a5,.L7
	addi	a7,a7,-1
	addi	a1,sp,0
	addi	a2,sp,168
	addi	a6,zero,0
.L14:
	lw	a3,0(a1)
	bge	a7,a3,.+8
	jal	x0,.L8
	lw	a5,0(a2)
	bge	a5,a4,.L10
.L9:
	sub	op_0,x0,a5
	sub	a5,a3,op_0
	bge	a5,a4,.+8
	jal	x0,.L9
	sw	a5,0(a2)
.L10:
	beq	a4,a5,.L13
	addi	a6,a6,1
	addi	a1,a1,4
	addi	a2,a2,4
	beq	t1,a6,.+8
	jal	x0,.L14
	addi	sp,sp,336
	jalr	zero,ra,0
.L7:
	addi	a7,a7,1
	jal	x0,.L6
.L8:
	addi	a5,zero,41
	bge	a5,t1,.+8
	jal	x0,.L12
	callmul	a3,a4,a4
	addi	op_0,x0,2
	sll	a5,t1,op_0
	sub	op_0,x0,sp
	sub	a2,a5,op_0
	sub	op_0,x0,sp
	sub	a5,a5,op_0
	addi	t1,t1,1
	sw	a4,0(a5)
	sw	a3,168(a5)
.L12:
	addi	a0,a0,1
.L13:
	addi	a4,a4,1
	jal	x0,.L6
	.size	countPrimes, .-countPrimes
	.align	2
	.type	benchmark_body.constprop.0, @function
benchmark_body.constprop.0:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_1:
	auipc	ra,%pcrel_hi(countPrimes)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	bge	zero,a0,.L29
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	addi	s1,a0,0
	addi	s0,zero,0
.L26:
	addi	s0,s0,1
.Lpcrel_2:
	auipc	ra,%pcrel_hi(countPrimes)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_2)
	beq	s0,s1,.+8
	jal	x0,.L26
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
.L29:
	jalr	zero,ra,0
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.globl	warm_caches
	.type	warm_caches, @function
warm_caches:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_3:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_3)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_4:
	auipc	ra,%pcrel_hi(benchmark_body.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_4)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
	.size	benchmark, .-benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
.Lpcrel_5:
	auipc	ra,%pcrel_hi(benchmark_body.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_5)
.Lpcrel_6:
	auipc	ra,%pcrel_hi(benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_6)
	sw	a0,12(sp)
	lw	a0,12(sp)
	lw	ra,28(sp)
	addi	a0,a0,-2048
	addi	a0,a0,-1464
	sltu	a0,zero,a0
	addi	sp,sp,32
	jalr	zero,ra,0
	.size	main, .-main
	.text
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	jalr	zero,ra,0
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	addi	a0,a0,-2048
	addi	a0,a0,-1464
	addi	op_0,x0,1
	sltu	a0,a0,op_0
	jalr	zero,ra,0
	.size	verify_benchmark, .-verify_benchmark
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits


    .text
    .align 2
__mul:
	sub	op_0,x0,a0
	sub	a2,x0,op_0
	addi	a0,x0,0
.Mul_loop:
	addi	op_2,x0,1
	or	op_1,a1,op_2
	addi	op_3,x0,1
	sub	op_0,op_1,op_3
	sub	a3,a1,op_0
	beq	a3,x0,.Mul_skip
	sub	op_0,x0,a0
	sub	a0,a2,op_0
.Mul_skip:
	addi	op_0,x0,1
	srl	a1,a1,op_0
	addi	op_0,x0,1
	sll	a2,a2,op_0
	beq	a1,x0,.+8
	jal	x0,.Mul_loop
	jalr	x0,ra,0

