	.file	"mont64.c"
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
	.globl	mulul64
	.type	mulul64, @function
mulul64:
	mul	a6,a1,a2
	mulhu	t1,a0,a2
	mul	a7,a0,a3
	add	t1,a6,t1
	sltu	a6,t1,a6
	mulhu	t4,a1,a2
	add	t1,a7,t1
	sw	t1,4(a5)
	sltu	a7,t1,a7
	mulhu	t3,a0,a3
	add	a6,a6,t4
	mul	t1,a1,a3
	add	a7,a7,t3
	mulhu	a1,a1,a3
	add	a6,t1,a6
	add	a7,a6,a7
	sltu	t1,a6,t1
	sltu	a6,a7,a6
	mul	a0,a0,a2
	add	t1,t1,a1
	add	a6,a6,t1
	sw	a0,0(a5)
	sw	a6,4(a4)
	sw	a7,0(a4)
	ret
	.size	mulul64, .-mulul64
	.align	2
	.globl	modul64
	.type	modul64, @function
modul64:
	addi	sp,sp,-16
	sw	s0,12(sp)
	li	t3,0
	mv	s0,a4
	li	t0,64
.L9:
	srli	a7,a0,31
	slli	a6,a1,1
	add	a6,a7,a6
	srai	t1,a1,31
	slli	a7,a3,1
	srli	a1,a3,31
	slli	a0,a0,1
	srli	a3,a2,31
	or	a0,a1,a0
	add	a7,a3,a7
	or	t4,t1,a6
	mv	a1,a6
	addi	t3,t3,1
	slli	a2,a2,1
	or	t1,t1,a0
	mv	a3,a7
	bgtu	a5,t4,.L7
	sub	t6,a0,s0
	addi	t5,a2,1
	sgtu	a4,t6,a0
	sltu	t2,t5,a2
	sub	a6,a6,a5
	bne	a5,t4,.L10
	bgtu	s0,t1,.L7
.L10:
	mv	a0,t6
	sub	a1,a6,a4
	mv	a2,t5
	add	a3,t2,a7
.L7:
	bne	t3,t0,.L9
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	modul64, .-modul64
	.align	2
	.globl	montmul
	.type	montmul, @function
montmul:
	mul	t1,a1,a2
	mulhu	t3,a0,a2
	mul	t4,a0,a3
	add	t3,t1,t3
	sltu	t1,t3,t1
	mul	t5,a0,a2
	add	t3,t4,t3
	sltu	t6,t3,t4
	mul	a7,a7,t5
	mul	t4,t3,a6
	mulhu	a2,a1,a2
	add	a7,a7,t4
	mulhu	t4,a6,t5
	add	a7,a7,t4
	add	t4,t1,a2
	mul	t1,a1,a3
	mul	a6,a6,t5
	add	t1,t4,t1
	mulhu	a0,a0,a3
	mul	a2,a7,a4
	add	a0,t6,a0
	sltu	t6,t1,t4
	add	a0,t1,a0
	sltu	t1,a0,t1
	mulhu	t4,a6,a4
	mulhu	a1,a1,a3
	add	a3,a2,t4
	sltu	a2,a3,a2
	mul	t4,a6,a5
	add	t6,t6,a1
	add	t1,t1,t6
	add	t6,t4,a3
	mulhu	a1,a7,a4
	sltu	a3,t6,t4
	mul	t4,a7,a5
	add	a2,a2,a1
	mulhu	a7,a7,a5
	add	a1,t4,a0
	add	a2,a1,a2
	sltu	t4,a1,t4
	sltu	a1,a2,a1
	mulhu	t0,a6,a5
	add	a7,a7,t1
	add	t4,t4,a7
	add	a1,a1,t4
	mul	a6,a6,a4
	add	a3,a3,t0
	add	a3,a2,a3
	sltu	a2,a3,a2
	add	a2,a2,a1
	mv	a7,a2
	mv	a1,a3
	add	t4,a6,t5
	sltu	a6,t4,a6
	add	a6,a6,t3
	add	a6,a6,t6
	bgtu	t3,a6,.L22
	beq	t3,a6,.L23
.L14:
	xor	a2,a7,t1
	xor	a3,a1,a0
	or	a3,a3,a2
	seqz	a3,a3
	li	a2,1
	bgtu	t3,a6,.L16
	beq	t3,a6,.L24
	li	a2,0
.L16:
	and	a3,a3,a2
	li	a2,1
	bgtu	t1,a7,.L18
	beq	t1,a7,.L25
	li	a2,0
.L18:
	li	a0,1
	bgtu	a5,a7,.L21
	beq	a5,a7,.L26
.L20:
	or	a2,a2,a0
	or	a3,a3,a2
	slli	a2,a3,31
	srai	a0,a2,31
	and	a0,a0,a4
	slli	a4,a3,31
	srai	a3,a4,31
	sub	a0,a1,a0
	and	a3,a3,a5
	sgtu	a1,a0,a1
	sub	a7,a7,a3
	sub	a1,a7,a1
	ret
.L26:
	bleu	a4,a1,.L20
.L21:
	li	a0,0
	j	.L20
.L23:
	bleu	t5,t4,.L14
.L22:
	addi	a1,a3,1
	sltu	a3,a1,a3
	add	a7,a3,a2
	j	.L14
.L24:
	bgtu	t5,t4,.L16
	li	a2,0
	j	.L16
.L25:
	bgtu	a0,a1,.L18
	li	a2,0
	j	.L18
	.size	montmul, .-montmul
	.align	2
	.type	benchmark_body.constprop.0, @function
benchmark_body.constprop.0:
	addi	sp,sp,-112
	lui	a5,%hi(in_b)
	lui	a4,%hi(in_a)
	sw	s8,72(sp)
	sw	s9,68(sp)
	lw	s8,%lo(in_b)(a5)
	lw	s9,%lo(in_a)(a4)
	sw	s11,60(sp)
	lw	s11,%lo(in_a+4)(a4)
	sw	s10,64(sp)
	lw	s10,%lo(in_b+4)(a5)
	lui	a5,%hi(in_m)
	mulhu	a3,s9,s8
	sw	s0,104(sp)
	sw	s4,88(sp)
	lw	s0,%lo(in_m+4)(a5)
	lw	s4,%lo(in_m)(a5)
	sw	s3,92(sp)
	sw	s6,80(sp)
	sw	s7,76(sp)
	sw	ra,108(sp)
	sw	s1,100(sp)
	mul	a5,s11,s8
	sw	s2,96(sp)
	sw	s5,84(sp)
	li	s7,423
	li	s3,64
	li	s6,-2147483648
	mul	a4,s9,s10
	add	a3,a5,a3
	sltu	a5,a3,a5
	mulhu	a2,s11,s8
	add	t1,a4,a3
	sltu	a3,t1,a4
	sw	t1,24(sp)
	mul	a4,s11,s10
	add	a5,a5,a2
	mulhu	a2,s11,s10
	add	a4,a5,a4
	sltu	a5,a4,a5
	add	a5,a5,a2
	mulhu	a2,s9,s10
	add	a3,a3,a2
	mul	a2,s9,s8
	add	t3,a4,a3
	sltu	a4,t3,a4
	add	a5,a4,a5
	sw	a5,20(sp)
	sw	t3,28(sp)
	sw	a2,16(sp)
.L49:
	lw	a2,16(sp)
	lw	a6,24(sp)
	lw	a4,28(sp)
	lw	a3,20(sp)
	li	a7,0
.L30:
	srli	a1,a4,31
	srai	a0,a3,31
	slli	a5,a3,1
	slli	a4,a4,1
	srli	a3,a6,31
	add	a5,a1,a5
	or	a4,a3,a4
	slli	a1,a6,1
	srli	a3,a2,31
	add	a1,a3,a1
	or	t1,a0,a5
	mv	a3,a5
	addi	a7,a7,1
	slli	a2,a2,1
	or	a0,a0,a4
	mv	a6,a1
	bgtu	s0,t1,.L28
	sub	t4,a4,s4
	addi	t3,a2,1
	sgtu	t6,t4,a4
	sltu	t5,t3,a2
	sub	a5,a5,s0
	bne	s0,t1,.L50
	bgtu	s4,a0,.L28
.L50:
	mv	a4,t4
	sub	a3,a5,t6
	mv	a2,t3
	add	a6,t5,a1
.L28:
	bne	a7,s3,.L30
	mul	a2,a3,a4
	li	a7,0
	mulhu	a5,a4,a4
	mulhu	t1,a3,a4
	add	a6,a5,a2
	sltu	a5,a6,a5
	add	a6,a2,a6
	sltu	a1,a6,a2
	mul	a0,a3,a3
	add	a2,a5,t1
	add	a5,a1,t1
	mulhu	a3,a3,a3
	add	a1,a2,a0
	sltu	a2,a1,a2
	add	a5,a1,a5
	sltu	a1,a5,a1
	mul	a4,a4,a4
	add	a3,a2,a3
	add	a2,a1,a3
.L33:
	srli	a1,a5,31
	srai	a0,a2,31
	slli	a3,a2,1
	slli	a5,a5,1
	srli	a2,a6,31
	add	a3,a1,a3
	or	a5,a2,a5
	slli	a1,a6,1
	srli	a2,a4,31
	add	a1,a2,a1
	or	t1,a0,a3
	mv	a2,a3
	addi	a7,a7,1
	slli	a4,a4,1
	or	a0,a0,a5
	mv	a6,a1
	bgtu	s0,t1,.L31
	sub	t4,a5,s4
	addi	t3,a4,1
	sgtu	t6,t4,a5
	sltu	t5,t3,a4
	sub	a3,a3,s0
	bne	s0,t1,.L51
	bgtu	s4,a0,.L31
.L51:
	mv	a5,t4
	sub	a2,a3,t6
	mv	a4,t3
	add	a6,t5,a1
.L31:
	bne	a7,s3,.L33
	mul	a3,a2,a5
	li	s2,0
	mulhu	a4,a5,a5
	add	a1,a4,a3
	mulhu	a0,a2,a5
	sltu	a4,a1,a4
	add	a1,a3,a1
	sltu	s1,a1,a3
	mul	a3,a2,a2
	add	a4,a4,a0
	add	s1,s1,a0
	mulhu	a2,a2,a2
	add	a3,a4,a3
	sltu	a4,a3,a4
	add	s1,a3,s1
	sltu	a3,s1,a3
	mul	a5,a5,a5
	add	a4,a4,a2
	add	s5,a3,a4
.L36:
	srli	a3,s1,31
	slli	a4,s5,1
	add	a4,a3,a4
	slli	s1,s1,1
	srli	a3,a1,31
	srai	a2,s5,31
	or	s1,a3,s1
	slli	a3,a1,1
	srli	a1,a5,31
	add	a3,a1,a3
	or	a0,a2,a4
	mv	s5,a4
	addi	s2,s2,1
	slli	a5,a5,1
	or	a2,a2,s1
	mv	a1,a3
	bgtu	s0,a0,.L34
	sub	a7,s1,s4
	addi	a6,a5,1
	sgtu	t3,a7,s1
	sltu	t1,a6,a5
	sub	a4,a4,s0
	bne	s0,a0,.L52
	bgtu	s4,a2,.L34
.L52:
	mv	s1,a7
	sub	s5,a4,t3
	mv	a5,a6
	add	a1,t1,a3
.L34:
	bne	s2,s3,.L36
	li	a2,0
	li	a3,0
	li	a4,1
	li	a5,0
	j	.L39
.L66:
	addi	s2,s2,-1
	add	a4,t6,t5
	mv	a5,t4
	beq	s2,zero,.L65
.L39:
	xor	a6,s0,a5
	xor	a1,s4,a4
	slli	a7,a6,31
	srli	a1,a1,1
	slli	t5,a3,31
	add	a1,a7,a1
	srli	t4,a2,1
	srli	t3,a3,1
	and	a0,s4,a4
	andi	t1,a4,1
	add	a2,t5,t4
	mv	a3,t3
	and	a7,s0,a5
	add	a1,a0,a1
	srli	a6,a6,1
	srli	t4,a5,1
	slli	t6,a5,31
	srli	t5,a4,1
	add	t3,t3,s6
	beq	t1,zero,.L66
	sltu	a0,a1,a0
	add	a7,a7,a6
	addi	s2,s2,-1
	mv	a4,a1
	add	a5,a0,a7
	mv	a3,t3
	bne	s2,zero,.L39
.L65:
	sw	a4,32(sp)
	sw	a5,36(sp)
	sw	a2,40(sp)
	sw	a3,44(sp)
	lw	a4,32(sp)
	lw	a5,36(sp)
	lw	a5,40(sp)
	lw	a6,44(sp)
	li	a7,0
	sw	a5,8(sp)
	sw	a6,12(sp)
	mv	a0,s9
	mv	a1,s11
	li	a3,0
	li	a4,0
.L42:
	srli	a2,a0,31
	slli	a5,a1,1
	add	a5,a2,a5
	slli	a0,a0,1
	srli	a2,a4,31
	srai	a6,a1,31
	or	a0,a2,a0
	slli	a2,a4,1
	srli	a4,a3,31
	add	a2,a4,a2
	or	t1,a6,a5
	mv	a1,a5
	addi	a7,a7,1
	slli	a3,a3,1
	or	a6,a6,a0
	mv	a4,a2
	bgtu	s0,t1,.L40
	sub	t3,a0,s4
	bne	s0,t1,.L53
	bgtu	s4,a6,.L40
.L53:
	addi	a6,a3,1
	sgtu	a1,t3,a0
	sltu	a4,a6,a3
	sub	a5,a5,s0
	mv	a0,t3
	sub	a1,a5,a1
	add	a4,a4,a2
	mv	a3,a6
.L40:
	bne	a7,s3,.L42
	li	t3,0
	mv	a2,s8
	mv	a3,s10
	li	a6,0
	li	a4,0
.L45:
	srli	a7,a2,31
	srai	t1,a3,31
	slli	a5,a3,1
	slli	a2,a2,1
	srli	a3,a4,31
	add	a5,a7,a5
	or	a2,a3,a2
	slli	a7,a4,1
	srli	a3,a6,31
	add	a7,a3,a7
	or	t4,t1,a5
	mv	a3,a5
	addi	t3,t3,1
	slli	a6,a6,1
	or	t1,t1,a2
	mv	a4,a7
	bgtu	s0,t4,.L43
	sub	t5,a2,s4
	bne	s0,t4,.L54
	bgtu	s4,t1,.L43
.L54:
	sgtu	a3,t5,a2
	sub	a5,a5,s0
	sub	a3,a5,a3
	addi	a5,a6,1
	sltu	a4,a5,a6
	mv	a2,t5
	add	a4,a4,a7
	mv	a6,a5
.L43:
	bne	t3,s3,.L45
	lw	a6,40(sp)
	lw	a7,44(sp)
	mv	a4,s4
	mv	a5,s0
	call	montmul
	lw	a6,40(sp)
	lw	a7,44(sp)
	mv	a2,a0
	mv	a3,a1
	mv	a4,s4
	mv	a5,s0
	call	montmul
	lw	a6,40(sp)
	lw	a7,44(sp)
	mv	a2,a0
	mv	a3,a1
	mv	a4,s4
	mv	a5,s0
	call	montmul
	lw	t1,32(sp)
	lw	t2,36(sp)
	mul	a7,a1,t1
	mulhu	a2,a0,t1
	mulhu	a6,a1,t1
	add	a2,a7,a2
	sltu	a7,a2,a7
	add	a6,a7,a6
	mul	a7,a1,t2
	mulhu	a1,a1,t2
	add	a7,a6,a7
	sltu	a6,a7,a6
	mul	a3,a0,t2
	add	a6,a6,a1
	mulhu	a5,a0,t2
	add	a2,a3,a2
	sltu	a3,a2,a3
	mul	a1,a0,t1
	add	a4,a3,a5
	add	a4,a7,a4
	sltu	a3,a4,a7
	add	a3,a3,a6
.L48:
	srli	a0,a4,31
	srai	a6,a3,31
	slli	a5,a3,1
	slli	a4,a4,1
	srli	a3,a2,31
	add	a5,a0,a5
	or	a4,a3,a4
	slli	a0,a2,1
	srli	a3,a1,31
	add	a0,a3,a0
	or	a7,a6,a5
	mv	a3,a5
	addi	s2,s2,1
	slli	a1,a1,1
	or	a6,a6,a4
	mv	a2,a0
	bgtu	s0,a7,.L46
	sub	t1,a4,s4
	bne	s0,a7,.L55
	bgtu	s4,a6,.L46
.L55:
	addi	a6,a1,1
	sgtu	a3,t1,a4
	sltu	a2,a6,a1
	sub	a5,a5,s0
	mv	a4,t1
	sub	a3,a5,a3
	add	a2,a2,a0
	mv	a1,a6
.L46:
	bne	s2,s3,.L48
	addi	s7,s7,-1
	bne	s7,zero,.L49
	lw	a0,8(sp)
	lw	a1,12(sp)
	xor	s5,s5,a3
	mul	a5,s0,a0
	lw	ra,108(sp)
	lw	s0,104(sp)
	xor	a4,s1,a4
	or	a4,a4,s5
	snez	a4,a4
	lw	s1,100(sp)
	lw	s2,96(sp)
	lw	s3,92(sp)
	lw	s5,84(sp)
	mul	a2,a1,s4
	lw	s6,80(sp)
	lw	s7,76(sp)
	lw	s8,72(sp)
	lw	s9,68(sp)
	lw	s10,64(sp)
	lw	s11,60(sp)
	mulhu	a3,s4,a0
	add	a5,a5,a2
	mul	a0,s4,a0
	add	a5,a5,a3
	lw	s4,88(sp)
	addi	sp,sp,112
	and	a0,a0,a5
	addi	a0,a0,1
	snez	a0,a0
	or	a0,a0,a4
	jr	ra
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	ble	a0,zero,.L78
	lui	a5,%hi(in_m)
	lw	t4,%lo(in_m)(a5)
	lw	t3,%lo(in_m+4)(a5)
	addi	sp,sp,-32
	sw	s0,28(sp)
	sw	s1,24(sp)
	sw	s2,20(sp)
	sw	s3,16(sp)
	mv	s2,a0
	li	s1,0
	li	s0,-2147483648
.L73:
	li	t1,64
	li	a2,0
	li	a3,0
	li	a4,1
	li	a5,0
	j	.L72
.L82:
	addi	t1,t1,-1
	mv	a4,a7
	add	a5,a1,a6
	mv	a3,t6
	beq	t1,zero,.L81
.L72:
	xor	a6,t3,a5
	xor	a1,t4,a4
	slli	a7,a6,31
	srli	a1,a1,1
	add	a1,a7,a1
	and	a7,t4,a4
	slli	a0,a3,31
	and	t0,t3,a5
	srli	t2,a2,1
	srli	t6,a3,1
	add	a7,a1,a7
	srli	a6,a6,1
	andi	t5,a4,1
	add	a2,a0,t2
	add	a6,a6,t0
	mv	a3,t6
	sltu	a1,a7,a1
	srli	t0,a5,1
	slli	a0,a5,31
	srli	t2,a4,1
	add	t6,t6,s0
	bne	t5,zero,.L82
	addi	t1,t1,-1
	add	a4,a0,t2
	mv	a5,t0
	bne	t1,zero,.L72
.L81:
	sw	a4,0(sp)
	sw	a5,4(sp)
	sw	a2,8(sp)
	sw	a3,12(sp)
	lw	a4,0(sp)
	lw	a5,4(sp)
	lw	a4,8(sp)
	lw	a5,12(sp)
	lw	a4,8(sp)
	lw	a5,12(sp)
	lw	a4,8(sp)
	lw	a5,12(sp)
	lw	a4,8(sp)
	lw	a5,12(sp)
	lw	a4,0(sp)
	lw	a5,4(sp)
	addi	s1,s1,1
	bne	s2,s1,.L73
	lw	s0,28(sp)
	lw	s1,24(sp)
	lw	s2,20(sp)
	lw	s3,16(sp)
	addi	sp,sp,32
	jr	ra
.L78:
	ret
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.globl	xbinGCD
	.type	xbinGCD, @function
xbinGCD:
	addi	sp,sp,-48
	sw	s0,44(sp)
	sw	s1,40(sp)
	sw	s2,36(sp)
	mv	s0,a1
	or	a1,a0,a1
	mv	s2,a4
	mv	s1,a5
	beq	a1,zero,.L89
	sw	s3,32(sp)
	sw	s4,28(sp)
	mv	s3,a2
	sw	s5,24(sp)
	sw	s6,20(sp)
	sw	s7,16(sp)
	sw	s8,12(sp)
	mv	s4,a3
	mv	a4,a0
	mv	a2,s0
	li	t1,0
	li	t2,0
	li	a6,1
	li	a7,0
	j	.L88
.L93:
	or	t3,t4,t0
	add	a6,s8,s7
	mv	a7,s6
	beq	t3,zero,.L92
.L88:
	xor	t5,s4,a7
	xor	t3,s3,a6
	slli	a5,t5,31
	srli	t3,t3,1
	add	t3,a5,t3
	slli	a1,t2,31
	slli	a5,a2,31
	srli	t4,a4,1
	srli	t0,a2,1
	srli	a2,t1,1
	add	t1,a1,a2
	add	t4,a5,t4
	and	t6,s3,a6
	srli	a5,t2,1
	and	a4,s4,a7
	mv	t2,a5
	add	t6,t3,t6
	srli	t5,t5,1
	add	a5,a0,t1
	andi	a3,a6,1
	add	t5,t5,a4
	srli	s6,a7,1
	slli	s8,a7,31
	srli	s7,a6,1
	sltu	s5,a5,t1
	add	a1,s0,t2
	sltu	t3,t6,t3
	mv	a4,t4
	mv	a2,t0
	beq	a3,zero,.L93
	add	a7,t3,t5
	or	t3,t4,t0
	mv	a6,t6
	mv	t1,a5
	add	t2,s5,a1
	bne	t3,zero,.L88
.L92:
	lw	s3,32(sp)
	lw	s4,28(sp)
	lw	s5,24(sp)
	lw	s6,20(sp)
	lw	s7,16(sp)
	lw	s8,12(sp)
.L84:
	sw	a6,0(s2)
	sw	a7,4(s2)
	lw	s0,44(sp)
	sw	t1,0(s1)
	sw	t2,4(s1)
	lw	s2,36(sp)
	lw	s1,40(sp)
	addi	sp,sp,48
	jr	ra
.L89:
	mv	t1,a0
	mv	t2,s0
	li	a6,1
	li	a7,0
	j	.L84
	.size	xbinGCD, .-xbinGCD
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
	lui	a3,%hi(.LC0)
	lui	a4,%hi(.LC1)
	lui	a5,%hi(.LC2)
	lw	t1,%lo(.LC0)(a3)
	lw	t2,%lo(.LC0+4)(a3)
	lw	a6,%lo(.LC1)(a4)
	lw	a7,%lo(.LC1+4)(a4)
	lw	a2,%lo(.LC2)(a5)
	lw	a3,%lo(.LC2+4)(a5)
	addi	sp,sp,-32
	lui	a1,%hi(in_m)
	lui	a4,%hi(in_b)
	lui	a5,%hi(in_a)
	li	a0,1
	sw	ra,28(sp)
	sw	t1,%lo(in_m)(a1)
	sw	t2,%lo(in_m+4)(a1)
	sw	a6,%lo(in_b)(a4)
	sw	a7,%lo(in_b+4)(a4)
	sw	a2,%lo(in_a)(a5)
	sw	a3,%lo(in_a+4)(a5)
	call	benchmark_body.isra.0
	call	benchmark
	sw	a0,12(sp)
	lw	a0,12(sp)
	lw	ra,28(sp)
	snez	a0,a0
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.text
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	lui	a3,%hi(.LC0)
	lui	a4,%hi(.LC1)
	lui	a5,%hi(.LC2)
	lw	t1,%lo(.LC0)(a3)
	lw	t2,%lo(.LC0+4)(a3)
	lw	a0,%lo(.LC1)(a4)
	lw	a1,%lo(.LC1+4)(a4)
	lw	a2,%lo(.LC2)(a5)
	lw	a3,%lo(.LC2+4)(a5)
	lui	a6,%hi(in_m)
	lui	a4,%hi(in_b)
	lui	a5,%hi(in_a)
	sw	t1,%lo(in_m)(a6)
	sw	t2,%lo(in_m+4)(a6)
	sw	a0,%lo(in_b)(a4)
	sw	a1,%lo(in_b+4)(a4)
	sw	a2,%lo(in_a)(a5)
	sw	a3,%lo(in_a+4)(a5)
	ret
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	seqz	a0,a0
	ret
	.size	verify_benchmark, .-verify_benchmark
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	958986399
	.word	-85440217
	.align	3
.LC1:
	.word	-1187838605
	.word	343109103
	.align	3
.LC2:
	.word	-2027716625
	.word	88684321
	.section	.sbss,"aw",@nobits
	.align	3
	.type	in_m, @object
	.size	in_m, 8
in_m:
	.zero	8
	.type	in_b, @object
	.size	in_b, 8
in_b:
	.zero	8
	.type	in_a, @object
	.size	in_a, 8
in_a:
	.zero	8
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
