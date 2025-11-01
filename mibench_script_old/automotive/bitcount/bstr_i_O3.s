	.file	"bstr_i.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"01"
	.text
	.align	2
	.globl	bstr_i
	.type	bstr_i, @function
bstr_i:
	addi	sp,sp,-32
	sw	s2,16(sp)
	sw	ra,28(sp)
	li	s2,0
	beq	a0,zero,.L1
	sw	s3,12(sp)
	lui	s3,%hi(.LC0)
	sw	s1,20(sp)
	sw	s0,24(sp)
	mv	s1,a0
	addi	s3,s3,%lo(.LC0)
	j	.L2
.L14:
	call	strchr
	slli	a5,s2,1
	andi	s0,s0,1
	beq	a0,zero,.L12
	addi	s1,s1,1
	or	s2,s0,a5
.L2:
	lbu	s0,0(s1)
	mv	a0,s3
	mv	a1,s0
	bne	s0,zero,.L14
.L12:
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s3,12(sp)
.L1:
	lw	ra,28(sp)
	mv	a0,s2
	lw	s2,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	bstr_i, .-bstr_i
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
