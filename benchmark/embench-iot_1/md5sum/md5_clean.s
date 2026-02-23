	.file	"md5.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	md5.constprop.0, @function
md5.constprop.0:
	lui	a4,%hi(.LANCHOR0)
	addi	sp,sp,-608
	addi	a4,a4,%lo(.LANCHOR0)
	sw	s0,604(sp)
	sw	s1,600(sp)
	sw	s2,596(sp)
	sw	s3,592(sp)
	sw	s4,588(sp)
	sw	s5,584(sp)
	sw	s6,580(sp)
	sw	s7,576(sp)
	sw	s8,572(sp)
	sw	s9,568(sp)
	sw	s10,564(sp)
	sw	s11,560(sp)
	addi	a5, a4, 0
	addi	a2,a4,256
	addi	a3,sp,48
.L2:
	lw	t1,0(a5)
	lw	a7,4(a5)
	lw	a6,8(a5)
	lw	a1,12(a5)
	sw	t1,0(a3)
	sw	a7,4(a3)
	sw	a6,8(a3)
	sw	a1,12(a3)
	addi	a5,a5,16
	addi	a3,a3,16
	bne	a5,a2,.L2
	addi	a4,a4,512
	addi	a3,sp,304
.L3:
	lw	a7,0(a5)
	lw	a6,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	sw	a7,0(a3)
	sw	a6,4(a3)
	sw	a1,8(a3)
	sw	a2,12(a3)
	addi	a5,a5,16
	addi	a3,a3,16
	bne	a5,a4,.L3
	lui	a1, 422994
	addi	a1,a1,769
	lui	a6,%hi(heap_ptr)
	lui	a2, 982235
	lui	t3,%hi(h0)
	lw	t2,%lo(heap_ptr)(a6)
	addi	a2,a2,-1143
	lui	a7,%hi(heap_requested)
	lui	a3, 625582
	sw	a1,%lo(h0)(t3)
	lui	a1,%hi(h1)
	addi	a3,a3,-770
	lw	a5,%lo(heap_requested)(a7)
	lui	a4, 66341
	sw	a2,%lo(h1)(a1)
	lui	a2,%hi(h2)
	addi	a4,a4,1142
	sw	a3,%lo(h2)(a2)
	lui	a3,%hi(h3)
	sw	a4,%lo(h3)(a3)
	andi	t1,t2,3
	addi	a4,t2,1080
	addi	a5,a5,1080
	beq	t1,zero,.L4
	addi	a3, zero, 4
	sub	a3,a3,t1
	add	a4,a4,a3
	add	a5,a5,a3
.L4:
	lui	a3,%hi(heap_end)
	lw	a3,%lo(heap_end)(a3)
	sw	a5,%lo(heap_requested)(a7)
	bltu	a3,a4,.L7
	sw	a4,%lo(heap_ptr)(a6)
	beq	t2,zero,.L7
	sub	a4, zero, t2
	andi	a5,a4,3
	beq	a5,zero,.L25
	sb	zero,0(t2)
	andi	a4,a4,2
	beq	a4,zero,.L26
	sb	zero,1(t2)
	addi	a4, zero, 3
	bne	a5,a4,.L27
	sb	zero,2(t2)
	addi	a2, zero, 1077
.L8:
	addi	a6, zero, 1080
	sub	a6,a6,a5
	andi	a1,a6,-4
	add	a5,t2,a5
	add	a3,a1,a5
.L10:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a3,.L10
	beq	a1,a6,.L6
	add	a5,a1,a4
	add	a5,t2,a5
	sb	zero,0(a5)
	sub	a2,a2,a1
	addi	a4, zero, 1
	beq	a2,a4,.L6
	sb	zero,1(a5)
	addi	a4, zero, 2
	beq	a2,a4,.L6
	sb	zero,2(a5)
.L6:
	or	a4,t2,a0
	andi	a4,a4,3
	addi	a5, a0, 0
	addi	t6, t2, 0
	bne	a4,zero,.L12
.L54:
	sub	a4,t2,a0
	addi	a4,a4,-1
	sltiu	a4,a4,3
	bne	a4,zero,.L12
	addi	a2,a0,1000
	addi	a4, t2, 0
.L13:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a2,a5,.L13
	addi	a5, zero, -128
	sb	a5,1000(t2)
	andi	a5,t2,3
	bne	a5,zero,.L16
.L55:
	lui	a5, 2
	addi	a5,a5,-192
	sw	a5,1016(t2)
.L17:
	lui	t4, 292988
	lui	t3, 688900
	lui	t1, 1037417
	lui	a7, 432138
	lui	a6, 570447
	lui	a0, 1048566
	lui	a1, 562637
	lui	a2, 440577
	lui	a3, 1038727
	lui	a4, 681876
	lui	a5, 301889
	lui	s5, 66341
	lui	s4, 625582
	lui	s3, 982235
	lui	s6, 422994
	lui	s10, 882346
	lui	s9, 953467
	lui	s8, 147975
	lui	s7, 793565
	lui	s11, 1005505
	addi	t4,t4,1578
	addi	t3,t3,1555
	addi	t1,t1,1281
	addi	a7,a7,-1832
	addi	a6,a6,1967
	addi	a0,a0,-1103
	addi	a1,a1,1982
	addi	a2,a2,290
	addi	a3,a3,403
	addi	a4,a4,910
	addi	a5,a5,-2015
	addi	s5,s5,1142
	addi	s4,s4,-770
	addi	s3,s3,-1143
	addi	s6,s6,769
	addi	s10,s10,1144
	addi	s9,s9,1878
	addi	s8,s8,219
	addi	s7,s7,-274
	addi	s11,s11,-81
	sw	t4,4(sp)
	sw	t3,8(sp)
	sw	t1,12(sp)
	sw	a7,16(sp)
	sw	a6,20(sp)
	sw	a0,24(sp)
	sw	a1,28(sp)
	sw	a2,32(sp)
	sw	a3,36(sp)
	sw	a4,40(sp)
	sw	a5,44(sp)
	addi	t0, zero, 0
	addi	s1, zero, 31
	addi	s2, zero, 47
	addi	s0, zero, 64
.L19:
	lw	a3,0(t6)
	xor	a5,s4,s5
	and	a5,a5,s3
	add	a4,s6,s10
	add	a4,a4,a3
	xor	a5,a5,s5
	add	a5,a5,a4
	srli	a1,a5,25
	slli	a5,a5,7
	lw	a4,4(t6)
	add	a1,a1,a5
	add	a1,a1,s3
	xor	a2,s4,s3
	and	a2,a2,a1
	add	a5,s5,s9
	add	a5,a5,a4
	xor	a2,a2,s4
	add	a2,a2,a5
	srli	a5,a2,20
	slli	a2,a2,12
	lw	a4,8(t6)
	add	a2,a2,a5
	add	a2,a1,a2
	xor	a3,a1,s3
	and	a3,a3,a2
	add	a5,s4,s8
	add	a5,a5,a4
	xor	a3,a3,s3
	add	a3,a3,a5
	srli	a5,a3,15
	slli	a3,a3,17
	lw	a0,12(t6)
	add	a3,a3,a5
	add	a3,a2,a3
	xor	a4,a1,a2
	and	a4,a4,a3
	add	a5,s3,s7
	add	a5,a5,a0
	xor	a4,a4,a1
	add	a4,a4,a5
	lw	a5,16(t6)
	srli	a0,a4,10
	slli	a4,a4,22
	add	a4,a4,a0
	add	a4,a4,a3
	xor	a0,a2,a3
	add	a5,a5,s11
	add	a5,a5,a1
	and	a1,a0,a4
	xor	a1,a1,a2
	add	a5,a5,a1
	lw	a6,4(sp)
	lw	a1,20(t6)
	srli	a0,a5,25
	slli	a5,a5,7
	add	a5,a5,a0
	add	a5,a4,a5
	xor	a0,a4,a3
	add	a1,a1,a6
	add	a2,a1,a2
	and	a1,a0,a5
	xor	a1,a1,a3
	add	a2,a2,a1
	lw	a6,8(sp)
	lw	a1,24(t6)
	srli	a0,a2,20
	slli	a2,a2,12
	add	a2,a2,a0
	add	a2,a5,a2
	xor	a0,a4,a5
	add	a1,a1,a6
	add	a3,a1,a3
	and	a1,a0,a2
	xor	a1,a1,a4
	add	a3,a3,a1
	lw	a6,12(sp)
	lw	a1,28(t6)
	srli	a0,a3,15
	slli	a3,a3,17
	add	a3,a3,a0
	add	a3,a2,a3
	xor	a0,a5,a2
	add	a1,a1,a6
	add	a4,a1,a4
	and	a1,a0,a3
	xor	a1,a1,a5
	add	a4,a4,a1
	lw	a6,16(sp)
	lw	a1,32(t6)
	srli	a0,a4,10
	slli	a4,a4,22
	add	a4,a4,a0
	add	a4,a3,a4
	xor	a0,a2,a3
	add	a1,a1,a6
	add	a5,a1,a5
	and	a1,a0,a4
	xor	a1,a1,a2
	add	a5,a5,a1
	lw	a6,20(sp)
	lw	a1,36(t6)
	srli	a0,a5,25
	slli	a5,a5,7
	add	a5,a5,a0
	add	a5,a4,a5
	xor	a0,a3,a4
	add	a1,a1,a6
	add	a2,a1,a2
	and	a1,a0,a5
	xor	a1,a1,a3
	add	a2,a2,a1
	lw	a6,24(sp)
	lw	a1,40(t6)
	srli	a0,a2,20
	slli	a2,a2,12
	add	a2,a2,a0
	add	a2,a5,a2
	xor	a0,a4,a5
	add	a1,a1,a6
	add	a3,a1,a3
	and	a1,a0,a2
	xor	a1,a1,a4
	add	a3,a3,a1
	lw	a6,28(sp)
	lw	a1,44(t6)
	srli	a0,a3,15
	slli	a3,a3,17
	add	a3,a3,a0
	add	a3,a2,a3
	xor	a0,a5,a2
	add	a1,a1,a6
	add	a4,a1,a4
	and	a1,a0,a3
	xor	a1,a1,a5
	add	a4,a4,a1
	lw	a6,32(sp)
	lw	a1,48(t6)
	srli	a0,a4,10
	slli	a4,a4,22
	add	a4,a4,a0
	add	a4,a3,a4
	xor	a0,a2,a3
	add	a1,a1,a6
	add	a5,a1,a5
	and	a1,a0,a4
	xor	a1,a1,a2
	lw	a0,36(sp)
	add	a5,a5,a1
	lw	a6,52(t6)
	srli	a1,a5,25
	slli	a5,a5,7
	add	a5,a5,a1
	add	a5,a4,a5
	xor	a1,a3,a4
	add	a6,a6,a0
	add	a6,a6,a2
	and	a2,a1,a5
	xor	a2,a2,a3
	lw	a1,40(sp)
	add	a6,a6,a2
	lw	a0,56(t6)
	srli	a2,a6,20
	slli	a6,a6,12
	add	a6,a6,a2
	add	a6,a5,a6
	xor	a2,a4,a5
	add	a0,a0,a1
	add	a0,a0,a3
	and	a3,a2,a6
	xor	a3,a3,a4
	add	a0,a0,a3
	srli	a2,a0,15
	lw	a1,44(sp)
	lw	a3,60(t6)
	slli	a0,a0,17
	add	a0,a0,a2
	add	a0,a6,a0
	xor	a2,a5,a6
	add	a3,a3,a1
	and	a2,a2,a0
	add	a4,a3,a4
	xor	a2,a2,a5
	add	a2,a2,a4
	srli	a4,a2,10
	slli	a2,a2,22
	add	a2,a2,a4
	add	a2,a2,a0
	addi	t1,sp,368
	addi	a7,sp,112
	addi	t3, zero, 81
	addi	t4, zero, 53
	addi	t5, zero, 112
	addi	a1, zero, 16
	sw	s6,0(sp)
	jal	zero, .L18
.L53:
	xor	a4,a4,a0
	andi	a3,t3,15
.L22:
	slli	a3,a3,2
	add	a3,t2,a3
	add	a3,a3,t0
	lw	s6,0(a3)
	lw	a3,0(t1)
	addi	a1,a1,1
	addi	t5,t5,7
	add	a4,a4,a3
	lw	a3,0(a7)
	add	a4,a4,s6
	add	a4,a4,a5
	sub	a5, zero, a3
	sll	a3,a4,a3
	srl	a4,a4,a5
	or	a3,a3,a4
	addi	t4,t4,3
	addi	t3,t3,5
	addi	t1,t1,4
	addi	a7,a7,4
	add	a3,a3,a2
	addi	a5, a6, 0
	beq	a1,s0,.L52
	addi	a6, a0, 0
	addi	a0, a2, 0
	addi	a2, a3, 0
.L18:
	xor	a4,a0,a2
	and	a4,a4,a6
	bgeu	s1, a1, .L53
	xor	a4,a0,a6
	bltu	s2, a1, .L23
	xor	a4,a4,a2
	andi	a3,t4,15
	jal	zero, .L22
.L23:
	xori	a4, a6, -1
	or	a4,a4,a2
	xor	a4,a4,a0
	andi	a3,t5,15
	jal	zero, .L22
.L52:
	lw	s6,0(sp)
	addi	t0,t0,64
	addi	a5, zero, 1024
	add	s6,s6,a6
	add	s3,s3,a3
	add	s4,s4,a2
	add	s5,s5,a0
	addi	t6,t6,64
	bne	t0,a5,.L19
	lui	a5,%hi(h0)
	sw	s6,%lo(h0)(a5)
	lui	a5,%hi(h1)
	sw	s3,%lo(h1)(a5)
	lw	s0,604(sp)
	lui	a5,%hi(h2)
	sw	s4,%lo(h2)(a5)
	lui	a5,%hi(h3)
	sw	s5,%lo(h3)(a5)
	lw	s1,600(sp)
	lw	s2,596(sp)
	lw	s3,592(sp)
	lw	s4,588(sp)
	lw	s5,584(sp)
	lw	s6,580(sp)
	lw	s7,576(sp)
	lw	s8,572(sp)
	lw	s9,568(sp)
	lw	s10,564(sp)
	lw	s11,560(sp)
	addi	sp,sp,608
	jalr	zero, ra, 0
.L7:
	addi	t2, zero, 0
	or	a4,t2,a0
	andi	a4,a4,3
	addi	a5, a0, 0
	addi	t6, t2, 0
	beq	a4,zero,.L54
.L12:
	addi	a3,a0,1000
	addi	a4, t2, 0
.L15:
	lbu	a2,0(a5)
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a2,-1(a4)
	bne	a3,a5,.L15
	addi	a5, zero, -128
	sb	a5,1000(t2)
	andi	a5,t2,3
	beq	a5,zero,.L55
.L16:
	addi	a4, zero, 64
	addi	a5, zero, 31
	sb	zero,1018(t2)
	sb	zero,1019(t2)
	sb	a4,1016(t2)
	sb	a5,1017(t2)
	jal	zero, .L17
.L25:
	addi	a4, zero, 0
	addi	a2, zero, 1080
	jal	zero, .L8
.L26:
	addi	a2, zero, 1079
	addi	a4, zero, 1
	jal	zero, .L8
.L27:
	addi	a2, zero, 1078
	addi	a4, zero, 2
	jal	zero, .L8
	.size	md5.constprop.0, .-md5.constprop.0
	.align	2
	.type	benchmark_body.constprop.0, @function
benchmark_body.constprop.0:
	addi	sp,sp,-48
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	lui	s3,%hi(heap+1000)
	lui	s4,%hi(heap+3080)
	lui	s2,%hi(heap)
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	ra,44(sp)
	addi	s4,s4,%lo(heap+3080)
	addi	s3,s3,%lo(heap+1000)
	addi	s2,s2,%lo(heap)
	addi	s1, zero, 51
	lui	s7,%hi(heap_end)
	lui	s6,%hi(heap_requested)
	lui	s5,%hi(heap_ptr)
	addi	s0, zero, 1000
.L58:
	sw	s4,%lo(heap_end)(s7)
	sw	s0,%lo(heap_requested)(s6)
	sw	s3,%lo(heap_ptr)(s5)
	addi	a4, s2, 0
	addi	a5, zero, 0
.L57:
	sb	a5,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a5,s0,.L57
	addi	a0, s2, 0
	addi	s1,s1,-1
.Lpcrel_1:
	auipc	ra, %pcrel_hi(md5.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_1)
	bne	s1,zero,.L58
	lui	a4,%hi(h1)
	lui	a5,%hi(h0)
	lw	a3,%lo(h1)(a4)
	lw	a5,%lo(h0)(a5)
	lui	a4,%hi(h2)
	lw	a4,%lo(h2)(a4)
	lui	a2,%hi(h3)
	lw	a0,%lo(h3)(a2)
	lw	ra,44(sp)
	lw	s0,40(sp)
	xor	a5,a5,a3
	xor	a5,a5,a4
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
	xor	a0,a5,a0
	addi	sp,sp,48
	jalr	zero, ra, 0
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
	.align	2
	.type	benchmark_body.constprop.1.isra.0, @function
benchmark_body.constprop.1.isra.0:
	bge	zero, a0, .L69
	addi	sp,sp,-48
	sw	s2,32(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	lui	s4,%hi(heap+1000)
	lui	s5,%hi(heap+3080)
	lui	s2,%hi(heap)
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	s3,28(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	s8,8(sp)
	sw	ra,44(sp)
	addi	s3, a0, 0
	addi	s5,s5,%lo(heap+3080)
	addi	s4,s4,%lo(heap+1000)
	addi	s2,s2,%lo(heap)
	addi	s1, zero, 0
	lui	s8,%hi(heap_end)
	lui	s7,%hi(heap_requested)
	lui	s6,%hi(heap_ptr)
	addi	s0, zero, 1000
.L65:
	sw	s5,%lo(heap_end)(s8)
	sw	s0,%lo(heap_requested)(s7)
	sw	s4,%lo(heap_ptr)(s6)
	addi	a4, s2, 0
	addi	a5, zero, 0
.L64:
	sb	a5,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a5,s0,.L64
	addi	a0, s2, 0
	addi	s1,s1,1
.Lpcrel_2:
	auipc	ra, %pcrel_hi(md5.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_2)
	bne	s1,s3,.L65
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
	jalr	zero, ra, 0
.L69:
	jalr	zero, ra, 0
	.size	benchmark_body.constprop.1.isra.0, .-benchmark_body.constprop.1.isra.0
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
	.globl	md5
	.type	md5, @function
md5:
	lui	a4,%hi(.LANCHOR0)
	addi	sp,sp,-624
	addi	a4,a4,%lo(.LANCHOR0)
	sw	s0,620(sp)
	sw	s1,616(sp)
	sw	s2,612(sp)
	sw	s3,608(sp)
	sw	s4,604(sp)
	sw	s5,600(sp)
	sw	s6,596(sp)
	sw	s7,592(sp)
	sw	s8,588(sp)
	sw	s9,584(sp)
	sw	s10,580(sp)
	sw	s11,576(sp)
	addi	a5, a4, 0
	addi	a2,a4,256
	addi	a3,sp,64
.L76:
	lw	t3,0(a5)
	lw	t1,4(a5)
	lw	a7,8(a5)
	lw	a6,12(a5)
	sw	t3,0(a3)
	sw	t1,4(a3)
	sw	a7,8(a3)
	sw	a6,12(a3)
	addi	a5,a5,16
	addi	a3,a3,16
	bne	a5,a2,.L76
	addi	a4,a4,512
	addi	a3,sp,320
.L77:
	lw	t1,0(a5)
	lw	a7,4(a5)
	lw	a6,8(a5)
	lw	a2,12(a5)
	sw	t1,0(a3)
	sw	a7,4(a3)
	sw	a6,8(a3)
	sw	a2,12(a3)
	addi	a5,a5,16
	addi	a3,a3,16
	bne	a5,a4,.L77
	lui	t1, 422994
	addi	t1,t1,769
	lui	t3,%hi(heap_ptr)
	lui	a7, 982235
	lui	t6,%hi(h0)
	lw	t2,%lo(heap_ptr)(t3)
	addi	a7,a7,-1143
	lui	t4,%hi(heap_requested)
	lui	a3, 625582
	sw	t1,%lo(h0)(t6)
	lui	t1,%hi(h1)
	addi	a3,a3,-770
	lw	a5,%lo(heap_requested)(t4)
	addi	a6,a1,8
	lui	a4, 66341
	sw	a7,%lo(h1)(t1)
	lui	a7,%hi(h2)
	andi	a6,a6,-64
	addi	a4,a4,1142
	sw	a3,%lo(h2)(a7)
	lui	a3,%hi(h3)
	addi	a2,a6,120
	sw	a4,%lo(h3)(a3)
	andi	t5,t2,3
	add	a4,t2,a2
	add	a5,a2,a5
	addi	s10,a6,56
	beq	t5,zero,.L78
	addi	a3, zero, 4
	sub	a3,a3,t5
	add	a4,a4,a3
	add	a5,a5,a3
.L78:
	sw	a5,%lo(heap_requested)(t4)
	lui	a5,%hi(heap_end)
	lw	a5,%lo(heap_end)(a5)
	bltu	a5,a4,.L83
	sw	a4,%lo(heap_ptr)(t3)
	beq	t2,zero,.L83
	sub	a4, zero, t2
	andi	a5,a4,3
	addi	a7, zero, 0
	beq	a5,zero,.L86
	sb	zero,0(t2)
	andi	a4,a4,2
	addi	a7, zero, 1
	beq	a4,zero,.L86
	sb	zero,1(t2)
	addi	a4, zero, 3
	addi	a7, zero, 2
	bne	a5,a4,.L86
	sb	zero,2(t2)
	addi	a7, a5, 0
.L86:
	sub	t1,a2,a5
	andi	a4,t1,-4
	add	a5,t2,a5
	add	a3,a4,a5
.L88:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a3,.L88
	beq	a4,t1,.L89
	add	a5,a4,a7
	add	a4,t2,a5
	sb	zero,0(a4)
	addi	a4,a5,1
	bgeu	a4, a2, .L89
	add	a4,t2,a4
	sb	zero,0(a4)
	addi	a4,a5,2
	bgeu	a4, a2, .L89
	add	a4,t2,a4
	sb	zero,0(a4)
	addi	a4,a5,3
	bgeu	a4, a2, .L89
	add	a4,t2,a4
	sb	zero,0(a4)
	addi	a4,a5,4
	bgeu	a4, a2, .L89
	add	a4,t2,a4
	sb	zero,0(a4)
	addi	a5,a5,5
	bgeu	a5, a2, .L89
	add	a5,t2,a5
	sb	zero,0(a5)
.L89:
	beq	a1,zero,.L93
.L80:
	addi	a5,a1,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L90
	or	a3,a0,t2
	andi	a3,a3,3
	addi	a4, t2, 0
	addi	a5, a0, 0
	bne	a3,zero,.L90
	sub	a3,t2,a0
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L90
	andi	a7,a1,-4
	add	a2,a0,a7
.L91:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a2,a5,.L91
	beq	a1,a7,.L93
	lbu	a3,0(a2)
	add	a4,t2,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a1, .L93
	add	a4,a0,a5
	lbu	a4,0(a4)
	add	a5,t2,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a1, .L93
	add	a5,a0,a7
	lbu	a5,0(a5)
	add	a7,t2,a7
	sb	a5,0(a7)
.L93:
	add	a5,t2,a1
	addi	a4, zero, -128
	sb	a4,0(a5)
	andi	a5,t2,3
	slli	a1,a1,3
	add	a4,t2,s10
	bne	a5,zero,.L132
	sw	a1,0(a4)
.L97:
	bge	zero, s10, .L75
.L81:
	lui	t5, 1005505
	lui	t4, 292988
	lui	t3, 688900
	lui	t1, 1037417
	lui	a7, 432138
	lui	a6, 570447
	lui	a0, 1048566
	lui	a1, 562637
	lui	a2, 440577
	lui	a3, 1038727
	lui	a4, 681876
	lui	a5, 301889
	lui	s5, 66341
	lui	s4, 625582
	lui	s3, 982235
	lui	s6, 422994
	lui	s9, 882346
	lui	s8, 953467
	lui	s7, 147975
	lui	s11, 793565
	addi	t5,t5,-81
	addi	t4,t4,1578
	addi	t3,t3,1555
	addi	t1,t1,1281
	addi	a7,a7,-1832
	addi	a6,a6,1967
	addi	a0,a0,-1103
	addi	a1,a1,1982
	addi	a2,a2,290
	addi	a3,a3,403
	addi	a4,a4,910
	addi	a5,a5,-2015
	addi	s5,s5,1142
	addi	s4,s4,-770
	addi	s3,s3,-1143
	addi	s6,s6,769
	addi	s9,s9,1144
	addi	s8,s8,1878
	addi	s7,s7,219
	addi	s11,s11,-274
	sw	t5,12(sp)
	sw	t4,16(sp)
	sw	t3,20(sp)
	sw	t1,24(sp)
	sw	a7,28(sp)
	sw	a6,32(sp)
	sw	a0,36(sp)
	sw	a1,40(sp)
	sw	a2,44(sp)
	sw	a3,48(sp)
	sw	a4,52(sp)
	sw	a5,56(sp)
	addi	t6, t2, 0
	addi	t0, zero, 0
	addi	s1, zero, 31
	addi	s2, zero, 47
	addi	s0, zero, 64
	sw	s10,60(sp)
.L100:
	lw	a3,0(t6)
	xor	a5,s4,s5
	and	a5,a5,s3
	add	a4,s6,s9
	add	a4,a4,a3
	xor	a5,a5,s5
	add	a5,a5,a4
	srli	a1,a5,25
	slli	a5,a5,7
	lw	a4,4(t6)
	add	a1,a1,a5
	add	a1,a1,s3
	xor	a2,s4,s3
	and	a2,a2,a1
	add	a5,s5,s8
	add	a5,a5,a4
	xor	a2,a2,s4
	add	a2,a2,a5
	srli	a5,a2,20
	slli	a2,a2,12
	lw	a4,8(t6)
	add	a2,a2,a5
	add	a2,a1,a2
	xor	a3,s3,a1
	and	a3,a3,a2
	add	a5,s4,s7
	add	a5,a5,a4
	xor	a3,a3,s3
	add	a3,a3,a5
	srli	a5,a3,15
	slli	a3,a3,17
	lw	a0,12(t6)
	add	a3,a3,a5
	add	a3,a3,a2
	xor	a4,a1,a2
	and	a4,a4,a3
	add	a5,s3,s11
	add	a5,a5,a0
	xor	a4,a4,a1
	add	a4,a4,a5
	lw	a6,12(sp)
	lw	a5,16(t6)
	srli	a0,a4,10
	slli	a4,a4,22
	add	a4,a4,a0
	add	a4,a3,a4
	xor	a0,a3,a2
	add	a5,a5,a6
	add	a5,a5,a1
	and	a1,a0,a4
	xor	a1,a1,a2
	add	a5,a5,a1
	lw	a6,16(sp)
	lw	a1,20(t6)
	srli	a0,a5,25
	slli	a5,a5,7
	add	a5,a5,a0
	add	a5,a4,a5
	xor	a0,a3,a4
	add	a1,a1,a6
	add	a2,a1,a2
	and	a1,a0,a5
	xor	a1,a1,a3
	add	a2,a2,a1
	lw	a6,20(sp)
	lw	a1,24(t6)
	srli	a0,a2,20
	slli	a2,a2,12
	add	a2,a2,a0
	add	a2,a5,a2
	xor	a0,a4,a5
	add	a1,a1,a6
	add	a3,a1,a3
	and	a1,a0,a2
	xor	a1,a1,a4
	add	a3,a3,a1
	lw	a6,24(sp)
	lw	a1,28(t6)
	srli	a0,a3,15
	slli	a3,a3,17
	add	a3,a3,a0
	add	a3,a2,a3
	xor	a0,a5,a2
	add	a1,a1,a6
	add	a4,a1,a4
	and	a1,a0,a3
	xor	a1,a1,a5
	add	a4,a4,a1
	lw	a6,28(sp)
	lw	a1,32(t6)
	srli	a0,a4,10
	slli	a4,a4,22
	add	a4,a4,a0
	add	a4,a3,a4
	xor	a0,a2,a3
	add	a1,a1,a6
	add	a5,a1,a5
	and	a1,a0,a4
	xor	a1,a1,a2
	add	a5,a5,a1
	lw	a6,32(sp)
	lw	a1,36(t6)
	srli	a0,a5,25
	slli	a5,a5,7
	add	a5,a5,a0
	add	a5,a4,a5
	xor	a0,a3,a4
	add	a1,a1,a6
	add	a2,a1,a2
	and	a1,a0,a5
	xor	a1,a1,a3
	add	a2,a2,a1
	lw	a6,36(sp)
	lw	a1,40(t6)
	srli	a0,a2,20
	slli	a2,a2,12
	add	a2,a2,a0
	add	a2,a5,a2
	xor	a0,a4,a5
	add	a1,a1,a6
	add	a3,a1,a3
	and	a1,a0,a2
	xor	a1,a1,a4
	add	a3,a3,a1
	lw	a6,40(sp)
	lw	a1,44(t6)
	srli	a0,a3,15
	slli	a3,a3,17
	add	a3,a3,a0
	add	a3,a2,a3
	xor	a0,a5,a2
	add	a1,a1,a6
	add	a4,a1,a4
	and	a1,a0,a3
	xor	a1,a1,a5
	add	a4,a4,a1
	lw	a6,44(sp)
	lw	a1,48(t6)
	srli	a0,a4,10
	slli	a4,a4,22
	add	a4,a4,a0
	add	a4,a3,a4
	xor	a0,a2,a3
	add	a1,a1,a6
	add	a5,a1,a5
	and	a1,a0,a4
	xor	a1,a1,a2
	lw	a0,48(sp)
	add	a5,a5,a1
	lw	a6,52(t6)
	srli	a1,a5,25
	slli	a5,a5,7
	add	a5,a5,a1
	add	a5,a4,a5
	xor	a1,a3,a4
	add	a6,a6,a0
	add	a6,a6,a2
	and	a2,a1,a5
	xor	a2,a2,a3
	lw	a1,52(sp)
	add	a6,a6,a2
	lw	a0,56(t6)
	srli	a2,a6,20
	slli	a6,a6,12
	add	a6,a6,a2
	add	a6,a5,a6
	xor	a2,a4,a5
	add	a0,a0,a1
	add	a0,a0,a3
	and	a3,a2,a6
	xor	a3,a3,a4
	lw	a1,56(sp)
	add	a0,a0,a3
	lw	a2,60(t6)
	srli	a3,a0,15
	slli	a0,a0,17
	add	a0,a0,a3
	add	a0,a6,a0
	add	a2,a2,a1
	xor	a3,a5,a6
	add	a2,a2,a4
	and	a4,a3,a0
	xor	a4,a4,a5
	add	a2,a2,a4
	srli	a4,a2,10
	slli	a2,a2,22
	add	a2,a2,a4
	add	a2,a2,a0
	addi	t1,sp,384
	addi	a7,sp,128
	addi	t3, zero, 81
	addi	t4, zero, 53
	addi	t5, zero, 112
	addi	a1, zero, 16
	jal	zero, .L99
.L134:
	xor	a4,a4,a0
	andi	a3,t3,15
.L103:
	slli	a3,a3,2
	add	a3,t2,a3
	add	a3,a3,t0
	lw	s10,0(a3)
	lw	a3,0(t1)
	addi	a1,a1,1
	addi	t5,t5,7
	add	a4,a4,a3
	lw	a3,0(a7)
	add	a4,a4,s10
	add	a4,a4,a5
	sub	a5, zero, a3
	sll	a3,a4,a3
	srl	a4,a4,a5
	or	a3,a3,a4
	addi	t4,t4,3
	addi	t3,t3,5
	addi	t1,t1,4
	addi	a7,a7,4
	add	a3,a3,a2
	addi	a5, a6, 0
	beq	a1,s0,.L133
	addi	a6, a0, 0
	addi	a0, a2, 0
	addi	a2, a3, 0
.L99:
	xor	a4,a2,a0
	and	a4,a4,a6
	bgeu	s1, a1, .L134
	xor	a4,a2,a6
	bltu	s2, a1, .L104
	xor	a4,a4,a0
	andi	a3,t4,15
	jal	zero, .L103
.L104:
	xori	a4, a6, -1
	or	a4,a4,a2
	xor	a4,a4,a0
	andi	a3,t5,15
	jal	zero, .L103
.L133:
	lw	a5,60(sp)
	addi	t0,t0,64
	add	s6,s6,a6
	add	s3,s3,a3
	add	s4,s4,a2
	add	s5,s5,a0
	addi	t6,t6,64
	blt	t0, a5, .L100
	lui	a5,%hi(h0)
	sw	s6,%lo(h0)(a5)
	lui	a5,%hi(h1)
	sw	s3,%lo(h1)(a5)
	lui	a5,%hi(h2)
	sw	s4,%lo(h2)(a5)
	lui	a5,%hi(h3)
	sw	s5,%lo(h3)(a5)
.L75:
	lw	s0,620(sp)
	lw	s1,616(sp)
	lw	s2,612(sp)
	lw	s3,608(sp)
	lw	s4,604(sp)
	lw	s5,600(sp)
	lw	s6,596(sp)
	lw	s7,592(sp)
	lw	s8,588(sp)
	lw	s9,584(sp)
	lw	s10,580(sp)
	lw	s11,576(sp)
	addi	sp,sp,624
	jalr	zero, ra, 0
.L83:
	addi	t2, zero, 0
	bne	a1,zero,.L80
	addi	a5, zero, -128
	sw	zero,56(zero)
	sb	a5,0(zero)
	jal	zero, .L81
.L132:
	sb	a1,0(a4)
	add	a6,t2,a6
	srli	a4,a1,8
	srli	a5,a1,16
	srli	a1,a1,24
	sb	a4,57(a6)
	sb	a5,58(a6)
	sb	a1,59(a6)
	jal	zero, .L97
.L90:
	addi	a5, a0, 0
	add	a2,a0,a1
	addi	a4, t2, 0
.L95:
	lbu	a3,0(a5)
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a3,-1(a4)
	bne	a2,a5,.L95
	jal	zero, .L93
	.size	md5, .-md5
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
	auipc	ra, %pcrel_hi(benchmark_body.constprop.1.isra.0)
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
	addi	a0, zero, 1
	sw	ra,28(sp)
.Lpcrel_5:
	auipc	ra, %pcrel_hi(benchmark_body.constprop.1.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_5)
.Lpcrel_6:
	auipc	ra, %pcrel_hi(benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_6)
	sw	a0,12(sp)
	lw	a0,12(sp)
	lw	ra,28(sp)
	lui	a5, 835737
	addi	a5,a5,-948
	add	a0,a0,a5
	sltu	a0, zero, a0
	addi	sp,sp,32
	jalr	zero, ra, 0
	.size	main, .-main
	.text
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a5, 835737
	addi	a5,a5,-948
	add	a0,a0,a5
	sltiu	a0, a0, 1
	jalr	zero, ra, 0
	.size	verify_benchmark, .-verify_benchmark
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.word	7
	.word	12
	.word	17
	.word	22
	.word	7
	.word	12
	.word	17
	.word	22
	.word	7
	.word	12
	.word	17
	.word	22
	.word	7
	.word	12
	.word	17
	.word	22
	.word	5
	.word	9
	.word	14
	.word	20
	.word	5
	.word	9
	.word	14
	.word	20
	.word	5
	.word	9
	.word	14
	.word	20
	.word	5
	.word	9
	.word	14
	.word	20
	.word	4
	.word	11
	.word	16
	.word	23
	.word	4
	.word	11
	.word	16
	.word	23
	.word	4
	.word	11
	.word	16
	.word	23
	.word	4
	.word	11
	.word	16
	.word	23
	.word	6
	.word	10
	.word	15
	.word	21
	.word	6
	.word	10
	.word	15
	.word	21
	.word	6
	.word	10
	.word	15
	.word	21
	.word	6
	.word	10
	.word	15
	.word	21
.LC1:
	.word	-680876936
	.word	-389564586
	.word	606105819
	.word	-1044525330
	.word	-176418897
	.word	1200080426
	.word	-1473231341
	.word	-45705983
	.word	1770035416
	.word	-1958414417
	.word	-42063
	.word	-1990404162
	.word	1804603682
	.word	-40341101
	.word	-1502002290
	.word	1236535329
	.word	-165796510
	.word	-1069501632
	.word	643717713
	.word	-373897302
	.word	-701558691
	.word	38016083
	.word	-660478335
	.word	-405537848
	.word	568446438
	.word	-1019803690
	.word	-187363961
	.word	1163531501
	.word	-1444681467
	.word	-51403784
	.word	1735328473
	.word	-1926607734
	.word	-378558
	.word	-2022574463
	.word	1839030562
	.word	-35309556
	.word	-1530992060
	.word	1272893353
	.word	-155497632
	.word	-1094730640
	.word	681279174
	.word	-358537222
	.word	-722521979
	.word	76029189
	.word	-640364487
	.word	-421815835
	.word	530742520
	.word	-995338651
	.word	-198630844
	.word	1126891415
	.word	-1416354905
	.word	-57434055
	.word	1700485571
	.word	-1894986606
	.word	-1051523
	.word	-2054922799
	.word	1873313359
	.word	-30611744
	.word	-1560198380
	.word	1309151649
	.word	-145523070
	.word	-1120210379
	.word	718787259
	.word	-343485551
	.bss
	.align	2
	.type	heap, @object
	.size	heap, 3080
heap:
	.zero	3080
	.section	.sbss,"aw",@nobits
	.align	2
	.type	h3, @object
	.size	h3, 4
h3:
	.zero	4
	.type	h2, @object
	.size	h2, 4
h2:
	.zero	4
	.type	h1, @object
	.size	h1, 4
h1:
	.zero	4
	.type	h0, @object
	.size	h0, 4
h0:
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
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
