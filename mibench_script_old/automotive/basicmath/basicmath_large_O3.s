	.file	"basicmath_large.c"
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
.LC35:
	.string	"********* INTEGER SQR ROOTS ***********"
	.align	2
.LC36:
	.string	"sqrt(%3d) = %2d\n"
	.align	2
.LC37:
	.string	"sqrt(%lX) = %X\n"
	.align	2
.LC38:
	.string	"********* ANGLE CONVERSION ***********"
	.align	2
.LC41:
	.string	"%3.0f degrees = %.12f radians\n"
	.align	2
.LC44:
	.string	""
	.align	2
.LC45:
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
	sw	s2,192(sp)
	sw	s4,184(sp)
	sw	s5,180(sp)
	sw	s6,176(sp)
	sw	s0,200(sp)
	sw	s1,196(sp)
	sw	s3,188(sp)
	sw	s7,172(sp)
	sw	s8,168(sp)
	sw	s9,164(sp)
	sw	s10,160(sp)
	sw	s11,156(sp)
	call	puts
	lui	s6,%hi(.LC5)
	lui	a5,%hi(.LC6)
	lui	a3,%hi(.LC7)
	lui	s2,%hi(.LC3)
	lw	a4,%lo(.LC6)(a5)
	lw	a2,%lo(.LC7)(a3)
	lw	a6,%lo(.LC5)(s6)
	lw	a7,%lo(.LC5+4)(s6)
	lw	a5,%lo(.LC6+4)(a5)
	lw	a3,%lo(.LC7+4)(a3)
	lw	a0,%lo(.LC3)(s2)
	lw	a1,%lo(.LC3+4)(s2)
	addi	s4,sp,120
	addi	s5,sp,108
	sw	s4,4(sp)
	sw	s5,0(sp)
	call	SolveCubic
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	lw	a5,108(sp)
	ble	a5,zero,.L2
	lui	a5,%hi(.LC9)
	addi	s0,a5,%lo(.LC9)
	mv	s3,s4
	li	s1,0
.L3:
	lw	a2,0(s3)
	lw	a3,4(s3)
	mv	a0,s0
	addi	s1,s1,1
	call	printf
	lw	a5,108(sp)
	addi	s3,s3,8
	bgt	a5,s1,.L3
.L2:
	li	a0,10
	call	putchar
	lui	a5,%hi(.LC10)
	lui	a3,%hi(.LC11)
	lw	a4,%lo(.LC10)(a5)
	lw	a2,%lo(.LC11)(a3)
	lw	a6,%lo(.LC5)(s6)
	lw	a7,%lo(.LC5+4)(s6)
	lw	a0,%lo(.LC3)(s2)
	lw	a1,%lo(.LC3+4)(s2)
	lw	a5,%lo(.LC10+4)(a5)
	lw	a3,%lo(.LC11+4)(a3)
	sw	s4,4(sp)
	sw	s5,0(sp)
	call	SolveCubic
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	lw	a5,108(sp)
	ble	a5,zero,.L4
	lui	a5,%hi(.LC9)
	addi	s0,a5,%lo(.LC9)
	mv	s3,s4
	li	s1,0
.L5:
	lw	a2,0(s3)
	lw	a3,4(s3)
	mv	a0,s0
	addi	s1,s1,1
	call	printf
	lw	a5,108(sp)
	addi	s3,s3,8
	bgt	a5,s1,.L5
.L4:
	li	a0,10
	call	putchar
	lui	a4,%hi(.LC12)
	lui	a5,%hi(.LC13)
	lui	a3,%hi(.LC14)
	lw	a6,%lo(.LC12)(a4)
	lw	a7,%lo(.LC12+4)(a4)
	lw	a2,%lo(.LC14)(a3)
	lw	a4,%lo(.LC13)(a5)
	lw	a0,%lo(.LC3)(s2)
	lw	a1,%lo(.LC3+4)(s2)
	lw	a5,%lo(.LC13+4)(a5)
	lw	a3,%lo(.LC14+4)(a3)
	sw	s4,4(sp)
	sw	s5,0(sp)
	call	SolveCubic
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	lw	a5,108(sp)
	ble	a5,zero,.L6
	lui	a5,%hi(.LC9)
	addi	s0,a5,%lo(.LC9)
	mv	s3,s4
	li	s1,0
.L7:
	lw	a2,0(s3)
	lw	a3,4(s3)
	mv	a0,s0
	addi	s1,s1,1
	call	printf
	lw	a5,108(sp)
	addi	s3,s3,8
	bgt	a5,s1,.L7
.L6:
	li	a0,10
	call	putchar
	lw	a4,%lo(.LC3)(s2)
	lw	a5,%lo(.LC3+4)(s2)
	lui	a2,%hi(.LC15)
	lui	a3,%hi(.LC16)
	lw	a6,%lo(.LC15)(a2)
	lw	a7,%lo(.LC15+4)(a2)
	lw	a2,%lo(.LC16)(a3)
	lw	a3,%lo(.LC16+4)(a3)
	mv	a0,a4
	mv	a1,a5
	sw	s4,4(sp)
	sw	s5,0(sp)
	call	SolveCubic
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	lw	a5,108(sp)
	ble	a5,zero,.L8
	lui	a5,%hi(.LC9)
	addi	s0,a5,%lo(.LC9)
	mv	s3,s4
	li	s1,0
.L9:
	lw	a2,0(s3)
	lw	a3,4(s3)
	mv	a0,s0
	addi	s1,s1,1
	call	printf
	lw	a5,108(sp)
	addi	s3,s3,8
	bgt	a5,s1,.L9
.L8:
	li	a0,10
	call	putchar
	lui	a5,%hi(.LC17)
	lui	s1,%hi(.LC1)
	lui	a3,%hi(.LC18)
	lui	a1,%hi(.LC19)
	lw	a6,%lo(.LC17)(a5)
	lw	a7,%lo(.LC17+4)(a5)
	lw	a2,%lo(.LC18)(a3)
	lw	a0,%lo(.LC19)(a1)
	lw	a4,%lo(.LC1)(s1)
	lw	a5,%lo(.LC1+4)(s1)
	lw	a3,%lo(.LC18+4)(a3)
	lw	a1,%lo(.LC19+4)(a1)
	sw	s4,4(sp)
	sw	s5,0(sp)
	call	SolveCubic
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	lw	a5,108(sp)
	ble	a5,zero,.L10
	lui	a5,%hi(.LC9)
	addi	s0,a5,%lo(.LC9)
	mv	s6,s4
	li	s3,0
.L11:
	lw	a2,0(s6)
	lw	a3,4(s6)
	mv	a0,s0
	addi	s3,s3,1
	call	printf
	lw	a5,108(sp)
	addi	s6,s6,8
	bgt	a5,s3,.L11
.L10:
	li	a0,10
	call	putchar
	lui	a4,%hi(.LC20)
	lui	a5,%hi(.LC21)
	lui	a3,%hi(.LC22)
	lui	a1,%hi(.LC23)
	lw	a6,%lo(.LC20)(a4)
	lw	a7,%lo(.LC20+4)(a4)
	lw	a2,%lo(.LC22)(a3)
	lw	a4,%lo(.LC21)(a5)
	lw	a0,%lo(.LC23)(a1)
	lw	a5,%lo(.LC21+4)(a5)
	lw	a3,%lo(.LC22+4)(a3)
	lw	a1,%lo(.LC23+4)(a1)
	sw	s4,4(sp)
	sw	s5,0(sp)
	call	SolveCubic
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	lw	a5,108(sp)
	ble	a5,zero,.L12
	lui	a5,%hi(.LC9)
	addi	s0,a5,%lo(.LC9)
	mv	s6,s4
	li	s3,0
.L13:
	lw	a2,0(s6)
	lw	a3,4(s6)
	mv	a0,s0
	addi	s3,s3,1
	call	printf
	lw	a5,108(sp)
	addi	s6,s6,8
	bgt	a5,s3,.L13
.L12:
	li	a0,10
	call	putchar
	lui	a4,%hi(.LC24)
	lui	a5,%hi(.LC25)
	lui	a3,%hi(.LC26)
	lui	a1,%hi(.LC27)
	lw	a6,%lo(.LC24)(a4)
	lw	a7,%lo(.LC24+4)(a4)
	lw	a2,%lo(.LC26)(a3)
	lw	a4,%lo(.LC25)(a5)
	lw	a0,%lo(.LC27)(a1)
	lw	a5,%lo(.LC25+4)(a5)
	lw	a3,%lo(.LC26+4)(a3)
	lw	a1,%lo(.LC27+4)(a1)
	sw	s4,4(sp)
	sw	s5,0(sp)
	call	SolveCubic
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	lw	a5,108(sp)
	ble	a5,zero,.L14
	lui	a5,%hi(.LC9)
	addi	s0,a5,%lo(.LC9)
	mv	s6,s4
	li	s3,0
.L15:
	lw	a2,0(s6)
	lw	a3,4(s6)
	mv	a0,s0
	addi	s3,s3,1
	call	printf
	lw	a5,108(sp)
	addi	s6,s6,8
	bgt	a5,s3,.L15
.L14:
	li	a0,10
	call	putchar
	lui	a4,%hi(.LC28)
	lui	a5,%hi(.LC29)
	lui	a3,%hi(.LC30)
	lui	a1,%hi(.LC31)
	lw	a6,%lo(.LC28)(a4)
	lw	a7,%lo(.LC28+4)(a4)
	lw	a2,%lo(.LC30)(a3)
	lw	a4,%lo(.LC29)(a5)
	lw	a0,%lo(.LC31)(a1)
	lw	a5,%lo(.LC29+4)(a5)
	lw	a3,%lo(.LC30+4)(a3)
	lw	a1,%lo(.LC31+4)(a1)
	sw	s4,4(sp)
	sw	s5,0(sp)
	call	SolveCubic
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	lw	a5,108(sp)
	ble	a5,zero,.L16
	lui	a5,%hi(.LC9)
	addi	s0,a5,%lo(.LC9)
	mv	s6,s4
	li	s3,0
.L17:
	lw	a2,0(s6)
	lw	a3,4(s6)
	mv	a0,s0
	addi	s3,s3,1
	call	printf
	lw	a5,108(sp)
	addi	s6,s6,8
	bgt	a5,s3,.L17
.L16:
	li	a0,10
	call	putchar
	lw	a0,%lo(.LC1)(s1)
	lui	a1,%hi(.LC32)
	lui	a2,%hi(.LC33)
	sw	a0,64(sp)
	lw	a0,%lo(.LC1+4)(s1)
	lui	a4,%hi(.LC0)
	lui	a3,%hi(.LC34)
	sw	a0,68(sp)
	lw	a0,%lo(.LC32)(a1)
	lw	a1,%lo(.LC32+4)(a1)
	lw	s6,%lo(.LC3+4)(s2)
	lui	a5,%hi(.LC2)
	sw	a1,28(sp)
	lw	a1,%lo(.LC33)(a2)
	lw	a2,%lo(.LC33+4)(a2)
	lw	s7,%lo(.LC3)(s2)
	lw	s0,%lo(.LC2)(a5)
	sw	a2,44(sp)
	lw	a2,%lo(.LC0)(a4)
	lw	a4,%lo(.LC0+4)(a4)
	lw	s11,%lo(.LC2+4)(a5)
	sw	s6,72(sp)
	sw	a4,52(sp)
	lw	a4,%lo(.LC34+4)(a3)
	lw	a3,%lo(.LC34)(a3)
	sw	a0,24(sp)
	sw	a1,40(sp)
	sw	a2,48(sp)
	sw	a3,56(sp)
	sw	a4,60(sp)
	mv	s2,s7
	li	s9,9
.L18:
	lui	s3,%hi(.LC9)
	addi	s3,s3,%lo(.LC9)
	sw	s0,20(sp)
	sw	s11,32(sp)
	li	s10,40
	sw	s0,76(sp)
	sw	s11,80(sp)
.L26:
	lw	s0,68(sp)
	lw	s1,64(sp)
	li	s8,17
	mv	s11,s0
	sw	s9,84(sp)
	sw	s10,88(sp)
	mv	s0,s1
	sw	s2,92(sp)
.L24:
	lw	s9,48(sp)
	lw	s2,52(sp)
	li	s10,9
	sw	s8,36(sp)
.L21:
	lw	a2,20(sp)
	lw	a3,32(sp)
	mv	a6,s9
	mv	a4,s0
	mv	a0,s7
	mv	a7,s2
	mv	a5,s11
	mv	a1,s6
	sw	s4,4(sp)
	sw	s5,0(sp)
	call	SolveCubic
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	lw	a5,108(sp)
	ble	a5,zero,.L19
	mv	s8,s4
	li	s1,0
.L20:
	lw	a2,0(s8)
	lw	a3,4(s8)
	mv	a0,s3
	addi	s1,s1,1
	call	printf
	lw	a5,108(sp)
	addi	s8,s8,8
	bgt	a5,s1,.L20
.L19:
	li	a0,10
	call	putchar
	lw	a2,24(sp)
	lw	a3,28(sp)
	mv	a0,s9
	mv	a1,s2
	call	__subdf3
	addi	s10,s10,-1
	mv	s9,a0
	mv	s2,a1
	bne	s10,zero,.L21
	lw	s8,36(sp)
	lw	a2,40(sp)
	lw	a3,44(sp)
	mv	a0,s0
	mv	a1,s11
	call	__adddf3
	addi	s8,s8,-1
	mv	s0,a0
	mv	s11,a1
	bne	s8,zero,.L24
	lw	a0,20(sp)
	lw	a1,32(sp)
	lw	a2,56(sp)
	lw	a3,60(sp)
	lw	s10,88(sp)
	lw	s9,84(sp)
	call	__subdf3
	addi	s10,s10,-1
	sw	a0,20(sp)
	sw	a1,32(sp)
	lw	s2,92(sp)
	bne	s10,zero,.L26
	lw	a3,72(sp)
	mv	a0,s7
	mv	a1,s6
	mv	a2,s2
	call	__adddf3
	addi	s9,s9,-1
	lw	s0,76(sp)
	lw	s11,80(sp)
	mv	s7,a0
	mv	s6,a1
	bne	s9,zero,.L18
	lui	a0,%hi(.LC35)
	addi	a0,a0,%lo(.LC35)
	lui	s2,%hi(.LC36)
	li	s1,98304
	call	puts
	addi	s2,s2,%lo(.LC36)
	addi	s1,s1,1696
	li	s0,0
.L27:
	mv	a0,s0
	addi	a1,sp,112
	call	usqrt
	lw	a2,112(sp)
	mv	a1,s0
	mv	a0,s2
	addi	s0,s0,2
	call	printf
	bne	s0,s1,.L27
	li	a0,10
	li	s0,1072496640
	lui	s2,%hi(.LC37)
	li	s1,1072513024
	call	putchar
	addi	s0,s0,361
	addi	s2,s2,%lo(.LC37)
	addi	s1,s1,361
.L28:
	mv	a0,s0
	addi	a1,sp,112
	call	usqrt
	lw	a2,112(sp)
	mv	a1,s0
	mv	a0,s2
	addi	s0,s0,1
	call	printf
	bne	s0,s1,.L28
	lui	a0,%hi(.LC38)
	addi	a0,a0,%lo(.LC38)
	call	puts
	lui	a2,%hi(.LC39)
	lui	a3,%hi(.LC40)
	lui	a4,%hi(.LC42)
	lui	a5,%hi(.LC43)
	lw	s0,%lo(.LC39)(a2)
	lw	s1,%lo(.LC39+4)(a2)
	lw	s2,%lo(.LC40)(a3)
	lw	s3,%lo(.LC40+4)(a3)
	lw	s6,%lo(.LC42)(a4)
	lw	s7,%lo(.LC42+4)(a4)
	lw	s4,%lo(.LC43)(a5)
	lw	s5,%lo(.LC43+4)(a5)
	lui	s10,%hi(.LC41)
	addi	s10,s10,%lo(.LC41)
	li	s9,0
	li	s8,0
.L29:
	mv	a0,s9
	mv	a1,s8
	mv	a2,s0
	mv	a3,s1
	call	__muldf3
	mv	a2,s2
	mv	a3,s3
	call	__divdf3
	mv	a4,a0
	mv	a5,a1
	mv	a2,s9
	mv	a3,s8
	mv	a0,s10
	call	printf
	mv	a2,s6
	mv	a3,s7
	mv	a0,s9
	mv	a1,s8
	call	__adddf3
	mv	a2,s4
	mv	a3,s5
	mv	s9,a0
	mv	s8,a1
	call	__ledf2
	ble	a0,zero,.L29
	lui	a0,%hi(.LC44)
	addi	a0,a0,%lo(.LC44)
	call	puts
	lui	a4,%hi(.LC46)
	lui	a5,%hi(.LC47)
	lw	s6,%lo(.LC46)(a4)
	lw	s7,%lo(.LC46+4)(a4)
	lw	s4,%lo(.LC47)(a5)
	lw	s5,%lo(.LC47+4)(a5)
	lui	s10,%hi(.LC45)
	addi	s10,s10,%lo(.LC45)
	li	s9,0
	li	s8,0
.L30:
	mv	a0,s9
	mv	a1,s8
	mv	a2,s2
	mv	a3,s3
	call	__muldf3
	mv	a2,s0
	mv	a3,s1
	call	__divdf3
	mv	a4,a0
	mv	a5,a1
	mv	a2,s9
	mv	a3,s8
	mv	a0,s10
	call	printf
	mv	a2,s6
	mv	a3,s7
	mv	a0,s9
	mv	a1,s8
	call	__adddf3
	mv	a2,s4
	mv	a3,s5
	mv	s9,a0
	mv	s8,a1
	call	__ledf2
	ble	a0,zero,.L30
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
	.word	1076363264
	.align	3
.LC18:
	.word	2061584302
	.word	1076407828
	.align	3
.LC19:
	.word	0
	.word	1074266112
	.align	3
.LC20:
	.word	-1717986918
	.word	-1070098023
	.align	3
.LC21:
	.word	0
	.word	1075314688
	.align	3
.LC22:
	.word	-1030792151
	.word	-1068435211
	.align	3
.LC23:
	.word	0
	.word	-1071644672
	.align	3
.LC24:
	.word	0
	.word	1078001664
	.align	3
.LC25:
	.word	0
	.word	1075707904
	.align	3
.LC26:
	.word	1030792151
	.word	1075926794
	.align	3
.LC27:
	.word	0
	.word	1078362112
	.align	3
.LC28:
	.word	0
	.word	1076887552
	.align	3
.LC29:
	.word	858993459
	.word	1075131187
	.align	3
.LC30:
	.word	858993459
	.word	-1074056397
	.align	3
.LC31:
	.word	0
	.word	-1071120384
	.align	3
.LC32:
	.word	446676599
	.word	1071439151
	.align	3
.LC33:
	.word	-1202590843
	.word	1071875358
	.align	3
.LC34:
	.word	0
	.word	1070596096
	.align	3
.LC39:
	.word	1413754136
	.word	1074340347
	.align	3
.LC40:
	.word	0
	.word	1080459264
	.align	3
.LC42:
	.word	-755914244
	.word	1062232653
	.align	3
.LC43:
	.word	0
	.word	1081507840
	.align	3
.LC46:
	.word	-1571644103
	.word	1061281606
	.align	3
.LC47:
	.word	-1755313253
	.word	1075388923
	.globl	__ledf2
	.globl	__divdf3
	.globl	__muldf3
	.globl	__adddf3
	.globl	__subdf3
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
