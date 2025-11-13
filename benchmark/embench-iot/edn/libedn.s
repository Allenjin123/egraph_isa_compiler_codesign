	.file	"libedn.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	memset
	.type	memset, @function
memset:
	beq	a2,zero,.L14
	addi	a5,a2,-1
	li	a4,5
	andi	a1,a1,0xff
	bleu	a5,a4,.L10
	neg	a4,a0
	andi	a5,a4,3
	li	a6,0
	beq	a5,zero,.L4
	sb	a1,0(a0)
	andi	a4,a4,2
	li	a6,1
	beq	a4,zero,.L4
	sb	a1,1(a0)
	li	a4,3
	li	a6,2
	bne	a5,a4,.L4
	sb	a1,2(a0)
	mv	a6,a5
.L4:
	slli	a4,a1,8
	slli	a3,a1,16
	sub	t1,a2,a5
	or	a4,a1,a4
	or	a4,a4,a3
	add	a5,a0,a5
	slli	a3,a1,24
	andi	a7,t1,-4
	or	a4,a4,a3
	add	a3,a5,a7
.L6:
	sw	a4,0(a5)
	addi	a5,a5,4
	bne	a5,a3,.L6
	add	a5,a6,a7
	beq	t1,a7,.L14
.L3:
	add	a4,a0,a5
	sb	a1,0(a4)
	addi	a4,a5,1
	bleu	a2,a4,.L14
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,2
	bleu	a2,a4,.L14
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,3
	bleu	a2,a4,.L14
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,4
	bleu	a2,a4,.L14
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a5,a5,5
	bleu	a2,a5,.L14
	add	a5,a0,a5
	sb	a1,0(a5)
.L14:
	ret
.L10:
	li	a5,0
	j	.L3
	.size	memset, .-memset
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	beq	a2,zero,.L20
	addi	a5,a2,-1
	li	a4,6
	bleu	a5,a4,.L21
	or	a3,a0,a1
	andi	a3,a3,3
	mv	a4,a0
	mv	a5,a1
	bne	a3,zero,.L21
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L21
	andi	a7,a2,-4
	add	a6,a1,a7
.L22:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L22
	beq	a2,a7,.L20
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bleu	a2,a5,.L20
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bleu	a2,a7,.L20
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	ret
.L21:
	add	a2,a1,a2
	mv	a5,a0
.L24:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L24
.L20:
	ret
	.size	memcpy, .-memcpy
	.align	2
	.globl	memcmp
	.type	memcmp, @function
memcmp:
	beq	a2,zero,.L41
	add	a2,a0,a2
	j	.L40
.L39:
	beq	a0,a2,.L41
.L40:
	lbu	a5,0(a0)
	lbu	a4,0(a1)
	addi	a0,a0,1
	addi	a1,a1,1
	beq	a5,a4,.L39
	sub	a0,a5,a4
	ret
.L41:
	li	a0,0
	ret
	.size	memcmp, .-memcmp
	.align	2
	.globl	memmove
	.type	memmove, @function
memmove:
	bgeu	a0,a1,.L44
	beq	a2,zero,.L45
	addi	a5,a2,-1
	li	a4,6
	bleu	a5,a4,.L46
	or	a3,a1,a0
	andi	a3,a3,3
	mv	a4,a0
	mv	a5,a1
	bne	a3,zero,.L46
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L46
	andi	a7,a2,-4
	add	a6,a1,a7
.L47:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L47
	beq	a2,a7,.L45
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bleu	a2,a5,.L45
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bleu	a2,a7,.L45
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	ret
.L44:
	bgtu	a0,a1,.L67
.L45:
	ret
.L67:
	beq	a2,zero,.L45
	addi	a2,a2,-1
	add	a5,a1,a2
	lbu	a4,0(a5)
	add	a5,a0,a2
	sb	a4,0(a5)
	j	.L67
.L46:
	add	a2,a1,a2
	mv	a5,a0
.L49:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L49
	ret
	.size	memmove, .-memmove
	.align	2
	.globl	strlen
	.type	strlen, @function
strlen:
	lbu	a5,0(a0)
	beq	a5,zero,.L68
	li	a5,0
.L70:
	addi	a5,a5,1
	add	a4,a0,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L70
.L68:
	mv	a0,a5
	ret
	.size	strlen, .-strlen
	.align	2
	.globl	strchr
	.type	strchr, @function
strchr:
	lbu	a5,0(a0)
	beq	a5,zero,.L74
	andi	a4,a1,0xff
.L76:
	beq	a4,a5,.L73
	lbu	a5,1(a0)
	addi	a0,a0,1
	bne	a5,zero,.L76
.L74:
	seqz	a1,a1
	neg	a1,a1
	and	a0,a0,a1
.L73:
	ret
	.size	strchr, .-strchr
	.align	2
	.globl	initialise_board
	.type	initialise_board, @function
initialise_board:
 #APP
# 15 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	li a0, 0
# 0 "" 2
 #NO_APP
	ret
	.size	initialise_board, .-initialise_board
	.align	2
	.globl	start_trigger
	.type	start_trigger, @function
start_trigger:
 #APP
# 21 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	li a0, 0
# 0 "" 2
 #NO_APP
	ret
	.size	start_trigger, .-start_trigger
	.align	2
	.globl	stop_trigger
	.type	stop_trigger, @function
stop_trigger:
 #APP
# 27 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	li a0, 0
# 0 "" 2
 #NO_APP
	ret
	.size	stop_trigger, .-stop_trigger
	.align	2
	.globl	vec_mpy1
	.type	vec_mpy1, @function
vec_mpy1:
	addi	a3,a0,300
.L85:
	lh	a5,0(a1)
	lhu	a4,0(a0)
	addi	a0,a0,2
	mul	a5,a5,a2
	addi	a1,a1,2
	srai	a5,a5,15
	add	a5,a5,a4
	sh	a5,-2(a0)
	bne	a3,a0,.L85
	ret
	.size	vec_mpy1, .-vec_mpy1
	.align	2
	.globl	mac
	.type	mac, @function
mac:
	lw	a7,0(a3)
	mv	a6,a0
	addi	t1,a1,300
	mv	a0,a2
.L88:
	lh	a4,0(a1)
	lh	a5,0(a6)
	addi	a1,a1,2
	mul	a2,a4,a4
	addi	a6,a6,2
	mul	a5,a5,a4
	add	a0,a0,a2
	add	a7,a7,a5
	bne	t1,a1,.L88
	sw	a7,0(a3)
	ret
	.size	mac, .-mac
	.align	2
	.globl	fir
	.type	fir, @function
fir:
	addi	a6,a0,100
	mv	a7,a2
	li	t1,0
	li	t3,50
.L91:
	addi	a5,a6,-100
	mv	a3,a1
	li	a2,0
.L92:
	lh	a4,0(a5)
	lh	a0,0(a3)
	addi	a5,a5,2
	addi	a3,a3,2
	mul	a4,a4,a0
	add	a2,a2,a4
	bne	a6,a5,.L92
	srai	a2,a2,15
	sw	a2,0(a7)
	addi	t1,t1,1
	addi	a7,a7,4
	addi	a6,a6,2
	bne	t1,t3,.L91
	ret
	.size	fir, .-fir
	.align	2
	.globl	fir_no_red_ld
	.type	fir_no_red_ld, @function
fir_no_red_ld:
	addi	t4,a0,66
	mv	t5,a2
	li	t6,0
	li	t0,100
.L97:
	lh	t1,-66(t4)
	addi	a5,t4,-64
	mv	a7,a1
	li	a0,0
	li	a6,0
.L96:
	lh	a2,0(a7)
	lh	a3,0(a5)
	lh	a4,2(a7)
	mul	t3,t1,a2
	lh	t1,2(a5)
	addi	a5,a5,4
	addi	a7,a7,4
	mul	a2,a2,a3
	add	a6,t3,a6
	mul	a3,a3,a4
	add	a0,a2,a0
	mul	a4,t1,a4
	add	a6,a3,a6
	add	a0,a4,a0
	bne	t4,a5,.L96
	srai	a6,a6,15
	srai	a0,a0,15
	sw	a6,0(t5)
	sw	a0,4(t5)
	addi	t6,t6,2
	addi	t5,t5,8
	addi	t4,t4,4
	bne	t6,t0,.L97
	ret
	.size	fir_no_red_ld, .-fir_no_red_ld
	.align	2
	.globl	latsynth
	.type	latsynth, @function
latsynth:
	slli	a4,a2,1
	addi	a4,a4,-2
	add	a6,a1,a4
	add	a5,a0,a4
	lh	a7,0(a6)
	lh	a5,0(a5)
	li	a6,1
	mul	a5,a5,a7
	sub	a3,a3,a5
	ble	a2,a6,.L101
	addi	a4,a4,2
	add	a1,a1,a4
	addi	a7,a0,2
	add	a4,a0,a4
.L102:
	lh	a5,-4(a1)
	lh	a2,-4(a4)
	addi	a4,a4,-2
	addi	a1,a1,-2
	mul	a6,a2,a5
	sub	a3,a3,a6
	srai	a6,a3,16
	mul	a5,a5,a6
	srai	a5,a5,16
	add	a5,a5,a2
	sh	a5,0(a4)
	bne	a7,a4,.L102
	sh	a6,0(a0)
	mv	a0,a3
	ret
.L101:
	srai	a6,a3,16
	sh	a6,0(a0)
	mv	a0,a3
	ret
	.size	latsynth, .-latsynth
	.align	2
	.globl	iir1
	.type	iir1, @function
iir1:
	lh	a1,0(a1)
	addi	t4,a0,400
.L106:
	lw	a7,0(a3)
	lh	a4,4(a0)
	lw	t3,4(a3)
	lh	t1,6(a0)
	lh	a6,2(a0)
	lh	a5,0(a0)
	mul	a4,a4,a7
	sw	a7,4(a3)
	addi	a0,a0,8
	addi	a3,a3,8
	mul	t1,t1,t3
	mul	a6,a6,t3
	add	a4,a4,t1
	srai	a4,a4,15
	add	a4,a4,a1
	sw	a4,-8(a3)
	mul	a5,a5,a7
	add	a5,a5,a6
	srai	a5,a5,15
	add	a1,a5,a4
	bne	a0,t4,.L106
	sw	a1,0(a2)
	ret
	.size	iir1, .-iir1
	.align	2
	.globl	codebook
	.type	codebook, @function
codebook:
	mv	a0,a4
	ret
	.size	codebook, .-codebook
	.align	2
	.globl	jpegdct
	.type	jpegdct, @function
jpegdct:
	addi	sp,sp,-64
	sw	s5,40(sp)
	sw	s0,60(sp)
	sw	s1,56(sp)
	sw	s2,52(sp)
	sw	s3,48(sp)
	sw	s4,44(sp)
	sw	s6,36(sp)
	sw	s7,32(sp)
	sw	s8,28(sp)
	sw	s9,24(sp)
	sw	s10,20(sp)
	sw	s11,16(sp)
	mv	s5,a0
	addi	t6,a0,14
	addi	t5,a0,2
	addi	t4,a0,12
	addi	t3,a0,4
	addi	t1,a0,10
	addi	a7,a0,6
	addi	a6,a0,8
	li	a2,8
.L110:
	lh	a3,0(t6)
	lh	s3,0(a6)
	lh	s2,0(t4)
	lh	s1,0(t1)
	lh	t0,0(a0)
	lh	a4,0(a7)
	lh	s0,0(t5)
	lh	a5,0(t3)
	add	s4,a4,s3
	add	s7,s0,s2
	add	s6,a5,s1
	add	t2,t0,a3
	sub	t0,t0,a3
	add	a3,t2,s4
	sub	t2,t2,s4
	add	s4,s7,s6
	sub	s7,s7,s6
	add	s6,a3,s4
	sh	s6,0(a0)
	sub	a3,a3,s4
	sh	a3,0(a6)
	lh	a3,18(a1)
	lh	s8,20(a1)
	add	s6,s7,t2
	mul	a3,a3,t2
	sub	a4,a4,s3
	sub	s0,s0,s2
	sub	a5,a5,s1
	add	s3,s0,a4
	add	s1,t0,a5
	add	s4,s3,s1
	add	t2,a4,t0
	add	s2,a5,s0
	addi	a2,a2,-1
	mul	s6,s6,s8
	srai	a3,a3,13
	slli	a2,a2,16
	srli	a2,a2,16
	addi	a0,a0,16
	addi	a6,a6,16
	addi	t3,t3,16
	addi	t4,t4,16
	addi	t6,t6,16
	addi	t1,t1,16
	add	a3,s6,a3
	sh	a3,-16(t3)
	lh	a3,22(a1)
	addi	a7,a7,16
	addi	t5,t5,16
	mul	a3,a3,s7
	srai	a3,a3,13
	add	s6,s6,a3
	sh	s6,-16(t4)
	lh	s6,16(a1)
	lhu	s7,8(a1)
	lh	a3,2(a1)
	lh	s8,4(a1)
	mul	s4,s4,s6
	lh	s6,6(a1)
	mul	a3,a3,s3
	lh	s3,0(a1)
	mul	t2,t2,s8
	add	a3,a3,s4
	mul	a4,a4,s7
	add	a4,t2,a4
	add	a4,a3,a4
	slli	s7,a4,16
	srai	a4,s7,29
	sh	a4,-16(t6)
	lhu	s7,12(a1)
	mul	a4,s6,s1
	mul	a5,a5,s7
	add	a4,a4,s4
	mul	s1,s2,s3
	add	a5,s1,a5
	add	a5,a4,a5
	slli	s2,a5,16
	srai	a5,s2,29
	sh	a5,-16(t1)
	lhu	a5,10(a1)
	mul	s0,s0,a5
	add	s1,s1,s0
	add	a3,a3,s1
	slli	a5,a3,16
	srai	a3,a5,29
	sh	a3,-16(a7)
	lhu	a5,14(a1)
	mul	t0,t0,a5
	add	t2,t2,t0
	add	a4,a4,t2
	slli	a5,a4,16
	srai	a4,a5,29
	sh	a4,-16(t5)
	bne	a2,zero,.L110
	li	s7,16
	li	t1,0
	li	s10,1
	li	s11,126
	li	s8,14
	li	s3,8
.L112:
	bne	s3,s10,.L117
	lw	s0,60(sp)
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
	jr	ra
.L117:
	add	s5,s5,s7
	sub	t3,s11,s8
	add	t3,t3,s5
	addi	s5,t3,-128
	li	s7,2
	li	s8,112
	li	s3,1
	addi	s1,t3,-16
	addi	s0,t3,-112
	addi	t2,t3,-32
	addi	t0,t3,-96
	addi	t6,t3,-48
	addi	t5,t3,-80
	mv	s2,s5
	addi	t3,t3,-64
	addi	s6,t1,3
	addi	a7,t1,16
	li	t4,8
	sw	s8,4(sp)
	sw	s7,8(sp)
	sw	s3,12(sp)
.L111:
	lh	t1,0(s1)
	lh	a0,0(t3)
	lh	a3,0(s2)
	lh	a4,0(t5)
	lh	a6,0(t2)
	lh	s4,0(t6)
	lh	a2,0(s0)
	lh	a5,0(t0)
	add	s3,t1,a3
	sub	a3,a3,t1
	add	t1,a0,a4
	sub	a4,a4,a0
	add	a0,t1,s3
	sub	s3,s3,t1
	add	t1,a6,a2
	sub	a2,a2,a6
	add	a6,s4,a5
	sub	a5,a5,s4
	add	s4,a6,t1
	sub	t1,t1,a6
	add	a6,s4,a0
	sra	a6,a6,s6
	sub	a0,a0,s4
	sh	a6,0(s2)
	sra	a0,a0,s6
	sh	a0,0(t3)
	lh	a0,18(a1)
	lh	a6,20(a1)
	add	s7,s3,t1
	mul	a0,a0,s3
	add	s4,a4,a2
	add	s3,a5,a3
	add	s9,s3,s4
	add	s8,a3,a4
	addi	t4,t4,-1
	slli	t4,t4,16
	srli	t4,t4,16
	addi	s2,s2,2
	addi	t3,t3,2
	mul	a6,a6,s7
	sra	a0,a0,a7
	add	s7,a2,a5
	addi	t0,t0,2
	addi	t2,t2,2
	addi	s1,s1,2
	addi	t6,t6,2
	addi	t5,t5,2
	addi	s0,s0,2
	add	a0,a6,a0
	sh	a0,-2(t0)
	lh	a0,22(a1)
	mul	a0,a0,t1
	sra	a0,a0,a7
	add	a6,a6,a0
	sh	a6,-2(t2)
	lh	t1,2(a1)
	lh	a0,6(a1)
	lh	a6,16(a1)
	mul	t1,t1,s4
	lhu	s4,8(a1)
	mul	a0,a0,s3
	lh	s3,4(a1)
	mul	a6,a6,s9
	mul	s3,s3,s8
	add	t1,t1,a6
	add	a0,a0,a6
	lh	a6,0(a1)
	mul	a4,a4,s4
	add	a4,s3,a4
	add	a4,t1,a4
	slli	a4,a4,16
	srai	a4,a4,16
	sra	a4,a4,a7
	sh	a4,-2(s1)
	lhu	a4,12(a1)
	mul	a6,a6,s7
	mul	a5,a5,a4
	add	a5,a6,a5
	add	a5,a0,a5
	slli	a5,a5,16
	srai	a5,a5,16
	sra	a5,a5,a7
	sh	a5,-2(t6)
	lhu	a5,10(a1)
	mul	a2,a2,a5
	add	a6,a6,a2
	add	t1,t1,a6
	slli	t1,t1,16
	srai	t1,t1,16
	sra	t1,t1,a7
	sh	t1,-2(t5)
	lhu	a5,14(a1)
	mul	a3,a3,a5
	add	s3,s3,a3
	add	a0,a0,s3
	slli	a0,a0,16
	srai	a0,a0,16
	sra	a0,a0,a7
	sh	a0,-2(s0)
	bne	t4,zero,.L111
	lw	s8,4(sp)
	lw	s7,8(sp)
	lw	s3,12(sp)
	mv	t1,s6
	j	.L112
	.size	jpegdct, .-jpegdct
	.align	2
	.type	benchmark_body.constprop.0.isra.0, @function
benchmark_body.constprop.0.isra.0:
	addi	sp,sp,-864
	lui	a2,%hi(.LANCHOR0)
	sw	s0,856(sp)
	sw	s1,852(sp)
	sw	s2,848(sp)
	sw	s3,844(sp)
	sw	s9,820(sp)
	sw	s10,816(sp)
	sw	s11,812(sp)
	lui	s2,%hi(.LANCHOR1)
	addi	a2,a2,%lo(.LANCHOR0)
	lui	s1,%hi(.LANCHOR1+400)
	lui	s9,%hi(.LANCHOR0+1200)
	lui	a0,%hi(.LANCHOR0+800)
	lui	s11,%hi(.LANCHOR0+1100)
	lui	s10,%hi(.LANCHOR0+1500)
	lui	s0,%hi(.LANCHOR0+1300)
	lui	t5,%hi(.LANCHOR0+798)
	li	s3,45056
	sw	s4,840(sp)
	sw	s5,836(sp)
	sw	s6,832(sp)
	sw	s7,828(sp)
	sw	s8,824(sp)
	sw	ra,860(sp)
	addi	s2,s2,%lo(.LANCHOR1)
	addi	s8,a2,1600
	addi	s1,s1,%lo(.LANCHOR1+400)
	addi	s9,s9,%lo(.LANCHOR0+1200)
	addi	s7,a0,%lo(.LANCHOR0+800)
	addi	s11,s11,%lo(.LANCHOR0+1100)
	addi	s10,s10,%lo(.LANCHOR0+1500)
	addi	s0,s0,%lo(.LANCHOR0+1300)
	addi	s6,t5,%lo(.LANCHOR0+798)
	addi	s3,s3,-1366
	li	s5,87
	li	s4,50
.L129:
	mv	a5,s2
	mv	a4,sp
.L119:
	lw	a6,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	lw	a3,12(a5)
	sw	a6,0(a4)
	sw	a0,4(a4)
	sw	a1,8(a4)
	sw	a3,12(a4)
	addi	a5,a5,16
	addi	a4,a4,16
	bne	a5,s1,.L119
	addi	a4,sp,400
.L120:
	lw	a3,12(a5)
	lw	a6,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	sw	a3,12(a4)
	lui	a3,%hi(.LANCHOR1+800)
	sw	a6,0(a4)
	sw	a0,4(a4)
	sw	a1,8(a4)
	addi	a5,a5,16
	addi	a3,a3,%lo(.LANCHOR1+800)
	addi	a4,a4,16
	bne	a5,a3,.L120
	addi	a1,sp,400
	mv	a3,sp
	mv	a4,s7
	mv	a5,s9
.L121:
	lw	a6,0(a3)
	lw	a0,0(a1)
	addi	a5,a5,4
	sw	a6,0(a4)
	sw	a0,-4(a5)
	addi	a3,a3,4
	addi	a4,a4,4
	addi	a1,a1,4
	bne	s8,a5,.L121
	mv	a3,s9
	mv	a4,s7
.L122:
	lh	a1,0(a3)
	lhu	a0,0(a4)
	addi	a4,a4,2
	slli	a5,a1,1
	add	a5,a5,a1
	srai	a5,a5,15
	add	a5,a5,a0
	sh	a5,-2(a4)
	addi	a3,a3,2
	bne	s11,a4,.L122
	lw	a6,0(a2)
	mv	a1,s7
	mv	a5,s9
	li	a0,3
.L123:
	lh	a3,0(a5)
	lh	a4,0(a1)
	addi	a5,a5,2
	mul	a7,a3,a3
	addi	a1,a1,2
	mul	a4,a4,a3
	add	a0,a0,a7
	add	a6,a6,a4
	bne	s10,a5,.L123
	lui	a5,%hi(c)
	sw	a6,0(a2)
	sh	a0,%lo(c)(a5)
	mv	t1,a2
	mv	a7,s7
	li	a6,0
.L124:
	mv	a5,s9
	mv	a3,a7
	li	a1,0
.L125:
	lh	a4,0(a3)
	lh	a0,0(a5)
	addi	a5,a5,2
	addi	a3,a3,2
	mul	a4,a4,a0
	add	a1,a1,a4
	bne	s0,a5,.L125
	srai	a1,a1,15
	sw	a1,0(t1)
	addi	a6,a6,1
	addi	t1,t1,4
	addi	a7,a7,2
	bne	a6,s4,.L124
	mv	a1,s9
	mv	a0,s7
	call	fir_no_red_ld
	lui	a5,%hi(.LANCHOR0)
	addi	a2,a5,%lo(.LANCHOR0)
	lh	a3,998(a2)
	lh	a5,1398(a2)
	lui	a4,%hi(.LANCHOR0+996)
	lui	a1,%hi(.LANCHOR0+1396)
	mul	a3,a3,a5
	addi	a4,a4,%lo(.LANCHOR0+996)
	addi	a1,a1,%lo(.LANCHOR0+1396)
	sub	a3,s3,a3
.L127:
	lh	a0,0(a4)
	lh	a5,0(a1)
	addi	a4,a4,-2
	addi	a1,a1,-2
	mul	a6,a0,a5
	sub	a3,a3,a6
	srai	a6,a3,16
	mul	a5,a5,a6
	srai	a5,a5,16
	add	a5,a5,a0
	sh	a5,4(a4)
	bne	s6,a4,.L127
	lh	t1,1200(a2)
	lui	a4,%hi(d)
	sh	a6,800(a2)
	sw	a3,%lo(d)(a4)
	mv	a0,a2
	mv	a1,s7
.L128:
	lw	a6,0(a0)
	lh	a5,4(a1)
	lh	a4,0(a1)
	lw	t3,4(a0)
	lh	a7,6(a1)
	mul	a5,a5,a6
	sw	a6,4(a0)
	addi	a1,a1,8
	addi	a0,a0,8
	mul	a4,a4,a6
	lh	a6,-6(a1)
	mul	a7,a7,t3
	mul	a6,a6,t3
	add	a5,a5,a7
	srai	a5,a5,15
	add	a5,a5,t1
	sw	a5,-8(a0)
	add	a4,a4,a6
	srai	a4,a4,15
	add	t1,a4,a5
	bne	a1,s9,.L128
	lui	a5,%hi(e)
	mv	a0,s7
	sw	t1,400(a2)
	sw	a3,%lo(e)(a5)
	call	jpegdct
	lui	a5,%hi(.LANCHOR0)
	addi	s5,s5,-1
	addi	a2,a5,%lo(.LANCHOR0)
	bne	s5,zero,.L129
	lw	ra,860(sp)
	lw	s0,856(sp)
	lw	s1,852(sp)
	lw	s2,848(sp)
	lw	s3,844(sp)
	lw	s4,840(sp)
	lw	s5,836(sp)
	lw	s6,832(sp)
	lw	s7,828(sp)
	lw	s8,824(sp)
	lw	s9,820(sp)
	lw	s10,816(sp)
	lw	s11,812(sp)
	addi	sp,sp,864
	jr	ra
	.size	benchmark_body.constprop.0.isra.0, .-benchmark_body.constprop.0.isra.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	ble	a0,zero,.L163
	addi	sp,sp,-880
	lui	a2,%hi(.LANCHOR0)
	sw	s0,872(sp)
	sw	s1,868(sp)
	sw	s2,864(sp)
	sw	s4,856(sp)
	sw	s9,836(sp)
	sw	s10,832(sp)
	sw	s11,828(sp)
	sw	a0,12(sp)
	lui	s2,%hi(.LANCHOR1)
	addi	a2,a2,%lo(.LANCHOR0)
	lui	s1,%hi(.LANCHOR1+400)
	lui	s9,%hi(.LANCHOR0+1200)
	lui	a0,%hi(.LANCHOR0+800)
	lui	s11,%hi(.LANCHOR0+1100)
	lui	s10,%hi(.LANCHOR0+1500)
	lui	s0,%hi(.LANCHOR0+1300)
	lui	t6,%hi(.LANCHOR0+798)
	li	s4,45056
	sw	s3,860(sp)
	sw	s5,852(sp)
	sw	s6,848(sp)
	sw	s7,844(sp)
	sw	s8,840(sp)
	sw	ra,876(sp)
	addi	s2,s2,%lo(.LANCHOR1)
	addi	s8,a2,1600
	addi	s1,s1,%lo(.LANCHOR1+400)
	addi	s9,s9,%lo(.LANCHOR0+1200)
	addi	s7,a0,%lo(.LANCHOR0+800)
	addi	s11,s11,%lo(.LANCHOR0+1100)
	addi	s10,s10,%lo(.LANCHOR0+1500)
	addi	s0,s0,%lo(.LANCHOR0+1300)
	addi	s6,t6,%lo(.LANCHOR0+798)
	addi	s4,s4,-1366
	li	s5,0
	li	s3,50
.L152:
	mv	a5,s2
	addi	a4,sp,16
.L142:
	lw	a6,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	lw	a3,12(a5)
	sw	a6,0(a4)
	sw	a0,4(a4)
	sw	a1,8(a4)
	sw	a3,12(a4)
	addi	a5,a5,16
	addi	a4,a4,16
	bne	a5,s1,.L142
	addi	a4,sp,416
.L143:
	lw	a3,12(a5)
	lw	a6,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	sw	a3,12(a4)
	lui	a3,%hi(.LANCHOR1+800)
	sw	a6,0(a4)
	sw	a0,4(a4)
	sw	a1,8(a4)
	addi	a5,a5,16
	addi	a3,a3,%lo(.LANCHOR1+800)
	addi	a4,a4,16
	bne	a5,a3,.L143
	addi	a1,sp,416
	addi	a3,sp,16
	mv	a4,s7
	mv	a5,s9
.L144:
	lw	a6,0(a3)
	lw	a0,0(a1)
	addi	a5,a5,4
	sw	a6,0(a4)
	sw	a0,-4(a5)
	addi	a3,a3,4
	addi	a4,a4,4
	addi	a1,a1,4
	bne	s8,a5,.L144
	mv	a3,s9
	mv	a4,s7
.L145:
	lh	a1,0(a3)
	lhu	a0,0(a4)
	addi	a4,a4,2
	slli	a5,a1,1
	add	a5,a5,a1
	srai	a5,a5,15
	add	a5,a5,a0
	sh	a5,-2(a4)
	addi	a3,a3,2
	bne	s11,a4,.L145
	lw	a6,0(a2)
	mv	a1,s7
	mv	a4,s9
	li	a0,3
.L146:
	lh	a5,0(a4)
	lh	a3,0(a1)
	addi	a4,a4,2
	addi	a1,a1,2
	mul	a3,a3,a5
	mul	a5,a5,a5
	add	a6,a6,a3
	add	a0,a0,a5
	bne	s10,a4,.L146
	lui	a5,%hi(c)
	sw	a6,0(a2)
	sh	a0,%lo(c)(a5)
	mv	a7,a2
	mv	a6,s7
	li	a0,0
.L147:
	mv	a5,s9
	mv	a3,a6
	li	a1,0
.L148:
	lh	a4,0(a3)
	lh	t1,0(a5)
	addi	a5,a5,2
	addi	a3,a3,2
	mul	a4,a4,t1
	add	a1,a1,a4
	bne	s0,a5,.L148
	srai	a1,a1,15
	sw	a1,0(a7)
	addi	a0,a0,1
	addi	a7,a7,4
	addi	a6,a6,2
	bne	a0,s3,.L147
	mv	a1,s9
	mv	a0,s7
	call	fir_no_red_ld
	lui	a5,%hi(.LANCHOR0)
	addi	a2,a5,%lo(.LANCHOR0)
	lh	a3,998(a2)
	lh	a5,1398(a2)
	lui	a4,%hi(.LANCHOR0+996)
	lui	a1,%hi(.LANCHOR0+1396)
	mul	a3,a3,a5
	addi	a4,a4,%lo(.LANCHOR0+996)
	addi	a1,a1,%lo(.LANCHOR0+1396)
	sub	a3,s4,a3
.L150:
	lh	a0,0(a4)
	lh	a5,0(a1)
	addi	a4,a4,-2
	addi	a1,a1,-2
	mul	a6,a0,a5
	sub	a3,a3,a6
	srai	a6,a3,16
	mul	a5,a5,a6
	srai	a5,a5,16
	add	a5,a5,a0
	sh	a5,4(a4)
	bne	s6,a4,.L150
	lh	t1,1200(a2)
	lui	a4,%hi(d)
	sh	a6,800(a2)
	sw	a3,%lo(d)(a4)
	mv	a0,a2
	mv	a1,s7
.L151:
	lw	a6,0(a0)
	lh	a5,4(a1)
	lh	a4,0(a1)
	lw	t3,4(a0)
	lh	a7,6(a1)
	mul	a5,a5,a6
	sw	a6,4(a0)
	addi	a1,a1,8
	addi	a0,a0,8
	mul	a4,a4,a6
	lh	a6,-6(a1)
	mul	a7,a7,t3
	mul	a6,a6,t3
	add	a5,a5,a7
	srai	a5,a5,15
	add	a5,a5,t1
	sw	a5,-8(a0)
	add	a4,a4,a6
	srai	a4,a4,15
	add	t1,a4,a5
	bne	a1,s9,.L151
	lui	a5,%hi(e)
	mv	a0,s7
	sw	t1,400(a2)
	sw	a3,%lo(e)(a5)
	call	jpegdct
	lw	a5,12(sp)
	lui	a4,%hi(.LANCHOR0)
	addi	s5,s5,1
	addi	a2,a4,%lo(.LANCHOR0)
	bne	s5,a5,.L152
	lw	ra,876(sp)
	lw	s0,872(sp)
	lw	s1,868(sp)
	lw	s2,864(sp)
	lw	s3,860(sp)
	lw	s4,856(sp)
	lw	s5,852(sp)
	lw	s6,848(sp)
	lw	s7,844(sp)
	lw	s8,840(sp)
	lw	s9,836(sp)
	lw	s10,832(sp)
	lw	s11,828(sp)
	addi	sp,sp,880
	jr	ra
.L163:
	ret
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	ret
	.size	initialise_benchmark, .-initialise_benchmark
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
	call	benchmark_body.constprop.0.isra.0
	lw	ra,12(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	benchmark, .-benchmark
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a4,%hi(.LANCHOR1)
	addi	a4,a4,%lo(.LANCHOR1)
	addi	sp,sp,-800
	addi	a5,a4,800
	addi	a3,a4,1600
	mv	a4,sp
.L172:
	lw	a6,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	sw	a6,0(a4)
	sw	a0,4(a4)
	sw	a1,8(a4)
	sw	a2,12(a4)
	addi	a5,a5,16
	addi	a4,a4,16
	bne	a5,a3,.L172
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	addi	a1,a5,800
	mv	a4,sp
.L176:
	lbu	a2,0(a5)
	lbu	a3,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a2,a3,.L182
	bne	a5,a1,.L176
	lui	a5,%hi(c)
	lh	a4,%lo(c)(a5)
	li	a5,12288
	addi	a5,a5,-2045
	li	a0,0
	beq	a4,a5,.L183
.L171:
	addi	sp,sp,800
	jr	ra
.L182:
	li	a0,0
	addi	sp,sp,800
	jr	ra
.L183:
	lui	a5,%hi(d)
	lw	a4,%lo(d)(a5)
	li	a5,-441884672
	addi	a5,a5,-1558
	bne	a4,a5,.L171
	lui	a5,%hi(e)
	lw	a0,%lo(e)(a5)
	li	a5,441884672
	addi	a5,a5,1558
	add	a0,a0,a5
	seqz	a0,a0
	j	.L171
	.size	verify_benchmark, .-verify_benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
 #APP
# 15 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	li a0, 0
# 0 "" 2
 #NO_APP
	li	a0,1
	call	benchmark_body.isra.0
	call	start_trigger
	call	benchmark
	sw	zero,12(sp)
	call	stop_trigger
	lw	a0,12(sp)
	call	verify_benchmark
	lw	ra,28(sp)
	xori	a0,a0,1
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
.LC0:
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
.LC1:
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
.LC2:
	.word	3760
	.word	4269
	.word	3126
	.word	1030
	.word	2453
	.word	-4601
	.word	1981
	.word	-1056
	.word	2621
	.word	4269
	.word	3058
	.word	1030
	.word	2378
	.word	-4601
	.word	1902
	.word	-1056
	.word	2548
	.word	4269
	.word	2988
	.word	1030
	.word	2300
	.word	-4601
	.word	1822
	.word	-1056
	.word	2474
	.word	4269
	.word	2917
	.word	1030
	.word	2220
	.word	-4601
	.word	1738
	.word	-1056
	.word	2398
	.word	4269
	.word	2844
	.word	1030
	.word	2140
	.word	-4601
	.word	1655
	.word	-1056
	.word	2321
	.word	4269
	.word	2770
	.word	1030
	.word	2058
	.word	-4601
	.word	1569
	.word	-1056
	.word	2242
	.word	4269
	.word	2152
	.word	1030
	.word	1683
	.word	-4601
	.word	1627
	.word	-1056
	.word	2030
	.word	4269
	.word	2080
	.word	1030
	.word	1611
	.word	-4601
	.word	1555
	.word	-1056
	.word	1958
	.word	4269
	.word	2008
	.word	1030
	.word	1539
	.word	-4601
	.word	1483
	.word	-1056
	.word	1886
	.word	4269
	.word	1935
	.word	1030
	.word	1466
	.word	-4601
	.word	1410
	.word	-1056
	.word	1813
	.word	4269
	.word	1862
	.word	1030
	.word	1393
	.word	-4601
	.word	1337
	.word	-1056
	.word	1740
	.word	4269
	.word	1789
	.word	1030
	.word	1320
	.word	-4601
	.word	1264
	.word	-1056
	.word	1667
	.word	4269
	.word	1716
	.word	1030
	.word	1968
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	output, @object
	.size	output, 800
output:
	.zero	800
	.type	a, @object
	.size	a, 400
a:
	.zero	400
	.type	b, @object
	.size	b, 400
b:
	.zero	400
	.section	.sbss,"aw",@nobits
	.align	2
	.type	e, @object
	.size	e, 4
e:
	.zero	4
	.type	d, @object
	.size	d, 4
d:
	.zero	4
	.type	c, @object
	.size	c, 2
c:
	.zero	2
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
