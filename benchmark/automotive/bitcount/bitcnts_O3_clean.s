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
	lui	a5, 349525
	addi	a5,a5,1365
	srli	a4,a0,1
	and	a4,a4,a5
	and	a0,a0,a5
	add	a4,a4,a0
	lui	a3, 209715
	addi	a3,a3,819
	srli	a5,a4,2
	and	a5,a5,a3
	and	a4,a4,a3
	add	a5,a5,a4
	lui	a3, 61681
	addi	a3,a3,-241
	srli	a4,a5,4
	and	a4,a4,a3
	and	a5,a5,a3
	add	a4,a4,a5
	lui	a3, 4080
	addi	a3,a3,255
	srli	a5,a4,8
	and	a5,a5,a3
	and	a4,a4,a3
	add	a5,a5,a4
	slli	a0,a5,16
	srli	a0,a0,16
	srli	a5,a5,16
	add	a0,a5,a0
	jalr	zero, ra, 0
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
	jalr	zero, ra, 0
	.size	ntbl_bitcount, .-ntbl_bitcount
	.align	2
	.globl	BW_btbl_bitcount
	.type	BW_btbl_bitcount, @function
BW_btbl_bitcount:
	srli	a4,a0,8
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	andi	a2,a0,255
	andi	a4,a4,0xff
	add	a4,a5,a4
	add	a2,a5,a2
	srli	a3,a0,24
	srli	a0,a0,16
	lbu	a1,0(a4)
	add	a3,a5,a3
	lbu	a4,0(a2)
	andi	a0,a0,0xff
	lbu	a3,0(a3)
	add	a5,a5,a0
	lbu	a0,0(a5)
	add	a5,a4,a1
	add	a5,a5,a3
	add	a0,a5,a0
	jalr	zero, ra, 0
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
	andi	a3,a3,0xff
	add	a3,a5,a3
	add	a2,a5,a2
	andi	a4,a4,0xff
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
	jalr	zero, ra, 0
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
	addi	a3, zero, 0
.L8:
	andi	a4,a5,15
	add	a4,a2,a4
	srai	a5,a5,4
	add	a3,a3,a0
	lbu	a0,0(a4)
	bne	a5,zero,.L8
	add	a0,a0,a3
.L6:
	jalr	zero, ra, 0
	.size	ntbl_bitcnt, .-ntbl_bitcnt
	.align	2
	.type	bit_shifter, @function
bit_shifter:
	addi	a5, a0, 0
	addi	a0, zero, 0
	beq	a5,zero,.L13
	addi	a4, zero, 0
.L15:
	andi	a3,a5,1
	addi	a4,a4,1
	srai	a5,a5,1
	addi	a2,a4,-32
	add	a0,a0,a3
	beq	a5,zero,.L13
	bne	a2,zero,.L15
	jalr	zero, ra, 0
.L13:
	jalr	zero, ra, 0
	.size	bit_shifter, .-bit_shifter
	.align	2
	.globl	bit_count
	.type	bit_count, @function
bit_count:
	beq	a0,zero,.L23
	addi	a5, a0, 0
	addi	a0, zero, 0
.L24:
	addi	a4,a5,-1
	and	a5,a5,a4
	addi	a0,a0,1
	bne	a5,zero,.L24
.L23:
	jalr	zero, ra, 0
	.size	bit_count, .-bit_count
	.align	2
	.globl	srand
	.type	srand, @function
srand:
	lui	a5,%hi(bitcnts_rand_state)
	sw	a0,%lo(bitcnts_rand_state)(a5)
	sw	zero,%lo(bitcnts_rand_state+4)(a5)
	jalr	zero, ra, 0
	.size	srand, .-srand
	.align	2
	.globl	rand
	.type	rand, @function
rand:
	lui	a6,%hi(bitcnts_rand_state)
	lw	a3,%lo(bitcnts_rand_state)(a6)
	lw	a4,%lo(bitcnts_rand_state+4)(a6)
	lui	a2, 313688
	lui	a1, 361759
	addi	a2,a2,-211
	addi	a1,a1,1069
	mul	a1,a3,a1
	mul	a5,a3,a2
	mul	a4,a4,a2
	mulhu	a3,a3,a2
	add	a4,a4,a1
	addi	a2,a5,1
	sltu	a5,a2,a5
	sw	a2,%lo(bitcnts_rand_state)(a6)
	add	a4,a4,a3
	add	a5,a5,a4
	slli	a0,a5,1
	sw	a5,%lo(bitcnts_rand_state+4)(a6)
	srli	a0,a0,1
	jalr	zero, ra, 0
	.size	rand, .-rand
	.align	2
	.globl	atoi
	.type	atoi, @function
atoi:
	lbu	a2,0(a0)
	addi	a5, zero, 45
	beq	a2,a5,.L40
	addi	a5, zero, 43
	addi	a6, zero, 1
	beq	a2,a5,.L41
.L33:
	addi	a3,a2,-48
	andi	a5,a3,0xff
	addi	a1, zero, 9
	addi	a4, zero, 0
	bltu	a1, a5, .L42
.L34:
	slli	a5,a4,2
	lbu	a2,1(a0)
	add	a5,a5,a4
	slli	a5,a5,1
	add	a4,a3,a5
	addi	a3,a2,-48
	andi	a5,a3,0xff
	addi	a0,a0,1
	bgeu	a1, a5, .L34
	mul	a0,a4,a6
	jalr	zero, ra, 0
.L41:
	lbu	a2,1(a0)
	addi	a1, zero, 9
	add	a0,a0,a6
	addi	a3,a2,-48
	andi	a5,a3,0xff
	addi	a4, zero, 0
	bgeu	a1, a5, .L34
.L42:
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L40:
	lbu	a2,1(a0)
	addi	a6, zero, -1
	addi	a0,a0,1
	jal	zero, .L33
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
	addi	a4, zero, 45
	beq	a5,a4,.L65
	addi	a5,a5,-43
	sltiu	a5, a5, 1
	add	a2,a2,a5
	addi	a5, zero, 1
.L45:
	lbu	a1,0(a2)
	addi	a6, zero, 9
	addi	a4, zero, 0
	addi	a1,a1,-48
	andi	a3,a1,0xff
	bltu	a6, a3, .L47
	addi	a3, a4, 0
.L46:
	slli	a4,a3,2
	lbu	a0,1(a2)
	add	a4,a4,a3
	slli	a4,a4,1
	add	a3,a1,a4
	addi	a1,a0,-48
	andi	a4,a1,0xff
	addi	a2,a2,1
	bgeu	a6, a4, .L46
	addi	a4, a3, 0
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
	lui	a5, 361759
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
	lui	a2, 524288
	addi	s8, zero, 0
	addi	s11, zero, 0
	addi	s6,a3,256
	addi	s7,a3,284
	lui	s5, 313688
	addi	a3,a1,%lo(.LC2)
	sw	a5,28(sp)
	addi	a5,a2,-1
	addi	s10, s8, 0
	sw	s11,12(sp)
	sw	a3,40(sp)
	addi	s5,s5,-211
	sw	a5,48(sp)
	sw	zero,56(sp)
	sw	zero,52(sp)
	addi	s4, zero, 0
	lui	s3,%hi(bitcnts_rand_state)
	sw	a7,24(sp)
	sw	a6,16(sp)
	sw	a4,20(sp)
.L52:
.Lpcrel_1:
	auipc	ra, %pcrel_hi(clock)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_1)
	lw	a5,%lo(bitcnts_rand_state)(s3)
	lw	a4,%lo(bitcnts_rand_state+4)(s3)
	lw	a3,28(sp)
	sw	a0,8(sp)
	mul	a4,a4,s5
	mul	a3,a5,a3
	add	a4,a4,a3
	mulhu	a3,a5,s5
	mul	a5,a5,s5
	add	a4,a4,a3
	addi	a3,a5,1
	sltu	a5,a3,a5
	add	a5,a5,a4
	lw	a4,24(sp)
	sw	a5,%lo(bitcnts_rand_state+4)(s3)
	sw	a3,%lo(bitcnts_rand_state)(s3)
	bge	zero, a4, .L56
	lw	a4,48(sp)
	lw	s2,0(s7)
	addi	s0, zero, 0
	and	s9,a5,a4
	lw	a5,44(sp)
	add	s1,s9,a5
.L49:
	addi	a0, s9, 0
	jalr	s2
	addi	s9,s9,13
	add	s0,s0,a0
	bne	s1,s9,.L49
.L48:
.Lpcrel_2:
	auipc	ra, %pcrel_hi(clock)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_2)
	lw	a5,8(sp)
	sub	a0,a0,a5
.Lpcrel_3:
	auipc	ra, %pcrel_hi(__floatunsidf)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_3)
	lw	a2,32(sp)
	lw	a3,36(sp)
.Lpcrel_4:
	auipc	ra, %pcrel_hi(__divdf3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_4)
	lw	a2,16(sp)
	lw	a3,20(sp)
	addi	s2, a0, 0
	addi	s1, a1, 0
.Lpcrel_5:
	auipc	ra, %pcrel_hi(__ltdf2)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_5)
	bge	a0,zero,.L50
	sw	s4,52(sp)
	sw	s2,16(sp)
	sw	s1,20(sp)
.L50:
	lw	a3,12(sp)
	addi	a2, s10, 0
	addi	a0, s2, 0
	addi	a1, s1, 0
.Lpcrel_6:
	auipc	ra, %pcrel_hi(__gtdf2)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_6)
	bge	zero, a0, .L51
	sw	s4,56(sp)
	addi	s10, s2, 0
	sw	s1,12(sp)
.L51:
	addi	a2, s8, 0
	addi	a3, s11, 0
	addi	a0, s2, 0
	addi	a1, s1, 0
.Lpcrel_7:
	auipc	ra, %pcrel_hi(__adddf3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_7)
	addi	s8, a0, 0
	addi	a0, s0, 0
	addi	s9, a1, 0
.Lpcrel_8:
	auipc	ra, %pcrel_hi(__floatsidf)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_8)
	addi	a2, s8, 0
	addi	a3, s9, 0
.Lpcrel_9:
	auipc	ra, %pcrel_hi(__adddf3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_9)
	addi	s8, a0, 0
	addi	s11, a1, 0
	lw	a0,40(sp)
	lw	a1,0(s6)
	addi	a2, s2, 0
	addi	a3, s1, 0
	addi	a4, s0, 0
.Lpcrel_10:
	auipc	ra, %pcrel_hi(printf)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_10)
	addi	s4,s4,1
	addi	a5, zero, 7
	addi	s6,s6,4
	addi	s7,s7,4
	bne	s4,a5,.L52
	lw	a7,24(sp)
	lw	a0,16(sp)
	lw	a1,20(sp)
	addi	a2, s8, 0
	addi	a3, s11, 0
	sw	a7,8(sp)
.Lpcrel_11:
	auipc	ra, %pcrel_hi(__adddf3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_11)
	addi	a3, a1, 0
	lw	a1,12(sp)
	addi	a2, a0, 0
	addi	a0, s10, 0
.Lpcrel_12:
	auipc	ra, %pcrel_hi(__adddf3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_12)
	lw	s2,52(sp)
	addi	s0, a0, 0
	addi	s1, a1, 0
	addi	a0, s2, 0
.Lpcrel_13:
	auipc	ra, %pcrel_hi(__floatsidf)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_13)
	addi	a2, s0, 0
	addi	a3, s1, 0
.Lpcrel_14:
	auipc	ra, %pcrel_hi(__adddf3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_14)
	lw	s3,56(sp)
	addi	s0, a0, 0
	addi	s1, a1, 0
	addi	a0, s3, 0
.Lpcrel_15:
	auipc	ra, %pcrel_hi(__floatsidf)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_15)
	addi	a2, s0, 0
	addi	a3, s1, 0
.Lpcrel_16:
	auipc	ra, %pcrel_hi(__adddf3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_16)
	addi	s0, a0, 0
	lw	a0,8(sp)
	addi	s1, a1, 0
.Lpcrel_17:
	auipc	ra, %pcrel_hi(__floatsidf)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_17)
	addi	a2, s0, 0
	addi	a3, s1, 0
.Lpcrel_18:
	auipc	ra, %pcrel_hi(__adddf3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_18)
	lw	a4,60(sp)
	slli	a5,s2,2
	addi	s1, a1, 0
	add	a5,a4,a5
	lw	a1,256(a5)
	addi	s0, a0, 0
	lui	a5,%hi(bitcnts_checksum)
	lui	a0,%hi(.LC3)
	sw	s0,%lo(bitcnts_checksum)(a5)
	addi	a0,a0,%lo(.LC3)
	sw	s1,%lo(bitcnts_checksum+4)(a5)
.Lpcrel_19:
	auipc	ra, %pcrel_hi(printf)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_19)
	lw	a4,60(sp)
	slli	a5,s3,2
	lui	a0,%hi(.LC4)
	add	a5,a4,a5
	lw	a1,256(a5)
	addi	a0,a0,%lo(.LC4)
.Lpcrel_20:
	auipc	ra, %pcrel_hi(printf)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_20)
	addi	a0, s0, 0
	addi	a1, s1, 0
	addi	a2, zero, 0
	addi	a3, zero, 0
.Lpcrel_21:
	auipc	ra, %pcrel_hi(__gtdf2)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_21)
	lw	ra,124(sp)
	lw	s0,120(sp)
	lw	s1,116(sp)
	lw	s2,112(sp)
	lw	s3,108(sp)
	lw	s4,104(sp)
	lw	s5,100(sp)
	lw	s6,96(sp)
	lw	s7,92(sp)
	lw	s8,88(sp)
	lw	s9,84(sp)
	lw	s10,80(sp)
	lw	s11,76(sp)
	slti	a0,a0,1
	addi	sp,sp,128
	jalr	zero, ra, 0
.L56:
	addi	s0, zero, 0
	jal	zero, .L48
.L65:
	addi	a2,a2,1
	addi	a5, zero, -1
	jal	zero, .L45
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
