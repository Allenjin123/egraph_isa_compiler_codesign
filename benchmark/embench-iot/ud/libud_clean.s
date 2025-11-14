	.file	"libud.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	ludcmp.constprop.0.isra.0, @function
ludcmp.constprop.0.isra.0:
	lui	a1,%hi(.LANCHOR0)
	addi	a1,a1,%lo(.LANCHOR0)
	addi	sp,sp,-48
	sw	s7,16(sp)
	lw	t6,0(a1)
	lw	a2,80(a1)
	lw	s7,400(a1)
	lw	a3,160(a1)
	div	a2,a2,t6
	lw	a4,240(a1)
	lw	a5,320(a1)
	lw	t0,4(a1)
	sw	s0,44(sp)
	sw	s1,40(sp)
	sw	s2,36(sp)
	sw	s3,32(sp)
	sw	s4,28(sp)
	sw	s5,24(sp)
	sw	s6,20(sp)
	sw	s8,12(sp)
	sw	s9,8(sp)
	lw	s6,84(a1)
	lw	s0,8(a1)
	lw	s1,12(a1)
	lw	s2,16(a1)
	lw	t2,20(a1)
	lw	s5,88(a1)
	lw	s4,92(a1)
	lw	a6,96(a1)
	lw	a0,100(a1)
	addi	a7, zero, 1
	addi	t3, a7, 0
	addi	t5, zero, 6
	addi	s3, zero, 5
	addi	t1, zero, 2
	addi	t4, zero, 3
	div	s7,s7,t6
	sw	a2,80(a1)
	div	a3,a3,t6
	sw	s7,400(a1)
	div	a4,a4,t6
	sw	a3,160(a1)
	addi	a3, a1, 0
	div	a5,a5,t6
	sw	a4,240(a1)
	addi	a4, a1, 0
	mul	s7,t0,a2
	sw	a5,320(a1)
	addi	a5, a1, 0
	sub	s6,s6,s7
	sw	s6,84(a1)
	mul	s6,s0,a2
	sub	s5,s5,s6
	sw	s5,88(a1)
	mul	s5,s1,a2
	sub	s4,s4,s5
	sw	s4,92(a1)
	mul	s4,s2,a2
	mul	a2,t2,a2
	sub	a6,a6,s4
	sw	a6,96(a1)
	sub	a2,a0,a2
	sw	a2,100(a1)
.L18:
	lw	a6,4(a4)
	lw	s4,160(a5)
	lw	a2,164(a3)
	addi	a0, a7, 0
	mul	s4,a6,s4
	sub	a2,a2,s4
	bge	t3, a7, .L37
.L2:
	lw	s4,164(a5)
	lw	s5,84(a4)
	mul	s4,s4,s5
	sub	a2,a2,s4
	beq	a0,t1,.L38
.L5:
	lw	s4,168(a5)
	lw	s5,164(a4)
	mul	s4,s4,s5
	sub	a2,a2,s4
	beq	a0,t4,.L39
	lw	s6,172(a5)
	lw	s7,244(a4)
	lw	s5,84(a3)
	addi	s4,a7,2
	mul	s6,s6,s7
	sub	a2,a2,s6
	div	a2,a2,s5
	sw	a2,164(a3)
	beq	s4,t5,.L40
.L6:
	lw	s7,240(a5)
	lw	s6,244(a5)
	lw	s8,84(a4)
	mul	s7,a6,s7
	lw	a2,244(a3)
	mul	s6,s6,s8
	sub	a2,a2,s7
	sub	a2,a2,s6
	beq	a0,t1,.L34
	lw	s6,248(a5)
	lw	s7,164(a4)
	mul	s6,s6,s7
	sub	a2,a2,s6
	beq	a0,t4,.L9
	lw	s6,252(a5)
	lw	s7,244(a4)
	mul	s6,s6,s7
	sub	a2,a2,s6
.L34:
	div	a2,a2,s5
	sw	a2,244(a3)
	lw	s7,320(a5)
	lw	s6,324(a5)
	lw	s8,84(a4)
	mul	s7,a6,s7
	lw	a2,324(a3)
	mul	s6,s6,s8
	sub	a2,a2,s7
	sub	a2,a2,s6
	beq	a0,t1,.L41
	lw	s8,328(a5)
	lw	s6,164(a4)
	lw	s7,332(a5)
	mul	s6,s6,s8
	lw	s8,244(a4)
	mul	s7,s7,s8
	sub	s6,a2,s6
	lw	a2,168(a3)
	sub	s6,s6,s7
	div	s6,s6,s5
	sw	s6,324(a3)
	lw	s6,400(a5)
	lw	s8,84(a4)
	lw	s7,404(a5)
	mul	s6,a6,s6
	lw	s9,164(a4)
	mul	s7,s7,s8
	lw	s8,404(a3)
	sub	s6,s8,s6
	lw	s8,408(a5)
	sub	s6,s6,s7
	mul	s8,s8,s9
	lw	s7,244(a4)
	lw	s9,412(a5)
	mul	s7,s7,s9
	sub	s6,s6,s8
	sub	s6,s6,s7
	div	s6,s6,s5
	sw	s6,404(a3)
	lw	s7,480(a5)
	lw	s6,484(a5)
	lw	s8,164(a4)
	mul	a6,a6,s7
	lw	s7,84(a4)
	mul	s6,s6,s7
	lw	s7,484(a3)
	sub	a6,s7,a6
	lw	s7,488(a5)
	sub	a6,a6,s6
	mul	s7,s7,s8
	lw	s6,244(a4)
	lw	s8,492(a5)
	mul	s6,s6,s8
	sub	a6,a6,s7
	sub	a6,a6,s6
	div	a6,a6,s5
	sw	a6,484(a3)
	lw	a6,160(a5)
	lw	s6,8(a4)
	lw	s5,88(a4)
	lw	s8,164(a5)
	mul	s6,s6,a6
	lw	s7,168(a5)
	lw	a6,168(a4)
	mul	s5,s5,s8
	sub	a2,a2,s6
	mul	a6,a6,s7
	sub	a2,a2,s5
	sub	a2,a2,a6
.L11:
	lw	a6,172(a5)
	lw	s5,248(a4)
	mul	a6,a6,s5
	sub	a2,a2,a6
	beq	a0,t4,.L12
	lw	a6,176(a5)
	lw	s5,328(a4)
	mul	a6,a6,s5
	sub	a2,a2,a6
.L12:
	sw	a2,168(a3)
	beq	s4,t5,.L17
.L23:
	lw	a2,160(a5)
	lw	s4,12(a4)
	lw	a6,164(a5)
	lw	s5,92(a4)
	mul	s4,s4,a2
	lw	a2,172(a3)
	mul	a6,a6,s5
	sub	a2,a2,s4
	sub	a2,a2,a6
	beq	a0,t3,.L13
	lw	a6,168(a5)
	lw	s4,172(a4)
	mul	a6,a6,s4
	sub	a2,a2,a6
	beq	a0,t1,.L13
	lw	a6,172(a5)
	lw	s4,252(a4)
	mul	a6,a6,s4
	sub	a2,a2,a6
	beq	a0,t4,.L14
	lw	a6,332(a4)
	lw	s4,176(a5)
	mul	a6,a6,s4
	sub	a2,a2,a6
.L13:
	sw	a2,172(a3)
	lw	a2,160(a5)
	lw	s4,16(a4)
	lw	a6,164(a5)
	lw	s5,96(a4)
	mul	s4,s4,a2
	lw	a2,176(a3)
	mul	a6,a6,s5
	sub	a2,a2,s4
	sub	a2,a2,a6
	beq	a0,t3,.L16
	lw	a6,168(a5)
	lw	s4,176(a4)
	mul	a6,a6,s4
	sub	a2,a2,a6
	beq	a0,t1,.L15
	lw	s5,256(a4)
	lw	s4,172(a5)
	lw	a6,176(a5)
	mul	s4,s4,s5
	lw	s5,336(a4)
	mul	a6,a6,s5
	sub	a2,a2,s4
	sub	a2,a2,a6
.L16:
	sw	a2,176(a3)
	lw	a2,160(a5)
	lw	s4,20(a4)
	lw	a6,164(a5)
	lw	s5,100(a4)
	mul	s4,s4,a2
	lw	a2,180(a3)
	mul	a6,a6,s5
	sub	a2,a2,s4
	sub	a2,a2,a6
	beq	a0,t3,.L42
	lw	s4,180(a4)
	lw	a6,168(a5)
	lw	a0,172(a5)
	addi	a7,a7,1
	mul	a6,a6,s4
	lw	s4,260(a4)
	sub	a2,a2,a6
	mul	a0,a0,s4
	lw	a6,340(a4)
	lw	s4,176(a5)
	mul	a6,a6,s4
	sub	a2,a2,a0
	lw	a0,184(a3)
	sub	a2,a2,a6
	sw	a2,180(a3)
	lw	s4,160(a5)
	lw	a2,24(a4)
	lw	a6,164(a5)
	mul	a2,a2,s4
	lw	s4,104(a4)
	sub	a2,a0,a2
	mul	a6,a6,s4
	lw	a0,168(a5)
	lw	s4,184(a4)
	mul	a0,a0,s4
	sub	a2,a2,a6
	lw	s4,264(a4)
	lw	a6,172(a5)
	sub	a2,a2,a0
	mul	a6,a6,s4
	lw	a0,344(a4)
	lw	s4,176(a5)
	mul	a0,a0,s4
	sub	a2,a2,a6
	sub	a2,a2,a0
	sw	a2,184(a3)
	beq	a7,s3,.L17
	lw	a6,8(a4)
	lw	s4,240(a5)
	lw	a2,248(a3)
	addi	a3,a3,84
	mul	s4,a6,s4
	addi	a5,a5,80
	addi	a4,a4,4
	addi	a0, a7, 0
	sub	a2,a2,s4
	blt	t3, a7, .L2
.L37:
	lw	s4,84(a3)
	lw	s7,244(a3)
	lw	s6,324(a3)
	div	a2,a2,s4
	lw	s5,404(a3)
	sw	a2,164(a3)
	lw	a2,240(a5)
	mul	a2,a6,a2
	sub	a2,s7,a2
	div	a2,a2,s4
	sw	a2,244(a3)
	lw	a2,320(a5)
	mul	a2,a6,a2
	sub	a2,s6,a2
	div	a2,a2,s4
	sw	a2,324(a3)
	lw	a2,400(a5)
	mul	a2,a6,a2
	sub	a2,s5,a2
	div	a2,a2,s4
	sw	a2,404(a3)
	bne	a7,t3,.L3
	addi	s4, zero, 3
.L4:
	lw	a2,8(a4)
	lw	s5,160(a5)
	lw	a6,164(a5)
	lw	s6,88(a4)
	mul	s5,s5,a2
	lw	a2,168(a3)
	mul	a6,a6,s6
	sub	a2,a2,s5
	sub	a2,a2,a6
	beq	a0,t3,.L12
.L10:
	lw	a6,168(a5)
	lw	s5,168(a4)
	mul	a6,a6,s5
	sub	a2,a2,a6
	bne	a0,t1,.L11
	sw	a2,168(a3)
	bne	s4,t5,.L23
.L17:
	lw	a4,1600(a1)
	lw	a3,80(a1)
	lw	a2,1604(a1)
	lw	a6,160(a1)
	mul	a3,a4,a3
	lw	a0,164(a1)
	lw	a7,1608(a1)
	lw	s3,240(a1)
	lw	t5,244(a1)
	lw	t4,248(a1)
	lw	a5,1612(a1)
	lw	t3,320(a1)
	lw	t1,324(a1)
	lw	s6,420(a1)
	sub	a2,a2,a3
	mul	a6,a4,a6
	lw	a3,328(a1)
	lw	s4,340(a1)
	lw	s5,336(a1)
	mul	a0,a2,a0
	sub	a7,a7,a6
	lw	a6,332(a1)
	mul	s3,a4,s3
	sub	a7,a7,a0
	lw	a0,1616(a1)
	mul	t5,a2,t5
	sub	a5,a5,s3
	lw	s3,400(a1)
	mul	t4,a7,t4
	sub	a5,a5,t5
	lw	t5,404(a1)
	mul	t3,a4,t3
	sub	a5,a5,t4
	lw	t4,408(a1)
	mul	t1,a2,t1
	sub	a0,a0,t3
	lw	t3,412(a1)
	mul	a3,a7,a3
	sub	a0,a0,t1
	lw	t1,416(a1)
	mul	a6,a5,a6
	sub	a0,a0,a3
	lw	a3,1620(a1)
	sub	a6,a0,a6
	mul	a0,a4,s3
	lw	s3,252(a1)
	sub	a3,a3,a0
	mul	a0,a2,t5
	lw	t5,256(a1)
	sub	a3,a3,a0
	mul	a0,a7,t4
	lw	t4,260(a1)
	sub	a3,a3,a0
	mul	a0,a5,t3
	lw	t3,172(a1)
	sub	a3,a3,a0
	mul	a0,a6,t1
	lw	t1,176(a1)
	sub	a3,a3,a0
	div	a0,a3,s6
	mul	a3,a0,s4
	sw	a0,1700(a1)
	sub	a6,a6,a3
	div	a6,a6,s5
	mul	t5,a6,t5
	sw	a6,1696(a1)
	mul	a3,a0,t4
	sub	a5,a5,t5
	sub	a5,a5,a3
	div	a5,a5,s3
	mul	a3,a5,t3
	sw	a5,1692(a1)
	lw	t5,180(a1)
	lw	s3,168(a1)
	lw	t4,88(a1)
	lw	t3,92(a1)
	lw	s4,28(sp)
	lw	s5,24(sp)
	lw	s6,20(sp)
	lw	s7,16(sp)
	sub	a3,a7,a3
	mul	a7,a6,t1
	lw	t1,96(a1)
	lw	s8,12(sp)
	lw	s9,8(sp)
	mul	t5,a0,t5
	sub	a3,a3,a7
	lw	a7,100(a1)
	sub	a3,a3,t5
	div	a3,a3,s3
	lw	t5,84(a1)
	lw	s3,32(sp)
	mul	t4,a3,t4
	sw	a3,1688(a1)
	mul	t3,a5,t3
	sub	a2,a2,t4
	mul	t1,a6,t1
	sub	a2,a2,t3
	mul	a7,a0,a7
	sub	a2,a2,t1
	sub	a2,a2,a7
	div	a2,a2,t5
	mul	t0,t0,a2
	sw	a2,1684(a1)
	mul	a3,s0,a3
	sub	a4,a4,t0
	lw	s0,44(sp)
	mul	a2,s1,a5
	sub	a5,a4,a3
	lw	s1,40(sp)
	mul	a6,s2,a6
	sub	a5,a5,a2
	lw	s2,36(sp)
	mul	a3,t2,a0
	sub	a5,a5,a6
	sub	a5,a5,a3
	div	a5,a5,t6
	sw	a5,1680(a1)
	addi	sp,sp,48
	jalr	zero, ra, 0
.L40:
	addi	a7, zero, 4
	jal	zero, .L4
.L14:
	sw	a2,172(a3)
	lw	a6,8(a4)
	lw	s4,240(a5)
	lw	a2,248(a3)
	lw	s5,88(a4)
	mul	s4,a6,s4
	addi	a0, zero, 4
	addi	a5,a5,80
	addi	a4,a4,4
	addi	a3,a3,84
	addi	a7, a0, 0
	sub	a2,a2,s4
	lw	s4,164(a5)
	mul	s4,s4,s5
	sub	a2,a2,s4
	bne	a0,t1,.L5
.L38:
	lw	s5,84(a3)
	addi	s4, zero, 4
	div	a2,a2,s5
	sw	a2,164(a3)
	jal	zero, .L6
.L3:
	lw	a0,480(a5)
	lw	a2,484(a3)
	lw	s7,168(a3)
	mul	a0,a6,a0
	lw	s6,172(a3)
	lw	s5,176(a3)
	lw	a6,180(a3)
	addi	a7,a7,1
	addi	a5,a5,80
	addi	a4,a4,4
	addi	a3,a3,84
	sub	a2,a2,a0
	div	a2,a2,s4
	lw	a0,100(a3)
	sw	a2,400(a3)
	lw	s4,80(a5)
	lw	a2,4(a4)
	mul	a2,a2,s4
	sub	a2,s7,a2
	sw	a2,84(a3)
	lw	s4,8(a4)
	lw	a2,80(a5)
	mul	a2,a2,s4
	sub	a2,s6,a2
	sw	a2,88(a3)
	lw	s4,80(a5)
	lw	a2,12(a4)
	mul	a2,a2,s4
	sub	a2,s5,a2
	sw	a2,92(a3)
	lw	a2,16(a4)
	lw	s4,80(a5)
	mul	a2,a2,s4
	sub	a2,a6,a2
	sw	a2,96(a3)
	lw	a2,80(a5)
	lw	a6,20(a4)
	mul	a2,a2,a6
	sub	a2,a0,a2
	sw	a2,100(a3)
	jal	zero, .L18
.L15:
	sw	a2,176(a3)
	lw	a6,8(a4)
	lw	s4,240(a5)
	lw	a2,248(a3)
	addi	a0, zero, 3
	mul	s4,a6,s4
	addi	a5,a5,80
	addi	a4,a4,4
	addi	a3,a3,84
	addi	a7, a0, 0
	sub	a2,a2,s4
	jal	zero, .L2
.L9:
	div	a2,a2,s5
	lw	s5,168(a3)
	sw	a2,244(a3)
	lw	s6,8(a4)
	lw	a2,160(a5)
	lw	a6,88(a4)
	mul	a2,a2,s6
	lw	s6,164(a5)
	mul	a6,a6,s6
	sub	a2,s5,a2
	sub	a2,a2,a6
	jal	zero, .L10
.L39:
	lw	s5,84(a3)
	addi	s4, zero, 5
	div	a2,a2,s5
	sw	a2,164(a3)
	jal	zero, .L6
.L42:
	sw	a2,180(a3)
	lw	a6,8(a4)
	lw	s4,240(a5)
	lw	a2,248(a3)
	addi	a0, zero, 2
	mul	s4,a6,s4
	addi	a5,a5,80
	addi	a4,a4,4
	addi	a3,a3,84
	addi	a7, a0, 0
	sub	a2,a2,s4
	jal	zero, .L2
.L41:
	div	a2,a2,s5
	sw	a2,324(a3)
	jal	zero, .L4
	.size	ludcmp.constprop.0.isra.0, .-ludcmp.constprop.0.isra.0
	.align	2
	.type	benchmark_body.constprop.0, @function
benchmark_body.constprop.0:
	addi	sp,sp,-48
	sw	s0,40(sp)
	lui	s0,%hi(.LANCHOR0)
	sw	s1,36(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	s8,8(sp)
	sw	s9,4(sp)
	sw	ra,44(sp)
	addi	s0,s0,%lo(.LANCHOR0)
	addi	s6, zero, 1478
	lui	s7,%hi(chkerr)
	addi	s5, zero, 4
	addi	s9, zero, 3
	addi	s4, zero, 5
	addi	s3, zero, 6
	addi	s1, zero, 7
	addi	s8, zero, 29
	addi	s2, zero, 8
.L44:
	addi	a5, zero, 37
	addi	a4, zero, 45
	sw	a5,1604(s0)
	sw	a4,1608(s0)
	addi	a5, zero, 12
	addi	a4, zero, 16
	addi	a3, zero, 10
	sw	a5,168(s0)
	sw	a4,252(s0)
	addi	a5, zero, 9
	addi	a4, zero, 53
	sw	a5,180(s0)
	sw	a5,256(s0)
	sw	a5,332(s0)
	sw	a3,260(s0)
	sw	a4,1612(s0)
	addi	a6, zero, 20
	addi	a4, zero, 11
	addi	a0, zero, 61
	addi	a1, zero, 24
	addi	a2, zero, 69
	sw	s5,0(s0)
	sw	s9,4(s0)
	sw	s5,8(s0)
	sw	s4,12(s0)
	sw	s3,16(s0)
	sw	s1,20(s0)
	sw	s8,1600(s0)
	sw	s9,80(s0)
	sw	s2,84(s0)
	sw	s4,88(s0)
	sw	s3,92(s0)
	sw	s1,96(s0)
	sw	s2,100(s0)
	sw	s5,160(s0)
	sw	s4,164(s0)
	sw	s1,172(s0)
	sw	s2,176(s0)
	sw	s4,240(s0)
	sw	s3,244(s0)
	sw	s1,248(s0)
	sw	s3,320(s0)
	sw	s1,324(s0)
	sw	s2,328(s0)
	sw	a6,336(s0)
	addi	s6,s6,-1
	sw	a5,408(s0)
	sw	a3,412(s0)
	sw	s1,400(s0)
	sw	s2,404(s0)
	sw	a4,340(s0)
	sw	a4,416(s0)
	sw	a0,1616(s0)
	sw	a1,420(s0)
	sw	a2,1620(s0)
.Lpcrel_1:
	auipc	ra, %pcrel_hi(ludcmp.constprop.0.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_1)
	sw	zero,%lo(chkerr)(s7)
	bne	s6,zero,.L44
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	a0,%lo(chkerr)(s7)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
	lw	s8,8(sp)
	lw	s9,4(sp)
	addi	sp,sp,48
	jalr	zero, ra, 0
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	addi	sp,sp,-48
	sw	s8,8(sp)
	sw	ra,44(sp)
	lui	s8,%hi(chkerr)
	bge	zero, a0, .L48
	sw	s0,40(sp)
	lui	s0,%hi(.LANCHOR0)
	sw	s1,36(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	s9,4(sp)
	sw	s10,0(sp)
	addi	s7, a0, 0
	addi	s0,s0,%lo(.LANCHOR0)
	addi	s6, zero, 0
	lui	s8,%hi(chkerr)
	addi	s5, zero, 4
	addi	s10, zero, 3
	addi	s4, zero, 5
	addi	s3, zero, 6
	addi	s1, zero, 7
	addi	s9, zero, 29
	addi	s2, zero, 8
.L49:
	addi	a5, zero, 37
	addi	a4, zero, 45
	sw	a5,1604(s0)
	sw	a4,1608(s0)
	addi	a5, zero, 12
	addi	a4, zero, 16
	addi	a3, zero, 10
	sw	a5,168(s0)
	sw	a4,252(s0)
	addi	a5, zero, 9
	addi	a4, zero, 53
	sw	a5,180(s0)
	sw	a5,256(s0)
	sw	a5,332(s0)
	sw	a3,260(s0)
	sw	a4,1612(s0)
	addi	a6, zero, 20
	addi	a4, zero, 11
	addi	a0, zero, 61
	addi	a1, zero, 24
	addi	a2, zero, 69
	sw	s5,0(s0)
	sw	s10,4(s0)
	sw	s5,8(s0)
	sw	s4,12(s0)
	sw	s3,16(s0)
	sw	s1,20(s0)
	sw	s9,1600(s0)
	sw	s10,80(s0)
	sw	s2,84(s0)
	sw	s4,88(s0)
	sw	s3,92(s0)
	sw	s1,96(s0)
	sw	s2,100(s0)
	sw	s5,160(s0)
	sw	s4,164(s0)
	sw	s1,172(s0)
	sw	s2,176(s0)
	sw	s4,240(s0)
	sw	s3,244(s0)
	sw	s1,248(s0)
	sw	s3,320(s0)
	sw	s1,324(s0)
	sw	s2,328(s0)
	sw	a6,336(s0)
	addi	s6,s6,1
	sw	a5,408(s0)
	sw	a3,412(s0)
	sw	s1,400(s0)
	sw	s2,404(s0)
	sw	a4,340(s0)
	sw	a4,416(s0)
	sw	a0,1616(s0)
	sw	a1,420(s0)
	sw	a2,1620(s0)
.Lpcrel_2:
	auipc	ra, %pcrel_hi(ludcmp.constprop.0.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_2)
	sw	zero,%lo(chkerr)(s8)
	bne	s6,s7,.L49
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
	lw	s9,4(sp)
	lw	s10,0(sp)
.L48:
	lw	ra,44(sp)
	lw	a5,%lo(chkerr)(s8)
	lw	s8,8(sp)
	addi	sp,sp,48
	jalr	zero, ra, 0
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.globl	rand_beebs
	.type	rand_beebs, @function
rand_beebs:
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
	.size	rand_beebs, .-rand_beebs
	.align	2
	.globl	srand_beebs
	.type	srand_beebs, @function
srand_beebs:
	lui	a5,%hi(seed)
	sw	a0,%lo(seed)(a5)
	jalr	zero, ra, 0
	.size	srand_beebs, .-srand_beebs
	.align	2
	.globl	init_heap_beebs
	.type	init_heap_beebs, @function
init_heap_beebs:
	add	a1,a0,a1
	lui	a3,%hi(heap_end)
	lui	a4,%hi(heap_ptr)
	lui	a5,%hi(heap_requested)
	sw	a1,%lo(heap_end)(a3)
	sw	a0,%lo(heap_ptr)(a4)
	sw	zero,%lo(heap_requested)(a5)
	jalr	zero, ra, 0
	.size	init_heap_beebs, .-init_heap_beebs
	.align	2
	.globl	check_heap_beebs
	.type	check_heap_beebs, @function
check_heap_beebs:
	lui	a5,%hi(heap_requested)
	lw	a4,%lo(heap_requested)(a5)
	lui	a5,%hi(heap_end)
	lw	a5,%lo(heap_end)(a5)
	add	a0,a0,a4
	sltu	a0,a5,a0
	xori	a0,a0,1
	jalr	zero, ra, 0
	.size	check_heap_beebs, .-check_heap_beebs
	.align	2
	.globl	malloc_beebs
	.type	malloc_beebs, @function
malloc_beebs:
	addi	a5, a0, 0
	beq	a0,zero,.L62
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a1,%lo(heap_requested)(a3)
	add	a4,a0,a5
	andi	a6,a4,3
	add	a5,a5,a1
	bne	a6,zero,.L66
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a1,a4,.L62
.L67:
	sw	a4,%lo(heap_ptr)(a2)
	jalr	zero, ra, 0
.L66:
	addi	a1, zero, 4
	sub	a1,a1,a6
	add	a5,a5,a1
	add	a4,a4,a1
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a1,a4,.L67
.L62:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	malloc_beebs, .-malloc_beebs
	.align	2
	.globl	calloc_beebs
	.type	calloc_beebs, @function
calloc_beebs:
	mul	a1,a0,a1
	beq	a1,zero,.L69
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a0,a1
	andi	a6,a4,3
	add	a5,a1,a5
	bne	a6,zero,.L94
.L70:
	lui	a6,%hi(heap_end)
	lw	a6,%lo(heap_end)(a6)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a6,a4,.L69
	sw	a4,%lo(heap_ptr)(a2)
	beq	a0,zero,.L69
	addi	a5,a1,-1
	addi	a4, zero, 5
	bgeu	a4, a5, .L78
	sub	a4, zero, a0
	andi	a5,a4,3
	addi	a3, zero, 0
	beq	a5,zero,.L72
	sb	zero,0(a0)
	andi	a4,a4,2
	addi	a3, zero, 1
	beq	a4,zero,.L72
	sb	zero,1(a0)
	addi	a4, zero, 3
	addi	a3, zero, 2
	bne	a5,a4,.L72
	sb	zero,2(a0)
	addi	a3, a5, 0
.L72:
	sub	a6,a1,a5
	andi	a2,a6,-4
	add	a5,a0,a5
	add	a4,a5,a2
.L74:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L74
	add	a5,a3,a2
	beq	a6,a2,.L68
.L71:
	add	a4,a0,a5
	sb	zero,0(a4)
	addi	a4,a5,1
	bgeu	a4, a1, .L68
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,2
	bgeu	a4, a1, .L68
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,3
	bgeu	a4, a1, .L68
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,4
	bgeu	a4, a1, .L68
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a5,a5,5
	bgeu	a5, a1, .L68
	add	a5,a0,a5
	sb	zero,0(a5)
	jalr	zero, ra, 0
.L69:
	addi	a0, zero, 0
.L68:
	jalr	zero, ra, 0
.L94:
	addi	a7, zero, 4
	sub	a6,a7,a6
	add	a4,a4,a6
	add	a5,a5,a6
	jal	zero, .L70
.L78:
	addi	a5, zero, 0
	jal	zero, .L71
	.size	calloc_beebs, .-calloc_beebs
	.align	2
	.globl	realloc_beebs
	.type	realloc_beebs, @function
realloc_beebs:
	beq	a0,zero,.L96
	beq	a1,zero,.L96
	lui	a6,%hi(heap_ptr)
	lw	a2,%lo(heap_ptr)(a6)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a2,a1
	andi	a7,a4,3
	add	a5,a1,a5
	bne	a7,zero,.L121
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a7,a4,.L96
.L122:
	sw	a4,%lo(heap_ptr)(a6)
	beq	a2,zero,.L96
	addi	a5,a1,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L106
	or	a3,a0,a2
	andi	a3,a3,3
	addi	a4, a2, 0
	addi	a5, a0, 0
	bne	a3,zero,.L106
	addi	a3,a2,-1
	sub	a3,a3,a0
	sltiu	a3,a3,3
	bne	a3,zero,.L106
	andi	a7,a1,-4
	add	a6,a0,a7
.L99:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L99
	beq	a1,a7,.L95
	lbu	a3,0(a6)
	add	a4,a2,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a1, .L95
	add	a4,a0,a5
	lbu	a4,0(a4)
	add	a5,a2,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a1, .L95
	add	a0,a0,a7
	lbu	a5,0(a0)
	add	a7,a2,a7
	sb	a5,0(a7)
.L95:
	addi	a0, a2, 0
	jalr	zero, ra, 0
.L121:
	addi	t1, zero, 4
	sub	a7,t1,a7
	add	a5,a5,a7
	add	a4,a4,a7
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a7,a4,.L122
.L96:
	addi	a2, zero, 0
	addi	a0, a2, 0
	jalr	zero, ra, 0
.L106:
	addi	a5, zero, 0
.L103:
	add	a4,a0,a5
	lbu	a3,0(a4)
	add	a4,a2,a5
	addi	a5,a5,1
	sb	a3,0(a4)
	bltu	a5, a1, .L103
	addi	a0, a2, 0
	jalr	zero, ra, 0
	.size	realloc_beebs, .-realloc_beebs
	.align	2
	.globl	free_beebs
	.type	free_beebs, @function
free_beebs:
	jalr	zero, ra, 0
	.size	free_beebs, .-free_beebs
	.align	2
	.globl	memset
	.type	memset, @function
memset:
	beq	a2,zero,.L137
	addi	a5,a2,-1
	addi	a4, zero, 5
	andi	a1,a1,0xff
	bgeu	a4, a5, .L133
	sub	a4, zero, a0
	andi	a5,a4,3
	addi	a6, zero, 0
	beq	a5,zero,.L127
	sb	a1,0(a0)
	andi	a4,a4,2
	addi	a6, zero, 1
	beq	a4,zero,.L127
	sb	a1,1(a0)
	addi	a4, zero, 3
	addi	a6, zero, 2
	bne	a5,a4,.L127
	sb	a1,2(a0)
	addi	a6, a5, 0
.L127:
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
.L129:
	sw	a4,0(a5)
	addi	a5,a5,4
	bne	a5,a3,.L129
	add	a5,a6,a7
	beq	t1,a7,.L137
.L126:
	add	a4,a0,a5
	sb	a1,0(a4)
	addi	a4,a5,1
	bgeu	a4, a2, .L137
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,2
	bgeu	a4, a2, .L137
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,3
	bgeu	a4, a2, .L137
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,4
	bgeu	a4, a2, .L137
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a5,a5,5
	bgeu	a5, a2, .L137
	add	a5,a0,a5
	sb	a1,0(a5)
.L137:
	jalr	zero, ra, 0
.L133:
	addi	a5, zero, 0
	jal	zero, .L126
	.size	memset, .-memset
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	beq	a2,zero,.L142
	addi	a5,a2,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L143
	or	a3,a0,a1
	andi	a3,a3,3
	addi	a4, a0, 0
	addi	a5, a1, 0
	bne	a3,zero,.L143
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L143
	andi	a7,a2,-4
	add	a6,a1,a7
.L144:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L144
	beq	a2,a7,.L142
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a2, .L142
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a2, .L142
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	jalr	zero, ra, 0
.L143:
	add	a2,a1,a2
	addi	a5, a0, 0
.L146:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L146
.L142:
	jalr	zero, ra, 0
	.size	memcpy, .-memcpy
	.align	2
	.globl	memcmp
	.type	memcmp, @function
memcmp:
	beq	a2,zero,.L163
	add	a2,a0,a2
	jal	zero, .L162
.L161:
	beq	a0,a2,.L163
.L162:
	lbu	a5,0(a0)
	lbu	a4,0(a1)
	addi	a0,a0,1
	addi	a1,a1,1
	beq	a5,a4,.L161
	sub	a0,a5,a4
	jalr	zero, ra, 0
.L163:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	memcmp, .-memcmp
	.align	2
	.globl	memmove
	.type	memmove, @function
memmove:
	bgeu	a0,a1,.L166
	beq	a2,zero,.L167
	addi	a5,a2,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L168
	or	a3,a1,a0
	andi	a3,a3,3
	addi	a4, a0, 0
	addi	a5, a1, 0
	bne	a3,zero,.L168
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L168
	andi	a7,a2,-4
	add	a6,a1,a7
.L169:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L169
	beq	a2,a7,.L167
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a2, .L167
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a2, .L167
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	jalr	zero, ra, 0
.L166:
	bltu	a1, a0, .L189
.L167:
	jalr	zero, ra, 0
.L189:
	beq	a2,zero,.L167
	addi	a2,a2,-1
	add	a5,a1,a2
	lbu	a4,0(a5)
	add	a5,a0,a2
	sb	a4,0(a5)
	jal	zero, .L189
.L168:
	add	a2,a1,a2
	addi	a5, a0, 0
.L171:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L171
	jalr	zero, ra, 0
	.size	memmove, .-memmove
	.align	2
	.globl	strlen
	.type	strlen, @function
strlen:
	lbu	a5,0(a0)
	beq	a5,zero,.L190
	addi	a5, zero, 0
.L192:
	addi	a5,a5,1
	add	a4,a0,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L192
.L190:
	addi	a0, a5, 0
	jalr	zero, ra, 0
	.size	strlen, .-strlen
	.align	2
	.globl	strchr
	.type	strchr, @function
strchr:
	lbu	a5,0(a0)
	beq	a5,zero,.L196
	andi	a4,a1,0xff
.L198:
	beq	a4,a5,.L195
	lbu	a5,1(a0)
	addi	a0,a0,1
	bne	a5,zero,.L198
.L196:
	sltiu	a1, a1, 1
	sub	a1, zero, a1
	and	a0,a0,a1
.L195:
	jalr	zero, ra, 0
	.size	strchr, .-strchr
	.align	2
	.globl	initialise_board
	.type	initialise_board, @function
initialise_board:
 #APP
# 15 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	addi	a0, zero, 0
# 0 "" 2
 #NO_APP
	jalr	zero, ra, 0
	.size	initialise_board, .-initialise_board
	.align	2
	.globl	start_trigger
	.type	start_trigger, @function
start_trigger:
 #APP
# 21 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	addi	a0, zero, 0
# 0 "" 2
 #NO_APP
	jalr	zero, ra, 0
	.size	start_trigger, .-start_trigger
	.align	2
	.globl	stop_trigger
	.type	stop_trigger, @function
stop_trigger:
 #APP
# 27 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	addi	a0, zero, 0
# 0 "" 2
 #NO_APP
	jalr	zero, ra, 0
	.size	stop_trigger, .-stop_trigger
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a5,%hi(.LANCHOR1)
	addi	sp,sp,-80
	addi	a5,a5,%lo(.LANCHOR1)
	addi	a3,a5,80
	addi	a4, sp, 0
.L207:
	lw	a7,0(a5)
	lw	a6,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	sw	a7,0(a4)
	sw	a6,4(a4)
	sw	a1,8(a4)
	sw	a2,12(a4)
	addi	a5,a5,16
	addi	a4,a4,16
	bne	a5,a3,.L207
	lui	a1,%hi(.LANCHOR0)
	addi	a1,a1,%lo(.LANCHOR0)
	addi	a5,a1,1680
	addi	a4, sp, 0
	addi	a1,a1,1760
.L210:
	lbu	a3,0(a5)
	lbu	a2,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a3,a2,.L214
	bne	a1,a5,.L210
	sltiu	a0, a0, 1
	addi	sp,sp,80
	jalr	zero, ra, 0
.L214:
	sub	a3,a3,a2
	or	a0,a0,a3
	sltiu	a0, a0, 1
	addi	sp,sp,80
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
.Lpcrel_3:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_3)
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
.Lpcrel_4:
	auipc	ra, %pcrel_hi(benchmark_body.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_4)
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
	sw	ra,28(sp)
 #APP
# 15 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	addi	a0, zero, 0
# 0 "" 2
 #NO_APP
	addi	a0, zero, 1
.Lpcrel_5:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_5)
.Lpcrel_6:
	auipc	ra, %pcrel_hi(start_trigger)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_6)
.Lpcrel_7:
	auipc	ra, %pcrel_hi(benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_7)
	sw	a0,12(sp)
.Lpcrel_8:
	auipc	ra, %pcrel_hi(stop_trigger)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_8)
	lw	a0,12(sp)
.Lpcrel_9:
	auipc	ra, %pcrel_hi(verify_benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_9)
	lw	ra,28(sp)
	xori	a0,a0,1
	addi	sp,sp,32
	jalr	zero, ra, 0
	.size	main, .-main
	.text
	.align	2
	.globl	ludcmp
	.type	ludcmp, @function
ludcmp:
	addi	sp,sp,-432
	sw	s1,424(sp)
	lui	s1,%hi(.LANCHOR0)
	sw	s4,412(sp)
	addi	s1,s1,%lo(.LANCHOR0)
	lw	s4,1600(s1)
	bge	zero, a1, .L223
	sw	s2,420(sp)
	slli	s2,a1,2
	add	t1,s2,a1
	sw	s0,428(sp)
	slli	t1,t1,4
	addi	s0,s1,80
	sw	s3,416(sp)
	sw	s6,404(sp)
	sw	s5,408(sp)
	sw	s7,400(sp)
	add	t1,t1,s0
	add	t4,s2,s0
	addi	t2, s0, 0
	addi	t3, s0, 0
	addi	t0, a1, 0
	addi	a7, s1, 0
	addi	s6, zero, 0
	addi	t5, zero, 0
	addi	t6, zero, 0
	addi	s3,s1,-4
.L232:
	addi	t6,t6,1
	blt	a1,t6,.L224
	addi	a6, t2, 0
.L229:
	lw	a2,0(a6)
	bne	t5,zero,.L254
	lw	a5,0(a7)
	addi	a6,a6,80
	div	a5,a2,a5
	sw	a5,-80(a6)
	bne	a6,t1,.L229
.L227:
	addi	a7,a7,84
	addi	s6,s6,-80
	addi	a6, a7, 0
	addi	s5, t2, 0
.L231:
	lw	a2,4(s5)
	add	a5,s6,a6
	addi	a3, t3, 0
.L230:
	lw	a4,0(a3)
	lw	a0,0(a5)
	addi	a5,a5,80
	addi	a3,a3,4
	mul	a4,a4,a0
	sub	a2,a2,a4
	bne	a5,a6,.L230
	sw	a2,4(s5)
	addi	s5,s5,4
	addi	a6,a5,4
	bne	s5,t4,.L231
	addi	t5,t5,1
	addi	t4,t4,80
	addi	t3,t3,80
	addi	t2,t2,84
	addi	t1,t1,4
	bne	a1,t6,.L232
.L224:
	addi	a6,sp,4
	sw	s4,0(sp)
	add	t3,a6,s2
	addi	t1,s1,1604
	addi	a7, sp, 0
.L235:
	lw	a2,0(t1)
	addi	a5, a7, 0
	addi	a3, s0, 0
.L234:
	lw	a4,0(a3)
	lw	a0,0(a5)
	addi	a5,a5,4
	addi	a3,a3,4
	mul	a4,a4,a0
	sub	a2,a2,a4
	bne	a5,a6,.L234
	sw	a2,0(a5)
	addi	a6,a5,4
	addi	t1,t1,4
	addi	s0,s0,80
	bne	a6,t3,.L235
	addi	a5, zero, 84
	mul	a5,a1,a5
	add	a4,a7,s2
	add	a3,s1,s2
	addi	t1,s1,-80
	addi	t3,s1,1680
	addi	a6,s1,1684
	lw	a4,0(a4)
	addi	a7,a7,-4
	add	a7,a7,s2
	add	t3,t3,s2
	add	s1,s1,a5
	lw	a2,0(s1)
	add	t1,t1,a5
	add	a6,a6,s2
	div	a5,a4,a2
	sw	a5,1680(a3)
.L238:
	lw	a2,0(a7)
	blt	a1,t0,.L236
.L255:
	addi	a5, t3, 0
	addi	a3, t1, 0
.L237:
	lw	a4,0(a3)
	lw	a0,0(a5)
	addi	a5,a5,4
	addi	a3,a3,4
	mul	a4,a4,a0
	sub	a2,a2,a4
	bne	a6,a5,.L237
	lw	a5,-4(t1)
	addi	t0,t0,-1
	div	a2,a2,a5
	sw	a2,-4(t3)
	beq	t0,zero,.L253
	addi	a7,a7,-4
	addi	t3,t3,-4
	addi	t1,t1,-84
	lw	a2,0(a7)
	bge	a1,t0,.L255
.L236:
	lw	a5,-4(t1)
	addi	a7,a7,-4
	addi	t0,t0,-1
	div	a2,a2,a5
	addi	t1,t1,-84
	addi	t3,t3,-4
	sw	a2,0(t3)
	jal	zero, .L238
.L254:
	sub	s5, zero, t6
	slli	s5,s5,2
	addi	s7,s5,4
	sub	s5,s3,s5
.L228:
	add	a3,a6,s7
	addi	a5, s5, 0
.L226:
	lw	a4,0(a3)
	lw	a0,0(a5)
	addi	a5,a5,80
	addi	a3,a3,4
	mul	a4,a4,a0
	sub	a2,a2,a4
	bne	a5,a7,.L226
	lw	a5,0(a7)
	addi	a6,a6,80
	div	a5,a2,a5
	sw	a5,-80(a6)
	beq	a6,t1,.L227
	lw	a2,0(a6)
	jal	zero, .L228
.L253:
	lw	s0,428(sp)
	lw	s2,420(sp)
	lw	s3,416(sp)
	lw	s5,408(sp)
	lw	s6,404(sp)
	lw	s7,400(sp)
	lw	s1,424(sp)
	lw	s4,412(sp)
	addi	a0, zero, 0
	addi	sp,sp,432
	jalr	zero, ra, 0
.L223:
	addi	a5, zero, 84
	mul	a5,a1,a5
	slli	a1,a1,2
	sw	s4,0(sp)
	add	a4,a1,sp
	lw	a4,0(a4)
	add	a1,s1,a1
	lw	s4,412(sp)
	addi	a0, zero, 0
	add	a5,s1,a5
	lw	a5,0(a5)
	lw	s1,424(sp)
	div	a5,a4,a5
	sw	a5,1680(a1)
	addi	sp,sp,432
	jalr	zero, ra, 0
	.size	ludcmp, .-ludcmp
	.globl	chkerr
	.globl	x
	.globl	b
	.globl	a
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
.LC0:
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	2
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
	.type	a, @object
	.size	a, 1600
a:
	.zero	1600
	.type	b, @object
	.size	b, 80
b:
	.zero	80
	.type	x, @object
	.size	x, 80
x:
	.zero	80
	.section	.sbss,"aw",@nobits
	.align	2
	.type	chkerr, @object
	.size	chkerr, 4
chkerr:
	.zero	4
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
    jal   ra, __riscv_div_lib_udivsi3        # jal __riscv_div_lib_udivsi3
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
    jal   ra, __riscv_div_lib_udivsi3        # jal __riscv_div_lib_udivsi3
    sub   a0, zero, a0                        # neg a0, a0 -> sub a0, zero, a0
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0

# Signed 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_modsi3
__riscv_div_lib_modsi3:
    addi  t0, ra, 0                           # mv t0, ra -> addi t0, ra, 0
    blt   a1, zero, __riscv_div_lib_L31      # bltz a1 -> blt a1, zero
    blt   a0, zero, __riscv_div_lib_L32      # bltz a0 -> blt a0, zero
__riscv_div_lib_L30:
    jal   ra, __riscv_div_lib_udivsi3        # jal __riscv_div_lib_udivsi3
    addi  a0, a1, 0                           # mv a0, a1 -> addi a0, a1, 0
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0
__riscv_div_lib_L31:
    sub   a1, zero, a1                        # neg a1, a1 -> sub a1, zero, a1
    bge   a0, zero, __riscv_div_lib_L30      # bgez a0 -> bge a0, zero
__riscv_div_lib_L32:
    sub   a0, zero, a0                        # neg a0, a0 -> sub a0, zero, a0
    jal   ra, __riscv_div_lib_udivsi3        # jal __riscv_div_lib_udivsi3
    sub   a0, zero, a1                        # neg a0, a1 -> sub a0, zero, a1
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0

# end of subrountine