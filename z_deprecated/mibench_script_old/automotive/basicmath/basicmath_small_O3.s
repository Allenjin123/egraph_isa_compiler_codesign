	.file	"basicmath_small.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"********* CUBIC FUNCTIONS ***********"
	.align	2
.LC8:
	.string	"Solutions:"
	.align	2
.LC9:
	.string	" %f"
	.align	2
.LC18:
	.string	"********* INTEGER SQR ROOTS ***********"
	.align	2
.LC19:
	.string	"sqrt(%3d) = %2d\n"
	.align	2
.LC20:
	.string	"\nsqrt(%lX) = %X\n"
	.align	2
.LC21:
	.string	"********* ANGLE CONVERSION ***********"
	.align	2
.LC24:
	.string	"%3.0f degrees = %.12f radians\n"
	.align	2
.LC25:
	.string	""
	.align	2
.LC26:
	.string	"%.12f radians = %3.0f degrees\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lui	a0,%hi(.LC4)
	addi	sp,sp,-208
	addi	a0,a0,%lo(.LC4)
	sw	ra,204(sp)
	sw	s3,188(sp)
	sw	s4,184(sp)
	sw	s7,172(sp)
	sw	s0,200(sp)
	sw	s1,196(sp)
	sw	s2,192(sp)
	sw	s5,180(sp)
	sw	s6,176(sp)
	sw	s8,168(sp)
	sw	s9,164(sp)
	sw	s10,160(sp)
	sw	s11,156(sp)
	call	puts
	lui	s3,%hi(.LC5)
	lui	a5,%hi(.LC6)
	lui	a3,%hi(.LC7)
	lui	a1,%hi(.LC3)
	lw	a4,%lo(.LC6)(a5)
	lw	a2,%lo(.LC7)(a3)
	lw	a0,%lo(.LC3)(a1)
	lw	a6,%lo(.LC5)(s3)
	lw	a7,%lo(.LC5+4)(s3)
	lw	a5,%lo(.LC6+4)(a5)
	lw	a3,%lo(.LC7+4)(a3)
	lw	a1,%lo(.LC3+4)(a1)
	addi	s4,sp,120
	addi	s7,sp,108
	sw	s4,4(sp)
	sw	s7,0(sp)
	call	SolveCubic
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	lw	a5,108(sp)
	ble	a5,zero,.L2
	lui	a5,%hi(.LC9)
	addi	s0,a5,%lo(.LC9)
	mv	s2,s4
	li	s1,0
.L3:
	lw	a2,0(s2)
	lw	a3,4(s2)
	mv	a0,s0
	addi	s1,s1,1
	call	printf
	lw	a5,108(sp)
	addi	s2,s2,8
	bgt	a5,s1,.L3
.L2:
	li	a0,10
	call	putchar
	lui	a4,%hi(.LC3)
	lui	a5,%hi(.LC10)
	lui	a3,%hi(.LC11)
	lw	a0,%lo(.LC3)(a4)
	lw	a1,%lo(.LC3+4)(a4)
	lw	a2,%lo(.LC11)(a3)
	lw	a4,%lo(.LC10)(a5)
	lw	a6,%lo(.LC5)(s3)
	lw	a7,%lo(.LC5+4)(s3)
	lw	a5,%lo(.LC10+4)(a5)
	lw	a3,%lo(.LC11+4)(a3)
	sw	s4,4(sp)
	sw	s7,0(sp)
	call	SolveCubic
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	lw	a5,108(sp)
	ble	a5,zero,.L4
	lui	a5,%hi(.LC9)
	addi	s0,a5,%lo(.LC9)
	mv	s2,s4
	li	s1,0
.L5:
	lw	a2,0(s2)
	lw	a3,4(s2)
	mv	a0,s0
	addi	s1,s1,1
	call	printf
	lw	a5,108(sp)
	addi	s2,s2,8
	bgt	a5,s1,.L5
.L4:
	li	a0,10
	call	putchar
	lui	a4,%hi(.LC12)
	lui	a2,%hi(.LC3)
	lui	a5,%hi(.LC13)
	lui	a3,%hi(.LC14)
	lw	a0,%lo(.LC3)(a2)
	lw	a1,%lo(.LC3+4)(a2)
	lw	a6,%lo(.LC12)(a4)
	lw	a7,%lo(.LC12+4)(a4)
	lw	a2,%lo(.LC14)(a3)
	lw	a4,%lo(.LC13)(a5)
	lw	a3,%lo(.LC14+4)(a3)
	lw	a5,%lo(.LC13+4)(a5)
	sw	s4,4(sp)
	sw	s7,0(sp)
	call	SolveCubic
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	lw	a5,108(sp)
	ble	a5,zero,.L6
	lui	a5,%hi(.LC9)
	addi	s0,a5,%lo(.LC9)
	mv	s2,s4
	li	s1,0
.L7:
	lw	a2,0(s2)
	lw	a3,4(s2)
	mv	a0,s0
	addi	s1,s1,1
	call	printf
	lw	a5,108(sp)
	addi	s2,s2,8
	bgt	a5,s1,.L7
.L6:
	li	a0,10
	call	putchar
	lui	a5,%hi(.LC3)
	lw	a4,%lo(.LC3)(a5)
	lui	a2,%hi(.LC15)
	lw	a5,%lo(.LC3+4)(a5)
	lui	a3,%hi(.LC16)
	lw	a6,%lo(.LC15)(a2)
	lw	a7,%lo(.LC15+4)(a2)
	lw	a2,%lo(.LC16)(a3)
	lw	a3,%lo(.LC16+4)(a3)
	mv	a0,a4
	mv	a1,a5
	sw	s4,4(sp)
	sw	s7,0(sp)
	call	SolveCubic
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	lw	a5,108(sp)
	ble	a5,zero,.L8
	lui	a5,%hi(.LC9)
	addi	s0,a5,%lo(.LC9)
	mv	s2,s4
	li	s1,0
.L9:
	lw	a2,0(s2)
	lw	a3,4(s2)
	mv	a0,s0
	addi	s1,s1,1
	call	printf
	lw	a5,108(sp)
	addi	s2,s2,8
	bgt	a5,s1,.L9
.L8:
	li	a0,10
	call	putchar
	lui	a5,%hi(.LC3)
	lui	a2,%hi(.LC17)
	lw	s6,%lo(.LC3)(a5)
	lw	s5,%lo(.LC3+4)(a5)
	lw	a1,%lo(.LC17)(a2)
	lui	a5,%hi(.LC2)
	lw	a2,%lo(.LC17+4)(a2)
	lw	s0,%lo(.LC2+4)(a5)
	lui	a3,%hi(.LC0)
	lui	a4,%hi(.LC1)
	lw	s9,%lo(.LC0+4)(a3)
	sw	a2,44(sp)
	lw	a2,%lo(.LC0)(a3)
	lw	a3,%lo(.LC1)(a4)
	lw	a4,%lo(.LC1+4)(a4)
	mv	s11,s0
	lw	s0,%lo(.LC2)(a5)
	sw	s9,52(sp)
	sw	s6,28(sp)
	sw	s6,64(sp)
	sw	s5,32(sp)
	sw	s5,68(sp)
	sw	s5,72(sp)
	sw	a1,40(sp)
	sw	a2,48(sp)
	sw	a3,56(sp)
	sw	a4,60(sp)
	li	s9,9
	mv	s2,s6
.L10:
	lui	s3,%hi(.LC9)
	addi	s3,s3,%lo(.LC9)
	sw	s0,20(sp)
	sw	s11,24(sp)
	li	s10,10
	sw	s0,76(sp)
	sw	s11,80(sp)
.L18:
	lw	s0,56(sp)
	lw	s1,60(sp)
	li	a5,20
	sw	a5,36(sp)
	sw	s9,84(sp)
	sw	s10,88(sp)
	sw	s2,92(sp)
.L16:
	lw	s8,48(sp)
	lw	s2,52(sp)
	li	s9,10
.L13:
	lw	a2,20(sp)
	lw	a3,24(sp)
	mv	a6,s8
	mv	a4,s0
	mv	a0,s6
	mv	a7,s2
	mv	a5,s1
	mv	a1,s5
	sw	s4,4(sp)
	sw	s7,0(sp)
	call	SolveCubic
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	lw	a5,108(sp)
	ble	a5,zero,.L11
	mv	s11,s4
	li	s10,0
.L12:
	lw	a2,0(s11)
	lw	a3,4(s11)
	mv	a0,s3
	addi	s10,s10,1
	call	printf
	lw	a5,108(sp)
	addi	s11,s11,8
	bgt	a5,s10,.L12
.L11:
	li	a0,10
	call	putchar
	lw	a2,28(sp)
	lw	a3,32(sp)
	mv	a0,s8
	mv	a1,s2
	call	__subdf3
	addi	s9,s9,-1
	mv	s8,a0
	mv	s2,a1
	bne	s9,zero,.L13
	lw	a2,40(sp)
	lw	a3,44(sp)
	mv	a0,s0
	mv	a1,s1
	call	__adddf3
	lw	a5,36(sp)
	mv	s0,a0
	mv	s1,a1
	addi	a5,a5,-1
	sw	a5,36(sp)
	bne	a5,zero,.L16
	lw	a0,20(sp)
	lw	a1,24(sp)
	lw	a2,64(sp)
	lw	a3,68(sp)
	lw	s10,88(sp)
	lw	s9,84(sp)
	call	__subdf3
	addi	s10,s10,-1
	sw	a0,20(sp)
	sw	a1,24(sp)
	lw	s2,92(sp)
	bne	s10,zero,.L18
	lw	a3,72(sp)
	mv	a0,s6
	mv	a1,s5
	mv	a2,s2
	call	__adddf3
	addi	s9,s9,-1
	lw	s0,76(sp)
	lw	s11,80(sp)
	mv	s6,a0
	mv	s5,a1
	bne	s9,zero,.L10
	lui	a0,%hi(.LC18)
	addi	a0,a0,%lo(.LC18)
	lui	s1,%hi(.LC19)
	call	puts
	addi	s1,s1,%lo(.LC19)
	li	s0,0
	li	s2,1001
.L19:
	mv	a0,s0
	addi	a1,sp,112
	call	usqrt
	lw	a2,112(sp)
	mv	a1,s0
	mv	a0,s1
	addi	s0,s0,1
	call	printf
	bne	s0,s2,.L19
	li	a0,1072496640
	addi	a1,sp,112
	addi	a0,a0,361
	call	usqrt
	lw	a2,112(sp)
	lui	a0,%hi(.LC20)
	li	a1,1072496640
	addi	a1,a1,361
	addi	a0,a0,%lo(.LC20)
	call	printf
	lui	a0,%hi(.LC21)
	addi	a0,a0,%lo(.LC21)
	call	puts
	lui	a4,%hi(.LC22)
	lui	a5,%hi(.LC23)
	lui	a3,%hi(.LC3)
	lw	s4,%lo(.LC3)(a3)
	lw	s5,%lo(.LC3+4)(a3)
	lw	s2,%lo(.LC22)(a4)
	lw	s3,%lo(.LC22+4)(a4)
	lw	s6,%lo(.LC23)(a5)
	lw	s7,%lo(.LC23+4)(a5)
	lui	s9,%hi(.LC24)
	addi	s9,s9,%lo(.LC24)
	li	s8,361
	li	s1,0
	li	s0,0
.L20:
	mv	a0,s1
	mv	a1,s0
	mv	a2,s2
	mv	a3,s3
	call	__muldf3
	mv	a2,s6
	mv	a3,s7
	call	__divdf3
	mv	a4,a0
	mv	a5,a1
	mv	a2,s1
	mv	a3,s0
	mv	a0,s9
	call	printf
	mv	a0,s1
	mv	a1,s0
	mv	a2,s4
	mv	a3,s5
	call	__adddf3
	addi	s8,s8,-1
	mv	s1,a0
	mv	s0,a1
	bne	s8,zero,.L20
	lui	a0,%hi(.LC25)
	addi	a0,a0,%lo(.LC25)
	call	puts
	lui	a5,%hi(.LC27)
	lw	s4,%lo(.LC27)(a5)
	lw	s5,%lo(.LC27+4)(a5)
	lui	s9,%hi(.LC26)
	addi	s9,s9,%lo(.LC26)
	li	s8,361
	li	s1,0
	li	s0,0
.L21:
	mv	a0,s1
	mv	a1,s0
	mv	a2,s6
	mv	a3,s7
	call	__muldf3
	mv	a2,s2
	mv	a3,s3
	call	__divdf3
	mv	a4,a0
	mv	a5,a1
	mv	a2,s1
	mv	a3,s0
	mv	a0,s9
	call	printf
	mv	a0,s1
	mv	a1,s0
	mv	a2,s4
	mv	a3,s5
	call	__adddf3
	addi	s8,s8,-1
	mv	s1,a0
	mv	s0,a1
	bne	s8,zero,.L21
	lw	ra,204(sp)
	lw	s0,200(sp)
	lw	s1,196(sp)
	lw	s2,192(sp)
	lw	s3,188(sp)
	lw	s4,184(sp)
	lw	s5,180(sp)
	lw	s6,176(sp)
	lw	s7,172(sp)
	lw	s8,168(sp)
	lw	s9,164(sp)
	lw	s10,160(sp)
	lw	s11,156(sp)
	li	a0,0
	addi	sp,sp,208
	jr	ra
	.size	main, .-main
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	0
	.word	-1074790400
	.align	3
.LC1:
	.word	0
	.word	1075052544
	.align	3
.LC2:
	.word	0
	.word	1076101120
	.align	3
.LC3:
	.word	0
	.word	1072693248
	.align	3
.LC5:
	.word	0
	.word	-1069678592
	.align	3
.LC6:
	.word	0
	.word	1077936128
	.align	3
.LC7:
	.word	0
	.word	-1071316992
	.align	3
.LC10:
	.word	0
	.word	1076953088
	.align	3
.LC11:
	.word	0
	.word	-1072562176
	.align	3
.LC12:
	.word	0
	.word	-1069613056
	.align	3
.LC13:
	.word	0
	.word	1077280768
	.align	3
.LC14:
	.word	0
	.word	-1072955392
	.align	3
.LC15:
	.word	0
	.word	-1069449216
	.align	3
.LC16:
	.word	1717986918
	.word	-1070897562
	.align	3
.LC17:
	.word	0
	.word	1071644672
	.align	3
.LC22:
	.word	1413754136
	.word	1074340347
	.align	3
.LC23:
	.word	0
	.word	1080459264
	.align	3
.LC27:
	.word	-1571644103
	.word	1066524486
	.globl	__divdf3
	.globl	__muldf3
	.globl	__adddf3
	.globl	__subdf3
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
