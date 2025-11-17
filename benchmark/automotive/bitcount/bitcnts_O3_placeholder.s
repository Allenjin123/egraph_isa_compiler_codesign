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
	srli	a4,a5,4
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
	and	a2,op_0,a2
	lbu	t1,0(a1)
	sub	op_0,x0,a4
	sub	a2,a2,op_0
	lbu	a5,0(a5)
	srli	a1,a0,16
	addi	op_0,x0,15
	and	a3,a3,op_0
	lbu	a7,0(a2)
	sub	op_0,x0,a4
	sub	a3,a3,op_0
	srli	a2,a0,20
	addi	op_0,x0,15
	and	a1,a1,op_0
	lbu	a6,0(a3)
	sub	op_0,x0,a4
	sub	a1,a1,op_0
	srli	a3,a0,24
	addi	op_0,x0,15
	and	a2,op_0,a2
	lbu	a1,0(a1)
	sub	op_0,x0,a5
	sub	a5,t1,op_0
	sub	op_0,x0,a4
	sub	a2,a2,op_0
	addi	op_0,x0,15
	and	a3,op_0,a3
	lbu	a2,0(a2)
	sub	op_0,x0,a5
	sub	a5,a7,op_0
	sub	op_0,x0,a4
	sub	a3,a3,op_0
	srli	a0,a0,28
	lbu	a3,0(a3)
	sub	op_0,x0,a5
	sub	a5,a6,op_0
	sub	op_0,x0,a4
	sub	a4,a0,op_0
	lbu	a0,0(a4)
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
	lbu	a1,0(a4)
	sub	op_0,x0,a5
	sub	a3,a3,op_0
	lbu	a4,0(a2)
	addi	op_0,x0,255
	and	a0,op_0,a0
	lbu	a3,0(a3)
	sub	op_0,x0,a5
	sub	a5,a0,op_0
	lbu	a0,0(a5)
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
	and	a2,op_0,a0
	srli	a4,a0,16
	addi	op_0,x0,255
	and	a3,op_0,a3
	sub	op_0,x0,a5
	sub	a3,a3,op_0
	sub	op_0,x0,a5
	sub	a2,a2,op_0
	addi	op_0,x0,255
	and	a4,op_0,a4
	lbu	a3,0(a3)
	lbu	a2,0(a2)
	sub	op_0,x0,a5
	sub	a4,a4,op_0
	srli	a0,a0,24
	lbu	a4,0(a4)
	sub	op_0,x0,a5
	sub	a5,a0,op_0
	lbu	a0,0(a5)
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
	srai	a5,a0,4
	sub	op_0,x0,a2
	sub	a4,a4,op_0
	lbu	a0,0(a4)
	beq	a5,zero,.L6
	addi	a3,zero,0
.L8:
	addi	op_0,x0,15
	and	a4,op_0,a5
	sub	op_0,x0,a2
	sub	a4,a4,op_0
	srai	a5,a5,4
	sub	op_0,x0,a3
	sub	a3,a0,op_0
	lbu	a0,0(a4)
	beq	a5,zero,.+8
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
	beq	a5,zero,.L13
	addi	a4,zero,0
.L15:
	addi	op_0,x0,1
	and	a3,op_0,a5
	addi	a4,a4,1
	srai	a5,a5,1
	addi	a2,a4,-32
	sub	op_0,x0,a0
	sub	a0,a3,op_0
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
	callmul	a1,a3,a1
	callmul	a5,a3,a2
	callmul	a4,a4,a2
	lui	op_6,16
	addi	op_5,op_6,-1
	and	op_4,a3,op_5
	lui	op_9,16
	addi	op_8,op_9,-1
	and	op_7,a2,op_8
	callmul	op_3,op_4,op_7
	srli	op_2,op_3,16
	srli	op_15,a3,16
	lui	op_17,16
	addi	op_16,op_17,-1
	and	op_14,op_15,op_16
	lui	op_20,16
	addi	op_19,op_20,-1
	and	op_18,a2,op_19
	callmul	op_13,op_14,op_18
	lui	op_22,16
	addi	op_21,op_22,-1
	and	op_12,op_13,op_21
	lui	op_28,16
	addi	op_27,op_28,-1
	and	op_26,a3,op_27
	srli	op_30,a2,16
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
	and	op_43,a2,op_44
	callmul	op_38,op_39,op_43
	srli	op_37,op_38,16
	lui	op_52,16
	addi	op_51,op_52,-1
	and	op_50,a3,op_51
	srli	op_54,a2,16
	lui	op_56,16
	addi	op_55,op_56,-1
	and	op_53,op_54,op_55
	callmul	op_49,op_50,op_53
	srli	op_48,op_49,16
	srli	op_60,a3,16
	lui	op_62,16
	addi	op_61,op_62,-1
	and	op_59,op_60,op_61
	srli	op_64,a2,16
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
	sub	op_0,x0,a4
	sub	a4,a1,op_0
	addi	a2,a5,1
	bltu	a2,a5,.+12
	addi	a5,x0,0
	jal	x0,.+8
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
	lbu	a2,0(a0)
	addi	a5,zero,45
	beq	a2,a5,.L40
	addi	a5,zero,43
	addi	a6,zero,1
	beq	a2,a5,.L41
.L33:
	addi	a3,a2,-48
	addi	op_0,x0,255
	and	a5,op_0,a3
	addi	a1,zero,9
	addi	a4,zero,0
	bltu	a1,a5,.L42
.L34:
	slli	a5,a4,2
	lbu	a2,1(a0)
	sub	op_0,x0,a5
	sub	a5,a4,op_0
	slli	a5,a5,1
	sub	op_0,x0,a3
	sub	a4,a5,op_0
	addi	a3,a2,-48
	addi	op_0,x0,255
	and	a5,op_0,a3
	addi	a0,a0,1
	bltu	a1,a5,.+8
	jal	x0,.L34
	callmul	a0,a4,a6
	jalr	zero,ra,0
.L41:
	lbu	a2,1(a0)
	addi	a1,zero,9
	sub	op_0,x0,a0
	sub	a0,a6,op_0
	addi	a3,a2,-48
	addi	op_0,x0,255
	and	a5,a3,op_0
	addi	a4,zero,0
	bltu	a1,a5,.+8
	jal	x0,.L34
.L42:
	addi	a0,zero,0
	jalr	zero,ra,0
.L40:
	lbu	a2,1(a0)
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
	lbu	a5,0(a4)
	addi	a3,zero,45
	beq	a5,a3,.L63
	addi	a5,a5,-43
	addi	op_0,x0,1
	bltu	a5,op_0,.+12
	addi	a5,x0,0
	jal	x0,.+8
	addi	a5,x0,1
	sub	op_0,x0,a4
	sub	a4,a5,op_0
	addi	s8,zero,1
.L45:
	lbu	a1,0(a4)
	addi	a0,zero,9
	addi	a3,zero,0
	addi	a2,a1,-48
	addi	op_0,x0,255
	and	a5,op_0,a2
	bltu	a0,a5,.L47
.L46:
	slli	a5,a3,2
	lbu	a1,1(a4)
	sub	op_0,x0,a5
	sub	a5,a3,op_0
	slli	a5,a5,1
	sub	op_0,x0,a2
	sub	a3,a5,op_0
	addi	a2,a1,-48
	addi	op_0,x0,255
	and	a5,op_0,a2
	addi	a4,a4,1
	bltu	a0,a5,.+8
	jal	x0,.L46
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
	bltu	a2,a5,.+12
	addi	a5,x0,0
	jal	x0,.+8
	addi	a5,x0,1
	sw	a2,%lo(bitcnts_rand_state)(s4)
	sub	op_0,x0,a4
	sub	a4,a3,op_0
	sub	op_0,x0,a5
	sub	a5,a4,op_0
	lw	a4,16(sp)
	sw	a5,%lo(bitcnts_rand_state+4)(s4)
	blt	zero,a4,.+8
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
	addi	a0,s8,0
	jalr	ra,s2,0
	addi	s8,s8,13
	sub	op_0,x0,s11
	sub	s11,a0,op_0
	beq	s8,s1,.+8
	jal	x0,.L49
	addi	s1,s11,0
	srai	s2,s11,31
.L48:
.Lpcrel_2:
	auipc	ra,%pcrel_hi(clock)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_2)
	lw	a5,12(sp)
	lw	a4,36(sp)
	sub	a5,a0,a5
	callmul	a5,a5,s10
	lui	op_6,16
	addi	op_5,op_6,-1
	and	op_4,a5,op_5
	lui	op_9,16
	addi	op_8,op_9,-1
	and	op_7,a4,op_8
	callmul	op_3,op_4,op_7
	srli	op_2,op_3,16
	srli	op_15,a5,16
	lui	op_17,16
	addi	op_16,op_17,-1
	and	op_14,op_15,op_16
	lui	op_20,16
	addi	op_19,op_20,-1
	and	op_18,a4,op_19
	callmul	op_13,op_14,op_18
	lui	op_22,16
	addi	op_21,op_22,-1
	and	op_12,op_13,op_21
	lui	op_28,16
	addi	op_27,op_28,-1
	and	op_26,a5,op_27
	srli	op_30,a4,16
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
	and	op_43,a4,op_44
	callmul	op_38,op_39,op_43
	srli	op_37,op_38,16
	lui	op_52,16
	addi	op_51,op_52,-1
	and	op_50,a5,op_51
	srli	op_54,a4,16
	lui	op_56,16
	addi	op_55,op_56,-1
	and	op_53,op_54,op_55
	callmul	op_49,op_50,op_53
	srli	op_48,op_49,16
	srli	op_60,a5,16
	lui	op_62,16
	addi	op_61,op_62,-1
	and	op_59,op_60,op_61
	srli	op_64,a4,16
	lui	op_66,16
	addi	op_65,op_66,-1
	and	op_63,op_64,op_65
	callmul	op_58,op_59,op_63
	sub	op_57,x0,op_58
	sub	op_47,op_48,op_57
	sub	op_46,x0,op_47
	sub	op_36,op_37,op_46
	sub	op_35,x0,op_36
	sub	a5,op_0,op_35
	srli	a5,a5,18
	blt	a5,s7,.+8
	jal	x0,.L50
	sw	s3,24(sp)
	addi	s7,a5,0
.L50:
	lw	a4,20(sp)
	blt	a4,a5,.+8
	jal	x0,.L51
	sw	s3,28(sp)
	sw	a5,20(sp)
.L51:
	lui	a2,67109
	addi	a2,a2,-557
	lui	op_6,16
	addi	op_5,op_6,-1
	and	op_4,a5,op_5
	lui	op_9,16
	addi	op_8,op_9,-1
	and	op_7,a2,op_8
	callmul	op_3,op_4,op_7
	srli	op_2,op_3,16
	srli	op_15,a5,16
	lui	op_17,16
	addi	op_16,op_17,-1
	and	op_14,op_15,op_16
	lui	op_20,16
	addi	op_19,op_20,-1
	and	op_18,a2,op_19
	callmul	op_13,op_14,op_18
	lui	op_22,16
	addi	op_21,op_22,-1
	and	op_12,op_13,op_21
	lui	op_28,16
	addi	op_27,op_28,-1
	and	op_26,a5,op_27
	srli	op_30,a2,16
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
	and	op_43,a2,op_44
	callmul	op_38,op_39,op_43
	srli	op_37,op_38,16
	lui	op_52,16
	addi	op_51,op_52,-1
	and	op_50,a5,op_51
	srli	op_54,a2,16
	lui	op_56,16
	addi	op_55,op_56,-1
	and	op_53,op_54,op_55
	callmul	op_49,op_50,op_53
	srli	op_48,op_49,16
	srli	op_60,a5,16
	lui	op_62,16
	addi	op_61,op_62,-1
	and	op_59,op_60,op_61
	srli	op_64,a2,16
	lui	op_66,16
	addi	op_65,op_66,-1
	and	op_63,op_64,op_65
	callmul	op_58,op_59,op_63
	sub	op_57,x0,op_58
	sub	op_47,op_48,op_57
	sub	op_46,x0,op_47
	sub	op_36,op_37,op_46
	sub	op_35,x0,op_36
	sub	a2,op_0,op_35
	sub	op_0,x0,a5
	sub	s0,s0,op_0
	bltu	s0,a5,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	sub	op_0,x0,s0
	sub	s1,s1,op_0
	sub	op_0,x0,a3
	sub	a3,s9,op_0
	sub	op_0,x0,a3
	sub	a3,s2,op_0
	bltu	s1,s0,.+12
	addi	s0,x0,0
	jal	x0,.+8
	addi	s0,x0,1
	sub	op_0,x0,s0
	sub	s9,a3,op_0
	lw	a1,0(s6)
	lui	a0,%hi(.LC0)
	srli	a2,a2,6
	callmul	a3,a2,s10
	addi	a4,s11,0
	addi	a0,a0,%lo(.LC0)
	addi	s3,s3,1
	addi	s0,s1,0
	addi	s6,s6,4
	sub	a3,a5,a3
.Lpcrel_3:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_3)
	addi	a5,zero,7
	beq	s3,a5,.+8
	jal	x0,.L52
	lw	a3,20(sp)
	sub	op_0,x0,s7
	sub	a5,s1,op_0
	bltu	a5,s7,.+12
	addi	a4,x0,0
	jal	x0,.+8
	addi	a4,x0,1
	sub	op_0,x0,a3
	sub	a5,a5,op_0
	bltu	a5,a3,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	sub	op_0,x0,a4
	sub	a4,s9,op_0
	sub	op_0,x0,a3
	sub	a4,a4,op_0
	lw	a3,24(sp)
	lw	a2,28(sp)
	lui	a0,%hi(.LC1)
	sub	op_0,x0,a3
	sub	a5,a5,op_0
	srai	a3,a3,31
	sub	op_0,x0,a3
	sub	a4,a4,op_0
	lw	a3,24(sp)
	srai	a2,a2,31
	addi	a0,a0,%lo(.LC1)
	bltu	a5,a3,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	sub	op_0,x0,a3
	sub	a3,a4,op_0
	lw	a4,28(sp)
	sub	op_0,x0,a2
	sub	a2,a3,op_0
	lw	a3,44(sp)
	sub	op_0,x0,a4
	sub	a5,a5,op_0
	lw	a4,24(sp)
	slli	a4,a4,2
	sub	op_0,x0,a3
	sub	a4,a4,op_0
	lw	a3,28(sp)
	lw	a1,256(a4)
	lw	a4,16(sp)
	bltu	a5,a3,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	sub	op_0,x0,a3
	sub	a3,a2,op_0
	lw	a2,16(sp)
	sub	op_0,x0,a2
	sub	a5,a5,op_0
	srai	a4,a2,31
	bltu	a5,a2,.+12
	addi	s8,x0,0
	jal	x0,.+8
	addi	s8,x0,1
	addi	s0,a5,0
	sub	op_0,x0,a4
	sub	a5,a3,op_0
	sub	op_0,x0,s8
	sub	s1,a5,op_0
	lui	a5,%hi(bitcnts_checksum)
	sw	s0,%lo(bitcnts_checksum)(a5)
	sw	s1,%lo(bitcnts_checksum+4)(a5)
.Lpcrel_4:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_4)
	lw	a5,28(sp)
	lw	a4,44(sp)
	lui	a0,%hi(.LC2)
	slli	a5,a5,2
	sub	op_0,x0,a4
	sub	a5,a5,op_0
	lw	a1,256(a5)
	addi	a0,a0,%lo(.LC2)
.Lpcrel_5:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_5)
	lw	ra,108(sp)
	addi	op_0,x0,1
	bltu	s0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	lw	s0,104(sp)
	sub	a0,s1,a0
	and	op_1,s1,a0
	sub	op_0,op_1,a0
	sub	a0,s1,op_0
	lw	s2,96(sp)
	lw	s1,100(sp)
	lw	s3,92(sp)
	lw	s4,88(sp)
	lw	s5,84(sp)
	lw	s6,80(sp)
	lw	s7,76(sp)
	lw	s8,72(sp)
	lw	s9,68(sp)
	lw	s10,64(sp)
	lw	s11,60(sp)
	srli	a0,a0,31
	addi	sp,sp,112
	jalr	zero,ra,0
.L55:
	addi	s1,zero,0
	addi	s2,zero,0
	addi	s11,zero,0
	jal	x0,.L48
.L63:
	addi	a4,a4,1
	addi	s8,zero,-1
	jal	x0,.L45
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
	sub	op_0,x0,a0
	sub	a2,x0,op_0
	addi	a0,x0,0
.Mul_loop:
	addi	op_0,x0,1
	and	a3,a1,op_0
	beq	a3,x0,.Mul_skip
	sub	op_0,x0,a0
	sub	a0,a2,op_0
.Mul_skip:
	srli	a1,a1,1
	slli	a2,a2,1
	beq	a1,x0,.+8
	jal	x0,.Mul_loop
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
	beq	a2,zero,__riscv_div_lib_L5
	addi	a3,zero,1
	bltu	a2,a1,.+8
	jal	x0,__riscv_div_lib_L2
__riscv_div_lib_L1:
	blt	zero,a2,.+8
	jal	x0,__riscv_div_lib_L2
	slli	a2,a2,1
	slli	a3,a3,1
	bltu	a2,a1,__riscv_div_lib_L1
__riscv_div_lib_L2:
	addi	a0,zero,0
__riscv_div_lib_L3:
	bltu	a1,a2,__riscv_div_lib_L4
	sub	a1,a1,a2
	and	op_1,a0,a3
	sub	op_0,op_1,a3
	sub	a0,a0,op_0
__riscv_div_lib_L4:
	srli	a3,a3,1
	srli	a2,a2,1
	beq	a3,zero,.+8
	jal	x0,__riscv_div_lib_L3
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