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
	ret
	.size	initialise_board, .-initialise_board
	.align	2
	.globl	start_trigger
	.type	start_trigger, @function
start_trigger:
	ret
	.size	start_trigger, .-start_trigger
	.align	2
	.globl	stop_trigger
	.type	stop_trigger, @function
stop_trigger:
	ret
	.size	stop_trigger, .-stop_trigger
	.align	2
	.globl	countPrimes
	.type	countPrimes, @function
countPrimes:
	addi	sp,sp,-336
	li	a7,2
	li	a5,4
	li	a0,1
	sw	a5,168(sp)
	sw	a7,0(sp)
	mv	t1,a0
	li	a4,3
.L6:
	mul	a5,a7,a7
	ble	a5,a4,.L7
	addi	a7,a7,-1
	mv	a1,sp
	addi	a2,sp,168
	li	a6,0
.L14:
	lw	a3,0(a1)
	bgt	a3,a7,.L8
	lw	a5,0(a2)
	ble	a4,a5,.L10
.L9:
	add	a5,a5,a3
	blt	a5,a4,.L9
	sw	a5,0(a2)
.L10:
	beq	a4,a5,.L13
	addi	a6,a6,1
	addi	a1,a1,4
	addi	a2,a2,4
	bne	t1,a6,.L14
	addi	sp,sp,336
	jr	ra
.L7:
	addi	a7,a7,1
	j	.L6
.L8:
	li	a5,41
	bgt	t1,a5,.L12
	mul	a3,a4,a4
	slli	a5,t1,2
	add	a2,sp,a5
	add	a5,sp,a5
	addi	t1,t1,1
	sw	a4,0(a2)
	sw	a3,168(a5)
.L12:
	addi	a0,a0,1
.L13:
	addi	a4,a4,1
	j	.L6
	.size	countPrimes, .-countPrimes
	.align	2
	.type	benchmark_body.constprop.0, @function
benchmark_body.constprop.0:
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	countPrimes
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	ble	a0,zero,.L29
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a0
	li	s0,0
.L26:
	addi	s0,s0,1
	call	countPrimes
	bne	s0,s1,.L26
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L29:
	ret
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.globl	warm_caches
	.type	warm_caches, @function
warm_caches:
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	benchmark_body.isra.0
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	benchmark_body.constprop.0
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	benchmark, .-benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	call	benchmark_body.constprop.0
	call	benchmark
	sw	a0,12(sp)
	lw	a0,12(sp)
	lw	ra,28(sp)
	addi	a0,a0,-2048
	addi	a0,a0,-1464
	snez	a0,a0
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.text
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	ret
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	addi	a0,a0,-2048
	addi	a0,a0,-1464
	seqz	a0,a0
	ret
	.size	verify_benchmark, .-verify_benchmark
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
