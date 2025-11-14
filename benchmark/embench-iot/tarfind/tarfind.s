	.file	"tarfind.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	ble	a0,zero,.L39
	addi	sp,sp,-64
	sw	s8,28(sp)
	lui	s8,%hi(seed)
	lw	a5,%lo(seed)(s8)
	sw	s2,52(sp)
	sw	s7,32(sp)
	lui	s2,%hi(heap)
	lui	t2,%hi(heap+8995)
	lui	s7,%hi(heap+5654)
	li	a7,-2147483648
	li	t3,1103515648
	li	t1,12288
	li	a6,1321529344
	sw	s1,56(sp)
	sw	s3,48(sp)
	sw	s4,44(sp)
	sw	s5,40(sp)
	sw	s6,36(sp)
	sw	s9,24(sp)
	sw	s10,20(sp)
	sw	s0,60(sp)
	sw	s11,16(sp)
	addi	s2,s2,%lo(heap)
	addi	t2,t2,%lo(heap+8995)
	addi	s7,s7,%lo(heap+5654)
	addi	t3,t3,-403
	addi	t1,t1,57
	addi	a7,a7,-1
	addi	a6,a6,-945
	li	a1,0
	lui	s9,%hi(heap+5)
	lui	s10,%hi(heap+4369)
	li	s3,257
	li	s5,1
	li	s4,3
	li	s6,2
	li	s1,48
	li	t4,26
.L17:
	addi	a3,s9,%lo(heap+5)
	mv	a2,s2
	li	s0,0
	sw	a1,12(sp)
	mv	s11,a0
.L8:
	neg	a1,a2
	andi	a4,a1,3
	beq	a4,zero,.L18
	sb	zero,0(a2)
	andi	a1,a1,2
	beq	a1,zero,.L19
	sb	zero,1(a2)
	bne	a4,s4,.L20
	sb	zero,2(a2)
	mv	t5,s4
	li	t0,254
.L3:
	sub	a0,s3,a4
	add	a4,a4,s0
	add	a4,s2,a4
	andi	t6,a0,-4
	add	a1,t6,a4
.L5:
	sw	zero,0(a4)
	addi	a4,a4,4
	bne	a1,a4,.L5
	beq	t6,a0,.L6
	add	t5,t6,t5
	add	t5,a2,t5
	sb	zero,0(t5)
	sub	t0,t0,t6
	beq	t0,s5,.L6
	sb	zero,1(t5)
	beq	t0,s6,.L6
	sb	zero,2(t5)
.L6:
	sb	s1,156(a2)
	mv	a0,a2
.L7:
	mul	a5,a5,t3
	addi	a0,a0,1
	add	a5,a5,t1
	and	a5,a5,a7
	srai	a4,a5,16
	mulhu	a1,a4,a6
	srli	a1,a1,3
	mul	a1,a1,t4
	sub	a4,a4,a1
	addi	a4,a4,65
	sb	a4,-1(a0)
	bne	a3,a0,.L7
	sb	s1,124(a2)
	addi	a2,a2,257
	addi	a3,a3,258
	addi	s0,s0,257
	bne	a2,t2,.L8
	lw	a1,12(sp)
	mv	a0,s11
	addi	t0,s10,%lo(heap+4369)
.L16:
	mv	t6,s2
.L15:
	lbu	a3,0(t6)
	mv	a2,t6
	mv	a4,t0
	bne	a3,zero,.L9
	j	.L10
.L43:
	bne	a3,t5,.L13
	lbu	a3,0(a2)
	beq	a3,zero,.L10
.L9:
	lbu	t5,0(a4)
	addi	a2,a2,1
	addi	a4,a4,1
	bne	t5,zero,.L43
.L13:
	addi	t6,t6,257
	bne	t6,t2,.L15
.L14:
	addi	t0,t0,257
	bne	t0,s7,.L16
	addi	a1,a1,1
	bne	a1,a0,.L17
	lw	s0,60(sp)
	lui	a4,%hi(heap+8996)
	li	a3,8192
	addi	a4,a4,%lo(heap+8996)
	lui	a0,%hi(heap_ptr)
	lui	a1,%hi(heap_end)
	addi	a3,a3,804
	lui	a2,%hi(heap_requested)
	sw	a5,%lo(seed)(s8)
	sw	a4,%lo(heap_ptr)(a0)
	sw	a4,%lo(heap_end)(a1)
	sw	a3,%lo(heap_requested)(a2)
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
.L10:
	lbu	a4,0(a4)
	beq	a4,zero,.L14
	addi	t6,t6,257
	bne	t6,t2,.L15
	j	.L14
.L19:
	li	t5,1
	li	t0,256
	j	.L3
.L18:
	li	t5,0
	li	t0,257
	j	.L3
.L20:
	li	t5,2
	li	t0,255
	j	.L3
.L39:
	ret
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.type	benchmark_body.constprop.0, @function
benchmark_body.constprop.0:
	addi	sp,sp,-48
	sw	s4,28(sp)
	lui	s4,%hi(seed)
	lw	a1,%lo(seed)(s4)
	sw	s2,36(sp)
	lui	t6,%hi(heap)
	lui	t4,%hi(heap+8995)
	lui	s2,%hi(heap+5654)
	li	a6,-2147483648
	li	t1,1103515648
	li	a7,12288
	li	a0,1321529344
	sw	s0,44(sp)
	sw	s1,40(sp)
	sw	s3,32(sp)
	sw	s5,24(sp)
	sw	s6,20(sp)
	sw	s7,16(sp)
	sw	s8,12(sp)
	sw	s9,8(sp)
	sw	s10,4(sp)
	sw	s11,0(sp)
	addi	t6,t6,%lo(heap)
	addi	t4,t4,%lo(heap+8995)
	addi	s2,s2,%lo(heap+5654)
	addi	t1,t1,-403
	addi	a7,a7,57
	addi	a6,a6,-1
	addi	a0,a0,-945
	li	s3,47
	lui	s6,%hi(heap+5)
	lui	s5,%hi(heap+4369)
	li	t0,257
	li	s0,1
	li	t2,3
	li	s1,2
	li	t5,48
	li	t3,26
.L59:
	addi	a2,s6,%lo(heap+5)
	mv	s7,t6
	li	s8,0
.L50:
	neg	a4,s7
	andi	a5,a4,3
	beq	a5,zero,.L60
	sb	zero,0(s7)
	andi	a4,a4,2
	beq	a4,zero,.L61
	sb	zero,1(s7)
	bne	a5,t2,.L62
	sb	zero,2(s7)
	mv	a4,t2
	li	a3,254
.L45:
	sub	s9,t0,a5
	add	a5,a5,s8
	add	a5,t6,a5
	andi	s11,s9,-4
	add	s10,s11,a5
.L47:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	s10,a5,.L47
	beq	s11,s9,.L48
	add	a4,s11,a4
	add	a4,s7,a4
	sb	zero,0(a4)
	sub	a3,a3,s11
	beq	a3,s0,.L48
	sb	zero,1(a4)
	beq	a3,s1,.L48
	sb	zero,2(a4)
.L48:
	sb	t5,156(s7)
	mv	a3,s7
.L49:
	mul	a1,a1,t1
	addi	a3,a3,1
	add	a1,a1,a7
	and	a1,a1,a6
	srai	a5,a1,16
	mulhu	a4,a5,a0
	srli	a4,a4,3
	mul	a4,a4,t3
	sub	a5,a5,a4
	addi	a5,a5,65
	sb	a5,-1(a3)
	bne	a2,a3,.L49
	sb	t5,124(s7)
	addi	s7,s7,257
	addi	a2,a2,258
	addi	s8,s8,257
	bne	s7,t4,.L50
	addi	s8,s5,%lo(heap+4369)
	li	s9,0
.L58:
	mv	s7,t6
.L57:
	lbu	a4,0(s7)
	mv	a3,s7
	mv	a5,s8
	bne	a4,zero,.L51
	j	.L52
.L78:
	bne	a2,a4,.L55
	lbu	a4,0(a3)
	beq	a4,zero,.L52
.L51:
	lbu	a2,0(a5)
	addi	a3,a3,1
	addi	a5,a5,1
	bne	a2,zero,.L78
.L55:
	addi	s7,s7,257
	bne	s7,t4,.L57
	addi	s8,s8,257
	bne	s8,s2,.L58
.L79:
	addi	s3,s3,-1
	bne	s3,zero,.L59
	lw	s0,44(sp)
	lui	a5,%hi(heap+8996)
	li	a4,8192
	addi	a5,a5,%lo(heap+8996)
	lui	a6,%hi(heap_ptr)
	lui	a2,%hi(heap_end)
	addi	a4,a4,804
	lui	a3,%hi(heap_requested)
	addi	a0,s9,-5
	sw	a1,%lo(seed)(s4)
	sw	a5,%lo(heap_ptr)(a6)
	sw	a5,%lo(heap_end)(a2)
	sw	a4,%lo(heap_requested)(a3)
	lw	s1,40(sp)
	lw	s2,36(sp)
	lw	s3,32(sp)
	lw	s4,28(sp)
	lw	s5,24(sp)
	lw	s6,20(sp)
	lw	s7,16(sp)
	lw	s8,12(sp)
	lw	s9,8(sp)
	lw	s10,4(sp)
	lw	s11,0(sp)
	seqz	a0,a0
	addi	sp,sp,48
	jr	ra
.L52:
	lbu	a5,0(a5)
	bne	a5,zero,.L55
	addi	s8,s8,257
	addi	s9,s9,1
	bne	s8,s2,.L58
	j	.L79
.L61:
	li	a4,1
	li	a3,256
	j	.L45
.L60:
	li	a4,0
	li	a3,257
	j	.L45
.L62:
	li	a4,2
	li	a3,255
	j	.L45
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
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
	beq	a0,zero,.L88
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a1,%lo(heap_requested)(a3)
	add	a4,a0,a5
	andi	a6,a4,3
	add	a5,a5,a1
	bne	a6,zero,.L92
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a1,a4,.L88
.L93:
	sw	a4,%lo(heap_ptr)(a2)
	ret
.L92:
	li	a1,4
	sub	a1,a1,a6
	add	a5,a5,a1
	add	a4,a4,a1
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a1,a4,.L93
.L88:
	li	a0,0
	ret
	.size	malloc_beebs, .-malloc_beebs
	.align	2
	.globl	calloc_beebs
	.type	calloc_beebs, @function
calloc_beebs:
	mul	a1,a0,a1
	beq	a1,zero,.L95
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a0,a1
	andi	a6,a4,3
	add	a5,a1,a5
	bne	a6,zero,.L120
.L96:
	lui	a6,%hi(heap_end)
	lw	a6,%lo(heap_end)(a6)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a6,a4,.L95
	sw	a4,%lo(heap_ptr)(a2)
	beq	a0,zero,.L95
	addi	a5,a1,-1
	li	a4,5
	bleu	a5,a4,.L104
	neg	a4,a0
	andi	a5,a4,3
	li	a3,0
	beq	a5,zero,.L98
	sb	zero,0(a0)
	andi	a4,a4,2
	li	a3,1
	beq	a4,zero,.L98
	sb	zero,1(a0)
	li	a4,3
	li	a3,2
	bne	a5,a4,.L98
	sb	zero,2(a0)
	mv	a3,a5
.L98:
	sub	a6,a1,a5
	andi	a2,a6,-4
	add	a5,a0,a5
	add	a4,a5,a2
.L100:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L100
	add	a5,a3,a2
	beq	a6,a2,.L94
.L97:
	add	a4,a0,a5
	sb	zero,0(a4)
	addi	a4,a5,1
	bleu	a1,a4,.L94
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,2
	bleu	a1,a4,.L94
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,3
	bleu	a1,a4,.L94
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,4
	bleu	a1,a4,.L94
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a5,a5,5
	bleu	a1,a5,.L94
	add	a5,a0,a5
	sb	zero,0(a5)
	ret
.L95:
	li	a0,0
.L94:
	ret
.L120:
	li	a7,4
	sub	a6,a7,a6
	add	a4,a4,a6
	add	a5,a5,a6
	j	.L96
.L104:
	li	a5,0
	j	.L97
	.size	calloc_beebs, .-calloc_beebs
	.align	2
	.globl	realloc_beebs
	.type	realloc_beebs, @function
realloc_beebs:
	beq	a0,zero,.L122
	beq	a1,zero,.L122
	lui	a6,%hi(heap_ptr)
	lw	a2,%lo(heap_ptr)(a6)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a2,a1
	andi	a7,a4,3
	add	a5,a1,a5
	bne	a7,zero,.L147
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a7,a4,.L122
.L148:
	sw	a4,%lo(heap_ptr)(a6)
	beq	a2,zero,.L122
	addi	a5,a1,-1
	li	a4,6
	bleu	a5,a4,.L132
	or	a3,a0,a2
	andi	a3,a3,3
	mv	a4,a2
	mv	a5,a0
	bne	a3,zero,.L132
	addi	a3,a2,-1
	sub	a3,a3,a0
	sltiu	a3,a3,3
	bne	a3,zero,.L132
	andi	a7,a1,-4
	add	a6,a0,a7
.L125:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L125
	beq	a1,a7,.L121
	lbu	a3,0(a6)
	add	a4,a2,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bleu	a1,a5,.L121
	add	a4,a0,a5
	lbu	a4,0(a4)
	add	a5,a2,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bleu	a1,a7,.L121
	add	a0,a0,a7
	lbu	a5,0(a0)
	add	a7,a2,a7
	sb	a5,0(a7)
.L121:
	mv	a0,a2
	ret
.L147:
	li	t1,4
	sub	a7,t1,a7
	add	a5,a5,a7
	add	a4,a4,a7
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a7,a4,.L148
.L122:
	li	a2,0
	mv	a0,a2
	ret
.L132:
	li	a5,0
.L129:
	add	a4,a0,a5
	lbu	a3,0(a4)
	add	a4,a2,a5
	addi	a5,a5,1
	sb	a3,0(a4)
	bgtu	a1,a5,.L129
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
	.globl	memset
	.type	memset, @function
memset:
	beq	a2,zero,.L163
	addi	a5,a2,-1
	li	a4,5
	andi	a1,a1,0xff
	bleu	a5,a4,.L159
	neg	a4,a0
	andi	a5,a4,3
	li	a6,0
	beq	a5,zero,.L153
	sb	a1,0(a0)
	andi	a4,a4,2
	li	a6,1
	beq	a4,zero,.L153
	sb	a1,1(a0)
	li	a4,3
	li	a6,2
	bne	a5,a4,.L153
	sb	a1,2(a0)
	mv	a6,a5
.L153:
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
.L155:
	sw	a4,0(a5)
	addi	a5,a5,4
	bne	a5,a3,.L155
	add	a5,a6,a7
	beq	t1,a7,.L163
.L152:
	add	a4,a0,a5
	sb	a1,0(a4)
	addi	a4,a5,1
	bleu	a2,a4,.L163
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,2
	bleu	a2,a4,.L163
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,3
	bleu	a2,a4,.L163
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,4
	bleu	a2,a4,.L163
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a5,a5,5
	bleu	a2,a5,.L163
	add	a5,a0,a5
	sb	a1,0(a5)
.L163:
	ret
.L159:
	li	a5,0
	j	.L152
	.size	memset, .-memset
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	beq	a2,zero,.L168
	addi	a5,a2,-1
	li	a4,6
	bleu	a5,a4,.L169
	or	a3,a0,a1
	andi	a3,a3,3
	mv	a4,a0
	mv	a5,a1
	bne	a3,zero,.L169
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L169
	andi	a7,a2,-4
	add	a6,a1,a7
.L170:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L170
	beq	a2,a7,.L168
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bleu	a2,a5,.L168
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bleu	a2,a7,.L168
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	ret
.L169:
	add	a2,a1,a2
	mv	a5,a0
.L172:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L172
.L168:
	ret
	.size	memcpy, .-memcpy
	.align	2
	.globl	memcmp
	.type	memcmp, @function
memcmp:
	beq	a2,zero,.L189
	add	a2,a0,a2
	j	.L188
.L187:
	beq	a0,a2,.L189
.L188:
	lbu	a5,0(a0)
	lbu	a4,0(a1)
	addi	a0,a0,1
	addi	a1,a1,1
	beq	a5,a4,.L187
	sub	a0,a5,a4
	ret
.L189:
	li	a0,0
	ret
	.size	memcmp, .-memcmp
	.align	2
	.globl	memmove
	.type	memmove, @function
memmove:
	bgeu	a0,a1,.L192
	beq	a2,zero,.L193
	addi	a5,a2,-1
	li	a4,6
	bleu	a5,a4,.L194
	or	a3,a1,a0
	andi	a3,a3,3
	mv	a4,a0
	mv	a5,a1
	bne	a3,zero,.L194
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L194
	andi	a7,a2,-4
	add	a6,a1,a7
.L195:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L195
	beq	a2,a7,.L193
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bleu	a2,a5,.L193
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bleu	a2,a7,.L193
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	ret
.L192:
	bgtu	a0,a1,.L215
.L193:
	ret
.L215:
	beq	a2,zero,.L193
	addi	a2,a2,-1
	add	a5,a1,a2
	lbu	a4,0(a5)
	add	a5,a0,a2
	sb	a4,0(a5)
	j	.L215
.L194:
	add	a2,a1,a2
	mv	a5,a0
.L197:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L197
	ret
	.size	memmove, .-memmove
	.align	2
	.globl	strlen
	.type	strlen, @function
strlen:
	lbu	a5,0(a0)
	beq	a5,zero,.L216
	li	a5,0
.L218:
	addi	a5,a5,1
	add	a4,a0,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L218
.L216:
	mv	a0,a5
	ret
	.size	strlen, .-strlen
	.align	2
	.globl	strchr
	.type	strchr, @function
strchr:
	lbu	a5,0(a0)
	beq	a5,zero,.L222
	andi	a4,a1,0xff
.L224:
	beq	a4,a5,.L221
	lbu	a5,1(a0)
	addi	a0,a0,1
	bne	a5,zero,.L224
.L222:
	seqz	a1,a1
	neg	a1,a1
	and	a0,a0,a1
.L221:
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
	call	benchmark_body.isra.0
	call	start_trigger
	call	benchmark
	sw	a0,12(sp)
	call	stop_trigger
	lw	a0,12(sp)
	lw	ra,28(sp)
	addi	a0,a0,-1
	snez	a0,a0
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.text
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	addi	a0,a0,-1
	seqz	a0,a0
	ret
	.size	verify_benchmark, .-verify_benchmark
	.bss
	.align	2
	.type	heap, @object
	.size	heap, 8996
heap:
	.zero	8996
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
	.type	seed, @object
	.size	seed, 4
seed:
	.zero	4
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
