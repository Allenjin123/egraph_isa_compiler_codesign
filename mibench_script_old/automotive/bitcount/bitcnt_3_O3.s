	.file	"bitcnt_3.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
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
