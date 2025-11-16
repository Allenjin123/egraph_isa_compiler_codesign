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
	addi	t0,x0,1
	sra	t5,t5,t0
	lw	t2,0(a5)
	blt	t5,a3,.L2
	slli	t6,t2,2
	add	t6,a0,t6
	jal	x0,.L4
.L10:
	addi	a4,t3,0
	addi	a6,t4,0
	addi	a7,t0,0
.L3:
	lw	t3,0(t6)
	slli	a3,a3,2
	sub	a5,a5,a3
	bltu	t3,a6,.L2
.L11:
	sw	a7,0(a5)
	blt	t5,a4,.L9
	addi	a3,a4,0
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
	addi	t1,a5,0
	blt	a4,a2,.+8
	jal	x0,.L3
	add	t1,a1,t4
	lw	t0,0(t1)
	slli	t4,t0,2
	add	t4,a0,t4
	lw	t4,0(t4)
	bltu	t4,a6,.L10
	lw	t3,0(t6)
	slli	a3,a3,2
	addi	t1,a5,0
	sub	a5,a5,a3
	bgeu	t3,a6,.L11
.L2:
	sw	t2,0(a5)
	jalr	zero,ra,0
.L9:
	addi	a5,t1,0
	sw	t2,0(a5)
	jalr	zero,ra,0
	.size	heap_adjust, .-heap_adjust
	.align	2
	.type	heap_adjust.constprop.0, @function
heap_adjust.constprop.0:
	addi	a5,zero,1
	lw	t2,0(a1)
	blt	a5,a2,.+8
	jal	x0,.L13
	slli	t5,t2,2
	addi	t4,a1,-4
	add	t5,a0,t5
	addi	t0,x0,1
	sra	t0,a2,t0
	jal	x0,.L15
.L20:
	addi	a4,t1,0
	addi	a3,t3,0
	addi	a6,t6,0
.L14:
	lw	t1,0(t5)
	slli	a5,a5,2
	sub	a1,a1,a5
	bltu	t1,a3,.L13
.L21:
	sw	a6,0(a1)
	blt	t0,a4,.L19
	addi	a5,a4,0
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
	addi	a7,a1,0
	blt	a4,a2,.+8
	jal	x0,.L14
	add	a7,t4,t3
	lw	t6,0(a7)
	slli	t3,t6,2
	add	t3,a0,t3
	lw	t3,0(t3)
	bltu	t3,a3,.L20
	lw	t1,0(t5)
	slli	a5,a5,2
	addi	a7,a1,0
	sub	a1,a1,a5
	bgeu	t1,a3,.L21
.L13:
	sw	t2,0(a1)
	jalr	zero,ra,0
.L19:
	addi	a1,a7,0
	sw	t2,0(a1)
	jalr	zero,ra,0
	.size	heap_adjust.constprop.0, .-heap_adjust.constprop.0
	.align	2
	.type	compdecomp.constprop.0, @function
compdecomp.constprop.0:
	lui	a2,%hi(heap_ptr)
	lw	a5,%lo(heap_ptr)(a2)
	lui	t0,1048575
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
	addi	a0,x0,3
	and	a0,a0,a4
	addi	a5,a5,501
	beq	a0,zero,.L23
	addi	a1,zero,4
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
	sub	a3,zero,a5
	addi	a5,x0,3
	and	a5,a5,a3
	beq	a5,zero,.L82
	lw	a4,8(sp)
	addi	t0,x0,2
	and	a3,a3,t0
	sb	zero,0(a4)
	beq	a3,zero,.L83
	sb	zero,1(a4)
	addi	a4,zero,3
	bne	a5,a4,.L84
	lw	a4,8(sp)
	addi	a3,a5,0
	addi	a0,zero,498
	sb	zero,2(a4)
.L24:
	lw	a4,8(sp)
	addi	a2,zero,501
	sub	a2,a2,a5
	addi	a1,x0,-4
	and	a1,a1,a2
	add	a5,a4,a5
	add	a4,a5,a1
.L26:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L26
	beq	a2,a1,.L27
	lw	a4,8(sp)
	add	a5,a3,a1
	addi	a3,zero,1
	add	a5,a4,a5
	sb	zero,0(a5)
	sub	a4,a0,a1
	beq	a4,a3,.L27
	sb	zero,1(a5)
	addi	a3,zero,2
	beq	a4,a3,.+8
	jal	x0,.+8
	jal	x0,.L27
	sb	zero,2(a5)
.L27:
	lui	a5,1
	addi	a5,a5,1552
	add	s9,a5,sp
	lui	a4,1
	addi	s9,s9,-2048
	addi	a4,a4,1552
	addi	s6,s9,0
	addi	a5,s9,0
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
	addi	s7,s5,0
	addi	a5,s5,0
.L30:
	lui	a4,2
	addi	a4,a4,-512
	addi	a3,sp,16
	sw	zero,0(a5)
	add	a4,a4,a3
	addi	a5,a5,4
	bne	a5,a4,.L30
	addi	s0,sp,1552
	addi	a4,s0,1024
	addi	a5,s0,0
.L31:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L31
	addi	s1,sp,16
	addi	a4,s1,256
	addi	a5,s1,0
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
	addi	a3,s9,0
	addi	s10,zero,0
	addi	a5,zero,0
	addi	a0,zero,256
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
	addi	s3,s10,0
.L37:
	addi	a3,s3,0
	addi	a2,s10,0
	addi	a1,sp,528
	addi	a0,s9,0
	addi	s3,s3,-1
.Lpcrel_1:
	auipc	ra,%pcrel_hi(heap_adjust)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
	bne	s3,zero,.L37
	addi	a5,zero,1
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
	addi	a0,s9,0
	lw	s2,528(sp)
	sw	a2,4(sp)
	sw	a4,528(sp)
.Lpcrel_2:
	auipc	ra,%pcrel_hi(heap_adjust.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_2)
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
	sub	a3,zero,s10
	add	a4,s5,a4
	addi	a1,sp,528
	addi	a0,s9,0
	sw	s10,528(sp)
	sw	a3,0(a4)
.Lpcrel_3:
	auipc	ra,%pcrel_hi(heap_adjust.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_3)
	addi	s10,s10,-1
	addi	a5,zero,256
	addi	s3,s3,-4
	addi	s8,s8,-4
	bne	s10,a5,.L39
.L38:
	addi	a5,zero,257
.L36:
	slli	a5,a5,2
	add	a5,s5,a5
	sw	zero,0(a5)
	addi	t1,s9,1024
	addi	a0,s1,0
	addi	a7,s0,0
	addi	t3,zero,0
	addi	t4,zero,0
	jal	x0,.L48
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
	addi	a4,zero,0
	beq	a2,zero,.L40
	lw	a5,0(s7)
	beq	a5,zero,.L86
	addi	a6,zero,0
	addi	a2,zero,0
	addi	a1,zero,1
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
	addi	a4,a6,0
	bgeu	t4,a2,.L46
	addi	t4,a2,0
.L46:
	bgeu	t3,a6,.L40
	sw	a2,0(a7)
	sb	a4,0(a0)
	addi	s6,s6,4
	addi	t3,a6,0
	addi	a7,a7,4
	addi	a0,a0,1
	addi	s7,s7,4
	bne	t1,s6,.L48
.L139:
	addi	t0,x0,33
	bltu	t3,t0,.+12
	addi	t3,x0,0
	jal	x0,.+8
	addi	t3,x0,1
	beq	t3,zero,.L22
	beq	t4,zero,.L22
	lui	a5,%hi(.LANCHOR0)
	addi	t4,sp,-496
	addi	a7,zero,0
	addi	a1,zero,-1
	addi	a3,zero,0
	addi	t3,a5,%lo(.LANCHOR0)
	addi	t6,zero,1
	addi	t1,zero,7
	addi	t5,zero,500
.L55:
	lbu	a0,0(t3)
	add	a5,t4,a0
	lbu	a6,512(a5)
	beq	a6,zero,.L50
	addi	a4,a6,-1
	sll	a4,t6,a4
	addi	a2,zero,0
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
	addi	t0,x0,1
	and	t0,a3,t0
	addi	t2,x0,1
	sub	t0,t0,t2
	sub	a3,a3,t0
.L53:
	srli	a4,a4,1
	bltu	a2,a6,.L54
.L50:
	lw	a5,12(sp)
	addi	t3,t3,1
	bne	t3,a5,.L55
	lw	a4,8(sp)
	addi	a5,zero,7
	sub	a5,a5,a1
	addi	t5,sp,2047
	add	a7,a4,a7
	sll	a3,a3,a5
	addi	t5,t5,529
	sb	a3,0(a7)
	addi	a4,t5,1024
	addi	a5,t5,0
.L56:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L56
	addi	t1,sp,272
	addi	t3,t5,0
	addi	a6,zero,0
	addi	t6,zero,1
	addi	t4,zero,256
	jal	x0,.L62
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
	and	a5,a0,a1
	sub	a5,a5,a1
	sub	a5,a0,a5
	beq	a5,zero,.L57
	beq	a1,zero,.L87
	addi	a3,a1,-1
	sll	a3,t6,a3
	addi	a2,zero,0
	addi	a5,zero,0
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
	jal	x0,.L57
.L83:
	addi	a3,zero,1
	addi	a0,zero,500
	jal	x0,.L24
.L140:
	lw	a5,0(a3)
	add	a2,a2,a1
	addi	a6,a6,1
	beq	a5,zero,.L43
	slli	a1,a1,1
	jal	x0,.L45
.L86:
	addi	a2,zero,0
	jal	x0,.L40
.L141:
	lw	a5,8(sp)
	add	a5,a5,a7
	sb	a3,0(a5)
	addi	a7,a7,1
	beq	a7,t5,.L22
	lbu	a0,0(t3)
	addi	a3,zero,0
	addi	a1,zero,0
	add	a5,t4,a0
	lbu	a6,512(a5)
	jal	x0,.L52
.L22:
	lui	t0,1
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
	jalr	zero,ra,0
.L87:
	addi	a5,zero,0
	sw	a5,0(t3)
	jal	x0,.L57
.L84:
	addi	a3,zero,2
	addi	a0,zero,499
	jal	x0,.L24
.L81:
	sw	zero,8(sp)
	addi	a5,zero,0
	addi	a0,zero,501
	addi	a3,zero,0
	jal	x0,.L24
.L82:
	addi	a3,zero,0
	addi	a0,zero,501
	jal	x0,.L24
.L142:
	addi	t5,t5,4
	addi	a6,sp,273
	addi	t1,t5,0
	addi	t4,sp,-496
	addi	a7,zero,1
	addi	t6,zero,256
.L66:
	lw	a0,0(t1)
	lbu	t3,0(a6)
	addi	a4,a6,0
	addi	a5,t1,0
	addi	a3,a7,0
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
	addi	a5,t5,0
.L68:
	lw	a6,0(a5)
	addi	a5,a5,4
	addi	a0,a0,1
	beq	a6,zero,.L68
.L67:
	lw	a5,8(sp)
	addi	t3,sp,-496
	addi	a3,a6,0
	lbu	a7,0(a5)
	lui	a5,%hi(.LANCHOR0)
	addi	s4,a5,%lo(.LANCHOR0)
	addi	a4,a0,0
	addi	t1,zero,0
	addi	a1,zero,128
	addi	a2,zero,0
	addi	t4,zero,1
	addi	t6,zero,500
.L80:
	and	a5,a7,a1
	beq	a5,zero,.L69
.L143:
	addi	a2,a2,1
	slli	a2,a2,1
.L70:
	slli	a5,a4,2
	add	a5,a5,t5
	bgeu	a3,a2,.L72
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
	jal	x0,.L70
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
	addi	a3,a6,0
	lbu	a7,0(a5)
	addi	a4,a0,0
	addi	a2,zero,0
	jal	x0,.L80
.L75:
	lw	a5,8(sp)
	addi	a1,zero,128
	addi	a5,a5,1
	sw	a5,8(sp)
	lbu	a7,0(a5)
	jal	x0,.L80
.L77:
	lw	a5,8(sp)
	addi	a1,zero,128
	addi	a5,a5,1
	sw	a5,8(sp)
	jal	x0,.L78
.L88:
	addi	a6,a0,0
	addi	a0,zero,0
	jal	x0,.L67
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
	addi	s1,zero,11
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
.Lpcrel_4:
	auipc	ra,%pcrel_hi(compdecomp.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_4)
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
	jalr	zero,ra,0
	.size	benchmark_body.constprop.0.isra.0, .-benchmark_body.constprop.0.isra.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	blt	zero,a0,.+8
	jal	x0,.L157
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
	addi	s1,a0,0
	addi	s3,s3,%lo(heap)
	addi	s2,s2,%lo(heap+8192)
	addi	s0,s0,%lo(.LANCHOR1+500)
	addi	s9,zero,0
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
.Lpcrel_5:
	auipc	ra,%pcrel_hi(compdecomp.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_5)
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
	jalr	zero,ra,0
.L157:
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
	.globl	compdecomp
	.type	compdecomp, @function
compdecomp:
	lui	t0,1048575
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
	addi	a0,x0,3
	and	a0,a4,a0
	add	a5,a2,a5
	bne	a0,zero,.L293
	lui	a0,%hi(heap_end)
	lw	a0,%lo(heap_end)(a0)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a0,a4,.L294
.L166:
	sw	a4,%lo(heap_ptr)(a1)
	lw	a4,8(sp)
	addi	a5,zero,5
	bgeu	a5,a4,.L228
	lw	a5,4(sp)
	sub	a4,zero,a5
	addi	a5,x0,3
	and	a5,a4,a5
	beq	a5,zero,.L229
	lw	a3,4(sp)
	addi	t0,x0,2
	and	a4,t0,a4
	sb	zero,0(a3)
	addi	a3,zero,1
	beq	a4,zero,.L168
	lw	a4,4(sp)
	addi	a3,zero,2
	sb	zero,1(a4)
	addi	a4,zero,3
	bne	a5,a4,.L168
	lw	a4,4(sp)
	addi	a3,a5,0
	sb	zero,2(a4)
.L168:
	lw	a4,4(sp)
	sub	a0,a2,a5
	addi	a1,x0,-4
	and	a1,a1,a0
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
	bgeu	a4,a2,.L164
	lw	a3,4(sp)
	add	a4,a3,a4
	sb	zero,0(a4)
	addi	a4,a5,2
	bgeu	a4,a2,.L164
	add	a4,a3,a4
	sb	zero,0(a4)
	addi	a4,a5,3
	bgeu	a4,a2,.L164
	add	a4,a3,a4
	sb	zero,0(a4)
	addi	a4,a5,4
	bgeu	a4,a2,.L164
	add	a4,a3,a4
	sb	zero,0(a4)
	addi	a5,a5,5
	bgeu	a5,a2,.L164
	add	a5,a3,a5
	sb	zero,0(a5)
.L164:
	lui	a5,1
	addi	a5,a5,1552
	add	s9,a5,sp
	lui	a4,1
	addi	s9,s9,-2048
	addi	a4,a4,1552
	addi	s6,s9,0
	addi	a5,s9,0
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
	addi	s7,s5,0
	addi	a5,s5,0
.L175:
	lui	a4,2
	addi	a4,a4,-512
	addi	a3,sp,16
	sw	zero,0(a5)
	add	a4,a4,a3
	addi	a5,a5,4
	bne	a5,a4,.L175
	addi	s0,sp,1552
	addi	a4,s0,1024
	addi	a5,s0,0
.L176:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L176
	addi	s1,sp,16
	addi	a4,s1,256
	addi	a5,s1,0
.L177:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L177
	lw	a5,12(sp)
	lw	a4,8(sp)
	add	a2,a5,a4
	addi	a4,a5,0
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
	addi	a3,s9,0
	addi	s10,zero,0
	addi	a5,zero,0
	addi	a0,zero,256
.L179:
	lw	a2,0(a3)
	slli	a4,s10,2
	add	a4,a1,a4
	bne	a2,zero,.+8
	jal	x0,.L182
	sw	a5,1024(a4)
	addi	s10,s10,1
.L182:
	addi	a5,a5,1
	addi	a3,a3,4
	bne	a5,a0,.L179
	beq	s10,zero,.+8
	jal	x0,.+8
	jal	x0,.L183
	addi	s3,s10,0
.L184:
	addi	a3,s3,0
	addi	a2,s10,0
	addi	a1,sp,528
	addi	a0,s9,0
	addi	s3,s3,-1
.Lpcrel_6:
	auipc	ra,%pcrel_hi(heap_adjust)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_6)
	bne	s3,zero,.L184
	addi	a5,zero,1
	beq	s10,a5,.+8
	jal	x0,.+8
	jal	x0,.L185
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
	addi	a0,s9,0
	lw	s2,528(sp)
	sw	a2,0(sp)
	sw	a4,528(sp)
.Lpcrel_7:
	auipc	ra,%pcrel_hi(heap_adjust.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_7)
	lw	a4,528(sp)
	addi	a3,x0,2
	sll	a3,s2,a3
	add	a0,s9,a3
	addi	t0,x0,2
	sll	a4,a4,t0
	add	a1,s9,a4
	lw	a0,0(a0)
	lw	a1,0(a1)
	lw	a2,0(sp)
	add	a3,s5,a3
	add	a1,a1,a0
	sw	s10,0(a3)
	sw	a1,0(s8)
	sub	a3,zero,s10
	add	a4,s5,a4
	addi	a1,sp,528
	addi	a0,s9,0
	sw	s10,528(sp)
	sw	a3,0(a4)
.Lpcrel_8:
	auipc	ra,%pcrel_hi(heap_adjust.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_8)
	addi	s10,s10,-1
	addi	a5,zero,256
	addi	t0,x0,-4
	and	t0,x0,t0
	addi	t1,x0,-4
	sub	t0,t0,t1
	sub	t0,x0,t0
	add	s3,s3,t0
	addi	t0,x0,-4
	and	t0,x0,t0
	addi	t1,x0,-4
	sub	t0,t0,t1
	sub	t0,x0,t0
	add	s8,s8,t0
	bne	s10,a5,.L186
.L185:
	addi	a5,zero,257
.L183:
	slli	a5,a5,2
	add	a5,s5,a5
	sw	zero,0(a5)
	addi	t1,x0,1024
	and	t1,x0,t1
	addi	t0,x0,1024
	sub	t1,t1,t0
	sub	t1,x0,t1
	sub	t0,x0,s9
	sub	t1,t1,t0
	addi	a0,s1,0
	addi	a7,s0,0
	addi	t3,zero,0
	addi	t4,zero,0
	jal	x0,.L195
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
	addi	a4,zero,0
	beq	a2,zero,.L187
	lw	a5,0(s7)
	addi	a2,zero,0
	beq	a5,zero,.+8
	jal	x0,.+8
	jal	x0,.L187
	addi	a1,zero,1
	addi	a6,zero,0
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
	bltu	t4,a2,.+8
	jal	x0,.L193
	addi	t4,a2,0
.L193:
	addi	a4,a6,0
	bgeu	t3,a6,.L187
	sw	a2,0(a7)
	sb	a4,0(a0)
	addi	s6,s6,4
	addi	t3,a6,0
	addi	a7,a7,4
	addi	a0,a0,1
	addi	s7,s7,4
	bne	t1,s6,.L195
.L295:
	addi	t0,x0,33
	bltu	t3,t0,.+12
	addi	t3,x0,0
	jal	x0,.+8
	addi	t3,x0,1
	beq	t3,zero,.L163
	beq	t4,zero,.L163
	lw	a5,8(sp)
	beq	a5,zero,.L234
	addi	a4,a5,0
	lw	a5,12(sp)
	addi	t4,sp,-496
	addi	a1,zero,-1
	add	t6,a5,a4
	addi	t3,a5,0
	addi	a3,zero,0
	addi	a7,zero,0
	addi	t5,zero,1
	addi	t1,x0,7
	and	t1,x0,t1
	addi	t0,x0,7
	sub	t1,t1,t0
	sub	t1,x0,t1
	add	t1,zero,t1
.L203:
	lbu	a0,0(t3)
	add	a5,t4,a0
	lbu	a6,512(a5)
	beq	a6,zero,.L198
	addi	a4,a6,-1
	sll	a4,t5,a4
	addi	a2,zero,0
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
	addi	t0,x0,1
	and	t0,a3,t0
	addi	t2,x0,1
	sub	t0,t0,t2
	sub	a3,a3,t0
.L201:
	srli	a4,a4,1
	bltu	a2,a6,.L202
.L198:
	addi	t3,t3,1
	bne	t3,t6,.L203
	lw	a4,4(sp)
	addi	a5,zero,7
	sub	a5,a5,a1
	add	a7,a4,a7
	sll	a3,a3,a5
.L197:
	addi	t5,sp,2047
	addi	t5,t5,529
	sb	a3,0(a7)
	addi	a4,t5,1024
	addi	a5,t5,0
.L204:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L204
	addi	t1,sp,272
	addi	t3,t5,0
	addi	a6,zero,0
	addi	t6,zero,1
	addi	t4,zero,256
	jal	x0,.L210
.L205:
	addi	t0,x0,1
	and	t0,x0,t0
	addi	t2,x0,1
	sub	t0,t0,t2
	sub	t0,x0,t0
	add	a6,a6,t0
	addi	s0,s0,4
	addi	t0,x0,1
	and	t0,x0,t0
	addi	t2,x0,1
	sub	t0,t0,t2
	sub	t0,x0,t0
	add	s1,s1,t0
	addi	t3,t3,4
	beq	a6,t4,.L298
.L210:
	lw	a0,0(s0)
	lbu	a1,0(s1)
	sb	a6,0(t1)
	addi	t1,t1,1
	and	a5,a0,a1
	sub	a5,a5,a1
	sub	a5,a0,a5
	beq	a5,zero,.L205
	bne	a1,zero,.+8
	jal	x0,.L235
	addi	a3,a1,-1
	sll	a3,t6,a3
	addi	a5,zero,0
	addi	a2,zero,0
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
	jal	x0,.L205
.L296:
	lw	a5,0(a3)
	add	a2,a2,a1
	addi	a6,a6,1
	beq	a5,zero,.L190
	slli	a1,a1,1
	jal	x0,.L192
.L298:
	addi	t5,t5,4
	addi	a6,sp,273
	addi	t1,t5,0
	addi	t4,sp,-496
	addi	a7,zero,1
	addi	t6,zero,256
.L214:
	lw	a0,0(t1)
	lbu	t3,0(a6)
	addi	a4,a6,0
	addi	a5,t1,0
	addi	a3,a7,0
.L211:
	lw	a2,-4(a5)
	bltu	a0,a2,.+8
	jal	x0,.L212
	lbu	a1,-1(a4)
	sw	a2,0(a5)
	addi	a3,a3,-1
	sb	a1,0(a4)
	addi	a5,a5,-4
	addi	a4,a4,-1
	beq	a3,zero,.+8
	jal	x0,.L211
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
	addi	a5,t5,0
.L216:
	lw	a6,0(a5)
	addi	a5,a5,4
	addi	a1,a1,1
	beq	a6,zero,.L216
.L215:
	lw	a5,8(sp)
	bne	a5,zero,.+8
	jal	x0,.L163
	addi	t1,sp,-496
	addi	a3,a6,0
	addi	a4,a1,0
	addi	a2,zero,0
	addi	a0,zero,128
	addi	a7,zero,0
	addi	t3,zero,1
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
	bgeu	a3,a2,.L220
.L219:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,1
	bltu	a3,a2,.L219
.L220:
	beq	a2,a3,.L299
	bne	a0,t3,.+8
	jal	x0,.L223
.L300:
	srli	a0,a0,1
.L224:
	lw	a5,8(sp)
	bltu	a7,a5,.L225
.L163:
	lui	t0,1
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
	jalr	zero,ra,0
.L293:
	addi	a6,zero,4
	sub	a0,a6,a0
	add	a5,a5,a0
	add	a4,a4,a0
	lui	a0,%hi(heap_end)
	lw	a0,%lo(heap_end)(a0)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a0,a4,.L166
.L294:
	lw	a4,8(sp)
	addi	a5,zero,5
	sw	zero,4(sp)
	bgeu	a5,a4,.L228
	addi	a5,zero,0
	addi	a3,zero,0
	jal	x0,.L168
.L297:
	lw	a5,4(sp)
	add	a5,a5,a7
	sb	a3,0(a5)
	lw	a5,8(sp)
	addi	a7,a7,1
	beq	a5,a7,.L163
	lbu	a0,0(t3)
	addi	a3,zero,0
	addi	a1,zero,0
	add	a5,t4,a0
	lbu	a6,512(a5)
	jal	x0,.L200
.L235:
	addi	a5,zero,0
	sw	a5,0(t3)
	jal	x0,.L205
.L226:
	sw	zero,4(sp)
	jal	x0,.L164
.L299:
	add	a4,t1,a4
	lbu	a5,768(a4)
	lw	a4,12(sp)
	addi	a7,a7,1
	addi	a3,a6,0
	sb	a5,0(a4)
	lw	a5,12(sp)
	addi	a4,a1,0
	addi	a2,zero,0
	addi	a5,a5,1
	sw	a5,12(sp)
	bne	a0,t3,.L300
.L223:
	lw	a5,4(sp)
	addi	a0,zero,128
	addi	t0,x0,1
	and	t0,x0,t0
	addi	t2,x0,1
	sub	t0,t0,t2
	sub	t0,x0,t0
	add	a5,a5,t0
	sw	a5,4(sp)
	jal	x0,.L224
.L217:
	addi	t0,x0,1
	sll	a2,a2,t0
	addi	a2,a2,1
	jal	x0,.L218
.L228:
	addi	a5,zero,0
	jal	x0,.L167
.L229:
	addi	a3,zero,0
	jal	x0,.L168
.L234:
	lw	a7,4(sp)
	addi	a3,zero,0
	jal	x0,.L197
.L236:
	addi	a6,a1,0
	addi	a1,zero,0
	jal	x0,.L215
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
	addi	a3,zero,74
	jal	x0,.L303
.L306:
	lbu	a3,0(a4)
	addi	a4,a4,1
.L303:
	lbu	a2,0(a5)
	addi	a5,a5,1
	bne	a2,a3,.L304
	bne	a1,a5,.L306
	addi	a0,zero,1
	jalr	zero,ra,0
.L304:
	addi	a0,zero,0
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
.Lpcrel_9:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_9)
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
.Lpcrel_10:
	auipc	ra,%pcrel_hi(benchmark_body.constprop.0.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_10)
	lw	ra,12(sp)
	addi	a0,zero,0
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
.Lpcrel_11:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_11)
.Lpcrel_12:
	auipc	ra,%pcrel_hi(benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_12)
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
	addi	a0,zero,0
.L314:
	lw	ra,28(sp)
	bltu	zero,a0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	addi	sp,sp,32
	jalr	zero,ra,0
.L318:
	sub	a0,a0,a3
	jal	x0,.L314
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
	blt	a0,zero,__riscv_div_lib_L10
	blt	a1,zero,__riscv_div_lib_L11
    # Since the quotient is positive, fall into udivsi3

# Unsigned 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_udivsi3
__riscv_div_lib_udivsi3:
	addi	a2,x0,0
	and	a2,x0,a2
	addi	t0,x0,0
	sub	a2,a2,t0
	sub	a2,x0,a2
	sub	t0,x0,a1
	sub	a2,a2,t0
	addi	a1,x0,0
	and	a1,x0,a1
	addi	t0,x0,0
	sub	a1,a1,t0
	sub	a1,x0,a1
	add	a1,a0,a1
	addi	a0,zero,-1
	beq	a2,zero,__riscv_div_lib_L5
	addi	a3,zero,1
	bgeu	a2,a1,__riscv_div_lib_L2
__riscv_div_lib_L1:
	blt	zero,a2,.+8
	jal	x0,__riscv_div_lib_L2
	addi	t0,x0,1
	sll	a2,a2,t0
	addi	t0,x0,1
	sll	a3,a3,t0
	bltu	a2,a1,__riscv_div_lib_L1
__riscv_div_lib_L2:
	addi	a0,zero,0
__riscv_div_lib_L3:
	bltu	a1,a2,__riscv_div_lib_L4
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
	blt	a1,zero,.+8
	jal	x0,.+8
	jal	x0,__riscv_div_lib_L31
	blt	a0,zero,.+8
	jal	x0,.+8
	jal	x0,__riscv_div_lib_L32
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