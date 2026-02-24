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
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-96
	li	a3,1481764864
	li	a4,974848
	li	a5,1125900288
	sw	s6,64(sp)
	sw	s7,60(sp)
	sw	s8,56(sp)
	lui	s7,%hi(.LANCHOR0+256)
	li	s8,-2147483648
	li	s6,1284866048
	addi	a3,a3,1069
	addi	a4,a4,152
	addi	a5,a5,-381
	sw	s2,80(sp)
	sw	s3,76(sp)
	sw	s4,72(sp)
	sw	s5,68(sp)
	sw	s9,52(sp)
	sw	ra,92(sp)
	sw	s0,88(sp)
	sw	s1,84(sp)
	sw	s10,48(sp)
	sw	s11,44(sp)
	addi	s8,s8,-1
	addi	s7,s7,%lo(.LANCHOR0+256)
	addi	s6,s6,-211
	sw	a3,12(sp)
	sw	a4,16(sp)
	sw	a5,20(sp)
	li	s2,0
	li	s3,0
	sw	zero,28(sp)
	sw	zero,24(sp)
	li	s5,0
	li	s9,0
	lui	s4,%hi(bitcnts_rand_state)
.L47:
	call	clock
	lw	a2,%lo(bitcnts_rand_state)(s4)
	lw	a3,%lo(bitcnts_rand_state+4)(s4)
	lw	a5,12(sp)
	lw	s1,0(s7)
	mul	a3,a3,s6
	sw	a0,8(sp)
	li	s11,0
	mul	a1,a2,a5
	mul	a5,a2,s6
	add	a3,a3,a1
	mulhu	a2,a2,s6
	addi	a1,a5,1
	sltu	a5,a1,a5
	sw	a1,%lo(bitcnts_rand_state)(s4)
	add	a3,a3,a2
	add	a3,a5,a3
	li	a5,-2147483648
	addi	a5,a5,-1
	and	s10,a3,a5
	lw	a5,16(sp)
	sw	a3,%lo(bitcnts_rand_state+4)(s4)
	add	s0,s10,a5
.L44:
	mv	a0,s10
	jalr	s1
	addi	s10,s10,13
	add	s11,s11,a0
	bne	s10,s0,.L44
	call	clock
	lw	a5,8(sp)
	li	a4,1000
	sub	a5,a0,a5
	mul	a5,a5,a4
	lw	a4,20(sp)
	mulhu	a5,a5,a4
	srli	a5,a5,18
	bge	a5,s8,.L45
	sw	s5,24(sp)
	mv	s8,a5
.L45:
	ble	a5,s9,.L46
	sw	s5,28(sp)
	mv	s9,a5
.L46:
	add	s2,a5,s2
	sltu	a5,s2,a5
	add	a5,a5,s3
	add	s2,s11,s2
	srai	s3,s11,31
	add	s3,s3,a5
	sltu	a4,s2,s11
	addi	s5,s5,1
	li	a5,7
	addi	s7,s7,4
	add	s3,a4,s3
	bne	s5,a5,.L47
	lw	a3,24(sp)
	add	a5,s8,s2
	sltu	a4,a5,s8
	add	a5,s9,a5
	sltu	s9,a5,s9
	add	a4,a4,s3
	add	a4,s9,a4
	add	a5,a3,a5
	srai	a3,a3,31
	add	a3,a3,a4
	lw	a4,24(sp)
	li	a1,73728
	addi	a1,a1,1272
	sltu	a4,a5,a4
	add	a4,a4,a3
	lw	a3,28(sp)
	lw	ra,92(sp)
	lw	s0,88(sp)
	add	a5,a3,a5
	srai	a3,a3,31
	add	a3,a3,a4
	lw	a4,28(sp)
	add	a1,a5,a1
	seqz	a0,a1
	sltu	a4,a5,a4
	add	a4,a4,a3
	sltu	a5,a1,a5
	add	a3,a5,a4
	lui	a5,%hi(bitcnts_checksum)
	sw	a1,%lo(bitcnts_checksum)(a5)
	sub	a0,a3,a0
	or	a0,a3,a0
	sw	a3,%lo(bitcnts_checksum+4)(a5)
	lw	s1,84(sp)
	lw	s2,80(sp)
	lw	s3,76(sp)
	lw	s4,72(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	lw	s7,60(sp)
	lw	s8,56(sp)
	lw	s9,52(sp)
	lw	s10,48(sp)
	lw	s11,44(sp)
	srli	a0,a0,31
	addi	sp,sp,96
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	bit_count_table, @object
	.size	bit_count_table, 256
bit_count_table:
	.base64	"AAEBAgECAgMBAgIDAgMDBAECAgMCAwMEAgMDBAMEBAUBAgIDAgMDBAIDAwQDBAQFAgMDBAMEBAUDBAQFBAUFBgECAgMCAwMEAgMDBAMEBAUCAwMEAwQEBQMEBAUEBQUGAgMDBAMEBAUDBAQFBAUFBgMEBAUEBQUGBAUFBgUGBgcBAgIDAgMDBAIDAwQDBAQFAgMDBAMEBAUDBAQFBAUFBgIDAwQDBAQFAwQEBQQFBQYDBAQFBAUFBgQFBQYFBgYHAgMDBAMEBAUDBAQFBAUFBgMEBAUEBQUGBAUFBgUGBgcDBAQFBAUFBgQFBQYFBgYHBAUFBgUGBgcFBgYHBgcH"
	.ascii	"\b"
	.type	pBitCntFunc.0, @object
	.size	pBitCntFunc.0, 28
pBitCntFunc.0:
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
