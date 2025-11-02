	.file	"bitfiles.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	bfopen
	.type	bfopen, @function
bfopen:
	addi	sp,sp,-32
	sw	s1,20(sp)
	mv	s1,a0
	li	a0,8
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	a1,12(sp)
	call	malloc
	beq	a0,zero,.L2
	lw	a1,12(sp)
	mv	s0,a0
	mv	a0,s1
	call	fopen
	sw	a0,0(s0)
	beq	a0,zero,.L10
	sb	zero,5(s0)
	sb	zero,7(s0)
.L1:
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L10:
	mv	a0,s0
	call	free
.L2:
	li	s0,0
	j	.L1
	.size	bfopen, .-bfopen
	.align	2
	.globl	bfread
	.type	bfread, @function
bfread:
	lbu	a5,5(a0)
	mv	a4,a0
	beq	a5,zero,.L12
	lbu	a0,4(a0)
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sra	a0,a0,a5
	andi	a0,a0,1
	sb	a5,5(a4)
	ret
.L12:
	lw	a0,0(a0)
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	a4,12(sp)
	call	fgetc
	lw	a4,12(sp)
	andi	a0,a0,0xff
	li	a3,7
	sb	a0,4(a4)
	sb	a3,5(a4)
	lw	ra,28(sp)
	sra	a0,a0,a3
	andi	a0,a0,1
	addi	sp,sp,32
	jr	ra
	.size	bfread, .-bfread
	.align	2
	.globl	bfwrite
	.type	bfwrite, @function
bfwrite:
	lbu	a4,7(a1)
	li	a2,8
	mv	a5,a1
	mv	a3,a0
	beq	a4,a2,.L18
	lbu	a0,6(a1)
	andi	a3,a3,1
	addi	a4,a4,1
	slli	a0,a0,1
	or	a0,a0,a3
	sb	a4,7(a1)
	sb	a0,6(a1)
	ret
.L18:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	a0,12(sp)
	lw	a1,0(a1)
	lbu	a0,6(a5)
	sw	a5,8(sp)
	call	fputc
	lw	a5,8(sp)
	lw	a3,12(sp)
	li	a4,1
	lbu	a0,6(a5)
	andi	a3,a3,1
	sb	a4,7(a5)
	slli	a0,a0,1
	or	a0,a0,a3
	sb	a0,6(a5)
	lw	ra,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	bfwrite, .-bfwrite
	.align	2
	.globl	bfclose
	.type	bfclose, @function
bfclose:
	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a0
	lw	a0,0(a0)
	sw	ra,12(sp)
	call	fclose
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	addi	sp,sp,16
	tail	free
	.size	bfclose, .-bfclose
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
