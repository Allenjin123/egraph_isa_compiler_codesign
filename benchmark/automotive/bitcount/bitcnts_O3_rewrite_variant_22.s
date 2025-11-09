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
	add	a4,a4,a0
	lui	a3,209715
	addi	a3,a3,819
	srli	a5,a4,2
	and	a5,a5,a3
	and	a4,a4,a3
	add	a5,a5,a4
	lui	a3,61681
	addi	a3,a3,-241
	srli	a0,a5,2
	srli	a4,a0,2
	and	a4,a4,a3
	and	a5,a5,a3
	add	a4,a4,a5
	lui	a3,4080
	addi	a3,a3,255
	srli	a5,a4,8
	and	a5,a5,a3
	and	a4,a4,a3
	add	a5,a5,a4
	slli	a0,a5,16
	srli	a0,a0,16
	srli	a5,a5,16
	add	a0,a5,a0
	jalr	zero,ra,0
	.size	bitcount, .-bitcount
	.align	2
	.globl	ntbl_bitcount
	.type	ntbl_bitcount, @function
ntbl_bitcount:
	srli	a5,a0,4
	lui	a4,%hi(.LANCHOR0)
	addi	a4,a4,%lo(.LANCHOR0)
	andi	a1,a0,15
	srli	a2,a0,8
	andi	a5,a5,15
	add	a1,a4,a1
	add	a5,a4,a5
	srli	a3,a0,12
	andi	a2,a2,15
	lbu	t1,0(a1)
	add	a2,a4,a2
	lbu	a5,0(a5)
	srli	a1,a0,16
	andi	a3,a3,15
	lbu	a7,0(a2)
	add	a3,a4,a3
	srli	a2,a0,20
	andi	a1,a1,15
	lbu	a6,0(a3)
	add	a1,a4,a1
	srli	a3,a0,24
	andi	a2,a2,15
	lbu	a1,0(a1)
	add	a5,a5,t1
	add	a2,a4,a2
	andi	a3,a3,15
	lbu	a2,0(a2)
	add	a5,a5,a7
	add	a3,a4,a3
	srli	a0,a0,28
	lbu	a3,0(a3)
	add	a5,a5,a6
	add	a4,a4,a0
	lbu	a0,0(a4)
	add	a5,a5,a1
	add	a5,a5,a2
	add	a5,a5,a3
	add	a0,a5,a0
	jalr	zero,ra,0
	.size	ntbl_bitcount, .-ntbl_bitcount
	.align	2
	.globl	BW_btbl_bitcount
	.type	BW_btbl_bitcount, @function
BW_btbl_bitcount:
	srli	a4,a0,8
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	andi	a2,a0,255
	andi	a4,a4,255
	add	a4,a5,a4
	add	a2,a5,a2
	srli	a3,a0,24
	srli	a0,a0,16
	lbu	a1,0(a4)
	add	a3,a5,a3
	lbu	a4,0(a2)
	andi	a0,a0,255
	lbu	a3,0(a3)
	add	a5,a5,a0
	lbu	a0,0(a5)
	add	a5,a4,a1
	add	a5,a5,a3
	add	a0,a5,a0
	jalr	zero,ra,0
	.size	BW_btbl_bitcount, .-BW_btbl_bitcount
	.align	2
	.globl	AR_btbl_bitcount
	.type	AR_btbl_bitcount, @function
AR_btbl_bitcount:
	srli	a3,a0,8
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	andi	a2,a0,255
	srli	a4,a0,16
	andi	a3,a3,255
	add	a3,a5,a3
	add	a2,a5,a2
	andi	a4,a4,255
	lbu	a3,0(a3)
	lbu	a2,0(a2)
	add	a4,a5,a4
	srli	a0,a0,24
	lbu	a4,0(a4)
	add	a5,a5,a0
	lbu	a0,0(a5)
	add	a3,a3,a2
	add	a4,a4,a3
	add	a0,a0,a4
	jalr	zero,ra,0
	.size	AR_btbl_bitcount, .-AR_btbl_bitcount
	.align	2
	.globl	ntbl_bitcnt
	.type	ntbl_bitcnt, @function
ntbl_bitcnt:
	lui	a2,%hi(.LANCHOR0)
	andi	a4,a0,15
	addi	a2,a2,%lo(.LANCHOR0)
	srai	a5,a0,4
	add	a4,a2,a4
	lbu	a0,0(a4)
	beq	a5,zero,.L6
	addi	a3,zero,0
.L8:
	andi	a4,a5,15
	add	a4,a2,a4
	srai	a5,a5,4
	add	a3,a3,a0
	lbu	a0,0(a4)
	beq	a5,zero,.+8
	jal	x0,.L8
	add	a0,a0,a3
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
	andi	a3,a5,1
	addi	a4,a4,1
	srai	a5,a5,1
	addi	a2,a4,-32
	add	a0,a0,a3
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
	srli	t0,a3,16
	srli	t1,a2,16
	mul	a7,t0,t1
	andi	t6,a3,65535
	srli	zero,a2,16
	mul	t5,t6,zero
	srli	op_10_1,a3,16
	andi	op_10_2,a2,65535
	mul	op_10_0,op_10_1,op_10_2
	add	t4,t5,op_10_0
	andi	op_10_5,a3,65535
	andi	op_10_6,a2,65535
	mul	op_10_4,op_10_5,op_10_6
	srli	op_10_3,op_10_4,16
	add	t3,t4,op_10_3
	srli	t2,t3,16
	add	a0,a7,t2
	andi	op_10_12,a3,65535
	srli	op_10_13,a2,16
	mul	op_10_11,op_10_12,op_10_13
	srli	op_10_15,a3,16
	andi	op_10_16,a2,65535
	mul	op_10_14,op_10_15,op_10_16
	add	op_10_10,op_10_11,op_10_14
	andi	op_10_18,a3,65535
	srli	op_10_19,a2,16
	mul	op_10_17,op_10_18,op_10_19
	sltu	op_10_9,op_10_10,op_10_17
	andi	op_10_24,a3,65535
	srli	op_10_25,a2,16
	mul	op_10_23,op_10_24,op_10_25
	srli	op_10_27,a3,16
	andi	op_10_28,a2,65535
	mul	op_10_26,op_10_27,op_10_28
	add	op_10_22,op_10_23,op_10_26
	andi	op_10_31,a3,65535
	andi	op_10_32,a2,65535
	mul	op_10_30,op_10_31,op_10_32
	srli	op_10_29,op_10_30,16
	add	op_10_21,op_10_22,op_10_29
	andi	op_10_35,a3,65535
	andi	op_10_36,a2,65535
	mul	op_10_34,op_10_35,op_10_36
	srli	op_10_33,op_10_34,16
	sltu	op_10_20,op_10_21,op_10_33
	or	op_10_8,op_10_9,op_10_20
	slli	op_10_7,op_10_8,16
	add	a3,a0,op_10_7
	add	a4,a4,a1
	addi	a2,a5,1
	sltu	a5,a2,a5
	sw	a2,%lo(bitcnts_rand_state)(a6)
	add	a4,a4,a3
	add	a5,a5,a4
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
	andi	a5,a3,255
	addi	a1,zero,9
	addi	a4,zero,0
	bgeu	a5,a1,.L42
.L34:
	slli	a5,a4,2
	lbu	a2,1(a0)
	add	a5,a5,a4
	slli	a5,a5,1
	add	a4,a3,a5
	addi	a3,a2,-48
	andi	a5,a3,255
	addi	a0,a0,1
	bgeu	a1,a5,.L34
	mul	a0,a4,a6
	jalr	zero,ra,0
.L41:
	lbu	a2,1(a0)
	addi	a1,zero,9
	add	a0,a0,a6
	addi	a3,a2,-48
	andi	a5,a3,255
	addi	a4,zero,0
	bgeu	a1,a5,.L34
.L42:
	addi	a0,zero,0
	jalr	zero,ra,0
.L40:
	lbu	a2,1(a0)
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
	lbu	a5,0(a2)
	addi	a4,zero,45
	beq	a5,a4,.L65
	addi	a5,a5,-43
	addi	a1,x0,1
	sltu	a5,a5,a1
	add	a2,a2,a5
	addi	a5,zero,1
.L45:
	lbu	a1,0(a2)
	addi	a6,zero,9
	addi	a4,zero,0
	addi	a1,a1,-48
	andi	a3,a1,255
	bgeu	a3,a6,.L47
	addi	a3,a4,0
.L46:
	slli	a4,a3,2
	lbu	a0,1(a2)
	add	a4,a4,a3
	slli	a4,a4,1
	add	a3,a1,a4
	addi	a1,a0,-48
	andi	a4,a1,255
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
	add	a3,a3,a7
	slli	a3,a3,2
	add	a3,a3,a7
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
	add	a4,a4,a3
	srli	a6,a5,16
	srli	a7,s5,16
	mul	a3,a6,a7
	andi	t4,a5,65535
	srli	t5,s5,16
	mul	t3,t4,t5
	srli	op_7_0,a5,16
	andi	op_7_1,s5,65535
	mul	t6,op_7_0,op_7_1
	add	t2,t3,t6
	andi	op_7_4,a5,65535
	andi	op_7_5,s5,65535
	mul	op_7_3,op_7_4,op_7_5
	srli	op_7_2,op_7_3,16
	add	t1,t2,op_7_2
	srli	t0,t1,16
	add	a2,a3,t0
	andi	op_7_11,a5,65535
	srli	op_7_12,s5,16
	mul	op_7_10,op_7_11,op_7_12
	srli	op_7_14,a5,16
	andi	op_7_15,s5,65535
	mul	op_7_13,op_7_14,op_7_15
	add	op_7_9,op_7_10,op_7_13
	andi	op_7_17,a5,65535
	srli	op_7_18,s5,16
	mul	op_7_16,op_7_17,op_7_18
	sltu	op_7_8,op_7_9,op_7_16
	andi	op_7_23,a5,65535
	srli	op_7_24,s5,16
	mul	op_7_22,op_7_23,op_7_24
	srli	op_7_26,a5,16
	andi	op_7_27,s5,65535
	mul	op_7_25,op_7_26,op_7_27
	add	op_7_21,op_7_22,op_7_25
	andi	op_7_30,a5,65535
	andi	op_7_31,s5,65535
	mul	op_7_29,op_7_30,op_7_31
	srli	op_7_28,op_7_29,16
	add	op_7_20,op_7_21,op_7_28
	andi	op_7_34,a5,65535
	andi	op_7_35,s5,65535
	mul	op_7_33,op_7_34,op_7_35
	srli	op_7_32,op_7_33,16
	sltu	op_7_19,op_7_20,op_7_32
	or	op_7_7,op_7_8,op_7_19
	slli	op_7_6,op_7_7,16
	add	a3,a2,op_7_6
	mul	a5,a5,s5
	add	a4,a4,a3
	addi	a3,a5,1
	sltu	a5,a3,a5
	add	a5,a5,a4
	lw	a4,24(sp)
	sw	a5,%lo(bitcnts_rand_state+4)(s3)
	sw	a3,%lo(bitcnts_rand_state)(s3)
	bge	zero,a4,.L56
	lw	a4,48(sp)
	lw	s2,0(s7)
	addi	s0,zero,0
	and	s9,a5,a4
	lw	a5,44(sp)
	add	s1,s9,a5
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
