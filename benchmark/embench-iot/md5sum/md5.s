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
	mv	a5,a4
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
	li	a1,1732583424
	addi	a1,a1,769
	lui	a6,%hi(heap_ptr)
	li	a2,-271732736
	lui	t3,%hi(h0)
	lw	t2,%lo(heap_ptr)(a6)
	addi	a2,a2,-1143
	lui	a7,%hi(heap_requested)
	li	a3,-1732583424
	sw	a1,%lo(h0)(t3)
	lui	a1,%hi(h1)
	addi	a3,a3,-770
	lw	a5,%lo(heap_requested)(a7)
	li	a4,271732736
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
	li	a3,4
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
	neg	a4,t2
	andi	a5,a4,3
	beq	a5,zero,.L25
	sb	zero,0(t2)
	andi	a4,a4,2
	beq	a4,zero,.L26
	sb	zero,1(t2)
	li	a4,3
	bne	a5,a4,.L27
	sb	zero,2(t2)
	li	a2,1077
.L8:
	li	a6,1080
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
	li	a4,1
	beq	a2,a4,.L6
	sb	zero,1(a5)
	li	a4,2
	beq	a2,a4,.L6
	sb	zero,2(a5)
.L6:
	or	a4,t2,a0
	andi	a4,a4,3
	mv	a5,a0
	mv	t6,t2
	bne	a4,zero,.L12
.L54:
	sub	a4,t2,a0
	addi	a4,a4,-1
	sltiu	a4,a4,3
	bne	a4,zero,.L12
	addi	a2,a0,1000
	mv	a4,t2
.L13:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a2,a5,.L13
	li	a5,-128
	sb	a5,1000(t2)
	andi	a5,t2,3
	bne	a5,zero,.L16
.L55:
	li	a5,8192
	addi	a5,a5,-192
	sw	a5,1016(t2)
.L17:
	li	t4,1200078848
	li	t3,-1473232896
	li	t1,-45707264
	li	a7,1770037248
	li	a6,-1958416384
	li	a0,-40960
	li	a1,-1990406144
	li	a2,1804603392
	li	a3,-40341504
	li	a4,-1502003200
	li	a5,1236537344
	li	s5,271732736
	li	s4,-1732583424
	li	s3,-271732736
	li	s6,1732583424
	li	s10,-680878080
	li	s9,-389566464
	li	s8,606105600
	li	s7,-1044525056
	li	s11,-176418816
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
	li	t0,0
	li	s1,31
	li	s2,47
	li	s0,64
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
	li	t3,81
	li	t4,53
	li	t5,112
	li	a1,16
	sw	s6,0(sp)
	j	.L18
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
	neg	a5,a3
	sll	a3,a4,a3
	srl	a4,a4,a5
	or	a3,a3,a4
	addi	t4,t4,3
	addi	t3,t3,5
	addi	t1,t1,4
	addi	a7,a7,4
	add	a3,a3,a2
	mv	a5,a6
	beq	a1,s0,.L52
	mv	a6,a0
	mv	a0,a2
	mv	a2,a3
.L18:
	xor	a4,a0,a2
	and	a4,a4,a6
	bleu	a1,s1,.L53
	xor	a4,a0,a6
	bgtu	a1,s2,.L23
	xor	a4,a4,a2
	andi	a3,t4,15
	j	.L22
.L23:
	not	a4,a6
	or	a4,a4,a2
	xor	a4,a4,a0
	andi	a3,t5,15
	j	.L22
.L52:
	lw	s6,0(sp)
	addi	t0,t0,64
	li	a5,1024
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
	jr	ra
.L7:
	li	t2,0
	or	a4,t2,a0
	andi	a4,a4,3
	mv	a5,a0
	mv	t6,t2
	beq	a4,zero,.L54
.L12:
	addi	a3,a0,1000
	mv	a4,t2
.L15:
	lbu	a2,0(a5)
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a2,-1(a4)
	bne	a3,a5,.L15
	li	a5,-128
	sb	a5,1000(t2)
	andi	a5,t2,3
	beq	a5,zero,.L55
.L16:
	li	a4,64
	li	a5,31
	sb	zero,1018(t2)
	sb	zero,1019(t2)
	sb	a4,1016(t2)
	sb	a5,1017(t2)
	j	.L17
.L25:
	li	a4,0
	li	a2,1080
	j	.L8
.L26:
	li	a2,1079
	li	a4,1
	j	.L8
.L27:
	li	a2,1078
	li	a4,2
	j	.L8
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
	li	s1,51
	lui	s7,%hi(heap_end)
	lui	s6,%hi(heap_requested)
	lui	s5,%hi(heap_ptr)
	li	s0,1000
.L58:
	sw	s4,%lo(heap_end)(s7)
	sw	s0,%lo(heap_requested)(s6)
	sw	s3,%lo(heap_ptr)(s5)
	mv	a4,s2
	li	a5,0
.L57:
	sb	a5,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a5,s0,.L57
	mv	a0,s2
	addi	s1,s1,-1
	call	md5.constprop.0
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
	jr	ra
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
	.align	2
	.type	benchmark_body.constprop.1.isra.0, @function
benchmark_body.constprop.1.isra.0:
	ble	a0,zero,.L69
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
	mv	s3,a0
	addi	s5,s5,%lo(heap+3080)
	addi	s4,s4,%lo(heap+1000)
	addi	s2,s2,%lo(heap)
	li	s1,0
	lui	s8,%hi(heap_end)
	lui	s7,%hi(heap_requested)
	lui	s6,%hi(heap_ptr)
	li	s0,1000
.L65:
	sw	s5,%lo(heap_end)(s8)
	sw	s0,%lo(heap_requested)(s7)
	sw	s4,%lo(heap_ptr)(s6)
	mv	a4,s2
	li	a5,0
.L64:
	sb	a5,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a5,s0,.L64
	mv	a0,s2
	addi	s1,s1,1
	call	md5.constprop.0
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
	jr	ra
.L69:
	ret
	.size	benchmark_body.constprop.1.isra.0, .-benchmark_body.constprop.1.isra.0
	.align	2
	.globl	memset
	.type	memset, @function
memset:
	beq	a2,zero,.L85
	addi	a5,a2,-1
	li	a4,5
	andi	a1,a1,0xff
	bleu	a5,a4,.L81
	neg	a4,a0
	andi	a5,a4,3
	li	a6,0
	beq	a5,zero,.L75
	sb	a1,0(a0)
	andi	a4,a4,2
	li	a6,1
	beq	a4,zero,.L75
	sb	a1,1(a0)
	li	a4,3
	li	a6,2
	bne	a5,a4,.L75
	sb	a1,2(a0)
	mv	a6,a5
.L75:
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
.L77:
	sw	a4,0(a5)
	addi	a5,a5,4
	bne	a5,a3,.L77
	add	a5,a6,a7
	beq	t1,a7,.L85
.L74:
	add	a4,a0,a5
	sb	a1,0(a4)
	addi	a4,a5,1
	bleu	a2,a4,.L85
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,2
	bleu	a2,a4,.L85
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,3
	bleu	a2,a4,.L85
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,4
	bleu	a2,a4,.L85
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a5,a5,5
	bleu	a2,a5,.L85
	add	a5,a0,a5
	sb	a1,0(a5)
.L85:
	ret
.L81:
	li	a5,0
	j	.L74
	.size	memset, .-memset
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	beq	a2,zero,.L90
	addi	a5,a2,-1
	li	a4,6
	bleu	a5,a4,.L91
	or	a3,a0,a1
	andi	a3,a3,3
	mv	a4,a0
	mv	a5,a1
	bne	a3,zero,.L91
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L91
	andi	a7,a2,-4
	add	a6,a1,a7
.L92:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L92
	beq	a2,a7,.L90
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bleu	a2,a5,.L90
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bleu	a2,a7,.L90
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	ret
.L91:
	add	a2,a1,a2
	mv	a5,a0
.L94:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L94
.L90:
	ret
	.size	memcpy, .-memcpy
	.align	2
	.globl	memcmp
	.type	memcmp, @function
memcmp:
	beq	a2,zero,.L111
	add	a2,a0,a2
	j	.L110
.L109:
	beq	a0,a2,.L111
.L110:
	lbu	a5,0(a0)
	lbu	a4,0(a1)
	addi	a0,a0,1
	addi	a1,a1,1
	beq	a5,a4,.L109
	sub	a0,a5,a4
	ret
.L111:
	li	a0,0
	ret
	.size	memcmp, .-memcmp
	.align	2
	.globl	memmove
	.type	memmove, @function
memmove:
	bgeu	a0,a1,.L114
	beq	a2,zero,.L115
	addi	a5,a2,-1
	li	a4,6
	bleu	a5,a4,.L116
	or	a3,a1,a0
	andi	a3,a3,3
	mv	a4,a0
	mv	a5,a1
	bne	a3,zero,.L116
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L116
	andi	a7,a2,-4
	add	a6,a1,a7
.L117:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L117
	beq	a2,a7,.L115
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bleu	a2,a5,.L115
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bleu	a2,a7,.L115
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	ret
.L114:
	bgtu	a0,a1,.L137
.L115:
	ret
.L137:
	beq	a2,zero,.L115
	addi	a2,a2,-1
	add	a5,a1,a2
	lbu	a4,0(a5)
	add	a5,a0,a2
	sb	a4,0(a5)
	j	.L137
.L116:
	add	a2,a1,a2
	mv	a5,a0
.L119:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L119
	ret
	.size	memmove, .-memmove
	.align	2
	.globl	strlen
	.type	strlen, @function
strlen:
	lbu	a5,0(a0)
	beq	a5,zero,.L138
	li	a5,0
.L140:
	addi	a5,a5,1
	add	a4,a0,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L140
.L138:
	mv	a0,a5
	ret
	.size	strlen, .-strlen
	.align	2
	.globl	strchr
	.type	strchr, @function
strchr:
	lbu	a5,0(a0)
	beq	a5,zero,.L144
	andi	a4,a1,0xff
.L146:
	beq	a4,a5,.L143
	lbu	a5,1(a0)
	addi	a0,a0,1
	bne	a5,zero,.L146
.L144:
	seqz	a1,a1
	neg	a1,a1
	and	a0,a0,a1
.L143:
	ret
	.size	strchr, .-strchr
	.align	2
	.globl	rand_beebs
	.type	rand_beebs, @function
rand_beebs:
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
	.size	rand_beebs, .-rand_beebs
	.align	2
	.globl	srand_beebs
	.type	srand_beebs, @function
srand_beebs:
	lui	a5,%hi(seed)
	sw	a0,%lo(seed)(a5)
	ret
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
	ret
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
	ret
	.size	check_heap_beebs, .-check_heap_beebs
	.align	2
	.globl	malloc_beebs
	.type	malloc_beebs, @function
malloc_beebs:
	mv	a5,a0
	beq	a0,zero,.L159
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a1,%lo(heap_requested)(a3)
	add	a4,a0,a5
	andi	a6,a4,3
	add	a5,a5,a1
	bne	a6,zero,.L163
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a1,a4,.L159
.L164:
	sw	a4,%lo(heap_ptr)(a2)
	ret
.L163:
	li	a1,4
	sub	a1,a1,a6
	add	a5,a5,a1
	add	a4,a4,a1
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a1,a4,.L164
.L159:
	li	a0,0
	ret
	.size	malloc_beebs, .-malloc_beebs
	.align	2
	.globl	calloc_beebs
	.type	calloc_beebs, @function
calloc_beebs:
	mul	a1,a0,a1
	beq	a1,zero,.L166
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a0,a1
	andi	a6,a4,3
	add	a5,a1,a5
	bne	a6,zero,.L191
.L167:
	lui	a6,%hi(heap_end)
	lw	a6,%lo(heap_end)(a6)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a6,a4,.L166
	sw	a4,%lo(heap_ptr)(a2)
	beq	a0,zero,.L166
	addi	a5,a1,-1
	li	a4,5
	bleu	a5,a4,.L175
	neg	a4,a0
	andi	a5,a4,3
	li	a3,0
	beq	a5,zero,.L169
	sb	zero,0(a0)
	andi	a4,a4,2
	li	a3,1
	beq	a4,zero,.L169
	sb	zero,1(a0)
	li	a4,3
	li	a3,2
	bne	a5,a4,.L169
	sb	zero,2(a0)
	mv	a3,a5
.L169:
	sub	a6,a1,a5
	andi	a2,a6,-4
	add	a5,a0,a5
	add	a4,a5,a2
.L171:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L171
	add	a5,a3,a2
	beq	a6,a2,.L165
.L168:
	add	a4,a0,a5
	sb	zero,0(a4)
	addi	a4,a5,1
	bleu	a1,a4,.L165
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,2
	bleu	a1,a4,.L165
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,3
	bleu	a1,a4,.L165
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,4
	bleu	a1,a4,.L165
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a5,a5,5
	bleu	a1,a5,.L165
	add	a5,a0,a5
	sb	zero,0(a5)
	ret
.L166:
	li	a0,0
.L165:
	ret
.L191:
	li	a7,4
	sub	a6,a7,a6
	add	a4,a4,a6
	add	a5,a5,a6
	j	.L167
.L175:
	li	a5,0
	j	.L168
	.size	calloc_beebs, .-calloc_beebs
	.align	2
	.globl	realloc_beebs
	.type	realloc_beebs, @function
realloc_beebs:
	beq	a0,zero,.L193
	beq	a1,zero,.L193
	lui	a6,%hi(heap_ptr)
	lw	a2,%lo(heap_ptr)(a6)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a2,a1
	andi	a7,a4,3
	add	a5,a1,a5
	bne	a7,zero,.L218
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a7,a4,.L193
.L219:
	sw	a4,%lo(heap_ptr)(a6)
	beq	a2,zero,.L193
	addi	a5,a1,-1
	li	a4,6
	bleu	a5,a4,.L203
	or	a3,a0,a2
	andi	a3,a3,3
	mv	a4,a2
	mv	a5,a0
	bne	a3,zero,.L203
	addi	a3,a2,-1
	sub	a3,a3,a0
	sltiu	a3,a3,3
	bne	a3,zero,.L203
	andi	a7,a1,-4
	add	a6,a0,a7
.L196:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L196
	beq	a1,a7,.L192
	lbu	a3,0(a6)
	add	a4,a2,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bleu	a1,a5,.L192
	add	a4,a0,a5
	lbu	a4,0(a4)
	add	a5,a2,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bleu	a1,a7,.L192
	add	a0,a0,a7
	lbu	a5,0(a0)
	add	a7,a2,a7
	sb	a5,0(a7)
.L192:
	mv	a0,a2
	ret
.L218:
	li	t1,4
	sub	a7,t1,a7
	add	a5,a5,a7
	add	a4,a4,a7
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a7,a4,.L219
.L193:
	li	a2,0
	mv	a0,a2
	ret
.L203:
	li	a5,0
.L200:
	add	a4,a0,a5
	lbu	a3,0(a4)
	add	a4,a2,a5
	addi	a5,a5,1
	sb	a3,0(a4)
	bgtu	a1,a5,.L200
	mv	a0,a2
	ret
	.size	realloc_beebs, .-realloc_beebs
	.align	2
	.globl	free_beebs
	.type	free_beebs, @function
free_beebs:
	ret
	.size	free_beebs, .-free_beebs
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
	mv	a5,a4
	addi	a2,a4,256
	addi	a3,sp,64
.L225:
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
	bne	a5,a2,.L225
	addi	a4,a4,512
	addi	a3,sp,320
.L226:
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
	bne	a5,a4,.L226
	li	t1,1732583424
	addi	t1,t1,769
	lui	t3,%hi(heap_ptr)
	li	a7,-271732736
	lui	t6,%hi(h0)
	lw	t2,%lo(heap_ptr)(t3)
	addi	a7,a7,-1143
	lui	t4,%hi(heap_requested)
	li	a3,-1732583424
	sw	t1,%lo(h0)(t6)
	lui	t1,%hi(h1)
	addi	a3,a3,-770
	lw	a5,%lo(heap_requested)(t4)
	addi	a6,a1,8
	li	a4,271732736
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
	beq	t5,zero,.L227
	li	a3,4
	sub	a3,a3,t5
	add	a4,a4,a3
	add	a5,a5,a3
.L227:
	sw	a5,%lo(heap_requested)(t4)
	lui	a5,%hi(heap_end)
	lw	a5,%lo(heap_end)(a5)
	bltu	a5,a4,.L232
	sw	a4,%lo(heap_ptr)(t3)
	beq	t2,zero,.L232
	neg	a4,t2
	andi	a5,a4,3
	li	a7,0
	beq	a5,zero,.L235
	sb	zero,0(t2)
	andi	a4,a4,2
	li	a7,1
	beq	a4,zero,.L235
	sb	zero,1(t2)
	li	a4,3
	li	a7,2
	bne	a5,a4,.L235
	sb	zero,2(t2)
	mv	a7,a5
.L235:
	sub	t1,a2,a5
	andi	a4,t1,-4
	add	a5,t2,a5
	add	a3,a4,a5
.L237:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a3,.L237
	beq	a4,t1,.L238
	add	a5,a4,a7
	add	a4,t2,a5
	sb	zero,0(a4)
	addi	a4,a5,1
	bleu	a2,a4,.L238
	add	a4,t2,a4
	sb	zero,0(a4)
	addi	a4,a5,2
	bleu	a2,a4,.L238
	add	a4,t2,a4
	sb	zero,0(a4)
	addi	a4,a5,3
	bleu	a2,a4,.L238
	add	a4,t2,a4
	sb	zero,0(a4)
	addi	a4,a5,4
	bleu	a2,a4,.L238
	add	a4,t2,a4
	sb	zero,0(a4)
	addi	a5,a5,5
	bleu	a2,a5,.L238
	add	a5,t2,a5
	sb	zero,0(a5)
.L238:
	beq	a1,zero,.L242
.L229:
	addi	a5,a1,-1
	li	a4,6
	bleu	a5,a4,.L239
	or	a3,a0,t2
	andi	a3,a3,3
	mv	a4,t2
	mv	a5,a0
	bne	a3,zero,.L239
	sub	a3,t2,a0
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L239
	andi	a7,a1,-4
	add	a2,a0,a7
.L240:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a2,a5,.L240
	beq	a1,a7,.L242
	lbu	a3,0(a2)
	add	a4,t2,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bleu	a1,a5,.L242
	add	a4,a0,a5
	lbu	a4,0(a4)
	add	a5,t2,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bleu	a1,a7,.L242
	add	a5,a0,a7
	lbu	a5,0(a5)
	add	a7,t2,a7
	sb	a5,0(a7)
.L242:
	add	a5,t2,a1
	li	a4,-128
	sb	a4,0(a5)
	andi	a5,t2,3
	slli	a1,a1,3
	add	a4,t2,s10
	bne	a5,zero,.L281
	sw	a1,0(a4)
.L246:
	ble	s10,zero,.L224
.L230:
	li	t5,-176418816
	li	t4,1200078848
	li	t3,-1473232896
	li	t1,-45707264
	li	a7,1770037248
	li	a6,-1958416384
	li	a0,-40960
	li	a1,-1990406144
	li	a2,1804603392
	li	a3,-40341504
	li	a4,-1502003200
	li	a5,1236537344
	li	s5,271732736
	li	s4,-1732583424
	li	s3,-271732736
	li	s6,1732583424
	li	s9,-680878080
	li	s8,-389566464
	li	s7,606105600
	li	s11,-1044525056
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
	mv	t6,t2
	li	t0,0
	li	s1,31
	li	s2,47
	li	s0,64
	sw	s10,60(sp)
.L249:
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
	li	t3,81
	li	t4,53
	li	t5,112
	li	a1,16
	j	.L248
.L283:
	xor	a4,a4,a0
	andi	a3,t3,15
.L252:
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
	neg	a5,a3
	sll	a3,a4,a3
	srl	a4,a4,a5
	or	a3,a3,a4
	addi	t4,t4,3
	addi	t3,t3,5
	addi	t1,t1,4
	addi	a7,a7,4
	add	a3,a3,a2
	mv	a5,a6
	beq	a1,s0,.L282
	mv	a6,a0
	mv	a0,a2
	mv	a2,a3
.L248:
	xor	a4,a2,a0
	and	a4,a4,a6
	bleu	a1,s1,.L283
	xor	a4,a2,a6
	bgtu	a1,s2,.L253
	xor	a4,a4,a0
	andi	a3,t4,15
	j	.L252
.L253:
	not	a4,a6
	or	a4,a4,a2
	xor	a4,a4,a0
	andi	a3,t5,15
	j	.L252
.L282:
	lw	a5,60(sp)
	addi	t0,t0,64
	add	s6,s6,a6
	add	s3,s3,a3
	add	s4,s4,a2
	add	s5,s5,a0
	addi	t6,t6,64
	bgt	a5,t0,.L249
	lui	a5,%hi(h0)
	sw	s6,%lo(h0)(a5)
	lui	a5,%hi(h1)
	sw	s3,%lo(h1)(a5)
	lui	a5,%hi(h2)
	sw	s4,%lo(h2)(a5)
	lui	a5,%hi(h3)
	sw	s5,%lo(h3)(a5)
.L224:
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
	jr	ra
.L232:
	li	t2,0
	bne	a1,zero,.L229
	li	a5,-128
	sw	zero,56(zero)
	sb	a5,0(zero)
	j	.L230
.L281:
	sb	a1,0(a4)
	add	a6,t2,a6
	srli	a4,a1,8
	srli	a5,a1,16
	srli	a1,a1,24
	sb	a4,57(a6)
	sb	a5,58(a6)
	sb	a1,59(a6)
	j	.L246
.L239:
	mv	a5,a0
	add	a2,a0,a1
	mv	a4,t2
.L244:
	lbu	a3,0(a5)
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a3,-1(a4)
	bne	a2,a5,.L244
	j	.L242
	.size	md5, .-md5
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
	call	benchmark_body.constprop.1.isra.0
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
	addi	sp,sp,-32
	sw	ra,28(sp)
 #APP
# 15 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	li a0, 0
# 0 "" 2
 #NO_APP
	li	a0,1
	call	benchmark_body.constprop.1.isra.0
	call	start_trigger
	call	benchmark
	sw	a0,12(sp)
	call	stop_trigger
	lw	a0,12(sp)
	lw	ra,28(sp)
	li	a5,-871788544
	addi	a5,a5,-948
	add	a0,a0,a5
	snez	a0,a0
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.text
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	li	a5,-871788544
	addi	a5,a5,-948
	add	a0,a0,a5
	seqz	a0,a0
	ret
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
	.type	seed, @object
	.size	seed, 4
seed:
	.zero	4
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
