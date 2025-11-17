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
	jr	ra
	.size	TestCompare, .-TestCompare
	.align	2
	.globl	TestingRandom
	.type	TestingRandom, @function
TestingRandom:
	lui	a4,%hi(seed)
	lw	a0,%lo(seed)(a4)
	li	a5,1103515648
	addi	a5,a5,-403
	mul	a0,a0,a5
	li	a5,12288
	addi	a5,a5,57
	add	a0,a0,a5
	slli	a0,a0,1
	srli	a0,a0,1
	sw	a0,%lo(seed)(a4)
	srli	a0,a0,16
	ret
	.size	TestingRandom, .-TestingRandom
	.align	2
	.globl	TestingMostlyDescending
	.type	TestingMostlyDescending, @function
TestingMostlyDescending:
	lui	a2,%hi(seed)
	lw	a5,%lo(seed)(a2)
	li	a4,1103515648
	addi	a4,a4,-403
	mul	a5,a5,a4
	li	a3,12288
	addi	a3,a3,57
	li	a4,-858992640
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
	ret
	.size	TestingMostlyDescending, .-TestingMostlyDescending
	.align	2
	.globl	TestingMostlyAscending
	.type	TestingMostlyAscending, @function
TestingMostlyAscending:
	lui	a2,%hi(seed)
	lw	a5,%lo(seed)(a2)
	li	a4,1103515648
	addi	a4,a4,-403
	mul	a5,a5,a4
	li	a3,12288
	addi	a3,a3,57
	li	a4,-858992640
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
	ret
	.size	TestingMostlyAscending, .-TestingMostlyAscending
	.align	2
	.globl	TestingAscending
	.type	TestingAscending, @function
TestingAscending:
	ret
	.size	TestingAscending, .-TestingAscending
	.align	2
	.globl	TestingDescending
	.type	TestingDescending, @function
TestingDescending:
	sub	a0,a1,a0
	ret
	.size	TestingDescending, .-TestingDescending
	.align	2
	.globl	TestingEqual
	.type	TestingEqual, @function
TestingEqual:
	li	a0,1000
	ret
	.size	TestingEqual, .-TestingEqual
	.align	2
	.globl	TestingJittered
	.type	TestingJittered, @function
TestingJittered:
	lui	a2,%hi(seed)
	lw	a5,%lo(seed)(a2)
	li	a4,1103515648
	addi	a4,a4,-403
	mul	a5,a5,a4
	li	a3,12288
	addi	a3,a3,57
	li	a4,-858992640
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
	ret
.L12:
	addi	a0,a0,-2
	ret
	.size	TestingJittered, .-TestingJittered
	.align	2
	.globl	TestingMostlyEqual
	.type	TestingMostlyEqual, @function
TestingMostlyEqual:
	lui	a3,%hi(seed)
	lw	a5,%lo(seed)(a3)
	li	a4,1103515648
	addi	a4,a4,-403
	mul	a5,a5,a4
	li	a4,12288
	addi	a4,a4,57
	add	a5,a5,a4
	slli	a5,a5,1
	srli	a5,a5,1
	srai	a0,a5,16
	andi	a0,a0,3
	sw	a5,%lo(seed)(a3)
	addi	a0,a0,1000
	ret
	.size	TestingMostlyEqual, .-TestingMostlyEqual
	.align	2
	.globl	TestingPathological
	.type	TestingPathological, @function
TestingPathological:
	mv	a5,a0
	beq	a0,zero,.L16
	srli	a4,a1,31
	add	a4,a4,a1
	srai	a4,a4,1
	li	a0,11
	blt	a5,a4,.L14
	addi	a1,a1,-1
	sub	a5,a5,a1
	seqz	a5,a5
	addi	a0,a5,9
	ret
.L16:
	li	a0,10
.L14:
	ret
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
	li	a4,512
	sw	a3,4(sp)
	mv	s0,a0
	mv	s6,a6
	bgt	s5,a4,.L20
	sw	s2,80(sp)
	slli	s3,a2,3
	slli	s1,s5,3
	mv	s2,a7
	add	s3,a0,s3
	add	s1,a7,s1
	ble	s5,zero,.L21
	ble	a3,zero,.L21
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
	jalr	s6
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
	jr	ra
.L20:
	mv	s1,a1
	ble	a3,zero,.L33
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
	li	s9,0
	li	s3,0
	li	s4,0
	mv	s7,a1
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
	jalr	s6
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
	ble	s5,s4,.L61
.L36:
	addi	s11,s11,8
	j	.L34
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
	ble	s5,zero,.L61
	lw	a5,12(sp)
	mv	s1,s7
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
	jr	ra
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
	li	a4,6
	bleu	a5,a4,.L27
	addi	a3,s3,-1
	sub	a3,a3,s2
	sltiu	a3,a3,3
	mv	a5,s3
	mv	a4,s2
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
	bleu	a1,a5,.L59
	add	a4,s2,a5
	lbu	a4,0(a4)
	add	a5,s3,a5
	addi	a0,a0,2
	sb	a4,0(a5)
	bleu	a1,a0,.L59
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
	jr	ra
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
	jr	ra
.L61:
	lw	s2,80(sp)
	lw	s4,72(sp)
	lw	s7,60(sp)
	lw	s8,56(sp)
	lw	s9,52(sp)
	lw	s10,48(sp)
	lw	s11,44(sp)
	j	.L19
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
	li	a6,512
	sub	s2,a4,a3
	bgt	a2,a6,.L63
	lui	a6,%hi(array1)
	slli	a1,a1,3
	addi	a6,a6,%lo(array1)
	slli	a0,a2,3
	add	a1,a1,a6
	add	a0,a5,a0
	ble	s2,zero,.L64
	ble	a2,zero,.L64
	slli	a3,a3,3
	slli	a4,a4,3
	add	a3,a3,a6
	add	a6,a4,a6
.L65:
	lw	a2,0(a5)
	lw	a4,0(a3)
	addi	a1,a1,8
	bgt	a2,a4,.L66
	sw	a2,-8(a1)
	lw	a4,4(a5)
	addi	a5,a5,8
	sw	a4,-4(a1)
	bne	a0,a5,.L65
.L62:
	lw	s2,20(sp)
	addi	sp,sp,32
	jr	ra
.L63:
	ble	s2,zero,.L103
	lui	a5,%hi(array1)
	addi	a5,a5,%lo(array1)
	slli	a4,a1,3
	sw	s0,28(sp)
	sw	s1,24(sp)
	add	a4,a5,a4
	li	t4,0
	li	t6,0
	li	t5,0
	mv	s1,a3
	mv	s0,a0
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
	ble	a2,t5,.L102
.L79:
	addi	a4,a4,8
	j	.L77
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
	jr	ra
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
	li	a3,5
	bleu	a4,a3,.L70
	addi	a2,a1,-1
	sub	a2,a2,a5
	sltiu	a2,a2,3
	mv	a4,a1
	mv	a3,a5
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
	bleu	a6,a4,.L62
	add	a3,a5,a4
	lbu	a3,0(a3)
	add	a4,a1,a4
	addi	a7,a7,2
	sb	a3,0(a4)
	bleu	a6,a7,.L62
	add	a5,a5,a7
	lbu	a5,0(a5)
	add	a7,a1,a7
	sb	a5,0(a7)
	lw	s2,20(sp)
	addi	sp,sp,32
	jr	ra
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
	ble	a2,zero,.L102
	mv	a0,s0
	lw	s1,24(sp)
	lw	s0,28(sp)
	add	a1,a1,t4
	j	.L76
.L102:
	lw	s0,28(sp)
	lw	s1,24(sp)
	j	.L62
.L70:
	add	a6,a5,a6
.L74:
	lbu	a4,0(a5)
	addi	a5,a5,1
	addi	a1,a1,1
	sb	a4,-1(a1)
	bne	a5,a6,.L74
	j	.L62
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
	ble	a1,t5,.L107
	li	a5,512
	ble	t5,a5,.L213
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
	li	a5,1
	ble	a4,a5,.L104
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
	jr	ra
.L106:
	add	t4,a3,a1
	sub	a5,t4,a2
	neg	t5,a1
	ble	a5,t5,.L160
	li	a6,-512
	bge	a1,a6,.L214
	mv	a1,a5
	j	.L109
.L160:
	mv	a1,a5
.L107:
	srai	a6,a1,1
	li	a5,512
	addi	a6,a6,-1
	bgt	a1,a5,.L152
	slli	a1,a1,3
	slli	a7,a2,3
	beq	a1,zero,.L215
	addi	a6,a7,1
	add	a6,a0,a6
	sub	a6,a4,a6
	sltiu	a6,a6,3
	add	a7,a0,a7
	mv	a5,a4
	bne	a6,zero,.L115
	or	a6,a4,a7
	andi	a6,a6,3
	bne	a6,zero,.L115
	mv	a6,a7
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
	bleu	a5,a7,.L216
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
	mv	a3,a4
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
	j	.L104
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
	mv	a6,a4
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
	mv	a0,a2
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
	mv	a5,a2
	mv	a3,a4
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
	j	.L104
.L217:
	bleu	a5,a2,.L144
	beq	a3,zero,.L144
.L147:
	addi	a3,a3,-1
	add	a1,a2,a3
	lbu	a0,0(a1)
	add	a1,a5,a3
	sb	a0,0(a1)
	bne	a3,zero,.L147
	j	.L144
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
	j	.L125
.L153:
	srai	a1,t5,1
	addi	a1,a1,-1
	j	.L155
.L214:
	slli	t5,t5,3
	mv	a1,a5
	j	.L110
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
	j	.L104
.L148:
	add	a4,a4,t5
.L150:
	lbu	a5,0(a3)
	addi	a3,a3,1
	addi	a2,a2,1
	sb	a5,-1(a2)
	bne	a3,a4,.L150
	j	.L104
.L135:
	add	t1,a4,t5
.L138:
	lbu	a7,0(a5)
	addi	a6,a6,1
	addi	a5,a5,1
	sb	a7,-1(a6)
	bne	a6,t1,.L138
	j	.L137
.L115:
	mv	a6,a7
	add	t3,a4,a1
.L118:
	lbu	t1,0(a6)
	addi	a5,a5,1
	addi	a6,a6,1
	sb	t1,-1(a5)
	bne	a5,t3,.L118
	j	.L117
.L215:
	add	a7,a0,a7
	j	.L117
.L142:
	mv	a1,a2
.L145:
	lbu	a0,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a0,-1(a5)
	bne	a1,a3,.L145
	j	.L144
.L123:
	add	a6,a5,a6
.L126:
	lbu	t1,0(a5)
	addi	a5,a5,1
	addi	a7,a7,1
	sb	t1,-1(a7)
	bne	a5,a6,.L126
	j	.L125
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
	ble	t3,a4,.L319
.L223:
	li	a5,1
	ble	a0,a5,.L263
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
	li	a5,1
	ble	t3,a5,.L261
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
	li	a5,1
	ble	a4,a5,.L218
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
	jr	ra
.L318:
	blt	a4,a0,.L223
	lui	a7,%hi(array1)
	slli	a0,a0,3
	slli	a4,a1,3
	addi	a7,a7,%lo(array1)
	beq	a0,zero,.L229
	not	t1,a7
	sub	t1,t1,a4
	add	t1,a3,t1
	sltiu	t1,t1,3
	mv	a5,a3
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
	mv	a4,a3
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
	j	.L218
.L317:
	add	a6,a2,a0
	sub	a0,a6,a1
	sub	t3,a2,a6
	blt	t3,a0,.L222
	j	.L318
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
	mv	a4,a3
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
	mv	a2,a5
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
	mv	a4,a3
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
	j	.L218
.L321:
	bleu	a4,a5,.L253
	beq	a0,zero,.L253
.L254:
	addi	a0,a0,-1
	add	a2,a5,a0
	lbu	a6,0(a2)
	add	a2,a4,a0
	sb	a6,0(a2)
	bne	a0,zero,.L254
	j	.L253
.L320:
	bleu	a5,a4,.L236
	beq	t1,zero,.L236
.L237:
	addi	t1,t1,-1
	add	t4,a4,t1
	lbu	t5,0(t4)
	add	t4,a5,t1
	sb	t5,0(t4)
	bne	t1,zero,.L237
	j	.L236
.L255:
	add	a7,a7,a1
	add	a3,a3,t3
.L257:
	lbu	a5,0(a4)
	addi	a4,a4,1
	addi	a7,a7,1
	sb	a5,-1(a7)
	bne	a4,a3,.L257
	j	.L218
.L245:
	add	a5,a7,a6
	add	t1,a3,t3
.L248:
	lbu	a6,0(a5)
	addi	a4,a4,1
	addi	a5,a5,1
	sb	a6,-1(a4)
	bne	a4,t1,.L248
	j	.L247
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
	j	.L218
.L227:
	add	t1,a7,a4
	add	t5,a3,a0
.L230:
	lbu	t4,0(t1)
	addi	a5,a5,1
	addi	t1,t1,1
	sb	t4,-1(a5)
	bne	a5,t5,.L230
	j	.L229
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
	li	a0,0
	li	t5,400
.L326:
	addi	t4,a0,1
	mv	t1,t3
	addi	a7,a0,25
.L325:
	lw	a6,0(t1)
	lw	t6,4(t1)
	mv	a5,t1
	mv	a4,t4
	j	.L324
.L557:
	lw	a1,-4(a5)
	sw	a3,0(a5)
	addi	a4,a4,-1
	sw	a1,4(a5)
	addi	a5,a5,-8
	bge	a0,a4,.L556
.L324:
	lw	a3,-8(a5)
	mv	a2,a5
	bgt	a3,a6,.L557
	sw	a6,0(a2)
	sw	t6,4(a2)
	addi	t4,t4,1
	addi	t1,t1,8
	bne	a7,t4,.L325
.L559:
	addi	t3,t3,200
	beq	a7,t5,.L558
	mv	a0,a7
	j	.L326
.L556:
	slli	a4,a4,3
	add	a2,s11,a4
	sw	a6,0(a2)
	sw	t6,4(a2)
	addi	t4,t4,1
	addi	t1,t1,8
	bne	a7,t4,.L325
	j	.L559
.L558:
	li	a5,536870912
	addi	a5,a5,-1
	sw	a5,28(sp)
	li	t2,25
	li	s5,4
.L327:
	li	a5,1073741824
	bge	t2,a5,.L471
.L328:
	srai	a5,a5,2
	bgt	a5,t2,.L328
	beq	a5,zero,.L329
.L471:
	mv	a3,t2
	li	s3,0
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
	li	s6,0
	sw	t2,64(sp)
	mv	s9,t2
	slli	s8,s3,3
	sw	s5,108(sp)
	sw	a5,92(sp)
	addi	a5,s7,-1
	sw	a5,32(sp)
	li	a5,1
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
	mv	a6,s6
	slli	a3,a4,3
	mv	s6,a5
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
	ble	a0,a2,.L337
	lw	a2,64(sp)
	li	a0,512
	mv	s4,s9
	ble	a2,a0,.L562
	addi	t5,a3,-8
	lw	a3,52(sp)
	ble	a3,zero,.L563
	mv	a0,a2
	rem	a0,a0,s3
	mv	t3,a2
	sw	s6,48(sp)
	addi	s10,sp,208
	add	s1,a6,a0
	addi	a2,s1,1
	ble	s9,a2,.L564
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
	bgt	s9,a2,.L410
.L411:
	mv	t4,s3
	ble	s3,t3,.L407
	mv	t4,t3
.L407:
	add	a7,s11,a7
	li	a5,512
	lw	t0,0(a7)
	add	t4,t4,s9
	bgt	a0,a5,.L565
	slli	a0,a0,3
	add	a4,s11,t5
	add	a1,a0,a4
	mv	a3,s10
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
	mv	s5,s4
	sw	s7,76(sp)
	sw	s9,80(sp)
	mv	s7,s9
	sw	a5,56(sp)
	mv	t3,s1
	li	s2,0
	li	s0,0
	sw	zero,8(sp)
	mv	s6,t4
	mv	t1,s1
	mv	s4,t0
	mv	s9,s10
.L413:
	ble	s2,s0,.L420
.L417:
	lw	a5,28(sp)
	add	a4,s2,a5
	slli	a4,a4,3
	add	a4,s11,a4
	lw	a4,0(a4)
	bgt	s4,a4,.L420
.L418:
	addi	a4,s2,-1
	bge	s0,a4,.L421
	slli	a3,t1,3
	add	a3,s11,a3
	lw	a1,0(a3)
	mv	a2,a4
.L423:
	sub	a5,a2,s0
	srai	a5,a5,1
	add	a5,a5,s0
	slli	a3,a5,3
	add	a3,s11,a3
	lw	a3,0(a3)
	ble	a1,a3,.L484
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
	sgt	a4,a4,a3
	add	s0,s0,a4
.L424:
	sub	s4,s2,s0
	add	s10,s1,s3
	ble	s3,zero,.L429
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
	mv	a5,s9
	sw	a0,4(a3)
	lw	a0,24(sp)
	sw	a1,0(a4)
	sw	a2,4(a4)
	mv	a1,a6
	mv	a3,t3
	mv	a2,t3
	mv	a4,s0
	sw	t3,-40(s9)
	sw	a6,-96(s9)
	sw	t3,-92(s9)
	sw	s0,-36(s9)
	call	WikiMerge.constprop.0.isra.0
	li	a5,512
	bgt	s3,a5,.L566
	beq	s8,zero,.L434
	slli	a4,s1,3
	add	a4,s11,a4
	add	a1,s8,a4
	mv	a3,s9
.L433:
	lw	a5,0(a4)
	addi	a4,a4,4
	addi	a3,a3,4
	sw	a5,-4(a3)
	bne	a4,a1,.L433
.L434:
	ble	s4,zero,.L432
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
	ble	s5,a4,.L485
	slli	a3,t1,3
	add	a3,s11,a3
	lw	a0,0(a3)
	slli	a2,a4,3
	add	a2,s11,a2
.L441:
	lw	a5,0(a2)
	ble	a0,a5,.L440
	mv	a0,a5
	mv	t1,a4
.L440:
	add	a4,a4,s3
	add	a2,a2,s8
	bgt	s5,a4,.L441
	addi	t1,t1,-1
.L439:
	slli	a4,t1,3
	add	a4,s11,a4
	mv	s0,t3
	lw	s4,0(a4)
	mv	s1,s10
	bgt	s2,s0,.L417
.L420:
	beq	s6,s7,.L418
	sub	s0,s6,s7
	bge	s0,s3,.L568
	mv	a1,s1
	mv	a2,s6
	sub	a0,s7,s6
	li	a4,0
	mv	a3,s9
	sw	a6,44(sp)
	sw	t3,40(sp)
	sw	t1,36(sp)
	sw	s1,-48(s9)
	sw	s6,-44(s9)
	call	Rotate.constprop.0
	lw	t1,36(sp)
	add	s2,s1,s0
	add	s5,s5,s0
	add	t1,t1,s0
	lw	t3,40(sp)
	mv	s0,s1
	lw	a6,44(sp)
	mv	s6,s7
	mv	s1,s2
	j	.L413
.L484:
	mv	a2,a5
	blt	s0,a2,.L423
	j	.L421
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
	j	.L434
.L561:
	lw	a0,64(sp)
	addi	a3,sp,208
	mv	a1,a6
	li	a4,512
	mv	a2,s6
	sw	a6,200(sp)
	sw	s6,204(sp)
	call	Rotate.constprop.0
.L337:
	lw	a4,32(sp)
	li	a5,399
	add	s9,s9,s7
	add	a4,a4,s7
	sw	a4,32(sp)
	lw	a4,20(sp)
	add	a4,a4,s7
	sw	a4,20(sp)
	lw	a4,16(sp)
	ble	a4,a5,.L449
	lw	a5,52(sp)
	lw	s5,108(sp)
	bgt	a5,zero,.L450
.L460:
	addi	s5,s5,-1
	beq	s5,zero,.L569
.L488:
	mv	t2,s7
	j	.L327
.L568:
	add	s10,s3,s1
	ble	s3,zero,.L447
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
	mv	s2,s10
	bne	t1,s1,.L445
	mv	t1,s5
.L445:
	lw	a5,48(sp)
	add	s6,s6,s3
	add	s5,s5,s3
	add	s7,s7,s3
	ble	s6,a5,.L448
	mv	s6,a5
.L448:
	mv	s0,s1
	mv	s1,s10
	j	.L413
.L567:
	lw	a5,48(sp)
	lw	a0,24(sp)
	mv	s10,s9
	mv	a4,a5
	sw	a5,-52(s10)
	mv	a1,a6
	mv	a5,s10
	mv	a3,t3
	mv	a2,t3
	lw	s6,72(sp)
	lw	s7,76(sp)
	lw	s9,80(sp)
	sw	a6,-96(s10)
	sw	t3,-56(s10)
	sw	t3,-92(s10)
	call	WikiMerge.constprop.0.isra.0
	j	.L337
.L485:
	mv	t1,s10
	j	.L439
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
	j	.L415
.L563:
	lw	a2,20(sp)
	lw	a0,92(sp)
	li	s1,1
.L348:
	mv	a3,a5
	lw	a5,0(a4)
	blt	a3,a5,.L347
	ble	a3,a5,.L346
.L347:
	beq	a0,s1,.L476
	addi	s1,s1,1
.L346:
	addi	a2,a2,1
	addi	a4,a4,8
	bgt	s9,a2,.L348
	lw	a5,68(sp)
	li	a4,512
	bgt	a5,a4,.L349
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
	li	a3,0
	sw	a5,52(sp)
.L351:
	slli	a5,a2,3
	add	s0,s11,a5
	lw	a5,88(sp)
	sw	s4,36(sp)
	sw	s3,44(sp)
	slli	s10,a5,3
	lw	a5,20(sp)
	mv	s4,s0
	mv	s2,a2
	sw	a4,8(sp)
	sw	a3,12(sp)
	sw	a6,40(sp)
	li	s3,0
	addi	s0,a5,-1
	addi	s5,sp,208
.L400:
	beq	s2,s0,.L399
	lw	a1,-8(s4)
	lw	a4,0(s4)
	blt	a1,a4,.L399
	ble	a1,a4,.L398
.L399:
	addi	a2,a2,1
	addi	a1,s2,1
	neg	a0,s3
	li	a4,512
	mv	a3,s5
	sw	a2,-20(s5)
	sw	a1,-24(s5)
	call	Rotate.constprop.0
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
	mv	t5,s10
	sw	a6,12(sp)
	mv	s10,s5
.L472:
	ble	a3,zero,.L405
.L359:
	slli	s2,a4,3
	sw	s4,8(sp)
	add	s4,s11,s2
	lw	s2,32(sp)
	sw	s1,36(sp)
	sw	s3,44(sp)
	mv	s5,s10
	mv	a1,a4
	mv	s1,a4
	mv	s0,a3
	sw	a6,40(sp)
	li	s3,0
	mv	s10,t5
.L404:
	beq	s1,s2,.L403
	lw	a4,0(s4)
	lw	a6,8(s4)
	bgt	a6,a4,.L403
	bge	a6,a4,.L402
.L403:
	mv	a0,s3
	li	a4,512
	mv	a3,s5
	mv	a2,s1
	sw	a1,-32(s5)
	sw	s1,-28(s5)
	call	Rotate.constprop.0
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
	mv	t5,s10
	mv	s10,s5
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
	bgt	s9,a2,.L406
.L564:
	slli	a7,s1,3
	j	.L411
.L562:
	slli	a1,a2,3
	beq	a1,zero,.L570
	lui	a5,%hi(array1-8)
	addi	a5,a5,%lo(array1-8)
	add	a3,a5,a3
	addi	s10,sp,208
	add	a1,a1,a3
	mv	a4,s10
.L341:
	lw	a5,0(a3)
	addi	a3,a3,4
	addi	a4,a4,4
	sw	a5,-4(a4)
	bne	a1,a3,.L341
.L342:
	lw	a4,16(sp)
	mv	a1,a6
	mv	a5,s10
	mv	a3,s9
	mv	a2,s9
	li	a0,0
	sw	a6,-88(s10)
	sw	s9,-84(s10)
	sw	s9,-80(s10)
	sw	a4,-76(s10)
	call	WikiMerge.constprop.0.isra.0
	j	.L337
.L476:
	lw	a5,68(sp)
	li	a4,512
	addi	s1,s1,1
	ble	a5,a4,.L571
.L349:
	addi	a3,a2,1
	ble	s9,a3,.L362
	slli	a4,a2,3
	add	a5,s11,a4
	lui	a0,%hi(array1+8)
	lw	a5,0(a5)
	lw	t1,92(sp)
	addi	a0,a0,%lo(array1+8)
	add	a4,a0,a4
	li	a7,0
.L367:
	mv	a0,a5
	lw	a5,0(a4)
	bgt	a5,a0,.L366
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
	bgt	s9,a5,.L377
	lw	a4,32(sp)
	lui	a3,%hi(array1-8)
	lw	a0,92(sp)
	slli	a4,a4,3
	addi	a3,a3,%lo(array1-8)
	add	a4,a3,a4
	li	a2,1
.L381:
	mv	a3,a1
	lw	a1,0(a4)
	bgt	a3,a1,.L380
	bge	a3,a1,.L379
.L380:
	beq	a0,a2,.L377
	addi	a2,a2,1
.L379:
	addi	a5,a5,-1
	addi	a4,a4,-8
	ble	s9,a5,.L381
.L377:
	addi	a4,a5,-1
	bgt	s9,a4,.L376
	slli	a5,a5,3
	add	a3,s11,a5
	lui	a2,%hi(array1-8)
	lw	a3,0(a3)
	lw	a0,92(sp)
	addi	a2,a2,%lo(array1-8)
	add	a5,a2,a5
	li	a2,0
.L386:
	mv	a1,a3
	lw	a3,0(a5)
	bgt	a1,a3,.L385
	bge	a1,a3,.L384
.L385:
	beq	a2,a0,.L480
	addi	a2,a2,1
.L384:
	addi	a4,a4,-1
	addi	a5,a5,-8
	ble	s9,a4,.L386
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
	li	s1,0
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
	j	.L359
.L350:
	lw	a5,16(sp)
	addi	a4,a5,-2
	bgt	s9,a4,.L352
	lw	a5,32(sp)
	lui	a3,%hi(array1-8)
	lw	a0,92(sp)
	addi	a3,a3,%lo(array1-8)
	slli	a5,a5,3
	add	a5,a3,a5
	li	a3,1
.L357:
	mv	a2,a1
	lw	a1,0(a5)
	blt	a1,a2,.L356
	ble	a1,a2,.L355
.L356:
	beq	a0,a3,.L477
	addi	a3,a3,1
.L355:
	addi	a4,a4,-1
	addi	a5,a5,-8
	ble	s9,a4,.L357
	lw	a5,68(sp)
	add	a2,a4,a3
	beq	a5,a3,.L574
.L361:
	ble	a5,a3,.L575
.L376:
	lw	s0,16(sp)
	sw	s3,8(sp)
	lw	s10,32(sp)
	addi	s1,sp,208
	mv	s5,a6
	ble	s0,s4,.L541
.L396:
	sw	s4,-80(s1)
	sw	s0,-76(s1)
	bge	s4,s10,.L481
	slli	a5,s5,3
	add	a5,s11,a5
	lw	a3,0(a5)
	mv	s2,s4
	mv	a2,s10
.L389:
	sub	a5,a2,s2
	srai	a5,a5,1
	add	a5,a5,s2
	slli	a4,a5,3
	add	a4,s11,a4
	lw	a4,0(a4)
	ble	a3,a4,.L482
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
	li	a4,512
	mv	a3,s1
	mv	a1,s5
	mv	a2,s2
	sub	s3,s2,s4
	sw	s5,-16(s1)
	sw	s2,-12(s1)
	call	Rotate.constprop.0
	sw	s4,-84(s1)
	sw	s5,-88(s1)
	addi	s4,s4,-1
	add	a5,s5,s3
	bge	s5,s4,.L391
	slli	a4,a5,3
	add	a4,s11,a4
	lw	a3,0(a4)
	mv	a2,s4
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
	ble	s2,s5,.L541
	mv	s4,s2
	bgt	s0,s4,.L396
.L541:
	lw	s3,8(sp)
	j	.L337
.L576:
	slli	a4,s5,3
	slli	a5,a5,3
	add	a5,s11,a5
	add	a4,s11,a4
	lw	a5,0(a5)
	lw	a4,0(a4)
	slt	a5,a5,a4
	seqz	a5,a5
	add	s5,s5,a5
	j	.L394
.L574:
	mv	a2,a5
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
	li	s1,0
	j	.L359
.L482:
	mv	a2,a5
	blt	s2,a2,.L389
	j	.L387
.L483:
	mv	a2,a4
	blt	s5,a2,.L393
	j	.L391
.L481:
	mv	s2,s4
	j	.L387
.L450:
	lw	a5,24(sp)
	slli	a0,a5,3
	addi	a7,a5,1
	lui	a5,%hi(array1+8)
	addi	a5,a5,%lo(array1+8)
	add	a0,a0,a5
	lw	a5,96(sp)
	ble	a5,a7,.L458
	lw	t1,24(sp)
.L457:
	lw	a6,0(a0)
	lw	t3,4(a0)
	mv	a5,a0
	mv	a4,a7
	j	.L456
.L578:
	lw	a1,-4(a5)
	sw	a3,0(a5)
	addi	a4,a4,-1
	sw	a1,4(a5)
	addi	a5,a5,-8
	bge	t1,a4,.L577
.L456:
	lw	a3,-8(a5)
	mv	a2,a5
	bgt	a3,a6,.L578
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
	mv	s1,a4
	mv	s0,a5
	ble	a5,a4,.L454
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
	ble	a5,s1,.L454
	addi	s0,s0,1
	bne	s0,s4,.L579
.L461:
	mv	a1,s1
	sub	a0,a5,s0
	li	a4,512
	mv	a3,s3
	mv	a2,s0
	sw	s1,-64(s3)
	sub	s2,s0,a5
	sw	s0,-60(s3)
	call	Rotate.constprop.0
	addi	a5,s2,1
	add	s1,s1,a5
	ble	s0,s1,.L454
	beq	s0,s4,.L465
	mv	a5,s0
	j	.L453
.L465:
	mv	a1,s1
	sw	s1,-64(s3)
	li	a4,512
	mv	a3,s3
	mv	a2,s0
	li	a0,0
	addi	s1,s1,1
	sw	s0,-60(s3)
	call	Rotate.constprop.0
	bgt	s0,s1,.L465
.L454:
	lw	a5,84(sp)
	lw	a4,104(sp)
	addi	s3,sp,208
	mv	s0,a5
	ble	a4,a5,.L460
	lw	s1,100(sp)
	mv	s2,a4
	mv	s4,a5
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
	ble	a4,a5,.L466
	ble	s2,s4,.L460
	addi	s0,s0,-1
	bne	s1,s0,.L580
.L466:
	sub	s4,s4,s0
	mv	a0,s4
	addi	s4,s4,1
	mv	a2,s2
	sw	s2,-68(s3)
	li	a4,512
	mv	a3,s3
	mv	a1,s0
	sub	s2,s2,s4
	sw	s0,-72(s3)
	call	Rotate.constprop.0
	ble	s2,s0,.L460
	beq	s1,s0,.L551
	mv	s4,s0
	j	.L459
.L551:
	mv	s1,s2
.L470:
	mv	a2,s1
	sw	s1,-68(s3)
	li	a4,512
	mv	a3,s3
	mv	a1,s0
	li	a0,0
	addi	s1,s1,-1
	sw	s0,-72(s3)
	call	Rotate.constprop.0
	bgt	s1,s0,.L470
	addi	s5,s5,-1
	bne	s5,zero,.L488
.L569:
	li	t0,4096
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
	jr	ra
.L477:
	lw	a5,68(sp)
	addi	a3,a3,1
	add	a2,a4,a3
	bne	a5,a3,.L361
	j	.L574
.L478:
	lw	a5,68(sp)
	addi	a7,a7,1
	bne	a5,a7,.L362
.L572:
	lw	a5,92(sp)
	lw	a4,20(sp)
	mv	a2,a3
	slli	a5,a5,1
	addi	a5,a5,1
	add	a5,a5,a4
	sw	a5,96(sp)
	lw	a5,92(sp)
	li	a3,0
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
	j	.L351
.L573:
	bgt	s9,a5,.L376
	lw	a4,32(sp)
	lui	a3,%hi(array1-8)
	lw	a7,92(sp)
	addi	a3,a3,%lo(array1-8)
	slli	a4,a4,3
	add	a4,a3,a4
	li	a3,1
.L375:
	mv	a0,a1
	lw	a1,0(a4)
	bgt	a0,a1,.L374
	bge	a0,a1,.L373
.L374:
	beq	a7,a3,.L479
	addi	a3,a3,1
.L373:
	addi	a5,a5,-1
	addi	a4,a4,-8
	ble	s9,a5,.L375
	bne	s1,a3,.L376
.L582:
	add	a4,s1,a6
	sw	a4,60(sp)
	lw	a4,16(sp)
	mv	a3,s1
	sw	s1,52(sp)
	sub	a4,a4,s1
	sw	a4,24(sp)
	mv	a4,a5
	add	a5,s1,a6
	sw	a5,88(sp)
	lw	a5,24(sp)
	sw	a5,84(sp)
	lw	a5,16(sp)
	sw	a5,96(sp)
	j	.L351
.L480:
	lw	a5,68(sp)
	addi	a2,a2,1
	bne	a5,a2,.L376
	j	.L581
.L570:
	addi	s10,sp,208
	j	.L342
.L577:
	slli	a4,a4,3
	lw	a5,96(sp)
	add	a2,s11,a4
	sw	a6,0(a2)
	sw	t3,4(a2)
	addi	a7,a7,1
	addi	a0,a0,8
	bne	a5,a7,.L457
	j	.L458
.L479:
	addi	a3,a3,1
	bne	s1,a3,.L376
	j	.L582
.L352:
	addi	a2,a5,-1
	lw	a5,68(sp)
	li	a3,1
	bne	a5,a3,.L361
	sw	a2,12(sp)
	sw	a2,84(sp)
	addi	s10,sp,208
	sw	a5,52(sp)
	j	.L554
.L575:
	lw	a5,16(sp)
	sw	a3,52(sp)
	sw	a2,60(sp)
	add	a5,a5,a4
	addi	s10,sp,208
	sw	a5,84(sp)
	neg	a3,a4
	sw	a6,88(sp)
	sw	a6,96(sp)
	sw	a6,24(sp)
	sw	a4,12(sp)
	li	s1,0
	j	.L472
.L329:
	ebreak
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
	li	s2,400
.L585:
	lw	s3,0(s4)
	addi	s1,s5,%lo(array1)
	li	s0,0
.L584:
	mv	a0,s0
	li	a1,400
	jalr	s3
	sw	a0,0(s1)
	sw	s0,4(s1)
	addi	s0,s0,1
	addi	s1,s1,8
	bne	s0,s2,.L584
	call	WikiSort.constprop.0
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
	jr	ra
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
	ble	a0,zero,.L593
	sw	s3,76(sp)
	sw	s5,68(sp)
	sw	s6,64(sp)
	sw	s7,60(sp)
	sw	s8,56(sp)
	sw	s0,88(sp)
	sw	s1,84(sp)
	sw	s2,80(sp)
	sw	s4,72(sp)
	mv	s6,a0
	li	s7,0
	lui	s8,%hi(seed)
	lui	s5,%hi(array1)
	li	s3,400
.L594:
	sw	zero,%lo(seed)(s8)
	addi	s4,sp,12
.L595:
	lw	s2,0(s4)
	addi	s1,s5,%lo(array1)
	li	s0,0
.L596:
	mv	a0,s0
	li	a1,400
	jalr	s2
	sw	a0,0(s1)
	sw	s0,4(s1)
	addi	s0,s0,1
	addi	s1,s1,8
	bne	s0,s3,.L596
	call	WikiSort.constprop.0
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
	jr	ra
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
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
	.globl	Min
	.type	Min, @function
Min:
	ble	a0,a1,.L607
	mv	a0,a1
.L607:
	ret
	.size	Min, .-Min
	.align	2
	.globl	Max
	.type	Max, @function
Max:
	bge	a0,a1,.L609
	mv	a0,a1
.L609:
	ret
	.size	Max, .-Max
	.align	2
	.globl	Range_length
	.type	Range_length, @function
Range_length:
	addi	sp,sp,-16
	sub	a0,a1,a0
	addi	sp,sp,16
	jr	ra
	.size	Range_length, .-Range_length
	.align	2
	.globl	MakeRange
	.type	MakeRange, @function
MakeRange:
	addi	sp,sp,-16
	addi	sp,sp,16
	jr	ra
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
	ret
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
	mv	s1,a2
	mv	s4,a0
	mv	s7,a1
	mv	s5,a4
	bge	a2,s6,.L616
	sw	s3,44(sp)
	slli	s3,a1,3
	sw	s2,48(sp)
	sw	s0,56(sp)
	add	s3,a0,s3
	mv	s2,s6
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
	jalr	s5
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
	jalr	s5
	add	s1,s1,a0
.L615:
	lw	ra,60(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	lw	s6,32(sp)
	lw	s7,28(sp)
	mv	a0,s1
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
.L620:
	mv	s2,s0
	blt	s1,s2,.L618
	j	.L623
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
	mv	s1,a2
	mv	s4,a0
	mv	s7,a1
	mv	s5,a4
	bge	a2,s6,.L625
	sw	s3,44(sp)
	slli	s3,a1,3
	sw	s2,48(sp)
	sw	s0,56(sp)
	add	s3,a0,s3
	mv	s2,s6
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
	jalr	s5
	bne	a0,zero,.L631
	addi	s1,s0,1
	bgt	s2,s1,.L627
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
	jalr	s5
	seqz	a0,a0
	add	s1,s1,a0
.L624:
	lw	ra,60(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	lw	s6,32(sp)
	lw	s7,28(sp)
	mv	a0,s1
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
.L631:
	mv	s2,s0
	bgt	s2,s1,.L627
	j	.L634
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
	ble	a2,s6,.L635
	sw	s3,60(sp)
	sw	s5,52(sp)
	sw	s7,44(sp)
	sw	s8,40(sp)
	sw	s0,72(sp)
	sw	s1,68(sp)
	sw	s2,64(sp)
	mv	s3,a1
	mv	s8,a0
	mv	s7,a2
	mv	s5,a3
.L639:
	lw	a4,0(s4)
	lw	a5,4(s4)
	mv	s1,s4
	sw	a4,24(sp)
	sw	a5,28(sp)
	mv	s2,s6
	j	.L638
.L649:
	lw	a4,-8(s0)
	lw	a5,-4(s0)
	sw	a4,0(s0)
	sw	a5,4(s0)
	bge	s3,s2,.L648
.L638:
	mv	s0,s1
	lw	a0,24(sp)
	lw	a1,28(sp)
	lw	a2,-8(s1)
	lw	a3,-4(s1)
	addi	s1,s1,-8
	addi	s2,s2,-1
	jalr	s5
	mv	a5,s0
	bne	a0,zero,.L649
	lw	a3,24(sp)
	lw	a4,28(sp)
	addi	s6,s6,1
	sw	a3,0(a5)
	sw	a4,4(a5)
	addi	s4,s4,8
	bgt	s7,s6,.L639
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
	jr	ra
.L648:
	lw	a3,24(sp)
	lw	a4,28(sp)
	slli	s2,s2,3
	add	a5,s8,s2
	addi	s6,s6,1
	sw	a3,0(a5)
	sw	a4,4(a5)
	addi	s4,s4,8
	bgt	s7,s6,.L639
	j	.L650
	.size	InsertionSort, .-InsertionSort
	.align	2
	.globl	Reverse
	.type	Reverse, @function
Reverse:
	addi	sp,sp,-16
	sw	a1,8(sp)
	sw	a2,12(sp)
	sub	a4,a2,a1
	li	a5,1
	ble	a4,a5,.L651
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
	jr	ra
	.size	Reverse, .-Reverse
	.align	2
	.globl	BlockSwap
	.type	BlockSwap, @function
BlockSwap:
	ble	a3,zero,.L656
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
	ret
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
	li	a5,1
	ble	a1,a5,.L711
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
	li	a5,1
	ble	t5,a5,.L709
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
	li	a5,1
	ble	a4,a5,.L660
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
	jr	ra
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
	mv	a5,a4
	bne	a6,zero,.L669
	or	a6,a4,a7
	andi	a6,a6,3
	bne	a6,zero,.L669
	mv	a6,a7
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
	bleu	a5,a7,.L769
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
	mv	a3,a4
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
	j	.L660
.L765:
	add	t4,a3,a1
	sub	a1,t4,a2
	sub	t5,a3,t4
	blt	t5,a1,.L664
	j	.L766
.L767:
	slli	t5,t5,3
	beq	t5,zero,.L692
	slli	t4,t4,3
	addi	a7,t4,1
	add	a7,a0,a7
	sub	a7,a4,a7
	sltiu	a7,a7,3
	add	a5,a0,t4
	mv	a6,a4
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
	mv	a3,a2
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
	mv	a3,a2
	mv	a5,a4
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
	j	.L660
.L770:
	bleu	a5,a2,.L699
	beq	a1,zero,.L699
.L702:
	addi	a1,a1,-1
	add	a3,a2,a1
	lbu	a0,0(a3)
	add	a3,a5,a1
	sb	a0,0(a3)
	bne	a1,zero,.L702
	j	.L699
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
	j	.L679
.L703:
	add	a4,a4,t5
.L705:
	lbu	a3,0(a5)
	addi	a5,a5,1
	addi	a2,a2,1
	sb	a3,-1(a2)
	bne	a5,a4,.L705
	j	.L660
.L690:
	add	t1,a4,t5
.L693:
	lbu	a7,0(a5)
	addi	a6,a6,1
	addi	a5,a5,1
	sb	a7,-1(a6)
	bne	a6,t1,.L693
	j	.L692
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
	j	.L660
.L669:
	mv	a6,a7
	add	t3,a4,a1
.L672:
	lbu	t1,0(a6)
	addi	a5,a5,1
	addi	a6,a6,1
	sb	t1,-1(a5)
	bne	a5,t3,.L672
	j	.L671
.L768:
	add	a7,a0,a7
	j	.L671
.L697:
	mv	a3,a2
.L700:
	lbu	a0,0(a3)
	addi	a3,a3,1
	addi	a5,a5,1
	sb	a0,-1(a5)
	bne	a3,a1,.L700
	j	.L699
.L677:
	add	a6,a5,a6
.L680:
	lbu	t1,0(a5)
	addi	a5,a5,1
	addi	a7,a7,1
	sb	t1,-1(a7)
	bne	a5,a6,.L680
	j	.L679
	.size	Rotate, .-Rotate
	.align	2
	.globl	WikiMerge
	.type	WikiMerge, @function
WikiMerge:
	addi	sp,sp,-112
	sw	a2,44(sp)
	sw	a3,32(sp)
	mv	a2,a3
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
	sgt	a4,s9,zero
	sgt	a5,s5,zero
	sw	ra,108(sp)
	sw	s3,92(sp)
	sw	a6,28(sp)
	sw	a1,40(sp)
	lw	s1,112(sp)
	mv	s0,a0
	mv	s6,a7
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
	li	a4,6
	bleu	a5,a4,.L779
	addi	a3,s3,-1
	sub	a3,a3,s1
	sltiu	a3,a3,3
	mv	a5,s3
	mv	a4,s1
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
	bleu	a1,a5,.L771
	add	a4,s1,a5
	lbu	a4,0(a4)
	add	a5,s3,a5
	addi	a0,a0,2
	sb	a4,0(a5)
	bleu	a1,a0,.L771
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
	jr	ra
.L772:
	sw	a1,12(sp)
	bne	a5,zero,.L810
.L785:
	ble	s5,zero,.L771
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
	j	.L771
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
	jalr	s6
	bne	a0,zero,.L775
	lw	a5,0(s1)
	addi	s1,s1,8
	sw	a5,-8(s3)
	lw	a5,-4(s1)
	sw	a5,-4(s3)
	bne	s5,s1,.L774
	lw	s4,88(sp)
	j	.L771
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
	li	s3,0
	li	s4,0
	li	s1,0
	mv	s7,a1
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
	jalr	s6
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
	j	.L786
.L808:
	lw	s2,96(sp)
	lw	s4,88(sp)
	lw	s7,76(sp)
	lw	s8,72(sp)
	lw	s10,64(sp)
	lw	s11,60(sp)
	j	.L771
.L775:
	lw	a5,0(s4)
	addi	s4,s4,8
	sw	a5,-8(s3)
	lw	a5,-4(s4)
	sw	a5,-4(s3)
	bne	s0,s4,.L774
	lw	s4,88(sp)
	j	.L773
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
	j	.L785
.L779:
	add	a1,s1,a1
.L783:
	lbu	a5,0(s1)
	addi	s1,s1,1
	addi	s3,s3,1
	sb	a5,-1(s3)
	bne	s1,a1,.L783
	j	.L771
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
	li	a5,32
	addi	sp,sp,-2048
	addi	sp,sp,-2048
	mv	t1,a1
	mv	s9,a2
	ble	a1,a5,.L1127
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
	li	s1,0
	li	a1,0
	mv	s8,a0
	addi	s10,sp,240
	mv	s6,t1
	sw	a5,32(sp)
	srai	a5,s3,4
	div	t0,t1,a5
	lw	s4,32(sp)
	mv	s2,a5
	add	s1,s1,s4
	mv	s5,t0
	add	s0,s5,a1
	bgt	s2,s1,.L814
.L1128:
	addi	s0,s0,1
	mv	a2,s0
	mv	a3,s9
	mv	a0,s8
	sw	a1,-72(s10)
	sw	s0,-68(s10)
	call	InsertionSort
	ble	s6,s0,.L815
	sub	s1,s1,s2
.L816:
	mv	a1,s0
	add	s1,s1,s4
	add	s0,s5,a1
	ble	s2,s1,.L1128
.L814:
	mv	a3,s9
	mv	a2,s0
	mv	a0,s8
	sw	a1,-72(s10)
	sw	s0,-68(s10)
	call	InsertionSort
	bgt	s6,s0,.L816
.L815:
	li	a5,536870912
	addi	a5,a5,-1
	mv	t1,s6
	sw	a5,20(sp)
	li	s6,16
	mv	t0,s5
	ble	s3,s6,.L811
	mv	s11,s10
	sw	t1,64(sp)
.L818:
	li	a5,1073741824
	bge	t0,a5,.L1009
.L820:
	srai	a5,a5,2
	bgt	a5,t0,.L820
	beq	a5,zero,.L821
.L1009:
	mv	a3,t0
	li	s10,0
.L825:
	add	a4,s10,a5
	bgt	a4,a3,.L822
.L1129:
	slli	a2,a5,1
	add	s10,a2,s10
	srai	a5,a5,2
	srai	s10,s10,1
	beq	a5,zero,.L823
	sub	a3,a3,a4
	add	a4,s10,a5
	ble	a4,a3,.L1129
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
	li	s2,0
	li	s5,0
	sw	zero,28(sp)
	sw	zero,88(sp)
	sw	zero,104(sp)
	sw	t0,40(sp)
	sw	s6,96(sp)
	sw	zero,80(sp)
	sw	s3,100(sp)
	addi	a5,a1,1
	sw	a5,68(sp)
	mv	a5,s8
	sw	a1,92(sp)
	mv	s8,s11
	mv	s11,a5
.L995:
	lw	a5,32(sp)
	add	s5,s5,a5
	lw	a5,40(sp)
	add	a5,s2,a5
	sw	a5,8(sp)
	lw	a5,24(sp)
	bgt	a5,s5,.L826
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
	bgt	a5,s5,.L827
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
	jalr	s9
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
	jalr	s9
	beq	a0,zero,.L994
	lw	a5,8(sp)
	sub	s0,a5,s2
	li	a5,512
	ble	s0,a5,.L1131
	lw	a5,52(sp)
	sw	s6,44(sp)
	ble	a5,zero,.L1132
	rem	a1,s0,s10
	lw	a5,8(sp)
	add	a6,a1,s2
	addi	a3,a6,1
	ble	a5,a3,.L1133
.L896:
	mv	t3,a5
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
	bgt	t3,a3,.L900
.L901:
	lw	a5,44(sp)
	lw	a4,8(sp)
	sub	s1,a5,a4
	ble	s1,s10,.L897
	mv	s1,s10
.L897:
	lw	a5,8(sp)
	add	a0,s11,a2
	lw	a4,0(a0)
	add	s1,s1,a5
	lw	a5,4(a0)
	sw	a4,-96(s8)
	sw	a5,-92(s8)
	li	a5,512
	bgt	a1,a5,.L1134
	slli	a3,a1,3
	beq	a3,zero,.L1126
	lw	a5,4(sp)
	andi	a4,s11,3
	add	a5,s11,a5
	bne	a4,zero,.L904
	add	a3,a5,a3
	mv	a4,s8
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
	li	s0,0
	mv	s7,s0
	sw	a5,0(sp)
	mv	s0,a5
	mv	a5,s8
	sw	s5,72(sp)
	sw	s6,76(sp)
	mv	s8,s2
	sw	a6,4(sp)
	li	s4,0
	li	s3,0
	mv	s5,a6
	mv	s6,a6
	mv	s2,a5
.L903:
	ble	s4,s3,.L913
.L910:
	lw	a5,20(sp)
	lw	a2,-96(s2)
	lw	a3,-92(s2)
	add	a5,s4,a5
	slli	a5,a5,3
	add	a5,s11,a5
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	s9
	bne	a0,zero,.L913
.L911:
	mv	a2,s3
	mv	a4,s9
	mv	a3,s4
	mv	a1,s5
	mv	a0,s11
	sw	s3,-104(s2)
	sw	s4,-100(s2)
	call	BinaryFirst
	mv	s3,a0
	sub	t5,s4,a0
	add	t4,s10,s6
	ble	s10,zero,.L918
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
	mv	a7,s2
	sw	a3,8(a4)
	lw	a1,4(a5)
	lw	a3,12(a4)
	mv	a6,s9
	sw	a1,12(a4)
	lw	a4,4(sp)
	lw	a1,28(sp)
	sw	a2,0(a5)
	sw	a3,4(a5)
	mv	a2,s8
	mv	a5,s3
	mv	a3,a4
	mv	a0,s11
	sw	t4,12(sp)
	sw	t5,8(sp)
	sw	s8,-112(s2)
	sw	a4,-32(s2)
	sw	s3,-28(s2)
	sw	a4,-108(s2)
	call	WikiMerge.constprop.1.isra.0
	li	a5,512
	lw	t5,8(sp)
	lw	t4,12(sp)
	bgt	s10,a5,.L1135
	lw	a5,36(sp)
	beq	a5,zero,.L924
	slli	a5,s6,3
	andi	a4,s11,3
	add	a5,s11,a5
	bne	a4,zero,.L922
	lw	a4,36(sp)
	add	a2,a5,a4
	mv	a4,s2
.L923:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a2,a5,.L923
.L924:
	ble	t5,zero,.L921
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
	ble	s0,s3,.L1021
	mv	s6,t4
.L933:
	slli	a4,s5,3
	slli	a5,s3,3
	add	a4,s11,a4
	add	a5,s11,a5
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	s9
	beq	a0,zero,.L932
	mv	s5,s3
.L932:
	add	s3,s3,s10
	bgt	s0,s3,.L933
	mv	t4,s6
	addi	s5,s5,-1
.L931:
	slli	a5,s5,3
	add	a5,s11,a5
	lw	a4,0(a5)
	lw	a5,4(a5)
	lw	s3,4(sp)
	sw	a4,-96(s2)
	sw	a5,-92(s2)
	mv	s6,t4
	bgt	s4,s3,.L910
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
	bgt	a2,a1,.L941
.L940:
	li	a5,1
	ble	a2,a5,.L987
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
	li	a5,1
	ble	a1,a5,.L985
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
	li	a5,1
	ble	a3,a5,.L952
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
	mv	s3,s6
	lw	s1,0(sp)
	add	s0,s0,a4
	add	s5,s5,a4
	mv	s6,s4
	j	.L903
.L1024:
	mv	a3,a5
	mv	a1,a4
.L941:
	bgt	a1,zero,.L940
	slli	a1,a1,3
	beq	a1,zero,.L968
	slli	a5,a3,3
	andi	a3,s11,3
	add	a5,s11,a5
	bne	a3,zero,.L966
	add	t4,a5,a1
	mv	a3,s2
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
	mv	a0,a5
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
	mv	a3,s2
.L980:
	lw	a2,0(a3)
	addi	a5,a5,4
	addi	a3,a3,4
	sw	a2,-4(a5)
	bne	a5,a1,.L980
	mv	s3,s6
	lw	s1,0(sp)
	add	s0,s0,a4
	add	s5,s5,a4
	mv	s6,s4
	j	.L903
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
	j	.L924
.L1130:
	sub	a1,a5,s2
	mv	a2,s2
	mv	a4,s8
	mv	a3,s6
	mv	a0,s11
	sw	s2,-64(s8)
	sw	s6,-60(s8)
	call	Rotate.constprop.1
.L994:
	lw	a5,64(sp)
	bge	s6,a5,.L1139
.L1026:
	mv	s2,s6
	j	.L995
.L1137:
	ble	s10,zero,.L1140
	mv	a4,a5
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
	mv	s4,t4
	bne	s5,s6,.L937
	mv	s5,s0
.L937:
	lw	a5,0(sp)
	add	s1,s1,s10
	add	s0,s0,s10
	add	a5,a5,s10
	sw	a5,0(sp)
	lw	a5,44(sp)
	ble	s1,a5,.L993
	mv	s1,a5
.L993:
	mv	s3,s6
	mv	s6,t4
	j	.L903
.L939:
	sub	a2,a5,s6
	blt	a4,a2,.L1024
	bgt	a2,zero,.L1025
	slli	a2,a2,3
	slli	a1,s6,3
	beq	a2,zero,.L1141
	andi	a5,s11,3
	add	a1,s11,a1
	bne	a5,zero,.L945
	mv	a3,s2
	mv	a5,a1
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
	bleu	a5,a1,.L1142
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
	mv	a3,s2
.L960:
	lw	a1,0(a3)
	addi	a5,a5,4
	addi	a3,a3,4
	sw	a1,-4(a5)
	bne	a5,a2,.L960
	mv	s3,s6
	lw	s1,0(sp)
	add	s0,s0,a4
	add	s5,s5,a4
	mv	s6,s4
	j	.L903
.L1136:
	mv	a4,a5
	mv	a5,s2
	lw	a1,28(sp)
	mv	s2,s8
	mv	s8,a5
	lw	a5,44(sp)
	mv	a2,s2
	mv	a7,s8
	mv	a6,s9
	mv	a3,a4
	mv	a0,s11
	sw	a5,-20(s8)
	lw	s5,72(sp)
	lw	s6,76(sp)
	sw	s2,-112(s8)
	sw	a4,-24(s8)
	sw	a4,-108(s8)
	call	WikiMerge.constprop.1.isra.0
	lw	a5,64(sp)
	blt	s6,a5,.L1026
.L1139:
	mv	a5,s11
	mv	s11,s8
	mv	s8,a5
	lw	a5,52(sp)
	lw	t0,40(sp)
	lw	s6,96(sp)
	lw	t2,80(sp)
	lw	s3,100(sp)
	bgt	a5,zero,.L996
.L1001:
	lw	a5,32(sp)
	slli	t0,t0,1
	slli	a5,a5,1
	sw	a5,32(sp)
	lw	a4,32(sp)
	lw	a5,24(sp)
	bgt	a5,a4,.L998
	mv	a5,a4
	lw	a4,24(sp)
	addi	t0,t0,1
	sub	a5,a5,a4
	sw	a5,32(sp)
.L998:
	slli	s6,s6,1
	blt	s6,s3,.L818
.L811:
	li	t0,4096
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
	jr	ra
.L1021:
	mv	s5,t4
	j	.L931
.L922:
	lw	a3,36(sp)
	mv	a4,s2
	add	a2,s2,a3
.L925:
	lbu	a3,0(a5)
	addi	a4,a4,1
	addi	a5,a5,1
	sb	a3,-1(a4)
	bne	a2,a4,.L925
	j	.L924
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
	j	.L906
.L1132:
	lw	a5,8(sp)
	addi	s7,s2,1
	bge	s7,a5,.L839
	sw	s2,12(sp)
	mv	s2,s7
	mv	s7,s0
	lw	s0,92(sp)
	li	s3,1
	mv	s4,a5
	sw	s5,44(sp)
.L844:
	mv	s5,s1
	lw	a0,0(s5)
	lw	a1,4(s5)
	lw	a2,8(s1)
	lw	a3,12(s1)
	addi	s1,s1,8
	jalr	s9
	bne	a0,zero,.L843
	lw	a2,0(s5)
	lw	a3,4(s5)
	lw	a0,0(s1)
	lw	a1,4(s1)
	jalr	s9
	beq	a0,zero,.L842
.L843:
	addi	a3,s3,1
	beq	s0,s3,.L841
	mv	s3,a3
.L842:
	addi	s2,s2,1
	bne	s2,s4,.L844
	lw	a5,68(sp)
	li	a4,512
	mv	s0,s7
	lw	s5,44(sp)
	mv	s7,s2
	mv	a3,s3
	lw	s2,12(sp)
	bgt	a5,a4,.L1013
	bne	s3,a5,.L852
.L849:
	lw	a5,68(sp)
	lw	a1,68(sp)
	sw	s6,80(sp)
	add	a5,a5,s2
	sw	a5,56(sp)
	lw	a4,56(sp)
	lw	a5,8(sp)
	mv	s4,s6
	sw	a4,84(sp)
	sub	s0,a5,a4
	slli	a5,a4,3
	sw	a5,4(sp)
	sw	s2,28(sp)
	sw	s2,88(sp)
	li	a3,0
.L853:
	slli	s3,s7,3
	sw	s5,12(sp)
	sw	s0,16(sp)
	add	s5,s11,s3
	sw	s4,0(sp)
	li	s0,0
	mv	s1,a1
	sw	a3,44(sp)
	mv	s3,s7
.L890:
	addi	s4,s5,-8
	beq	s3,s2,.L889
	lw	a1,4(s4)
	lw	a2,0(s5)
	lw	a3,4(s5)
	lw	a0,-8(s5)
	jalr	s9
	bne	a0,zero,.L889
	lw	a2,-8(s5)
	lw	a3,4(s4)
	lw	a0,0(s5)
	lw	a1,4(s5)
	jalr	s9
	beq	a0,zero,.L888
.L889:
	addi	a3,s7,1
	addi	a2,s3,1
	neg	a1,s0
	mv	a4,s8
	mv	a0,s11
	sw	a3,-44(s8)
	sw	a2,-48(s8)
	add	s7,s3,s0
	call	Rotate.constprop.1
	addi	s0,s0,1
.L888:
	addi	s3,s3,-1
	mv	s5,s4
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
	ble	a3,zero,.L895
.L860:
	slli	s3,s4,3
	sw	s2,0(sp)
	sw	s5,12(sp)
	sw	s0,44(sp)
	add	s5,s11,s3
	li	s0,0
	mv	s2,s4
	mv	s3,a3
	mv	s7,a5
.L894:
	addi	s1,s5,8
	beq	s2,s7,.L893
	lw	a3,4(s1)
	lw	a2,8(s5)
	lw	a0,0(s5)
	lw	a1,4(s5)
	jalr	s9
	bne	a0,zero,.L893
	lw	a2,0(s5)
	lw	a3,4(s5)
	lw	a0,8(s5)
	lw	a1,4(s1)
	jalr	s9
	beq	a0,zero,.L892
.L893:
	mv	a2,s4
	mv	a1,s0
	mv	a4,s8
	mv	a3,s2
	mv	a0,s11
	sw	s4,-40(s8)
	sw	s2,-36(s8)
	sub	s4,s2,s0
	call	Rotate.constprop.1
	addi	s0,s0,1
.L892:
	addi	s2,s2,1
	mv	s5,s1
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
	bgt	a5,a3,.L896
.L1133:
	slli	a2,a6,3
	j	.L901
.L1140:
	add	t4,s10,s6
	j	.L992
.L1138:
	bleu	a3,a5,.L975
	beq	a2,zero,.L975
.L978:
	addi	a2,a2,-1
	add	a0,a5,a2
	lbu	a6,0(a0)
	add	a0,a3,a2
	sb	a6,0(a0)
	bne	a2,zero,.L978
	j	.L975
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
	j	.L955
.L1131:
	slli	a3,s0,3
	beq	a3,zero,.L835
	andi	a5,s1,3
	bne	a5,zero,.L833
	add	a3,s1,a3
	mv	a5,s8
.L834:
	lw	a4,0(s1)
	addi	s1,s1,4
	addi	a5,a5,4
	sw	a4,-4(a5)
	bne	s1,a3,.L834
.L835:
	lw	a4,8(sp)
	mv	a2,s2
	mv	a7,s8
	mv	a6,s9
	mv	a3,a4
	mv	a5,s6
	li	a1,0
	mv	a0,s11
	sw	s2,-88(s8)
	sw	a4,-84(s8)
	sw	a4,-80(s8)
	sw	s6,-76(s8)
	call	WikiMerge.constprop.1.isra.0
	j	.L994
.L841:
	lw	a5,68(sp)
	li	a4,512
	mv	s0,s7
	lw	s5,44(sp)
	mv	s7,s2
	lw	s2,12(sp)
	ble	a5,a4,.L849
	lw	a5,8(sp)
	addi	s3,s7,1
	ble	a5,s3,.L1013
	slli	s1,s7,3
	sw	s0,60(sp)
	lw	s0,92(sp)
	sw	s2,12(sp)
	mv	s2,a5
	add	a5,s11,s1
	li	s4,0
	mv	s1,s3
	sw	s5,44(sp)
	sw	a3,72(sp)
	mv	s3,a5
.L866:
	mv	s5,s3
	lw	a0,0(s5)
	lw	a1,4(s5)
	lw	a2,8(s3)
	lw	a3,12(s3)
	addi	s3,s3,8
	jalr	s9
	bne	a0,zero,.L865
	lw	a2,0(s5)
	lw	a3,4(s5)
	lw	a0,0(s3)
	lw	a1,4(s3)
	jalr	s9
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
	mv	s3,s1
	beq	s4,a5,.L1143
.L1013:
	lw	a5,68(sp)
	beq	a5,a3,.L1144
.L847:
	lw	a5,8(sp)
	addi	s7,s6,-2
	blt	s7,a5,.L875
	mv	s4,a5
	lw	a5,0(sp)
	sw	s2,0(sp)
	mv	s2,s7
	mv	s7,s0
	lw	s0,92(sp)
	add	s3,s11,a5
	addi	s3,s3,-8
	li	s1,1
	sw	s5,12(sp)
.L879:
	lw	a3,12(s3)
	lw	a2,8(s3)
	lw	a0,0(s3)
	lw	a1,4(s3)
	jalr	s9
	bne	a0,zero,.L878
	lw	a1,12(s3)
	lw	a2,0(s3)
	lw	a3,4(s3)
	lw	a0,8(s3)
	jalr	s9
	beq	a0,zero,.L877
.L878:
	beq	s0,s1,.L1110
	addi	s1,s1,1
.L877:
	addi	s2,s2,-1
	addi	s3,s3,-8
	bge	s2,s4,.L879
.L1110:
	mv	s0,s7
	lw	s5,12(sp)
	mv	s7,s2
	lw	s2,0(sp)
.L875:
	lw	a5,8(sp)
	addi	s4,s7,-1
	blt	s4,a5,.L1111
	sw	s0,12(sp)
	lw	s0,92(sp)
	mv	s3,a5
	slli	a5,s7,3
	sw	s2,0(sp)
	add	s1,s11,a5
	li	s7,0
	mv	s2,s4
.L884:
	mv	s4,s1
	lw	a2,0(s4)
	lw	a3,4(s4)
	lw	a0,-8(s1)
	lw	a1,-4(s1)
	addi	s1,s1,-8
	jalr	s9
	bne	a0,zero,.L883
	lw	a2,0(s1)
	lw	a3,4(s1)
	lw	a0,0(s4)
	lw	a1,4(s4)
	jalr	s9
	beq	a0,zero,.L882
.L883:
	beq	s0,s7,.L1020
	addi	s7,s7,1
.L882:
	addi	s2,s2,-1
	bge	s2,s3,.L884
	mv	s4,s2
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
	j	.L860
.L1025:
	mv	a3,a5
	mv	a1,a4
	j	.L940
.L979:
	add	a1,s2,a1
	mv	a3,s2
.L981:
	lbu	a2,0(a3)
	addi	a3,a3,1
	addi	a5,a5,1
	sb	a2,-1(a5)
	bne	a1,a3,.L981
	mv	s3,s6
	lw	s1,0(sp)
	add	s0,s0,a4
	add	s5,s5,a4
	mv	s6,s4
	j	.L903
.L996:
	lw	a5,28(sp)
	mv	a3,s9
	mv	a0,s8
	mv	a1,a5
	sw	a5,-120(s11)
	lw	a5,88(sp)
	sw	t0,4(sp)
	sw	t2,0(sp)
	mv	a2,a5
	sw	a5,-116(s11)
	call	InsertionSort
	lw	a5,84(sp)
	lw	a4,104(sp)
	lw	t2,0(sp)
	lw	t0,4(sp)
	mv	s1,a4
	mv	s0,a5
	mv	s2,a5
	mv	s5,t0
	mv	s4,t2
	ble	a5,a4,.L1003
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
	jalr	s9
	beq	a0,zero,.L1002
	ble	s2,s1,.L1117
	addi	s0,s0,1
	bne	s4,s0,.L1145
.L1002:
	sub	a1,s2,s0
	sub	s2,s0,s2
	addi	s2,s2,1
	mv	a2,s1
	sw	s1,-16(s11)
	mv	a4,s11
	mv	a3,s0
	mv	a0,s8
	add	s1,s1,s2
	sw	s0,-12(s11)
	call	Rotate.constprop.1
	ble	s0,s1,.L1117
	beq	s4,s0,.L1118
	mv	s2,s0
	j	.L999
.L1117:
	mv	t0,s5
	mv	t2,s4
.L1003:
	lw	a5,108(sp)
	mv	s0,t2
	ble	a5,t2,.L1001
	lw	s4,104(sp)
	lw	s2,20(sp)
	mv	s1,a5
	mv	s5,t0
	mv	s7,t2
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
	jalr	s9
	beq	a0,zero,.L1006
	ble	s1,s0,.L1120
	addi	s7,s7,-1
	bne	s4,s7,.L1146
.L1006:
	sub	s0,s0,s7
	mv	a1,s0
	addi	s0,s0,1
	mv	a3,s1
	sw	s1,-4(s11)
	mv	a4,s11
	mv	a2,s7
	mv	a0,s8
	sub	s1,s1,s0
	sw	s7,-8(s11)
	call	Rotate.constprop.1
	ble	s1,s7,.L1120
	beq	s4,s7,.L1121
	mv	s0,s7
	j	.L1000
.L1118:
	mv	s2,s5
.L1005:
	mv	a2,s1
	sw	s1,-16(s11)
	mv	a4,s11
	mv	a3,s0
	li	a1,0
	mv	a0,s8
	addi	s1,s1,1
	sw	s0,-12(s11)
	call	Rotate.constprop.1
	bgt	s0,s1,.L1005
	mv	t0,s2
	mv	t2,s4
	j	.L1003
.L1121:
	mv	s0,s1
	mv	s2,s5
	mv	s1,s7
.L1008:
	mv	a3,s0
	sw	s0,-4(s11)
	mv	a4,s11
	mv	a2,s1
	li	a1,0
	mv	a0,s8
	addi	s0,s0,-1
	sw	s1,-8(s11)
	call	Rotate.constprop.1
	bgt	s0,s1,.L1008
	mv	t0,s2
	j	.L1001
.L945:
	mv	a3,a1
	mv	a5,s2
	add	t4,s2,a2
.L948:
	lbu	a0,0(a3)
	addi	a5,a5,1
	addi	a3,a3,1
	sb	a0,-1(a5)
	bne	a5,t4,.L948
	j	.L947
.L966:
	mv	a3,s2
	add	t4,s2,a1
.L969:
	lbu	a0,0(a5)
	addi	a3,a3,1
	addi	a5,a5,1
	sb	a0,-1(a3)
	bne	t4,a3,.L969
	j	.L968
.L959:
	slli	a3,s4,3
	add	a2,s2,a2
	add	a3,s11,a3
	mv	a5,s2
.L961:
	lbu	a1,0(a5)
	addi	a5,a5,1
	addi	a3,a3,1
	sb	a1,-1(a3)
	bne	a5,a2,.L961
	mv	s3,s6
	lw	s1,0(sp)
	add	s0,s0,a4
	add	s5,s5,a4
	mv	s6,s4
	j	.L903
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
	li	s3,1
	mv	s2,s4
.L859:
	lw	a3,12(s1)
	lw	a2,8(s1)
	lw	a0,0(s1)
	lw	a1,4(s1)
	jalr	s9
	bne	a0,zero,.L858
	lw	a1,12(s1)
	lw	a2,0(s1)
	lw	a3,4(s1)
	lw	a0,8(s1)
	jalr	s9
	beq	a0,zero,.L857
.L858:
	beq	s0,s3,.L1016
	addi	s3,s3,1
.L857:
	addi	s2,s2,-1
	addi	s1,s1,-8
	bge	s2,s7,.L859
	lw	a5,68(sp)
	mv	s4,s2
	lw	s0,12(sp)
	lw	s2,0(sp)
	beq	s3,a5,.L1147
.L851:
	lw	a5,68(sp)
	ble	a5,s3,.L1148
.L1123:
	lw	s0,8(sp)
.L874:
	ble	s6,s0,.L994
	mv	a1,s2
	mv	a4,s9
	mv	a2,s0
	mv	a3,s6
	mv	a0,s11
	sw	s0,-80(s8)
	sw	s6,-76(s8)
	call	BinaryFirst
	mv	s1,a0
	mv	a2,s2
	sub	a1,s0,a0
	mv	a4,s8
	mv	a0,s11
	mv	a3,s1
	sw	s2,-56(s8)
	sw	s1,-52(s8)
	sub	s3,s1,s0
	call	Rotate.constprop.1
	add	a1,s3,s2
	mv	a2,s2
	mv	a3,s0
	mv	a4,s9
	mv	a0,s11
	sw	s2,-88(s8)
	sw	s0,-84(s8)
	call	BinaryLast
	mv	s2,a0
	ble	s1,a0,.L994
	mv	s0,s1
	j	.L874
.L904:
	add	a3,s8,a3
	mv	a4,s8
.L907:
	lbu	a2,0(a5)
	addi	a4,a4,1
	addi	a5,a5,1
	sb	a2,-1(a4)
	bne	a4,a3,.L907
	j	.L1126
.L1120:
	mv	t0,s5
	j	.L1001
.L1141:
	add	a1,s11,a1
	j	.L947
.L953:
	add	a3,a5,a3
.L956:
	lbu	a0,0(a5)
	addi	a5,a5,1
	addi	a1,a1,1
	sb	a0,-1(a1)
	bne	a5,a3,.L956
	j	.L955
.L973:
	add	a2,a2,a5
	mv	a0,a5
.L976:
	lbu	a6,0(a0)
	addi	a0,a0,1
	addi	a3,a3,1
	sb	a6,-1(a3)
	bne	a2,a0,.L976
	j	.L975
.L1016:
	lw	a5,68(sp)
	addi	s3,s3,1
	mv	s4,s2
	lw	s0,12(sp)
	lw	s2,0(sp)
	bne	s3,a5,.L851
.L1147:
	sub	a5,s6,a5
	sw	a5,16(sp)
	sw	a5,80(sp)
	sw	s3,52(sp)
	mv	a3,s3
	sw	s2,84(sp)
	sw	s2,28(sp)
	sw	s6,56(sp)
	sw	s2,88(sp)
	addi	a5,s6,-1
	j	.L860
.L1018:
	lw	a5,68(sp)
	addi	s4,s4,1
	lw	s2,12(sp)
	lw	s5,44(sp)
	lw	s0,60(sp)
	lw	a3,72(sp)
	mv	s3,s1
	bne	s4,a5,.L1013
.L1143:
	slli	a1,a5,1
	add	a5,a1,s2
	sw	a5,88(sp)
	add	a5,s4,s2
	sw	a5,28(sp)
	lw	a5,8(sp)
	add	a4,a1,s2
	mv	s7,s3
	sub	s0,a5,a4
	slli	a5,a4,3
	sw	a5,4(sp)
	lw	a5,28(sp)
	sw	a4,84(sp)
	sw	s6,80(sp)
	sw	a5,56(sp)
	mv	s4,s6
	li	a3,0
	j	.L853
.L833:
	add	a3,s8,a3
	mv	a5,s8
.L836:
	lbu	a4,0(s1)
	addi	a5,a5,1
	addi	s1,s1,1
	sb	a4,-1(a5)
	bne	a3,a5,.L836
	j	.L835
.L1020:
	mv	s4,s2
	lw	s0,12(sp)
	lw	s2,0(sp)
	addi	s7,s7,1
	j	.L881
.L1144:
	lw	a4,8(sp)
	addi	a5,s6,-2
	bgt	a4,a5,.L1108
	lw	a4,0(sp)
	mv	s0,a5
	sw	s2,0(sp)
	add	s1,s11,a4
	lw	a4,8(sp)
	addi	s1,s1,-8
	li	s2,1
	addi	s4,a4,-1
.L872:
	lw	a3,12(s1)
	lw	a2,8(s1)
	lw	a0,0(s1)
	lw	a1,4(s1)
	jalr	s9
	bne	a0,zero,.L871
	lw	a1,12(s1)
	lw	a2,0(s1)
	lw	a3,4(s1)
	lw	a0,8(s1)
	jalr	s9
	beq	a0,zero,.L870
.L871:
	lw	a5,92(sp)
	beq	a5,s2,.L1019
	addi	s2,s2,1
.L870:
	addi	s0,s0,-1
	addi	s1,s1,-8
	bne	s0,s4,.L872
	mv	s3,s2
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
	mv	a1,s3
	sub	s0,a5,a4
	slli	a5,a4,3
	sw	a5,4(sp)
	lw	a5,80(sp)
	mv	a3,s3
	sw	s6,88(sp)
	sw	a5,28(sp)
	j	.L853
.L839:
	lw	a5,68(sp)
	li	a4,512
	bgt	a5,a4,.L847
	li	a3,1
	beq	a5,a3,.L849
	lw	a5,8(sp)
	addi	s4,s6,-2
	mv	s3,a3
	ble	a5,s4,.L850
	j	.L851
.L1127:
	mv	a3,a2
	mv	a2,a1
	li	a1,0
	sw	zero,240(sp)
	sw	t1,244(sp)
	call	InsertionSort
	j	.L811
.L1019:
	addi	s3,s2,1
	mv	s4,s0
	lw	s2,0(sp)
	j	.L869
.L854:
	lw	a5,68(sp)
	li	s3,1
	bne	a5,s3,.L851
	mv	a4,a5
	addi	a5,s6,-1
	sw	a5,16(sp)
	sw	a5,80(sp)
	sw	a4,52(sp)
	mv	a3,a4
	sw	s2,84(sp)
	sw	s2,28(sp)
	sw	s6,56(sp)
	sw	s2,88(sp)
	j	.L860
.L1111:
	mv	s0,a5
	j	.L874
.L1148:
	add	a5,s4,s3
	sw	a5,56(sp)
	add	a5,s6,s4
	sw	s3,52(sp)
	neg	a3,s4
	sw	a5,80(sp)
	sw	s2,84(sp)
	sw	s4,16(sp)
	sw	s2,28(sp)
	sw	s2,88(sp)
	j	.L1010
.L1108:
	mv	s0,a4
	j	.L874
.L821:
	ebreak
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
	mv	a4,sp
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
	mv	a4,sp
.L1152:
	lbu	a2,0(a5)
	lbu	a3,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a2,a3,.L1153
	bne	a1,a5,.L1152
	addi	sp,sp,2032
	li	a0,1
	addi	sp,sp,1168
	jr	ra
.L1153:
	addi	sp,sp,2032
	li	a0,0
	addi	sp,sp,1168
	jr	ra
	.size	verify_benchmark, .-verify_benchmark
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
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	call	benchmark_body.constprop.0.isra.0
	call	benchmark
	sw	zero,12(sp)
	lw	a0,12(sp)
	call	verify_benchmark
	lw	ra,28(sp)
	xori	a0,a0,1
	addi	sp,sp,32
	jr	ra
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
