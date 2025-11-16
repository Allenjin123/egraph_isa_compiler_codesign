	.file	"basicmath_small.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	my_cos, @function
my_cos:
	addi	a3,zero,637
	mul	a3,a0,a3
	lui	a1,67109
	addi	a1,a1,-557
	addi	a4,zero,-1571
	addi	t3,zero,-167
	lui	a7,274878
	addi	a7,a7,-381
	addi	t1,zero,1
	mulh	a5,a3,a1
	srai	a3,a3,31
	srai	a5,a5,6
	sub	a5,a5,a3
	addi	a5,a5,500
	mulhu	a5,a5,a1
	srli	a5,a5,6
	mul	a4,a5,a4
	addi	t0,x0,3
	and	a5,t0,a5
	add	a0,a4,a0
	mul	a6,a0,a0
	mulhu	a4,a6,a1
	srli	a4,a4,6
	mul	a2,a0,a4
	mul	a2,a2,t3
	mulh	a3,a2,a7
	srai	a2,a2,31
	srai	a3,a3,18
	sub	a3,a3,a2
	add	a3,a3,a0
	beq	a5,t1,.L2
	mul	a0,a4,a4
	addi	t1,zero,42
	srai	a4,a6,31
	addi	a2,zero,2
	mul	a0,a0,t1
	mulh	a6,a6,a1
	mulhu	a0,a0,a7
	srai	a6,a6,7
	sub	a4,a4,a6
	addi	a4,a4,1000
	srli	a0,a0,18
	add	a0,a0,a4
	beq	a5,a2,.L3
	beq	a5,zero,.L1
	addi	a0,a3,0
	jalr	zero,ra,0
.L3:
	sub	a0,zero,a0
.L1:
	jalr	zero,ra,0
.L2:
	sub	a0,zero,a3
	jalr	zero,ra,0
	.size	my_cos, .-my_cos
	.align	2
	.type	SolveCubic, @function
SolveCubic:
	addi	sp,sp,-48
	addi	a7,zero,1000
	sw	s0,40(sp)
	mul	s0,a1,a7
	sw	s9,4(sp)
	addi	s9,a5,0
	lui	t1,67109
	addi	t1,t1,-557
	sw	s2,32(sp)
	lui	t5,233017
	addi	t5,t5,-455
	sw	s8,8(sp)
	addi	s8,a4,0
	div	s0,s0,a0
	lui	a6,310689
	addi	a6,a6,759
	sw	ra,44(sp)
	addi	a1,zero,999
	mul	a2,a2,a7
	div	a2,a2,a0
	mul	a3,a3,a7
	slli	s2,a2,2
	sub	s2,a2,s2
	mul	a5,s0,s0
	div	a0,a3,a0
	mulhu	a5,a5,t1
	slli	t3,a0,3
	sub	t3,t3,a0
	slli	t3,t3,2
	sub	t3,t3,a0
	srli	a5,a5,6
	add	s2,s2,a5
	mul	a5,a5,s0
	srai	t4,s2,31
	mul	a2,s0,a2
	mulh	t5,s2,t5
	slli	a4,a2,3
	add	a4,a4,a2
	srai	a0,a4,31
	mulh	a3,a5,t1
	srai	t5,t5,1
	sub	t5,t5,t4
	srai	a5,a5,31
	mulh	a4,a4,t1
	srai	a3,a3,5
	sub	a5,a3,a5
	mul	a3,t5,t5
	srai	a4,a4,6
	sub	a0,a0,a4
	add	a0,a0,a5
	add	a0,a0,t3
	srai	a5,a0,31
	mulh	a4,a0,a6
	mulhu	a3,a3,t1
	srai	a4,a4,4
	sub	a4,a4,a5
	srli	a3,a3,6
	mul	a3,a3,t5
	mul	a5,a4,a4
	srai	a2,a3,31
	mulh	a6,a3,t1
	mulhu	a5,a5,t1
	srai	a6,a6,6
	sub	a2,a2,a6
	srli	a5,a5,6
	add	a5,a5,a2
	bge	a1,a3,.+8
	jal	x0,.L10
	bge	zero,a5,.L52
.L12:
	addi	a3,zero,1
	sw	a3,0(s8)
	addi	a2,zero,1000
	addi	a3,a5,0
	bge	a5,a2,.+8
	jal	x0,.L53
.L24:
	addi	a1,zero,1000
	mul	a5,a5,a1
	srai	a6,a4,31
	and	a2,a4,a6
	sub	a2,a2,a6
	sub	a2,a4,a2
	and	t0,a4,a6
	sub	a2,a2,t0
	sub	a2,a2,a6
	div	a4,a5,a3
	add	a4,a4,a3
	srai	a4,a4,1
	div	a3,a5,a4
	add	a3,a3,a4
	srai	a3,a3,1
	div	a4,a5,a3
	add	a4,a4,a3
	srai	a4,a4,1
	div	a3,a5,a4
	add	a3,a3,a4
	srai	a3,a3,1
	div	a4,a5,a3
	add	a4,a4,a3
	srai	a4,a4,1
	div	a3,a5,a4
	add	a3,a3,a4
	srai	a3,a3,1
	div	a4,a5,a3
	add	a4,a4,a3
	srai	a4,a4,1
	div	a3,a5,a4
	add	a3,a3,a4
	srai	a3,a3,1
	div	a4,a5,a3
	add	a4,a4,a3
	srai	a4,a4,1
	div	a3,a5,a4
	add	a3,a3,a4
	srai	a3,a3,1
	div	a4,a5,a3
	add	a4,a4,a3
	srai	a4,a4,1
	div	a5,a5,a4
	add	a5,a5,a4
	srai	a5,a5,1
	add	a2,a2,a5
	beq	a2,zero,.L25
	addi	a3,a2,0
	bge	a2,a1,.+8
	jal	x0,.L54
.L26:
	addi	a5,zero,1000
	mul	a2,a2,a5
	lui	a6,67109
	lui	a7,349525
	addi	a6,a6,-557
	addi	a7,a7,1366
	addi	a1,zero,18
.L28:
	slli	a4,a3,1
	addi	a1,a1,-1
	mul	a5,a3,a3
	mulhu	a5,a5,a6
	srli	a5,a5,6
	beq	a5,zero,.L27
	div	a5,a2,a5
	add	a5,a4,a5
	mulh	a3,a5,a7
	srai	a5,a5,31
	sub	a3,a3,a5
	bne	a1,zero,.L28
.L27:
	addi	a2,zero,0
	beq	a3,zero,.L25
	addi	a5,zero,1000
	mul	t5,t5,a5
	div	t5,t5,a3
	add	a2,t5,a3
.L25:
	addi	a4,zero,-53
	addi	a5,zero,-1000
	bge	a0,a4,.+8
	jal	x0,.L55
.L29:
	mul	a2,a2,a5
	lui	a5,67109
	addi	a5,a5,-557
	lui	a3,349525
	addi	a3,a3,1366
	srai	a4,s0,31
	lw	ra,44(sp)
	lw	s2,32(sp)
	lw	s8,8(sp)
	mulh	a5,a2,a5
	srai	a2,a2,31
	mulh	s0,s0,a3
	srai	a5,a5,6
	sub	a5,a5,a2
	sub	a4,a4,s0
	lw	s0,40(sp)
	add	a5,a4,a5
	sw	a5,0(s9)
	lw	s9,4(sp)
	addi	sp,sp,48
	jalr	zero,ra,0
.L10:
	bge	zero,a5,.+8
	jal	x0,.L12
	sw	s1,36(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sub	a1,zero,a2
	bge	a1,a7,.+8
	jal	x0,.L56
.L13:
	addi	a5,zero,-1000
	mul	a5,a2,a5
	addi	t6,zero,1
	div	a3,a5,a1
	add	a3,a3,a1
	srai	a3,a3,1
	div	a2,a5,a3
	add	a2,a2,a3
	srai	a2,a2,1
	div	a3,a5,a2
	add	a3,a3,a2
	srai	a3,a3,1
	div	a2,a5,a3
	add	a2,a2,a3
	srai	a2,a2,1
	div	a3,a5,a2
	add	a3,a3,a2
	srai	a3,a3,1
	div	a2,a5,a3
	add	a2,a2,a3
	srai	a2,a2,1
	div	a3,a5,a2
	add	a3,a3,a2
	srai	a3,a3,1
	div	a2,a5,a3
	add	a2,a2,a3
	srai	a2,a2,1
	div	a3,a5,a2
	add	a3,a3,a2
	srai	a3,a3,1
	div	a2,a5,a3
	add	a2,a2,a3
	srai	a2,a2,1
	div	a3,a5,a2
	add	a3,a3,a2
	srai	a3,a3,1
	div	a5,a5,a3
	add	a5,a5,a3
	bge	t6,a5,.L11
	addi	t4,zero,1000
	mul	t4,a4,t4
	srai	a5,a5,1
	addi	a4,zero,999
	div	t4,t4,a5
	bge	a4,t4,.+8
	jal	x0,.L30
	sw	s6,16(sp)
	sw	s7,12(sp)
	addi	a5,zero,-999
	bge	t4,a5,.+8
	jal	x0,.L32
	lui	t3,1
	lui	a0,67109
	lui	a7,274878
	addi	t3,t3,-954
	addi	a0,a0,-557
	addi	a7,a7,-381
	addi	a6,zero,60
	addi	t1,zero,0
	addi	a4,zero,637
	addi	t2,zero,-1571
	addi	t0,zero,-167
	addi	s1,zero,42
	addi	a5,zero,2
.L20:
	add	a3,t1,t3
	srli	a1,a3,31
	add	a1,a1,a3
	srai	a1,a1,1
	mul	a2,a1,a4
	mulh	a3,a2,a0
	srai	a2,a2,31
	srai	a3,a3,6
	sub	a3,a3,a2
	addi	a3,a3,500
	mulhu	a3,a3,a0
	srli	a3,a3,6
	mul	s3,a3,t2
	addi	a2,x0,3
	and	a3,a3,a2
	add	s3,s3,a1
	mul	s6,s3,s3
	mulhu	a2,s6,a0
	srai	s5,s6,31
	srli	a2,a2,6
	mul	s4,s3,a2
	mul	s4,s4,t0
	mulh	s7,s4,a7
	srai	s4,s4,31
	srai	s7,s7,18
	sub	s4,s7,s4
	add	s3,s4,s3
	sub	s4,zero,s3
	beq	a3,t6,.L18
	mul	a2,a2,a2
	mul	a2,a2,s1
	mulh	s6,s6,a0
	mulhu	a2,a2,a7
	srai	s6,s6,7
	sub	s5,s5,s6
	addi	s5,s5,1000
	srli	a2,a2,18
	add	s4,a2,s5
	beq	a3,a5,.L17
	beq	a3,zero,.L18
	addi	s4,s3,0
.L18:
	bge	t4,s4,.L33
	addi	t1,a1,0
.L19:
	addi	a6,a6,-1
	bne	a6,zero,.L20
	add	t1,t1,t3
	srli	s3,t1,31
	add	s3,s3,t1
	lui	a5,2
	lui	a2,3
	srai	s3,s3,1
	addi	a2,a2,280
	addi	a5,a5,-1908
	lui	a4,349525
	lui	a3,174763
	add	a5,s3,a5
	addi	a4,a4,1366
	add	s3,s3,a2
	addi	a3,a3,-1365
	mulh	s1,a5,a4
	srai	a1,s3,31
	srai	a2,t1,31
	lw	s6,16(sp)
	lw	s7,12(sp)
	srai	a5,a5,31
	mulh	s3,s3,a4
	sub	s1,s1,a5
	mulh	t1,t1,a3
	sub	s3,s3,a1
	sub	a0,t1,a2
.L14:
	addi	a5,zero,3
	sw	a5,0(s8)
	addi	a5,zero,8
	addi	s4,zero,0
	bge	a5,s2,.L21
	addi	a5,zero,1000
	addi	a3,t5,0
	bge	t5,a5,.L22
	addi	a3,a5,0
.L22:
	addi	a5,zero,1000
	mul	a5,t5,a5
	div	a4,a5,a3
	add	a4,a4,a3
	srai	a4,a4,1
	div	a3,a5,a4
	add	a3,a3,a4
	srai	a3,a3,1
	div	a4,a5,a3
	add	a4,a4,a3
	srai	a4,a4,1
	div	a3,a5,a4
	add	a3,a3,a4
	srai	a3,a3,1
	div	a4,a5,a3
	add	a4,a4,a3
	srai	a4,a4,1
	div	a3,a5,a4
	add	a3,a3,a4
	srai	a3,a3,1
	div	a4,a5,a3
	add	a4,a4,a3
	srai	a4,a4,1
	div	a3,a5,a4
	add	a3,a3,a4
	srai	a3,a3,1
	div	a4,a5,a3
	add	a4,a4,a3
	srai	a4,a4,1
	div	a3,a5,a4
	add	a3,a3,a4
	srai	a3,a3,1
	div	a4,a5,a3
	add	a4,a4,a3
	srai	a4,a4,1
	div	a5,a5,a4
	add	a5,a5,a4
	addi	t0,x0,-2
	and	a5,t0,a5
	sub	s4,zero,a5
.L21:
	lui	s5,349525
	addi	s5,s5,1366
	mulh	s5,s0,s5
.Lpcrel_1:
	auipc	ra,%pcrel_hi(my_cos)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
	srai	s0,s0,31
	mul	a4,a0,s4
	sub	s5,s5,s0
	lui	s0,67109
	addi	s0,s0,-557
	addi	a0,s1,0
	mulh	a5,a4,s0
	srai	a4,a4,31
	srai	a5,a5,6
	sub	a5,a5,a4
	sub	a5,a5,s5
	sw	a5,0(s9)
.Lpcrel_2:
	auipc	ra,%pcrel_hi(my_cos)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_2)
	mul	a4,a0,s4
	addi	a0,s3,0
	mulh	a5,a4,s0
	srai	a4,a4,31
	srai	a5,a5,6
	sub	a5,a5,a4
	sub	a5,a5,s5
	sw	a5,4(s9)
.Lpcrel_3:
	auipc	ra,%pcrel_hi(my_cos)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_3)
	mul	a0,a0,s4
	lw	ra,44(sp)
	lw	s1,36(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s2,32(sp)
	lw	s8,8(sp)
	mulh	a5,a0,s0
	srai	a0,a0,31
	lw	s0,40(sp)
	srai	a5,a5,6
	sub	a5,a5,a0
	sub	a5,a5,s5
	sw	a5,8(s9)
	lw	s5,20(sp)
	lw	s9,4(sp)
	addi	sp,sp,48
	jalr	zero,ra,0
.L53:
	addi	a3,a2,0
	jal	x0,.L24
.L55:
	addi	a5,zero,1000
	jal	x0,.L29
.L52:
	sw	s1,36(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
.L11:
	addi	a5,zero,-53
	lui	s3,1
	bge	a0,a5,.+8
	jal	x0,.L57
	lui	s1,1
	addi	s3,s3,93
	addi	s1,s1,-2002
	addi	a0,zero,0
	jal	x0,.L14
.L54:
	addi	a3,a1,0
	jal	x0,.L26
.L30:
	lui	s3,1
	lui	s1,1
	addi	s3,s1,93
	addi	s1,s1,-2002
	addi	a0,zero,0
	jal	x0,.L14
.L56:
	addi	a1,a7,0
	jal	x0,.L13
.L57:
	lui	s1,1
	addi	s3,s3,1140
	addi	s1,s1,-954
	addi	a0,zero,1047
	jal	x0,.L14
.L33:
	addi	t3,a1,0
	jal	x0,.L19
.L17:
	sub	s4,zero,s4
	jal	x0,.L18
.L32:
	lui	s3,1
	lui	s1,1
	lw	s6,16(sp)
	lw	s7,12(sp)
	addi	s3,s1,1140
	addi	s1,s1,-954
	addi	a0,zero,1047
	jal	x0,.L14
	.size	SolveCubic, .-SolveCubic
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"********* CUBIC FUNCTIONS ***********"
	.align	2
.LC1:
	.string	"Solutions:"
	.align	2
.LC2:
	.string	" %ld.%03ld"
	.align	2
.LC3:
	.string	"********* INTEGER SQR ROOTS ***********"
	.align	2
.LC4:
	.string	"sqrt(%3d) = %2d\n"
	.align	2
.LC5:
	.string	"\nsqrt(%lX) = %X\n"
	.align	2
.LC6:
	.string	"********* ANGLE CONVERSION ***********"
	.align	2
.LC7:
	.string	"%3ld degrees = %ld.%03ld radians\n"
	.align	2
.LC8:
	.string	"%ld.%03ld radians = %3ld degrees\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lui	a0,%hi(.LC0)
	addi	sp,sp,-96
	addi	a0,a0,%lo(.LC0)
	sw	ra,92(sp)
	sw	s0,88(sp)
	sw	s5,68(sp)
	sw	s1,84(sp)
	sw	s2,80(sp)
	sw	s3,76(sp)
	sw	s4,72(sp)
	sw	s6,64(sp)
	sw	s7,60(sp)
	sw	s8,56(sp)
	sw	s9,52(sp)
	sw	s10,48(sp)
	sw	s11,44(sp)
.Lpcrel_4:
	auipc	ra,%pcrel_hi(puts)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_4)
	lui	a3,1048569
	lui	a2,8
	lui	a1,1048573
	addi	a5,sp,20
	addi	a4,sp,16
	addi	a3,a3,-1328
	addi	a2,a2,-768
	addi	a1,a1,1788
	addi	a0,zero,1000
.Lpcrel_5:
	auipc	ra,%pcrel_hi(SolveCubic)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_5)
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
.Lpcrel_6:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_6)
	lw	s5,16(sp)
	addi	s0,zero,0
	bge	zero,s5,.L59
	lui	a5,%hi(.LC2)
	lui	s4,67109
	addi	s1,a5,%lo(.LC2)
	addi	s4,s4,-557
	addi	s3,sp,20
	addi	s2,zero,0
	addi	s6,zero,1000
.L60:
	lw	a5,0(s3)
	addi	a0,s1,0
	addi	s2,s2,1
	mulh	a1,a5,s4
	srai	a4,a5,31
	add	s0,s0,a5
	addi	s3,s3,4
	srai	a1,a1,6
	sub	a1,a1,a4
	mul	a4,a1,s6
	sub	a5,a5,a4
	srai	a2,a5,31
	and	t0,a5,a2
	sub	t0,t0,a2
	sub	t0,a5,t0
	and	t1,a5,a2
	sub	a5,t0,t1
	sub	a2,a5,a2
.Lpcrel_7:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_7)
	bne	s2,s5,.L60
.L59:
	addi	a0,zero,10
.Lpcrel_8:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_8)
	lui	a3,1048569
	lui	a2,4
	lui	a1,1048575
	addi	a5,sp,20
	addi	a4,sp,16
	addi	a3,a3,-1328
	addi	a2,a2,616
	addi	a1,a1,-404
	addi	a0,zero,1000
.Lpcrel_9:
	auipc	ra,%pcrel_hi(SolveCubic)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_9)
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
.Lpcrel_10:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_10)
	lw	s5,16(sp)
	bge	zero,s5,.L61
	lui	a5,%hi(.LC2)
	lui	s4,67109
	addi	s1,a5,%lo(.LC2)
	addi	s4,s4,-557
	addi	s3,sp,20
	addi	s2,zero,0
	addi	s6,zero,1000
.L62:
	lw	a5,0(s3)
	addi	a0,s1,0
	addi	s2,s2,1
	mulh	a1,a5,s4
	srai	a4,a5,31
	add	s0,s0,a5
	addi	s3,s3,4
	srai	a1,a1,6
	sub	a1,a1,a4
	mul	a4,a1,s6
	sub	a5,a5,a4
	srai	a2,a5,31
	and	t0,a5,a2
	sub	t0,t0,a2
	sub	t0,a5,t0
	and	t1,a5,a2
	sub	a5,t0,t1
	sub	a2,a5,a2
.Lpcrel_11:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_11)
	bne	s2,s5,.L62
.L61:
	addi	a0,zero,10
.Lpcrel_12:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_12)
	lui	a3,1048568
	lui	a2,5
	lui	a1,1048575
	addi	a5,sp,20
	addi	a4,sp,16
	addi	a3,a3,1768
	addi	a2,a2,1520
	addi	a1,a1,596
	addi	a0,zero,1000
.Lpcrel_13:
	auipc	ra,%pcrel_hi(SolveCubic)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_13)
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
.Lpcrel_14:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_14)
	lw	s5,16(sp)
	bge	zero,s5,.L63
	lui	a5,%hi(.LC2)
	lui	s4,67109
	addi	s1,a5,%lo(.LC2)
	addi	s4,s4,-557
	addi	s3,sp,20
	addi	s2,zero,0
	addi	s6,zero,1000
.L64:
	lw	a5,0(s3)
	addi	a0,s1,0
	addi	s2,s2,1
	mulh	a1,a5,s4
	srai	a4,a5,31
	add	s0,s0,a5
	addi	s3,s3,4
	srai	a1,a1,6
	sub	a1,a1,a4
	mul	a4,a1,s6
	sub	a5,a5,a4
	srai	a2,a5,31
	and	t0,a5,a2
	sub	t0,t0,a2
	sub	t0,a5,t0
	and	t1,a5,a2
	sub	a5,t0,t1
	sub	a2,a5,a2
.Lpcrel_15:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_15)
	bne	s2,s5,.L64
.L63:
	addi	a0,zero,10
.Lpcrel_16:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_16)
	addi	a2,zero,1000
	lui	a3,1048567
	lui	a1,1048573
	addi	a0,a2,0
	addi	a5,sp,20
	addi	a4,sp,16
	addi	a3,a3,1864
	addi	a1,a1,-1412
.Lpcrel_17:
	auipc	ra,%pcrel_hi(SolveCubic)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_17)
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
.Lpcrel_18:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_18)
	lw	s5,16(sp)
	bge	zero,s5,.L65
	lui	a5,%hi(.LC2)
	lui	s4,67109
	addi	s1,a5,%lo(.LC2)
	addi	s4,s4,-557
	addi	s3,sp,20
	addi	s2,zero,0
	addi	s6,zero,1000
.L66:
	lw	a5,0(s3)
	addi	a0,s1,0
	addi	s2,s2,1
	mulh	a1,a5,s4
	srai	a4,a5,31
	add	s0,s0,a5
	addi	s3,s3,4
	srai	a1,a1,6
	sub	a1,a1,a4
	mul	a4,a1,s6
	sub	a5,a5,a4
	srai	a2,a5,31
	and	t0,a5,a2
	sub	t0,t0,a2
	sub	t0,a5,t0
	and	t1,a5,a2
	sub	a5,t0,t1
	sub	a2,a5,a2
.Lpcrel_19:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_19)
	bne	s2,s5,.L66
.L65:
	addi	a0,zero,10
.Lpcrel_20:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_20)
	addi	a5,zero,1000
	lui	s4,%hi(.LC2)
	lui	s3,67109
	sw	a5,12(sp)
	addi	s5,a5,0
	addi	s4,s4,%lo(.LC2)
	addi	s3,s3,-557
.L67:
	lui	s9,2
	addi	s9,s9,1808
.L75:
	lui	s6,1
	addi	s6,s6,904
.L73:
	lui	s7,1048573
	lui	a5,%hi(.LC1)
	addi	s7,s7,1288
	addi	s2,zero,-1000
	addi	s8,a5,%lo(.LC1)
.L70:
	lw	a0,12(sp)
	addi	a5,sp,20
	addi	a4,sp,16
	addi	a3,s2,0
	addi	a2,s6,0
	addi	a1,s9,0
.Lpcrel_21:
	auipc	ra,%pcrel_hi(SolveCubic)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_21)
	addi	a0,s8,0
.Lpcrel_22:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_22)
	lw	s1,16(sp)
	bge	zero,s1,.L68
	addi	s10,sp,20
	addi	s11,zero,0
.L69:
	lw	a2,0(s10)
	addi	a0,s4,0
	addi	s11,s11,1
	mulh	a1,a2,s3
	srai	a3,a2,31
	add	s0,s0,a2
	addi	s10,s10,4
	srai	a1,a1,6
	sub	a1,a1,a3
	mul	a3,a1,s5
	sub	a2,a2,a3
	srai	a3,a2,31
	and	t0,a2,a3
	sub	t0,t0,a3
	sub	t0,a2,t0
	and	t1,a2,a3
	sub	a2,t0,t1
	sub	a2,a2,a3
.Lpcrel_23:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_23)
	bne	s11,s1,.L69
.L68:
	addi	a0,zero,10
	addi	s2,s2,-1000
.Lpcrel_24:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_24)
	bne	s2,s7,.L70
	lui	a5,4
	addi	s6,s6,500
	addi	a5,a5,-1384
	bne	s6,a5,.L73
	addi	s9,s9,-1000
	bne	s9,zero,.L75
	lw	a4,12(sp)
	lui	a5,2
	addi	a5,a5,1808
	addi	a4,a4,1000
	sw	a4,12(sp)
	bne	a4,a5,.L67
	lui	a0,%hi(.LC3)
	addi	a0,a0,%lo(.LC3)
	lui	s3,%hi(.LC4)
.Lpcrel_25:
	auipc	ra,%pcrel_hi(puts)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_25)
	addi	s3,s3,%lo(.LC4)
	addi	s2,zero,0
	addi	s4,zero,1001
.L78:
	addi	a3,s2,0
	addi	s1,zero,32
	addi	a2,zero,0
	addi	a5,zero,0
.L77:
	srli	a0,a3,30
	slli	a4,a2,2
	slli	a5,a5,2
	add	a5,a0,a5
	addi	a4,a4,1
	addi	s1,s1,-1
	slli	a3,a3,2
	slli	a2,a2,1
	bltu	a5,a4,.L76
	sub	a5,a5,a4
	addi	a2,a2,1
.L76:
	bne	s1,zero,.L77
	addi	a1,s2,0
	addi	a0,s3,0
	addi	s2,s2,1
	add	s0,s0,a2
.Lpcrel_26:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_26)
	bne	s2,s4,.L78
	lui	a5,261840
	addi	a5,a5,361
	addi	a2,zero,0
	addi	s2,zero,32
.L80:
	srli	a3,a5,30
	slli	a4,a2,2
	slli	s1,s1,2
	add	s1,a3,s1
	addi	a4,a4,1
	addi	s2,s2,-1
	slli	a5,a5,2
	slli	a2,a2,1
	bltu	s1,a4,.L79
	sub	s1,s1,a4
	addi	a2,a2,1
.L79:
	bne	s2,zero,.L80
	lui	a0,%hi(.LC5)
	lui	a1,261840
	addi	a1,a1,361
	addi	a0,a0,%lo(.LC5)
	add	s0,a2,s0
.Lpcrel_27:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_27)
	lui	a0,%hi(.LC6)
	addi	a0,a0,%lo(.LC6)
	lui	s4,%hi(.LC7)
	lui	s10,93207
	lui	s5,67109
	lui	s8,23861
	lui	s7,767
	lui	s6,88
.Lpcrel_28:
	auipc	ra,%pcrel_hi(puts)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_28)
	addi	s4,s4,%lo(.LC7)
	addi	s10,s10,-1001
	addi	s5,s5,-557
	addi	s8,s8,-289
	addi	s7,s7,368
	addi	s6,s6,552
	addi	s3,zero,0
	addi	s1,zero,0
	addi	s11,zero,1000
.L81:
	srli	a5,s3,2
	mulhu	a5,a5,s10
	srli	a2,s3,5
	addi	a0,s4,0
	add	s3,s3,s7
	srli	a5,a5,2
	mulhu	a3,a5,s5
	add	s0,s0,a5
	srli	a3,a3,6
	mulhu	a1,s1,s5
	addi	s1,s1,1000
	mul	a3,a3,s11
	srli	a1,a1,6
	mulhu	a2,a2,s8
	sub	a3,a5,a3
	srli	a2,a2,7
.Lpcrel_29:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_29)
	bne	s1,s6,.L81
	addi	a0,zero,10
	lui	s4,%hi(.LC8)
	lui	s7,683477
	lui	s6,87485
	lui	s5,67109
	lui	s3,747
	lui	s1,2
.Lpcrel_30:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_30)
	addi	s4,s4,%lo(.LC8)
	addi	s7,s7,-1415
	addi	s6,s6,49
	addi	s5,s5,-557
	addi	s3,s3,288
	addi	s1,s1,-1902
	addi	s8,zero,1000
.L82:
	mulhu	a1,s9,s5
	srli	a5,s2,1
	srli	a4,s2,4
	addi	a0,s4,0
	add	s2,s2,s3
	srli	a1,a1,6
	mul	a2,a1,s8
	mulhu	a4,a4,s6
	sub	a2,s9,a2
	addi	s9,s9,17
	mulhu	a5,a5,s7
	srli	a3,a4,14
	srli	a5,a5,10
	add	s0,s0,a5
.Lpcrel_31:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_31)
	bne	s9,s1,.L82
	lw	ra,92(sp)
	addi	a0,x0,1
	bltu	s0,a0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	lw	s0,88(sp)
	lw	s1,84(sp)
	lw	s2,80(sp)
	lw	s3,76(sp)
	lw	s4,72(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	lw	s7,60(sp)
	lw	s8,56(sp)
	lw	s9,52(sp)
	lw	s10,48(sp)
	lw	s11,44(sp)
	addi	sp,sp,96
	jalr	zero,ra,0
	.size	main, .-main
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits


    .text
    .align 2
__mul:
	add	a2,a0,x0
	addi	a0,x0,0
.Mul_loop:
	addi	a3,x0,1
	and	a3,a1,a3
	beq	a3,x0,.Mul_skip
	add	a0,a0,a2
.Mul_skip:
	srli	a1,a1,1
	slli	a2,a2,1
	bne	a1,x0,.Mul_loop
	jalr	x0,ra,0

.text
.align 2

# Signed 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_divsi3
__riscv_div_lib_divsi3:
	bge	a0,zero,.+8
	jal	x0,__riscv_div_lib_L10
	bge	a1,zero,.+8
	jal	x0,__riscv_div_lib_L11
    # Since the quotient is positive, fall into udivsi3

# Unsigned 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_udivsi3
__riscv_div_lib_udivsi3:
	addi	a2,a1,0
	addi	a1,a0,0
	addi	a0,zero,-1
	beq	a2,zero,__riscv_div_lib_L5
	addi	a3,zero,1
	bltu	a2,a1,.+8
	jal	x0,__riscv_div_lib_L2
__riscv_div_lib_L1:
	bge	zero,a2,__riscv_div_lib_L2
	slli	a2,a2,1
	slli	a3,a3,1
	bltu	a2,a1,__riscv_div_lib_L1
__riscv_div_lib_L2:
	addi	a0,zero,0
__riscv_div_lib_L3:
	bltu	a1,a2,.+8
	jal	x0,.+8
	jal	x0,__riscv_div_lib_L4
	sub	a1,a1,a2
	and	t0,a0,a3
	sub	t0,t0,a3
	sub	a0,a0,t0
__riscv_div_lib_L4:
	srli	a3,a3,1
	srli	a2,a2,1
	bne	a3,zero,__riscv_div_lib_L3
__riscv_div_lib_L5:
	jalr	zero,ra,0

# Unsigned 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_umodsi3
__riscv_div_lib_umodsi3:
	addi	t0,ra,0
.Lpcrel_div1:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div1)
	addi	a0,a1,0
	jalr	zero,t0,0

# Handle negative arguments to divsi3
__riscv_div_lib_L10:
	sub	a0,zero,a0
	bge	zero,a1,.+8
	jal	x0,__riscv_div_lib_L12
	sub	a1,zero,a1
	jal	x0,__riscv_div_lib_udivsi3
__riscv_div_lib_L11:                         # Compute udivsi3(a0, -a1), then negate
    sub   a1, zero, a1                        # neg a1, a1 -> sub a1, zero, a1
__riscv_div_lib_L12:
	addi	t0,ra,0
.Lpcrel_div2:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div2)
	sub	a0,zero,a0
	jalr	zero,t0,0

# Signed 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_modsi3
__riscv_div_lib_modsi3:
	addi	t0,ra,0
	bge	a1,zero,.+8
	jal	x0,__riscv_div_lib_L31
	bge	a0,zero,.+8
	jal	x0,__riscv_div_lib_L32
__riscv_div_lib_L30:
.Lpcrel_div3:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div3)
	addi	a0,a1,0
	jalr	zero,t0,0
__riscv_div_lib_L31:
	sub	a1,zero,a1
	bge	a0,zero,__riscv_div_lib_L30
__riscv_div_lib_L32:
	sub	a0,zero,a0
.Lpcrel_div4:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div4)
	sub	a0,zero,a1
	jalr	zero,t0,0

# end of subrountine