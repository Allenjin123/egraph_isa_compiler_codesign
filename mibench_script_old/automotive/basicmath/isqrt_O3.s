	.file	"isqrt.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	usqrt
	.type	usqrt, @function
usqrt:
	addi	sp,sp,-16
	li	a2,32
	li	a3,0
	li	a5,0
.L3:
	srli	a6,a0,30
	slli	a4,a3,2
	slli	a5,a5,2
	add	a5,a6,a5
	addi	a4,a4,1
	addi	a2,a2,-1
	slli	a0,a0,2
	slli	a3,a3,1
	bgtu	a4,a5,.L2
	sub	a5,a5,a4
	addi	a3,a3,1
.L2:
	bne	a2,zero,.L3
	srli	a2,a3,8
	srli	a4,a3,16
	srli	a5,a3,24
	sb	a3,0(a1)
	sb	a2,1(a1)
	sb	a4,2(a1)
	sb	a5,3(a1)
	addi	sp,sp,16
	jr	ra
	.size	usqrt, .-usqrt
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
