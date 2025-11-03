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
	li	a5,1431654400
	addi	a5,a5,1365
	srli	a4,a0,1
	and	a4,a4,a5
	and	a0,a0,a5
	add	a4,a4,a0
	li	a3,858992640
	addi	a3,a3,819
	srli	a5,a4,2
	and	a5,a5,a3
	and	a4,a4,a3
	add	a5,a5,a4
	li	a3,252645376
	addi	a3,a3,-241
	srli	a4,a5,4
	and	a4,a4,a3
	and	a5,a5,a3
	add	a4,a4,a5
	li	a3,16711680
	addi	a3,a3,255
	srli	a5,a4,8
	and	a5,a5,a3
	and	a4,a4,a3
	add	a5,a5,a4
	slli	a0,a5,16
	srli	a0,a0,16
	srli	a5,a5,16
	add	a0,a5,a0
	ret
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
	ret
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
	ret
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
	ret
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
	li	a3,0
.L8:
	andi	a4,a5,15
	add	a4,a2,a4
	srai	a5,a5,4
	add	a3,a3,a0
	lbu	a0,0(a4)
	bne	a5,zero,.L8
	add	a0,a0,a3
.L6:
	ret
	.size	ntbl_bitcnt, .-ntbl_bitcnt
	.align	2
	.type	bit_shifter, @function
bit_shifter:
	mv	a5,a0
	li	a0,0
	beq	a5,zero,.L13
	li	a4,0
.L15:
	andi	a3,a5,1
	addi	a4,a4,1
	srai	a5,a5,1
	addi	a2,a4,-32
	add	a0,a0,a3
	beq	a5,zero,.L13
	bne	a2,zero,.L15
	ret
.L13:
	ret
	.size	bit_shifter, .-bit_shifter
	.align	2
	.globl	bit_count
	.type	bit_count, @function
bit_count:
	beq	a0,zero,.L23
	mv	a5,a0
	li	a0,0
.L24:
	addi	a4,a5,-1
	and	a5,a5,a4
	addi	a0,a0,1
	bne	a5,zero,.L24
.L23:
	ret
	.size	bit_count, .-bit_count
	.align	2
	.globl	srand
	.type	srand, @function
srand:
	lui	a5,%hi(bitcnts_rand_state)
	sw	a0,%lo(bitcnts_rand_state)(a5)
	sw	zero,%lo(bitcnts_rand_state+4)(a5)
	ret
	.size	srand, .-srand
	.align	2
	.globl	rand
	.type	rand, @function
rand:
	lui	a6,%hi(bitcnts_rand_state)
	lw	a3,%lo(bitcnts_rand_state)(a6)
	lw	a4,%lo(bitcnts_rand_state+4)(a6)
	li	a2,1284866048
	li	a1,1481764864
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
	ret
	.size	rand, .-rand
	.align	2
	.globl	atoi
	.type	atoi, @function
atoi:
	lbu	a2,0(a0)
	li	a5,45
	beq	a2,a5,.L40
	li	a5,43
	li	a6,1
	beq	a2,a5,.L41
.L33:
	addi	a3,a2,-48
	andi	a5,a3,0xff
	li	a1,9
	li	a4,0
	bgtu	a5,a1,.L42
.L34:
	slli	a5,a4,2
	lbu	a2,1(a0)
	add	a5,a5,a4
	slli	a5,a5,1
	add	a4,a3,a5
	addi	a3,a2,-48
	andi	a5,a3,0xff
	addi	a0,a0,1
	bleu	a5,a1,.L34
	mul	a0,a4,a6
	ret
.L41:
	lbu	a2,1(a0)
	li	a1,9
	add	a0,a0,a6
	addi	a3,a2,-48
	andi	a5,a3,0xff
	li	a4,0
	bleu	a5,a1,.L34
.L42:
	li	a0,0
	ret
.L40:
	lbu	a2,1(a0)
	li	a6,-1
	addi	a0,a0,1
	j	.L33
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
	li	a4,45
	beq	a5,a4,.L65
	addi	a5,a5,-43
	seqz	a5,a5
	add	a2,a2,a5
	li	a5,1
.L45:
	lbu	a1,0(a2)
	li	a6,9
	li	a4,0
	addi	a1,a1,-48
	andi	a3,a1,0xff
	bgtu	a3,a6,.L47
	mv	a3,a4
.L46:
	slli	a4,a3,2
	lbu	a0,1(a2)
	add	a4,a4,a3
	slli	a4,a4,1
	add	a3,a1,a4
	addi	a1,a0,-48
	andi	a4,a1,0xff
	addi	a2,a2,1
	bleu	a4,a6,.L46
	mv	a4,a3
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
	li	a5,1481764864
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
	li	a2,-2147483648
	li	s8,0
	li	s11,0
	addi	s6,a3,256
	addi	s7,a3,284
	li	s5,1284866048
	addi	a3,a1,%lo(.LC2)
	sw	a5,28(sp)
	addi	a5,a2,-1
	mv	s10,s8
	sw	s11,12(sp)
	sw	a3,40(sp)
	addi	s5,s5,-211
	sw	a5,48(sp)
	sw	zero,56(sp)
	sw	zero,52(sp)
	li	s4,0
	lui	s3,%hi(bitcnts_rand_state)
	sw	a7,24(sp)
	sw	a6,16(sp)
	sw	a4,20(sp)
.L52:
	call	clock
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
	ble	a4,zero,.L56
	lw	a4,48(sp)
	lw	s2,0(s7)
	li	s0,0
	and	s9,a5,a4
	lw	a5,44(sp)
	add	s1,s9,a5
.L49:
	mv	a0,s9
	jalr	s2
	addi	s9,s9,13
	add	s0,s0,a0
	bne	s1,s9,.L49
.L48:
	call	clock
	lw	a5,8(sp)
	sub	a0,a0,a5
	call	__floatunsidf
	lw	a2,32(sp)
	lw	a3,36(sp)
	call	__divdf3
	lw	a2,16(sp)
	lw	a3,20(sp)
	mv	s2,a0
	mv	s1,a1
	call	__ltdf2
	bge	a0,zero,.L50
	sw	s4,52(sp)
	sw	s2,16(sp)
	sw	s1,20(sp)
.L50:
	lw	a3,12(sp)
	mv	a2,s10
	mv	a0,s2
	mv	a1,s1
	call	__gtdf2
	ble	a0,zero,.L51
	sw	s4,56(sp)
	mv	s10,s2
	sw	s1,12(sp)
.L51:
	mv	a2,s8
	mv	a3,s11
	mv	a0,s2
	mv	a1,s1
	call	__adddf3
	mv	s8,a0
	mv	a0,s0
	mv	s9,a1
	call	__floatsidf
	mv	a2,s8
	mv	a3,s9
	call	__adddf3
	mv	s8,a0
	mv	s11,a1
	lw	a0,40(sp)
	lw	a1,0(s6)
	mv	a2,s2
	mv	a3,s1
	mv	a4,s0
	call	printf
	addi	s4,s4,1
	li	a5,7
	addi	s6,s6,4
	addi	s7,s7,4
	bne	s4,a5,.L52
	lw	a7,24(sp)
	lw	a0,16(sp)
	lw	a1,20(sp)
	mv	a2,s8
	mv	a3,s11
	sw	a7,8(sp)
	call	__adddf3
	mv	a3,a1
	lw	a1,12(sp)
	mv	a2,a0
	mv	a0,s10
	call	__adddf3
	lw	s2,52(sp)
	mv	s0,a0
	mv	s1,a1
	mv	a0,s2
	call	__floatsidf
	mv	a2,s0
	mv	a3,s1
	call	__adddf3
	lw	s3,56(sp)
	mv	s0,a0
	mv	s1,a1
	mv	a0,s3
	call	__floatsidf
	mv	a2,s0
	mv	a3,s1
	call	__adddf3
	mv	s0,a0
	lw	a0,8(sp)
	mv	s1,a1
	call	__floatsidf
	mv	a2,s0
	mv	a3,s1
	call	__adddf3
	lw	a4,60(sp)
	slli	a5,s2,2
	mv	s1,a1
	add	a5,a4,a5
	lw	a1,256(a5)
	mv	s0,a0
	lui	a5,%hi(bitcnts_checksum)
	lui	a0,%hi(.LC3)
	sw	s0,%lo(bitcnts_checksum)(a5)
	addi	a0,a0,%lo(.LC3)
	sw	s1,%lo(bitcnts_checksum+4)(a5)
	call	printf
	lw	a4,60(sp)
	slli	a5,s3,2
	lui	a0,%hi(.LC4)
	add	a5,a4,a5
	lw	a1,256(a5)
	addi	a0,a0,%lo(.LC4)
	call	printf
	mv	a0,s0
	mv	a1,s1
	li	a2,0
	li	a3,0
	call	__gtdf2
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
	jr	ra
.L56:
	li	s0,0
	j	.L48
.L65:
	addi	a2,a2,1
	li	a5,-1
	j	.L45
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
