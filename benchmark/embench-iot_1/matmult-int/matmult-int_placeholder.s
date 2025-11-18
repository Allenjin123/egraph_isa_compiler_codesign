	.file	"matmult-int.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	blt	zero,a0,.+8
	jal	x0,.L19
	lui	t6,%hi(.LANCHOR1+704)
	addi	sp,sp,-16
	addi	t6,t6,%lo(.LANCHOR1+704)
	lui	t4,%hi(.LANCHOR0+1600)
	lui	t3,%hi(.LANCHOR0+1680)
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	s2,4(sp)
	addi	t2,t6,1600
	addi	t4,t4,%lo(.LANCHOR0+1600)
	addi	t3,t3,%lo(.LANCHOR0+1680)
	addi	t0,zero,0
	lui	s2,%hi(.LANCHOR0)
	lui	s1,%hi(.LANCHOR1-896)
	lui	s0,%hi(.LANCHOR2-1792)
.L2:
	addi	t1,t6,0
	addi	a4,s0,%lo(.LANCHOR2-1792)
	addi	a5,t6,0
.L4:
	lw	a3,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a5)
	bne	a5,t2,.L4
	addi	a4,t4,0
	addi	a5,s2,%lo(.LANCHOR0)
.L5:
	lw	a3,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a5)
	bne	a5,t4,.L5
	addi	t5,s1,%lo(.LANCHOR1-896)
.L6:
	addi	a1,t4,0
	addi	a7,t5,0
.L8:
	sw	zero,0(a7)
	addi	a5,a1,-1600
	addi	a3,t1,0
	addi	a2,zero,0
.L7:
	lw	a4,0(a3)
	lw	a6,0(a5)
	addi	a5,a5,80
	addi	a3,a3,4
	callmul	a4,a4,a6
	sub	op_0,x0,a2
	sub	a2,a4,op_0
	bne	a5,a1,.L7
	sw	a2,0(a7)
	addi	a1,a5,4
	addi	a7,a7,4
	bne	t3,a1,.L8
	addi	t1,t1,80
	addi	t5,t5,80
	bne	t1,t2,.L6
	addi	t0,t0,1
	bne	t0,a0,.L2
	lw	s0,12(sp)
	lw	s1,8(sp)
	lw	s2,4(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
.L19:
	jalr	zero,ra,0
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.type	benchmark_body.constprop.0.isra.0, @function
benchmark_body.constprop.0.isra.0:
	lui	t5,%hi(.LANCHOR1+704)
	addi	sp,sp,-16
	addi	t5,t5,%lo(.LANCHOR1+704)
	lui	t3,%hi(.LANCHOR0+1600)
	lui	t1,%hi(.LANCHOR0+1680)
	sw	s0,12(sp)
	sw	s1,8(sp)
	addi	t0,t5,1600
	addi	t3,t3,%lo(.LANCHOR0+1600)
	addi	t1,t1,%lo(.LANCHOR0+1680)
	addi	t6,zero,46
	lui	s1,%hi(.LANCHOR0)
	lui	s0,%hi(.LANCHOR1-896)
	lui	t2,%hi(.LANCHOR2-1792)
.L21:
	addi	a7,t5,0
	addi	a4,t2,%lo(.LANCHOR2-1792)
	addi	a5,t5,0
.L22:
	lw	a3,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a5)
	bne	a5,t0,.L22
	addi	a4,t3,0
	addi	a5,s1,%lo(.LANCHOR0)
.L23:
	lw	a3,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a5)
	bne	a5,t3,.+8
	jal	x0,.+8
	jal	x0,.L23
	addi	t4,s0,%lo(.LANCHOR1-896)
.L24:
	addi	a1,t3,0
	addi	a6,t4,0
.L26:
	sw	zero,0(a6)
	addi	a5,a1,-1600
	addi	a3,a7,0
	addi	a2,zero,0
.L25:
	lw	a4,0(a3)
	lw	a0,0(a5)
	addi	a5,a5,80
	addi	a3,a3,4
	callmul	a4,a4,a0
	sub	op_0,x0,a2
	sub	a2,a4,op_0
	bne	a5,a1,.L25
	sw	a2,0(a6)
	addi	a1,a5,4
	addi	a6,a6,4
	bne	t1,a1,.L26
	addi	a7,a7,80
	addi	t4,t4,80
	bne	a7,t0,.L24
	addi	t6,t6,-1
	bne	t6,zero,.L21
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
	.size	benchmark_body.constprop.0.isra.0, .-benchmark_body.constprop.0.isra.0
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
	.globl	values_match
	.type	values_match, @function
values_match:
	sub	a0,a0,a1
	addi	op_0,x0,1
	bgeu	a0,op_0,.+8
	jal	x0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
	.size	values_match, .-values_match
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
	auipc	ra,%pcrel_hi(benchmark_body.constprop.0.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_2)
	lw	ra,12(sp)
	addi	a0,zero,0
	addi	sp,sp,16
	jalr	zero,ra,0
	.size	benchmark, .-benchmark
	.align	2
	.globl	InitSeed
	.type	InitSeed, @function
InitSeed:
	lui	a5,%hi(Seed)
	sw	zero,%lo(Seed)(a5)
	jalr	zero,ra,0
	.size	InitSeed, .-InitSeed
	.align	2
	.globl	Test
	.type	Test, @function
Test:
	addi	t1,a0,0
	addi	t3,a2,0
	addi	t4,a0,1600
	addi	t5,a1,1680
.L44:
	addi	a7,a1,1600
	addi	a6,t3,0
.L46:
	sw	zero,0(a6)
	addi	a5,a7,-1600
	addi	a2,t1,0
	addi	a3,zero,0
.L45:
	lw	a4,0(a2)
	lw	a0,0(a5)
	addi	a5,a5,80
	addi	a2,a2,4
	callmul	a4,a4,a0
	sub	op_0,x0,a3
	sub	a3,a4,op_0
	sw	a3,0(a6)
	bne	a5,a7,.+8
	jal	x0,.+8
	jal	x0,.L45
	addi	a7,a5,4
	addi	a6,a6,4
	bne	t5,a7,.L46
	addi	t1,t1,80
	addi	t3,t3,80
	bne	t1,t4,.L44
	jalr	zero,ra,0
	.size	Test, .-Test
	.align	2
	.globl	RandomInteger
	.type	RandomInteger, @function
RandomInteger:
	lui	a3,%hi(Seed)
	lw	a4,%lo(Seed)(a3)
	lui	a0,66321
	addi	a0,a0,1223
	addi	op_0,x0,5
	sll	a5,a4,op_0
	sub	op_0,x0,a5
	sub	a5,a4,op_0
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	op_0,x0,a5
	sub	a5,a4,op_0
	addi	a5,a5,81
	lui	op_5,16
	addi	op_4,op_5,-1
	and	op_3,a5,op_4
	addi	op_7,x0,16
	sra	op_6,a0,op_7
	callmul	op_2,op_3,op_6
	lui	op_15,16
	addi	op_14,op_15,-1
	and	op_13,a5,op_14
	lui	op_18,16
	addi	op_17,op_18,-1
	and	op_16,a0,op_17
	callmul	op_12,op_13,op_16
	addi	op_19,x0,16
	srl	op_11,op_12,op_19
	addi	op_23,x0,16
	sra	op_22,a5,op_23
	lui	op_26,16
	addi	op_25,op_26,-1
	and	op_24,a0,op_25
	callmul	op_21,op_22,op_24
	sub	op_20,x0,op_21
	sub	op_10,op_11,op_20
	lui	op_28,16
	addi	op_27,op_28,-1
	and	op_9,op_10,op_27
	sub	op_8,x0,op_9
	sub	op_1,op_2,op_8
	addi	op_29,x0,16
	sra	op_0,op_1,op_29
	lui	op_38,16
	addi	op_37,op_38,-1
	and	op_36,a5,op_37
	lui	op_41,16
	addi	op_40,op_41,-1
	and	op_39,a0,op_40
	callmul	op_35,op_36,op_39
	addi	op_42,x0,16
	srl	op_34,op_35,op_42
	addi	op_46,x0,16
	sra	op_45,a5,op_46
	lui	op_49,16
	addi	op_48,op_49,-1
	and	op_47,a0,op_48
	callmul	op_44,op_45,op_47
	sub	op_43,x0,op_44
	sub	op_33,op_34,op_43
	addi	op_50,x0,16
	sra	op_32,op_33,op_50
	addi	op_54,x0,16
	sra	op_53,a5,op_54
	addi	op_56,x0,16
	sra	op_55,a0,op_56
	callmul	op_52,op_53,op_55
	sub	op_51,x0,op_52
	sub	op_31,op_32,op_51
	sub	op_30,x0,op_31
	sub	a0,op_0,op_30
	addi	op_0,x0,31
	sra	a2,a5,op_0
	lui	a4,2
	addi	a4,a4,-97
	addi	op_0,x0,9
	sra	a0,a0,op_0
	sub	a0,a0,a2
	callmul	a0,a0,a4
	sub	a0,a5,a0
	sw	a0,%lo(Seed)(a3)
	jalr	zero,ra,0
	.size	RandomInteger, .-RandomInteger
	.align	2
	.globl	Multiply
	.type	Multiply, @function
Multiply:
	addi	t5,a1,1680
	addi	t6,zero,0
	addi	t0,zero,1600
.L52:
	sub	op_0,x0,a2
	sub	t3,t6,op_0
	addi	t1,a1,1600
	sub	op_0,x0,a0
	sub	t4,t6,op_0
.L54:
	sw	zero,0(t3)
	addi	a6,t4,0
	addi	a5,t1,-1600
	addi	a3,zero,0
.L53:
	lw	a4,0(a6)
	lw	a7,0(a5)
	addi	a5,a5,80
	addi	a6,a6,4
	callmul	a4,a4,a7
	sub	op_0,x0,a3
	sub	a3,a4,op_0
	sw	a3,0(t3)
	bne	a5,t1,.L53
	addi	t1,a5,4
	addi	t3,t3,4
	bne	t5,t1,.L54
	addi	t6,t6,80
	bne	t6,t0,.L52
	jalr	zero,ra,0
	.size	Multiply, .-Multiply
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	lui	a7,%hi(.LANCHOR2)
	addi	a7,a7,%lo(.LANCHOR2)
	lui	a6,66321
	lui	a0,2
	addi	a1,a7,-1712
	addi	a6,a6,1223
	addi	a7,a7,-112
	addi	a0,a0,-97
	addi	a5,zero,0
.L59:
	addi	a3,a1,-80
.L60:
	addi	op_0,x0,5
	sll	a4,a5,op_0
	sub	op_0,x0,a4
	sub	a4,a5,op_0
	addi	op_0,x0,2
	sll	a4,a4,op_0
	sub	op_0,x0,a4
	sub	a4,a5,op_0
	addi	a4,a4,81
	lui	op_5,16
	addi	op_4,op_5,-1
	and	op_3,a4,op_4
	addi	op_7,x0,16
	sra	op_6,a6,op_7
	callmul	op_2,op_3,op_6
	lui	op_15,16
	addi	op_14,op_15,-1
	and	op_13,a4,op_14
	lui	op_18,16
	addi	op_17,op_18,-1
	and	op_16,a6,op_17
	callmul	op_12,op_13,op_16
	addi	op_19,x0,16
	srl	op_11,op_12,op_19
	addi	op_23,x0,16
	sra	op_22,a4,op_23
	lui	op_26,16
	addi	op_25,op_26,-1
	and	op_24,a6,op_25
	callmul	op_21,op_22,op_24
	sub	op_20,x0,op_21
	sub	op_10,op_11,op_20
	lui	op_28,16
	addi	op_27,op_28,-1
	and	op_9,op_10,op_27
	sub	op_8,x0,op_9
	sub	op_1,op_2,op_8
	addi	op_29,x0,16
	sra	op_0,op_1,op_29
	lui	op_38,16
	addi	op_37,op_38,-1
	and	op_36,a4,op_37
	lui	op_41,16
	addi	op_40,op_41,-1
	and	op_39,a6,op_40
	callmul	op_35,op_36,op_39
	addi	op_42,x0,16
	srl	op_34,op_35,op_42
	addi	op_46,x0,16
	sra	op_45,a4,op_46
	lui	op_49,16
	addi	op_48,op_49,-1
	and	op_47,a6,op_48
	callmul	op_44,op_45,op_47
	sub	op_43,x0,op_44
	sub	op_33,op_34,op_43
	addi	op_50,x0,16
	sra	op_32,op_33,op_50
	addi	op_54,x0,16
	sra	op_53,a4,op_54
	addi	op_56,x0,16
	sra	op_55,a6,op_56
	callmul	op_52,op_53,op_55
	sub	op_51,x0,op_52
	sub	op_31,op_32,op_51
	sub	op_30,x0,op_31
	sub	a5,op_0,op_30
	addi	op_0,x0,31
	sra	a2,a4,op_0
	addi	a3,a3,4
	addi	op_0,x0,9
	sra	a5,a5,op_0
	sub	a5,a5,a2
	callmul	a5,a5,a0
	sub	a5,a4,a5
	sw	a5,-4(a3)
	bne	a1,a3,.L60
	addi	a1,a1,80
	bne	a1,a7,.L59
	lui	a1,%hi(.LANCHOR0)
	addi	a1,a1,%lo(.LANCHOR0)
	addi	a7,a1,2047
	lui	a6,66321
	lui	a0,2
	addi	a7,a7,1233
	addi	a1,a1,1680
	addi	a6,a6,1223
	addi	a0,a0,-97
.L61:
	addi	a3,a1,-80
.L62:
	addi	op_0,x0,5
	sll	a4,a5,op_0
	sub	op_0,x0,a4
	sub	a4,a5,op_0
	addi	op_0,x0,2
	sll	a4,a4,op_0
	sub	op_0,x0,a4
	sub	a4,a5,op_0
	addi	a4,a4,81
	lui	op_5,16
	addi	op_4,op_5,-1
	and	op_3,a4,op_4
	addi	op_7,x0,16
	sra	op_6,a6,op_7
	callmul	op_2,op_3,op_6
	lui	op_15,16
	addi	op_14,op_15,-1
	and	op_13,a4,op_14
	lui	op_18,16
	addi	op_17,op_18,-1
	and	op_16,a6,op_17
	callmul	op_12,op_13,op_16
	addi	op_19,x0,16
	srl	op_11,op_12,op_19
	addi	op_23,x0,16
	sra	op_22,a4,op_23
	lui	op_26,16
	addi	op_25,op_26,-1
	and	op_24,a6,op_25
	callmul	op_21,op_22,op_24
	sub	op_20,x0,op_21
	sub	op_10,op_11,op_20
	lui	op_28,16
	addi	op_27,op_28,-1
	and	op_9,op_10,op_27
	sub	op_8,x0,op_9
	sub	op_1,op_2,op_8
	addi	op_29,x0,16
	sra	op_0,op_1,op_29
	lui	op_38,16
	addi	op_37,op_38,-1
	and	op_36,a4,op_37
	lui	op_41,16
	addi	op_40,op_41,-1
	and	op_39,a6,op_40
	callmul	op_35,op_36,op_39
	addi	op_42,x0,16
	srl	op_34,op_35,op_42
	addi	op_46,x0,16
	sra	op_45,a4,op_46
	lui	op_49,16
	addi	op_48,op_49,-1
	and	op_47,a6,op_48
	callmul	op_44,op_45,op_47
	sub	op_43,x0,op_44
	sub	op_33,op_34,op_43
	addi	op_50,x0,16
	sra	op_32,op_33,op_50
	addi	op_54,x0,16
	sra	op_53,a4,op_54
	addi	op_56,x0,16
	sra	op_55,a6,op_56
	callmul	op_52,op_53,op_55
	sub	op_51,x0,op_52
	sub	op_31,op_32,op_51
	sub	op_30,x0,op_31
	sub	a5,op_0,op_30
	addi	op_0,x0,31
	sra	a2,a4,op_0
	addi	a3,a3,4
	addi	op_0,x0,9
	sra	a5,a5,op_0
	sub	a5,a5,a2
	callmul	a5,a5,a0
	sub	a5,a4,a5
	sw	a5,-4(a3)
	bne	a1,a3,.L62
	addi	a1,a1,80
	bne	a1,a7,.L61
	lui	a4,%hi(Seed)
	sw	a5,%lo(Seed)(a4)
	jalr	zero,ra,0
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a5,%hi(.LANCHOR3)
	addi	sp,sp,-1600
	addi	a5,a5,%lo(.LANCHOR3)
	addi	a3,a5,1600
	addi	a4,sp,0
.L68:
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
	bne	a5,a3,.L68
	lui	a1,%hi(.LANCHOR1)
	addi	a1,a1,%lo(.LANCHOR1)
	addi	a5,a1,-896
	addi	a4,sp,0
	addi	a1,a1,704
.L70:
	lbu	a2,0(a5)
	lbu	a3,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a2,a3,.L71
	bne	a1,a5,.L70
	addi	a0,zero,1
	addi	sp,sp,1600
	jalr	zero,ra,0
.L71:
	addi	a0,zero,0
	addi	sp,sp,1600
	jalr	zero,ra,0
	.size	verify_benchmark, .-verify_benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
.Lpcrel_3:
	auipc	ra,%pcrel_hi(initialise_benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_3)
	addi	a0,zero,1
.Lpcrel_4:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_4)
.Lpcrel_5:
	auipc	ra,%pcrel_hi(benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_5)
	sw	zero,12(sp)
	lw	a0,12(sp)
.Lpcrel_6:
	auipc	ra,%pcrel_hi(verify_benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_6)
	lw	ra,28(sp)
	addi	op_1,x0,1
	addi	op_4,x0,1
	and	op_3,op_4,a0
	sub	op_2,op_3,a0
	sub	op_0,op_1,op_2
	addi	op_6,x0,1
	and	op_5,op_6,a0
	sub	a0,op_0,op_5
	addi	sp,sp,32
	jalr	zero,ra,0
	.size	main, .-main
	.globl	ResultArray
	.globl	ArrayB
	.globl	ArrayB_ref
	.globl	ArrayA
	.globl	ArrayA_ref
	.globl	Seed
	.section	.rodata
	.align	2
	.set	.LANCHOR3,. + 0
.LC0:
	.word	291018000
	.word	315000075
	.word	279049970
	.word	205074215
	.word	382719905
	.word	302595865
	.word	348060915
	.word	308986330
	.word	343160760
	.word	307099935
	.word	292564810
	.word	240954510
	.word	232755815
	.word	246511665
	.word	328466830
	.word	263664375
	.word	324016395
	.word	334656070
	.word	285978755
	.word	345370360
	.word	252241835
	.word	333432715
	.word	299220275
	.word	247745815
	.word	422508990
	.word	316728505
	.word	359662270
	.word	277775280
	.word	323336795
	.word	320656600
	.word	249903690
	.word	251499360
	.word	242195700
	.word	263484280
	.word	348207635
	.word	289485100
	.word	328607555
	.word	300799835
	.word	269351410
	.word	305703460
	.word	304901010
	.word	316252815
	.word	263230275
	.word	208939015
	.word	421993740
	.word	335002930
	.word	348571170
	.word	280992155
	.word	289749970
	.word	259701175
	.word	295249990
	.word	310900035
	.word	250896625
	.word	250154105
	.word	315096035
	.word	236364800
	.word	312879355
	.word	312580685
	.word	275998435
	.word	344137885
	.word	286700525
	.word	325985600
	.word	253054970
	.word	224361490
	.word	353502130
	.word	306544290
	.word	323492140
	.word	259123905
	.word	307731610
	.word	282414410
	.word	281127810
	.word	246936935
	.word	207890815
	.word	233789540
	.word	339836730
	.word	277296350
	.word	319925620
	.word	307470895
	.word	290537580
	.word	292297535
	.word	272571255
	.word	377663320
	.word	304545985
	.word	263001340
	.word	375034885
	.word	325423710
	.word	410620380
	.word	313191730
	.word	356989815
	.word	308508355
	.word	218003850
	.word	272487135
	.word	266000220
	.word	264734710
	.word	367539620
	.word	304146675
	.word	355295500
	.word	276019740
	.word	251415695
	.word	301225235
	.word	272547900
	.word	321522300
	.word	288294345
	.word	247748015
	.word	389912855
	.word	331874890
	.word	370798315
	.word	315467255
	.word	367554485
	.word	311947660
	.word	258809685
	.word	270536510
	.word	256730515
	.word	287143040
	.word	363087030
	.word	285672775
	.word	353670120
	.word	304219695
	.word	274897255
	.word	324684660
	.word	233123995
	.word	227142480
	.word	212655155
	.word	198592290
	.word	345335250
	.word	302661845
	.word	253374925
	.word	233243305
	.word	233750030
	.word	224590040
	.word	200404820
	.word	250791135
	.word	234405760
	.word	211723645
	.word	280630165
	.word	185245875
	.word	296423665
	.word	276278575
	.word	252368265
	.word	278726535
	.word	277690535
	.word	339615440
	.word	320921550
	.word	307114315
	.word	400187215
	.word	334374655
	.word	376286920
	.word	295993530
	.word	362988020
	.word	356272700
	.word	293965465
	.word	261574710
	.word	259690975
	.word	263037705
	.word	416748985
	.word	274683275
	.word	385571030
	.word	402782385
	.word	323927010
	.word	362778710
	.word	267168970
	.word	323401680
	.word	279474330
	.word	201934365
	.word	362624300
	.word	330736145
	.word	371793675
	.word	299650280
	.word	333646005
	.word	264791490
	.word	215918320
	.word	277512760
	.word	264068435
	.word	234555295
	.word	321772515
	.word	217507025
	.word	310372440
	.word	317544750
	.word	245525965
	.word	343183435
	.word	281293570
	.word	326519505
	.word	233494705
	.word	238516065
	.word	297038200
	.word	266273420
	.word	349521550
	.word	259343530
	.word	306032255
	.word	266397915
	.word	210274920
	.word	263743085
	.word	231689610
	.word	251949545
	.word	293562740
	.word	226822900
	.word	309225440
	.word	286212000
	.word	206108715
	.word	236678985
	.word	288404350
	.word	310319375
	.word	282695670
	.word	244150740
	.word	426489380
	.word	387525790
	.word	342018190
	.word	326086505
	.word	352250260
	.word	319997735
	.word	300645835
	.word	284822660
	.word	271837440
	.word	274000415
	.word	361826730
	.word	252399600
	.word	348582320
	.word	375813820
	.word	316588255
	.word	322499110
	.word	273368780
	.word	329706295
	.word	288668335
	.word	234501665
	.word	381962610
	.word	343186285
	.word	337520205
	.word	259637405
	.word	295755465
	.word	284778105
	.word	205310525
	.word	249598310
	.word	256662470
	.word	251533535
	.word	336159770
	.word	249342150
	.word	333559450
	.word	329296590
	.word	278254845
	.word	300673860
	.word	318589575
	.word	315522800
	.word	260632295
	.word	250009765
	.word	337127730
	.word	312810490
	.word	346698590
	.word	260810030
	.word	388289910
	.word	337081285
	.word	283635410
	.word	208148610
	.word	234123865
	.word	259653165
	.word	370115255
	.word	243311450
	.word	377808245
	.word	358786770
	.word	286839730
	.word	321912835
	.word	229541925
	.word	253967450
	.word	223002545
	.word	202302515
	.word	303446955
	.word	268472740
	.word	285580065
	.word	211013405
	.word	287677960
	.word	279773910
	.word	227377310
	.word	197461135
	.word	222469715
	.word	179536615
	.word	306957380
	.word	178407075
	.word	281051570
	.word	279718120
	.word	234868230
	.word	288991535
	.word	290692955
	.word	317729070
	.word	297868235
	.word	213450065
	.word	469270935
	.word	375344910
	.word	326987580
	.word	334565680
	.word	325300040
	.word	290325655
	.word	254703825
	.word	284914960
	.word	245773820
	.word	276641510
	.word	323510795
	.word	271034400
	.word	337424250
	.word	360011440
	.word	281515520
	.word	331261535
	.word	287075125
	.word	313194850
	.word	269889345
	.word	208109115
	.word	420653930
	.word	331900290
	.word	355440665
	.word	318065155
	.word	343785360
	.word	302163035
	.word	308959360
	.word	312666110
	.word	268997740
	.word	288557415
	.word	370158305
	.word	205012650
	.word	318198795
	.word	384484520
	.word	316450105
	.word	378714460
	.word	278680580
	.word	356815220
	.word	307597060
	.word	216073365
	.word	390879235
	.word	358775185
	.word	358895230
	.word	306434180
	.word	315569040
	.word	272688130
	.word	249424325
	.word	274584610
	.word	273530970
	.word	265450585
	.word	325127920
	.word	312802050
	.word	317134900
	.word	298518590
	.word	269975470
	.word	332586535
	.word	245629780
	.word	267021570
	.word	234689035
	.word	208808065
	.word	366356035
	.word	267059560
	.word	349348005
	.word	270158755
	.word	348048340
	.word	291550930
	.word	272717800
	.word	259714410
	.word	236033845
	.word	280627610
	.word	335089770
	.word	176610475
	.word	259339950
	.word	322752840
	.word	236218295
	.word	329687310
	.word	226517370
	.word	272306005
	.word	271484080
	.word	216145515
	.word	400972075
	.word	288475645
	.word	332969550
	.word	338410905
	.word	329052205
	.word	330392265
	.word	306488095
	.word	271979085
	.word	232795960
	.word	257593945
	.word	339558165
	.word	202700275
	.word	320622065
	.word	386350450
	.word	315344865
	.word	329233410
	.word	224852610
	.word	231292540
	.word	236945875
	.word	243273740
	.word	336327040
	.word	305144680
	.word	248261920
	.word	191671605
	.word	241699245
	.word	263085200
	.word	198883715
	.word	175742885
	.word	202517850
	.word	172427630
	.word	296304160
	.word	209188850
	.word	326546955
	.word	252990460
	.word	238844535
	.word	289753485
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.set	.LANCHOR1,. + 4096
	.set	.LANCHOR2,. + 8192
	.type	ArrayB, @object
	.size	ArrayB, 1600
ArrayB:
	.zero	1600
	.type	ArrayB_ref, @object
	.size	ArrayB_ref, 1600
ArrayB_ref:
	.zero	1600
	.type	ResultArray, @object
	.size	ResultArray, 1600
ResultArray:
	.zero	1600
	.type	ArrayA, @object
	.size	ArrayA, 1600
ArrayA:
	.zero	1600
	.type	ArrayA_ref, @object
	.size	ArrayA_ref, 1600
ArrayA_ref:
	.zero	1600
	.section	.sbss,"aw",@nobits
	.align	2
	.type	Seed, @object
	.size	Seed, 4
Seed:
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
	addi	op_0,x0,1
	and	a3,op_0,a1
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
	bgeu	a2,a1,__riscv_div_lib_L2
__riscv_div_lib_L1:
	blt	zero,a2,.+8
	jal	x0,__riscv_div_lib_L2
	addi	op_0,x0,1
	sll	a2,a2,op_0
	addi	op_0,x0,1
	sll	a3,a3,op_0
	bgeu	a2,a1,.+8
	jal	x0,__riscv_div_lib_L1
__riscv_div_lib_L2:
	addi	a0,zero,0
__riscv_div_lib_L3:
	bgeu	a1,a2,.+8
	jal	x0,__riscv_div_lib_L4
	sub	a1,a1,a2
	and	op_1,a0,a3
	sub	op_0,op_1,a3
	sub	a0,a0,op_0
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