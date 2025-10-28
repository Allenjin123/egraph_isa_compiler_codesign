	.file	"bitcnts.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	bit_shifter, @function
bit_shifter:
	mv	a5,a0
	li	a0,0
	beq	a5,zero,.L1
	li	a4,0
.L3:
	andi	a3,a5,1
	addi	a4,a4,1
	srai	a5,a5,1
	addi	a2,a4,-32
	add	a0,a0,a3
	beq	a5,zero,.L1
	bne	a2,zero,.L3
	ret
.L1:
	ret
	.size	bit_shifter, .-bit_shifter
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"Usage: bitcnts <iterations>\n"
	.align	2
.LC2:
	.string	"Bit counter algorithm benchmark\n"
	.align	2
.LC4:
	.string	"%-38s> Time: %7.3f sec.; Bits: %ld\n"
	.align	2
.LC5:
	.string	"\nBest  > %s\n"
	.align	2
.LC6:
	.string	"Worst > %s\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-96
	sw	ra,92(sp)
	sw	s0,88(sp)
	sw	s1,84(sp)
	sw	s2,80(sp)
	sw	s3,76(sp)
	sw	s4,72(sp)
	sw	s5,68(sp)
	sw	s6,64(sp)
	sw	s7,60(sp)
	sw	s8,56(sp)
	sw	s9,52(sp)
	sw	s10,48(sp)
	sw	s11,44(sp)
	li	a5,1
	ble	a0,a5,.L24
	lw	a0,4(a1)
	li	s3,0
	li	s8,0
	call	atoi
	mv	s0,a0
	sw	a0,8(sp)
	lui	a0,%hi(.LC2)
	addi	a0,a0,%lo(.LC2)
	call	puts
	lw	a3,8(sp)
	slli	a5,s0,1
	lui	a4,%hi(.LC0)
	add	a5,a5,a3
	lui	a3,%hi(.LANCHOR0)
	lw	s10,%lo(.LC0)(a4)
	lw	s9,%lo(.LC0+4)(a4)
	addi	a4,a3,%lo(.LANCHOR0)
	lw	a3,8(sp)
	slli	a5,a5,2
	sw	a4,28(sp)
	add	a5,a5,a3
	lui	a2,%hi(.LC3)
	sw	a5,16(sp)
	lw	a5,28(sp)
	lw	a1,%lo(.LC3)(a2)
	lw	a2,%lo(.LC3+4)(a2)
	lui	a4,%hi(.LC4)
	mv	s4,a5
	addi	s5,a5,28
	addi	a5,a4,%lo(.LC4)
	sw	a1,0(sp)
	sw	a2,4(sp)
	sw	a5,12(sp)
	li	s7,0
.L17:
	call	clock
	mv	s6,a0
	call	rand
	lw	a5,8(sp)
	mv	s11,a0
	ble	a5,zero,.L18
	lw	a5,16(sp)
	lw	s2,0(s5)
	li	s0,0
	add	s1,a0,a5
.L14:
	mv	a0,s11
	jalr	s2
	addi	s11,s11,13
	add	s0,s0,a0
	bne	s1,s11,.L14
.L13:
	call	clock
	sub	a0,a0,s6
	call	__floatunsidf
	lw	a2,0(sp)
	lw	a3,4(sp)
	call	__divdf3
	mv	a2,s10
	mv	a3,s9
	mv	s2,a0
	mv	s1,a1
	call	__ltdf2
	bge	a0,zero,.L15
	sw	s3,20(sp)
	mv	s10,s2
	mv	s9,s1
.L15:
	mv	a2,s8
	mv	a0,s2
	mv	a3,s7
	mv	a1,s1
	call	__gtdf2
	ble	a0,zero,.L16
	sw	s3,24(sp)
	mv	s8,s2
	mv	s7,s1
.L16:
	lw	a1,0(s4)
	lw	a0,12(sp)
	mv	a2,s2
	mv	a3,s1
	mv	a4,s0
	call	printf
	addi	s3,s3,1
	li	a5,7
	addi	s4,s4,4
	addi	s5,s5,4
	bne	s3,a5,.L17
	lw	a5,20(sp)
	lw	a4,28(sp)
	lui	a0,%hi(.LC5)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a1,0(a5)
	addi	a0,a0,%lo(.LC5)
	call	printf
	lw	a5,24(sp)
	lw	a4,28(sp)
	lui	a0,%hi(.LC6)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a1,0(a5)
	addi	a0,a0,%lo(.LC6)
	call	printf
	lw	ra,92(sp)
	lw	s0,88(sp)
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
	li	a0,0
	addi	sp,sp,96
	jr	ra
.L18:
	li	s0,0
	j	.L13
.L24:
	lui	a4,%hi(_impure_ptr)
	lw	a4,%lo(_impure_ptr)(a4)
	lui	a0,%hi(.LC1)
	mv	a1,a5
	lw	a3,12(a4)
	addi	a0,a0,%lo(.LC1)
	li	a2,28
	call	fwrite
	li	a0,-1
	call	exit
	.size	main, .-main
	.section	.rodata.str1.4
	.align	2
.LC7:
	.string	"Optimized 1 bit/loop counter"
	.align	2
.LC8:
	.string	"Ratko's mystery algorithm"
	.align	2
.LC9:
	.string	"Recursive bit count by nybbles"
	.align	2
.LC10:
	.string	"Non-recursive bit count by nybbles"
	.align	2
.LC11:
	.string	"Non-recursive bit count by bytes (BW)"
	.align	2
.LC12:
	.string	"Non-recursive bit count by bytes (AR)"
	.align	2
.LC13:
	.string	"Shift and count bits"
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	-1
	.word	2146435071
	.align	3
.LC3:
	.word	0
	.word	1093567616
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	text.0, @object
	.size	text.0, 28
text.0:
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
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
	.globl	__gtdf2
	.globl	__ltdf2
	.globl	__divdf3
	.globl	__floatunsidf
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
