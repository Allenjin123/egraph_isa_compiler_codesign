	.file	"qsort_small.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	compare
	.type	compare, @function
compare:
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	strcmp
	blt	a0,zero,.L3
	lw	ra,12(sp)
	snez	a0,a0
	neg	a0,a0
	addi	sp,sp,16
	jr	ra
.L3:
	lw	ra,12(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
	.size	compare, .-compare
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Usage: qsort_small <file>\n"
	.align	2
.LC1:
	.string	"r"
	.align	2
.LC2:
	.string	"%s"
	.align	2
.LC3:
	.string	"\nSorting %d elements.\n\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	s6,0(sp)
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	s5,4(sp)
	li	t0,-7680000
	li	s6,1
	add	sp,sp,t0
	ble	a0,s6,.L19
	lw	a0,4(a1)
	lui	a1,%hi(.LC1)
	addi	a1,a1,%lo(.LC1)
	call	fopen
	lui	s3,%hi(.LC2)
	li	s4,61440
	mv	s5,a0
	mv	s2,sp
	mv	s1,sp
	addi	s3,s3,%lo(.LC2)
	addi	s4,s4,-1440
	li	s0,0
	j	.L8
.L21:
	beq	s0,s4,.L20
	addi	s1,s1,128
	addi	s0,s0,1
.L8:
	mv	a2,s1
	mv	a1,s3
	mv	a0,s5
	call	fscanf
	beq	a0,s6,.L21
	lui	a0,%hi(.LC3)
	mv	a1,s0
	addi	a0,a0,%lo(.LC3)
	call	printf
	lui	a3,%hi(compare)
	mv	a1,s0
	mv	a0,sp
	addi	a3,a3,%lo(compare)
	li	a2,128
	call	qsort
	beq	s0,zero,.L17
.L12:
	slli	s0,s0,7
	add	s0,s0,s2
.L13:
	mv	a0,s2
	addi	s2,s2,128
	call	puts
	bne	s2,s0,.L13
.L17:
	li	t0,7680000
	add	sp,sp,t0
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	lw	s5,4(sp)
	lw	s6,0(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L20:
	lui	a0,%hi(.LC3)
	mv	a1,s0
	addi	a0,a0,%lo(.LC3)
	call	printf
	lui	a3,%hi(compare)
	mv	a1,s0
	mv	a0,sp
	addi	a3,a3,%lo(compare)
	li	a2,128
	call	qsort
	j	.L12
.L19:
	lui	a5,%hi(_impure_ptr)
	lw	a5,%lo(_impure_ptr)(a5)
	lui	a0,%hi(.LC0)
	mv	a1,s6
	lw	a3,12(a5)
	addi	a0,a0,%lo(.LC0)
	li	a2,26
	call	fwrite
	li	a0,-1
	call	exit
	.size	main, .-main
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
