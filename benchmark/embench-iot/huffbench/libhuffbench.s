	.file	"libhuffbench.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	heap_adjust, @function
heap_adjust:
	srli	t5,a2,31
	addi	a1,a1,-4
	slli	a5,a3,2
	add	t5,t5,a2
	add	a5,a1,a5
	srai	t5,t5,1
	lw	t2,0(a5)
	bgt	a3,t5,.L2
	slli	t6,t2,2
	add	t6,a0,t6
	j	.L4
.L10:
	mv	a4,t3
	mv	a6,t4
	mv	a7,t0
.L3:
	lw	t3,0(t6)
	slli	a3,a3,2
	sub	a5,a5,a3
	bltu	t3,a6,.L2
.L11:
	sw	a7,0(a5)
	bgt	a4,t5,.L9
	mv	a3,a4
.L4:
	slli	a5,a3,3
	add	a5,a1,a5
	lw	a7,0(a5)
	slli	a4,a3,1
	addi	t3,a4,1
	slli	a6,a7,2
	add	a6,a0,a6
	lw	a6,0(a6)
	slli	t4,t3,2
	mv	t1,a5
	ble	a2,a4,.L3
	add	t1,a1,t4
	lw	t0,0(t1)
	slli	t4,t0,2
	add	t4,a0,t4
	lw	t4,0(t4)
	bltu	t4,a6,.L10
	lw	t3,0(t6)
	slli	a3,a3,2
	mv	t1,a5
	sub	a5,a5,a3
	bgeu	t3,a6,.L11
.L2:
	sw	t2,0(a5)
	ret
.L9:
	mv	a5,t1
	sw	t2,0(a5)
	ret
	.size	heap_adjust, .-heap_adjust
	.align	2
	.type	heap_adjust.constprop.0, @function
heap_adjust.constprop.0:
	li	a5,1
	lw	t2,0(a1)
	ble	a2,a5,.L13
	slli	t5,t2,2
	addi	t4,a1,-4
	add	t5,a0,t5
	srai	t0,a2,1
	j	.L15
.L20:
	mv	a4,t1
	mv	a3,t3
	mv	a6,t6
.L14:
	lw	t1,0(t5)
	slli	a5,a5,2
	sub	a1,a1,a5
	bltu	t1,a3,.L13
.L21:
	sw	a6,0(a1)
	blt	t0,a4,.L19
	mv	a5,a4
.L15:
	slli	a1,a5,3
	add	a1,t4,a1
	lw	a6,0(a1)
	slli	a4,a5,1
	addi	t1,a4,1
	slli	a3,a6,2
	add	a3,a0,a3
	lw	a3,0(a3)
	slli	t3,t1,2
	mv	a7,a1
	bge	a4,a2,.L14
	add	a7,t4,t3
	lw	t6,0(a7)
	slli	t3,t6,2
	add	t3,a0,t3
	lw	t3,0(t3)
	bltu	t3,a3,.L20
	lw	t1,0(t5)
	slli	a5,a5,2
	mv	a7,a1
	sub	a1,a1,a5
	bgeu	t1,a3,.L21
.L13:
	sw	t2,0(a1)
	ret
.L19:
	mv	a1,a7
	sw	t2,0(a1)
	ret
	.size	heap_adjust.constprop.0, .-heap_adjust.constprop.0
	.align	2
	.type	compdecomp.constprop.0, @function
compdecomp.constprop.0:
	lui	a2,%hi(heap_ptr)
	lw	a5,%lo(heap_ptr)(a2)
	li	t0,-4096
	addi	sp,sp,-2032
	addi	t0,t0,-1632
	sw	ra,2028(sp)
	sw	s0,2024(sp)
	sw	s1,2020(sp)
	sw	s2,2016(sp)
	sw	s3,2012(sp)
	sw	s4,2008(sp)
	sw	s5,2004(sp)
	sw	s6,2000(sp)
	sw	s7,1996(sp)
	sw	s8,1992(sp)
	sw	s9,1988(sp)
	sw	s10,1984(sp)
	sw	s11,1980(sp)
	add	sp,sp,t0
	sw	a5,8(sp)
	lw	a4,8(sp)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	addi	a4,a4,501
	andi	a0,a4,3
	addi	a5,a5,501
	beq	a0,zero,.L23
	li	a1,4
	sub	a1,a1,a0
	add	a4,a4,a1
	add	a5,a5,a1
.L23:
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a1,a4,.L81
	lw	a5,8(sp)
	sw	a4,%lo(heap_ptr)(a2)
	neg	a3,a5
	andi	a5,a3,3
	beq	a5,zero,.L82
	lw	a4,8(sp)
	andi	a3,a3,2
	sb	zero,0(a4)
	beq	a3,zero,.L83
	sb	zero,1(a4)
	li	a4,3
	bne	a5,a4,.L84
	lw	a4,8(sp)
	mv	a3,a5
	li	a0,498
	sb	zero,2(a4)
.L24:
	lw	a4,8(sp)
	li	a2,501
	sub	a2,a2,a5
	andi	a1,a2,-4
	add	a5,a4,a5
	add	a4,a5,a1
.L26:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L26
	beq	a2,a1,.L27
	lw	a4,8(sp)
	add	a5,a3,a1
	li	a3,1
	add	a5,a4,a5
	sb	zero,0(a5)
	sub	a4,a0,a1
	beq	a4,a3,.L27
	sb	zero,1(a5)
	li	a3,2
	beq	a4,a3,.L27
	sb	zero,2(a5)
.L27:
	li	a5,4096
	addi	a5,a5,1552
	add	s9,a5,sp
	li	a4,4096
	addi	s9,s9,-2048
	addi	a4,a4,1552
	mv	s6,s9
	mv	a5,s9
	add	s5,a4,sp
.L28:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	s5,a5,.L28
	addi	a4,sp,1552
	addi	a5,sp,528
.L29:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L29
	mv	s7,s5
	mv	a5,s5
.L30:
	li	a4,8192
	addi	a4,a4,-512
	addi	a3,sp,16
	sw	zero,0(a5)
	add	a4,a4,a3
	addi	a5,a5,4
	bne	a5,a4,.L30
	addi	s0,sp,1552
	addi	a4,s0,1024
	mv	a5,s0
.L31:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L31
	addi	s1,sp,16
	addi	a4,s1,256
	mv	a5,s1
.L32:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L32
	lui	a5,%hi(.LANCHOR0)
	lui	s3,%hi(.LANCHOR0+500)
	addi	a4,a5,%lo(.LANCHOR0)
	addi	a5,s3,%lo(.LANCHOR0+500)
	sw	a5,12(sp)
.L33:
	lbu	a5,0(a4)
	addi	a4,a4,1
	slli	a5,a5,2
	add	a5,s9,a5
	lw	a3,0(a5)
	addi	a3,a3,1
	sw	a3,0(a5)
	lw	a5,12(sp)
	bne	a4,a5,.L33
	addi	a1,sp,-496
	mv	a3,s9
	li	s10,0
	li	a5,0
	li	a0,256
.L35:
	lw	a2,0(a3)
	slli	a4,s10,2
	add	a4,a1,a4
	beq	a2,zero,.L34
	sw	a5,1024(a4)
	addi	s10,s10,1
.L34:
	addi	a5,a5,1
	addi	a3,a3,4
	bne	a5,a0,.L35
	beq	s10,zero,.L36
	mv	s3,s10
.L37:
	mv	a3,s3
	mv	a2,s10
	addi	a1,sp,528
	mv	a0,s9
	addi	s3,s3,-1
	call	heap_adjust
	bne	s3,zero,.L37
	li	a5,1
	beq	s10,a5,.L38
	slli	a4,s10,2
	addi	a7,sp,524
	addi	s8,s9,1020
	add	s3,a7,a4
	addi	s10,s10,255
	add	s8,s8,a4
.L39:
	lw	a4,0(s3)
	addi	a2,s10,-256
	addi	a1,sp,528
	mv	a0,s9
	lw	s2,528(sp)
	sw	a2,4(sp)
	sw	a4,528(sp)
	call	heap_adjust.constprop.0
	lw	a4,528(sp)
	slli	a3,s2,2
	add	a0,s9,a3
	slli	a4,a4,2
	add	a1,s9,a4
	lw	a0,0(a0)
	lw	a1,0(a1)
	lw	a2,4(sp)
	add	a3,s5,a3
	add	a1,a1,a0
	sw	s10,0(a3)
	sw	a1,0(s8)
	neg	a3,s10
	add	a4,s5,a4
	addi	a1,sp,528
	mv	a0,s9
	sw	s10,528(sp)
	sw	a3,0(a4)
	call	heap_adjust.constprop.0
	addi	s10,s10,-1
	li	a5,256
	addi	s3,s3,-4
	addi	s8,s8,-4
	bne	s10,a5,.L39
.L38:
	li	a5,257
.L36:
	slli	a5,a5,2
	add	a5,s5,a5
	sw	zero,0(a5)
	addi	t1,s9,1024
	mv	a0,s1
	mv	a7,s0
	li	t3,0
	li	t4,0
	j	.L48
.L40:
	sw	a2,0(a7)
	sb	a4,0(a0)
	addi	s6,s6,4
	addi	a7,a7,4
	addi	a0,a0,1
	addi	s7,s7,4
	beq	t1,s6,.L139
.L48:
	lw	a2,0(s6)
	li	a4,0
	beq	a2,zero,.L40
	lw	a5,0(s7)
	beq	a5,zero,.L86
	li	a6,0
	li	a2,0
	li	a1,1
.L45:
	slli	a4,a5,2
	sub	a3,s5,a4
	add	a4,s5,a4
	blt	a5,zero,.L140
	lw	a5,0(a4)
	addi	a6,a6,1
	slli	a1,a1,1
	bne	a5,zero,.L45
.L43:
	mv	a4,a6
	bgeu	t4,a2,.L46
	mv	t4,a2
.L46:
	bgeu	t3,a6,.L40
	sw	a2,0(a7)
	sb	a4,0(a0)
	addi	s6,s6,4
	mv	t3,a6
	addi	a7,a7,4
	addi	a0,a0,1
	addi	s7,s7,4
	bne	t1,s6,.L48
.L139:
	sltiu	t3,t3,33
	beq	t3,zero,.L22
	beq	t4,zero,.L22
	lui	a5,%hi(.LANCHOR0)
	addi	t4,sp,-496
	li	a7,0
	li	a1,-1
	li	a3,0
	addi	t3,a5,%lo(.LANCHOR0)
	li	t6,1
	li	t1,7
	li	t5,500
.L55:
	lbu	a0,0(t3)
	add	a5,t4,a0
	lbu	a6,512(a5)
	beq	a6,zero,.L50
	addi	a4,a6,-1
	sll	a4,t6,a4
	li	a2,0
.L54:
	beq	a1,t1,.L141
	addi	a1,a1,1
	slli	a3,a3,1
.L52:
	slli	a5,a0,2
	add	a5,s9,a5
	lw	a5,-2048(a5)
	addi	a2,a2,1
	and	a5,a4,a5
	beq	a5,zero,.L53
	ori	a3,a3,1
.L53:
	srli	a4,a4,1
	bltu	a2,a6,.L54
.L50:
	lw	a5,12(sp)
	addi	t3,t3,1
	bne	t3,a5,.L55
	lw	a4,8(sp)
	li	a5,7
	sub	a5,a5,a1
	addi	t5,sp,2047
	add	a7,a4,a7
	sll	a3,a3,a5
	addi	t5,t5,529
	sb	a3,0(a7)
	addi	a4,t5,1024
	mv	a5,t5
.L56:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L56
	addi	t1,sp,272
	mv	t3,t5
	li	a6,0
	li	t6,1
	li	t4,256
	j	.L62
.L57:
	addi	a6,a6,1
	addi	s0,s0,4
	addi	s1,s1,1
	addi	t3,t3,4
	beq	a6,t4,.L142
.L62:
	lw	a0,0(s0)
	lbu	a1,0(s1)
	sb	a6,0(t1)
	addi	t1,t1,1
	or	a5,a0,a1
	beq	a5,zero,.L57
	beq	a1,zero,.L87
	addi	a3,a1,-1
	sll	a3,t6,a3
	li	a2,0
	li	a5,0
.L61:
	addi	a7,a5,1
	and	a4,a0,a3
	slli	a5,a5,1
	addi	a5,a5,1
	beq	a4,zero,.L60
	slli	a5,a7,1
.L60:
	addi	a2,a2,1
	srli	a3,a3,1
	bne	a1,a2,.L61
	sw	a5,0(t3)
	j	.L57
.L83:
	li	a3,1
	li	a0,500
	j	.L24
.L140:
	lw	a5,0(a3)
	add	a2,a2,a1
	addi	a6,a6,1
	beq	a5,zero,.L43
	slli	a1,a1,1
	j	.L45
.L86:
	li	a2,0
	j	.L40
.L141:
	lw	a5,8(sp)
	add	a5,a5,a7
	sb	a3,0(a5)
	addi	a7,a7,1
	beq	a7,t5,.L22
	lbu	a0,0(t3)
	li	a3,0
	li	a1,0
	add	a5,t4,a0
	lbu	a6,512(a5)
	j	.L52
.L22:
	li	t0,4096
	addi	t0,t0,1632
	add	sp,sp,t0
	lw	ra,2028(sp)
	lw	s0,2024(sp)
	lw	s1,2020(sp)
	lw	s2,2016(sp)
	lw	s3,2012(sp)
	lw	s4,2008(sp)
	lw	s5,2004(sp)
	lw	s6,2000(sp)
	lw	s7,1996(sp)
	lw	s8,1992(sp)
	lw	s9,1988(sp)
	lw	s10,1984(sp)
	lw	s11,1980(sp)
	addi	sp,sp,2032
	jr	ra
.L87:
	li	a5,0
	sw	a5,0(t3)
	j	.L57
.L84:
	li	a3,2
	li	a0,499
	j	.L24
.L81:
	sw	zero,8(sp)
	li	a5,0
	li	a0,501
	li	a3,0
	j	.L24
.L82:
	li	a3,0
	li	a0,501
	j	.L24
.L142:
	addi	t5,t5,4
	addi	a6,sp,273
	mv	t1,t5
	addi	t4,sp,-496
	li	a7,1
	li	t6,256
.L66:
	lw	a0,0(t1)
	lbu	t3,0(a6)
	mv	a4,a6
	mv	a5,t1
	mv	a3,a7
.L63:
	lw	a2,-4(a5)
	bgeu	a0,a2,.L64
	lbu	a1,-1(a4)
	sw	a2,0(a5)
	addi	a3,a3,-1
	sb	a1,0(a4)
	addi	a5,a5,-4
	addi	a4,a4,-1
	bne	a3,zero,.L63
.L64:
	slli	a5,a3,2
	add	a5,s9,a5
	add	a3,t4,a3
	addi	a7,a7,1
	sw	a0,-1024(a5)
	sb	t3,768(a3)
	addi	t1,t1,4
	addi	a6,a6,1
	bne	a7,t6,.L66
	lw	a0,-1024(s9)
	bne	a0,zero,.L88
	mv	a5,t5
.L68:
	lw	a6,0(a5)
	addi	a5,a5,4
	addi	a0,a0,1
	beq	a6,zero,.L68
.L67:
	lw	a5,8(sp)
	addi	t3,sp,-496
	mv	a3,a6
	lbu	a7,0(a5)
	lui	a5,%hi(.LANCHOR0)
	addi	s4,a5,%lo(.LANCHOR0)
	mv	a4,a0
	li	t1,0
	li	a1,128
	li	a2,0
	li	t4,1
	li	t6,500
.L80:
	and	a5,a7,a1
	beq	a5,zero,.L69
.L143:
	addi	a2,a2,1
	slli	a2,a2,1
.L70:
	slli	a5,a4,2
	add	a5,a5,t5
	bleu	a2,a3,.L72
.L71:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,1
	bltu	a3,a2,.L71
.L72:
	beq	a2,a3,.L74
	beq	a1,t4,.L75
	srli	a1,a1,1
	and	a5,a7,a1
	bne	a5,zero,.L143
.L69:
	slli	a2,a2,1
	addi	a2,a2,1
	j	.L70
.L74:
	add	a4,t3,a4
	lbu	a5,768(a4)
	addi	t1,t1,1
	sb	a5,0(s4)
	beq	a1,t4,.L77
	srli	a1,a1,1
.L78:
	beq	t1,t6,.L22
	lw	a5,8(sp)
	addi	s4,s4,1
	mv	a3,a6
	lbu	a7,0(a5)
	mv	a4,a0
	li	a2,0
	j	.L80
.L75:
	lw	a5,8(sp)
	li	a1,128
	addi	a5,a5,1
	sw	a5,8(sp)
	lbu	a7,0(a5)
	j	.L80
.L77:
	lw	a5,8(sp)
	li	a1,128
	addi	a5,a5,1
	sw	a5,8(sp)
	j	.L78
.L88:
	mv	a6,a0
	li	a0,0
	j	.L67
	.size	compdecomp.constprop.0, .-compdecomp.constprop.0
	.align	2
	.type	benchmark_body.constprop.0.isra.0, @function
benchmark_body.constprop.0.isra.0:
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	lui	s2,%hi(heap+8192)
	lui	s3,%hi(heap)
	lui	s0,%hi(.LANCHOR0+500)
	sw	s1,36(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	s8,8(sp)
	sw	ra,44(sp)
	addi	s3,s3,%lo(heap)
	addi	s2,s2,%lo(heap+8192)
	addi	s0,s0,%lo(.LANCHOR0+500)
	li	s1,11
	lui	s8,%hi(heap_ptr)
	lui	s7,%hi(heap_end)
	lui	s6,%hi(heap_requested)
	lui	s5,%hi(.LANCHOR0)
	lui	s4,%hi(.LANCHOR1)
.L146:
	sw	s3,%lo(heap_ptr)(s8)
	sw	s2,%lo(heap_end)(s7)
	sw	zero,%lo(heap_requested)(s6)
	addi	a5,s5,%lo(.LANCHOR0)
	addi	a4,s4,%lo(.LANCHOR1)
.L145:
	lw	a3,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a5)
	bne	s0,a5,.L145
	addi	s1,s1,-1
	call	compdecomp.constprop.0
	bne	s1,zero,.L146
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
	lw	s8,8(sp)
	addi	sp,sp,48
	jr	ra
	.size	benchmark_body.constprop.0.isra.0, .-benchmark_body.constprop.0.isra.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	ble	a0,zero,.L157
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	lui	s2,%hi(heap+8192)
	lui	s3,%hi(heap)
	lui	s0,%hi(.LANCHOR1+500)
	sw	s1,36(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	s8,8(sp)
	sw	s9,4(sp)
	sw	ra,44(sp)
	mv	s1,a0
	addi	s3,s3,%lo(heap)
	addi	s2,s2,%lo(heap+8192)
	addi	s0,s0,%lo(.LANCHOR1+500)
	li	s9,0
	lui	s8,%hi(heap_ptr)
	lui	s7,%hi(heap_end)
	lui	s6,%hi(heap_requested)
	lui	s5,%hi(.LANCHOR1)
	lui	s4,%hi(.LANCHOR0)
.L153:
	sw	s3,%lo(heap_ptr)(s8)
	sw	s2,%lo(heap_end)(s7)
	sw	zero,%lo(heap_requested)(s6)
	addi	a5,s5,%lo(.LANCHOR1)
	addi	a4,s4,%lo(.LANCHOR0)
.L152:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a5,s0,.L152
	addi	s9,s9,1
	call	compdecomp.constprop.0
	bne	s9,s1,.L153
	lw	ra,44(sp)
	lw	s0,40(sp)
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
	jr	ra
.L157:
	ret
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
	.globl	compdecomp
	.type	compdecomp, @function
compdecomp:
	li	t0,-4096
	addi	sp,sp,-2032
	addi	t0,t0,-1632
	sw	ra,2028(sp)
	sw	s0,2024(sp)
	sw	s1,2020(sp)
	sw	s2,2016(sp)
	sw	s3,2012(sp)
	sw	s4,2008(sp)
	sw	s5,2004(sp)
	sw	s6,2000(sp)
	sw	s7,1996(sp)
	sw	s8,1992(sp)
	sw	s9,1988(sp)
	sw	s10,1984(sp)
	sw	s11,1980(sp)
	add	sp,sp,t0
	sw	a1,8(sp)
	addi	a2,a1,1
	sw	a0,12(sp)
	beq	a2,zero,.L226
	lui	a1,%hi(heap_ptr)
	lw	a5,%lo(heap_ptr)(a1)
	lui	a3,%hi(heap_requested)
	sw	a5,4(sp)
	lw	a4,4(sp)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a4,a2
	andi	a0,a4,3
	add	a5,a2,a5
	bne	a0,zero,.L293
	lui	a0,%hi(heap_end)
	lw	a0,%lo(heap_end)(a0)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a0,a4,.L294
.L166:
	sw	a4,%lo(heap_ptr)(a1)
	lw	a4,8(sp)
	li	a5,5
	bleu	a4,a5,.L228
	lw	a5,4(sp)
	neg	a4,a5
	andi	a5,a4,3
	beq	a5,zero,.L229
	lw	a3,4(sp)
	andi	a4,a4,2
	sb	zero,0(a3)
	li	a3,1
	beq	a4,zero,.L168
	lw	a4,4(sp)
	li	a3,2
	sb	zero,1(a4)
	li	a4,3
	bne	a5,a4,.L168
	lw	a4,4(sp)
	mv	a3,a5
	sb	zero,2(a4)
.L168:
	lw	a4,4(sp)
	sub	a0,a2,a5
	andi	a1,a0,-4
	add	a5,a4,a5
	add	a4,a5,a1
.L170:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L170
	add	a5,a3,a1
	beq	a0,a1,.L164
.L167:
	lw	a4,4(sp)
	add	a4,a4,a5
	sb	zero,0(a4)
	addi	a4,a5,1
	bleu	a2,a4,.L164
	lw	a3,4(sp)
	add	a4,a3,a4
	sb	zero,0(a4)
	addi	a4,a5,2
	bleu	a2,a4,.L164
	add	a4,a3,a4
	sb	zero,0(a4)
	addi	a4,a5,3
	bleu	a2,a4,.L164
	add	a4,a3,a4
	sb	zero,0(a4)
	addi	a4,a5,4
	bleu	a2,a4,.L164
	add	a4,a3,a4
	sb	zero,0(a4)
	addi	a5,a5,5
	bleu	a2,a5,.L164
	add	a5,a3,a5
	sb	zero,0(a5)
.L164:
	li	a5,4096
	addi	a5,a5,1552
	add	s9,a5,sp
	li	a4,4096
	addi	s9,s9,-2048
	addi	a4,a4,1552
	mv	s6,s9
	mv	a5,s9
	add	s5,a4,sp
.L173:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	s5,a5,.L173
	addi	a4,sp,1552
	addi	a5,sp,528
.L174:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L174
	mv	s7,s5
	mv	a5,s5
.L175:
	li	a4,8192
	addi	a4,a4,-512
	addi	a3,sp,16
	sw	zero,0(a5)
	add	a4,a4,a3
	addi	a5,a5,4
	bne	a5,a4,.L175
	addi	s0,sp,1552
	addi	a4,s0,1024
	mv	a5,s0
.L176:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L176
	addi	s1,sp,16
	addi	a4,s1,256
	mv	a5,s1
.L177:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L177
	lw	a5,12(sp)
	lw	a4,8(sp)
	add	a2,a5,a4
	mv	a4,a5
	lw	a5,8(sp)
	beq	a5,zero,.L181
.L180:
	lbu	a5,0(a4)
	addi	a4,a4,1
	slli	a5,a5,2
	add	a5,s9,a5
	lw	a3,0(a5)
	addi	a3,a3,1
	sw	a3,0(a5)
	bne	a2,a4,.L180
.L181:
	addi	a1,sp,-496
	mv	a3,s9
	li	s10,0
	li	a5,0
	li	a0,256
.L179:
	lw	a2,0(a3)
	slli	a4,s10,2
	add	a4,a1,a4
	beq	a2,zero,.L182
	sw	a5,1024(a4)
	addi	s10,s10,1
.L182:
	addi	a5,a5,1
	addi	a3,a3,4
	bne	a5,a0,.L179
	beq	s10,zero,.L183
	mv	s3,s10
.L184:
	mv	a3,s3
	mv	a2,s10
	addi	a1,sp,528
	mv	a0,s9
	addi	s3,s3,-1
	call	heap_adjust
	bne	s3,zero,.L184
	li	a5,1
	beq	s10,a5,.L185
	slli	a4,s10,2
	addi	a7,sp,524
	addi	s8,s9,1020
	add	s3,a7,a4
	addi	s10,s10,255
	add	s8,s8,a4
.L186:
	lw	a4,0(s3)
	addi	a2,s10,-256
	addi	a1,sp,528
	mv	a0,s9
	lw	s2,528(sp)
	sw	a2,0(sp)
	sw	a4,528(sp)
	call	heap_adjust.constprop.0
	lw	a4,528(sp)
	slli	a3,s2,2
	add	a0,s9,a3
	slli	a4,a4,2
	add	a1,s9,a4
	lw	a0,0(a0)
	lw	a1,0(a1)
	lw	a2,0(sp)
	add	a3,s5,a3
	add	a1,a1,a0
	sw	s10,0(a3)
	sw	a1,0(s8)
	neg	a3,s10
	add	a4,s5,a4
	addi	a1,sp,528
	mv	a0,s9
	sw	s10,528(sp)
	sw	a3,0(a4)
	call	heap_adjust.constprop.0
	addi	s10,s10,-1
	li	a5,256
	addi	s3,s3,-4
	addi	s8,s8,-4
	bne	s10,a5,.L186
.L185:
	li	a5,257
.L183:
	slli	a5,a5,2
	add	a5,s5,a5
	sw	zero,0(a5)
	addi	t1,s9,1024
	mv	a0,s1
	mv	a7,s0
	li	t3,0
	li	t4,0
	j	.L195
.L187:
	sw	a2,0(a7)
	sb	a4,0(a0)
	addi	s6,s6,4
	addi	a7,a7,4
	addi	a0,a0,1
	addi	s7,s7,4
	beq	t1,s6,.L295
.L195:
	lw	a2,0(s6)
	li	a4,0
	beq	a2,zero,.L187
	lw	a5,0(s7)
	li	a2,0
	beq	a5,zero,.L187
	li	a1,1
	li	a6,0
.L192:
	slli	a4,a5,2
	sub	a3,s5,a4
	add	a4,s5,a4
	blt	a5,zero,.L296
	lw	a5,0(a4)
	addi	a6,a6,1
	slli	a1,a1,1
	bne	a5,zero,.L192
.L190:
	bgeu	t4,a2,.L193
	mv	t4,a2
.L193:
	mv	a4,a6
	bgeu	t3,a6,.L187
	sw	a2,0(a7)
	sb	a4,0(a0)
	addi	s6,s6,4
	mv	t3,a6
	addi	a7,a7,4
	addi	a0,a0,1
	addi	s7,s7,4
	bne	t1,s6,.L195
.L295:
	sltiu	t3,t3,33
	beq	t3,zero,.L163
	beq	t4,zero,.L163
	lw	a5,8(sp)
	beq	a5,zero,.L234
	mv	a4,a5
	lw	a5,12(sp)
	addi	t4,sp,-496
	li	a1,-1
	add	t6,a5,a4
	mv	t3,a5
	li	a3,0
	li	a7,0
	li	t5,1
	li	t1,7
.L203:
	lbu	a0,0(t3)
	add	a5,t4,a0
	lbu	a6,512(a5)
	beq	a6,zero,.L198
	addi	a4,a6,-1
	sll	a4,t5,a4
	li	a2,0
.L202:
	beq	a1,t1,.L297
	addi	a1,a1,1
	slli	a3,a3,1
.L200:
	slli	a5,a0,2
	add	a5,s9,a5
	lw	a5,-2048(a5)
	addi	a2,a2,1
	and	a5,a4,a5
	beq	a5,zero,.L201
	ori	a3,a3,1
.L201:
	srli	a4,a4,1
	bgtu	a6,a2,.L202
.L198:
	addi	t3,t3,1
	bne	t3,t6,.L203
	lw	a4,4(sp)
	li	a5,7
	sub	a5,a5,a1
	add	a7,a4,a7
	sll	a3,a3,a5
.L197:
	addi	t5,sp,2047
	addi	t5,t5,529
	sb	a3,0(a7)
	addi	a4,t5,1024
	mv	a5,t5
.L204:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L204
	addi	t1,sp,272
	mv	t3,t5
	li	a6,0
	li	t6,1
	li	t4,256
	j	.L210
.L205:
	addi	a6,a6,1
	addi	s0,s0,4
	addi	s1,s1,1
	addi	t3,t3,4
	beq	a6,t4,.L298
.L210:
	lw	a0,0(s0)
	lbu	a1,0(s1)
	sb	a6,0(t1)
	addi	t1,t1,1
	or	a5,a0,a1
	beq	a5,zero,.L205
	beq	a1,zero,.L235
	addi	a3,a1,-1
	sll	a3,t6,a3
	li	a5,0
	li	a2,0
.L209:
	addi	a7,a5,1
	and	a4,a0,a3
	slli	a5,a5,1
	addi	a5,a5,1
	beq	a4,zero,.L208
	slli	a5,a7,1
.L208:
	addi	a2,a2,1
	srli	a3,a3,1
	bne	a1,a2,.L209
	sw	a5,0(t3)
	j	.L205
.L296:
	lw	a5,0(a3)
	add	a2,a2,a1
	addi	a6,a6,1
	beq	a5,zero,.L190
	slli	a1,a1,1
	j	.L192
.L298:
	addi	t5,t5,4
	addi	a6,sp,273
	mv	t1,t5
	addi	t4,sp,-496
	li	a7,1
	li	t6,256
.L214:
	lw	a0,0(t1)
	lbu	t3,0(a6)
	mv	a4,a6
	mv	a5,t1
	mv	a3,a7
.L211:
	lw	a2,-4(a5)
	bleu	a2,a0,.L212
	lbu	a1,-1(a4)
	sw	a2,0(a5)
	addi	a3,a3,-1
	sb	a1,0(a4)
	addi	a5,a5,-4
	addi	a4,a4,-1
	bne	a3,zero,.L211
.L212:
	slli	a5,a3,2
	add	a5,s9,a5
	add	a3,t4,a3
	addi	a7,a7,1
	sw	a0,-1024(a5)
	sb	t3,768(a3)
	addi	t1,t1,4
	addi	a6,a6,1
	bne	a7,t6,.L214
	lw	a1,-1024(s9)
	bne	a1,zero,.L236
	mv	a5,t5
.L216:
	lw	a6,0(a5)
	addi	a5,a5,4
	addi	a1,a1,1
	beq	a6,zero,.L216
.L215:
	lw	a5,8(sp)
	beq	a5,zero,.L163
	addi	t1,sp,-496
	mv	a3,a6
	mv	a4,a1
	li	a2,0
	li	a0,128
	li	a7,0
	li	t3,1
.L225:
	lw	a5,4(sp)
	lbu	a5,0(a5)
	and	a5,a5,a0
	beq	a5,zero,.L217
	addi	a2,a2,1
	slli	a2,a2,1
.L218:
	slli	a5,a4,2
	add	a5,a5,t5
	bleu	a2,a3,.L220
.L219:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,1
	bltu	a3,a2,.L219
.L220:
	beq	a2,a3,.L299
	beq	a0,t3,.L223
.L300:
	srli	a0,a0,1
.L224:
	lw	a5,8(sp)
	bltu	a7,a5,.L225
.L163:
	li	t0,4096
	addi	t0,t0,1632
	add	sp,sp,t0
	lw	ra,2028(sp)
	lw	s0,2024(sp)
	lw	s1,2020(sp)
	lw	s2,2016(sp)
	lw	s3,2012(sp)
	lw	s4,2008(sp)
	lw	s5,2004(sp)
	lw	s6,2000(sp)
	lw	s7,1996(sp)
	lw	s8,1992(sp)
	lw	s9,1988(sp)
	lw	s10,1984(sp)
	lw	s11,1980(sp)
	addi	sp,sp,2032
	jr	ra
.L293:
	li	a6,4
	sub	a0,a6,a0
	add	a5,a5,a0
	add	a4,a4,a0
	lui	a0,%hi(heap_end)
	lw	a0,%lo(heap_end)(a0)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a0,a4,.L166
.L294:
	lw	a4,8(sp)
	li	a5,5
	sw	zero,4(sp)
	bleu	a4,a5,.L228
	li	a5,0
	li	a3,0
	j	.L168
.L297:
	lw	a5,4(sp)
	add	a5,a5,a7
	sb	a3,0(a5)
	lw	a5,8(sp)
	addi	a7,a7,1
	beq	a5,a7,.L163
	lbu	a0,0(t3)
	li	a3,0
	li	a1,0
	add	a5,t4,a0
	lbu	a6,512(a5)
	j	.L200
.L235:
	li	a5,0
	sw	a5,0(t3)
	j	.L205
.L226:
	sw	zero,4(sp)
	j	.L164
.L299:
	add	a4,t1,a4
	lbu	a5,768(a4)
	lw	a4,12(sp)
	addi	a7,a7,1
	mv	a3,a6
	sb	a5,0(a4)
	lw	a5,12(sp)
	mv	a4,a1
	li	a2,0
	addi	a5,a5,1
	sw	a5,12(sp)
	bne	a0,t3,.L300
.L223:
	lw	a5,4(sp)
	li	a0,128
	addi	a5,a5,1
	sw	a5,4(sp)
	j	.L224
.L217:
	slli	a2,a2,1
	addi	a2,a2,1
	j	.L218
.L228:
	li	a5,0
	j	.L167
.L229:
	li	a3,0
	j	.L168
.L234:
	lw	a7,4(sp)
	li	a3,0
	j	.L197
.L236:
	mv	a6,a1
	li	a1,0
	j	.L215
	.size	compdecomp, .-compdecomp
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lui	a4,%hi(.LANCHOR1+1)
	addi	a1,a5,500
	addi	a4,a4,%lo(.LANCHOR1+1)
	li	a3,74
	j	.L303
.L306:
	lbu	a3,0(a4)
	addi	a4,a4,1
.L303:
	lbu	a2,0(a5)
	addi	a5,a5,1
	bne	a2,a3,.L304
	bne	a1,a5,.L306
	li	a0,1
	ret
.L304:
	li	a0,0
	ret
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
	li	a0,1
	sw	ra,28(sp)
	call	benchmark_body.isra.0
	call	benchmark
	sw	zero,12(sp)
	lw	a5,12(sp)
	lui	a4,%hi(.LANCHOR1)
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	addi	a2,a5,500
	addi	a4,a4,%lo(.LANCHOR1)
.L315:
	lbu	a0,0(a5)
	lbu	a3,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a3,a0,.L318
	bne	a5,a2,.L315
	li	a0,0
.L314:
	lw	ra,28(sp)
	snez	a0,a0
	addi	sp,sp,32
	jr	ra
.L318:
	sub	a0,a0,a3
	j	.L314
	.size	main, .-main
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	orig_data, @object
	.size	orig_data, 500
orig_data:
	.ascii	"J2OZF50FYLD5UTVYYRMT0VXO01VC5FNIB1CG12MTIPT2CIV00BOUWFDRAYTA"
	.ascii	"3AI42KFXHRKPA3LCGA3ABLUYQXJRQ2RN2ZMYERPLC00CXFE3GB3HMS53JIOZ"
	.ascii	"E5HBYTZ2EJHGDBI0HMYNOVU0HUXR2FKBERC3E1ZIEBOHCWCJD0WRPLLX5DI1"
	.ascii	"IS2NE4KI0DR4E5GHWIQZCHKRSVIRYQMBDJOHHYPB1AAAAGHWOXPQ4ZBQOKBH"
	.ascii	"0OI3XWE4OUAJUAJUGQKUIZEGSFXBPYIKGQH3GM2UA23U2HJCXTW5N0G553AP"
	.ascii	"VIZ2YAZ4MVSMRQBNXKPO3FOK5UK5RKOGTHCLH2KUR2ADMBQDLASJFATFU3EF"
	.ascii	"ISL1ZOGAKQU1NV4ZWP3CPPLUP4ZD23IEPT5IBFJLW3HDSF2JUZLDIWYXUR0Q"
	.ascii	"PCU4WTHXZQDPNKSAPOJEIUHQK5I4RCPAFD41XFSQVV5D5RDP5MTHA0YK0AIL"
	.ascii	"CXLH1JCSPVCEKBHKSKZR"
	.bss
	.align	4
	.set	.LANCHOR0,. + 0
	.type	test_data, @object
	.size	test_data, 500
test_data:
	.zero	500
	.zero	12
	.type	heap, @object
	.size	heap, 8192
heap:
	.zero	8192
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
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
