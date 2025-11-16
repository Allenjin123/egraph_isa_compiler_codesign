	.file	"libwikisort.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	TestCompare
	.type	TestCompare, @function
TestCompare:
	addi	sp,sp,-16
	slt	a0,a0,a2
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	TestCompare, .-TestCompare
	.align	2
	.globl	TestingRandom
	.type	TestingRandom, @function
TestingRandom:
	lui	a4,%hi(seed)
	lw	a0,%lo(seed)(a4)
	lui	a5, 269413
	addi	a5,a5,-403
	mul	a0,a0,a5
	lui	a5, 3
	addi	a5,a5,57
	add	a0,a0,a5
	slli	a0,a0,1
	srli	a0,a0,1
	sw	a0,%lo(seed)(a4)
	srli	a0,a0,16
	jalr	zero, ra, 0
	.size	TestingRandom, .-TestingRandom
	.align	2
	.globl	TestingMostlyDescending
	.type	TestingMostlyDescending, @function
TestingMostlyDescending:
	lui	a2,%hi(seed)
	lw	a5,%lo(seed)(a2)
	lui	a4, 269413
	addi	a4,a4,-403
	mul	a5,a5,a4
	lui	a3, 3
	addi	a3,a3,57
	lui	a4, 838861
	addi	a4,a4,-819
	sub	a1,a1,a0
	add	a5,a5,a3
	slli	a5,a5,1
	srli	a5,a5,1
	srai	a3,a5,16
	mulhu	a4,a3,a4
	sw	a5,%lo(seed)(a2)
	srli	a5,a4,2
	slli	a4,a5,2
	add	a5,a4,a5
	sub	a3,a3,a5
	add	a0,a3,a1
	addi	a0,a0,-2
	jalr	zero, ra, 0
	.size	TestingMostlyDescending, .-TestingMostlyDescending
	.align	2
	.globl	TestingMostlyAscending
	.type	TestingMostlyAscending, @function
TestingMostlyAscending:
	lui	a2,%hi(seed)
	lw	a5,%lo(seed)(a2)
	lui	a4, 269413
	addi	a4,a4,-403
	mul	a5,a5,a4
	lui	a3, 3
	addi	a3,a3,57
	lui	a4, 838861
	addi	a4,a4,-819
	add	a5,a5,a3
	slli	a5,a5,1
	srli	a5,a5,1
	srai	a3,a5,16
	mulhu	a4,a3,a4
	sw	a5,%lo(seed)(a2)
	srli	a5,a4,2
	slli	a4,a5,2
	add	a5,a4,a5
	sub	a3,a3,a5
	add	a0,a3,a0
	addi	a0,a0,-2
	jalr	zero, ra, 0
	.size	TestingMostlyAscending, .-TestingMostlyAscending
	.align	2
	.globl	TestingAscending
	.type	TestingAscending, @function
TestingAscending:
	jalr	zero, ra, 0
	.size	TestingAscending, .-TestingAscending
	.align	2
	.globl	TestingDescending
	.type	TestingDescending, @function
TestingDescending:
	sub	a0,a1,a0
	jalr	zero, ra, 0
	.size	TestingDescending, .-TestingDescending
	.align	2
	.globl	TestingEqual
	.type	TestingEqual, @function
TestingEqual:
	addi	a0, zero, 1000
	jalr	zero, ra, 0
	.size	TestingEqual, .-TestingEqual
	.align	2
	.globl	TestingJittered
	.type	TestingJittered, @function
TestingJittered:
	lui	a2,%hi(seed)
	lw	a5,%lo(seed)(a2)
	lui	a4, 269413
	addi	a4,a4,-403
	mul	a5,a5,a4
	lui	a3, 3
	addi	a3,a3,57
	lui	a4, 838861
	addi	a4,a4,-819
	add	a5,a5,a3
	slli	a5,a5,1
	srli	a5,a5,1
	srai	a3,a5,16
	mulhu	a4,a3,a4
	sw	a5,%lo(seed)(a2)
	addi	a3,a3,-9
	srli	a5,a4,3
	slli	a4,a5,2
	add	a5,a4,a5
	slli	a5,a5,1
	beq	a3,a5,.L12
	jalr	zero, ra, 0
.L12:
	addi	a0,a0,-2
	jalr	zero, ra, 0
	.size	TestingJittered, .-TestingJittered
	.align	2
	.globl	TestingMostlyEqual
	.type	TestingMostlyEqual, @function
TestingMostlyEqual:
	lui	a3,%hi(seed)
	lw	a5,%lo(seed)(a3)
	lui	a4, 269413
	addi	a4,a4,-403
	mul	a5,a5,a4
	lui	a4, 3
	addi	a4,a4,57
	add	a5,a5,a4
	slli	a5,a5,1
	srli	a5,a5,1
	srai	a0,a5,16
	andi	a0,a0,3
	sw	a5,%lo(seed)(a3)
	addi	a0,a0,1000
	jalr	zero, ra, 0
	.size	TestingMostlyEqual, .-TestingMostlyEqual
	.align	2
	.globl	TestingPathological
	.type	TestingPathological, @function
TestingPathological:
	addi	a5, a0, 0
	beq	a0,zero,.L16
	srli	a4,a1,31
	add	a4,a4,a1
	srai	a4,a4,1
	addi	a0, zero, 11
	blt	a5,a4,.L14
	addi	a1,a1,-1
	sub	a5,a5,a1
	sltiu	a5, a5, 1
	addi	a0,a5,9
	jalr	zero, ra, 0
.L16:
	addi	a0, zero, 10
.L14:
	jalr	zero, ra, 0
	.size	TestingPathological, .-TestingPathological
	.align	2
	.type	WikiMerge.constprop.1.isra.0, @function
WikiMerge.constprop.1.isra.0:
	addi	sp,sp,-96
	sw	s5,68(sp)
	sw	a3,28(sp)
	sub	s5,a3,a2
	sub	a3,a5,a4
	sw	s0,88(sp)
	sw	s6,64(sp)
	sw	a4,16(sp)
	sw	a4,8(sp)
	sw	ra,92(sp)
	sw	s1,84(sp)
	sw	s3,76(sp)
	sw	a2,24(sp)
	sw	a2,12(sp)
	sw	a5,20(sp)
	addi	a4, zero, 512
	sw	a3,4(sp)
	addi	s0, a0, 0
	addi	s6, a6, 0
	blt	a4, s5, .L20
	sw	s2,80(sp)
	slli	s3,a2,3
	slli	s1,s5,3
	addi	s2, a7, 0
	add	s3,a0,s3
	add	s1,a7,s1
	bge	zero, s5, .L21
	bge	zero, a3, .L21
	lw	a4,8(sp)
	sw	s4,72(sp)
	slli	a5,a5,3
	slli	s4,a4,3
	add	s4,a0,s4
	add	s0,a0,a5
.L22:
	lw	a2,0(s2)
	lw	a3,4(s2)
	lw	a0,0(s4)
	lw	a1,4(s4)
	addi	s3,s3,8
	jalr	ra, s6, 0
	bne	a0,zero,.L23
	lw	a5,0(s2)
	addi	s2,s2,8
	sw	a5,-8(s3)
	lw	a5,-4(s2)
	sw	a5,-4(s3)
	bne	s1,s2,.L22
	lw	s2,80(sp)
	lw	s4,72(sp)
.L19:
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s1,84(sp)
	lw	s3,76(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	addi	sp,sp,96
	jalr	zero, ra, 0
.L20:
	addi	s1, a1, 0
	bge	zero, a3, .L33
	sw	s8,56(sp)
	lw	s8,8(sp)
	sw	s11,44(sp)
	slli	s11,a2,3
	sw	s4,72(sp)
	sw	s7,60(sp)
	sw	s9,52(sp)
	sw	s2,80(sp)
	sw	s10,48(sp)
	add	s11,a0,s11
	addi	s9, zero, 0
	addi	s3, zero, 0
	addi	s4, zero, 0
	addi	s7, a1, 0
.L34:
	slli	s2,s8,3
	slli	s10,s7,3
	add	s2,s0,s2
	add	s10,s0,s10
	lw	a2,0(s10)
	lw	a3,4(s10)
	lw	a0,0(s2)
	lw	a1,4(s2)
	addi	s9,s9,1
	jalr	ra, s6, 0
	lw	a2,0(s11)
	lw	a3,4(s11)
	bne	a0,zero,.L35
	lw	a1,0(s10)
	addi	s4,s4,1
	add	s7,s4,s1
	sw	a1,0(s11)
	lw	a1,4(s10)
	sw	a1,4(s11)
	sw	a2,0(s10)
	sw	a3,4(s10)
	bge	s4, s5, .L61
.L36:
	addi	s11,s11,8
	jal	zero, .L34
.L35:
	lw	a1,0(s2)
	lw	a5,8(sp)
	addi	s3,s3,1
	sw	a1,0(s11)
	lw	a1,4(s2)
	add	s8,a5,s3
	lw	a5,4(sp)
	sw	a1,4(s11)
	sw	a2,0(s2)
	sw	a3,4(s2)
	blt	s3,a5,.L36
	sub	s5,s5,s4
	bge	zero, s5, .L61
	lw	a5,12(sp)
	addi	s1, s7, 0
	lw	s2,80(sp)
	add	a5,a5,s9
	lw	s4,72(sp)
	lw	s7,60(sp)
	lw	s8,56(sp)
	lw	s9,52(sp)
	lw	s10,48(sp)
	lw	s11,44(sp)
	sw	a5,12(sp)
.L33:
	lw	a5,12(sp)
	add	s5,s5,s1
	slli	s5,s5,3
	slli	a1,s1,3
	slli	s3,a5,3
	add	s5,s0,s5
	add	a1,s0,a1
	add	a2,s0,s3
.L37:
	lw	a3,0(a2)
	lw	a4,0(a1)
	lw	a5,4(a1)
	sw	a3,0(a1)
	lw	a3,4(a2)
	addi	a1,a1,8
	addi	a2,a2,8
	sw	a3,-4(a1)
	sw	a4,-8(a2)
	sw	a5,-4(a2)
	bne	a1,s5,.L37
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s1,84(sp)
	lw	s3,76(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	addi	sp,sp,96
	jalr	zero, ra, 0
.L23:
	lw	a5,0(s4)
	addi	s4,s4,8
	sw	a5,-8(s3)
	lw	a5,-4(s4)
	sw	a5,-4(s3)
	bne	s0,s4,.L22
	lw	s4,72(sp)
.L21:
	sub	a1,s1,s2
	beq	s1,s2,.L59
	addi	a5,a1,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L27
	addi	a3,s3,-1
	sub	a3,a3,s2
	sltiu	a3,a3,3
	addi	a5, s3, 0
	addi	a4, s2, 0
	bne	a3,zero,.L27
	or	a3,s3,s2
	andi	a3,a3,3
	bne	a3,zero,.L27
	andi	a0,a1,-4
	add	a2,a0,s3
.L28:
	lw	a3,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a5)
	bne	a2,a5,.L28
	beq	a1,a0,.L59
	add	a5,s2,a0
	lbu	a4,0(a5)
	addi	a5,a0,1
	sb	a4,0(a2)
	bgeu	a5, a1, .L59
	add	a4,s2,a5
	lbu	a4,0(a4)
	add	a5,s3,a5
	addi	a0,a0,2
	sb	a4,0(a5)
	bgeu	a0, a1, .L59
	add	s2,s2,a0
	lbu	a5,0(s2)
	add	a0,s3,a0
	sb	a5,0(a0)
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s2,80(sp)
	lw	s1,84(sp)
	lw	s3,76(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	addi	sp,sp,96
	jalr	zero, ra, 0
.L27:
	add	a1,s2,a1
.L31:
	lbu	a5,0(s2)
	addi	s2,s2,1
	addi	s3,s3,1
	sb	a5,-1(s3)
	bne	a1,s2,.L31
.L59:
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s2,80(sp)
	lw	s1,84(sp)
	lw	s3,76(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	addi	sp,sp,96
	jalr	zero, ra, 0
.L61:
	lw	s2,80(sp)
	lw	s4,72(sp)
	lw	s7,60(sp)
	lw	s8,56(sp)
	lw	s9,52(sp)
	lw	s10,48(sp)
	lw	s11,44(sp)
	jal	zero, .L19
	.size	WikiMerge.constprop.1.isra.0, .-WikiMerge.constprop.1.isra.0
	.align	2
	.type	WikiMerge.constprop.0.isra.0, @function
WikiMerge.constprop.0.isra.0:
	addi	sp,sp,-32
	sw	s2,20(sp)
	sw	a2,12(sp)
	sw	a1,8(sp)
	sub	a2,a2,a1
	sw	a3,0(sp)
	sw	a4,4(sp)
	addi	a6, zero, 512
	sub	s2,a4,a3
	blt	a6, a2, .L63
	lui	a6,%hi(array1)
	slli	a1,a1,3
	addi	a6,a6,%lo(array1)
	slli	a0,a2,3
	add	a1,a1,a6
	add	a0,a5,a0
	bge	zero, s2, .L64
	bge	zero, a2, .L64
	slli	a3,a3,3
	slli	a4,a4,3
	add	a3,a3,a6
	add	a6,a4,a6
.L65:
	lw	a2,0(a5)
	lw	a4,0(a3)
	addi	a1,a1,8
	blt	a4, a2, .L66
	sw	a2,-8(a1)
	lw	a4,4(a5)
	addi	a5,a5,8
	sw	a4,-4(a1)
	bne	a0,a5,.L65
.L62:
	lw	s2,20(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L63:
	bge	zero, s2, .L103
	lui	a5,%hi(array1)
	addi	a5,a5,%lo(array1)
	slli	a4,a1,3
	sw	s0,28(sp)
	sw	s1,24(sp)
	add	a4,a5,a4
	addi	t4, zero, 0
	addi	t6, zero, 0
	addi	t5, zero, 0
	addi	s1, a3, 0
	addi	s0, a0, 0
.L77:
	slli	a6,s1,3
	slli	a7,s0,3
	add	a6,a5,a6
	add	a7,a5,a7
	lw	t1,0(a6)
	lw	t3,0(a7)
	lw	t2,0(a4)
	lw	t0,4(a4)
	addi	t4,t4,1
	blt	t1,t3,.L78
	sw	t3,0(a4)
	lw	a6,4(a7)
	addi	t5,t5,1
	add	s0,t5,a0
	sw	a6,4(a4)
	sw	t2,0(a7)
	sw	t0,4(a7)
	bge	t5, a2, .L102
.L79:
	addi	a4,a4,8
	jal	zero, .L77
.L103:
	lui	a5,%hi(array1)
	addi	a5,a5,%lo(array1)
.L76:
	add	a4,a2,a0
	slli	a4,a4,3
	slli	a0,a0,3
	slli	a1,a1,3
	add	a4,a5,a4
	add	a0,a5,a0
	add	a1,a5,a1
.L80:
	lw	a2,0(a1)
	lw	a3,0(a0)
	lw	a5,4(a0)
	sw	a2,0(a0)
	lw	a2,4(a1)
	addi	a0,a0,8
	addi	a1,a1,8
	sw	a2,-4(a0)
	sw	a3,-8(a1)
	sw	a5,-4(a1)
	bne	a0,a4,.L80
	lw	s2,20(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L66:
	sw	a4,-8(a1)
	lw	a4,4(a3)
	addi	a3,a3,8
	sw	a4,-4(a1)
	bne	a6,a3,.L65
.L64:
	sub	a6,a0,a5
	beq	a0,a5,.L62
	addi	a4,a6,-1
	addi	a3, zero, 5
	bgeu	a3, a4, .L70
	addi	a2,a1,-1
	sub	a2,a2,a5
	sltiu	a2,a2,3
	addi	a4, a1, 0
	addi	a3, a5, 0
	bne	a2,zero,.L70
	andi	a2,a5,3
	bne	a2,zero,.L70
	andi	a7,a6,-4
	add	a0,a7,a1
.L71:
	lw	a2,0(a3)
	addi	a4,a4,4
	addi	a3,a3,4
	sw	a2,-4(a4)
	bne	a0,a4,.L71
	beq	a6,a7,.L62
	add	a4,a5,a7
	lbu	a3,0(a4)
	addi	a4,a7,1
	sb	a3,0(a0)
	bgeu	a4, a6, .L62
	add	a3,a5,a4
	lbu	a3,0(a3)
	add	a4,a1,a4
	addi	a7,a7,2
	sb	a3,0(a4)
	bgeu	a7, a6, .L62
	add	a5,a5,a7
	lbu	a5,0(a5)
	add	a7,a1,a7
	sb	a5,0(a7)
	lw	s2,20(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L78:
	sw	t1,0(a4)
	lw	a7,4(a6)
	addi	t6,t6,1
	add	s1,a3,t6
	sw	a7,4(a4)
	sw	t2,0(a6)
	sw	t0,4(a6)
	blt	t6,s2,.L79
	sub	a2,a2,t5
	bge	zero, a2, .L102
	addi	a0, s0, 0
	lw	s1,24(sp)
	lw	s0,28(sp)
	add	a1,a1,t4
	jal	zero, .L76
.L102:
	lw	s0,28(sp)
	lw	s1,24(sp)
	jal	zero, .L62
.L70:
	add	a6,a5,a6
.L74:
	lbu	a4,0(a5)
	addi	a5,a5,1
	addi	a1,a1,1
	sb	a4,-1(a1)
	bne	a5,a6,.L74
	jal	zero, .L62
	.size	WikiMerge.constprop.0.isra.0, .-WikiMerge.constprop.0.isra.0
	.align	2
	.type	Rotate.constprop.1, @function
Rotate.constprop.1:
	addi	sp,sp,-16
	sw	a2,8(sp)
	sw	a3,12(sp)
	beq	a2,a3,.L104
	blt	a1,zero,.L106
	add	t4,a2,a1
	sub	t5,a3,t4
	bge	t5, a1, .L107
	addi	a5, zero, 512
	bge	a5, t5, .L213
.L109:
	srai	a1,a1,1
	addi	a6,a1,-1
	beq	a1,zero,.L153
.L152:
	add	a1,a2,a6
	slli	t3,t4,3
	addi	a5,a0,-8
	add	a5,a5,t3
	slli	a1,a1,3
	slli	a6,a6,3
	add	a1,a0,a1
	sub	a5,a5,a6
	add	t3,a0,t3
.L154:
	lw	t1,0(a5)
	lw	a7,0(a1)
	lw	a6,4(a1)
	sw	t1,0(a1)
	lw	t1,4(a5)
	addi	a5,a5,8
	addi	a1,a1,-8
	sw	t1,12(a1)
	sw	a7,-8(a5)
	sw	a6,-4(a5)
	bne	a5,t3,.L154
	srai	a5,t5,1
	addi	a1,a5,-1
	beq	a5,zero,.L158
.L155:
	slli	t1,a3,3
	add	a4,t4,a1
	addi	a5,t1,-8
	slli	a4,a4,3
	slli	a1,a1,3
	add	a5,a0,a5
	add	a4,a0,a4
	sub	a5,a5,a1
	add	t1,a0,t1
.L157:
	lw	a7,0(a5)
	lw	a6,0(a4)
	lw	a1,4(a4)
	sw	a7,0(a4)
	lw	a7,4(a5)
	addi	a5,a5,8
	addi	a4,a4,-8
	sw	a7,12(a4)
	sw	a6,-8(a5)
	sw	a1,-4(a5)
	bne	a5,t1,.L157
.L158:
	sub	a4,a3,a2
	addi	a5, zero, 1
	bge	a5, a4, .L104
	srli	a5,a4,31
	add	a5,a5,a4
	srai	a5,a5,1
	add	a4,a2,a5
	slli	a4,a4,3
	slli	a5,a5,3
	slli	a3,a3,3
	add	a4,a0,a4
	sub	a5,a0,a5
	addi	a4,a4,-8
	add	a5,a5,a3
	add	a0,a0,a3
.L159:
	lw	a1,0(a5)
	lw	a2,0(a4)
	lw	a3,4(a4)
	sw	a1,0(a4)
	lw	a1,4(a5)
	addi	a5,a5,8
	addi	a4,a4,-8
	sw	a1,12(a4)
	sw	a2,-8(a5)
	sw	a3,-4(a5)
	bne	a5,a0,.L159
.L104:
	addi	sp,sp,16
	jalr	zero, ra, 0
.L106:
	add	t4,a3,a1
	sub	a5,t4,a2
	sub	t5, zero, a1
	bge	t5, a5, .L160
	addi	a6, zero, -512
	bge	a1,a6,.L214
	addi	a1, a5, 0
	jal	zero, .L109
.L160:
	addi	a1, a5, 0
.L107:
	srai	a6,a1,1
	addi	a5, zero, 512
	addi	a6,a6,-1
	blt	a5, a1, .L152
	slli	a1,a1,3
	slli	a7,a2,3
	beq	a1,zero,.L215
	addi	a6,a7,1
	add	a6,a0,a6
	sub	a6,a4,a6
	sltiu	a6,a6,3
	add	a7,a0,a7
	addi	a5, a4, 0
	bne	a6,zero,.L115
	or	a6,a4,a7
	andi	a6,a6,3
	bne	a6,zero,.L115
	addi	a6, a7, 0
	add	t3,a4,a1
.L116:
	lw	t1,0(a6)
	addi	a5,a5,4
	addi	a6,a6,4
	sw	t1,-4(a5)
	bne	a5,t3,.L116
.L117:
	slli	a5,t4,3
	add	a5,a0,a5
	slli	a6,t5,3
	bgeu	a7, a5, .L216
	beq	a6,zero,.L125
	or	t1,a5,a7
	andi	t1,t1,3
	bne	t1,zero,.L123
	add	a6,a7,a6
.L124:
	lw	t1,0(a5)
	addi	a7,a7,4
	addi	a5,a5,4
	sw	t1,-4(a7)
	bne	a7,a6,.L124
.L125:
	beq	a1,zero,.L104
	add	a5,a3,a2
	sub	a5,a5,t4
	slli	a5,a5,3
	add	a5,a0,a5
	sub	a6,a5,a4
	addi	a6,a6,-1
	sltiu	a6,a6,3
	addi	a3, a4, 0
	bne	a6,zero,.L129
	or	a6,a4,a5
	andi	a6,a6,3
	bne	a6,zero,.L129
	add	a1,a1,a5
.L130:
	lw	a4,0(a3)
	addi	a5,a5,4
	addi	a3,a3,4
	sw	a4,-4(a5)
	bne	a1,a5,.L130
	jal	zero, .L104
.L213:
	slli	t5,t5,3
	beq	t5,zero,.L137
.L110:
	slli	t4,t4,3
	addi	a7,t4,1
	add	a7,a0,a7
	sub	a7,a4,a7
	sltiu	a7,a7,3
	add	a5,a0,t4
	addi	a6, a4, 0
	bne	a7,zero,.L135
	or	a7,a4,a5
	andi	a7,a7,3
	bne	a7,zero,.L135
	add	t1,a5,t5
.L136:
	lw	a7,0(a5)
	addi	a5,a5,4
	addi	a6,a6,4
	sw	a7,-4(a6)
	bne	a5,t1,.L136
.L137:
	sub	a5,a3,a1
	slli	a5,a5,3
	slli	a2,a2,3
	add	a5,a0,a5
	add	a2,a0,a2
	slli	a3,a1,3
	bgeu	a5,a2,.L217
	beq	a3,zero,.L144
	or	a1,a5,a2
	andi	a1,a1,3
	add	a3,a3,a2
	bne	a1,zero,.L142
	addi	a0, a2, 0
.L143:
	lw	a1,0(a0)
	addi	a0,a0,4
	addi	a5,a5,4
	sw	a1,-4(a5)
	bne	a0,a3,.L143
.L144:
	beq	t5,zero,.L104
	sub	a1,a2,a4
	addi	a1,a1,-1
	sltiu	a1,a1,3
	addi	a5, a2, 0
	addi	a3, a4, 0
	bne	a1,zero,.L148
	or	a1,a4,a2
	andi	a1,a1,3
	bne	a1,zero,.L148
	add	t5,a2,t5
.L149:
	lw	a4,0(a3)
	addi	a5,a5,4
	addi	a3,a3,4
	sw	a4,-4(a5)
	bne	a5,t5,.L149
	jal	zero, .L104
.L217:
	bgeu	a2, a5, .L144
	beq	a3,zero,.L144
.L147:
	addi	a3,a3,-1
	add	a1,a2,a3
	lbu	a0,0(a1)
	add	a1,a5,a3
	sb	a0,0(a1)
	bne	a3,zero,.L147
	jal	zero, .L144
.L216:
	bgeu	a5,a7,.L125
	beq	a6,zero,.L125
.L128:
	addi	a6,a6,-1
	add	t1,a5,a6
	lbu	t3,0(t1)
	add	t1,a7,a6
	sb	t3,0(t1)
	bne	a6,zero,.L128
	jal	zero, .L125
.L153:
	srai	a1,t5,1
	addi	a1,a1,-1
	jal	zero, .L155
.L214:
	slli	t5,t5,3
	addi	a1, a5, 0
	jal	zero, .L110
.L129:
	add	a5,a2,t5
	slli	a5,a5,3
	add	a5,a0,a5
	add	a1,a4,a1
.L131:
	lbu	a4,0(a3)
	addi	a3,a3,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a3,.L131
	jal	zero, .L104
.L148:
	add	a4,a4,t5
.L150:
	lbu	a5,0(a3)
	addi	a3,a3,1
	addi	a2,a2,1
	sb	a5,-1(a2)
	bne	a3,a4,.L150
	jal	zero, .L104
.L135:
	add	t1,a4,t5
.L138:
	lbu	a7,0(a5)
	addi	a6,a6,1
	addi	a5,a5,1
	sb	a7,-1(a6)
	bne	a6,t1,.L138
	jal	zero, .L137
.L115:
	addi	a6, a7, 0
	add	t3,a4,a1
.L118:
	lbu	t1,0(a6)
	addi	a5,a5,1
	addi	a6,a6,1
	sb	t1,-1(a5)
	bne	a5,t3,.L118
	jal	zero, .L117
.L215:
	add	a7,a0,a7
	jal	zero, .L117
.L142:
	addi	a1, a2, 0
.L145:
	lbu	a0,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a0,-1(a5)
	bne	a1,a3,.L145
	jal	zero, .L144
.L123:
	add	a6,a5,a6
.L126:
	lbu	t1,0(a5)
	addi	a5,a5,1
	addi	a7,a7,1
	sb	t1,-1(a7)
	bne	a5,a6,.L126
	jal	zero, .L125
	.size	Rotate.constprop.1, .-Rotate.constprop.1
	.align	2
	.type	Rotate.constprop.0, @function
Rotate.constprop.0:
	addi	sp,sp,-16
	sw	a1,8(sp)
	sw	a2,12(sp)
	beq	a1,a2,.L218
	add	a6,a1,a0
	blt	a0,zero,.L317
	sub	t3,a2,a6
	bge	t3,a0,.L318
.L222:
	bge	a4, t3, .L319
.L223:
	addi	a5, zero, 1
	bge	a5, a0, .L263
	srli	a5,a0,31
	add	a0,a5,a0
	srai	a0,a0,1
	add	a5,a1,a0
	sub	a4,a6,a0
	lui	a3,%hi(array1)
	addi	a3,a3,%lo(array1)
	slli	a5,a5,3
	slli	a4,a4,3
	slli	t1,a1,3
	add	a5,a5,a3
	add	a4,a4,a3
	add	t1,t1,a3
.L262:
	lw	a7,0(a4)
	lw	a0,-8(a5)
	lw	a3,-4(a5)
	sw	a7,-8(a5)
	lw	a7,4(a4)
	addi	a5,a5,-8
	addi	a4,a4,8
	sw	a7,4(a5)
	sw	a0,-8(a4)
	sw	a3,-4(a4)
	bne	a5,t1,.L262
.L263:
	addi	a5, zero, 1
	bge	a5, t3, .L261
	srli	a4,t3,31
	add	a4,a4,t3
	srai	a4,a4,1
	add	a5,a6,a4
	lui	a0,%hi(array1)
	sub	a4,a2,a4
	addi	a0,a0,%lo(array1)
	slli	a5,a5,3
	slli	a4,a4,3
	slli	a3,a6,3
	add	a5,a5,a0
	add	a4,a4,a0
	add	a3,a3,a0
.L265:
	lw	a7,0(a4)
	lw	a6,-8(a5)
	lw	a0,-4(a5)
	sw	a7,-8(a5)
	lw	a7,4(a4)
	addi	a5,a5,-8
	addi	a4,a4,8
	sw	a7,4(a5)
	sw	a6,-8(a4)
	sw	a0,-4(a4)
	bne	a5,a3,.L265
.L261:
	sub	a4,a2,a1
	addi	a5, zero, 1
	bge	a5, a4, .L218
	srli	a5,a4,31
	add	a5,a5,a4
	srai	a5,a5,1
	sub	a4,a2,a5
	lui	a3,%hi(array1)
	add	a5,a1,a5
	addi	a3,a3,%lo(array1)
	slli	a4,a4,3
	slli	a5,a5,3
	slli	a1,a1,3
	add	a5,a5,a3
	add	a4,a4,a3
	add	a1,a1,a3
.L266:
	lw	a0,0(a4)
	lw	a2,-8(a5)
	lw	a3,-4(a5)
	sw	a0,-8(a5)
	lw	a0,4(a4)
	addi	a5,a5,-8
	addi	a4,a4,8
	sw	a0,4(a5)
	sw	a2,-8(a4)
	sw	a3,-4(a4)
	bne	a5,a1,.L266
.L218:
	addi	sp,sp,16
	jalr	zero, ra, 0
.L318:
	blt	a4,a0,.L223
	lui	a7,%hi(array1)
	slli	a0,a0,3
	slli	a4,a1,3
	addi	a7,a7,%lo(array1)
	beq	a0,zero,.L229
	xori	t1, a7, -1
	sub	t1,t1,a4
	add	t1,a3,t1
	sltiu	t1,t1,3
	addi	a5, a3, 0
	bne	t1,zero,.L227
	andi	t1,a3,3
	bne	t1,zero,.L227
	add	t1,a7,a4
	add	t5,a3,a0
.L228:
	lw	t4,0(t1)
	addi	a5,a5,4
	addi	t1,t1,4
	sw	t4,-4(a5)
	bne	a5,t5,.L228
.L229:
	slli	t1,a6,3
	add	a5,a7,a4
	add	a4,a7,t1
	slli	t1,t3,3
	bgeu	a5,a4,.L320
	add	t4,a5,t1
	beq	t1,zero,.L236
.L235:
	lw	t1,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	t1,-4(a5)
	bne	a5,t4,.L235
.L236:
	beq	a0,zero,.L218
	add	a5,a2,a1
	sub	a5,a5,a6
	addi	a2,a7,-1
	slli	a5,a5,3
	sub	a2,a2,a3
	add	a2,a2,a5
	sltiu	a2,a2,3
	addi	a4, a3, 0
	bne	a2,zero,.L238
	andi	a2,a3,3
	bne	a2,zero,.L238
	add	a5,a7,a5
	add	a0,a0,a5
.L239:
	lw	a3,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a5)
	bne	a0,a5,.L239
	jal	zero, .L218
.L317:
	add	a6,a2,a0
	sub	a0,a6,a1
	sub	t3,a2,a6
	blt	t3,a0,.L222
	jal	zero, .L318
.L319:
	lui	a7,%hi(array1)
	slli	t3,t3,3
	addi	a7,a7,%lo(array1)
	beq	t3,zero,.L247
	sub	a5,a3,a7
	slli	a6,a6,3
	addi	a5,a5,-1
	sub	a5,a5,a6
	sltiu	a5,a5,3
	addi	a4, a3, 0
	bne	a5,zero,.L245
	andi	a5,a3,3
	bne	a5,zero,.L245
	add	a6,a7,a6
	add	t1,t3,a6
.L246:
	lw	a5,0(a6)
	addi	a6,a6,4
	addi	a4,a4,4
	sw	a5,-4(a4)
	bne	a6,t1,.L246
.L247:
	sub	a4,a2,a0
	slli	a4,a4,3
	slli	a1,a1,3
	add	a4,a7,a4
	add	a5,a7,a1
	slli	a0,a0,3
	bgeu	a4,a5,.L321
	addi	a2, a5, 0
	add	a6,a0,a5
	beq	a0,zero,.L253
.L252:
	lw	a0,0(a2)
	addi	a2,a2,4
	addi	a4,a4,4
	sw	a0,-4(a4)
	bne	a2,a6,.L252
.L253:
	beq	t3,zero,.L218
	addi	a2,a7,-1
	add	a2,a2,a1
	sub	a2,a2,a3
	sltiu	a2,a2,3
	addi	a4, a3, 0
	bne	a2,zero,.L255
	andi	a2,a3,3
	bne	a2,zero,.L255
	add	t3,a5,t3
.L256:
	lw	a3,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a5)
	bne	a5,t3,.L256
	jal	zero, .L218
.L321:
	bgeu	a5, a4, .L253
	beq	a0,zero,.L253
.L254:
	addi	a0,a0,-1
	add	a2,a5,a0
	lbu	a6,0(a2)
	add	a2,a4,a0
	sb	a6,0(a2)
	bne	a0,zero,.L254
	jal	zero, .L253
.L320:
	bgeu	a4, a5, .L236
	beq	t1,zero,.L236
.L237:
	addi	t1,t1,-1
	add	t4,a4,t1
	lbu	t5,0(t4)
	add	t4,a5,t1
	sb	t5,0(t4)
	bne	t1,zero,.L237
	jal	zero, .L236
.L255:
	add	a7,a7,a1
	add	a3,a3,t3
.L257:
	lbu	a5,0(a4)
	addi	a4,a4,1
	addi	a7,a7,1
	sb	a5,-1(a7)
	bne	a4,a3,.L257
	jal	zero, .L218
.L245:
	add	a5,a7,a6
	add	t1,a3,t3
.L248:
	lbu	a6,0(a5)
	addi	a4,a4,1
	addi	a5,a5,1
	sb	a6,-1(a4)
	bne	a4,t1,.L248
	jal	zero, .L247
.L238:
	add	a5,a1,t3
	slli	a5,a5,3
	add	a5,a7,a5
	add	a0,a3,a0
.L240:
	lbu	a3,0(a4)
	addi	a4,a4,1
	addi	a5,a5,1
	sb	a3,-1(a5)
	bne	a0,a4,.L240
	jal	zero, .L218
.L227:
	add	t1,a7,a4
	add	t5,a3,a0
.L230:
	lbu	t4,0(t1)
	addi	a5,a5,1
	addi	t1,t1,1
	sb	t4,-1(a5)
	bne	a5,t5,.L230
	jal	zero, .L229
	.size	Rotate.constprop.0, .-Rotate.constprop.0
	.align	2
	.type	WikiSort.constprop.0, @function
WikiSort.constprop.0:
	addi	sp,sp,-272
	lui	a5,%hi(array1)
	sw	s11,220(sp)
	sw	ra,268(sp)
	sw	s0,264(sp)
	sw	s1,260(sp)
	sw	s2,256(sp)
	sw	s3,252(sp)
	sw	s4,248(sp)
	sw	s5,244(sp)
	sw	s6,240(sp)
	sw	s7,236(sp)
	sw	s8,232(sp)
	sw	s9,228(sp)
	sw	s10,224(sp)
	addi	s11,a5,%lo(array1)
	addi	sp,sp,-2048
	lui	a5,%hi(array1+8)
	addi	sp,sp,-2048
	addi	t3,a5,%lo(array1+8)
	addi	a0, zero, 0
	addi	t5, zero, 400
.L326:
	addi	t4,a0,1
	addi	t1, t3, 0
	addi	a7,a0,25
.L325:
	lw	a6,0(t1)
	lw	t6,4(t1)
	addi	a5, t1, 0
	addi	a4, t4, 0
	jal	zero, .L324
.L557:
	lw	a1,-4(a5)
	sw	a3,0(a5)
	addi	a4,a4,-1
	sw	a1,4(a5)
	addi	a5,a5,-8
	bge	a0,a4,.L556
.L324:
	lw	a3,-8(a5)
	addi	a2, a5, 0
	blt	a6, a3, .L557
	sw	a6,0(a2)
	sw	t6,4(a2)
	addi	t4,t4,1
	addi	t1,t1,8
	bne	a7,t4,.L325
.L559:
	addi	t3,t3,200
	beq	a7,t5,.L558
	addi	a0, a7, 0
	jal	zero, .L326
.L556:
	slli	a4,a4,3
	add	a2,s11,a4
	sw	a6,0(a2)
	sw	t6,4(a2)
	addi	t4,t4,1
	addi	t1,t1,8
	bne	a7,t4,.L325
	jal	zero, .L559
.L558:
	lui	a5, 131072
	addi	a5,a5,-1
	sw	a5,28(sp)
	addi	t2, zero, 25
	addi	s5, zero, 4
.L327:
	lui	a5, 262144
	bge	t2,a5,.L471
.L328:
	srai	a5,a5,2
	blt	t2, a5, .L328
	beq	a5,zero,.L329
.L471:
	addi	a3, t2, 0
	addi	s3, zero, 0
.L333:
	add	a4,a5,s3
	blt	a3,a4,.L330
.L560:
	slli	a2,a5,1
	add	s3,a2,s3
	srai	a5,a5,2
	srai	s3,s3,1
	beq	a5,zero,.L331
	sub	a3,a3,a4
	add	a4,a5,s3
	bge	a3,a4,.L560
.L330:
	srai	a5,a5,2
	srai	s3,s3,1
	bne	a5,zero,.L333
.L331:
	div	a5,t2,s3
	slli	s7,t2,1
	sw	zero,104(sp)
	sw	zero,88(sp)
	sw	zero,100(sp)
	sw	zero,84(sp)
	sw	zero,96(sp)
	sw	zero,24(sp)
	sw	zero,12(sp)
	sw	zero,60(sp)
	addi	s6, zero, 0
	sw	t2,64(sp)
	addi	s9, t2, 0
	slli	s8,s3,3
	sw	s5,108(sp)
	sw	a5,92(sp)
	addi	a5,s7,-1
	sw	a5,32(sp)
	addi	a5, zero, 1
	sw	a5,20(sp)
	div	a5,t2,s3
	addi	a5,a5,1
	sw	a5,68(sp)
.L449:
	lw	a4,20(sp)
	add	a5,s6,s7
	lw	a2,60(sp)
	lw	a0,12(sp)
	sw	a5,16(sp)
	addi	a6, s6, 0
	slli	a3,a4,3
	addi	s6, a5, 0
	slli	a5,a5,3
	add	a5,s11,a5
	add	a4,s11,a3
	lw	a1,-8(a5)
	lw	a5,-8(a4)
	sub	a2,a2,a0
	sw	a2,52(sp)
	blt	a1,a5,.L561
	slli	a2,s9,3
	add	a2,s11,a2
	lw	a0,-8(a2)
	lw	a2,0(a2)
	bge	a2, a0, .L337
	lw	a2,64(sp)
	addi	a0, zero, 512
	addi	s4, s9, 0
	bge	a0, a2, .L562
	addi	t5,a3,-8
	lw	a3,52(sp)
	bge	zero, a3, .L563
	addi	a0, a2, 0
	rem	a0,a0,s3
	addi	t3, a2, 0
	sw	s6,48(sp)
	addi	s10,sp,208
	add	s1,a6,a0
	addi	a2,s1,1
	bge	a2, s9, .L564
.L406:
	lw	a5,12(sp)
	slli	a7,s1,3
	slli	a4,a5,3
	lui	a5,%hi(array1+8)
	addi	a5,a5,%lo(array1+8)
	add	a4,s11,a4
	add	a3,a5,a7
.L410:
	lw	t1,0(a3)
	lw	a1,0(a4)
	lw	a5,4(a4)
	sw	t1,0(a4)
	lw	t1,4(a3)
	add	a2,a2,s3
	addi	a4,a4,8
	sw	t1,-4(a4)
	sw	a1,0(a3)
	sw	a5,4(a3)
	add	a3,a3,s8
	blt	a2, s9, .L410
.L411:
	addi	t4, s3, 0
	bge	t3, s3, .L407
	addi	t4, t3, 0
.L407:
	add	a7,s11,a7
	addi	a5, zero, 512
	lw	t0,0(a7)
	add	t4,t4,s9
	blt	a5, a0, .L565
	slli	a0,a0,3
	add	a4,s11,t5
	add	a1,a0,a4
	addi	a3, s10, 0
	beq	a0,zero,.L555
.L414:
	lw	a5,0(a4)
	addi	a4,a4,4
	addi	a3,a3,4
	sw	a5,-4(a3)
	bne	a1,a4,.L414
.L555:
	lw	a5,24(sp)
	slli	a1,a5,3
.L415:
	add	a5,s11,a1
	sw	s6,72(sp)
	addi	s5, s4, 0
	sw	s7,76(sp)
	sw	s9,80(sp)
	addi	s7, s9, 0
	sw	a5,56(sp)
	addi	t3, s1, 0
	addi	s2, zero, 0
	addi	s0, zero, 0
	sw	zero,8(sp)
	addi	s6, t4, 0
	addi	t1, s1, 0
	addi	s4, t0, 0
	addi	s9, s10, 0
.L413:
	bge	s0, s2, .L420
.L417:
	lw	a5,28(sp)
	add	a4,s2,a5
	slli	a4,a4,3
	add	a4,s11,a4
	lw	a4,0(a4)
	blt	a4, s4, .L420
.L418:
	addi	a4,s2,-1
	bge	s0,a4,.L421
	slli	a3,t1,3
	add	a3,s11,a3
	lw	a1,0(a3)
	addi	a2, a4, 0
.L423:
	sub	a5,a2,s0
	srai	a5,a5,1
	add	a5,a5,s0
	slli	a3,a5,3
	add	a3,s11,a3
	lw	a3,0(a3)
	bge	a3, a1, .L484
	addi	s0,a5,1
	blt	s0,a2,.L423
.L421:
	bne	a4,s0,.L424
	slli	a3,s0,3
	slli	a4,t1,3
	add	a4,s11,a4
	add	a3,s11,a3
	lw	a4,0(a4)
	lw	a3,0(a3)
	slt	a4, a3, a4
	add	s0,s0,a4
.L424:
	sub	s4,s2,s0
	add	s10,s1,s3
	bge	zero, s3, .L429
	slli	a3,t1,3
	slli	a4,s1,3
	slli	t1,s10,3
	add	a3,s11,a3
	add	t1,s11,t1
	add	a4,s11,a4
.L428:
	lw	a1,0(a3)
	lw	a2,0(a4)
	lw	a5,4(a4)
	sw	a1,0(a4)
	lw	a1,4(a3)
	addi	a4,a4,8
	addi	a3,a3,8
	sw	a1,-4(a4)
	sw	a2,-8(a3)
	sw	a5,-4(a3)
	bne	t1,a4,.L428
.L429:
	lw	a5,12(sp)
	lw	a4,8(sp)
	addi	a3,s1,1
	slli	a3,a3,3
	add	a4,a5,a4
	slli	a4,a4,3
	add	a4,s11,a4
	lw	a2,0(a4)
	add	a3,s11,a3
	lw	a1,0(a3)
	sw	a2,0(a3)
	lw	a0,4(a4)
	lw	a2,4(a3)
	addi	a5, s9, 0
	sw	a0,4(a3)
	lw	a0,24(sp)
	sw	a1,0(a4)
	sw	a2,4(a4)
	addi	a1, a6, 0
	addi	a3, t3, 0
	addi	a2, t3, 0
	addi	a4, s0, 0
	sw	t3,-40(s9)
	sw	a6,-96(s9)
	sw	t3,-92(s9)
	sw	s0,-36(s9)
.Lpcrel_1:
	auipc	ra, %pcrel_hi(WikiMerge.constprop.0.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_1)
	addi	a5, zero, 512
	blt	a5, s3, .L566
	beq	s8,zero,.L434
	slli	a4,s1,3
	add	a4,s11,a4
	add	a1,s8,a4
	addi	a3, s9, 0
.L433:
	lw	a5,0(a4)
	addi	a4,a4,4
	addi	a3,a3,4
	sw	a5,-4(a3)
	bne	a4,a1,.L433
.L434:
	bge	zero, s4, .L432
	sub	a3,s10,s4
	slli	a4,s0,3
	slli	s2,s2,3
	slli	a3,a3,3
	add	a4,s11,a4
	add	s2,s11,s2
	add	a3,s11,a3
.L438:
	lw	a1,0(a3)
	lw	a2,0(a4)
	lw	a5,4(a4)
	sw	a1,0(a4)
	lw	a1,4(a3)
	addi	a4,a4,8
	addi	a3,a3,8
	sw	a1,-4(a4)
	sw	a2,-8(a3)
	sw	a5,-4(a3)
	bne	a4,s2,.L438
.L432:
	sub	a6,s1,s4
	add	t3,a6,s3
	beq	s10,s5,.L567
	lw	a5,8(sp)
	addi	t1,s10,1
	add	a4,t1,s3
	addi	a5,a5,1
	sw	a5,8(sp)
	add	s2,s4,t3
	bge	a4, s5, .L485
	slli	a3,t1,3
	add	a3,s11,a3
	lw	a0,0(a3)
	slli	a2,a4,3
	add	a2,s11,a2
.L441:
	lw	a5,0(a2)
	bge	a5, a0, .L440
	addi	a0, a5, 0
	addi	t1, a4, 0
.L440:
	add	a4,a4,s3
	add	a2,a2,s8
	blt	a4, s5, .L441
	addi	t1,t1,-1
.L439:
	slli	a4,t1,3
	add	a4,s11,a4
	addi	s0, t3, 0
	lw	s4,0(a4)
	addi	s1, s10, 0
	blt	s0, s2, .L417
.L420:
	beq	s6,s7,.L418
	sub	s0,s6,s7
	bge	s0,s3,.L568
	addi	a1, s1, 0
	addi	a2, s6, 0
	sub	a0,s7,s6
	addi	a4, zero, 0
	addi	a3, s9, 0
	sw	a6,44(sp)
	sw	t3,40(sp)
	sw	t1,36(sp)
	sw	s1,-48(s9)
	sw	s6,-44(s9)
.Lpcrel_2:
	auipc	ra, %pcrel_hi(Rotate.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_2)
	lw	t1,36(sp)
	add	s2,s1,s0
	add	s5,s5,s0
	add	t1,t1,s0
	lw	t3,40(sp)
	addi	s0, s1, 0
	lw	a6,44(sp)
	addi	s6, s7, 0
	addi	s1, s2, 0
	jal	zero, .L413
.L484:
	addi	a2, a5, 0
	blt	s0,a2,.L423
	jal	zero, .L421
.L566:
	lw	a3,56(sp)
	slli	a4,s1,3
	slli	a6,s10,3
	add	a4,s11,a4
	add	a6,s11,a6
.L435:
	lw	a1,0(a3)
	lw	a2,0(a4)
	lw	a5,4(a4)
	sw	a1,0(a4)
	lw	a1,4(a3)
	addi	a4,a4,8
	addi	a3,a3,8
	sw	a1,-4(a4)
	sw	a2,-8(a3)
	sw	a5,-4(a3)
	bne	a6,a4,.L435
	jal	zero, .L434
.L561:
	lw	a0,64(sp)
	addi	a3,sp,208
	addi	a1, a6, 0
	addi	a4, zero, 512
	addi	a2, s6, 0
	sw	a6,200(sp)
	sw	s6,204(sp)
.Lpcrel_3:
	auipc	ra, %pcrel_hi(Rotate.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_3)
.L337:
	lw	a4,32(sp)
	addi	a5, zero, 399
	add	s9,s9,s7
	add	a4,a4,s7
	sw	a4,32(sp)
	lw	a4,20(sp)
	add	a4,a4,s7
	sw	a4,20(sp)
	lw	a4,16(sp)
	bge	a5, a4, .L449
	lw	a5,52(sp)
	lw	s5,108(sp)
	blt	zero, a5, .L450
.L460:
	addi	s5,s5,-1
	beq	s5,zero,.L569
.L488:
	addi	t2, s7, 0
	jal	zero, .L327
.L568:
	add	s10,s3,s1
	bge	zero, s3, .L447
	slli	a7,s10,3
	slli	a4,s1,3
	slli	a3,s7,3
	add	a7,s11,a7
	add	a4,s11,a4
	add	a3,s11,a3
.L446:
	lw	a1,0(a3)
	lw	a2,0(a4)
	lw	a5,4(a4)
	sw	a1,0(a4)
	lw	a1,4(a3)
	addi	a4,a4,8
	addi	a3,a3,8
	sw	a1,-4(a4)
	sw	a2,-8(a3)
	sw	a5,-4(a3)
	bne	a7,a4,.L446
.L447:
	addi	s2, s10, 0
	bne	t1,s1,.L445
	addi	t1, s5, 0
.L445:
	lw	a5,48(sp)
	add	s6,s6,s3
	add	s5,s5,s3
	add	s7,s7,s3
	bge	a5, s6, .L448
	addi	s6, a5, 0
.L448:
	addi	s0, s1, 0
	addi	s1, s10, 0
	jal	zero, .L413
.L567:
	lw	a5,48(sp)
	lw	a0,24(sp)
	addi	s10, s9, 0
	addi	a4, a5, 0
	sw	a5,-52(s10)
	addi	a1, a6, 0
	addi	a5, s10, 0
	addi	a3, t3, 0
	addi	a2, t3, 0
	lw	s6,72(sp)
	lw	s7,76(sp)
	lw	s9,80(sp)
	sw	a6,-96(s10)
	sw	t3,-56(s10)
	sw	t3,-92(s10)
.Lpcrel_4:
	auipc	ra, %pcrel_hi(WikiMerge.constprop.0.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_4)
	jal	zero, .L337
.L485:
	addi	t1, s10, 0
	jal	zero, .L439
.L565:
	lw	a5,24(sp)
	slli	a4,a6,3
	add	a4,s11,a4
	slli	a1,a5,3
	add	a3,s11,a1
.L416:
	lw	a0,0(a3)
	lw	a2,0(a4)
	lw	a5,4(a4)
	sw	a0,0(a4)
	lw	a0,4(a3)
	addi	a4,a4,8
	addi	a3,a3,8
	sw	a0,-4(a4)
	sw	a2,-8(a3)
	sw	a5,-4(a3)
	bne	a7,a4,.L416
	jal	zero, .L415
.L563:
	lw	a2,20(sp)
	lw	a0,92(sp)
	addi	s1, zero, 1
.L348:
	addi	a3, a5, 0
	lw	a5,0(a4)
	blt	a3,a5,.L347
	bge	a5, a3, .L346
.L347:
	beq	a0,s1,.L476
	addi	s1,s1,1
.L346:
	addi	a2,a2,1
	addi	a4,a4,8
	blt	a2, s9, .L348
	lw	a5,68(sp)
	addi	a4, zero, 512
	blt	a4, a5, .L349
.L571:
	bne	a5,s1,.L350
	add	a5,a5,a6
	sw	a5,60(sp)
	sw	a5,88(sp)
	lw	a5,16(sp)
	lw	a4,16(sp)
	sw	a6,96(sp)
	sw	a5,84(sp)
	lw	a5,68(sp)
	sw	a6,24(sp)
	addi	a3, zero, 0
	sw	a5,52(sp)
.L351:
	slli	a5,a2,3
	add	s0,s11,a5
	lw	a5,88(sp)
	sw	s4,36(sp)
	sw	s3,44(sp)
	slli	s10,a5,3
	lw	a5,20(sp)
	addi	s4, s0, 0
	addi	s2, a2, 0
	sw	a4,8(sp)
	sw	a3,12(sp)
	sw	a6,40(sp)
	addi	s3, zero, 0
	addi	s0,a5,-1
	addi	s5,sp,208
.L400:
	beq	s2,s0,.L399
	lw	a1,-8(s4)
	lw	a4,0(s4)
	blt	a1,a4,.L399
	bge	a4, a1, .L398
.L399:
	addi	a2,a2,1
	addi	a1,s2,1
	sub	a0, zero, s3
	addi	a4, zero, 512
	addi	a3, s5, 0
	sw	a2,-20(s5)
	sw	a1,-24(s5)
.Lpcrel_5:
	auipc	ra, %pcrel_hi(Rotate.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_5)
	add	a2,s2,s3
	addi	s3,s3,1
.L398:
	addi	s2,s2,-1
	addi	s4,s4,-8
	blt	s3,s1,.L400
	lw	a6,40(sp)
	lw	a4,8(sp)
	lw	s4,36(sp)
	lw	s3,44(sp)
	lw	a3,12(sp)
	addi	t5, s10, 0
	sw	a6,12(sp)
	addi	s10, s5, 0
.L472:
	bge	zero, a3, .L405
.L359:
	slli	s2,a4,3
	sw	s4,8(sp)
	add	s4,s11,s2
	lw	s2,32(sp)
	sw	s1,36(sp)
	sw	s3,44(sp)
	addi	s5, s10, 0
	addi	a1, a4, 0
	addi	s1, a4, 0
	addi	s0, a3, 0
	sw	a6,40(sp)
	addi	s3, zero, 0
	addi	s10, t5, 0
.L404:
	beq	s1,s2,.L403
	lw	a4,0(s4)
	lw	a6,8(s4)
	blt	a4, a6, .L403
	bge	a6,a4,.L402
.L403:
	addi	a0, s3, 0
	addi	a4, zero, 512
	addi	a3, s5, 0
	addi	a2, s1, 0
	sw	a1,-32(s5)
	sw	s1,-28(s5)
.Lpcrel_6:
	auipc	ra, %pcrel_hi(Rotate.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_6)
	sub	a1,s1,s3
	addi	s3,s3,1
.L402:
	addi	s1,s1,1
	addi	s4,s4,8
	blt	s3,s0,.L404
	lw	s4,8(sp)
	lw	s1,36(sp)
	lw	a6,40(sp)
	lw	s3,44(sp)
	addi	t5, s10, 0
	addi	s10, s5, 0
.L405:
	lw	a5,64(sp)
	sw	a6,100(sp)
	lw	a6,88(sp)
	sub	a0,a5,s1
	rem	a0,a0,s3
	lw	a5,84(sp)
	sub	t3,a5,s9
	sw	a5,48(sp)
	lw	a5,16(sp)
	sw	a5,104(sp)
	add	s1,a6,a0
	addi	a2,s1,1
	blt	a2, s9, .L406
.L564:
	slli	a7,s1,3
	jal	zero, .L411
.L562:
	slli	a1,a2,3
	beq	a1,zero,.L570
	lui	a5,%hi(array1-8)
	addi	a5,a5,%lo(array1-8)
	add	a3,a5,a3
	addi	s10,sp,208
	add	a1,a1,a3
	addi	a4, s10, 0
.L341:
	lw	a5,0(a3)
	addi	a3,a3,4
	addi	a4,a4,4
	sw	a5,-4(a4)
	bne	a1,a3,.L341
.L342:
	lw	a4,16(sp)
	addi	a1, a6, 0
	addi	a5, s10, 0
	addi	a3, s9, 0
	addi	a2, s9, 0
	addi	a0, zero, 0
	sw	a6,-88(s10)
	sw	s9,-84(s10)
	sw	s9,-80(s10)
	sw	a4,-76(s10)
.Lpcrel_7:
	auipc	ra, %pcrel_hi(WikiMerge.constprop.0.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_7)
	jal	zero, .L337
.L476:
	lw	a5,68(sp)
	addi	a4, zero, 512
	addi	s1,s1,1
	bge	a4, a5, .L571
.L349:
	addi	a3,a2,1
	bge	a3, s9, .L362
	slli	a4,a2,3
	add	a5,s11,a4
	lui	a0,%hi(array1+8)
	lw	a5,0(a5)
	lw	t1,92(sp)
	addi	a0,a0,%lo(array1+8)
	add	a4,a0,a4
	addi	a7, zero, 0
.L367:
	addi	a0, a5, 0
	lw	a5,0(a4)
	blt	a0, a5, .L366
	bge	a5,a0,.L365
.L366:
	beq	t1,a7,.L478
	addi	a7,a7,1
.L365:
	addi	a3,a3,1
	addi	a4,a4,8
	bne	s9,a3,.L367
	lw	a5,68(sp)
	beq	a5,a7,.L572
.L362:
	lw	a5,16(sp)
	lw	a4,68(sp)
	addi	a5,a5,-2
	beq	a4,s1,.L573
	blt	a5, s9, .L377
	lw	a4,32(sp)
	lui	a3,%hi(array1-8)
	lw	a0,92(sp)
	slli	a4,a4,3
	addi	a3,a3,%lo(array1-8)
	add	a4,a3,a4
	addi	a2, zero, 1
.L381:
	addi	a3, a1, 0
	lw	a1,0(a4)
	blt	a1, a3, .L380
	bge	a3,a1,.L379
.L380:
	beq	a0,a2,.L377
	addi	a2,a2,1
.L379:
	addi	a5,a5,-1
	addi	a4,a4,-8
	bge	a5, s9, .L381
.L377:
	addi	a4,a5,-1
	blt	a4, s9, .L376
	slli	a5,a5,3
	add	a3,s11,a5
	lui	a2,%hi(array1-8)
	lw	a3,0(a3)
	lw	a0,92(sp)
	addi	a2,a2,%lo(array1-8)
	add	a5,a2,a5
	addi	a2, zero, 0
.L386:
	addi	a1, a3, 0
	lw	a3,0(a5)
	blt	a3, a1, .L385
	bge	a1,a3,.L384
.L385:
	beq	a2,a0,.L480
	addi	a2,a2,1
.L384:
	addi	a4,a4,-1
	addi	a5,a5,-8
	bge	a4, s9, .L386
	lw	a5,68(sp)
	bne	a5,a2,.L376
.L581:
	slli	a3,a5,1
	lw	a2,92(sp)
	lw	a5,32(sp)
	addi	s10,sp,208
	sw	a6,88(sp)
	sub	a5,a5,a2
	sw	a5,96(sp)
	lw	a5,16(sp)
	addi	s1, zero, 0
	sub	a5,a5,a3
	sw	a5,84(sp)
	lw	a5,96(sp)
	sw	a5,12(sp)
	lw	a5,16(sp)
	sub	a5,a5,a3
	sw	a5,24(sp)
	lw	a5,68(sp)
	sw	a5,52(sp)
	lw	a5,16(sp)
	sw	a5,60(sp)
	jal	zero, .L359
.L350:
	lw	a5,16(sp)
	addi	a4,a5,-2
	blt	a4, s9, .L352
	lw	a5,32(sp)
	lui	a3,%hi(array1-8)
	lw	a0,92(sp)
	addi	a3,a3,%lo(array1-8)
	slli	a5,a5,3
	add	a5,a3,a5
	addi	a3, zero, 1
.L357:
	addi	a2, a1, 0
	lw	a1,0(a5)
	blt	a1,a2,.L356
	bge	a2, a1, .L355
.L356:
	beq	a0,a3,.L477
	addi	a3,a3,1
.L355:
	addi	a4,a4,-1
	addi	a5,a5,-8
	bge	a4, s9, .L357
	lw	a5,68(sp)
	add	a2,a4,a3
	beq	a5,a3,.L574
.L361:
	bge	a3, a5, .L575
.L376:
	lw	s0,16(sp)
	sw	s3,8(sp)
	lw	s10,32(sp)
	addi	s1,sp,208
	addi	s5, a6, 0
	bge	s4, s0, .L541
.L396:
	sw	s4,-80(s1)
	sw	s0,-76(s1)
	bge	s4,s10,.L481
	slli	a5,s5,3
	add	a5,s11,a5
	lw	a3,0(a5)
	addi	s2, s4, 0
	addi	a2, s10, 0
.L389:
	sub	a5,a2,s2
	srai	a5,a5,1
	add	a5,a5,s2
	slli	a4,a5,3
	add	a4,s11,a4
	lw	a4,0(a4)
	bge	a4, a3, .L482
	addi	s2,a5,1
	blt	s2,a2,.L389
.L387:
	bne	s10,s2,.L390
	slli	a4,s10,3
	slli	a5,s5,3
	add	a4,s11,a4
	add	a5,s11,a5
	lw	s2,0(a4)
	lw	a5,0(a5)
	slt	s2,s2,a5
	add	s2,s10,s2
.L390:
	sub	a0,s4,s2
	addi	a4, zero, 512
	addi	a3, s1, 0
	addi	a1, s5, 0
	addi	a2, s2, 0
	sub	s3,s2,s4
	sw	s5,-16(s1)
	sw	s2,-12(s1)
.Lpcrel_8:
	auipc	ra, %pcrel_hi(Rotate.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_8)
	sw	s4,-84(s1)
	sw	s5,-88(s1)
	addi	s4,s4,-1
	add	a5,s5,s3
	bge	s5,s4,.L391
	slli	a4,a5,3
	add	a4,s11,a4
	lw	a3,0(a4)
	addi	a2, s4, 0
.L393:
	sub	a4,a2,s5
	srai	a4,a4,1
	add	a4,a4,s5
	slli	a1,a4,3
	add	a1,s11,a1
	lw	a1,0(a1)
	blt	a3,a1,.L483
	addi	s5,a4,1
	blt	s5,a2,.L393
.L391:
	beq	s4,s5,.L576
.L394:
	bge	s5, s2, .L541
	addi	s4, s2, 0
	blt	s4, s0, .L396
.L541:
	lw	s3,8(sp)
	jal	zero, .L337
.L576:
	slli	a4,s5,3
	slli	a5,a5,3
	add	a5,s11,a5
	add	a4,s11,a4
	lw	a5,0(a5)
	lw	a4,0(a4)
	slt	a5,a5,a4
	sltiu	a5, a5, 1
	add	s5,s5,a5
	jal	zero, .L394
.L574:
	addi	a2, a5, 0
	lw	a5,16(sp)
	addi	s10,sp,208
	sw	a2,52(sp)
	sub	a5,a5,a2
	sw	a5,12(sp)
	sw	a5,84(sp)
.L554:
	lw	a5,16(sp)
	sw	a6,88(sp)
	sw	a6,24(sp)
	sw	a5,60(sp)
	sw	a6,96(sp)
	addi	s1, zero, 0
	jal	zero, .L359
.L482:
	addi	a2, a5, 0
	blt	s2,a2,.L389
	jal	zero, .L387
.L483:
	addi	a2, a4, 0
	blt	s5,a2,.L393
	jal	zero, .L391
.L481:
	addi	s2, s4, 0
	jal	zero, .L387
.L450:
	lw	a5,24(sp)
	slli	a0,a5,3
	addi	a7,a5,1
	lui	a5,%hi(array1+8)
	addi	a5,a5,%lo(array1+8)
	add	a0,a0,a5
	lw	a5,96(sp)
	bge	a7, a5, .L458
	lw	t1,24(sp)
.L457:
	lw	a6,0(a0)
	lw	t3,4(a0)
	addi	a5, a0, 0
	addi	a4, a7, 0
	jal	zero, .L456
.L578:
	lw	a1,-4(a5)
	sw	a3,0(a5)
	addi	a4,a4,-1
	sw	a1,4(a5)
	addi	a5,a5,-8
	bge	t1,a4,.L577
.L456:
	lw	a3,-8(a5)
	addi	a2, a5, 0
	blt	a6, a3, .L578
	lw	a5,96(sp)
	sw	a6,0(a2)
	sw	t3,4(a2)
	addi	a7,a7,1
	addi	a0,a0,8
	bne	a5,a7,.L457
.L458:
	lw	a4,100(sp)
	lw	a5,88(sp)
	addi	s3,sp,208
	addi	s1, a4, 0
	addi	s0, a5, 0
	bge	a4, a5, .L454
	lw	s4,84(sp)
.L453:
	beq	s0,s4,.L461
.L579:
	slli	a2,s0,3
	slli	a4,s1,3
	add	a2,s11,a2
	add	a4,s11,a4
	lw	a2,0(a2)
	lw	a4,0(a4)
	bge	a2,a4,.L461
	bge	s1, a5, .L454
	addi	s0,s0,1
	bne	s0,s4,.L579
.L461:
	addi	a1, s1, 0
	sub	a0,a5,s0
	addi	a4, zero, 512
	addi	a3, s3, 0
	addi	a2, s0, 0
	sw	s1,-64(s3)
	sub	s2,s0,a5
	sw	s0,-60(s3)
.Lpcrel_9:
	auipc	ra, %pcrel_hi(Rotate.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_9)
	addi	a5,s2,1
	add	s1,s1,a5
	bge	s1, s0, .L454
	beq	s0,s4,.L465
	addi	a5, s0, 0
	jal	zero, .L453
.L465:
	addi	a1, s1, 0
	sw	s1,-64(s3)
	addi	a4, zero, 512
	addi	a3, s3, 0
	addi	a2, s0, 0
	addi	a0, zero, 0
	addi	s1,s1,1
	sw	s0,-60(s3)
.Lpcrel_10:
	auipc	ra, %pcrel_hi(Rotate.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_10)
	blt	s1, s0, .L465
.L454:
	lw	a5,84(sp)
	lw	a4,104(sp)
	addi	s3,sp,208
	addi	s0, a5, 0
	bge	a5, a4, .L460
	lw	s1,100(sp)
	addi	s2, a4, 0
	addi	s4, a5, 0
.L459:
	beq	s1,s0,.L466
.L580:
	lw	a5,28(sp)
	add	a4,s0,a5
	add	a5,s2,a5
	slli	a4,a4,3
	slli	a5,a5,3
	add	a4,s11,a4
	add	a5,s11,a5
	lw	a4,0(a4)
	lw	a5,0(a5)
	bge	a5, a4, .L466
	bge	s4, s2, .L460
	addi	s0,s0,-1
	bne	s1,s0,.L580
.L466:
	sub	s4,s4,s0
	addi	a0, s4, 0
	addi	s4,s4,1
	addi	a2, s2, 0
	sw	s2,-68(s3)
	addi	a4, zero, 512
	addi	a3, s3, 0
	addi	a1, s0, 0
	sub	s2,s2,s4
	sw	s0,-72(s3)
.Lpcrel_11:
	auipc	ra, %pcrel_hi(Rotate.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_11)
	bge	s0, s2, .L460
	beq	s1,s0,.L551
	addi	s4, s0, 0
	jal	zero, .L459
.L551:
	addi	s1, s2, 0
.L470:
	addi	a2, s1, 0
	sw	s1,-68(s3)
	addi	a4, zero, 512
	addi	a3, s3, 0
	addi	a1, s0, 0
	addi	a0, zero, 0
	addi	s1,s1,-1
	sw	s0,-72(s3)
.Lpcrel_12:
	auipc	ra, %pcrel_hi(Rotate.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_12)
	blt	s0, s1, .L470
	addi	s5,s5,-1
	bne	s5,zero,.L488
.L569:
	lui	t0, 1
	add	sp,sp,t0
	lw	ra,268(sp)
	lw	s0,264(sp)
	lw	s1,260(sp)
	lw	s2,256(sp)
	lw	s3,252(sp)
	lw	s4,248(sp)
	lw	s5,244(sp)
	lw	s6,240(sp)
	lw	s7,236(sp)
	lw	s8,232(sp)
	lw	s9,228(sp)
	lw	s10,224(sp)
	lw	s11,220(sp)
	addi	sp,sp,272
	jalr	zero, ra, 0
.L477:
	lw	a5,68(sp)
	addi	a3,a3,1
	add	a2,a4,a3
	bne	a5,a3,.L361
	jal	zero, .L574
.L478:
	lw	a5,68(sp)
	addi	a7,a7,1
	bne	a5,a7,.L362
.L572:
	lw	a5,92(sp)
	lw	a4,20(sp)
	addi	a2, a3, 0
	slli	a5,a5,1
	addi	a5,a5,1
	add	a5,a5,a4
	sw	a5,96(sp)
	lw	a5,92(sp)
	addi	a3, zero, 0
	add	a5,a5,a4
	sw	a5,60(sp)
	lw	a5,96(sp)
	lw	a4,16(sp)
	sw	a5,88(sp)
	lw	a5,60(sp)
	sw	a5,24(sp)
	lw	a5,68(sp)
	slli	s1,a5,1
	lw	a5,16(sp)
	sw	a5,84(sp)
	lw	a5,68(sp)
	sw	a5,52(sp)
	jal	zero, .L351
.L573:
	blt	a5, s9, .L376
	lw	a4,32(sp)
	lui	a3,%hi(array1-8)
	lw	a7,92(sp)
	addi	a3,a3,%lo(array1-8)
	slli	a4,a4,3
	add	a4,a3,a4
	addi	a3, zero, 1
.L375:
	addi	a0, a1, 0
	lw	a1,0(a4)
	blt	a1, a0, .L374
	bge	a0,a1,.L373
.L374:
	beq	a7,a3,.L479
	addi	a3,a3,1
.L373:
	addi	a5,a5,-1
	addi	a4,a4,-8
	bge	a5, s9, .L375
	bne	s1,a3,.L376
.L582:
	add	a4,s1,a6
	sw	a4,60(sp)
	lw	a4,16(sp)
	addi	a3, s1, 0
	sw	s1,52(sp)
	sub	a4,a4,s1
	sw	a4,24(sp)
	addi	a4, a5, 0
	add	a5,s1,a6
	sw	a5,88(sp)
	lw	a5,24(sp)
	sw	a5,84(sp)
	lw	a5,16(sp)
	sw	a5,96(sp)
	jal	zero, .L351
.L480:
	lw	a5,68(sp)
	addi	a2,a2,1
	bne	a5,a2,.L376
	jal	zero, .L581
.L570:
	addi	s10,sp,208
	jal	zero, .L342
.L577:
	slli	a4,a4,3
	lw	a5,96(sp)
	add	a2,s11,a4
	sw	a6,0(a2)
	sw	t3,4(a2)
	addi	a7,a7,1
	addi	a0,a0,8
	bne	a5,a7,.L457
	jal	zero, .L458
.L479:
	addi	a3,a3,1
	bne	s1,a3,.L376
	jal	zero, .L582
.L352:
	addi	a2,a5,-1
	lw	a5,68(sp)
	addi	a3, zero, 1
	bne	a5,a3,.L361
	sw	a2,12(sp)
	sw	a2,84(sp)
	addi	s10,sp,208
	sw	a5,52(sp)
	jal	zero, .L554
.L575:
	lw	a5,16(sp)
	sw	a3,52(sp)
	sw	a2,60(sp)
	add	a5,a5,a4
	addi	s10,sp,208
	sw	a5,84(sp)
	sub	a3, zero, a4
	sw	a6,88(sp)
	sw	a6,96(sp)
	sw	a6,24(sp)
	sw	a4,12(sp)
	addi	s1, zero, 0
	jal	zero, .L472
.L329:
	.size	WikiSort.constprop.0, .-WikiSort.constprop.0
	.align	2
	.type	benchmark_body.constprop.0.isra.0, @function
benchmark_body.constprop.0.isra.0:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lw	t3,0(a5)
	lw	t1,4(a5)
	lw	a7,8(a5)
	lw	a6,12(a5)
	lw	a0,16(a5)
	lw	a1,20(a5)
	lw	a2,24(a5)
	lw	a3,28(a5)
	lw	a4,32(a5)
	addi	sp,sp,-80
	lui	a5,%hi(seed)
	sw	s2,64(sp)
	sw	s4,56(sp)
	sw	s5,52(sp)
	sw	ra,76(sp)
	sw	s0,72(sp)
	sw	s1,68(sp)
	sw	s3,60(sp)
	sw	t3,12(sp)
	sw	t1,16(sp)
	sw	a7,20(sp)
	sw	a6,24(sp)
	sw	a0,28(sp)
	sw	a1,32(sp)
	sw	a2,36(sp)
	sw	a3,40(sp)
	sw	a4,44(sp)
	sw	zero,%lo(seed)(a5)
	addi	s4,sp,12
	lui	s5,%hi(array1)
	addi	s2, zero, 400
.L585:
	lw	s3,0(s4)
	addi	s1,s5,%lo(array1)
	addi	s0, zero, 0
.L584:
	addi	a0, s0, 0
	addi	a1, zero, 400
	jalr	ra, s3, 0
	sw	a0,0(s1)
	sw	s0,4(s1)
	addi	s0,s0,1
	addi	s1,s1,8
	bne	s0,s2,.L584
.Lpcrel_13:
	auipc	ra, %pcrel_hi(WikiSort.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_13)
	addi	s4,s4,4
	addi	a5,sp,48
	bne	a5,s4,.L585
	lw	ra,76(sp)
	lw	s0,72(sp)
	lw	s1,68(sp)
	lw	s2,64(sp)
	lw	s3,60(sp)
	lw	s4,56(sp)
	lw	s5,52(sp)
	addi	sp,sp,80
	jalr	zero, ra, 0
	.size	benchmark_body.constprop.0.isra.0, .-benchmark_body.constprop.0.isra.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lw	t3,0(a5)
	lw	t1,4(a5)
	lw	a7,8(a5)
	lw	a6,12(a5)
	lw	a1,16(a5)
	lw	a2,20(a5)
	lw	a3,24(a5)
	lw	a4,28(a5)
	lw	a5,32(a5)
	addi	sp,sp,-96
	sw	ra,92(sp)
	sw	t3,12(sp)
	sw	t1,16(sp)
	sw	a7,20(sp)
	sw	a6,24(sp)
	sw	a1,28(sp)
	sw	a2,32(sp)
	sw	a3,36(sp)
	sw	a4,40(sp)
	sw	a5,44(sp)
	bge	zero, a0, .L593
	sw	s3,76(sp)
	sw	s5,68(sp)
	sw	s6,64(sp)
	sw	s7,60(sp)
	sw	s8,56(sp)
	sw	s0,88(sp)
	sw	s1,84(sp)
	sw	s2,80(sp)
	sw	s4,72(sp)
	addi	s6, a0, 0
	addi	s7, zero, 0
	lui	s8,%hi(seed)
	lui	s5,%hi(array1)
	addi	s3, zero, 400
.L594:
	sw	zero,%lo(seed)(s8)
	addi	s4,sp,12
.L595:
	lw	s2,0(s4)
	addi	s1,s5,%lo(array1)
	addi	s0, zero, 0
.L596:
	addi	a0, s0, 0
	addi	a1, zero, 400
	jalr	ra, s2, 0
	sw	a0,0(s1)
	sw	s0,4(s1)
	addi	s0,s0,1
	addi	s1,s1,8
	bne	s0,s3,.L596
.Lpcrel_14:
	auipc	ra, %pcrel_hi(WikiSort.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_14)
	addi	s4,s4,4
	addi	a5,sp,48
	bne	s4,a5,.L595
	addi	s7,s7,1
	bne	s7,s6,.L594
	lw	s0,88(sp)
	lw	s1,84(sp)
	lw	s2,80(sp)
	lw	s3,76(sp)
	lw	s4,72(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	lw	s7,60(sp)
	lw	s8,56(sp)
.L593:
	lw	ra,92(sp)
	addi	sp,sp,96
	jalr	zero, ra, 0
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
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
	.globl	Min
	.type	Min, @function
Min:
	bge	a1, a0, .L607
	addi	a0, a1, 0
.L607:
	jalr	zero, ra, 0
	.size	Min, .-Min
	.align	2
	.globl	Max
	.type	Max, @function
Max:
	bge	a0,a1,.L609
	addi	a0, a1, 0
.L609:
	jalr	zero, ra, 0
	.size	Max, .-Max
	.align	2
	.globl	Range_length
	.type	Range_length, @function
Range_length:
	addi	sp,sp,-16
	sub	a0,a1,a0
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	Range_length, .-Range_length
	.align	2
	.globl	MakeRange
	.type	MakeRange, @function
MakeRange:
	addi	sp,sp,-16
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	MakeRange, .-MakeRange
	.align	2
	.globl	FloorPowerOfTwo
	.type	FloorPowerOfTwo, @function
FloorPowerOfTwo:
	srai	a5,a0,1
	or	a0,a5,a0
	srai	a5,a0,2
	or	a5,a5,a0
	srai	a0,a5,4
	or	a0,a0,a5
	srai	a4,a0,8
	or	a4,a4,a0
	srai	a5,a4,16
	or	a5,a5,a4
	srai	a0,a5,1
	sub	a0,a5,a0
	jalr	zero, ra, 0
	.size	FloorPowerOfTwo, .-FloorPowerOfTwo
	.align	2
	.globl	BinaryFirst
	.type	BinaryFirst, @function
BinaryFirst:
	addi	sp,sp,-64
	sw	s1,52(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	sw	ra,60(sp)
	sw	a2,8(sp)
	sw	a3,12(sp)
	addi	s6,a3,-1
	addi	s1, a2, 0
	addi	s4, a0, 0
	addi	s7, a1, 0
	addi	s5, a4, 0
	bge	a2,s6,.L616
	sw	s3,44(sp)
	slli	s3,a1,3
	sw	s2,48(sp)
	sw	s0,56(sp)
	add	s3,a0,s3
	addi	s2, s6, 0
.L618:
	sub	s0,s2,s1
	srai	s0,s0,1
	add	s0,s0,s1
	slli	a5,s0,3
	add	a5,s4,a5
	lw	a0,0(a5)
	lw	a1,4(a5)
	lw	a2,0(s3)
	lw	a3,4(s3)
	jalr	ra, s5, 0
	beq	a0,zero,.L620
	addi	s1,s0,1
	blt	s1,s2,.L618
.L623:
	lw	s0,56(sp)
	lw	s2,48(sp)
	lw	s3,44(sp)
.L616:
	bne	s6,s1,.L615
	slli	a5,s1,3
	slli	s7,s7,3
	add	s7,s4,s7
	add	s4,s4,a5
	lw	a2,0(s7)
	lw	a3,4(s7)
	lw	a0,0(s4)
	lw	a1,4(s4)
	jalr	ra, s5, 0
	add	s1,s1,a0
.L615:
	lw	ra,60(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	lw	s6,32(sp)
	lw	s7,28(sp)
	addi	a0, s1, 0
	lw	s1,52(sp)
	addi	sp,sp,64
	jalr	zero, ra, 0
.L620:
	addi	s2, s0, 0
	blt	s1,s2,.L618
	jal	zero, .L623
	.size	BinaryFirst, .-BinaryFirst
	.align	2
	.globl	BinaryLast
	.type	BinaryLast, @function
BinaryLast:
	addi	sp,sp,-64
	sw	s1,52(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	sw	ra,60(sp)
	sw	a2,8(sp)
	sw	a3,12(sp)
	addi	s6,a3,-1
	addi	s1, a2, 0
	addi	s4, a0, 0
	addi	s7, a1, 0
	addi	s5, a4, 0
	bge	a2,s6,.L625
	sw	s3,44(sp)
	slli	s3,a1,3
	sw	s2,48(sp)
	sw	s0,56(sp)
	add	s3,a0,s3
	addi	s2, s6, 0
.L627:
	sub	s0,s2,s1
	srai	s0,s0,1
	add	s0,s0,s1
	slli	a5,s0,3
	add	a5,s4,a5
	lw	a2,0(a5)
	lw	a3,4(a5)
	lw	a0,0(s3)
	lw	a1,4(s3)
	jalr	ra, s5, 0
	bne	a0,zero,.L631
	addi	s1,s0,1
	blt	s1, s2, .L627
.L634:
	lw	s0,56(sp)
	lw	s2,48(sp)
	lw	s3,44(sp)
.L625:
	bne	s6,s1,.L624
	slli	a5,s1,3
	slli	s7,s7,3
	add	s7,s4,s7
	add	s4,s4,a5
	lw	a0,0(s7)
	lw	a1,4(s7)
	lw	a2,0(s4)
	lw	a3,4(s4)
	jalr	ra, s5, 0
	sltiu	a0, a0, 1
	add	s1,s1,a0
.L624:
	lw	ra,60(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	lw	s6,32(sp)
	lw	s7,28(sp)
	addi	a0, s1, 0
	lw	s1,52(sp)
	addi	sp,sp,64
	jalr	zero, ra, 0
.L631:
	addi	s2, s0, 0
	blt	s1, s2, .L627
	jal	zero, .L634
	.size	BinaryLast, .-BinaryLast
	.align	2
	.globl	InsertionSort
	.type	InsertionSort, @function
InsertionSort:
	addi	sp,sp,-80
	sw	s6,48(sp)
	addi	s6,a1,1
	sw	s4,56(sp)
	sw	ra,76(sp)
	slli	s4,s6,3
	sw	a1,8(sp)
	sw	a2,12(sp)
	add	s4,a0,s4
	bge	s6, a2, .L635
	sw	s3,60(sp)
	sw	s5,52(sp)
	sw	s7,44(sp)
	sw	s8,40(sp)
	sw	s0,72(sp)
	sw	s1,68(sp)
	sw	s2,64(sp)
	addi	s3, a1, 0
	addi	s8, a0, 0
	addi	s7, a2, 0
	addi	s5, a3, 0
.L639:
	lw	a4,0(s4)
	lw	a5,4(s4)
	addi	s1, s4, 0
	sw	a4,24(sp)
	sw	a5,28(sp)
	addi	s2, s6, 0
	jal	zero, .L638
.L649:
	lw	a4,-8(s0)
	lw	a5,-4(s0)
	sw	a4,0(s0)
	sw	a5,4(s0)
	bge	s3,s2,.L648
.L638:
	addi	s0, s1, 0
	lw	a0,24(sp)
	lw	a1,28(sp)
	lw	a2,-8(s1)
	lw	a3,-4(s1)
	addi	s1,s1,-8
	addi	s2,s2,-1
	jalr	ra, s5, 0
	addi	a5, s0, 0
	bne	a0,zero,.L649
	lw	a3,24(sp)
	lw	a4,28(sp)
	addi	s6,s6,1
	sw	a3,0(a5)
	sw	a4,4(a5)
	addi	s4,s4,8
	blt	s6, s7, .L639
.L650:
	lw	s0,72(sp)
	lw	s1,68(sp)
	lw	s2,64(sp)
	lw	s3,60(sp)
	lw	s5,52(sp)
	lw	s7,44(sp)
	lw	s8,40(sp)
.L635:
	lw	ra,76(sp)
	lw	s4,56(sp)
	lw	s6,48(sp)
	addi	sp,sp,80
	jalr	zero, ra, 0
.L648:
	lw	a3,24(sp)
	lw	a4,28(sp)
	slli	s2,s2,3
	add	a5,s8,s2
	addi	s6,s6,1
	sw	a3,0(a5)
	sw	a4,4(a5)
	addi	s4,s4,8
	blt	s6, s7, .L639
	jal	zero, .L650
	.size	InsertionSort, .-InsertionSort
	.align	2
	.globl	Reverse
	.type	Reverse, @function
Reverse:
	addi	sp,sp,-16
	sw	a1,8(sp)
	sw	a2,12(sp)
	sub	a4,a2,a1
	addi	a5, zero, 1
	bge	a5, a4, .L651
	srli	a5,a4,31
	add	a5,a5,a4
	srai	a5,a5,1
	add	a1,a1,a5
	slli	a1,a1,3
	slli	a5,a5,3
	slli	a2,a2,3
	add	a1,a0,a1
	sub	a5,a0,a5
	addi	a4,a1,-8
	add	a5,a5,a2
	add	a0,a0,a2
.L653:
	lw	a1,0(a5)
	lw	a2,0(a4)
	lw	a3,4(a4)
	sw	a1,0(a4)
	lw	a1,4(a5)
	addi	a5,a5,8
	addi	a4,a4,-8
	sw	a1,12(a4)
	sw	a2,-8(a5)
	sw	a3,-4(a5)
	bne	a5,a0,.L653
.L651:
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	Reverse, .-Reverse
	.align	2
	.globl	BlockSwap
	.type	BlockSwap, @function
BlockSwap:
	bge	zero, a3, .L656
	add	a6,a3,a1
	slli	a6,a6,3
	slli	a1,a1,3
	slli	a2,a2,3
	add	a6,a0,a6
	add	a1,a0,a1
	add	a0,a0,a2
.L658:
	lw	a3,0(a0)
	lw	a4,0(a1)
	lw	a5,4(a1)
	sw	a3,0(a1)
	lw	a3,4(a0)
	addi	a1,a1,8
	addi	a0,a0,8
	sw	a3,-4(a1)
	sw	a4,-8(a0)
	sw	a5,-4(a0)
	bne	a1,a6,.L658
.L656:
	jalr	zero, ra, 0
	.size	BlockSwap, .-BlockSwap
	.align	2
	.globl	Rotate
	.type	Rotate, @function
Rotate:
	addi	sp,sp,-16
	sw	a2,8(sp)
	sw	a3,12(sp)
	beq	a3,a2,.L660
	add	t4,a1,a2
	blt	a1,zero,.L765
	sub	t5,a3,t4
	bge	t5,a1,.L766
.L664:
	bge	a5,t5,.L767
.L665:
	addi	a5, zero, 1
	bge	a5, a1, .L711
	srli	a5,a1,31
	add	a5,a5,a1
	srai	a5,a5,1
	add	a1,a2,a5
	slli	t3,t4,3
	slli	a1,a1,3
	slli	a5,a5,3
	addi	a4,a0,-8
	add	t3,a0,t3
	add	a1,a1,a4
	sub	a5,t3,a5
.L710:
	lw	t1,0(a5)
	lw	a7,0(a1)
	lw	a6,4(a1)
	sw	t1,0(a1)
	lw	t1,4(a5)
	addi	a5,a5,8
	addi	a1,a1,-8
	sw	t1,12(a1)
	sw	a7,-8(a5)
	sw	a6,-4(a5)
	bne	a5,t3,.L710
.L711:
	addi	a5, zero, 1
	bge	a5, t5, .L709
	srli	a5,t5,31
	add	a5,a5,t5
	srai	a5,a5,1
	add	a4,t4,a5
	slli	t1,a3,3
	slli	a4,a4,3
	slli	a5,a5,3
	addi	a1,a0,-8
	add	t1,a0,t1
	add	a4,a4,a1
	sub	a5,t1,a5
.L713:
	lw	a7,0(a5)
	lw	a6,0(a4)
	lw	a1,4(a4)
	sw	a7,0(a4)
	lw	a7,4(a5)
	addi	a5,a5,8
	addi	a4,a4,-8
	sw	a7,12(a4)
	sw	a6,-8(a5)
	sw	a1,-4(a5)
	bne	a5,t1,.L713
.L709:
	sub	a4,a3,a2
	addi	a5, zero, 1
	bge	a5, a4, .L660
	srli	a5,a4,31
	add	a5,a5,a4
	srai	a5,a5,1
	add	a4,a2,a5
	slli	a3,a3,3
	add	a3,a0,a3
	slli	a4,a4,3
	addi	a0,a0,-8
	slli	a5,a5,3
	add	a4,a4,a0
	sub	a5,a3,a5
.L714:
	lw	a0,0(a5)
	lw	a1,0(a4)
	lw	a2,4(a4)
	sw	a0,0(a4)
	lw	a0,4(a5)
	addi	a5,a5,8
	addi	a4,a4,-8
	sw	a0,12(a4)
	sw	a1,-8(a5)
	sw	a2,-4(a5)
	bne	a5,a3,.L714
.L660:
	addi	sp,sp,16
	jalr	zero, ra, 0
.L766:
	blt	a5,a1,.L665
	slli	a1,a1,3
	slli	a7,a2,3
	beq	a1,zero,.L768
	addi	a6,a7,1
	add	a6,a0,a6
	sub	a6,a4,a6
	sltiu	a6,a6,3
	add	a7,a0,a7
	addi	a5, a4, 0
	bne	a6,zero,.L669
	or	a6,a4,a7
	andi	a6,a6,3
	bne	a6,zero,.L669
	addi	a6, a7, 0
	add	t3,a4,a1
.L670:
	lw	t1,0(a6)
	addi	a5,a5,4
	addi	a6,a6,4
	sw	t1,-4(a5)
	bne	a5,t3,.L670
.L671:
	slli	a5,t4,3
	add	a5,a0,a5
	slli	a6,t5,3
	bgeu	a7, a5, .L769
	beq	a6,zero,.L679
	or	t1,a5,a7
	andi	t1,t1,3
	bne	t1,zero,.L677
	add	a6,a7,a6
.L678:
	lw	t1,0(a5)
	addi	a7,a7,4
	addi	a5,a5,4
	sw	t1,-4(a7)
	bne	a7,a6,.L678
.L679:
	beq	a1,zero,.L660
	add	a5,a3,a2
	sub	a5,a5,t4
	slli	a5,a5,3
	add	a5,a0,a5
	sub	a6,a5,a4
	addi	a6,a6,-1
	sltiu	a6,a6,3
	addi	a3, a4, 0
	bne	a6,zero,.L683
	or	a6,a4,a5
	andi	a6,a6,3
	bne	a6,zero,.L683
	add	a1,a1,a5
.L684:
	lw	a4,0(a3)
	addi	a5,a5,4
	addi	a3,a3,4
	sw	a4,-4(a5)
	bne	a1,a5,.L684
	jal	zero, .L660
.L765:
	add	t4,a3,a1
	sub	a1,t4,a2
	sub	t5,a3,t4
	blt	t5,a1,.L664
	jal	zero, .L766
.L767:
	slli	t5,t5,3
	beq	t5,zero,.L692
	slli	t4,t4,3
	addi	a7,t4,1
	add	a7,a0,a7
	sub	a7,a4,a7
	sltiu	a7,a7,3
	add	a5,a0,t4
	addi	a6, a4, 0
	bne	a7,zero,.L690
	or	a7,a4,a5
	andi	a7,a7,3
	bne	a7,zero,.L690
	add	t1,a5,t5
.L691:
	lw	a7,0(a5)
	addi	a5,a5,4
	addi	a6,a6,4
	sw	a7,-4(a6)
	bne	a5,t1,.L691
.L692:
	sub	a5,a3,a1
	slli	a5,a5,3
	slli	a2,a2,3
	add	a5,a0,a5
	add	a2,a0,a2
	slli	a1,a1,3
	bgeu	a5,a2,.L770
	beq	a1,zero,.L699
	or	a3,a5,a2
	andi	a3,a3,3
	add	a1,a1,a2
	bne	a3,zero,.L697
	addi	a3, a2, 0
.L698:
	lw	a0,0(a3)
	addi	a3,a3,4
	addi	a5,a5,4
	sw	a0,-4(a5)
	bne	a3,a1,.L698
.L699:
	beq	t5,zero,.L660
	or	a1,a4,a2
	andi	a1,a1,3
	addi	a3, a2, 0
	addi	a5, a4, 0
	bne	a1,zero,.L703
	sub	a1,a2,a4
	addi	a1,a1,-1
	sltiu	a1,a1,3
	bne	a1,zero,.L703
	add	t5,a4,t5
.L704:
	lw	a4,0(a5)
	addi	a5,a5,4
	addi	a3,a3,4
	sw	a4,-4(a3)
	bne	a5,t5,.L704
	jal	zero, .L660
.L770:
	bgeu	a2, a5, .L699
	beq	a1,zero,.L699
.L702:
	addi	a1,a1,-1
	add	a3,a2,a1
	lbu	a0,0(a3)
	add	a3,a5,a1
	sb	a0,0(a3)
	bne	a1,zero,.L702
	jal	zero, .L699
.L769:
	bgeu	a5,a7,.L679
	beq	a6,zero,.L679
.L682:
	addi	a6,a6,-1
	add	t1,a5,a6
	lbu	t3,0(t1)
	add	t1,a7,a6
	sb	t3,0(t1)
	bne	a6,zero,.L682
	jal	zero, .L679
.L703:
	add	a4,a4,t5
.L705:
	lbu	a3,0(a5)
	addi	a5,a5,1
	addi	a2,a2,1
	sb	a3,-1(a2)
	bne	a5,a4,.L705
	jal	zero, .L660
.L690:
	add	t1,a4,t5
.L693:
	lbu	a7,0(a5)
	addi	a6,a6,1
	addi	a5,a5,1
	sb	a7,-1(a6)
	bne	a6,t1,.L693
	jal	zero, .L692
.L683:
	add	a5,a2,t5
	slli	a5,a5,3
	add	a5,a0,a5
	add	a1,a4,a1
.L685:
	lbu	a4,0(a3)
	addi	a3,a3,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a3,.L685
	jal	zero, .L660
.L669:
	addi	a6, a7, 0
	add	t3,a4,a1
.L672:
	lbu	t1,0(a6)
	addi	a5,a5,1
	addi	a6,a6,1
	sb	t1,-1(a5)
	bne	a5,t3,.L672
	jal	zero, .L671
.L768:
	add	a7,a0,a7
	jal	zero, .L671
.L697:
	addi	a3, a2, 0
.L700:
	lbu	a0,0(a3)
	addi	a3,a3,1
	addi	a5,a5,1
	sb	a0,-1(a5)
	bne	a3,a1,.L700
	jal	zero, .L699
.L677:
	add	a6,a5,a6
.L680:
	lbu	t1,0(a5)
	addi	a5,a5,1
	addi	a7,a7,1
	sb	t1,-1(a7)
	bne	a5,a6,.L680
	jal	zero, .L679
	.size	Rotate, .-Rotate
	.align	2
	.globl	WikiMerge
	.type	WikiMerge, @function
WikiMerge:
	addi	sp,sp,-112
	sw	a2,44(sp)
	sw	a3,32(sp)
	addi	a2, a3, 0
	sw	a3,20(sp)
	lw	a3,116(sp)
	sw	s5,84(sp)
	sw	s9,68(sp)
	sub	s5,a4,a2
	sub	s9,a6,a5
	sw	s0,104(sp)
	sw	s1,100(sp)
	sw	s6,80(sp)
	sw	a4,36(sp)
	sw	a5,16(sp)
	sw	a5,24(sp)
	slt	a4, zero, s9
	slt	a5, zero, s5
	sw	ra,108(sp)
	sw	s3,92(sp)
	sw	a6,28(sp)
	sw	a1,40(sp)
	lw	s1,112(sp)
	addi	s0, a0, 0
	addi	s6, a7, 0
	and	a5,a5,a4
	blt	a3,s5,.L772
	slli	s3,a2,3
	slli	s5,s5,3
	add	s3,a0,s3
	add	s5,s1,s5
	bne	a5,zero,.L809
.L773:
	sub	a1,s5,s1
	beq	s5,s1,.L771
	addi	a5,a1,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L779
	addi	a3,s3,-1
	sub	a3,a3,s1
	sltiu	a3,a3,3
	addi	a5, s3, 0
	addi	a4, s1, 0
	bne	a3,zero,.L779
	or	a3,s3,s1
	andi	a3,a3,3
	bne	a3,zero,.L779
	andi	a0,a1,-4
	add	a2,a0,s3
.L780:
	lw	a3,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a5)
	bne	a2,a5,.L780
	beq	a1,a0,.L771
	add	a5,s1,a0
	lbu	a4,0(a5)
	addi	a5,a0,1
	sb	a4,0(a2)
	bgeu	a5, a1, .L771
	add	a4,s1,a5
	lbu	a4,0(a4)
	add	a5,s3,a5
	addi	a0,a0,2
	sb	a4,0(a5)
	bgeu	a0, a1, .L771
	add	s1,s1,a0
	lbu	a5,0(s1)
	add	a0,s3,a0
	sb	a5,0(a0)
.L771:
	lw	ra,108(sp)
	lw	s0,104(sp)
	lw	s1,100(sp)
	lw	s3,92(sp)
	lw	s5,84(sp)
	lw	s6,80(sp)
	lw	s9,68(sp)
	addi	sp,sp,112
	jalr	zero, ra, 0
.L772:
	sw	a1,12(sp)
	bne	a5,zero,.L810
.L785:
	bge	zero, s5, .L771
	lw	a5,12(sp)
	add	s5,s5,a5
	slli	a1,a5,3
	lw	a5,20(sp)
	slli	s5,s5,3
	add	s5,s0,s5
	slli	s3,a5,3
	add	a1,s0,a1
	add	a3,s0,s3
.L789:
	lw	a2,0(a3)
	lw	a4,0(a1)
	lw	a5,4(a1)
	sw	a2,0(a1)
	lw	a2,4(a3)
	addi	a1,a1,8
	addi	a3,a3,8
	sw	a2,-4(a1)
	sw	a4,-8(a3)
	sw	a5,-4(a3)
	bne	a1,s5,.L789
	jal	zero, .L771
.L809:
	lw	a5,16(sp)
	sw	s4,88(sp)
	slli	a6,a6,3
	slli	s4,a5,3
	add	s4,a0,s4
	add	s0,a0,a6
.L774:
	lw	a2,0(s1)
	lw	a3,4(s1)
	lw	a0,0(s4)
	lw	a1,4(s4)
	addi	s3,s3,8
	jalr	ra, s6, 0
	bne	a0,zero,.L775
	lw	a5,0(s1)
	addi	s1,s1,8
	sw	a5,-8(s3)
	lw	a5,-4(s1)
	sw	a5,-4(s3)
	bne	s5,s1,.L774
	lw	s4,88(sp)
	jal	zero, .L771
.L810:
	sw	s8,72(sp)
	lw	s8,16(sp)
	sw	s11,60(sp)
	slli	s11,a2,3
	sw	s4,88(sp)
	sw	s7,76(sp)
	sw	s2,96(sp)
	sw	s10,64(sp)
	add	s11,a0,s11
	addi	s3, zero, 0
	addi	s4, zero, 0
	addi	s1, zero, 0
	addi	s7, a1, 0
.L786:
	slli	s2,s8,3
	slli	s10,s7,3
	add	s2,s0,s2
	add	s10,s0,s10
	lw	a2,0(s10)
	lw	a3,4(s10)
	lw	a0,0(s2)
	lw	a1,4(s2)
	addi	s3,s3,1
	jalr	ra, s6, 0
	lw	a2,0(s11)
	lw	a3,4(s11)
	bne	a0,zero,.L787
	lw	a1,0(s10)
	lw	a5,12(sp)
	addi	s1,s1,1
	sw	a1,0(s11)
	lw	a1,4(s10)
	add	s7,a5,s1
	sw	a1,4(s11)
	sw	a2,0(s10)
	sw	a3,4(s10)
	bge	s1,s5,.L808
.L788:
	addi	s11,s11,8
	jal	zero, .L786
.L808:
	lw	s2,96(sp)
	lw	s4,88(sp)
	lw	s7,76(sp)
	lw	s8,72(sp)
	lw	s10,64(sp)
	lw	s11,60(sp)
	jal	zero, .L771
.L775:
	lw	a5,0(s4)
	addi	s4,s4,8
	sw	a5,-8(s3)
	lw	a5,-4(s4)
	sw	a5,-4(s3)
	bne	s0,s4,.L774
	lw	s4,88(sp)
	jal	zero, .L773
.L787:
	lw	a1,0(s2)
	lw	a5,16(sp)
	addi	s4,s4,1
	sw	a1,0(s11)
	lw	a1,4(s2)
	add	s8,s4,a5
	sw	a1,4(s11)
	sw	a2,0(s2)
	sw	a3,4(s2)
	blt	s4,s9,.L788
	lw	a5,20(sp)
	sw	s7,12(sp)
	lw	s2,96(sp)
	add	a5,a5,s3
	lw	s4,88(sp)
	lw	s7,76(sp)
	lw	s8,72(sp)
	lw	s10,64(sp)
	lw	s11,60(sp)
	sw	a5,20(sp)
	sub	s5,s5,s1
	jal	zero, .L785
.L779:
	add	a1,s1,a1
.L783:
	lbu	a5,0(s1)
	addi	s1,s1,1
	addi	s3,s3,1
	sb	a5,-1(s3)
	bne	s1,a1,.L783
	jal	zero, .L771
	.size	WikiMerge, .-WikiMerge
	.align	2
	.globl	WikiSort
	.type	WikiSort, @function
WikiSort:
	addi	sp,sp,-304
	sw	s9,260(sp)
	sw	ra,300(sp)
	sw	s0,296(sp)
	sw	s1,292(sp)
	sw	s2,288(sp)
	sw	s3,284(sp)
	sw	s4,280(sp)
	sw	s5,276(sp)
	sw	s6,272(sp)
	sw	s7,268(sp)
	sw	s8,264(sp)
	sw	s10,256(sp)
	sw	s11,252(sp)
	addi	a5, zero, 32
	addi	sp,sp,-2048
	addi	sp,sp,-2048
	addi	t1, a1, 0
	addi	s9, a2, 0
	bge	a5, a1, .L1127
	srai	a5,a1,1
	or	a5,a5,a1
	srai	a4,a5,2
	or	a4,a4,a5
	srai	a5,a4,4
	or	a5,a5,a4
	srai	a4,a5,8
	or	a4,a4,a5
	srai	a5,a4,16
	or	a5,a5,a4
	srai	a4,a5,1
	sub	s3,a5,a4
	srai	a5,s3,4
	sw	a5,24(sp)
	rem	a5,a1,a5
	addi	s1, zero, 0
	addi	a1, zero, 0
	addi	s8, a0, 0
	addi	s10,sp,240
	addi	s6, t1, 0
	sw	a5,32(sp)
	srai	a5,s3,4
	div	t0,t1,a5
	lw	s4,32(sp)
	addi	s2, a5, 0
	add	s1,s1,s4
	addi	s5, t0, 0
	add	s0,s5,a1
	blt	s1, s2, .L814
.L1128:
	addi	s0,s0,1
	addi	a2, s0, 0
	addi	a3, s9, 0
	addi	a0, s8, 0
	sw	a1,-72(s10)
	sw	s0,-68(s10)
.Lpcrel_15:
	auipc	ra, %pcrel_hi(InsertionSort)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_15)
	bge	s0, s6, .L815
	sub	s1,s1,s2
.L816:
	addi	a1, s0, 0
	add	s1,s1,s4
	add	s0,s5,a1
	bge	s1, s2, .L1128
.L814:
	addi	a3, s9, 0
	addi	a2, s0, 0
	addi	a0, s8, 0
	sw	a1,-72(s10)
	sw	s0,-68(s10)
.Lpcrel_16:
	auipc	ra, %pcrel_hi(InsertionSort)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_16)
	blt	s0, s6, .L816
.L815:
	lui	a5, 131072
	addi	a5,a5,-1
	addi	t1, s6, 0
	sw	a5,20(sp)
	addi	s6, zero, 16
	addi	t0, s5, 0
	bge	s6, s3, .L811
	addi	s11, s10, 0
	sw	t1,64(sp)
.L818:
	lui	a5, 262144
	bge	t0,a5,.L1009
.L820:
	srai	a5,a5,2
	blt	t0, a5, .L820
	beq	a5,zero,.L821
.L1009:
	addi	a3, t0, 0
	addi	s10, zero, 0
.L825:
	add	a4,s10,a5
	blt	a3, a4, .L822
.L1129:
	slli	a2,a5,1
	add	s10,a2,s10
	srai	a5,a5,2
	srai	s10,s10,1
	beq	a5,zero,.L823
	sub	a3,a3,a4
	add	a4,s10,a5
	bge	a3, a4, .L1129
.L822:
	srai	a5,a5,2
	srai	s10,s10,1
	bne	a5,zero,.L825
.L823:
	div	a1,t0,s10
	slli	a5,s10,3
	sw	a5,36(sp)
	addi	a5,s8,-8
	sw	a5,48(sp)
	sw	zero,84(sp)
	sw	zero,108(sp)
	sw	zero,16(sp)
	sw	zero,56(sp)
	addi	s2, zero, 0
	addi	s5, zero, 0
	sw	zero,28(sp)
	sw	zero,88(sp)
	sw	zero,104(sp)
	sw	t0,40(sp)
	sw	s6,96(sp)
	sw	zero,80(sp)
	sw	s3,100(sp)
	addi	a5,a1,1
	sw	a5,68(sp)
	addi	a5, s8, 0
	sw	a1,92(sp)
	addi	s8, s11, 0
	addi	s11, a5, 0
.L995:
	lw	a5,32(sp)
	add	s5,s5,a5
	lw	a5,40(sp)
	add	a5,s2,a5
	sw	a5,8(sp)
	lw	a5,24(sp)
	blt	s5, a5, .L826
	sub	s5,s5,a5
	lw	a5,8(sp)
	addi	a5,a5,1
	sw	a5,8(sp)
.L826:
	lw	a5,32(sp)
	lw	a4,40(sp)
	add	s5,s5,a5
	lw	a5,8(sp)
	add	s6,a5,a4
	lw	a5,24(sp)
	blt	s5, a5, .L827
	sub	s5,s5,a5
	addi	s6,s6,1
.L827:
	lw	a5,20(sp)
	slli	a4,s2,3
	add	s1,s11,a4
	add	s3,s6,a5
	slli	a5,s3,3
	sw	a5,0(sp)
	slli	a5,s2,3
	sw	a5,4(sp)
	lw	a5,0(sp)
	lw	a2,0(s1)
	lw	a3,4(s1)
	add	a5,s11,a5
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	ra, s9, 0
	lw	a5,56(sp)
	lw	a4,16(sp)
	sub	a5,a5,a4
	sw	a5,52(sp)
	lw	a5,8(sp)
	bne	a0,zero,.L1130
	slli	a5,a5,3
	add	a5,s11,a5
	lw	a2,-8(a5)
	lw	a3,-4(a5)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	ra, s9, 0
	beq	a0,zero,.L994
	lw	a5,8(sp)
	sub	s0,a5,s2
	addi	a5, zero, 512
	bge	a5, s0, .L1131
	lw	a5,52(sp)
	sw	s6,44(sp)
	bge	zero, a5, .L1132
	rem	a1,s0,s10
	lw	a5,8(sp)
	add	a6,a1,s2
	addi	a3,a6,1
	bge	a3, a5, .L1133
.L896:
	addi	t3, a5, 0
	lw	a5,16(sp)
	lw	t4,36(sp)
	slli	a2,a6,3
	slli	a5,a5,3
	add	a5,s11,a5
	add	a4,s11,a2
.L900:
	lw	t1,8(a4)
	lw	a7,0(a5)
	lw	a0,4(a5)
	sw	t1,0(a5)
	lw	t1,12(a4)
	add	a3,a3,s10
	addi	a5,a5,8
	sw	t1,-4(a5)
	sw	a7,8(a4)
	sw	a0,12(a4)
	add	a4,a4,t4
	blt	a3, t3, .L900
.L901:
	lw	a5,44(sp)
	lw	a4,8(sp)
	sub	s1,a5,a4
	bge	s10, s1, .L897
	addi	s1, s10, 0
.L897:
	lw	a5,8(sp)
	add	a0,s11,a2
	lw	a4,0(a0)
	add	s1,s1,a5
	lw	a5,4(a0)
	sw	a4,-96(s8)
	sw	a5,-92(s8)
	addi	a5, zero, 512
	blt	a5, a1, .L1134
	slli	a3,a1,3
	beq	a3,zero,.L1126
	lw	a5,4(sp)
	andi	a4,s11,3
	add	a5,s11,a5
	bne	a4,zero,.L904
	add	a3,a5,a3
	addi	a4, s8, 0
.L905:
	lw	a2,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a2,-4(a4)
	bne	a5,a3,.L905
.L1126:
	lw	a5,28(sp)
	slli	a3,a5,3
.L906:
	add	a5,s11,a3
	sw	a5,60(sp)
	lw	a5,8(sp)
	addi	s0, zero, 0
	addi	s7, s0, 0
	sw	a5,0(sp)
	addi	s0, a5, 0
	addi	a5, s8, 0
	sw	s5,72(sp)
	sw	s6,76(sp)
	addi	s8, s2, 0
	sw	a6,4(sp)
	addi	s4, zero, 0
	addi	s3, zero, 0
	addi	s5, a6, 0
	addi	s6, a6, 0
	addi	s2, a5, 0
.L903:
	bge	s3, s4, .L913
.L910:
	lw	a5,20(sp)
	lw	a2,-96(s2)
	lw	a3,-92(s2)
	add	a5,s4,a5
	slli	a5,a5,3
	add	a5,s11,a5
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	ra, s9, 0
	bne	a0,zero,.L913
.L911:
	addi	a2, s3, 0
	addi	a4, s9, 0
	addi	a3, s4, 0
	addi	a1, s5, 0
	addi	a0, s11, 0
	sw	s3,-104(s2)
	sw	s4,-100(s2)
.Lpcrel_17:
	auipc	ra, %pcrel_hi(BinaryFirst)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_17)
	addi	s3, a0, 0
	sub	t5,s4,a0
	add	t4,s10,s6
	bge	zero, s10, .L918
	slli	a4,s5,3
	slli	a0,t4,3
	slli	a5,s6,3
	add	a4,s11,a4
	add	a0,s11,a0
	add	a5,s11,a5
.L917:
	lw	a1,0(a4)
	lw	a2,0(a5)
	lw	a3,4(a5)
	sw	a1,0(a5)
	lw	a1,4(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	sw	a1,-4(a5)
	sw	a2,-8(a4)
	sw	a3,-4(a4)
	bne	a0,a5,.L917
.L918:
	lw	a5,16(sp)
	slli	a4,s6,3
	add	a4,s11,a4
	add	a5,s7,a5
	slli	a5,a5,3
	add	a5,s11,a5
	lw	a3,0(a5)
	lw	a2,8(a4)
	addi	a7, s2, 0
	sw	a3,8(a4)
	lw	a1,4(a5)
	lw	a3,12(a4)
	addi	a6, s9, 0
	sw	a1,12(a4)
	lw	a4,4(sp)
	lw	a1,28(sp)
	sw	a2,0(a5)
	sw	a3,4(a5)
	addi	a2, s8, 0
	addi	a5, s3, 0
	addi	a3, a4, 0
	addi	a0, s11, 0
	sw	t4,12(sp)
	sw	t5,8(sp)
	sw	s8,-112(s2)
	sw	a4,-32(s2)
	sw	s3,-28(s2)
	sw	a4,-108(s2)
.Lpcrel_18:
	auipc	ra, %pcrel_hi(WikiMerge.constprop.1.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_18)
	addi	a5, zero, 512
	lw	t5,8(sp)
	lw	t4,12(sp)
	blt	a5, s10, .L1135
	lw	a5,36(sp)
	beq	a5,zero,.L924
	slli	a5,s6,3
	andi	a4,s11,3
	add	a5,s11,a5
	bne	a4,zero,.L922
	lw	a4,36(sp)
	add	a2,a5,a4
	addi	a4, s2, 0
.L923:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a2,a5,.L923
.L924:
	bge	zero, t5, .L921
	sub	a4,t4,t5
	slli	a5,s3,3
	slli	s4,s4,3
	slli	a4,a4,3
	add	a5,s11,a5
	add	s4,s11,s4
	add	a4,s11,a4
.L930:
	lw	a1,0(a4)
	lw	a2,0(a5)
	lw	a3,4(a5)
	sw	a1,0(a5)
	lw	a1,4(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	sw	a1,-4(a5)
	sw	a2,-8(a4)
	sw	a3,-4(a4)
	bne	a5,s4,.L930
.L921:
	sub	s8,s6,t5
	add	a5,s8,s10
	sw	a5,4(sp)
	beq	t4,s0,.L1136
	addi	s5,t4,1
	add	a5,s8,s10
	add	s3,s5,s10
	addi	s7,s7,1
	add	s4,a5,t5
	bge	s3, s0, .L1021
	addi	s6, t4, 0
.L933:
	slli	a4,s5,3
	slli	a5,s3,3
	add	a4,s11,a4
	add	a5,s11,a5
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	ra, s9, 0
	beq	a0,zero,.L932
	addi	s5, s3, 0
.L932:
	add	s3,s3,s10
	blt	s3, s0, .L933
	addi	t4, s6, 0
	addi	s5,s5,-1
.L931:
	slli	a5,s5,3
	add	a5,s11,a5
	lw	a4,0(a5)
	lw	a5,4(a5)
	lw	s3,4(sp)
	sw	a4,-96(s2)
	sw	a5,-92(s2)
	addi	s6, t4, 0
	blt	s3, s4, .L910
.L913:
	lw	a5,0(sp)
	beq	s1,a5,.L911
	sub	a4,s1,a5
	bge	a4,s10,.L1137
	add	s4,s6,a4
	beq	s1,s6,.L952
	sub	a2,a5,s1
	blt	a2,zero,.L939
	add	a3,a2,s6
	sub	a1,s1,a3
	blt	a1, a2, .L941
.L940:
	addi	a5, zero, 1
	bge	a5, a2, .L987
	srli	a5,a2,31
	add	a5,a5,a2
	srai	a5,a5,1
	lw	a0,48(sp)
	add	a2,s6,a5
	slli	t6,a3,3
	slli	a2,a2,3
	slli	a5,a5,3
	add	t6,s11,t6
	add	a2,a2,a0
	sub	a5,t6,a5
.L986:
	lw	a7,0(a5)
	lw	a6,0(a2)
	lw	a0,4(a2)
	sw	a7,0(a2)
	lw	a7,4(a5)
	addi	a5,a5,8
	addi	a2,a2,-8
	sw	a7,12(a2)
	sw	a6,-8(a5)
	sw	a0,-4(a5)
	bne	t6,a5,.L986
.L987:
	addi	a5, zero, 1
	bge	a5, a1, .L985
	srli	a5,a1,31
	add	a5,a5,a1
	srai	a5,a5,1
	lw	a2,48(sp)
	add	a3,a3,a5
	slli	t4,s1,3
	slli	a3,a3,3
	slli	a5,a5,3
	add	t4,s11,t4
	add	a3,a3,a2
	sub	a5,t4,a5
.L989:
	lw	a0,0(a5)
	lw	a1,0(a3)
	lw	a2,4(a3)
	sw	a0,0(a3)
	lw	a0,4(a5)
	addi	a5,a5,8
	addi	a3,a3,-8
	sw	a0,12(a3)
	sw	a1,-8(a5)
	sw	a2,-4(a5)
	bne	t4,a5,.L989
.L985:
	sub	a3,s1,s6
	addi	a5, zero, 1
	bge	a5, a3, .L952
	srli	a5,a3,31
	add	a5,a5,a3
	srai	a5,a5,1
	lw	a2,48(sp)
	add	a3,s6,a5
	slli	t1,s1,3
	add	t1,s11,t1
	slli	a3,a3,3
	slli	a5,a5,3
	add	a3,a3,a2
	sub	a5,t1,a5
.L990:
	lw	a0,0(a5)
	lw	a1,0(a3)
	lw	a2,4(a3)
	sw	a0,0(a3)
	lw	a0,4(a5)
	addi	a5,a5,8
	addi	a3,a3,-8
	sw	a0,12(a3)
	sw	a1,-8(a5)
	sw	a2,-4(a5)
	bne	t1,a5,.L990
.L952:
	addi	s3, s6, 0
	lw	s1,0(sp)
	add	s0,s0,a4
	add	s5,s5,a4
	addi	s6, s4, 0
	jal	zero, .L903
.L1024:
	addi	a3, a5, 0
	addi	a1, a4, 0
.L941:
	blt	zero, a1, .L940
	slli	a1,a1,3
	beq	a1,zero,.L968
	slli	a5,a3,3
	andi	a3,s11,3
	add	a5,s11,a5
	bne	a3,zero,.L966
	add	t4,a5,a1
	addi	a3, s2, 0
.L967:
	lw	a0,0(a5)
	addi	a5,a5,4
	addi	a3,a3,4
	sw	a0,-4(a3)
	bne	t4,a5,.L967
.L968:
	sub	a3,s1,a2
	slli	a3,a3,3
	slli	a5,s6,3
	add	a3,s11,a3
	add	a5,s11,a5
	slli	a2,a2,3
	bgeu	a3,a5,.L1138
	beq	a2,zero,.L975
	or	a0,a3,a5
	andi	a0,a0,3
	bne	a0,zero,.L973
	add	a2,a3,a2
	addi	a0, a5, 0
.L974:
	lw	a6,0(a0)
	addi	a3,a3,4
	addi	a0,a0,4
	sw	a6,-4(a3)
	bne	a3,a2,.L974
.L975:
	beq	a1,zero,.L952
	andi	a3,a5,3
	bne	a3,zero,.L979
	add	a1,a5,a1
	addi	a3, s2, 0
.L980:
	lw	a2,0(a3)
	addi	a5,a5,4
	addi	a3,a3,4
	sw	a2,-4(a5)
	bne	a5,a1,.L980
	addi	s3, s6, 0
	lw	s1,0(sp)
	add	s0,s0,a4
	add	s5,s5,a4
	addi	s6, s4, 0
	jal	zero, .L903
.L1135:
	lw	a4,60(sp)
	slli	a5,s6,3
	slli	a0,t4,3
	add	a5,s11,a5
	add	a0,s11,a0
.L927:
	lw	a1,0(a4)
	lw	a2,0(a5)
	lw	a3,4(a5)
	sw	a1,0(a5)
	lw	a1,4(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	sw	a1,-4(a5)
	sw	a2,-8(a4)
	sw	a3,-4(a4)
	bne	a0,a5,.L927
	jal	zero, .L924
.L1130:
	sub	a1,a5,s2
	addi	a2, s2, 0
	addi	a4, s8, 0
	addi	a3, s6, 0
	addi	a0, s11, 0
	sw	s2,-64(s8)
	sw	s6,-60(s8)
.Lpcrel_19:
	auipc	ra, %pcrel_hi(Rotate.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_19)
.L994:
	lw	a5,64(sp)
	bge	s6,a5,.L1139
.L1026:
	addi	s2, s6, 0
	jal	zero, .L995
.L1137:
	bge	zero, s10, .L1140
	addi	a4, a5, 0
	add	t4,s10,s6
	slli	a0,t4,3
	slli	a5,s6,3
	slli	a4,a4,3
	add	a0,s11,a0
	add	a5,s11,a5
	add	a4,s11,a4
.L991:
	lw	a1,0(a4)
	lw	a2,0(a5)
	lw	a3,4(a5)
	sw	a1,0(a5)
	lw	a1,4(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	sw	a1,-4(a5)
	sw	a2,-8(a4)
	sw	a3,-4(a4)
	bne	a5,a0,.L991
.L992:
	addi	s4, t4, 0
	bne	s5,s6,.L937
	addi	s5, s0, 0
.L937:
	lw	a5,0(sp)
	add	s1,s1,s10
	add	s0,s0,s10
	add	a5,a5,s10
	sw	a5,0(sp)
	lw	a5,44(sp)
	bge	a5, s1, .L993
	addi	s1, a5, 0
.L993:
	addi	s3, s6, 0
	addi	s6, t4, 0
	jal	zero, .L903
.L939:
	sub	a2,a5,s6
	blt	a4,a2,.L1024
	blt	zero, a2, .L1025
	slli	a2,a2,3
	slli	a1,s6,3
	beq	a2,zero,.L1141
	andi	a5,s11,3
	add	a1,s11,a1
	bne	a5,zero,.L945
	addi	a3, s2, 0
	addi	a5, a1, 0
	add	t4,a1,a2
.L946:
	lw	a0,0(a5)
	addi	a5,a5,4
	addi	a3,a3,4
	sw	a0,-4(a3)
	bne	a5,t4,.L946
.L947:
	lw	a5,0(sp)
	slli	a3,a4,3
	slli	a5,a5,3
	add	a5,s11,a5
	bgeu	a1, a5, .L1142
	beq	a3,zero,.L955
	or	a0,a5,a1
	andi	a0,a0,3
	bne	a0,zero,.L953
	add	a3,a1,a3
.L954:
	lw	a0,0(a5)
	addi	a1,a1,4
	addi	a5,a5,4
	sw	a0,-4(a1)
	bne	a1,a3,.L954
.L955:
	beq	a2,zero,.L952
	lw	a3,0(sp)
	add	a5,s1,s6
	sub	a5,a5,a3
	slli	a5,a5,3
	andi	a3,s11,3
	add	a5,s11,a5
	bne	a3,zero,.L959
	add	a2,a5,a2
	addi	a3, s2, 0
.L960:
	lw	a1,0(a3)
	addi	a5,a5,4
	addi	a3,a3,4
	sw	a1,-4(a5)
	bne	a5,a2,.L960
	addi	s3, s6, 0
	lw	s1,0(sp)
	add	s0,s0,a4
	add	s5,s5,a4
	addi	s6, s4, 0
	jal	zero, .L903
.L1136:
	addi	a4, a5, 0
	addi	a5, s2, 0
	lw	a1,28(sp)
	addi	s2, s8, 0
	addi	s8, a5, 0
	lw	a5,44(sp)
	addi	a2, s2, 0
	addi	a7, s8, 0
	addi	a6, s9, 0
	addi	a3, a4, 0
	addi	a0, s11, 0
	sw	a5,-20(s8)
	lw	s5,72(sp)
	lw	s6,76(sp)
	sw	s2,-112(s8)
	sw	a4,-24(s8)
	sw	a4,-108(s8)
.Lpcrel_20:
	auipc	ra, %pcrel_hi(WikiMerge.constprop.1.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_20)
	lw	a5,64(sp)
	blt	s6,a5,.L1026
.L1139:
	addi	a5, s11, 0
	addi	s11, s8, 0
	addi	s8, a5, 0
	lw	a5,52(sp)
	lw	t0,40(sp)
	lw	s6,96(sp)
	lw	t2,80(sp)
	lw	s3,100(sp)
	blt	zero, a5, .L996
.L1001:
	lw	a5,32(sp)
	slli	t0,t0,1
	slli	a5,a5,1
	sw	a5,32(sp)
	lw	a4,32(sp)
	lw	a5,24(sp)
	blt	a4, a5, .L998
	addi	a5, a4, 0
	lw	a4,24(sp)
	addi	t0,t0,1
	sub	a5,a5,a4
	sw	a5,32(sp)
.L998:
	slli	s6,s6,1
	blt	s6,s3,.L818
.L811:
	lui	t0, 1
	add	sp,sp,t0
	lw	ra,300(sp)
	lw	s0,296(sp)
	lw	s1,292(sp)
	lw	s2,288(sp)
	lw	s3,284(sp)
	lw	s4,280(sp)
	lw	s5,276(sp)
	lw	s6,272(sp)
	lw	s7,268(sp)
	lw	s8,264(sp)
	lw	s9,260(sp)
	lw	s10,256(sp)
	lw	s11,252(sp)
	addi	sp,sp,304
	jalr	zero, ra, 0
.L1021:
	addi	s5, t4, 0
	jal	zero, .L931
.L922:
	lw	a3,36(sp)
	addi	a4, s2, 0
	add	a2,s2,a3
.L925:
	lbu	a3,0(a5)
	addi	a4,a4,1
	addi	a5,a5,1
	sb	a3,-1(a4)
	bne	a2,a4,.L925
	jal	zero, .L924
.L1134:
	lw	a4,28(sp)
	slli	a5,s2,3
	add	a5,s11,a5
	slli	a3,a4,3
	add	a4,s11,a3
.L909:
	lw	a7,0(a4)
	lw	a1,0(a5)
	lw	a2,4(a5)
	sw	a7,0(a5)
	lw	a7,4(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	sw	a7,-4(a5)
	sw	a1,-8(a4)
	sw	a2,-4(a4)
	bne	a0,a5,.L909
	jal	zero, .L906
.L1132:
	lw	a5,8(sp)
	addi	s7,s2,1
	bge	s7,a5,.L839
	sw	s2,12(sp)
	addi	s2, s7, 0
	addi	s7, s0, 0
	lw	s0,92(sp)
	addi	s3, zero, 1
	addi	s4, a5, 0
	sw	s5,44(sp)
.L844:
	addi	s5, s1, 0
	lw	a0,0(s5)
	lw	a1,4(s5)
	lw	a2,8(s1)
	lw	a3,12(s1)
	addi	s1,s1,8
	jalr	ra, s9, 0
	bne	a0,zero,.L843
	lw	a2,0(s5)
	lw	a3,4(s5)
	lw	a0,0(s1)
	lw	a1,4(s1)
	jalr	ra, s9, 0
	beq	a0,zero,.L842
.L843:
	addi	a3,s3,1
	beq	s0,s3,.L841
	addi	s3, a3, 0
.L842:
	addi	s2,s2,1
	bne	s2,s4,.L844
	lw	a5,68(sp)
	addi	a4, zero, 512
	addi	s0, s7, 0
	lw	s5,44(sp)
	addi	s7, s2, 0
	addi	a3, s3, 0
	lw	s2,12(sp)
	blt	a4, a5, .L1013
	bne	s3,a5,.L852
.L849:
	lw	a5,68(sp)
	lw	a1,68(sp)
	sw	s6,80(sp)
	add	a5,a5,s2
	sw	a5,56(sp)
	lw	a4,56(sp)
	lw	a5,8(sp)
	addi	s4, s6, 0
	sw	a4,84(sp)
	sub	s0,a5,a4
	slli	a5,a4,3
	sw	a5,4(sp)
	sw	s2,28(sp)
	sw	s2,88(sp)
	addi	a3, zero, 0
.L853:
	slli	s3,s7,3
	sw	s5,12(sp)
	sw	s0,16(sp)
	add	s5,s11,s3
	sw	s4,0(sp)
	addi	s0, zero, 0
	addi	s1, a1, 0
	sw	a3,44(sp)
	addi	s3, s7, 0
.L890:
	addi	s4,s5,-8
	beq	s3,s2,.L889
	lw	a1,4(s4)
	lw	a2,0(s5)
	lw	a3,4(s5)
	lw	a0,-8(s5)
	jalr	ra, s9, 0
	bne	a0,zero,.L889
	lw	a2,-8(s5)
	lw	a3,4(s4)
	lw	a0,0(s5)
	lw	a1,4(s5)
	jalr	ra, s9, 0
	beq	a0,zero,.L888
.L889:
	addi	a3,s7,1
	addi	a2,s3,1
	sub	a1, zero, s0
	addi	a4, s8, 0
	addi	a0, s11, 0
	sw	a3,-44(s8)
	sw	a2,-48(s8)
	add	s7,s3,s0
.Lpcrel_21:
	auipc	ra, %pcrel_hi(Rotate.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_21)
	addi	s0,s0,1
.L888:
	addi	s3,s3,-1
	addi	s5, s4, 0
	blt	s0,s1,.L890
	lw	a5,68(sp)
	lw	s4,0(sp)
	lw	s5,12(sp)
	lw	a3,44(sp)
	lw	s0,16(sp)
	sw	a5,52(sp)
	sw	s2,16(sp)
.L1010:
	addi	a5,s6,-1
	bge	zero, a3, .L895
.L860:
	slli	s3,s4,3
	sw	s2,0(sp)
	sw	s5,12(sp)
	sw	s0,44(sp)
	add	s5,s11,s3
	addi	s0, zero, 0
	addi	s2, s4, 0
	addi	s3, a3, 0
	addi	s7, a5, 0
.L894:
	addi	s1,s5,8
	beq	s2,s7,.L893
	lw	a3,4(s1)
	lw	a2,8(s5)
	lw	a0,0(s5)
	lw	a1,4(s5)
	jalr	ra, s9, 0
	bne	a0,zero,.L893
	lw	a2,0(s5)
	lw	a3,4(s5)
	lw	a0,8(s5)
	lw	a1,4(s1)
	jalr	ra, s9, 0
	beq	a0,zero,.L892
.L893:
	addi	a2, s4, 0
	addi	a1, s0, 0
	addi	a4, s8, 0
	addi	a3, s2, 0
	addi	a0, s11, 0
	sw	s4,-40(s8)
	sw	s2,-36(s8)
	sub	s4,s2,s0
.Lpcrel_22:
	auipc	ra, %pcrel_hi(Rotate.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_22)
	addi	s0,s0,1
.L892:
	addi	s2,s2,1
	addi	s5, s1, 0
	blt	s0,s3,.L894
	lw	s2,0(sp)
	lw	s5,12(sp)
	lw	s0,44(sp)
.L895:
	rem	a1,s0,s10
	lw	a5,80(sp)
	sw	s2,104(sp)
	lw	s2,84(sp)
	sw	a5,44(sp)
	lw	a5,8(sp)
	sw	s6,108(sp)
	add	a6,a1,s2
	addi	a3,a6,1
	blt	a3, a5, .L896
.L1133:
	slli	a2,a6,3
	jal	zero, .L901
.L1140:
	add	t4,s10,s6
	jal	zero, .L992
.L1138:
	bgeu	a5, a3, .L975
	beq	a2,zero,.L975
.L978:
	addi	a2,a2,-1
	add	a0,a5,a2
	lbu	a6,0(a0)
	add	a0,a3,a2
	sb	a6,0(a0)
	bne	a2,zero,.L978
	jal	zero, .L975
.L1142:
	bgeu	a5,a1,.L955
	beq	a3,zero,.L955
.L958:
	addi	a3,a3,-1
	add	a0,a5,a3
	lbu	a6,0(a0)
	add	a0,a1,a3
	sb	a6,0(a0)
	bne	a3,zero,.L958
	jal	zero, .L955
.L1131:
	slli	a3,s0,3
	beq	a3,zero,.L835
	andi	a5,s1,3
	bne	a5,zero,.L833
	add	a3,s1,a3
	addi	a5, s8, 0
.L834:
	lw	a4,0(s1)
	addi	s1,s1,4
	addi	a5,a5,4
	sw	a4,-4(a5)
	bne	s1,a3,.L834
.L835:
	lw	a4,8(sp)
	addi	a2, s2, 0
	addi	a7, s8, 0
	addi	a6, s9, 0
	addi	a3, a4, 0
	addi	a5, s6, 0
	addi	a1, zero, 0
	addi	a0, s11, 0
	sw	s2,-88(s8)
	sw	a4,-84(s8)
	sw	a4,-80(s8)
	sw	s6,-76(s8)
.Lpcrel_23:
	auipc	ra, %pcrel_hi(WikiMerge.constprop.1.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_23)
	jal	zero, .L994
.L841:
	lw	a5,68(sp)
	addi	a4, zero, 512
	addi	s0, s7, 0
	lw	s5,44(sp)
	addi	s7, s2, 0
	lw	s2,12(sp)
	bge	a4, a5, .L849
	lw	a5,8(sp)
	addi	s3,s7,1
	bge	s3, a5, .L1013
	slli	s1,s7,3
	sw	s0,60(sp)
	lw	s0,92(sp)
	sw	s2,12(sp)
	addi	s2, a5, 0
	add	a5,s11,s1
	addi	s4, zero, 0
	addi	s1, s3, 0
	sw	s5,44(sp)
	sw	a3,72(sp)
	addi	s3, a5, 0
.L866:
	addi	s5, s3, 0
	lw	a0,0(s5)
	lw	a1,4(s5)
	lw	a2,8(s3)
	lw	a3,12(s3)
	addi	s3,s3,8
	jalr	ra, s9, 0
	bne	a0,zero,.L865
	lw	a2,0(s5)
	lw	a3,4(s5)
	lw	a0,0(s3)
	lw	a1,4(s3)
	jalr	ra, s9, 0
	beq	a0,zero,.L864
.L865:
	beq	s0,s4,.L1018
	addi	s4,s4,1
.L864:
	addi	s1,s1,1
	bne	s1,s2,.L866
	lw	a5,68(sp)
	lw	s2,12(sp)
	lw	s5,44(sp)
	lw	s0,60(sp)
	lw	a3,72(sp)
	addi	s3, s1, 0
	beq	s4,a5,.L1143
.L1013:
	lw	a5,68(sp)
	beq	a5,a3,.L1144
.L847:
	lw	a5,8(sp)
	addi	s7,s6,-2
	blt	s7,a5,.L875
	addi	s4, a5, 0
	lw	a5,0(sp)
	sw	s2,0(sp)
	addi	s2, s7, 0
	addi	s7, s0, 0
	lw	s0,92(sp)
	add	s3,s11,a5
	addi	s3,s3,-8
	addi	s1, zero, 1
	sw	s5,12(sp)
.L879:
	lw	a3,12(s3)
	lw	a2,8(s3)
	lw	a0,0(s3)
	lw	a1,4(s3)
	jalr	ra, s9, 0
	bne	a0,zero,.L878
	lw	a1,12(s3)
	lw	a2,0(s3)
	lw	a3,4(s3)
	lw	a0,8(s3)
	jalr	ra, s9, 0
	beq	a0,zero,.L877
.L878:
	beq	s0,s1,.L1110
	addi	s1,s1,1
.L877:
	addi	s2,s2,-1
	addi	s3,s3,-8
	bge	s2,s4,.L879
.L1110:
	addi	s0, s7, 0
	lw	s5,12(sp)
	addi	s7, s2, 0
	lw	s2,0(sp)
.L875:
	lw	a5,8(sp)
	addi	s4,s7,-1
	blt	s4,a5,.L1111
	sw	s0,12(sp)
	lw	s0,92(sp)
	addi	s3, a5, 0
	slli	a5,s7,3
	sw	s2,0(sp)
	add	s1,s11,a5
	addi	s7, zero, 0
	addi	s2, s4, 0
.L884:
	addi	s4, s1, 0
	lw	a2,0(s4)
	lw	a3,4(s4)
	lw	a0,-8(s1)
	lw	a1,-4(s1)
	addi	s1,s1,-8
	jalr	ra, s9, 0
	bne	a0,zero,.L883
	lw	a2,0(s1)
	lw	a3,4(s1)
	lw	a0,0(s4)
	lw	a1,4(s4)
	jalr	ra, s9, 0
	beq	a0,zero,.L882
.L883:
	beq	s0,s7,.L1020
	addi	s7,s7,1
.L882:
	addi	s2,s2,-1
	bge	s2,s3,.L884
	addi	s4, s2, 0
	lw	s0,12(sp)
	lw	s2,0(sp)
.L881:
	lw	a5,68(sp)
	bne	s7,a5,.L1123
	slli	a3,a5,1
	sub	a5,s6,a5
	sw	a5,88(sp)
	sub	a5,s6,a3
	sw	a5,80(sp)
	lw	a5,88(sp)
	sw	s7,52(sp)
	sw	s2,84(sp)
	sub	a5,a5,s7
	sw	a5,28(sp)
	lw	a5,88(sp)
	sw	s6,56(sp)
	sw	a5,16(sp)
	addi	a5,s6,-1
	jal	zero, .L860
.L1025:
	addi	a3, a5, 0
	addi	a1, a4, 0
	jal	zero, .L940
.L979:
	add	a1,s2,a1
	addi	a3, s2, 0
.L981:
	lbu	a2,0(a3)
	addi	a3,a3,1
	addi	a5,a5,1
	sb	a2,-1(a5)
	bne	a1,a3,.L981
	addi	s3, s6, 0
	lw	s1,0(sp)
	add	s0,s0,a4
	add	s5,s5,a4
	addi	s6, s4, 0
	jal	zero, .L903
.L996:
	lw	a5,28(sp)
	addi	a3, s9, 0
	addi	a0, s8, 0
	addi	a1, a5, 0
	sw	a5,-120(s11)
	lw	a5,88(sp)
	sw	t0,4(sp)
	sw	t2,0(sp)
	addi	a2, a5, 0
	sw	a5,-116(s11)
.Lpcrel_24:
	auipc	ra, %pcrel_hi(InsertionSort)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_24)
	lw	a5,84(sp)
	lw	a4,104(sp)
	lw	t2,0(sp)
	lw	t0,4(sp)
	addi	s1, a4, 0
	addi	s0, a5, 0
	addi	s2, a5, 0
	addi	s5, t0, 0
	addi	s4, t2, 0
	bge	a4, a5, .L1003
.L999:
	beq	s4,s0,.L1002
.L1145:
	slli	a4,s1,3
	slli	a5,s0,3
	add	a4,s8,a4
	add	a5,s8,a5
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	ra, s9, 0
	beq	a0,zero,.L1002
	bge	s1, s2, .L1117
	addi	s0,s0,1
	bne	s4,s0,.L1145
.L1002:
	sub	a1,s2,s0
	sub	s2,s0,s2
	addi	s2,s2,1
	addi	a2, s1, 0
	sw	s1,-16(s11)
	addi	a4, s11, 0
	addi	a3, s0, 0
	addi	a0, s8, 0
	add	s1,s1,s2
	sw	s0,-12(s11)
.Lpcrel_25:
	auipc	ra, %pcrel_hi(Rotate.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_25)
	bge	s1, s0, .L1117
	beq	s4,s0,.L1118
	addi	s2, s0, 0
	jal	zero, .L999
.L1117:
	addi	t0, s5, 0
	addi	t2, s4, 0
.L1003:
	lw	a5,108(sp)
	addi	s0, t2, 0
	bge	t2, a5, .L1001
	lw	s4,104(sp)
	lw	s2,20(sp)
	addi	s1, a5, 0
	addi	s5, t0, 0
	addi	s7, t2, 0
.L1000:
	beq	s4,s7,.L1006
.L1146:
	add	a4,s7,s2
	add	a5,s1,s2
	slli	a4,a4,3
	slli	a5,a5,3
	add	a4,s8,a4
	add	a5,s8,a5
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	ra, s9, 0
	beq	a0,zero,.L1006
	bge	s0, s1, .L1120
	addi	s7,s7,-1
	bne	s4,s7,.L1146
.L1006:
	sub	s0,s0,s7
	addi	a1, s0, 0
	addi	s0,s0,1
	addi	a3, s1, 0
	sw	s1,-4(s11)
	addi	a4, s11, 0
	addi	a2, s7, 0
	addi	a0, s8, 0
	sub	s1,s1,s0
	sw	s7,-8(s11)
.Lpcrel_26:
	auipc	ra, %pcrel_hi(Rotate.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_26)
	bge	s7, s1, .L1120
	beq	s4,s7,.L1121
	addi	s0, s7, 0
	jal	zero, .L1000
.L1118:
	addi	s2, s5, 0
.L1005:
	addi	a2, s1, 0
	sw	s1,-16(s11)
	addi	a4, s11, 0
	addi	a3, s0, 0
	addi	a1, zero, 0
	addi	a0, s8, 0
	addi	s1,s1,1
	sw	s0,-12(s11)
.Lpcrel_27:
	auipc	ra, %pcrel_hi(Rotate.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_27)
	blt	s1, s0, .L1005
	addi	t0, s2, 0
	addi	t2, s4, 0
	jal	zero, .L1003
.L1121:
	addi	s0, s1, 0
	addi	s2, s5, 0
	addi	s1, s7, 0
.L1008:
	addi	a3, s0, 0
	sw	s0,-4(s11)
	addi	a4, s11, 0
	addi	a2, s1, 0
	addi	a1, zero, 0
	addi	a0, s8, 0
	addi	s0,s0,-1
	sw	s1,-8(s11)
.Lpcrel_28:
	auipc	ra, %pcrel_hi(Rotate.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_28)
	blt	s1, s0, .L1008
	addi	t0, s2, 0
	jal	zero, .L1001
.L945:
	addi	a3, a1, 0
	addi	a5, s2, 0
	add	t4,s2,a2
.L948:
	lbu	a0,0(a3)
	addi	a5,a5,1
	addi	a3,a3,1
	sb	a0,-1(a5)
	bne	a5,t4,.L948
	jal	zero, .L947
.L966:
	addi	a3, s2, 0
	add	t4,s2,a1
.L969:
	lbu	a0,0(a5)
	addi	a3,a3,1
	addi	a5,a5,1
	sb	a0,-1(a3)
	bne	t4,a3,.L969
	jal	zero, .L968
.L959:
	slli	a3,s4,3
	add	a2,s2,a2
	add	a3,s11,a3
	addi	a5, s2, 0
.L961:
	lbu	a1,0(a5)
	addi	a5,a5,1
	addi	a3,a3,1
	sb	a1,-1(a3)
	bne	a5,a2,.L961
	addi	s3, s6, 0
	lw	s1,0(sp)
	add	s0,s0,a4
	add	s5,s5,a4
	addi	s6, s4, 0
	jal	zero, .L903
.L852:
	lw	a5,8(sp)
	addi	s4,s6,-2
	blt	s4,a5,.L854
.L850:
	lw	a5,0(sp)
	sw	s0,12(sp)
	lw	s7,8(sp)
	lw	s0,92(sp)
	add	s1,s11,a5
	sw	s2,0(sp)
	addi	s1,s1,-8
	addi	s3, zero, 1
	addi	s2, s4, 0
.L859:
	lw	a3,12(s1)
	lw	a2,8(s1)
	lw	a0,0(s1)
	lw	a1,4(s1)
	jalr	ra, s9, 0
	bne	a0,zero,.L858
	lw	a1,12(s1)
	lw	a2,0(s1)
	lw	a3,4(s1)
	lw	a0,8(s1)
	jalr	ra, s9, 0
	beq	a0,zero,.L857
.L858:
	beq	s0,s3,.L1016
	addi	s3,s3,1
.L857:
	addi	s2,s2,-1
	addi	s1,s1,-8
	bge	s2,s7,.L859
	lw	a5,68(sp)
	addi	s4, s2, 0
	lw	s0,12(sp)
	lw	s2,0(sp)
	beq	s3,a5,.L1147
.L851:
	lw	a5,68(sp)
	bge	s3, a5, .L1148
.L1123:
	lw	s0,8(sp)
.L874:
	bge	s0, s6, .L994
	addi	a1, s2, 0
	addi	a4, s9, 0
	addi	a2, s0, 0
	addi	a3, s6, 0
	addi	a0, s11, 0
	sw	s0,-80(s8)
	sw	s6,-76(s8)
.Lpcrel_29:
	auipc	ra, %pcrel_hi(BinaryFirst)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_29)
	addi	s1, a0, 0
	addi	a2, s2, 0
	sub	a1,s0,a0
	addi	a4, s8, 0
	addi	a0, s11, 0
	addi	a3, s1, 0
	sw	s2,-56(s8)
	sw	s1,-52(s8)
	sub	s3,s1,s0
.Lpcrel_30:
	auipc	ra, %pcrel_hi(Rotate.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_30)
	add	a1,s3,s2
	addi	a2, s2, 0
	addi	a3, s0, 0
	addi	a4, s9, 0
	addi	a0, s11, 0
	sw	s2,-88(s8)
	sw	s0,-84(s8)
.Lpcrel_31:
	auipc	ra, %pcrel_hi(BinaryLast)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_31)
	addi	s2, a0, 0
	bge	a0, s1, .L994
	addi	s0, s1, 0
	jal	zero, .L874
.L904:
	add	a3,s8,a3
	addi	a4, s8, 0
.L907:
	lbu	a2,0(a5)
	addi	a4,a4,1
	addi	a5,a5,1
	sb	a2,-1(a4)
	bne	a4,a3,.L907
	jal	zero, .L1126
.L1120:
	addi	t0, s5, 0
	jal	zero, .L1001
.L1141:
	add	a1,s11,a1
	jal	zero, .L947
.L953:
	add	a3,a5,a3
.L956:
	lbu	a0,0(a5)
	addi	a5,a5,1
	addi	a1,a1,1
	sb	a0,-1(a1)
	bne	a5,a3,.L956
	jal	zero, .L955
.L973:
	add	a2,a2,a5
	addi	a0, a5, 0
.L976:
	lbu	a6,0(a0)
	addi	a0,a0,1
	addi	a3,a3,1
	sb	a6,-1(a3)
	bne	a2,a0,.L976
	jal	zero, .L975
.L1016:
	lw	a5,68(sp)
	addi	s3,s3,1
	addi	s4, s2, 0
	lw	s0,12(sp)
	lw	s2,0(sp)
	bne	s3,a5,.L851
.L1147:
	sub	a5,s6,a5
	sw	a5,16(sp)
	sw	a5,80(sp)
	sw	s3,52(sp)
	addi	a3, s3, 0
	sw	s2,84(sp)
	sw	s2,28(sp)
	sw	s6,56(sp)
	sw	s2,88(sp)
	addi	a5,s6,-1
	jal	zero, .L860
.L1018:
	lw	a5,68(sp)
	addi	s4,s4,1
	lw	s2,12(sp)
	lw	s5,44(sp)
	lw	s0,60(sp)
	lw	a3,72(sp)
	addi	s3, s1, 0
	bne	s4,a5,.L1013
.L1143:
	slli	a1,a5,1
	add	a5,a1,s2
	sw	a5,88(sp)
	add	a5,s4,s2
	sw	a5,28(sp)
	lw	a5,8(sp)
	add	a4,a1,s2
	addi	s7, s3, 0
	sub	s0,a5,a4
	slli	a5,a4,3
	sw	a5,4(sp)
	lw	a5,28(sp)
	sw	a4,84(sp)
	sw	s6,80(sp)
	sw	a5,56(sp)
	addi	s4, s6, 0
	addi	a3, zero, 0
	jal	zero, .L853
.L833:
	add	a3,s8,a3
	addi	a5, s8, 0
.L836:
	lbu	a4,0(s1)
	addi	a5,a5,1
	addi	s1,s1,1
	sb	a4,-1(a5)
	bne	a3,a5,.L836
	jal	zero, .L835
.L1020:
	addi	s4, s2, 0
	lw	s0,12(sp)
	lw	s2,0(sp)
	addi	s7,s7,1
	jal	zero, .L881
.L1144:
	lw	a4,8(sp)
	addi	a5,s6,-2
	blt	a5, a4, .L1108
	lw	a4,0(sp)
	addi	s0, a5, 0
	sw	s2,0(sp)
	add	s1,s11,a4
	lw	a4,8(sp)
	addi	s1,s1,-8
	addi	s2, zero, 1
	addi	s4,a4,-1
.L872:
	lw	a3,12(s1)
	lw	a2,8(s1)
	lw	a0,0(s1)
	lw	a1,4(s1)
	jalr	ra, s9, 0
	bne	a0,zero,.L871
	lw	a1,12(s1)
	lw	a2,0(s1)
	lw	a3,4(s1)
	lw	a0,8(s1)
	jalr	ra, s9, 0
	beq	a0,zero,.L870
.L871:
	lw	a5,92(sp)
	beq	a5,s2,.L1019
	addi	s2,s2,1
.L870:
	addi	s0,s0,-1
	addi	s1,s1,-8
	bne	s0,s4,.L872
	addi	s3, s2, 0
	lw	s2,0(sp)
.L869:
	lw	a5,68(sp)
	bne	s3,a5,.L1123
	add	a5,a5,s2
	sw	a5,56(sp)
	sub	a5,s6,s3
	lw	a4,56(sp)
	sw	a5,80(sp)
	lw	a5,8(sp)
	sw	a4,84(sp)
	addi	a1, s3, 0
	sub	s0,a5,a4
	slli	a5,a4,3
	sw	a5,4(sp)
	lw	a5,80(sp)
	addi	a3, s3, 0
	sw	s6,88(sp)
	sw	a5,28(sp)
	jal	zero, .L853
.L839:
	lw	a5,68(sp)
	addi	a4, zero, 512
	blt	a4, a5, .L847
	addi	a3, zero, 1
	beq	a5,a3,.L849
	lw	a5,8(sp)
	addi	s4,s6,-2
	addi	s3, a3, 0
	bge	s4, a5, .L850
	jal	zero, .L851
.L1127:
	addi	a3, a2, 0
	addi	a2, a1, 0
	addi	a1, zero, 0
	sw	zero,240(sp)
	sw	t1,244(sp)
.Lpcrel_32:
	auipc	ra, %pcrel_hi(InsertionSort)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_32)
	jal	zero, .L811
.L1019:
	addi	s3,s2,1
	addi	s4, s0, 0
	lw	s2,0(sp)
	jal	zero, .L869
.L854:
	lw	a5,68(sp)
	addi	s3, zero, 1
	bne	a5,s3,.L851
	addi	a4, a5, 0
	addi	a5,s6,-1
	sw	a5,16(sp)
	sw	a5,80(sp)
	sw	a4,52(sp)
	addi	a3, a4, 0
	sw	s2,84(sp)
	sw	s2,28(sp)
	sw	s6,56(sp)
	sw	s2,88(sp)
	jal	zero, .L860
.L1111:
	addi	s0, a5, 0
	jal	zero, .L874
.L1148:
	add	a5,s4,s3
	sw	a5,56(sp)
	add	a5,s6,s4
	sw	s3,52(sp)
	sub	a3, zero, s4
	sw	a5,80(sp)
	sw	s2,84(sp)
	sw	s4,16(sp)
	sw	s2,28(sp)
	sw	s2,88(sp)
	jal	zero, .L1010
.L1108:
	addi	s0, a4, 0
	jal	zero, .L874
.L821:
	.size	WikiSort, .-WikiSort
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a5,%hi(.LC0)
	addi	sp,sp,-2048
	addi	a5,a5,%lo(.LC0)
	addi	sp,sp,-1152
	addi	a3,a5,2047
	addi	a3,a3,1153
	addi	a4, sp, 0
.L1150:
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
	bne	a5,a3,.L1150
	lui	a5,%hi(array1)
	addi	a5,a5,%lo(array1)
	addi	a1,a5,2047
	addi	a1,a1,1153
	addi	a4, sp, 0
.L1152:
	lbu	a2,0(a5)
	lbu	a3,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a2,a3,.L1153
	bne	a1,a5,.L1152
	addi	sp,sp,2032
	addi	a0, zero, 1
	addi	sp,sp,1168
	jalr	zero, ra, 0
.L1153:
	addi	sp,sp,2032
	addi	a0, zero, 0
	addi	sp,sp,1168
	jalr	zero, ra, 0
	.size	verify_benchmark, .-verify_benchmark
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
.Lpcrel_33:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_33)
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
.Lpcrel_34:
	auipc	ra, %pcrel_hi(benchmark_body.constprop.0.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_34)
	lw	ra,12(sp)
	addi	a0, zero, 0
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	benchmark, .-benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
.Lpcrel_35:
	auipc	ra, %pcrel_hi(benchmark_body.constprop.0.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_35)
.Lpcrel_36:
	auipc	ra, %pcrel_hi(benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_36)
	sw	zero,12(sp)
	lw	a0,12(sp)
.Lpcrel_37:
	auipc	ra, %pcrel_hi(verify_benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_37)
	lw	ra,28(sp)
	xori	a0,a0,1
	addi	sp,sp,32
	jalr	zero, ra, 0
	.size	main, .-main
	.globl	array1
	.globl	max_size
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC1:
	.word	TestingPathological
	.word	TestingRandom
	.word	TestingMostlyDescending
	.word	TestingMostlyAscending
	.word	TestingAscending
	.word	TestingDescending
	.word	TestingEqual
	.word	TestingJittered
	.word	TestingMostlyEqual
.LC0:
	.word	1000
	.word	1
	.word	1000
	.word	2
	.word	1000
	.word	13
	.word	1000
	.word	18
	.word	1000
	.word	19
	.word	1000
	.word	26
	.word	1000
	.word	31
	.word	1000
	.word	32
	.word	1000
	.word	35
	.word	1000
	.word	36
	.word	1000
	.word	37
	.word	1000
	.word	46
	.word	1000
	.word	49
	.word	1000
	.word	55
	.word	1000
	.word	61
	.word	1000
	.word	62
	.word	1000
	.word	66
	.word	1000
	.word	72
	.word	1000
	.word	73
	.word	1000
	.word	74
	.word	1000
	.word	75
	.word	1000
	.word	76
	.word	1000
	.word	77
	.word	1000
	.word	81
	.word	1000
	.word	82
	.word	1000
	.word	83
	.word	1000
	.word	87
	.word	1000
	.word	89
	.word	1000
	.word	91
	.word	1000
	.word	92
	.word	1000
	.word	95
	.word	1000
	.word	99
	.word	1000
	.word	101
	.word	1000
	.word	105
	.word	1000
	.word	108
	.word	1000
	.word	109
	.word	1000
	.word	114
	.word	1000
	.word	119
	.word	1000
	.word	120
	.word	1000
	.word	128
	.word	1000
	.word	137
	.word	1000
	.word	143
	.word	1000
	.word	144
	.word	1000
	.word	151
	.word	1000
	.word	158
	.word	1000
	.word	161
	.word	1000
	.word	162
	.word	1000
	.word	165
	.word	1000
	.word	169
	.word	1000
	.word	181
	.word	1000
	.word	182
	.word	1000
	.word	187
	.word	1000
	.word	188
	.word	1000
	.word	190
	.word	1000
	.word	195
	.word	1000
	.word	196
	.word	1000
	.word	198
	.word	1000
	.word	200
	.word	1000
	.word	201
	.word	1000
	.word	205
	.word	1000
	.word	206
	.word	1000
	.word	211
	.word	1000
	.word	212
	.word	1000
	.word	213
	.word	1000
	.word	214
	.word	1000
	.word	215
	.word	1000
	.word	217
	.word	1000
	.word	221
	.word	1000
	.word	223
	.word	1000
	.word	225
	.word	1000
	.word	226
	.word	1000
	.word	227
	.word	1000
	.word	233
	.word	1000
	.word	242
	.word	1000
	.word	245
	.word	1000
	.word	249
	.word	1000
	.word	250
	.word	1000
	.word	266
	.word	1000
	.word	270
	.word	1000
	.word	271
	.word	1000
	.word	273
	.word	1000
	.word	274
	.word	1000
	.word	280
	.word	1000
	.word	287
	.word	1000
	.word	291
	.word	1000
	.word	295
	.word	1000
	.word	299
	.word	1000
	.word	303
	.word	1000
	.word	304
	.word	1000
	.word	312
	.word	1000
	.word	328
	.word	1000
	.word	330
	.word	1000
	.word	333
	.word	1000
	.word	339
	.word	1000
	.word	342
	.word	1000
	.word	346
	.word	1000
	.word	350
	.word	1000
	.word	361
	.word	1000
	.word	371
	.word	1000
	.word	376
	.word	1000
	.word	378
	.word	1000
	.word	382
	.word	1000
	.word	384
	.word	1000
	.word	385
	.word	1000
	.word	390
	.word	1000
	.word	396
	.word	1001
	.word	5
	.word	1001
	.word	7
	.word	1001
	.word	8
	.word	1001
	.word	11
	.word	1001
	.word	16
	.word	1001
	.word	20
	.word	1001
	.word	21
	.word	1001
	.word	22
	.word	1001
	.word	29
	.word	1001
	.word	34
	.word	1001
	.word	39
	.word	1001
	.word	40
	.word	1001
	.word	41
	.word	1001
	.word	42
	.word	1001
	.word	47
	.word	1001
	.word	54
	.word	1001
	.word	63
	.word	1001
	.word	68
	.word	1001
	.word	71
	.word	1001
	.word	78
	.word	1001
	.word	84
	.word	1001
	.word	85
	.word	1001
	.word	93
	.word	1001
	.word	96
	.word	1001
	.word	97
	.word	1001
	.word	103
	.word	1001
	.word	104
	.word	1001
	.word	107
	.word	1001
	.word	117
	.word	1001
	.word	129
	.word	1001
	.word	139
	.word	1001
	.word	140
	.word	1001
	.word	148
	.word	1001
	.word	156
	.word	1001
	.word	160
	.word	1001
	.word	167
	.word	1001
	.word	172
	.word	1001
	.word	174
	.word	1001
	.word	175
	.word	1001
	.word	179
	.word	1001
	.word	185
	.word	1001
	.word	186
	.word	1001
	.word	193
	.word	1001
	.word	194
	.word	1001
	.word	207
	.word	1001
	.word	208
	.word	1001
	.word	216
	.word	1001
	.word	219
	.word	1001
	.word	224
	.word	1001
	.word	228
	.word	1001
	.word	229
	.word	1001
	.word	235
	.word	1001
	.word	237
	.word	1001
	.word	240
	.word	1001
	.word	246
	.word	1001
	.word	252
	.word	1001
	.word	255
	.word	1001
	.word	256
	.word	1001
	.word	257
	.word	1001
	.word	259
	.word	1001
	.word	260
	.word	1001
	.word	261
	.word	1001
	.word	265
	.word	1001
	.word	267
	.word	1001
	.word	269
	.word	1001
	.word	275
	.word	1001
	.word	286
	.word	1001
	.word	288
	.word	1001
	.word	289
	.word	1001
	.word	294
	.word	1001
	.word	301
	.word	1001
	.word	302
	.word	1001
	.word	308
	.word	1001
	.word	309
	.word	1001
	.word	314
	.word	1001
	.word	322
	.word	1001
	.word	323
	.word	1001
	.word	325
	.word	1001
	.word	326
	.word	1001
	.word	327
	.word	1001
	.word	334
	.word	1001
	.word	337
	.word	1001
	.word	341
	.word	1001
	.word	347
	.word	1001
	.word	352
	.word	1001
	.word	357
	.word	1001
	.word	360
	.word	1001
	.word	363
	.word	1001
	.word	365
	.word	1001
	.word	366
	.word	1001
	.word	369
	.word	1001
	.word	375
	.word	1001
	.word	379
	.word	1001
	.word	381
	.word	1001
	.word	393
	.word	1001
	.word	394
	.word	1001
	.word	398
	.word	1002
	.word	9
	.word	1002
	.word	17
	.word	1002
	.word	23
	.word	1002
	.word	24
	.word	1002
	.word	30
	.word	1002
	.word	33
	.word	1002
	.word	38
	.word	1002
	.word	43
	.word	1002
	.word	45
	.word	1002
	.word	53
	.word	1002
	.word	57
	.word	1002
	.word	59
	.word	1002
	.word	60
	.word	1002
	.word	64
	.word	1002
	.word	69
	.word	1002
	.word	70
	.word	1002
	.word	79
	.word	1002
	.word	88
	.word	1002
	.word	94
	.word	1002
	.word	98
	.word	1002
	.word	100
	.word	1002
	.word	110
	.word	1002
	.word	111
	.word	1002
	.word	115
	.word	1002
	.word	118
	.word	1002
	.word	123
	.word	1002
	.word	125
	.word	1002
	.word	127
	.word	1002
	.word	130
	.word	1002
	.word	131
	.word	1002
	.word	134
	.word	1002
	.word	136
	.word	1002
	.word	138
	.word	1002
	.word	142
	.word	1002
	.word	146
	.word	1002
	.word	149
	.word	1002
	.word	150
	.word	1002
	.word	152
	.word	1002
	.word	153
	.word	1002
	.word	157
	.word	1002
	.word	163
	.word	1002
	.word	166
	.word	1002
	.word	168
	.word	1002
	.word	170
	.word	1002
	.word	171
	.word	1002
	.word	173
	.word	1002
	.word	176
	.word	1002
	.word	177
	.word	1002
	.word	180
	.word	1002
	.word	183
	.word	1002
	.word	184
	.word	1002
	.word	189
	.word	1002
	.word	191
	.word	1002
	.word	197
	.word	1002
	.word	202
	.word	1002
	.word	203
	.word	1002
	.word	204
	.word	1002
	.word	210
	.word	1002
	.word	218
	.word	1002
	.word	220
	.word	1002
	.word	232
	.word	1002
	.word	236
	.word	1002
	.word	238
	.word	1002
	.word	241
	.word	1002
	.word	243
	.word	1002
	.word	244
	.word	1002
	.word	251
	.word	1002
	.word	253
	.word	1002
	.word	254
	.word	1002
	.word	258
	.word	1002
	.word	264
	.word	1002
	.word	272
	.word	1002
	.word	277
	.word	1002
	.word	279
	.word	1002
	.word	282
	.word	1002
	.word	283
	.word	1002
	.word	284
	.word	1002
	.word	290
	.word	1002
	.word	292
	.word	1002
	.word	296
	.word	1002
	.word	297
	.word	1002
	.word	298
	.word	1002
	.word	300
	.word	1002
	.word	306
	.word	1002
	.word	307
	.word	1002
	.word	310
	.word	1002
	.word	311
	.word	1002
	.word	315
	.word	1002
	.word	316
	.word	1002
	.word	319
	.word	1002
	.word	321
	.word	1002
	.word	324
	.word	1002
	.word	331
	.word	1002
	.word	335
	.word	1002
	.word	340
	.word	1002
	.word	344
	.word	1002
	.word	349
	.word	1002
	.word	353
	.word	1002
	.word	354
	.word	1002
	.word	358
	.word	1002
	.word	362
	.word	1002
	.word	364
	.word	1002
	.word	370
	.word	1002
	.word	374
	.word	1002
	.word	380
	.word	1002
	.word	383
	.word	1002
	.word	386
	.word	1002
	.word	389
	.word	1002
	.word	391
	.word	1002
	.word	392
	.word	1002
	.word	397
	.word	1003
	.word	0
	.word	1003
	.word	3
	.word	1003
	.word	4
	.word	1003
	.word	6
	.word	1003
	.word	10
	.word	1003
	.word	12
	.word	1003
	.word	14
	.word	1003
	.word	15
	.word	1003
	.word	25
	.word	1003
	.word	27
	.word	1003
	.word	28
	.word	1003
	.word	44
	.word	1003
	.word	48
	.word	1003
	.word	50
	.word	1003
	.word	51
	.word	1003
	.word	52
	.word	1003
	.word	56
	.word	1003
	.word	58
	.word	1003
	.word	65
	.word	1003
	.word	67
	.word	1003
	.word	80
	.word	1003
	.word	86
	.word	1003
	.word	90
	.word	1003
	.word	102
	.word	1003
	.word	106
	.word	1003
	.word	112
	.word	1003
	.word	113
	.word	1003
	.word	116
	.word	1003
	.word	121
	.word	1003
	.word	122
	.word	1003
	.word	124
	.word	1003
	.word	126
	.word	1003
	.word	132
	.word	1003
	.word	133
	.word	1003
	.word	135
	.word	1003
	.word	141
	.word	1003
	.word	145
	.word	1003
	.word	147
	.word	1003
	.word	154
	.word	1003
	.word	155
	.word	1003
	.word	159
	.word	1003
	.word	164
	.word	1003
	.word	178
	.word	1003
	.word	192
	.word	1003
	.word	199
	.word	1003
	.word	209
	.word	1003
	.word	222
	.word	1003
	.word	230
	.word	1003
	.word	231
	.word	1003
	.word	234
	.word	1003
	.word	239
	.word	1003
	.word	247
	.word	1003
	.word	248
	.word	1003
	.word	262
	.word	1003
	.word	263
	.word	1003
	.word	268
	.word	1003
	.word	276
	.word	1003
	.word	278
	.word	1003
	.word	281
	.word	1003
	.word	285
	.word	1003
	.word	293
	.word	1003
	.word	305
	.word	1003
	.word	313
	.word	1003
	.word	317
	.word	1003
	.word	318
	.word	1003
	.word	320
	.word	1003
	.word	329
	.word	1003
	.word	332
	.word	1003
	.word	336
	.word	1003
	.word	338
	.word	1003
	.word	343
	.word	1003
	.word	345
	.word	1003
	.word	348
	.word	1003
	.word	351
	.word	1003
	.word	355
	.word	1003
	.word	356
	.word	1003
	.word	359
	.word	1003
	.word	367
	.word	1003
	.word	368
	.word	1003
	.word	372
	.word	1003
	.word	373
	.word	1003
	.word	377
	.word	1003
	.word	387
	.word	1003
	.word	388
	.word	1003
	.word	395
	.word	1003
	.word	399
	.bss
	.align	2
	.type	array1, @object
	.size	array1, 3200
array1:
	.zero	3200
	.section	.sbss,"aw",@nobits
	.align	2
	.type	seed, @object
	.size	seed, 4
seed:
	.zero	4
	.section	.srodata,"a"
	.align	2
	.type	max_size, @object
	.size	max_size, 4
max_size:
	.word	400
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