	.file	"rad2deg.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	rad2deg
	.type	rad2deg, @function
rad2deg:
	lui	a5,%hi(.LC0)
	lw	a2,%lo(.LC0)(a5)
	lw	a3,%lo(.LC0+4)(a5)
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	__muldf3
	lui	a5,%hi(.LC1)
	lw	a2,%lo(.LC1)(a5)
	lw	a3,%lo(.LC1+4)(a5)
	call	__divdf3
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	rad2deg, .-rad2deg
	.align	2
	.globl	deg2rad
	.type	deg2rad, @function
deg2rad:
	lui	a5,%hi(.LC1)
	lw	a2,%lo(.LC1)(a5)
	lw	a3,%lo(.LC1+4)(a5)
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	__muldf3
	lui	a5,%hi(.LC0)
	lw	a2,%lo(.LC0)(a5)
	lw	a3,%lo(.LC0+4)(a5)
	call	__divdf3
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	deg2rad, .-deg2rad
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	0
	.word	1080459264
	.align	3
.LC1:
	.word	1413754136
	.word	1074340347
	.globl	__divdf3
	.globl	__muldf3
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
