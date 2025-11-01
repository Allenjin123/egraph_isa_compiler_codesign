	.file	"bitstrng.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	bitstring
	.type	bitstring, @function
bitstring:
	mv	a5,a2
	srai	a4,a5,2
	andi	a2,a2,3
	seqz	a2,a2
	add	a4,a4,a5
	sub	a4,a4,a2
	sub	a2,a3,a4
	mv	a6,a1
	mv	a4,a0
	ble	a2,zero,.L12
	addi	sp,sp,-32
	sw	a1,8(sp)
	li	a1,32
	sw	a5,12(sp)
	sw	a2,0(sp)
	sw	ra,28(sp)
	sw	a0,4(sp)
	call	memset
	lw	a2,0(sp)
	lw	a4,4(sp)
	lw	a5,12(sp)
	lw	a6,8(sp)
	add	a4,a4,a2
	addi	a2,a5,-1
	blt	a2,zero,.L7
	li	a1,32
.L6:
	sra	a5,a6,a2
	andi	a5,a5,1
	addi	a5,a5,48
	sb	a5,0(a4)
	andi	a5,a2,3
	addi	a3,a4,1
	beq	a5,zero,.L4
.L23:
	addi	a2,a2,-1
	sra	a5,a6,a2
	andi	a5,a5,1
	mv	a4,a3
	addi	a5,a5,48
	sb	a5,0(a4)
	andi	a5,a2,3
	addi	a3,a4,1
	bne	a5,zero,.L23
.L4:
	bne	a2,zero,.L24
.L3:
	sb	zero,0(a3)
	lw	ra,28(sp)
	addi	sp,sp,32
	jr	ra
.L24:
	sb	a1,1(a4)
	addi	a2,a2,-1
	addi	a4,a4,2
	j	.L6
.L12:
	addi	a2,a5,-1
	blt	a2,zero,.L14
	li	a1,32
.L15:
	sra	a5,a6,a2
	andi	a5,a5,1
	addi	a5,a5,48
	sb	a5,0(a4)
	andi	a5,a2,3
	addi	a3,a4,1
	beq	a5,zero,.L16
.L25:
	addi	a2,a2,-1
	sra	a5,a6,a2
	andi	a5,a5,1
	mv	a4,a3
	addi	a5,a5,48
	sb	a5,0(a4)
	andi	a5,a2,3
	addi	a3,a4,1
	bne	a5,zero,.L25
.L16:
	bne	a2,zero,.L26
.L19:
	sb	zero,0(a3)
	ret
.L26:
	sb	a1,1(a4)
	addi	a2,a2,-1
	addi	a4,a4,2
	j	.L15
.L7:
	mv	a3,a4
	j	.L3
.L14:
	mv	a3,a0
	j	.L19
	.size	bitstring, .-bitstring
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
