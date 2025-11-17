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
	bge	zero,a0,.L39
	addi	sp,sp,-64
	sw	s8,28(sp)
	lui	s8,%hi(seed)
	lw	a5,%lo(seed)(s8)
	sw	s2,52(sp)
	sw	s7,32(sp)
	lui	s2,%hi(heap)
	lui	t2,%hi(heap+8995)
	lui	s7,%hi(heap+5654)
	lui	a7,524288
	lui	t3,269413
	lui	t1,3
	lui	a6,322639
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
	addi	a1,zero,0
	lui	s9,%hi(heap+5)
	lui	s10,%hi(heap+4369)
	addi	s3,zero,257
	addi	s5,zero,1
	addi	s4,zero,3
	addi	s6,zero,2
	addi	s1,zero,48
	addi	t4,zero,26
.L17:
	addi	a3,s9,%lo(heap+5)
	addi	a2,s2,0
	addi	s0,zero,0
	sw	a1,12(sp)
	addi	s11,a0,0
.L8:
	sub	a1,zero,a2
	addi	op_0,x0,3
	and	a4,a1,op_0
	beq	a4,zero,.L18
	sb	zero,0(a2)
	addi	op_0,x0,2
	and	a1,op_0,a1
	beq	a1,zero,.L19
	sb	zero,1(a2)
	beq	a4,s4,.+8
	jal	x0,.L20
	sb	zero,2(a2)
	addi	t5,s4,0
	addi	t0,zero,254
.L3:
	sub	a0,s3,a4
	sub	op_0,x0,a4
	sub	a4,s0,op_0
	sub	op_0,x0,s2
	sub	a4,a4,op_0
	addi	op_0,x0,-4
	and	t6,op_0,a0
	sub	op_0,x0,t6
	sub	a1,a4,op_0
.L5:
	sw	zero,0(a4)
	addi	a4,a4,4
	beq	a1,a4,.+8
	jal	x0,.L5
	beq	t6,a0,.L6
	sub	op_0,x0,t6
	sub	t5,t5,op_0
	sub	op_0,x0,a2
	sub	t5,t5,op_0
	sb	zero,0(t5)
	sub	t0,t0,t6
	beq	t0,s5,.L6
	sb	zero,1(t5)
	beq	t0,s6,.L6
	sb	zero,2(t5)
.L6:
	sb	s1,156(a2)
	addi	a0,a2,0
.L7:
	callmul	a5,a5,t3
	addi	a0,a0,1
	sub	op_0,x0,a5
	sub	a5,t1,op_0
	and	a5,a5,a7
	addi	op_0,x0,16
	sra	a4,a5,op_0
	lui	op_6,16
	addi	op_5,op_6,-1
	and	op_4,a4,op_5
	lui	op_9,16
	addi	op_8,op_9,-1
	and	op_7,a6,op_8
	callmul	op_3,op_4,op_7
	addi	op_10,x0,16
	srl	op_2,op_3,op_10
	addi	op_17,x0,16
	srl	op_16,a4,op_17
	lui	op_19,16
	addi	op_18,op_19,-1
	and	op_15,op_16,op_18
	lui	op_22,16
	addi	op_21,op_22,-1
	and	op_20,a6,op_21
	callmul	op_14,op_15,op_20
	lui	op_24,16
	addi	op_23,op_24,-1
	and	op_13,op_14,op_23
	lui	op_30,16
	addi	op_29,op_30,-1
	and	op_28,a4,op_29
	addi	op_33,x0,16
	srl	op_32,a6,op_33
	lui	op_35,16
	addi	op_34,op_35,-1
	and	op_31,op_32,op_34
	callmul	op_27,op_28,op_31
	lui	op_37,16
	addi	op_36,op_37,-1
	and	op_26,op_27,op_36
	sub	op_25,x0,op_26
	sub	op_12,op_13,op_25
	sub	op_11,x0,op_12
	sub	op_1,op_2,op_11
	addi	op_38,x0,16
	srl	op_0,op_1,op_38
	addi	op_45,x0,16
	srl	op_44,a4,op_45
	lui	op_47,16
	addi	op_46,op_47,-1
	and	op_43,op_44,op_46
	lui	op_50,16
	addi	op_49,op_50,-1
	and	op_48,a6,op_49
	callmul	op_42,op_43,op_48
	addi	op_51,x0,16
	srl	op_41,op_42,op_51
	lui	op_58,16
	addi	op_57,op_58,-1
	and	op_56,a4,op_57
	addi	op_61,x0,16
	srl	op_60,a6,op_61
	lui	op_63,16
	addi	op_62,op_63,-1
	and	op_59,op_60,op_62
	callmul	op_55,op_56,op_59
	addi	op_64,x0,16
	srl	op_54,op_55,op_64
	addi	op_69,x0,16
	srl	op_68,a4,op_69
	lui	op_71,16
	addi	op_70,op_71,-1
	and	op_67,op_68,op_70
	addi	op_74,x0,16
	srl	op_73,a6,op_74
	lui	op_76,16
	addi	op_75,op_76,-1
	and	op_72,op_73,op_75
	callmul	op_66,op_67,op_72
	sub	op_65,x0,op_66
	sub	op_53,op_54,op_65
	sub	op_52,x0,op_53
	sub	op_40,op_41,op_52
	sub	op_39,x0,op_40
	sub	a1,op_0,op_39
	addi	op_0,x0,3
	srl	a1,a1,op_0
	callmul	a1,a1,t4
	sub	a4,a4,a1
	addi	a4,a4,65
	sb	a4,-1(a0)
	beq	a3,a0,.+8
	jal	x0,.L7
	sb	s1,124(a2)
	addi	a2,a2,257
	addi	a3,a3,258
	addi	s0,s0,257
	beq	a2,t2,.+8
	jal	x0,.L8
	lw	a1,12(sp)
	addi	a0,s11,0
	addi	t0,s10,%lo(heap+4369)
.L16:
	addi	t6,s2,0
.L15:
	lbu	a3,0(t6)
	addi	a2,t6,0
	addi	a4,t0,0
	beq	a3,zero,.+8
	jal	x0,.L9
	jal	x0,.L10
.L43:
	beq	a3,t5,.+8
	jal	x0,.L13
	lbu	a3,0(a2)
	beq	a3,zero,.L10
.L9:
	lbu	t5,0(a4)
	addi	a2,a2,1
	addi	a4,a4,1
	beq	t5,zero,.+8
	jal	x0,.L43
.L13:
	addi	t6,t6,257
	beq	t6,t2,.+8
	jal	x0,.L15
.L14:
	addi	t0,t0,257
	beq	t0,s7,.+8
	jal	x0,.L16
	addi	a1,a1,1
	beq	a1,a0,.+8
	jal	x0,.L17
	lw	s0,60(sp)
	lui	a4,%hi(heap+8996)
	lui	a3,2
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
	jalr	zero,ra,0
.L10:
	lbu	a4,0(a4)
	beq	a4,zero,.L14
	addi	t6,t6,257
	beq	t6,t2,.+8
	jal	x0,.L15
	jal	x0,.L14
.L19:
	addi	t5,zero,1
	addi	t0,zero,256
	jal	x0,.L3
.L18:
	addi	t5,zero,0
	addi	t0,zero,257
	jal	x0,.L3
.L20:
	addi	t5,zero,2
	addi	t0,zero,255
	jal	x0,.L3
.L39:
	jalr	zero,ra,0
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
	lui	a6,524288
	lui	t1,269413
	lui	a7,3
	lui	a0,322639
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
	addi	s3,zero,47
	lui	s6,%hi(heap+5)
	lui	s5,%hi(heap+4369)
	addi	t0,zero,257
	addi	s0,zero,1
	addi	t2,zero,3
	addi	s1,zero,2
	addi	t5,zero,48
	addi	t3,zero,26
.L59:
	addi	a2,s6,%lo(heap+5)
	addi	s7,t6,0
	addi	s8,zero,0
.L50:
	sub	a4,zero,s7
	addi	op_0,x0,3
	and	a5,op_0,a4
	beq	a5,zero,.L60
	sb	zero,0(s7)
	addi	op_0,x0,2
	and	a4,op_0,a4
	beq	a4,zero,.L61
	sb	zero,1(s7)
	beq	a5,t2,.+8
	jal	x0,.L62
	sb	zero,2(s7)
	addi	a4,t2,0
	addi	a3,zero,254
.L45:
	sub	s9,t0,a5
	sub	op_0,x0,a5
	sub	a5,s8,op_0
	sub	op_0,x0,t6
	sub	a5,a5,op_0
	addi	op_0,x0,-4
	and	s11,op_0,s9
	sub	op_0,x0,s11
	sub	s10,a5,op_0
.L47:
	sw	zero,0(a5)
	addi	a5,a5,4
	beq	s10,a5,.+8
	jal	x0,.L47
	beq	s11,s9,.L48
	sub	op_0,x0,s11
	sub	a4,a4,op_0
	sub	op_0,x0,s7
	sub	a4,a4,op_0
	sb	zero,0(a4)
	sub	a3,a3,s11
	beq	a3,s0,.L48
	sb	zero,1(a4)
	beq	a3,s1,.L48
	sb	zero,2(a4)
.L48:
	sb	t5,156(s7)
	addi	a3,s7,0
.L49:
	callmul	a1,a1,t1
	addi	a3,a3,1
	sub	op_0,x0,a1
	sub	a1,a7,op_0
	and	a1,a1,a6
	addi	op_0,x0,16
	sra	a5,a1,op_0
	lui	op_6,16
	addi	op_5,op_6,-1
	and	op_4,a5,op_5
	lui	op_9,16
	addi	op_8,op_9,-1
	and	op_7,a0,op_8
	callmul	op_3,op_4,op_7
	addi	op_10,x0,16
	srl	op_2,op_3,op_10
	addi	op_17,x0,16
	srl	op_16,a5,op_17
	lui	op_19,16
	addi	op_18,op_19,-1
	and	op_15,op_16,op_18
	lui	op_22,16
	addi	op_21,op_22,-1
	and	op_20,a0,op_21
	callmul	op_14,op_15,op_20
	lui	op_24,16
	addi	op_23,op_24,-1
	and	op_13,op_14,op_23
	lui	op_30,16
	addi	op_29,op_30,-1
	and	op_28,a5,op_29
	addi	op_33,x0,16
	srl	op_32,a0,op_33
	lui	op_35,16
	addi	op_34,op_35,-1
	and	op_31,op_32,op_34
	callmul	op_27,op_28,op_31
	lui	op_37,16
	addi	op_36,op_37,-1
	and	op_26,op_27,op_36
	sub	op_25,x0,op_26
	sub	op_12,op_13,op_25
	sub	op_11,x0,op_12
	sub	op_1,op_2,op_11
	addi	op_38,x0,16
	srl	op_0,op_1,op_38
	addi	op_45,x0,16
	srl	op_44,a5,op_45
	lui	op_47,16
	addi	op_46,op_47,-1
	and	op_43,op_44,op_46
	lui	op_50,16
	addi	op_49,op_50,-1
	and	op_48,a0,op_49
	callmul	op_42,op_43,op_48
	addi	op_51,x0,16
	srl	op_41,op_42,op_51
	lui	op_58,16
	addi	op_57,op_58,-1
	and	op_56,a5,op_57
	addi	op_61,x0,16
	srl	op_60,a0,op_61
	lui	op_63,16
	addi	op_62,op_63,-1
	and	op_59,op_60,op_62
	callmul	op_55,op_56,op_59
	addi	op_64,x0,16
	srl	op_54,op_55,op_64
	addi	op_69,x0,16
	srl	op_68,a5,op_69
	lui	op_71,16
	addi	op_70,op_71,-1
	and	op_67,op_68,op_70
	addi	op_74,x0,16
	srl	op_73,a0,op_74
	lui	op_76,16
	addi	op_75,op_76,-1
	and	op_72,op_73,op_75
	callmul	op_66,op_67,op_72
	sub	op_65,x0,op_66
	sub	op_53,op_54,op_65
	sub	op_52,x0,op_53
	sub	op_40,op_41,op_52
	sub	op_39,x0,op_40
	sub	a4,op_0,op_39
	addi	op_0,x0,3
	srl	a4,a4,op_0
	callmul	a4,a4,t3
	sub	a5,a5,a4
	addi	a5,a5,65
	sb	a5,-1(a3)
	beq	a2,a3,.+8
	jal	x0,.L49
	sb	t5,124(s7)
	addi	s7,s7,257
	addi	a2,a2,258
	addi	s8,s8,257
	beq	s7,t4,.+8
	jal	x0,.L50
	addi	s8,s5,%lo(heap+4369)
	addi	s9,zero,0
.L58:
	addi	s7,t6,0
.L57:
	lbu	a4,0(s7)
	addi	a3,s7,0
	addi	a5,s8,0
	beq	a4,zero,.+8
	jal	x0,.L51
	jal	x0,.L52
.L78:
	beq	a2,a4,.+8
	jal	x0,.L55
	lbu	a4,0(a3)
	beq	a4,zero,.L52
.L51:
	lbu	a2,0(a5)
	addi	a3,a3,1
	addi	a5,a5,1
	beq	a2,zero,.+8
	jal	x0,.L78
.L55:
	addi	s7,s7,257
	beq	s7,t4,.+8
	jal	x0,.L57
	addi	s8,s8,257
	beq	s8,s2,.+8
	jal	x0,.L58
.L79:
	addi	s3,s3,-1
	beq	s3,zero,.+8
	jal	x0,.L59
	lw	s0,44(sp)
	lui	a5,%hi(heap+8996)
	lui	a4,2
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
	addi	op_0,x0,1
	sltu	a0,a0,op_0
	addi	sp,sp,48
	jalr	zero,ra,0
.L52:
	lbu	a5,0(a5)
	beq	a5,zero,.+8
	jal	x0,.L55
	addi	s8,s8,257
	addi	s9,s9,1
	beq	s8,s2,.+8
	jal	x0,.L58
	jal	x0,.L79
.L61:
	addi	a4,zero,1
	addi	a3,zero,256
	jal	x0,.L45
.L60:
	addi	a4,zero,0
	addi	a3,zero,257
	jal	x0,.L45
.L62:
	addi	a4,zero,2
	addi	a3,zero,255
	jal	x0,.L45
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
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
.Lpcrel_1:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
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
.Lpcrel_2:
	auipc	ra,%pcrel_hi(benchmark_body.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_2)
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
.Lpcrel_3:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_3)
.Lpcrel_4:
	auipc	ra,%pcrel_hi(benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_4)
	sw	a0,12(sp)
	lw	a0,12(sp)
	lw	ra,28(sp)
	addi	a0,a0,-1
	sltu	a0,zero,a0
	addi	sp,sp,32
	jalr	zero,ra,0
	.size	main, .-main
	.text
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	addi	a0,a0,-1
	addi	op_0,x0,1
	sltu	a0,a0,op_0
	jalr	zero,ra,0
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
