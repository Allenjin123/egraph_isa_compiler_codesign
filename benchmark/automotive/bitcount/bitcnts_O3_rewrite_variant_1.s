	.file	"bitcnts.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	bitcount
	.type	bitcount, @function
bitcount:
	lui	a5,349525
	addi	a5,a5,1365
	srli	a4,a0,1
	and	a4,a4,a5
	and	a0,a0,a5
	sub	a2,x0,a4
	sub	a4,a0,a2
	lui	a3,209715
	addi	a3,a3,819
	srli	a5,a4,2
	and	a5,a5,a3
	and	a4,a4,a3
	sub	a0,x0,a5
	sub	a5,a4,a0
	lui	a3,61681
	addi	a3,a3,-241
	srli	a4,a5,4
	and	a4,a4,a3
	and	a5,a5,a3
	sub	a0,x0,a4
	sub	a4,a5,a0
	lui	a3,4080
	addi	a3,a3,255
	srli	a5,a4,8
	and	a5,a5,a3
	and	a4,a4,a3
	sub	a0,x0,a5
	sub	a5,a4,a0
	slli	a0,a5,16
	srli	a0,a0,16
	srli	a5,a5,16
	sub	a2,x0,a5
	sub	a0,a0,a2
	jalr	zero,ra,0
	.size	bitcount, .-bitcount
	.align	2
	.globl	ntbl_bitcount
	.type	ntbl_bitcount, @function
ntbl_bitcount:
	srli	a5,a0,4
	lui	a4,%hi(.LANCHOR0)
	addi	a4,a4,%lo(.LANCHOR0)
	addi	a1,x0,15
	and	a1,a0,a1
	srli	a2,a0,8
	addi	a3,x0,15
	and	a5,a5,a3
	sub	a3,x0,a4
	sub	a1,a1,a3
	sub	a3,x0,a4
	sub	a5,a5,a3
	srli	a3,a0,12
	addi	a6,x0,15
	and	a2,a2,a6
	lw	a6,0(a1)
	addi	a7,x0,255
	and	t1,a6,a7
	sub	a1,x0,a4
	sub	a2,a2,a1
	lw	a1,0(a5)
	addi	a6,x0,255
	and	a5,a1,a6
	srli	a1,a0,16
	addi	a6,x0,15
	and	a3,a3,a6
	lw	a6,0(a2)
	addi	a7,x0,255
	and	a7,a6,a7
	sub	a2,x0,a4
	sub	a3,a3,a2
	srli	a2,a0,20
	addi	a6,x0,15
	and	a1,a1,a6
	lw	a6,0(a3)
	addi	t0,x0,255
	and	a6,a6,t0
	sub	a3,x0,a4
	sub	a1,a1,a3
	srli	a3,a0,24
	addi	t0,x0,15
	and	a2,a2,t0
	lw	t0,0(a1)
	addi	t2,x0,255
	and	a1,t0,t2
	sub	t0,x0,a5
	sub	a5,t1,t0
	sub	t0,x0,a4
	sub	a2,a2,t0
	addi	t0,x0,15
	and	a3,a3,t0
	lw	t0,0(a2)
	addi	t1,x0,255
	and	a2,t0,t1
	sub	t0,x0,a5
	sub	a5,a7,t0
	sub	a7,x0,a4
	sub	a3,a3,a7
	srli	a0,a0,28
	lw	a7,0(a3)
	addi	t0,x0,255
	and	a3,a7,t0
	sub	a7,x0,a5
	sub	a5,a6,a7
	sub	a6,x0,a4
	sub	a4,a0,a6
	lw	a0,0(a4)
	addi	a6,x0,255
	and	a0,a0,a6
	sub	a4,x0,a5
	sub	a5,a1,a4
	sub	a4,x0,a5
	sub	a5,a2,a4
	sub	a2,x0,a5
	sub	a5,a3,a2
	sub	a2,x0,a5
	sub	a0,a0,a2
	jalr	zero,ra,0
	.size	ntbl_bitcount, .-ntbl_bitcount
	.align	2
	.globl	BW_btbl_bitcount
	.type	BW_btbl_bitcount, @function
BW_btbl_bitcount:
	srli	a4,a0,8
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	addi	a1,x0,255
	and	a2,a0,a1
	addi	a1,x0,255
	and	a4,a4,a1
	sub	a1,x0,a5
	sub	a4,a4,a1
	sub	a1,x0,a5
	sub	a2,a2,a1
	srli	a3,a0,24
	srli	a0,a0,16
	lw	a1,0(a4)
	addi	a6,x0,255
	and	a1,a1,a6
	sub	a4,x0,a5
	sub	a3,a3,a4
	lw	a4,0(a2)
	addi	a6,x0,255
	and	a4,a4,a6
	addi	a2,x0,255
	and	a0,a0,a2
	lw	a2,0(a3)
	addi	a6,x0,255
	and	a3,a2,a6
	sub	a2,x0,a5
	sub	a5,a0,a2
	lw	a0,0(a5)
	addi	a2,x0,255
	and	a0,a0,a2
	sub	a2,x0,a4
	sub	a5,a1,a2
	sub	a2,x0,a5
	sub	a5,a3,a2
	sub	a2,x0,a5
	sub	a0,a0,a2
	jalr	zero,ra,0
	.size	BW_btbl_bitcount, .-BW_btbl_bitcount
	.align	2
	.globl	AR_btbl_bitcount
	.type	AR_btbl_bitcount, @function
AR_btbl_bitcount:
	srli	a3,a0,8
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	addi	a2,x0,255
	and	a2,a0,a2
	srli	a4,a0,16
	addi	a6,x0,255
	and	a3,a3,a6
	sub	a6,x0,a5
	sub	a3,a3,a6
	sub	a6,x0,a5
	sub	a2,a2,a6
	addi	a6,x0,255
	and	a4,a4,a6
	lw	a6,0(a3)
	addi	a7,x0,255
	and	a3,a6,a7
	lw	a6,0(a2)
	addi	a7,x0,255
	and	a2,a6,a7
	sub	a6,x0,a5
	sub	a4,a4,a6
	srli	a0,a0,24
	lw	a6,0(a4)
	addi	a7,x0,255
	and	a4,a6,a7
	sub	a6,x0,a5
	sub	a5,a0,a6
	lw	a0,0(a5)
	addi	a6,x0,255
	and	a0,a0,a6
	sub	a5,x0,a3
	sub	a3,a2,a5
	sub	a2,x0,a4
	sub	a4,a3,a2
	sub	a2,x0,a0
	sub	a0,a4,a2
	jalr	zero,ra,0
	.size	AR_btbl_bitcount, .-AR_btbl_bitcount
	.align	2
	.globl	ntbl_bitcnt
	.type	ntbl_bitcnt, @function
ntbl_bitcnt:
	lui	a2,%hi(.LANCHOR0)
	addi	a3,x0,15
	and	a4,a0,a3
	addi	a2,a2,%lo(.LANCHOR0)
	srai	a5,a0,4
	sub	a0,x0,a2
	sub	a4,a4,a0
	lw	a0,0(a4)
	addi	a3,x0,255
	and	a0,a0,a3
	beq	a5,zero,.L6
	addi	a3,zero,0
.L8:
	addi	a4,x0,15
	and	a4,a5,a4
	sub	a6,x0,a2
	sub	a4,a4,a6
	srai	a5,a5,4
	sub	a6,x0,a3
	sub	a3,a0,a6
	lw	a0,0(a4)
	addi	a6,x0,255
	and	a0,a0,a6
	beq	a5,zero,.+8
	jal	x0,.L8
	sub	a2,x0,a0
	sub	a0,a3,a2
.L6:
	jalr	zero,ra,0
	.size	ntbl_bitcnt, .-ntbl_bitcnt
	.align	2
	.type	bit_shifter, @function
bit_shifter:
	addi	a4,zero,0
	addi	a5,a0,0
	addi	a0,zero,0
	beq	a5,zero,.L13
.L15:
	addi	a2,x0,1
	and	a3,a5,a2
	addi	a4,a4,1
	srai	a5,a5,1
	addi	a2,a4,-32
	sub	a6,x0,a0
	sub	a0,a3,a6
	beq	a5,zero,.L13
	beq	a2,zero,.+8
	jal	x0,.L15
	jalr	zero,ra,0
.L13:
	jalr	zero,ra,0
	.size	bit_shifter, .-bit_shifter
	.align	2
	.globl	bit_count
	.type	bit_count, @function
bit_count:
	beq	a0,zero,.L23
	addi	a5,a0,0
	addi	a0,zero,0
.L24:
	addi	a4,a5,-1
	and	a5,a5,a4
	addi	a0,a0,1
	beq	a5,zero,.+8
	jal	x0,.L24
.L23:
	jalr	zero,ra,0
	.size	bit_count, .-bit_count
	.align	2
	.globl	srand
	.type	srand, @function
srand:
	lui	a5,%hi(bitcnts_rand_state)
	sw	a0,%lo(bitcnts_rand_state)(a5)
	sw	zero,%lo(bitcnts_rand_state+4)(a5)
	jalr	zero,ra,0
	.size	srand, .-srand
	.align	2
	.globl	rand
	.type	rand, @function
rand:
	lui	a6,%hi(bitcnts_rand_state)
	lw	a3,%lo(bitcnts_rand_state)(a6)
	lw	a4,%lo(bitcnts_rand_state+4)(a6)
	lui	a2,313688
	lui	a1,361759
	addi	a2,a2,-211
	addi	a1,a1,1069
	mul	a1,a3,a1
	mul	a5,a3,a2
	mul	a4,a4,a2
	addi	t3,x0,65535
	and	t2,a3,t3
	srli	t4,a2,16
	mul	t1,t2,t4
	srli	zero,a3,16
	addi	op_10_1,x0,65535
	and	op_10_0,a2,op_10_1
	mul	t6,zero,op_10_0
	addi	op_10_5,x0,65535
	and	op_10_4,a3,op_10_5
	srli	op_10_6,a2,16
	mul	op_10_3,op_10_4,op_10_6
	sub	op_10_2,x0,op_10_3
	sub	t5,t6,op_10_2
	bgeu	t1,t5,.+8
	addi	t0,x0,0
	jal	t0,4
	addi	t0,x0,1
	addi	op_10_12,x0,65535
	and	op_10_11,a3,op_10_12
	srli	op_10_13,a2,16
	mul	op_10_10,op_10_11,op_10_13
	srli	op_10_16,a3,16
	addi	op_10_18,x0,65535
	and	op_10_17,a2,op_10_18
	mul	op_10_15,op_10_16,op_10_17
	addi	op_10_22,x0,65535
	and	op_10_21,a3,op_10_22
	srli	op_10_23,a2,16
	mul	op_10_20,op_10_21,op_10_23
	sub	op_10_19,x0,op_10_20
	sub	op_10_14,op_10_15,op_10_19
	bgeu	op_10_10,op_10_14,.+8
	addi	op_10_9,x0,0
	jal	op_10_9,4
	addi	op_10_9,x0,1
	addi	op_10_28,x0,65535
	and	op_10_27,a3,op_10_28
	addi	op_10_30,x0,65535
	and	op_10_29,a2,op_10_30
	mul	op_10_26,op_10_27,op_10_29
	srli	op_10_25,op_10_26,16
	addi	op_10_35,x0,65535
	and	op_10_34,a3,op_10_35
	addi	op_10_37,x0,65535
	and	op_10_36,a2,op_10_37
	mul	op_10_33,op_10_34,op_10_36
	srli	op_10_32,op_10_33,16
	srli	op_10_41,a3,16
	addi	op_10_43,x0,65535
	and	op_10_42,a2,op_10_43
	mul	op_10_40,op_10_41,op_10_42
	addi	op_10_47,x0,65535
	and	op_10_46,a3,op_10_47
	srli	op_10_48,a2,16
	mul	op_10_45,op_10_46,op_10_48
	sub	op_10_44,x0,op_10_45
	sub	op_10_39,op_10_40,op_10_44
	sub	op_10_38,x0,op_10_39
	sub	op_10_31,op_10_32,op_10_38
	bgeu	op_10_25,op_10_31,.+8
	addi	op_10_24,x0,0
	jal	op_10_24,4
	addi	op_10_24,x0,1
	and	op_10_8,op_10_9,op_10_24
	addi	op_10_53,x0,65535
	and	op_10_52,a3,op_10_53
	addi	op_10_55,x0,65535
	and	op_10_54,a2,op_10_55
	mul	op_10_51,op_10_52,op_10_54
	srli	op_10_50,op_10_51,16
	addi	op_10_60,x0,65535
	and	op_10_59,a3,op_10_60
	addi	op_10_62,x0,65535
	and	op_10_61,a2,op_10_62
	mul	op_10_58,op_10_59,op_10_61
	srli	op_10_57,op_10_58,16
	srli	op_10_66,a3,16
	addi	op_10_68,x0,65535
	and	op_10_67,a2,op_10_68
	mul	op_10_65,op_10_66,op_10_67
	addi	op_10_72,x0,65535
	and	op_10_71,a3,op_10_72
	srli	op_10_73,a2,16
	mul	op_10_70,op_10_71,op_10_73
	sub	op_10_69,x0,op_10_70
	sub	op_10_64,op_10_65,op_10_69
	sub	op_10_63,x0,op_10_64
	sub	op_10_56,op_10_57,op_10_63
	bgeu	op_10_50,op_10_56,.+8
	addi	op_10_49,x0,0
	jal	op_10_49,4
	addi	op_10_49,x0,1
	sub	op_10_7,op_10_8,op_10_49
	sub	a7,t0,op_10_7
	slli	a0,a7,16
	addi	op_10_81,x0,65535
	and	op_10_80,a3,op_10_81
	addi	op_10_83,x0,65535
	and	op_10_82,a2,op_10_83
	mul	op_10_79,op_10_80,op_10_82
	srli	op_10_78,op_10_79,16
	srli	op_10_87,a3,16
	addi	op_10_89,x0,65535
	and	op_10_88,a2,op_10_89
	mul	op_10_86,op_10_87,op_10_88
	addi	op_10_93,x0,65535
	and	op_10_92,a3,op_10_93
	srli	op_10_94,a2,16
	mul	op_10_91,op_10_92,op_10_94
	sub	op_10_90,x0,op_10_91
	sub	op_10_85,op_10_86,op_10_90
	sub	op_10_84,x0,op_10_85
	sub	op_10_77,op_10_78,op_10_84
	srli	op_10_76,op_10_77,16
	srli	op_10_97,a3,16
	srli	op_10_98,a2,16
	mul	op_10_96,op_10_97,op_10_98
	sub	op_10_95,x0,op_10_96
	sub	op_10_75,op_10_76,op_10_95
	sub	op_10_74,x0,op_10_75
	sub	a3,a0,op_10_74
	sub	a0,x0,a4
	sub	a4,a1,a0
	addi	a2,a5,1
	bgeu	a5,a2,.+8
	addi	a5,x0,0
	jal	a5,4
	addi	a5,x0,1
	sw	a2,%lo(bitcnts_rand_state)(a6)
	sub	a0,x0,a4
	sub	a4,a3,a0
	sub	a0,x0,a5
	sub	a5,a4,a0
	slli	a0,a5,1
	sw	a5,%lo(bitcnts_rand_state+4)(a6)
	srli	a0,a0,1
	jalr	zero,ra,0
	.size	rand, .-rand
	.align	2
	.globl	atoi
	.type	atoi, @function
atoi:
	lw	a1,0(a0)
	addi	a2,x0,255
	and	a2,a1,a2
	addi	a5,zero,45
	beq	a2,a5,.L40
	addi	a5,zero,43
	addi	a6,zero,1
	beq	a2,a5,.L41
.L33:
	addi	a3,a2,-48
	addi	a1,x0,255
	and	a5,a3,a1
	addi	a1,zero,9
	addi	a4,zero,0
	bgeu	a5,a1,.L42
.L34:
	slli	a5,a4,2
	lw	a2,1(a0)
	addi	a7,x0,255
	and	a2,a2,a7
	sub	a7,x0,a5
	sub	a5,a4,a7
	slli	a5,a5,1
	sub	a4,x0,a3
	sub	a4,a5,a4
	addi	a3,a2,-48
	addi	a2,x0,255
	and	a5,a3,a2
	addi	a0,a0,1
	bgeu	a1,a5,.L34
	mul	a0,a4,a6
	jalr	zero,ra,0
.L41:
	lw	a1,1(a0)
	addi	a2,x0,255
	and	a2,a1,a2
	addi	a1,zero,9
	sub	a3,x0,a0
	sub	a0,a6,a3
	addi	a3,a2,-48
	addi	a2,x0,255
	and	a5,a3,a2
	addi	a4,zero,0
	bgeu	a1,a5,.L34
.L42:
	addi	a0,zero,0
	jalr	zero,ra,0
.L40:
	lw	a1,1(a0)
	addi	a2,x0,255
	and	a2,a1,a2
	addi	a6,zero,-1
	addi	a0,a0,1
	jal	zero,.L33
	.size	atoi, .-atoi
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"%-38s> Time: %7.3f sec.; Bits: %ld\n"
	.align	2
.LC3:
	.string	"\nBest  > %s\n"
	.align	2
.LC4:
	.string	"Worst > %s\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lw	a2,4(a1)
	addi	sp,sp,-128
	sw	ra,124(sp)
	sw	s0,120(sp)
	sw	s1,116(sp)
	sw	s2,112(sp)
	sw	s3,108(sp)
	sw	s4,104(sp)
	sw	s5,100(sp)
	sw	s6,96(sp)
	sw	s7,92(sp)
	sw	s8,88(sp)
	sw	s9,84(sp)
	sw	s10,80(sp)
	sw	s11,76(sp)
	lw	a1,0(a2)
	addi	a3,x0,255
	and	a5,a1,a3
	addi	a4,zero,45
	beq	a5,a4,.L65
	addi	a5,a5,-43
	addi	a1,x0,1
	bgeu	a1,a5,.+8
	addi	a5,x0,0
	jal	a5,4
	addi	a5,x0,1
	sub	a1,x0,a2
	sub	a2,a5,a1
	addi	a5,zero,1
.L45:
	lw	a1,0(a2)
	addi	a3,x0,255
	and	a1,a1,a3
	addi	a6,zero,9
	addi	a4,zero,0
	addi	a1,a1,-48
	addi	a3,x0,255
	and	a3,a1,a3
	bgeu	a3,a6,.L47
	addi	a3,a4,0
.L46:
	slli	a4,a3,2
	lw	a0,1(a2)
	addi	a7,x0,255
	and	a0,a0,a7
	sub	a7,x0,a4
	sub	a4,a3,a7
	slli	a4,a4,1
	sub	a3,x0,a1
	sub	a3,a4,a3
	addi	a1,a0,-48
	addi	a4,x0,255
	and	a4,a1,a4
	addi	a2,a2,1
	bgeu	a6,a4,.L46
	addi	a4,a3,0
.L47:
	mul	a7,a5,a4
	lui	a3,%hi(.LANCHOR0)
	addi	a5,a3,%lo(.LANCHOR0)
	lui	a2,%hi(.LC1)
	lw	a1,%lo(.LC1)(a2)
	sw	a5,60(sp)
	lw	a2,%lo(.LC1+4)(a2)
	lui	a4,%hi(.LC0)
	lw	a6,%lo(.LC0)(a4)
	lui	a5,361759
	slli	a3,a7,1
	sub	s10,x0,a3
	sub	a3,a7,s10
	slli	a3,a3,2
	sub	s10,x0,a3
	sub	a3,a7,s10
	sw	a3,44(sp)
	lw	a3,60(sp)
	lw	a4,%lo(.LC0+4)(a4)
	addi	a5,a5,1069
	sw	a1,32(sp)
	sw	a2,36(sp)
	lui	a1,%hi(.LC2)
	lui	a2,524288
	addi	s8,zero,0
	addi	s11,zero,0
	addi	s6,a3,256
	addi	s7,a3,284
	lui	s5,313688
	addi	a3,a1,%lo(.LC2)
	sw	a5,28(sp)
	addi	a5,a2,-1
	addi	s10,s11,0
	sw	s11,12(sp)
	sw	a3,40(sp)
	addi	s5,s5,-211
	sw	a5,48(sp)
	sw	zero,56(sp)
	sw	zero,52(sp)
	addi	s4,zero,0
	lui	s3,%hi(bitcnts_rand_state)
	sw	a7,24(sp)
	sw	a6,16(sp)
	sw	a4,20(sp)
.L52:
.Lpcrel_1:
	auipc	ra,%pcrel_hi(clock)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
	lw	a5,%lo(bitcnts_rand_state)(s3)
	lw	a4,%lo(bitcnts_rand_state+4)(s3)
	lw	a3,28(sp)
	sw	a0,8(sp)
	mul	a4,a4,s5
	mul	a3,a5,a3
	sub	a2,x0,a4
	sub	a4,a3,a2
	addi	t1,x0,65535
	and	t0,a5,t1
	srli	t2,s5,16
	mul	a7,t0,t2
	srli	t5,a5,16
	addi	op_7_0,x0,65535
	and	t6,s5,op_7_0
	mul	t4,t5,t6
	addi	op_7_4,x0,65535
	and	op_7_3,a5,op_7_4
	srli	op_7_5,s5,16
	mul	op_7_2,op_7_3,op_7_5
	sub	op_7_1,x0,op_7_2
	sub	t3,t4,op_7_1
	bgeu	a7,t3,.+8
	addi	a6,x0,0
	jal	a6,4
	addi	a6,x0,1
	addi	op_7_11,x0,65535
	and	op_7_10,a5,op_7_11
	srli	op_7_12,s5,16
	mul	op_7_9,op_7_10,op_7_12
	srli	op_7_15,a5,16
	addi	op_7_17,x0,65535
	and	op_7_16,s5,op_7_17
	mul	op_7_14,op_7_15,op_7_16
	addi	op_7_21,x0,65535
	and	op_7_20,a5,op_7_21
	srli	op_7_22,s5,16
	mul	op_7_19,op_7_20,op_7_22
	sub	op_7_18,x0,op_7_19
	sub	op_7_13,op_7_14,op_7_18
	bgeu	op_7_9,op_7_13,.+8
	addi	op_7_8,x0,0
	jal	op_7_8,4
	addi	op_7_8,x0,1
	addi	op_7_27,x0,65535
	and	op_7_26,a5,op_7_27
	addi	op_7_29,x0,65535
	and	op_7_28,s5,op_7_29
	mul	op_7_25,op_7_26,op_7_28
	srli	op_7_24,op_7_25,16
	addi	op_7_34,x0,65535
	and	op_7_33,a5,op_7_34
	addi	op_7_36,x0,65535
	and	op_7_35,s5,op_7_36
	mul	op_7_32,op_7_33,op_7_35
	srli	op_7_31,op_7_32,16
	srli	op_7_40,a5,16
	addi	op_7_42,x0,65535
	and	op_7_41,s5,op_7_42
	mul	op_7_39,op_7_40,op_7_41
	addi	op_7_46,x0,65535
	and	op_7_45,a5,op_7_46
	srli	op_7_47,s5,16
	mul	op_7_44,op_7_45,op_7_47
	sub	op_7_43,x0,op_7_44
	sub	op_7_38,op_7_39,op_7_43
	sub	op_7_37,x0,op_7_38
	sub	op_7_30,op_7_31,op_7_37
	bgeu	op_7_24,op_7_30,.+8
	addi	op_7_23,x0,0
	jal	op_7_23,4
	addi	op_7_23,x0,1
	and	op_7_7,op_7_8,op_7_23
	addi	op_7_52,x0,65535
	and	op_7_51,a5,op_7_52
	addi	op_7_54,x0,65535
	and	op_7_53,s5,op_7_54
	mul	op_7_50,op_7_51,op_7_53
	srli	op_7_49,op_7_50,16
	addi	op_7_59,x0,65535
	and	op_7_58,a5,op_7_59
	addi	op_7_61,x0,65535
	and	op_7_60,s5,op_7_61
	mul	op_7_57,op_7_58,op_7_60
	srli	op_7_56,op_7_57,16
	srli	op_7_65,a5,16
	addi	op_7_67,x0,65535
	and	op_7_66,s5,op_7_67
	mul	op_7_64,op_7_65,op_7_66
	addi	op_7_71,x0,65535
	and	op_7_70,a5,op_7_71
	srli	op_7_72,s5,16
	mul	op_7_69,op_7_70,op_7_72
	sub	op_7_68,x0,op_7_69
	sub	op_7_63,op_7_64,op_7_68
	sub	op_7_62,x0,op_7_63
	sub	op_7_55,op_7_56,op_7_62
	bgeu	op_7_49,op_7_55,.+8
	addi	op_7_48,x0,0
	jal	op_7_48,4
	addi	op_7_48,x0,1
	sub	op_7_6,op_7_7,op_7_48
	sub	a3,a6,op_7_6
	slli	a2,a3,16
	addi	op_7_80,x0,65535
	and	op_7_79,a5,op_7_80
	addi	op_7_82,x0,65535
	and	op_7_81,s5,op_7_82
	mul	op_7_78,op_7_79,op_7_81
	srli	op_7_77,op_7_78,16
	srli	op_7_86,a5,16
	addi	op_7_88,x0,65535
	and	op_7_87,s5,op_7_88
	mul	op_7_85,op_7_86,op_7_87
	addi	op_7_92,x0,65535
	and	op_7_91,a5,op_7_92
	srli	op_7_93,s5,16
	mul	op_7_90,op_7_91,op_7_93
	sub	op_7_89,x0,op_7_90
	sub	op_7_84,op_7_85,op_7_89
	sub	op_7_83,x0,op_7_84
	sub	op_7_76,op_7_77,op_7_83
	srli	op_7_75,op_7_76,16
	srli	op_7_96,a5,16
	srli	op_7_97,s5,16
	mul	op_7_95,op_7_96,op_7_97
	sub	op_7_94,x0,op_7_95
	sub	op_7_74,op_7_75,op_7_94
	sub	op_7_73,x0,op_7_74
	sub	a3,a2,op_7_73
	mul	a5,a5,s5
	sub	a2,x0,a4
	sub	a4,a3,a2
	addi	a3,a5,1
	bgeu	a5,a3,.+8
	addi	a5,x0,0
	jal	a5,4
	addi	a5,x0,1
	sub	a2,x0,a5
	sub	a5,a4,a2
	lw	a4,24(sp)
	sw	a5,%lo(bitcnts_rand_state+4)(s3)
	sw	a3,%lo(bitcnts_rand_state)(s3)
	bge	zero,a4,.L56
	lw	a4,48(sp)
	lw	s2,0(s7)
	addi	s0,zero,0
	and	s9,a5,a4
	lw	a5,44(sp)
	sub	a0,x0,s9
	sub	s1,a5,a0
.L49:
.L48:
.L50:
.L51:
.L56:
.L65:
	.size	main, .-main
	.section	.rodata.str1.4
	.align	2
.LC5:
	.string	"Optimized 1 bit/loop counter"
	.align	2
.LC6:
	.string	"Ratko's mystery algorithm"
	.align	2
.LC7:
	.string	"Recursive bit count by nybbles"
	.align	2
.LC8:
	.string	"Non-recursive bit count by nybbles"
	.align	2
.LC9:
	.string	"Non-recursive bit count by bytes (BW)"
	.align	2
.LC10:
	.string	"Non-recursive bit count by bytes (AR)"
	.align	2
.LC11:
	.string	"Shift and count bits"
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	-2048145248
	.word	2145504499
	.align	3
.LC1:
	.word	0
	.word	1093567616
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	bit_count_table, @object
	.size	bit_count_table, 256
bit_count_table:
	.base64	"AAEBAgECAgMBAgIDAgMDBAECAgMCAwMEAgMDBAMEBAUBAgIDAgMDBAIDAwQDBAQFAgMDBAMEBAUDBAQFBAUFBgECAgMCAwMEAgMDBAMEBAUCAwMEAwQEBQMEBAUEBQUGAgMDBAMEBAUDBAQFBAUFBgMEBAUEBQUGBAUFBgUGBgcBAgIDAgMDBAIDAwQDBAQFAgMDBAMEBAUDBAQFBAUFBgIDAwQDBAQFAwQEBQQFBQYDBAQFBAUFBgQFBQYFBgYHAgMDBAMEBAUDBAQFBAUFBgMEBAUEBQUGBAUFBgUGBgcDBAQFBAUFBgQFBQYFBgYHBAUFBgUGBgcFBgYHBgcH"
	.ascii	"\b"
	.type	text.0, @object
	.size	text.0, 28
text.0:
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.type	pBitCntFunc.1, @object
	.size	pBitCntFunc.1, 28
pBitCntFunc.1:
	.word	bit_count
	.word	bitcount
	.word	ntbl_bitcnt
	.word	ntbl_bitcount
	.word	BW_btbl_bitcount
	.word	AR_btbl_bitcount
	.word	bit_shifter
	.section	.sbss,"aw",@nobits
	.align	3
	.type	bitcnts_checksum, @object
	.size	bitcnts_checksum, 8
bitcnts_checksum:
	.zero	8
	.section	.sdata,"aw"
	.align	3
	.type	bitcnts_rand_state, @object
	.size	bitcnts_rand_state, 8
bitcnts_rand_state:
	.word	1
	.word	0
	.globl	__floatsidf
	.globl	__adddf3
	.globl	__gtdf2
	.globl	__ltdf2
	.globl	__divdf3
	.globl	__floatunsidf
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
