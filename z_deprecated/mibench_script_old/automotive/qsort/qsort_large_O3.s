	.file	"qsort_large.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	compare
	.type	compare, @function
compare:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	lw	s1,20(a0)
	lw	s2,16(a1)
	sw	s3,12(sp)
	lw	s0,16(a0)
	lw	s3,20(a1)
	mv	a2,s2
	mv	a0,s0
	mv	a1,s1
	mv	a3,s3
	sw	ra,28(sp)
	call	__gtdf2
	bgt	a0,zero,.L4
	mv	a2,s2
	mv	a3,s3
	mv	a0,s0
	mv	a1,s1
	call	__nedf2
	lw	ra,28(sp)
	lw	s0,24(sp)
	snez	a0,a0
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	neg	a0,a0
	addi	sp,sp,32
	jr	ra
.L4:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	li	a0,1
	addi	sp,sp,32
	jr	ra
	.size	compare, .-compare
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Usage: qsort_large <file>\n"
	.align	2
.LC1:
	.string	"r"
	.align	2
.LC2:
	.string	"%d"
	.align	2
.LC3:
	.string	"\nSorting %d vectors based on distance from the origin.\n\n"
	.align	2
.LC4:
	.string	"%d %d %d\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-2032
	li	t0,-1437696
	sw	ra,2028(sp)
	sw	s0,2024(sp)
	sw	s1,2020(sp)
	sw	s2,2016(sp)
	sw	s3,2012(sp)
	sw	s4,2008(sp)
	sw	s5,2004(sp)
	sw	s6,2000(sp)
	sw	s7,1996(sp)
	sw	s8,1992(sp)
	sw	s9,1988(sp)
	sw	s10,1984(sp)
	sw	s11,1980(sp)
	addi	t0,t0,-352
	li	a5,1
	add	sp,sp,t0
	ble	a0,a5,.L21
	lw	a0,4(a1)
	lui	a1,%hi(.LC1)
	addi	a1,a1,%lo(.LC1)
	call	fopen
	addi	s1,sp,16
	lui	s3,%hi(.LC2)
	mv	s4,a0
	mv	s0,s1
	addi	s3,s3,%lo(.LC2)
	li	s2,0
	j	.L9
.L10:
	addi	a2,sp,8
	mv	a1,s3
	mv	a0,s4
	call	fscanf
	mv	s7,a0
	bne	a0,s6,.L13
	addi	a2,sp,12
	mv	a1,s3
	mv	a0,s4
	call	fscanf
	bne	a0,s7,.L13
	li	a5,61440
	addi	a5,a5,-1440
	beq	s2,a5,.L22
	lw	s6,8(sp)
	lw	s10,12(sp)
	lw	a0,4(sp)
	sw	s6,4(s0)
	sw	s10,8(s0)
	sw	a0,0(s0)
	call	__floatsidf
	mv	s8,a0
	mv	a0,s6
	mv	s9,a1
	call	__floatsidf
	mv	s6,a0
	mv	a0,s10
	mv	s7,a1
	call	__floatsidf
	mv	s10,a0
	mv	s11,a1
	mv	a2,s6
	mv	a3,s7
	mv	a0,s6
	mv	a1,s7
	call	__muldf3
	mv	s6,a0
	mv	s7,a1
	mv	a2,s8
	mv	a3,s9
	mv	a0,s8
	mv	a1,s9
	call	__muldf3
	mv	a2,a0
	mv	a3,a1
	mv	a0,s6
	mv	a1,s7
	call	__adddf3
	mv	s6,a0
	mv	s7,a1
	mv	a2,s10
	mv	a3,s11
	mv	a0,s10
	mv	a1,s11
	call	__muldf3
	mv	a2,a0
	mv	a3,a1
	mv	a0,s6
	mv	a1,s7
	call	__adddf3
	call	sqrt
	sw	a0,16(s0)
	sw	a1,20(s0)
	addi	s2,s2,1
	addi	s0,s0,24
.L9:
	addi	a2,sp,4
	mv	a1,s3
	mv	a0,s4
	call	fscanf
	li	a5,1
	mv	s6,a0
	beq	a0,a5,.L10
.L13:
	lui	a0,%hi(.LC3)
	mv	a1,s2
	addi	a0,a0,%lo(.LC3)
	call	printf
	lui	a3,%hi(compare)
	mv	a1,s2
	addi	a0,sp,16
	addi	a3,a3,%lo(compare)
	li	a2,24
	call	qsort
	beq	s2,zero,.L18
.L11:
	slli	s0,s2,1
	add	s0,s0,s2
	slli	s0,s0,3
	lui	s2,%hi(.LC4)
	add	s0,s0,s1
	addi	s2,s2,%lo(.LC4)
.L16:
	lw	a3,8(s1)
	lw	a2,4(s1)
	lw	a1,0(s1)
	mv	a0,s2
	addi	s1,s1,24
	call	printf
	bne	s1,s0,.L16
.L18:
	li	t0,1437696
	addi	t0,t0,352
	add	sp,sp,t0
	lw	ra,2028(sp)
	lw	s0,2024(sp)
	lw	s1,2020(sp)
	lw	s2,2016(sp)
	lw	s3,2012(sp)
	lw	s4,2008(sp)
	lw	s5,2004(sp)
	lw	s6,2000(sp)
	lw	s7,1996(sp)
	lw	s8,1992(sp)
	lw	s9,1988(sp)
	lw	s10,1984(sp)
	lw	s11,1980(sp)
	li	a0,0
	addi	sp,sp,2032
	jr	ra
.L22:
	lui	a0,%hi(.LC3)
	mv	a1,s2
	addi	a0,a0,%lo(.LC3)
	call	printf
	lui	a3,%hi(compare)
	mv	a1,s2
	addi	a0,sp,16
	addi	a3,a3,%lo(compare)
	li	a2,24
	call	qsort
	j	.L11
.L21:
	lui	a4,%hi(_impure_ptr)
	lw	a4,%lo(_impure_ptr)(a4)
	lui	a0,%hi(.LC0)
	mv	a1,a5
	lw	a3,12(a4)
	addi	a0,a0,%lo(.LC0)
	li	a2,26
	call	fwrite
	li	a0,-1
	call	exit
	.size	main, .-main
	.globl	__adddf3
	.globl	__muldf3
	.globl	__floatsidf
	.globl	__nedf2
	.globl	__gtdf2
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
