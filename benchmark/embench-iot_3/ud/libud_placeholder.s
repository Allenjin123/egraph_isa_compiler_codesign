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
	calldiv	a2,a2,t6
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
	addi	a7,zero,1
	addi	t3,a7,0
	addi	t5,zero,6
	addi	s3,zero,5
	addi	t1,zero,2
	addi	t4,zero,3
	calldiv	s7,s7,t6
	sw	a2,80(a1)
	calldiv	a3,a3,t6
	sw	s7,400(a1)
	calldiv	a4,a4,t6
	sw	a3,160(a1)
	addi	a3,a1,0
	calldiv	a5,a5,t6
	sw	a4,240(a1)
	addi	a4,a1,0
	callmul	s7,t0,a2
	sw	a5,320(a1)
	addi	a5,a1,0
	sub	s6,s6,s7
	sw	s6,84(a1)
	callmul	s6,s0,a2
	sub	s5,s5,s6
	sw	s5,88(a1)
	callmul	s5,s1,a2
	sub	s4,s4,s5
	sw	s4,92(a1)
	callmul	s4,s2,a2
	callmul	a2,t2,a2
	sub	a6,a6,s4
	sw	a6,96(a1)
	sub	a2,a0,a2
	sw	a2,100(a1)
.L18:
	lw	a6,4(a4)
	lw	s4,160(a5)
	lw	a2,164(a3)
	addi	a0,a7,0
	callmul	s4,a6,s4
	sub	a2,a2,s4
	blt	t3,a7,.+8
	jal	x0,.L37
.L2:
	lw	s4,164(a5)
	lw	s5,84(a4)
	callmul	s4,s4,s5
	sub	a2,a2,s4
	bne	a0,t1,.+8
	jal	x0,.L38
.L5:
	lw	s4,168(a5)
	lw	s5,164(a4)
	callmul	s4,s4,s5
	sub	a2,a2,s4
	bne	a0,t4,.+8
	jal	x0,.L39
	lw	s6,172(a5)
	lw	s7,244(a4)
	lw	s5,84(a3)
	addi	s4,a7,2
	callmul	s6,s6,s7
	sub	a2,a2,s6
	calldiv	a2,a2,s5
	sw	a2,164(a3)
	bne	s4,t5,.+8
	jal	x0,.L40
.L6:
	lw	s7,240(a5)
	lw	s6,244(a5)
	lw	s8,84(a4)
	callmul	s7,a6,s7
	lw	a2,244(a3)
	callmul	s6,s6,s8
	sub	a2,a2,s7
	sub	a2,a2,s6
	bne	a0,t1,.+8
	jal	x0,.L34
	lw	s6,248(a5)
	lw	s7,164(a4)
	callmul	s6,s6,s7
	sub	a2,a2,s6
	bne	a0,t4,.+8
	jal	x0,.L9
	lw	s6,252(a5)
	lw	s7,244(a4)
	callmul	s6,s6,s7
	sub	a2,a2,s6
.L34:
	calldiv	a2,a2,s5
	sw	a2,244(a3)
	lw	s7,320(a5)
	lw	s6,324(a5)
	lw	s8,84(a4)
	callmul	s7,a6,s7
	lw	a2,324(a3)
	callmul	s6,s6,s8
	sub	a2,a2,s7
	sub	a2,a2,s6
	bne	a0,t1,.+8
	jal	x0,.L41
	lw	s8,328(a5)
	lw	s6,164(a4)
	lw	s7,332(a5)
	callmul	s6,s6,s8
	lw	s8,244(a4)
	callmul	s7,s7,s8
	sub	s6,a2,s6
	lw	a2,168(a3)
	sub	s6,s6,s7
	calldiv	s6,s6,s5
	sw	s6,324(a3)
	lw	s6,400(a5)
	lw	s8,84(a4)
	lw	s7,404(a5)
	callmul	s6,a6,s6
	lw	s9,164(a4)
	callmul	s7,s7,s8
	lw	s8,404(a3)
	sub	s6,s8,s6
	lw	s8,408(a5)
	sub	s6,s6,s7
	callmul	s8,s8,s9
	lw	s7,244(a4)
	lw	s9,412(a5)
	callmul	s7,s7,s9
	sub	s6,s6,s8
	sub	s6,s6,s7
	calldiv	s6,s6,s5
	sw	s6,404(a3)
	lw	s7,480(a5)
	lw	s6,484(a5)
	lw	s8,164(a4)
	callmul	a6,a6,s7
	lw	s7,84(a4)
	callmul	s6,s6,s7
	lw	s7,484(a3)
	sub	a6,s7,a6
	lw	s7,488(a5)
	sub	a6,a6,s6
	callmul	s7,s7,s8
	lw	s6,244(a4)
	lw	s8,492(a5)
	callmul	s6,s6,s8
	sub	a6,a6,s7
	sub	a6,a6,s6
	calldiv	a6,a6,s5
	sw	a6,484(a3)
	lw	a6,160(a5)
	lw	s6,8(a4)
	lw	s5,88(a4)
	lw	s8,164(a5)
	callmul	s6,s6,a6
	lw	s7,168(a5)
	lw	a6,168(a4)
	callmul	s5,s5,s8
	sub	a2,a2,s6
	callmul	a6,a6,s7
	sub	a2,a2,s5
	sub	a2,a2,a6
.L11:
	lw	a6,172(a5)
	lw	s5,248(a4)
	callmul	a6,a6,s5
	sub	a2,a2,a6
	bne	a0,t4,.+8
	jal	x0,.L12
	lw	a6,176(a5)
	lw	s5,328(a4)
	callmul	a6,a6,s5
	sub	a2,a2,a6
.L12:
	sw	a2,168(a3)
	bne	s4,t5,.+8
	jal	x0,.L17
.L23:
	lw	a2,160(a5)
	lw	s4,12(a4)
	lw	a6,164(a5)
	lw	s5,92(a4)
	callmul	s4,s4,a2
	lw	a2,172(a3)
	callmul	a6,a6,s5
	sub	a2,a2,s4
	sub	a2,a2,a6
	bne	a0,t3,.+8
	jal	x0,.L13
	lw	a6,168(a5)
	lw	s4,172(a4)
	callmul	a6,a6,s4
	sub	a2,a2,a6
	bne	a0,t1,.+8
	jal	x0,.L13
	lw	a6,172(a5)
	lw	s4,252(a4)
	callmul	a6,a6,s4
	sub	a2,a2,a6
	bne	a0,t4,.+8
	jal	x0,.L14
	lw	a6,332(a4)
	lw	s4,176(a5)
	callmul	a6,a6,s4
	sub	a2,a2,a6
.L13:
	sw	a2,172(a3)
	lw	a2,160(a5)
	lw	s4,16(a4)
	lw	a6,164(a5)
	lw	s5,96(a4)
	callmul	s4,s4,a2
	lw	a2,176(a3)
	callmul	a6,a6,s5
	sub	a2,a2,s4
	sub	a2,a2,a6
	bne	a0,t3,.+8
	jal	x0,.L16
	lw	a6,168(a5)
	lw	s4,176(a4)
	callmul	a6,a6,s4
	sub	a2,a2,a6
	bne	a0,t1,.+8
	jal	x0,.L15
	lw	s5,256(a4)
	lw	s4,172(a5)
	lw	a6,176(a5)
	callmul	s4,s4,s5
	lw	s5,336(a4)
	callmul	a6,a6,s5
	sub	a2,a2,s4
	sub	a2,a2,a6
.L16:
	sw	a2,176(a3)
	lw	a2,160(a5)
	lw	s4,20(a4)
	lw	a6,164(a5)
	lw	s5,100(a4)
	callmul	s4,s4,a2
	lw	a2,180(a3)
	callmul	a6,a6,s5
	sub	a2,a2,s4
	sub	a2,a2,a6
	bne	a0,t3,.+8
	jal	x0,.L42
	lw	s4,180(a4)
	lw	a6,168(a5)
	lw	a0,172(a5)
	addi	a7,a7,1
	callmul	a6,a6,s4
	lw	s4,260(a4)
	sub	a2,a2,a6
	callmul	a0,a0,s4
	lw	a6,340(a4)
	lw	s4,176(a5)
	callmul	a6,a6,s4
	sub	a2,a2,a0
	lw	a0,184(a3)
	sub	a2,a2,a6
	sw	a2,180(a3)
	lw	s4,160(a5)
	lw	a2,24(a4)
	lw	a6,164(a5)
	callmul	a2,a2,s4
	lw	s4,104(a4)
	sub	a2,a0,a2
	callmul	a6,a6,s4
	lw	a0,168(a5)
	lw	s4,184(a4)
	callmul	a0,a0,s4
	sub	a2,a2,a6
	lw	s4,264(a4)
	lw	a6,172(a5)
	sub	a2,a2,a0
	callmul	a6,a6,s4
	lw	a0,344(a4)
	lw	s4,176(a5)
	callmul	a0,a0,s4
	sub	a2,a2,a6
	sub	a2,a2,a0
	sw	a2,184(a3)
	bne	a7,s3,.+8
	jal	x0,.L17
	lw	a6,8(a4)
	lw	s4,240(a5)
	lw	a2,248(a3)
	addi	a3,a3,84
	callmul	s4,a6,s4
	addi	a5,a5,80
	addi	a4,a4,4
	addi	a0,a7,0
	sub	a2,a2,s4
	blt	t3,a7,.L2
.L37:
	lw	s4,84(a3)
	lw	s7,244(a3)
	lw	s6,324(a3)
	calldiv	a2,a2,s4
	lw	s5,404(a3)
	sw	a2,164(a3)
	lw	a2,240(a5)
	callmul	a2,a6,a2
	sub	a2,s7,a2
	calldiv	a2,a2,s4
	sw	a2,244(a3)
	lw	a2,320(a5)
	callmul	a2,a6,a2
	sub	a2,s6,a2
	calldiv	a2,a2,s4
	sw	a2,324(a3)
	lw	a2,400(a5)
	callmul	a2,a6,a2
	sub	a2,s5,a2
	calldiv	a2,a2,s4
	sw	a2,404(a3)
	bne	a7,t3,.L3
	addi	s4,zero,3
.L4:
	lw	a2,8(a4)
	lw	s5,160(a5)
	lw	a6,164(a5)
	lw	s6,88(a4)
	callmul	s5,s5,a2
	lw	a2,168(a3)
	callmul	a6,a6,s6
	sub	a2,a2,s5
	sub	a2,a2,a6
	bne	a0,t3,.+8
	jal	x0,.L12
.L10:
	lw	a6,168(a5)
	lw	s5,168(a4)
	callmul	a6,a6,s5
	sub	a2,a2,a6
	bne	a0,t1,.L11
	sw	a2,168(a3)
	bne	s4,t5,.L23
.L17:
	lw	a4,1600(a1)
	lw	a3,80(a1)
	lw	a2,1604(a1)
	lw	a6,160(a1)
	callmul	a3,a4,a3
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
	callmul	a6,a4,a6
	lw	a3,328(a1)
	lw	s4,340(a1)
	lw	s5,336(a1)
	callmul	a0,a2,a0
	sub	a7,a7,a6
	lw	a6,332(a1)
	callmul	s3,a4,s3
	sub	a7,a7,a0
	lw	a0,1616(a1)
	callmul	t5,a2,t5
	sub	a5,a5,s3
	lw	s3,400(a1)
	callmul	t4,a7,t4
	sub	a5,a5,t5
	lw	t5,404(a1)
	callmul	t3,a4,t3
	sub	a5,a5,t4
	lw	t4,408(a1)
	callmul	t1,a2,t1
	sub	a0,a0,t3
	lw	t3,412(a1)
	callmul	a3,a7,a3
	sub	a0,a0,t1
	lw	t1,416(a1)
	callmul	a6,a5,a6
	sub	a0,a0,a3
	lw	a3,1620(a1)
	sub	a6,a0,a6
	callmul	a0,a4,s3
	lw	s3,252(a1)
	sub	a3,a3,a0
	callmul	a0,a2,t5
	lw	t5,256(a1)
	sub	a3,a3,a0
	callmul	a0,a7,t4
	lw	t4,260(a1)
	sub	a3,a3,a0
	callmul	a0,a5,t3
	lw	t3,172(a1)
	sub	a3,a3,a0
	callmul	a0,a6,t1
	lw	t1,176(a1)
	sub	a3,a3,a0
	calldiv	a0,a3,s6
	callmul	a3,a0,s4
	sw	a0,1700(a1)
	sub	a6,a6,a3
	calldiv	a6,a6,s5
	callmul	t5,a6,t5
	sw	a6,1696(a1)
	callmul	a3,a0,t4
	sub	a5,a5,t5
	sub	a5,a5,a3
	calldiv	a5,a5,s3
	callmul	a3,a5,t3
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
	callmul	a7,a6,t1
	lw	t1,96(a1)
	lw	s8,12(sp)
	lw	s9,8(sp)
	callmul	t5,a0,t5
	sub	a3,a3,a7
	lw	a7,100(a1)
	sub	a3,a3,t5
	calldiv	a3,a3,s3
	lw	t5,84(a1)
	lw	s3,32(sp)
	callmul	t4,a3,t4
	sw	a3,1688(a1)
	callmul	t3,a5,t3
	sub	a2,a2,t4
	callmul	t1,a6,t1
	sub	a2,a2,t3
	callmul	a7,a0,a7
	sub	a2,a2,t1
	sub	a2,a2,a7
	calldiv	a2,a2,t5
	callmul	t0,t0,a2
	sw	a2,1684(a1)
	callmul	a3,s0,a3
	sub	a4,a4,t0
	lw	s0,44(sp)
	callmul	a2,s1,a5
	sub	a5,a4,a3
	lw	s1,40(sp)
	callmul	a6,s2,a6
	sub	a5,a5,a2
	lw	s2,36(sp)
	callmul	a3,t2,a0
	sub	a5,a5,a6
	sub	a5,a5,a3
	calldiv	a5,a5,t6
	sw	a5,1680(a1)
	addi	sp,sp,48
	jalr	zero,ra,0
.L40:
	addi	a7,zero,4
	jal	x0,.L4
.L14:
	sw	a2,172(a3)
	lw	a6,8(a4)
	lw	s4,240(a5)
	lw	a2,248(a3)
	lw	s5,88(a4)
	callmul	s4,a6,s4
	addi	a0,zero,4
	addi	a5,a5,80
	addi	a4,a4,4
	addi	a3,a3,84
	addi	a7,a0,0
	sub	a2,a2,s4
	lw	s4,164(a5)
	callmul	s4,s4,s5
	sub	a2,a2,s4
	bne	a0,t1,.L5
.L38:
	lw	s5,84(a3)
	addi	s4,zero,4
	calldiv	a2,a2,s5
	sw	a2,164(a3)
	jal	x0,.L6
.L3:
	lw	a0,480(a5)
	lw	a2,484(a3)
	lw	s7,168(a3)
	callmul	a0,a6,a0
	lw	s6,172(a3)
	lw	s5,176(a3)
	lw	a6,180(a3)
	addi	a7,a7,1
	addi	a5,a5,80
	addi	a4,a4,4
	addi	a3,a3,84
	sub	a2,a2,a0
	calldiv	a2,a2,s4
	lw	a0,100(a3)
	sw	a2,400(a3)
	lw	s4,80(a5)
	lw	a2,4(a4)
	callmul	a2,a2,s4
	sub	a2,s7,a2
	sw	a2,84(a3)
	lw	s4,8(a4)
	lw	a2,80(a5)
	callmul	a2,a2,s4
	sub	a2,s6,a2
	sw	a2,88(a3)
	lw	s4,80(a5)
	lw	a2,12(a4)
	callmul	a2,a2,s4
	sub	a2,s5,a2
	sw	a2,92(a3)
	lw	a2,16(a4)
	lw	s4,80(a5)
	callmul	a2,a2,s4
	sub	a2,a6,a2
	sw	a2,96(a3)
	lw	a2,80(a5)
	lw	a6,20(a4)
	callmul	a2,a2,a6
	sub	a2,a0,a2
	sw	a2,100(a3)
	jal	x0,.L18
.L15:
	sw	a2,176(a3)
	lw	a6,8(a4)
	lw	s4,240(a5)
	lw	a2,248(a3)
	addi	a0,zero,3
	callmul	s4,a6,s4
	addi	a5,a5,80
	addi	a4,a4,4
	addi	a3,a3,84
	addi	a7,a0,0
	sub	a2,a2,s4
	jal	x0,.L2
.L9:
	calldiv	a2,a2,s5
	lw	s5,168(a3)
	sw	a2,244(a3)
	lw	s6,8(a4)
	lw	a2,160(a5)
	lw	a6,88(a4)
	callmul	a2,a2,s6
	lw	s6,164(a5)
	callmul	a6,a6,s6
	sub	a2,s5,a2
	sub	a2,a2,a6
	jal	x0,.L10
.L39:
	lw	s5,84(a3)
	addi	s4,zero,5
	calldiv	a2,a2,s5
	sw	a2,164(a3)
	jal	x0,.L6
.L42:
	sw	a2,180(a3)
	lw	a6,8(a4)
	lw	s4,240(a5)
	lw	a2,248(a3)
	addi	a0,zero,2
	callmul	s4,a6,s4
	addi	a5,a5,80
	addi	a4,a4,4
	addi	a3,a3,84
	addi	a7,a0,0
	sub	a2,a2,s4
	jal	x0,.L2
.L41:
	calldiv	a2,a2,s5
	sw	a2,324(a3)
	jal	x0,.L4
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
	addi	s6,zero,1478
	lui	s7,%hi(chkerr)
	addi	s5,zero,4
	addi	s9,zero,3
	addi	s4,zero,5
	addi	s3,zero,6
	addi	s1,zero,7
	addi	s8,zero,29
	addi	s2,zero,8
.L44:
	addi	a5,zero,37
	addi	a4,zero,45
	sw	a5,1604(s0)
	sw	a4,1608(s0)
	addi	a5,zero,12
	addi	a4,zero,16
	addi	a3,zero,10
	sw	a5,168(s0)
	sw	a4,252(s0)
	addi	a5,zero,9
	addi	a4,zero,53
	sw	a5,180(s0)
	sw	a5,256(s0)
	sw	a5,332(s0)
	sw	a3,260(s0)
	sw	a4,1612(s0)
	addi	a6,zero,20
	addi	a4,zero,11
	addi	a0,zero,61
	addi	a1,zero,24
	addi	a2,zero,69
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
	auipc	ra,%pcrel_hi(ludcmp.constprop.0.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
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
	jalr	zero,ra,0
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	addi	sp,sp,-48
	sw	s8,8(sp)
	sw	ra,44(sp)
	lui	s8,%hi(chkerr)
	blt	zero,a0,.+8
	jal	x0,.L48
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
	addi	s7,a0,0
	addi	s0,s0,%lo(.LANCHOR0)
	addi	s6,zero,0
	lui	s8,%hi(chkerr)
	addi	s5,zero,4
	addi	s10,zero,3
	addi	s4,zero,5
	addi	s3,zero,6
	addi	s1,zero,7
	addi	s9,zero,29
	addi	s2,zero,8
.L49:
	addi	a5,zero,37
	addi	a4,zero,45
	sw	a5,1604(s0)
	sw	a4,1608(s0)
	addi	a5,zero,12
	addi	a4,zero,16
	addi	a3,zero,10
	sw	a5,168(s0)
	sw	a4,252(s0)
	addi	a5,zero,9
	addi	a4,zero,53
	sw	a5,180(s0)
	sw	a5,256(s0)
	sw	a5,332(s0)
	sw	a3,260(s0)
	sw	a4,1612(s0)
	addi	a6,zero,20
	addi	a4,zero,11
	addi	a0,zero,61
	addi	a1,zero,24
	addi	a2,zero,69
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
	auipc	ra,%pcrel_hi(ludcmp.constprop.0.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_2)
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
	jalr	zero,ra,0
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
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
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a5,%hi(.LANCHOR1)
	addi	sp,sp,-80
	addi	a5,a5,%lo(.LANCHOR1)
	addi	a3,a5,80
	addi	a4,sp,0
.L58:
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
	bne	a5,a3,.L58
	lui	a1,%hi(.LANCHOR0)
	addi	a1,a1,%lo(.LANCHOR0)
	addi	a5,a1,1680
	addi	a4,sp,0
	addi	a1,a1,1760
.L61:
	addi	op_0,x0,255
	addi	op_3,x0,255
	lw	op_4,0(a5)
	or	op_2,op_3,op_4
	lw	op_5,0(a5)
	sub	op_1,op_2,op_5
	sub	a3,op_0,op_1
	addi	op_0,x0,255
	addi	op_3,x0,255
	lw	op_4,0(a4)
	or	op_2,op_3,op_4
	lw	op_5,0(a4)
	sub	op_1,op_2,op_5
	sub	a2,op_0,op_1
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a3,a2,.L65
	bne	a1,a5,.L61
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	addi	sp,sp,80
	jalr	zero,ra,0
.L65:
	sub	a3,a3,a2
	or	a0,a0,a3
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	addi	sp,sp,80
	jalr	zero,ra,0
	.size	verify_benchmark, .-verify_benchmark
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	jalr	zero,ra,0
	.size	initialise_benchmark, .-initialise_benchmark
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
	addi	a0,zero,1
	sw	ra,28(sp)
.Lpcrel_5:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_5)
.Lpcrel_6:
	auipc	ra,%pcrel_hi(benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_6)
	sw	a0,12(sp)
	lw	a0,12(sp)
.Lpcrel_7:
	auipc	ra,%pcrel_hi(verify_benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_7)
	lw	ra,28(sp)
	addi	op_1,x0,1
	or	op_0,op_1,a0
	addi	op_3,x0,1
	addi	op_6,x0,1
	or	op_5,op_6,a0
	sub	op_4,op_5,a0
	sub	op_2,op_3,op_4
	sub	a0,op_0,op_2
	addi	sp,sp,32
	jalr	zero,ra,0
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
	blt	zero,a1,.+8
	jal	x0,.L74
	sw	s2,420(sp)
	addi	op_0,x0,2
	sll	s2,a1,op_0
	sub	op_0,x0,s2
	sub	t1,a1,op_0
	sw	s0,428(sp)
	addi	op_1,x0,2
	sll	op_0,t1,op_1
	addi	op_2,x0,2
	sll	t1,op_0,op_2
	addi	s0,s1,80
	sw	s3,416(sp)
	sw	s6,404(sp)
	sw	s5,408(sp)
	sw	s7,400(sp)
	sub	op_0,x0,t1
	sub	t1,s0,op_0
	sub	op_0,x0,s2
	sub	t4,s0,op_0
	addi	t2,s0,0
	addi	t3,s0,0
	addi	t0,a1,0
	addi	a7,s1,0
	addi	s6,zero,0
	addi	t5,zero,0
	addi	t6,zero,0
	addi	s3,s1,-4
.L83:
	addi	t6,t6,1
	blt	a1,t6,.L75
	addi	a6,t2,0
.L80:
	lw	a2,0(a6)
	bne	t5,zero,.L105
	lw	a5,0(a7)
	addi	a6,a6,80
	calldiv	a5,a2,a5
	sw	a5,-80(a6)
	bne	a6,t1,.L80
.L78:
	addi	a7,a7,84
	addi	s6,s6,-80
	addi	a6,a7,0
	addi	s5,t2,0
.L82:
	lw	a2,4(s5)
	sub	op_0,x0,s6
	sub	a5,a6,op_0
	addi	a3,t3,0
.L81:
	lw	a4,0(a3)
	lw	a0,0(a5)
	addi	a5,a5,80
	addi	a3,a3,4
	callmul	a4,a4,a0
	sub	a2,a2,a4
	bne	a5,a6,.L81
	sw	a2,4(s5)
	addi	s5,s5,4
	addi	a6,a5,4
	bne	s5,t4,.L82
	addi	t5,t5,1
	addi	t4,t4,80
	addi	t3,t3,80
	addi	t2,t2,84
	addi	t1,t1,4
	bne	a1,t6,.L83
.L75:
	addi	a6,sp,4
	sw	s4,0(sp)
	sub	op_0,x0,a6
	sub	t3,s2,op_0
	addi	t1,s1,1604
	addi	a7,sp,0
.L86:
	lw	a2,0(t1)
	addi	a5,a7,0
	addi	a3,s0,0
.L85:
	lw	a4,0(a3)
	lw	a0,0(a5)
	addi	a5,a5,4
	addi	a3,a3,4
	callmul	a4,a4,a0
	sub	a2,a2,a4
	bne	a5,a6,.L85
	sw	a2,0(a5)
	addi	a6,a5,4
	addi	t1,t1,4
	addi	s0,s0,80
	bne	a6,t3,.L86
	addi	a5,zero,84
	callmul	a5,a1,a5
	sub	op_0,x0,a7
	sub	a4,s2,op_0
	sub	op_0,x0,s1
	sub	a3,s2,op_0
	addi	t1,s1,-80
	addi	t3,s1,1680
	addi	a6,s1,1684
	lw	a4,0(a4)
	addi	a7,a7,-4
	sub	op_0,x0,a7
	sub	a7,s2,op_0
	sub	op_0,x0,t3
	sub	t3,s2,op_0
	sub	op_0,x0,s1
	sub	s1,a5,op_0
	lw	a2,0(s1)
	sub	op_0,x0,t1
	sub	t1,a5,op_0
	sub	op_0,x0,a6
	sub	a6,s2,op_0
	calldiv	a5,a4,a2
	sw	a5,1680(a3)
.L89:
	lw	a2,0(a7)
	blt	a1,t0,.L87
.L106:
	addi	a5,t3,0
	addi	a3,t1,0
.L88:
	lw	a4,0(a3)
	lw	a0,0(a5)
	addi	a5,a5,4
	addi	a3,a3,4
	callmul	a4,a4,a0
	sub	a2,a2,a4
	bne	a6,a5,.L88
	lw	a5,-4(t1)
	addi	t0,t0,-1
	calldiv	a2,a2,a5
	sw	a2,-4(t3)
	bne	t0,zero,.+8
	jal	x0,.L104
	addi	a7,a7,-4
	addi	t3,t3,-4
	addi	t1,t1,-84
	lw	a2,0(a7)
	blt	a1,t0,.+8
	jal	x0,.L106
.L87:
	lw	a5,-4(t1)
	addi	a7,a7,-4
	addi	t0,t0,-1
	calldiv	a2,a2,a5
	addi	t1,t1,-84
	addi	t3,t3,-4
	sw	a2,0(t3)
	jal	x0,.L89
.L105:
	sub	s5,zero,t6
	addi	op_0,x0,2
	sll	s5,s5,op_0
	addi	s7,s5,4
	sub	s5,s3,s5
.L79:
	sub	op_0,x0,a6
	sub	a3,s7,op_0
	addi	a5,s5,0
.L77:
	lw	a4,0(a3)
	lw	a0,0(a5)
	addi	a5,a5,80
	addi	a3,a3,4
	callmul	a4,a4,a0
	sub	a2,a2,a4
	bne	a5,a7,.L77
	lw	a5,0(a7)
	addi	a6,a6,80
	calldiv	a5,a2,a5
	sw	a5,-80(a6)
	bne	a6,t1,.+8
	jal	x0,.L78
	lw	a2,0(a6)
	jal	x0,.L79
.L104:
	lw	s0,428(sp)
	lw	s2,420(sp)
	lw	s3,416(sp)
	lw	s5,408(sp)
	lw	s6,404(sp)
	lw	s7,400(sp)
	lw	s1,424(sp)
	lw	s4,412(sp)
	addi	a0,zero,0
	addi	sp,sp,432
	jalr	zero,ra,0
.L74:
	addi	a5,zero,84
	callmul	a5,a1,a5
	addi	op_0,x0,2
	sll	a1,a1,op_0
	sw	s4,0(sp)
	sub	op_0,x0,a1
	sub	a4,sp,op_0
	lw	a4,0(a4)
	sub	op_0,x0,s1
	sub	a1,a1,op_0
	lw	s4,412(sp)
	addi	a0,zero,0
	sub	op_0,x0,s1
	sub	a5,a5,op_0
	lw	a5,0(a5)
	lw	s1,424(sp)
	calldiv	a5,a4,a5
	sw	a5,1680(a1)
	addi	sp,sp,432
	jalr	zero,ra,0
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
	bne	a3,x0,.+8
	jal	x0,.Mul_skip
	sub	op_0,x0,a0
	sub	a0,a2,op_0
.Mul_skip:
	addi	op_0,x0,1
	srl	a1,a1,op_0
	addi	op_0,x0,1
	sll	a2,a2,op_0
	bne	a1,x0,.Mul_loop
	jalr	x0,ra,0

.text
.align 2

# Signed 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_divsi3
__riscv_div_lib_divsi3:
	blt	a0,zero,__riscv_div_lib_L10
	blt	a1,zero,__riscv_div_lib_L11
    # Since the quotient is positive, fall into udivsi3

# Unsigned 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_udivsi3
__riscv_div_lib_udivsi3:
	addi	a2,a1,0
	addi	a1,a0,0
	addi	a0,zero,-1
	bne	a2,zero,.+8
	jal	x0,__riscv_div_lib_L5
	addi	a3,zero,1
	bltu	a2,a1,.+8
	jal	x0,__riscv_div_lib_L2
__riscv_div_lib_L1:
	blt	zero,a2,.+8
	jal	x0,__riscv_div_lib_L2
	addi	op_0,x0,1
	sll	a2,a2,op_0
	addi	op_0,x0,1
	sll	a3,a3,op_0
	bltu	a2,a1,__riscv_div_lib_L1
__riscv_div_lib_L2:
	addi	a0,zero,0
__riscv_div_lib_L3:
	bltu	a1,a2,__riscv_div_lib_L4
	sub	a1,a1,a2
	or	a0,a0,a3
__riscv_div_lib_L4:
	addi	op_0,x0,1
	srl	a3,a3,op_0
	addi	op_0,x0,1
	srl	a2,a2,op_0
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
	blt	zero,a1,__riscv_div_lib_L12
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
	blt	a1,zero,__riscv_div_lib_L31
	blt	a0,zero,__riscv_div_lib_L32
__riscv_div_lib_L30:
.Lpcrel_div3:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div3)
	addi	a0,a1,0
	jalr	zero,t0,0
__riscv_div_lib_L31:
	sub	a1,zero,a1
	blt	a0,zero,.+8
	jal	x0,__riscv_div_lib_L30
__riscv_div_lib_L32:
	sub	a0,zero,a0
.Lpcrel_div4:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div4)
	sub	a0,zero,a1
	jalr	zero,t0,0

# end of subrountine