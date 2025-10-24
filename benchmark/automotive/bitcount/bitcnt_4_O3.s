	.file	"bitcnt_4.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
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
	beq	a5,zero,.L1
	li	a3,0
.L3:
	andi	a4,a5,15
	add	a4,a2,a4
	srai	a5,a5,4
	add	a3,a3,a0
	lbu	a0,0(a4)
	bne	a5,zero,.L3
	add	a0,a0,a3
.L1:
	ret
	.size	ntbl_bitcnt, .-ntbl_bitcnt
	.align	2
	.globl	btbl_bitcnt
	.type	btbl_bitcnt, @function
btbl_bitcnt:
	lui	a2,%hi(.LANCHOR0)
	andi	a4,a0,255
	addi	a2,a2,%lo(.LANCHOR0)
	srai	a5,a0,8
	add	a4,a2,a4
	lbu	a0,0(a4)
	beq	a5,zero,.L9
	li	a3,0
.L11:
	andi	a4,a5,255
	add	a4,a2,a4
	srai	a5,a5,8
	add	a3,a3,a0
	lbu	a0,0(a4)
	bne	a5,zero,.L11
	add	a0,a0,a3
.L9:
	ret
	.size	btbl_bitcnt, .-btbl_bitcnt
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	bits, @object
	.size	bits, 256
bits:
	.base64	"AAEBAgECAgMBAgIDAgMDBAECAgMCAwMEAgMDBAMEBAUBAgIDAgMDBAIDAwQDBAQFAgMDBAMEBAUDBAQFBAUFBgECAgMCAwMEAgMDBAMEBAUCAwMEAwQEBQMEBAUEBQUGAgMDBAMEBAUDBAQFBAUFBgMEBAUEBQUGBAUFBgUGBgcBAgIDAgMDBAIDAwQDBAQFAgMDBAMEBAUDBAQFBAUFBgIDAwQDBAQFAwQEBQQFBQYDBAQFBAUFBgQFBQYFBgYHAgMDBAMEBAUDBAQFBAUFBgMEBAUEBQUGBAUFBgUGBgcDBAQFBAUFBgQFBQYFBgYHBAUFBgUGBgcFBgYHBgcH"
	.ascii	"\b"
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
