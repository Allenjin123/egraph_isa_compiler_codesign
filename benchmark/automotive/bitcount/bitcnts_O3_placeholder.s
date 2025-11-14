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
	sub	op_0,x0,a4
	sub	a4,a0,op_0
	lui	a3,209715
	addi	a3,a3,819
	srli	a5,a4,2
	and	a5,a5,a3
	and	a4,a4,a3
	sub	op_0,x0,a5
	sub	a5,a4,op_0
	lui	a3,61681
	addi	a3,a3,-241
	srli	op_0,a5,2
	srli	a4,op_0,2
	and	a4,a4,a3
	and	a5,a5,a3
	sub	op_0,x0,a4
	sub	a4,a5,op_0
	lui	a3,4080
	addi	a3,a3,255
	srli	a5,a4,8
	and	a5,a5,a3
	and	a4,a4,a3
	sub	op_0,x0,a5
	sub	a5,a4,op_0
	slli	a0,a5,16
	srli	a0,a0,16
	srli	a5,a5,16
	sub	op_0,x0,a5
	sub	a0,a0,op_0
	jalr	zero,ra,0
	.size	bitcount, .-bitcount
	.align	2
	.globl	ntbl_bitcount
	.type	ntbl_bitcount, @function
ntbl_bitcount:
	srli	a5,a0,4
	lui	a4,%hi(.LANCHOR0)
	addi	a4,a4,%lo(.LANCHOR0)
	addi	op_0,x0,15
	and	a1,a0,op_0
	srli	a2,a0,8
	addi	op_0,x0,15
	and	a5,a5,op_0
	sub	op_0,x0,a4
	sub	a1,a1,op_0
	sub	op_0,x0,a4
	sub	a5,a5,op_0
	srli	a3,a0,12
	addi	op_0,x0,15
	and	a2,a2,op_0
	lw	op_0,0(a1)
	addi	op_1,x0,255
	and	t1,op_0,op_1
	sub	op_0,x0,a4
	sub	a2,a2,op_0
	lw	op_0,0(a5)
	addi	op_1,x0,255
	and	a5,op_0,op_1
	srli	a1,a0,16
	addi	op_0,x0,15
	and	a3,a3,op_0
	lw	op_0,0(a2)
	addi	op_1,x0,255
	and	a7,op_0,op_1
	sub	op_0,x0,a4
	sub	a3,a3,op_0
	srli	a2,a0,20
	addi	op_0,x0,15
	and	a1,a1,op_0
	lw	op_0,0(a3)
	addi	op_1,x0,255
	and	a6,op_0,op_1
	sub	op_0,x0,a4
	sub	a1,a1,op_0
	srli	a3,a0,24
	addi	op_0,x0,15
	and	a2,a2,op_0
	lw	op_0,0(a1)
	addi	op_1,x0,255
	and	a1,op_0,op_1
	sub	op_0,x0,a5
	sub	a5,t1,op_0
	sub	op_0,x0,a4
	sub	a2,a2,op_0
	addi	op_0,x0,15
	and	a3,a3,op_0
	lw	op_0,0(a2)
	addi	op_1,x0,255
	and	a2,op_0,op_1
	sub	op_0,x0,a5
	sub	a5,a7,op_0
	sub	op_0,x0,a4
	sub	a3,a3,op_0
	srli	a0,a0,28
	lw	op_0,0(a3)
	addi	op_1,x0,255
	and	a3,op_0,op_1
	sub	op_0,x0,a5
	sub	a5,a6,op_0
	sub	op_0,x0,a4
	sub	a4,a0,op_0
	lw	op_0,0(a4)
	addi	op_1,x0,255
	and	a0,op_0,op_1
	sub	op_0,x0,a5
	sub	a5,a1,op_0
	sub	op_0,x0,a5
	sub	a5,a2,op_0
	sub	op_0,x0,a5
	sub	a5,a3,op_0
	sub	op_0,x0,a5
	sub	a0,a0,op_0
	jalr	zero,ra,0
	.size	ntbl_bitcount, .-ntbl_bitcount
	.align	2
	.globl	BW_btbl_bitcount
	.type	BW_btbl_bitcount, @function
BW_btbl_bitcount:
	srli	a4,a0,8
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	addi	op_0,x0,255
	and	a2,a0,op_0
	addi	op_0,x0,255
	and	a4,a4,op_0
	sub	op_0,x0,a5
	sub	a4,a4,op_0
	sub	op_0,x0,a5
	sub	a2,a2,op_0
	srli	a3,a0,24
	srli	a0,a0,16
	lw	op_0,0(a4)
	addi	op_1,x0,255
	and	a1,op_0,op_1
	sub	op_0,x0,a5
	sub	a3,a3,op_0
	lw	op_0,0(a2)
	addi	op_1,x0,255
	and	a4,op_0,op_1
	addi	op_0,x0,255
	and	a0,a0,op_0
	lw	op_0,0(a3)
	addi	op_1,x0,255
	and	a3,op_0,op_1
	sub	op_0,x0,a5
	sub	a5,a0,op_0
	lw	op_0,0(a5)
	addi	op_1,x0,255
	and	a0,op_0,op_1
	sub	op_0,x0,a4
	sub	a5,a1,op_0
	sub	op_0,x0,a5
	sub	a5,a3,op_0
	sub	op_0,x0,a5
	sub	a0,a0,op_0
	jalr	zero,ra,0
	.size	BW_btbl_bitcount, .-BW_btbl_bitcount
	.align	2
	.globl	AR_btbl_bitcount
	.type	AR_btbl_bitcount, @function
AR_btbl_bitcount:
	srli	a3,a0,8
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	addi	op_0,x0,255
	and	a2,a0,op_0
	srli	a4,a0,16
	addi	op_0,x0,255
	and	a3,a3,op_0
	sub	op_0,x0,a5
	sub	a3,a3,op_0
	sub	op_0,x0,a5
	sub	a2,a2,op_0
	addi	op_0,x0,255
	and	a4,a4,op_0
	lw	op_0,0(a3)
	addi	op_1,x0,255
	and	a3,op_0,op_1
	lw	op_0,0(a2)
	addi	op_1,x0,255
	and	a2,op_0,op_1
	sub	op_0,x0,a5
	sub	a4,a4,op_0
	srli	a0,a0,24
	lw	op_0,0(a4)
	addi	op_1,x0,255
	and	a4,op_0,op_1
	sub	op_0,x0,a5
	sub	a5,a0,op_0
	lw	op_0,0(a5)
	addi	op_1,x0,255
	and	a0,op_0,op_1
	sub	op_0,x0,a3
	sub	a3,a2,op_0
	sub	op_0,x0,a4
	sub	a4,a3,op_0
	sub	op_0,x0,a0
	sub	a0,a4,op_0
	jalr	zero,ra,0
	.size	AR_btbl_bitcount, .-AR_btbl_bitcount
	.align	2
	.globl	ntbl_bitcnt
	.type	ntbl_bitcnt, @function
ntbl_bitcnt:
	lui	a2,%hi(.LANCHOR0)
	addi	op_0,x0,15
	and	a4,a0,op_0
	addi	a2,a2,%lo(.LANCHOR0)
	addi	op_0,x0,4
	sra	a5,a0,op_0
	sub	op_0,x0,a2
	sub	a4,a4,op_0
	lw	op_0,0(a4)
	addi	op_1,x0,255
	and	a0,op_0,op_1
	bne	a5,zero,.+8
	jal	x0,.L6
	addi	a3,zero,0
.L8:
	addi	op_0,x0,15
	and	a4,a5,op_0
	sub	op_0,x0,a2
	sub	a4,a4,op_0
	addi	op_0,x0,4
	sra	a5,a5,op_0
	sub	op_0,x0,a3
	sub	a3,a0,op_0
	lw	op_0,0(a4)
	addi	op_1,x0,255
	and	a0,op_0,op_1
	bne	a5,zero,.+8
	jal	x0,8
	jal	x0,.L8
	sub	op_0,x0,a0
	sub	a0,a3,op_0
.L6:
	jalr	zero,ra,0
	.size	ntbl_bitcnt, .-ntbl_bitcnt
	.align	2
	.type	bit_shifter, @function
bit_shifter:
	addi	a5,a0,0
	addi	a0,zero,0
	bne	a5,zero,.+8
	jal	x0,.L13
	addi	a4,zero,0
.L15:
	addi	op_0,x0,1
	and	a3,a5,op_0
	addi	a4,a4,1
	addi	op_0,x0,1
	sra	a5,a5,op_0
	addi	a2,a4,-32
	sub	op_0,x0,a0
	sub	a0,a3,op_0
	bne	a5,zero,.+8
	jal	x0,.L13
	bne	a2,zero,.L15
	jalr	zero,ra,0
.L13:
	jalr	zero,ra,0
	.size	bit_shifter, .-bit_shifter
	.align	2
	.globl	bit_count
	.type	bit_count, @function
bit_count:
	bne	a0,zero,.+8
	jal	x0,.L23
	addi	a5,a0,0
	addi	a0,zero,0
.L24:
	addi	a4,a5,-1
	and	a5,a5,a4
	addi	a0,a0,1
	bne	a5,zero,.L24
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
	callmul	a1,a3,a1
	callmul	a5,a3,a2
	callmul	a4,a4,a2
	lui	op_10,16
	addi	op_9,op_10,-1
	addi	op_13,x0,-1
	addi	op_16,x0,-1
	and	op_15,op_16,a3
	sub	op_14,op_15,a3
	sub	op_12,op_13,op_14
	addi	op_18,x0,-1
	and	op_17,op_18,a3
	sub	op_11,op_12,op_17
	and	op_8,op_9,op_11
	sub	op_7,x0,op_8
	sub	op_6,a3,op_7
	lui	op_20,16
	addi	op_19,op_20,-1
	sub	op_5,op_6,op_19
	sub	op_4,a3,op_5
	lui	op_23,16
	addi	op_22,op_23,-1
	and	op_21,a2,op_22
	callmul	op_3,op_4,op_21
	srli	op_2,op_3,16
	srli	op_29,a3,16
	lui	op_31,16
	addi	op_30,op_31,-1
	and	op_28,op_29,op_30
	lui	op_34,16
	addi	op_33,op_34,-1
	and	op_32,a2,op_33
	callmul	op_27,op_28,op_32
	lui	op_36,16
	addi	op_35,op_36,-1
	and	op_26,op_27,op_35
	lui	op_46,16
	addi	op_45,op_46,-1
	addi	op_49,x0,-1
	addi	op_52,x0,-1
	and	op_51,op_52,a3
	sub	op_50,op_51,a3
	sub	op_48,op_49,op_50
	addi	op_54,x0,-1
	and	op_53,op_54,a3
	sub	op_47,op_48,op_53
	and	op_44,op_45,op_47
	sub	op_43,x0,op_44
	sub	op_42,a3,op_43
	lui	op_56,16
	addi	op_55,op_56,-1
	sub	op_41,op_42,op_55
	sub	op_40,a3,op_41
	srli	op_58,a2,16
	lui	op_60,16
	addi	op_59,op_60,-1
	and	op_57,op_58,op_59
	callmul	op_39,op_40,op_57
	lui	op_62,16
	addi	op_61,op_62,-1
	and	op_38,op_39,op_61
	sub	op_37,x0,op_38
	sub	op_25,op_26,op_37
	sub	op_24,x0,op_25
	sub	op_1,op_2,op_24
	srli	op_0,op_1,16
	srli	op_68,a3,16
	lui	op_70,16
	addi	op_69,op_70,-1
	and	op_67,op_68,op_69
	lui	op_73,16
	addi	op_72,op_73,-1
	and	op_71,a2,op_72
	callmul	op_66,op_67,op_71
	srli	op_65,op_66,16
	lui	op_84,16
	addi	op_83,op_84,-1
	addi	op_87,x0,-1
	addi	op_90,x0,-1
	and	op_89,op_90,a3
	sub	op_88,op_89,a3
	sub	op_86,op_87,op_88
	addi	op_92,x0,-1
	and	op_91,op_92,a3
	sub	op_85,op_86,op_91
	and	op_82,op_83,op_85
	sub	op_81,x0,op_82
	sub	op_80,a3,op_81
	lui	op_94,16
	addi	op_93,op_94,-1
	sub	op_79,op_80,op_93
	sub	op_78,a3,op_79
	srli	op_96,a2,16
	lui	op_98,16
	addi	op_97,op_98,-1
	and	op_95,op_96,op_97
	callmul	op_77,op_78,op_95
	srli	op_76,op_77,16
	srli	op_102,a3,16
	lui	op_104,16
	addi	op_103,op_104,-1
	and	op_101,op_102,op_103
	srli	op_106,a2,16
	lui	op_108,16
	addi	op_107,op_108,-1
	and	op_105,op_106,op_107
	callmul	op_100,op_101,op_105
	sub	op_99,x0,op_100
	sub	op_75,op_76,op_99
	sub	op_74,x0,op_75
	sub	op_64,op_65,op_74
	sub	op_63,x0,op_64
	sub	a3,op_0,op_63
	sub	op_0,x0,a4
	sub	a4,a1,op_0
	addi	a2,a5,1
	bgeu	a2,a5,.+8
	jal	x0,12
	addi	a5,x0,0
	jal	x0,8
	addi	a5,x0,1
	sw	a2,%lo(bitcnts_rand_state)(a6)
	sub	op_0,x0,a4
	sub	a4,a3,op_0
	sub	op_0,x0,a5
	sub	a5,a4,op_0
	slli	a0,a5,1
	sw	a5,%lo(bitcnts_rand_state+4)(a6)
	srli	a0,a0,1
	jalr	zero,ra,0
	.size	rand, .-rand
	.align	2
	.globl	atoi
	.type	atoi, @function
atoi:
	lw	op_0,0(a0)
	addi	op_1,x0,255
	and	a2,op_0,op_1
	addi	a5,zero,45
	bne	a2,a5,.+8
	jal	x0,.L40
	addi	a5,zero,43
	addi	a6,zero,1
	bne	a2,a5,.+8
	jal	x0,.L41
.L33:
	addi	a3,a2,-48
	addi	op_0,x0,255
	and	a5,a3,op_0
	addi	a1,zero,9
	addi	a4,zero,0
	bgeu	a1,a5,.+8
	jal	x0,.L42
.L34:
	slli	a5,a4,2
	lw	op_1,0(a0)
	srli	op_0,op_1,8
	addi	op_2,x0,255
	and	a2,op_0,op_2
	sub	op_0,x0,a5
	sub	a5,a4,op_0
	slli	a5,a5,1
	sub	op_0,x0,a3
	sub	a4,a5,op_0
	addi	a3,a2,-48
	addi	op_4,x0,255
	addi	op_7,x0,-1
	addi	op_10,x0,-1
	and	op_9,op_10,a3
	sub	op_8,op_9,a3
	sub	op_6,op_7,op_8
	addi	op_12,x0,-1
	and	op_11,op_12,a3
	sub	op_5,op_6,op_11
	and	op_3,op_4,op_5
	sub	op_2,x0,op_3
	sub	op_1,a3,op_2
	addi	op_13,x0,255
	sub	op_0,op_1,op_13
	sub	a5,a3,op_0
	addi	a0,a0,1
	bgeu	a1,a5,.+8
	jal	x0,8
	jal	x0,.L34
	callmul	a0,a4,a6
	jalr	zero,ra,0
.L41:
	lw	op_1,0(a0)
	srli	op_0,op_1,8
	addi	op_2,x0,255
	and	a2,op_0,op_2
	addi	a1,zero,9
	sub	op_0,x0,a0
	sub	a0,a6,op_0
	addi	a3,a2,-48
	addi	op_4,x0,255
	addi	op_7,x0,-1
	addi	op_10,x0,-1
	and	op_9,op_10,a3
	sub	op_8,op_9,a3
	sub	op_6,op_7,op_8
	addi	op_12,x0,-1
	and	op_11,op_12,a3
	sub	op_5,op_6,op_11
	and	op_3,op_4,op_5
	sub	op_2,x0,op_3
	sub	op_1,a3,op_2
	addi	op_13,x0,255
	sub	op_0,op_1,op_13
	sub	a5,a3,op_0
	addi	a4,zero,0
	bgeu	a1,a5,.+8
	jal	x0,8
	jal	x0,.L34
.L42:
	addi	a0,zero,0
	jalr	zero,ra,0
.L40:
	lw	op_1,0(a0)
	srli	op_0,op_1,8
	addi	op_2,x0,255
	and	a2,op_0,op_2
	addi	a6,zero,-1
	addi	a0,a0,1
	jal	x0,.L33
	.size	atoi, .-atoi
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%-38s> Time: %4ld.%03ld sec.; Bits: %ld\n"
	.align	2
.LC1:
	.string	"\nBest  > %s\n"
	.align	2
.LC2:
	.string	"Worst > %s\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lw	a4,4(a1)
	addi	sp,sp,-112
	sw	ra,108(sp)
	sw	s0,104(sp)
	sw	s1,100(sp)
	sw	s2,96(sp)
	sw	s3,92(sp)
	sw	s4,88(sp)
	sw	s5,84(sp)
	sw	s6,80(sp)
	sw	s7,76(sp)
	sw	s8,72(sp)
	sw	s9,68(sp)
	sw	s10,64(sp)
	sw	s11,60(sp)
	lw	op_0,0(a4)
	addi	op_1,x0,255
	and	a5,op_0,op_1
	addi	a3,zero,45
	bne	a5,a3,.+8
	jal	x0,.L63
	addi	a5,a5,-43
	addi	op_0,x0,1
	bgeu	a5,op_0,.+8
	jal	x0,12
	addi	a5,x0,0
	jal	x0,8
	addi	a5,x0,1
	sub	op_0,x0,a4
	sub	a4,a5,op_0
	addi	s8,zero,1
.L45:
	lw	op_0,0(a4)
	addi	op_1,x0,255
	and	a1,op_0,op_1
	addi	a0,zero,9
	addi	a3,zero,0
	addi	a2,a1,-48
	addi	op_4,x0,255
	addi	op_7,x0,-1
	addi	op_10,x0,-1
	and	op_9,op_10,a2
	sub	op_8,op_9,a2
	sub	op_6,op_7,op_8
	addi	op_12,x0,-1
	and	op_11,op_12,a2
	sub	op_5,op_6,op_11
	and	op_3,op_4,op_5
	sub	op_2,x0,op_3
	sub	op_1,a2,op_2
	addi	op_13,x0,255
	sub	op_0,op_1,op_13
	sub	a5,a2,op_0
	bgeu	a0,a5,.+8
	jal	x0,.L47
.L46:
	slli	a5,a3,2
	lw	op_1,0(a4)
	srli	op_0,op_1,8
	addi	op_2,x0,255
	and	a1,op_0,op_2
	sub	op_0,x0,a5
	sub	a5,a3,op_0
	slli	a5,a5,1
	sub	op_0,x0,a2
	sub	a3,a5,op_0
	addi	a2,a1,-48
	addi	op_0,x0,255
	and	a5,a2,op_0
	addi	a4,a4,1
	bgeu	a0,a5,.L46
.L47:
	callmul	a5,s8,a3
	lui	s7,524288
	lui	s5,313688
	addi	s7,s7,-1
	addi	s5,s5,-211
	addi	s0,zero,0
	addi	s9,zero,0
	sw	zero,28(sp)
	sw	zero,24(sp)
	addi	s3,zero,0
	sw	a5,16(sp)
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	sw	a5,44(sp)
	addi	s6,a5,256
	lw	a5,16(sp)
	lw	a2,16(sp)
	sw	zero,20(sp)
	slli	a5,a2,1
	sub	op_0,x0,a5
	sub	a5,a2,op_0
	slli	a5,a5,2
	sub	op_0,x0,a5
	sub	a5,a2,op_0
	sw	a5,40(sp)
	lui	a5,361759
	addi	a5,a5,1069
	sw	a5,32(sp)
	lui	a5,274878
	addi	a5,a5,-381
	sw	a5,36(sp)
	lui	s4,%hi(bitcnts_rand_state)
	addi	s10,zero,1000
.L52:
.Lpcrel_1:
	auipc	ra,%pcrel_hi(clock)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
	lw	a3,%lo(bitcnts_rand_state)(s4)
	lw	a4,%lo(bitcnts_rand_state+4)(s4)
	lw	a5,32(sp)
	sw	a0,12(sp)
	callmul	a4,a4,s5
	callmul	a2,a3,a5
	callmul	a5,a3,s5
	sub	op_0,x0,a4
	sub	a4,a2,op_0
	lui	op_6,16
	addi	op_5,op_6,-1
	and	op_4,a3,op_5
	lui	op_9,16
	addi	op_8,op_9,-1
	and	op_7,s5,op_8
	callmul	op_3,op_4,op_7
	srli	op_2,op_3,16
	srli	op_15,a3,16
	lui	op_17,16
	addi	op_16,op_17,-1
	and	op_14,op_15,op_16
	lui	op_20,16
	addi	op_19,op_20,-1
	and	op_18,s5,op_19
	callmul	op_13,op_14,op_18
	lui	op_22,16
	addi	op_21,op_22,-1
	and	op_12,op_13,op_21
	lui	op_28,16
	addi	op_27,op_28,-1
	and	op_26,a3,op_27
	srli	op_30,s5,16
	lui	op_32,16
	addi	op_31,op_32,-1
	and	op_29,op_30,op_31
	callmul	op_25,op_26,op_29
	lui	op_34,16
	addi	op_33,op_34,-1
	and	op_24,op_25,op_33
	sub	op_23,x0,op_24
	sub	op_11,op_12,op_23
	sub	op_10,x0,op_11
	sub	op_1,op_2,op_10
	srli	op_0,op_1,16
	srli	op_40,a3,16
	lui	op_42,16
	addi	op_41,op_42,-1
	and	op_39,op_40,op_41
	lui	op_45,16
	addi	op_44,op_45,-1
	and	op_43,s5,op_44
	callmul	op_38,op_39,op_43
	srli	op_37,op_38,16
	lui	op_52,16
	addi	op_51,op_52,-1
	and	op_50,a3,op_51
	srli	op_54,s5,16
	lui	op_56,16
	addi	op_55,op_56,-1
	and	op_53,op_54,op_55
	callmul	op_49,op_50,op_53
	srli	op_48,op_49,16
	srli	op_60,a3,16
	lui	op_62,16
	addi	op_61,op_62,-1
	and	op_59,op_60,op_61
	srli	op_64,s5,16
	lui	op_66,16
	addi	op_65,op_66,-1
	and	op_63,op_64,op_65
	callmul	op_58,op_59,op_63
	sub	op_57,x0,op_58
	sub	op_47,op_48,op_57
	sub	op_46,x0,op_47
	sub	op_36,op_37,op_46
	sub	op_35,x0,op_36
	sub	a3,op_0,op_35
	addi	a2,a5,1
	bgeu	a2,a5,.+8
	jal	x0,12
	addi	a5,x0,0
	jal	x0,8
	addi	a5,x0,1
	sw	a2,%lo(bitcnts_rand_state)(s4)
	sub	op_0,x0,a4
	sub	a4,a3,op_0
	sub	op_0,x0,a5
	sub	a5,a4,op_0
	lw	a4,16(sp)
	sw	a5,%lo(bitcnts_rand_state+4)(s4)
	bge	zero,a4,.+8
	jal	x0,8
	jal	x0,.L55
	lui	a3,%hi(.LANCHOR0+284)
	slli	a4,s3,2
	addi	a3,a3,%lo(.LANCHOR0+284)
	sub	op_0,x0,a3
	sub	a4,a4,op_0
	lw	s2,0(a4)
	lui	a4,524288
	addi	a4,a4,-1
	and	s8,a5,a4
	lw	a5,40(sp)
	addi	s11,zero,0
	sub	op_0,x0,s8
	sub	s1,a5,op_0
.L49:
	lw	a5,%lo(bitcnts_rand_state)(s3)
	lw	a4,%lo(bitcnts_rand_state+4)(s3)
	lw	a3,28(sp)
	sw	a0,8(sp)
	callmul	a4,a4,s5
	callmul	a3,a5,a3
	sub	op_0,x0,a4
	sub	a4,a3,op_0
	lui	op_6,16
	addi	op_5,op_6,-1
	and	op_4,a5,op_5
	lui	op_9,16
	addi	op_8,op_9,-1
	and	op_7,s5,op_8
	callmul	op_3,op_4,op_7
	srli	op_2,op_3,16
	srli	op_15,a5,16
	lui	op_17,16
	addi	op_16,op_17,-1
	and	op_14,op_15,op_16
	lui	op_20,16
	addi	op_19,op_20,-1
	and	op_18,s5,op_19
	callmul	op_13,op_14,op_18
	lui	op_22,16
	addi	op_21,op_22,-1
	and	op_12,op_13,op_21
	lui	op_28,16
	addi	op_27,op_28,-1
	and	op_26,a5,op_27
	srli	op_30,s5,16
	lui	op_32,16
	addi	op_31,op_32,-1
	and	op_29,op_30,op_31
	callmul	op_25,op_26,op_29
	lui	op_34,16
	addi	op_33,op_34,-1
	and	op_24,op_25,op_33
	sub	op_23,x0,op_24
	sub	op_11,op_12,op_23
	sub	op_10,x0,op_11
	sub	op_1,op_2,op_10
	srli	op_0,op_1,16
	srli	op_40,a5,16
	lui	op_42,16
	addi	op_41,op_42,-1
	and	op_39,op_40,op_41
	lui	op_45,16
	addi	op_44,op_45,-1
	and	op_43,s5,op_44
	callmul	op_38,op_39,op_43
	srli	op_37,op_38,16
	lui	op_52,16
	addi	op_51,op_52,-1
	and	op_50,a5,op_51
	srli	op_54,s5,16
	lui	op_56,16
	addi	op_55,op_56,-1
	and	op_53,op_54,op_55
	callmul	op_49,op_50,op_53
	srli	op_48,op_49,16
	srli	op_60,a5,16
	lui	op_62,16
	addi	op_61,op_62,-1
	and	op_59,op_60,op_61
	srli	op_64,s5,16
	lui	op_66,16
	addi	op_65,op_66,-1
	and	op_63,op_64,op_65
	callmul	op_58,op_59,op_63
	sub	op_57,x0,op_58
	sub	op_47,op_48,op_57
	sub	op_46,x0,op_47
	sub	op_36,op_37,op_46
	sub	op_35,x0,op_36
	sub	a3,op_0,op_35
	callmul	a5,a5,s5
	sub	op_0,x0,a4
	sub	a4,a3,op_0
	addi	a3,a5,1
	bgeu	a3,a5,.+8
	jal	x0,12
	addi	a5,x0,0
	jal	x0,8
	addi	a5,x0,1
	sub	op_0,x0,a5
	sub	a5,a4,op_0
	lw	a4,24(sp)
	sw	a5,%lo(bitcnts_rand_state+4)(s3)
	sw	a3,%lo(bitcnts_rand_state)(s3)
	bge	zero,a4,.L56
	lw	a4,48(sp)
	lw	s2,0(s7)
	addi	s0,zero,0
	and	s9,a5,a4
	lw	a5,44(sp)
	sub	op_0,x0,s9
	sub	s1,a5,op_0
.L48:
.L50:
.L51:
.L55:
.L63:
	.size	main, .-main
	.section	.rodata.str1.4
	.align	2
.LC3:
	.string	"Optimized 1 bit/loop counter"
	.align	2
.LC4:
	.string	"Ratko's mystery algorithm"
	.align	2
.LC5:
	.string	"Recursive bit count by nybbles"
	.align	2
.LC6:
	.string	"Non-recursive bit count by nybbles"
	.align	2
.LC7:
	.string	"Non-recursive bit count by bytes (BW)"
	.align	2
.LC8:
	.string	"Non-recursive bit count by bytes (AR)"
	.align	2
.LC9:
	.string	"Shift and count bits"
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
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
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
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits


    .text
    .align 2
__mul:
.Mul_loop:
.Mul_skip:

.text
.align 2

# Signed 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_divsi3
__riscv_div_lib_divsi3:
    # Since the quotient is positive, fall into udivsi3

# Unsigned 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_udivsi3
__riscv_div_lib_udivsi3:
__riscv_div_lib_L1:
__riscv_div_lib_L2:
__riscv_div_lib_L3:
__riscv_div_lib_L4:
__riscv_div_lib_L5:

# Unsigned 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_umodsi3
__riscv_div_lib_umodsi3:

# Handle negative arguments to divsi3
__riscv_div_lib_L10:
__riscv_div_lib_L12:

# Signed 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_modsi3
__riscv_div_lib_modsi3:
__riscv_div_lib_L30:
__riscv_div_lib_L31:
__riscv_div_lib_L32:

# end of subrountine