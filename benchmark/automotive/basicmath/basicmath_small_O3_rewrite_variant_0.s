	.file	"basicmath_small.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	my_cos, @function
my_cos:
	lui	a5,%hi(.LC0)
	lw	a2,%lo(.LC0)(a5)
	lw	a3,%lo(.LC0+4)(a5)
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	s8,8(sp)
	addi	s0,a0,0
	addi	s1,a1,0
.Lpcrel_1:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
	addi	a2,zero,0
	addi	a3,zero,0
	addi	s2,a0,0
	addi	s3,a1,0
.Lpcrel_2:
	auipc	ra,%pcrel_hi(__gedf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_2)
	lui	s4,%hi(.LC1)
	blt	a0,zero,.+8
	jal	x0,8
	jal	x0,.L12
	lw	a2,%lo(.LC1)(s4)
	lw	a3,%lo(.LC1+4)(s4)
	addi	a0,s2,0
	addi	a1,s3,0
.Lpcrel_3:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_3)
	addi	a4,a0,0
	addi	a5,a1,0
.L4:
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s0,0
	addi	a1,s1,0
.Lpcrel_9:
	auipc	ra,%pcrel_hi(__subdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_9)
	addi	a2,a0,0
	addi	a3,a1,0
	addi	s2,a0,0
	addi	s3,a1,0
.Lpcrel_10:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_10)
	lui	a5,%hi(.LC4)
	lw	a2,%lo(.LC4)(a5)
	lw	a3,%lo(.LC4+4)(a5)
	addi	s0,a0,0
	addi	s1,a1,0
.Lpcrel_11:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_11)
	lui	a5,%hi(.LC5)
	lw	a2,%lo(.LC5)(a5)
	lw	a3,%lo(.LC5+4)(a5)
.Lpcrel_12:
	auipc	ra,%pcrel_hi(__subdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_12)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_13:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_13)
	lui	a5,%hi(.LC6)
	lw	a2,%lo(.LC6)(a5)
	lw	a3,%lo(.LC6+4)(a5)
.Lpcrel_14:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_14)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_15:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_15)
	lui	a5,%hi(.LC7)
	lw	a2,%lo(.LC7)(a5)
	lw	a3,%lo(.LC7+4)(a5)
.Lpcrel_16:
	auipc	ra,%pcrel_hi(__subdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_16)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_17:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_17)
	lui	a5,%hi(.LC8)
	lw	a2,%lo(.LC8)(a5)
	lw	a3,%lo(.LC8+4)(a5)
.Lpcrel_18:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_18)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_19:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_19)
	lui	a5,%hi(.LC9)
	lw	a2,%lo(.LC9)(a5)
	lw	a3,%lo(.LC9+4)(a5)
.Lpcrel_20:
	auipc	ra,%pcrel_hi(__subdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_20)
	addi	s7,a0,0
	addi	s8,a1,0
	addi	a2,s0,0
	addi	a3,s1,0
	addi	a0,s2,0
	addi	a1,s3,0
.Lpcrel_21:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_21)
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s7,0
	addi	a1,s8,0
.Lpcrel_22:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_22)
	addi	a2,s2,0
	addi	a3,s3,0
.Lpcrel_23:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_23)
	addi	s2,x0,3
	and	s2,s6,s2
	addi	a5,zero,1
	addi	s3,a0,0
	addi	s5,a1,0
	beq	s2,a5,.L5
	lui	a5,%hi(.LC10)
	lw	a2,%lo(.LC10)(a5)
	lw	a3,%lo(.LC10+4)(a5)
	addi	a0,s0,0
	addi	a1,s1,0
.Lpcrel_24:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_24)
	lui	a5,%hi(.LC11)
	lw	a2,%lo(.LC11)(a5)
	lw	a3,%lo(.LC11+4)(a5)
.Lpcrel_25:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_25)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_26:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_26)
	lui	a5,%hi(.LC12)
	lw	a2,%lo(.LC12)(a5)
	lw	a3,%lo(.LC12+4)(a5)
.Lpcrel_27:
	auipc	ra,%pcrel_hi(__subdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_27)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_28:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_28)
	lui	a5,%hi(.LC13)
	lw	a2,%lo(.LC13)(a5)
	lw	a3,%lo(.LC13+4)(a5)
.Lpcrel_29:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_29)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_30:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_30)
	lui	a5,%hi(.LC14)
	lw	a2,%lo(.LC14)(a5)
	lw	a3,%lo(.LC14+4)(a5)
.Lpcrel_31:
	auipc	ra,%pcrel_hi(__subdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_31)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_32:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_32)
	lui	a5,%hi(.LC15)
	lw	a2,%lo(.LC15)(a5)
	lw	a3,%lo(.LC15+4)(a5)
.Lpcrel_33:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_33)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_34:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_34)
	lw	a2,%lo(.LC1)(s4)
	lw	a3,%lo(.LC1+4)(s4)
.Lpcrel_35:
	auipc	ra,%pcrel_hi(__subdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_35)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_36:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_36)
	lui	a5,%hi(.LC16)
	lw	a3,%lo(.LC16+4)(a5)
	lw	a2,%lo(.LC16)(a5)
.Lpcrel_37:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_37)
	addi	a3,zero,2
	addi	a5,a1,0
	beq	s2,a3,.L6
	beq	s2,zero,.L1
	addi	a0,s3,0
	addi	a5,s5,0
	addi	a0,a4,0
	addi	a1,a5,0
.Lpcrel_4:
	auipc	ra,%pcrel_hi(__fixdfsi)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_4)
	addi	s6,a0,0
.Lpcrel_5:
	auipc	ra,%pcrel_hi(__floatsidf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_5)
	lui	a5,%hi(.LC2)
	lw	a2,%lo(.LC2)(a5)
	lw	a3,%lo(.LC2+4)(a5)
	addi	s2,a0,0
	addi	s3,a1,0
.Lpcrel_6:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_6)
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s0,0
	addi	a1,s1,0
.Lpcrel_7:
	auipc	ra,%pcrel_hi(__subdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_7)
	lui	a5,%hi(.LC3)
	lw	a2,%lo(.LC3)(a5)
	lw	a3,%lo(.LC3+4)(a5)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a0,s2,0
	addi	a1,s3,0
.Lpcrel_8:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_8)
.L1:
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
	lw	s8,8(sp)
	addi	a1,a5,0
	addi	sp,sp,48
	jalr	zero,ra,0
.L6:
	lui	a5,524288
	and	a2,a1,a5
	sub	a2,a2,a5
	sub	a2,a1,a2
	and	a3,a1,a5
	sub	a5,a2,a3
	jal	x0,.L1
.L12:
	lw	a2,%lo(.LC1)(s4)
	lw	a3,%lo(.LC1+4)(s4)
	addi	a0,s2,0
	addi	a1,s3,0
.Lpcrel_38:
	auipc	ra,%pcrel_hi(__subdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_38)
	addi	a4,a0,0
	addi	a5,a1,0
	jal	x0,.L4
.L5:
	lui	a5,524288
	and	a2,a1,a5
	sub	a2,a2,a5
	sub	a2,a1,a2
	and	a3,a1,a5
	sub	a5,a2,a3
	jal	x0,.L1
	.size	my_cos, .-my_cos
	.align	2
	.type	SolveCubic, @function
SolveCubic:
	addi	sp,sp,-288
	sw	s2,272(sp)
	sw	s3,268(sp)
	addi	s2,a0,0
	addi	s3,a1,0
	addi	a0,a2,0
	addi	a1,a3,0
	addi	a2,s2,0
	addi	a3,s3,0
	sw	ra,284(sp)
	sw	a6,8(sp)
	sw	a7,12(sp)
	sw	s0,280(sp)
	sw	s1,276(sp)
	addi	s0,a4,0
	addi	s1,a5,0
	sw	s4,264(sp)
	sw	s5,260(sp)
	sw	s6,256(sp)
	sw	s7,252(sp)
	sw	s8,248(sp)
	sw	s9,244(sp)
	sw	s10,240(sp)
	sw	s11,236(sp)
.Lpcrel_39:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_39)
	addi	a2,a1,0
	sw	a0,16(sp)
	addi	a1,a0,0
	addi	a0,sp,208
	sw	a2,20(sp)
.Lpcrel_40:
	auipc	ra,%pcrel_hi(__extenddftf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_40)
	addi	a3,s3,0
	addi	a2,s2,0
	addi	a0,s0,0
	addi	a1,s1,0
	sw	s2,0(sp)
	sw	s3,4(sp)
.Lpcrel_41:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_41)
	lw	s9,208(sp)
	lw	s8,212(sp)
	lw	s5,216(sp)
	lw	s1,220(sp)
	addi	a2,a1,0
	addi	a1,a0,0
	addi	a0,sp,208
.Lpcrel_42:
	auipc	ra,%pcrel_hi(__extenddftf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_42)
	addi	a1,sp,192
	lw	s10,208(sp)
	lw	s11,212(sp)
	lw	s7,216(sp)
	lw	s6,220(sp)
	addi	a2,sp,176
	addi	a0,sp,208
	sw	s9,192(sp)
	sw	s8,196(sp)
	sw	s5,200(sp)
	sw	s1,204(sp)
	sw	s9,176(sp)
	sw	s8,180(sp)
	sw	s5,184(sp)
	sw	s1,188(sp)
.Lpcrel_43:
	auipc	ra,%pcrel_hi(__multf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_43)
	lui	a5,262152
	addi	a2,sp,160
	addi	a1,sp,176
	addi	a0,sp,192
	lw	s4,208(sp)
	lw	s3,212(sp)
	lw	s2,216(sp)
	lw	s0,220(sp)
	sw	a5,172(sp)
	sw	s10,176(sp)
	sw	s11,180(sp)
	sw	s7,184(sp)
	sw	s6,188(sp)
	sw	zero,160(sp)
	sw	zero,164(sp)
	sw	zero,168(sp)
.Lpcrel_44:
	auipc	ra,%pcrel_hi(__multf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_44)
	lw	a5,200(sp)
	lw	a3,192(sp)
	lw	a4,196(sp)
	sw	a5,152(sp)
	lw	a5,204(sp)
	addi	a2,sp,144
	addi	a1,sp,160
	addi	a0,sp,176
	sw	s4,160(sp)
	sw	s3,164(sp)
	sw	s2,168(sp)
	sw	s0,172(sp)
	sw	a3,144(sp)
	sw	a4,148(sp)
	sw	a5,156(sp)
.Lpcrel_45:
	auipc	ra,%pcrel_hi(__subtf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_45)
	lw	a4,180(sp)
	lw	a5,184(sp)
	lw	a3,176(sp)
	sw	a4,148(sp)
	lw	a4,188(sp)
	sw	a5,152(sp)
	addi	a2,sp,128
	lui	a5,262178
	addi	a1,sp,144
	addi	a0,sp,160
	sw	a5,140(sp)
	sw	a3,144(sp)
	sw	a4,156(sp)
	sw	zero,128(sp)
	sw	zero,132(sp)
	sw	zero,136(sp)
.Lpcrel_46:
	auipc	ra,%pcrel_hi(__divtf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_46)
	addi	a2,sp,176
	addi	a1,sp,192
	addi	a0,sp,208
	lw	s4,160(sp)
	lw	s3,164(sp)
	lw	s2,168(sp)
	lw	s0,172(sp)
	sw	s9,192(sp)
	sw	s8,196(sp)
	sw	s5,200(sp)
	sw	s1,204(sp)
	sw	s9,176(sp)
	sw	s8,180(sp)
	sw	s5,184(sp)
	sw	s1,188(sp)
.Lpcrel_47:
	auipc	ra,%pcrel_hi(__addtf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_47)
	lw	a4,216(sp)
	lw	a2,208(sp)
	lw	a3,212(sp)
	sw	a4,184(sp)
	lw	a4,220(sp)
	sw	a2,176(sp)
	addi	a1,sp,176
	addi	a2,sp,160
	addi	a0,sp,192
	sw	s9,160(sp)
	sw	s8,164(sp)
	sw	s5,168(sp)
	sw	s1,172(sp)
	sw	a3,180(sp)
	sw	a4,188(sp)
.Lpcrel_48:
	auipc	ra,%pcrel_hi(__multf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_48)
	lw	a4,200(sp)
	lw	a2,192(sp)
	lw	a3,196(sp)
	sw	a4,168(sp)
	lw	a4,204(sp)
	sw	a2,160(sp)
	addi	a1,sp,160
	addi	a2,sp,144
	addi	a0,sp,176
	sw	a3,164(sp)
	sw	a4,172(sp)
	sw	s9,144(sp)
	sw	s8,148(sp)
	sw	s5,152(sp)
	sw	s1,156(sp)
.Lpcrel_49:
	auipc	ra,%pcrel_hi(__multf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_49)
	lui	a5,262178
	addi	a2,sp,128
	addi	a1,sp,144
	addi	a0,sp,160
	sw	s9,144(sp)
	sw	s8,148(sp)
	lw	s9,176(sp)
	lw	s8,180(sp)
	sw	s5,152(sp)
	sw	s1,156(sp)
	lw	s5,184(sp)
	lw	s1,188(sp)
	sw	a5,140(sp)
	sw	zero,128(sp)
	sw	zero,132(sp)
	sw	zero,136(sp)
.Lpcrel_50:
	auipc	ra,%pcrel_hi(__multf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_50)
	lw	a2,160(sp)
	lw	a3,164(sp)
	lw	a4,168(sp)
	lw	a5,172(sp)
	addi	a0,sp,144
	sw	a2,128(sp)
	addi	a1,sp,128
	addi	a2,sp,112
	sw	s10,112(sp)
	sw	s11,116(sp)
	sw	s7,120(sp)
	sw	s6,124(sp)
	sw	a3,132(sp)
	sw	a4,136(sp)
	sw	a5,140(sp)
.Lpcrel_51:
	auipc	ra,%pcrel_hi(__multf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_51)
	lw	a5,152(sp)
	lw	a4,148(sp)
	lw	a3,144(sp)
	sw	a5,104(sp)
	lw	a5,156(sp)
	addi	a0,sp,128
	addi	a2,sp,96
	addi	a1,sp,112
	sw	a4,100(sp)
	sw	a5,108(sp)
	sw	s9,112(sp)
	sw	s8,116(sp)
	sw	s5,120(sp)
	sw	s1,124(sp)
	sw	a3,96(sp)
.Lpcrel_52:
	auipc	ra,%pcrel_hi(__subtf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_52)
	lw	a6,8(sp)
	lw	a7,12(sp)
	lw	a2,0(sp)
	lw	a3,4(sp)
	addi	a0,a6,0
	addi	a1,a7,0
.Lpcrel_53:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_53)
	addi	a2,a1,0
	addi	a1,a0,0
	addi	a0,sp,112
	lw	s7,128(sp)
	lw	s6,132(sp)
	lw	s5,136(sp)
	lw	s1,140(sp)
.Lpcrel_54:
	auipc	ra,%pcrel_hi(__extenddftf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_54)
	lw	a5,120(sp)
	lw	a4,116(sp)
	lw	a3,112(sp)
	sw	a5,88(sp)
	lw	a5,124(sp)
	sw	a4,84(sp)
	addi	a0,sp,96
	lui	a4,262203
	addi	a1,sp,80
	addi	a2,sp,64
	sw	a3,80(sp)
	sw	a4,76(sp)
	sw	a5,92(sp)
	sw	zero,64(sp)
	sw	zero,68(sp)
	sw	zero,72(sp)
.Lpcrel_55:
	auipc	ra,%pcrel_hi(__multf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_55)
	lw	a5,104(sp)
	lw	a3,96(sp)
	lw	a4,100(sp)
	sw	a5,56(sp)
	lw	a5,108(sp)
	addi	a0,sp,80
	addi	a2,sp,48
	addi	a1,sp,64
	sw	s7,64(sp)
	sw	s6,68(sp)
	sw	s5,72(sp)
	sw	s1,76(sp)
	sw	a3,48(sp)
	sw	a4,52(sp)
	sw	a5,60(sp)
.Lpcrel_56:
	auipc	ra,%pcrel_hi(__addtf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_56)
	lw	a5,88(sp)
	lw	a4,84(sp)
	lw	a3,80(sp)
	sw	a5,56(sp)
	lw	a5,92(sp)
	addi	a2,sp,32
	sw	a4,52(sp)
	addi	a1,sp,48
	lui	a4,262219
	addi	a0,sp,64
	sw	a3,48(sp)
	sw	a4,44(sp)
	sw	a5,60(sp)
	sw	zero,32(sp)
	sw	zero,36(sp)
	sw	zero,40(sp)
.Lpcrel_57:
	auipc	ra,%pcrel_hi(__divtf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_57)
	lw	s8,64(sp)
	lw	s7,68(sp)
	lw	s6,72(sp)
	lw	s1,76(sp)
	addi	a0,sp,208
	sw	s8,208(sp)
	sw	s7,212(sp)
	sw	s6,216(sp)
	sw	s1,220(sp)
.Lpcrel_58:
	auipc	ra,%pcrel_hi(__trunctfdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_58)
	sw	a0,0(sp)
	addi	a0,sp,208
	sw	s4,208(sp)
	sw	s3,212(sp)
	sw	s2,216(sp)
	sw	s0,220(sp)
	addi	s5,a1,0
	addi	s11,a1,0
.Lpcrel_59:
	auipc	ra,%pcrel_hi(__trunctfdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_59)
	sw	a0,8(sp)
	sw	a1,28(sp)
	addi	a2,sp,176
	addi	a1,sp,192
	addi	a0,sp,208
	sw	s4,192(sp)
	sw	s3,196(sp)
	sw	s2,200(sp)
	sw	s0,204(sp)
	sw	s4,176(sp)
	sw	s3,180(sp)
	sw	s2,184(sp)
	sw	s0,188(sp)
.Lpcrel_60:
	auipc	ra,%pcrel_hi(__multf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_60)
	lw	a5,216(sp)
	lw	a3,208(sp)
	lw	a4,212(sp)
	sw	a5,184(sp)
	lw	a5,220(sp)
	addi	a2,sp,160
	addi	a1,sp,176
	addi	a0,sp,192
	sw	a3,176(sp)
	sw	a4,180(sp)
	sw	a5,188(sp)
	sw	s4,160(sp)
	sw	s3,164(sp)
	sw	s2,168(sp)
	sw	s0,172(sp)
.Lpcrel_61:
	auipc	ra,%pcrel_hi(__multf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_61)
	addi	a2,sp,176
	addi	a1,sp,192
	addi	a0,sp,208
	lw	s4,196(sp)
	lw	s9,200(sp)
	lw	s2,192(sp)
	lw	s10,204(sp)
	sw	s8,176(sp)
	sw	s7,180(sp)
	sw	s6,184(sp)
	sw	s1,188(sp)
	sw	s8,192(sp)
	sw	s7,196(sp)
	sw	s6,200(sp)
	sw	s1,204(sp)
.Lpcrel_62:
	auipc	ra,%pcrel_hi(__multf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_62)
	lw	a1,208(sp)
	lw	a3,212(sp)
	lw	a4,216(sp)
	lw	a5,220(sp)
	addi	a2,sp,160
	sw	a1,176(sp)
	addi	a0,sp,192
	addi	a1,sp,176
	sw	s4,164(sp)
	sw	s9,168(sp)
	sw	a3,180(sp)
	sw	a4,184(sp)
	sw	a5,188(sp)
	sw	s2,160(sp)
	sw	s10,172(sp)
.Lpcrel_63:
	auipc	ra,%pcrel_hi(__subtf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_63)
	lw	a2,192(sp)
	lw	a3,196(sp)
	lw	a4,200(sp)
	lw	a5,204(sp)
	addi	a0,sp,176
	sw	a2,176(sp)
	sw	a3,180(sp)
	sw	a4,184(sp)
	sw	a5,188(sp)
.Lpcrel_64:
	auipc	ra,%pcrel_hi(__trunctfdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_64)
	addi	s3,a0,0
	addi	a0,sp,208
	sw	s4,212(sp)
	sw	s9,216(sp)
	addi	s0,a1,0
	sw	s2,208(sp)
	sw	s10,220(sp)
.Lpcrel_65:
	auipc	ra,%pcrel_hi(__trunctfdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_65)
	addi	a2,zero,0
	addi	a3,zero,0
	addi	s9,a0,0
	addi	s4,a1,0
.Lpcrel_66:
	auipc	ra,%pcrel_hi(__gtdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_66)
	blt	zero,a0,.+8
	jal	x0,.L84
	addi	a0,s3,0
	addi	a1,s0,0
	addi	a2,zero,0
	addi	a3,zero,0
.Lpcrel_67:
	auipc	ra,%pcrel_hi(__ledf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_67)
	blt	a0,zero,.+8
	jal	x0,8
	jal	x0,.L85
.L18:
	lui	s2,%hi(.LC16)
	lw	s4,%lo(.LC16+4)(s2)
	lw	s9,%lo(.LC16)(s2)
	lw	a4,288(sp)
	addi	a5,zero,1
	addi	a0,s3,0
	addi	a2,s9,0
	addi	a1,s0,0
	addi	a3,s4,0
	sw	a5,0(a4)
.Lpcrel_68:
	auipc	ra,%pcrel_hi(__ltdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_68)
	blt	a0,zero,.L39
	addi	s9,s3,0
	addi	s4,s0,0
.L39:
	addi	s9,a0,0
	addi	s10,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s3,0
	addi	a1,s0,0
.Lpcrel_87:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_87)
	addi	a2,s9,0
	addi	a3,s10,0
.Lpcrel_88:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_88)
	lw	a2,%lo(.LC1)(s4)
	lw	a3,%lo(.LC1+4)(s4)
.Lpcrel_89:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_89)
	addi	s9,a0,0
	addi	s10,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s3,0
	addi	a1,s0,0
.Lpcrel_90:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_90)
	addi	a2,s9,0
	addi	a3,s10,0
.Lpcrel_91:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_91)
	lw	a2,%lo(.LC1)(s4)
	lw	a3,%lo(.LC1+4)(s4)
.Lpcrel_92:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_92)
	addi	s9,a0,0
	addi	s10,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s3,0
	addi	a1,s0,0
.Lpcrel_93:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_93)
	addi	a2,s9,0
	addi	a3,s10,0
.Lpcrel_94:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_94)
	lw	a2,%lo(.LC1)(s4)
	lw	a3,%lo(.LC1+4)(s4)
.Lpcrel_95:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_95)
	addi	s9,a0,0
	addi	s10,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s3,0
	addi	a1,s0,0
.Lpcrel_96:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_96)
	addi	a2,s9,0
	addi	a3,s10,0
.Lpcrel_97:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_97)
	lw	a2,%lo(.LC1)(s4)
	lw	a3,%lo(.LC1+4)(s4)
.Lpcrel_98:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_98)
	addi	s9,a0,0
	addi	s10,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s3,0
	addi	a1,s0,0
.Lpcrel_99:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_99)
	addi	a2,s9,0
	addi	a3,s10,0
.Lpcrel_100:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_100)
	lw	a2,%lo(.LC1)(s4)
	lw	a3,%lo(.LC1+4)(s4)
.Lpcrel_101:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_101)
	addi	a2,a0,0
	addi	a3,a1,0
	addi	s9,a0,0
	addi	s10,a1,0
	addi	a0,s3,0
	addi	a1,s0,0
.Lpcrel_102:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_102)
	addi	a2,s9,0
	addi	a3,s10,0
.Lpcrel_103:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_103)
	lw	a2,%lo(.LC1)(s4)
	lw	a3,%lo(.LC1+4)(s4)
.Lpcrel_104:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_104)
	addi	s3,a0,0
	lw	a0,0(sp)
	addi	s4,a1,0
	addi	a2,zero,0
	addi	a1,s5,0
	addi	a3,zero,0
.Lpcrel_105:
	auipc	ra,%pcrel_hi(__ltdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_105)
	blt	a0,zero,.L86
	addi	a2,s9,0
	addi	a3,s4,0
	addi	a0,s3,0
	addi	a1,s0,0
.Lpcrel_69:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_69)
	addi	a2,s9,0
	addi	a3,s4,0
.Lpcrel_70:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_70)
	lui	s4,%hi(.LC1)
	lw	a2,%lo(.LC1)(s4)
	lw	a3,%lo(.LC1+4)(s4)
.Lpcrel_71:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_71)
	addi	s9,a0,0
	addi	s10,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s3,0
	addi	a1,s0,0
.Lpcrel_72:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_72)
	addi	a2,s9,0
	addi	a3,s10,0
.Lpcrel_73:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_73)
	lw	a2,%lo(.LC1)(s4)
	lw	a3,%lo(.LC1+4)(s4)
.Lpcrel_74:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_74)
	addi	s9,a0,0
	addi	s10,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s3,0
	addi	a1,s0,0
.Lpcrel_75:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_75)
	addi	a2,s9,0
	addi	a3,s10,0
.Lpcrel_76:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_76)
	lw	a2,%lo(.LC1)(s4)
	lw	a3,%lo(.LC1+4)(s4)
.Lpcrel_77:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_77)
	addi	s9,a0,0
	addi	s10,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s3,0
	addi	a1,s0,0
.Lpcrel_78:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_78)
	addi	a2,s9,0
	addi	a3,s10,0
.Lpcrel_79:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_79)
	lw	a2,%lo(.LC1)(s4)
	lw	a3,%lo(.LC1+4)(s4)
.Lpcrel_80:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_80)
	addi	s9,a0,0
	addi	s10,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s3,0
	addi	a1,s0,0
.Lpcrel_81:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_81)
	addi	a2,s9,0
	addi	a3,s10,0
.Lpcrel_82:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_82)
	lw	a2,%lo(.LC1)(s4)
	lw	a3,%lo(.LC1+4)(s4)
.Lpcrel_83:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_83)
	addi	s9,a0,0
	addi	s10,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s3,0
	addi	a1,s0,0
.Lpcrel_84:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_84)
	addi	a2,s9,0
	addi	a3,s10,0
.Lpcrel_85:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_85)
	lw	a2,%lo(.LC1)(s4)
	lw	a3,%lo(.LC1+4)(s4)
.Lpcrel_86:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_86)
.L41:
	lw	a0,0(sp)
	addi	a2,s3,0
	addi	a3,s4,0
	addi	a1,s11,0
.Lpcrel_106:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_106)
	addi	a2,zero,0
	addi	a3,zero,0
	addi	s10,a0,0
	addi	s9,a1,0
.Lpcrel_107:
	auipc	ra,%pcrel_hi(__eqdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_107)
	beq	a0,zero,.L58
	lw	s4,%lo(.LC16+4)(s2)
	lw	s5,%lo(.LC16)(s2)
	addi	a0,s10,0
	addi	a1,s9,0
	addi	a2,s5,0
	addi	a3,s4,0
.Lpcrel_108:
	auipc	ra,%pcrel_hi(__ltdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_108)
	blt	a0,zero,.L45
	addi	s5,s10,0
	addi	s4,s9,0
.L45:
	lui	s3,%hi(.LC25)
	addi	s0,zero,18
.L48:
	addi	a2,s5,0
	addi	a3,s4,0
	addi	a0,s5,0
	addi	a1,s4,0
.Lpcrel_109:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_109)
	addi	a2,zero,0
	addi	a3,zero,0
	sw	a0,0(sp)
	sw	a1,4(sp)
.Lpcrel_110:
	auipc	ra,%pcrel_hi(__eqdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_110)
	addi	a2,s5,0
	beq	a0,zero,.L47
	addi	a3,s4,0
	addi	a0,a2,0
	addi	a1,s4,0
.Lpcrel_111:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_111)
	lw	a2,0(sp)
	lw	a3,4(sp)
	addi	s4,a0,0
	addi	s5,a1,0
	addi	a0,s10,0
	addi	a1,s9,0
.Lpcrel_112:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_112)
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s4,0
	addi	a1,s5,0
.Lpcrel_113:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_113)
	lui	a5,%hi(.LC25)
	lw	a2,%lo(.LC25)(a5)
	lw	a3,%lo(.LC25+4)(a5)
	addi	s0,s0,-1
.Lpcrel_114:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_114)
	addi	s5,a0,0
	addi	s4,a1,0
	beq	s0,zero,.+8
	jal	x0,.L48
.L47:
	addi	a0,s5,0
	addi	a1,s4,0
	addi	a2,zero,0
	addi	a3,zero,0
.Lpcrel_115:
	auipc	ra,%pcrel_hi(__nedf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_115)
	beq	a0,zero,.+8
	jal	x0,8
	jal	x0,.L43
	lw	a0,8(sp)
	lw	a1,28(sp)
	addi	a2,s5,0
	addi	a3,s4,0
.Lpcrel_116:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_116)
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s5,0
	addi	a1,s4,0
.Lpcrel_117:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_117)
	addi	s5,a0,0
	addi	s4,a1,0
	jal	x0,.L43
.L85:
	lui	s2,%hi(.LC16)
	lw	s0,%lo(.LC16+4)(s2)
	lw	s1,%lo(.LC16)(s2)
	addi	a0,s9,0
	addi	a1,s4,0
	addi	a2,s1,0
	addi	a3,s0,0
.Lpcrel_118:
	auipc	ra,%pcrel_hi(__ltdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_118)
	blt	a0,zero,.L21
	addi	s1,s9,0
	addi	s0,s4,0
.L21:
	addi	a2,s1,0
	addi	a3,s0,0
	addi	a0,s9,0
	addi	a1,s4,0
.Lpcrel_119:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_119)
	addi	a2,s1,0
	addi	a3,s0,0
	lui	s11,%hi(.LC1)
.Lpcrel_120:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_120)
	lw	a2,%lo(.LC1)(s11)
	lw	a3,%lo(.LC1+4)(s11)
.Lpcrel_121:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_121)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s9,0
	addi	a1,s4,0
.Lpcrel_122:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_122)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_123:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_123)
	lw	a2,%lo(.LC1)(s11)
	lw	a3,%lo(.LC1+4)(s11)
.Lpcrel_124:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_124)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s9,0
	addi	a1,s4,0
.Lpcrel_125:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_125)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_126:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_126)
	lw	a2,%lo(.LC1)(s11)
	lw	a3,%lo(.LC1+4)(s11)
.Lpcrel_127:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_127)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s9,0
	addi	a1,s4,0
.Lpcrel_128:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_128)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_129:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_129)
	lw	a2,%lo(.LC1)(s11)
	lw	a3,%lo(.LC1+4)(s11)
.Lpcrel_130:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_130)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s9,0
	addi	a1,s4,0
.Lpcrel_131:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_131)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_132:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_132)
	lw	a2,%lo(.LC1)(s11)
	lw	a3,%lo(.LC1+4)(s11)
.Lpcrel_133:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_133)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s9,0
	addi	a1,s4,0
.Lpcrel_134:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_134)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_135:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_135)
	lw	a2,%lo(.LC1)(s11)
	lw	a3,%lo(.LC1+4)(s11)
.Lpcrel_136:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_136)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s9,0
	addi	a1,s4,0
.Lpcrel_137:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_137)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_138:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_138)
	lw	a2,%lo(.LC1)(s11)
	lw	a3,%lo(.LC1+4)(s11)
.Lpcrel_139:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_139)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s9,0
	addi	a1,s4,0
.Lpcrel_140:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_140)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_141:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_141)
	lw	a2,%lo(.LC1)(s11)
	lw	a3,%lo(.LC1+4)(s11)
.Lpcrel_142:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_142)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s9,0
	addi	a1,s4,0
.Lpcrel_143:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_143)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_144:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_144)
	lw	a2,%lo(.LC1)(s11)
	lw	a3,%lo(.LC1+4)(s11)
.Lpcrel_145:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_145)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s9,0
	addi	a1,s4,0
.Lpcrel_146:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_146)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_147:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_147)
	lw	a2,%lo(.LC1)(s11)
	lw	a3,%lo(.LC1+4)(s11)
.Lpcrel_148:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_148)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s9,0
	addi	a1,s4,0
.Lpcrel_149:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_149)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_150:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_150)
	lw	a2,%lo(.LC1)(s11)
	lw	a3,%lo(.LC1+4)(s11)
.Lpcrel_151:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_151)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s9,0
	addi	a1,s4,0
.Lpcrel_152:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_152)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_153:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_153)
	lw	a2,%lo(.LC1)(s11)
	lw	a3,%lo(.LC1+4)(s11)
.Lpcrel_154:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_154)
	addi	a2,zero,0
	addi	a3,zero,0
	addi	s0,a0,0
	addi	s1,a1,0
.Lpcrel_155:
	auipc	ra,%pcrel_hi(__gtdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_155)
	blt	zero,a0,.+8
	jal	x0,.L17
	lw	a0,0(sp)
	addi	a2,s0,0
	addi	a3,s1,0
	addi	a1,s5,0
.Lpcrel_156:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_156)
	lw	a2,%lo(.LC16)(s2)
	lw	a3,%lo(.LC16+4)(s2)
	addi	s0,a0,0
	addi	s1,a1,0
.Lpcrel_157:
	auipc	ra,%pcrel_hi(__gtdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_157)
	addi	s4,zero,0
	addi	s3,zero,0
	blt	zero,a0,.+8
	jal	x0,.L87
.L24:
	lw	s6,8(sp)
	lw	s5,28(sp)
	lw	a4,288(sp)
	addi	a5,zero,3
	addi	a0,s6,0
	addi	a1,s5,0
	addi	a2,zero,0
	addi	a3,zero,0
	sw	a5,0(a4)
.Lpcrel_158:
	auipc	ra,%pcrel_hi(__gedf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_158)
	blt	a0,zero,.L57
	addi	a0,s6,0
	addi	a1,s5,0
	addi	a2,zero,0
	addi	a3,zero,0
.Lpcrel_159:
	auipc	ra,%pcrel_hi(__eqdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_159)
	beq	a0,zero,.+8
	jal	x0,8
	jal	x0,.L57
	lui	s2,%hi(.LC16)
	lw	s0,%lo(.LC16+4)(s2)
	lw	s1,%lo(.LC16)(s2)
	addi	a0,s6,0
	addi	a1,s5,0
	addi	a2,s1,0
	addi	a3,s0,0
.Lpcrel_160:
	auipc	ra,%pcrel_hi(__ltdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_160)
	blt	a0,zero,.L35
	addi	s1,s6,0
	addi	s0,s5,0
.L35:
	lw	s6,8(sp)
	lw	s5,28(sp)
	addi	a2,s1,0
	addi	a3,s0,0
	addi	a0,s6,0
	addi	a1,s5,0
.Lpcrel_161:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_161)
	addi	a2,s1,0
	addi	a3,s0,0
	lui	s2,%hi(.LC1)
.Lpcrel_162:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_162)
	lw	a2,%lo(.LC1)(s2)
	lw	a3,%lo(.LC1+4)(s2)
.Lpcrel_163:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_163)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s6,0
	addi	a1,s5,0
.Lpcrel_164:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_164)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_165:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_165)
	lw	a2,%lo(.LC1)(s2)
	lw	a3,%lo(.LC1+4)(s2)
.Lpcrel_166:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_166)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s6,0
	addi	a1,s5,0
.Lpcrel_167:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_167)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_168:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_168)
	lw	a2,%lo(.LC1)(s2)
	lw	a3,%lo(.LC1+4)(s2)
.Lpcrel_169:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_169)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s6,0
	addi	a1,s5,0
.Lpcrel_170:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_170)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_171:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_171)
	lw	a2,%lo(.LC1)(s2)
	lw	a3,%lo(.LC1+4)(s2)
.Lpcrel_172:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_172)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s6,0
	addi	a1,s5,0
.Lpcrel_173:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_173)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_174:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_174)
	lw	a2,%lo(.LC1)(s2)
	lw	a3,%lo(.LC1+4)(s2)
.Lpcrel_175:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_175)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s6,0
	addi	a1,s5,0
.Lpcrel_176:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_176)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_177:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_177)
	lw	a2,%lo(.LC1)(s2)
	lw	a3,%lo(.LC1+4)(s2)
.Lpcrel_178:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_178)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s6,0
	addi	a1,s5,0
.Lpcrel_179:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_179)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_180:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_180)
	lw	a2,%lo(.LC1)(s2)
	lw	a3,%lo(.LC1+4)(s2)
.Lpcrel_181:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_181)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s6,0
	addi	a1,s5,0
.Lpcrel_182:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_182)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_183:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_183)
	lw	a2,%lo(.LC1)(s2)
	lw	a3,%lo(.LC1+4)(s2)
.Lpcrel_184:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_184)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s6,0
	addi	a1,s5,0
.Lpcrel_185:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_185)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_186:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_186)
	lw	a2,%lo(.LC1)(s2)
	lw	a3,%lo(.LC1+4)(s2)
.Lpcrel_187:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_187)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s6,0
	addi	a1,s5,0
.Lpcrel_188:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_188)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_189:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_189)
	lw	a2,%lo(.LC1)(s2)
	lw	a3,%lo(.LC1+4)(s2)
.Lpcrel_190:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_190)
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s6,0
	addi	a1,s5,0
.Lpcrel_191:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_191)
	addi	a2,s0,0
	addi	a3,s1,0
.Lpcrel_192:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_192)
	lw	a2,%lo(.LC1)(s2)
	lw	a3,%lo(.LC1+4)(s2)
.Lpcrel_193:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_193)
	addi	s1,a1,0
	addi	a2,a0,0
	addi	a3,a1,0
	addi	s0,a0,0
	addi	a1,s5,0
	addi	a0,s6,0
.Lpcrel_194:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_194)
	addi	a3,s1,0
	addi	a2,s0,0
.Lpcrel_195:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_195)
	lw	a2,%lo(.LC1)(s2)
	lw	a3,%lo(.LC1+4)(s2)
.Lpcrel_196:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_196)
	lui	a5,%hi(.LC24)
	lw	a2,%lo(.LC24)(a5)
	lw	a3,%lo(.LC24+4)(a5)
.Lpcrel_197:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_197)
	addi	s2,a0,0
	addi	s1,a1,0
	jal	x0,.L32
.L86:
	lui	a5,524288
	and	s11,s5,a5
	sub	s11,s11,a5
	sub	s11,s5,s11
	and	a0,s5,a5
	sub	s11,s11,a0
	jal	x0,.L41
.L58:
	addi	s5,zero,0
	addi	s4,zero,0
	lui	s3,%hi(.LC25)
.L43:
	addi	a1,sp,192
	addi	a0,sp,208
	sw	s8,208(sp)
	sw	s7,212(sp)
	sw	s6,216(sp)
	sw	s1,220(sp)
	sw	zero,192(sp)
	sw	zero,196(sp)
	sw	zero,200(sp)
	sw	zero,204(sp)
.Lpcrel_198:
	auipc	ra,%pcrel_hi(__lttf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_198)
	blt	a0,zero,.L50
	lui	a5,524288
	and	a0,a5,s4
	sub	a0,a0,s4
	sub	a0,a5,a0
	and	a1,a5,s4
	sub	s4,a0,a1
.L50:
	lw	a2,%lo(.LC25)(s3)
	lw	a3,%lo(.LC25+4)(s3)
	lw	a0,16(sp)
	lw	a1,20(sp)
.Lpcrel_199:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_199)
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s5,0
	addi	a1,s4,0
.Lpcrel_200:
	auipc	ra,%pcrel_hi(__subdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_200)
	lw	a5,292(sp)
	sw	a0,0(a5)
	sw	a1,4(a5)
.L15:
	lw	ra,284(sp)
	lw	s0,280(sp)
	lw	s1,276(sp)
	lw	s2,272(sp)
	lw	s3,268(sp)
	lw	s4,264(sp)
	lw	s5,260(sp)
	lw	s6,256(sp)
	lw	s7,252(sp)
	lw	s8,248(sp)
	lw	s9,244(sp)
	lw	s10,240(sp)
	lw	s11,236(sp)
	addi	sp,sp,288
	jalr	zero,ra,0
.L57:
	lui	a5,%hi(.LC18)
	lw	s2,%lo(.LC18)(a5)
	lw	s1,%lo(.LC18+4)(a5)
.L32:
	lui	s0,%hi(.LC25)
	lw	a2,%lo(.LC25)(s0)
	lw	a3,%lo(.LC25+4)(s0)
	lw	a0,16(sp)
	lw	a1,20(sp)
.Lpcrel_201:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_201)
	lw	a2,%lo(.LC25)(s0)
	lw	a3,%lo(.LC25+4)(s0)
	addi	s6,a0,0
	addi	s7,a1,0
	addi	a0,s4,0
	addi	a1,s3,0
.Lpcrel_202:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_202)
.Lpcrel_203:
	auipc	ra,%pcrel_hi(my_cos)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_203)
	addi	a2,s2,0
	addi	a3,s1,0
.Lpcrel_204:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_204)
	addi	a2,s6,0
	addi	a3,s7,0
.Lpcrel_205:
	auipc	ra,%pcrel_hi(__subdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_205)
	lw	a6,292(sp)
	lui	a3,%hi(.LC26)
	lw	a2,%lo(.LC26)(a3)
	lw	a3,%lo(.LC26+4)(a3)
	addi	a4,a0,0
	addi	a5,a1,0
	sw	a4,0(a6)
	sw	a5,4(a6)
	addi	a0,s4,0
	addi	a1,s3,0
.Lpcrel_206:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_206)
	lw	a2,%lo(.LC25)(s0)
	lw	a3,%lo(.LC25+4)(s0)
.Lpcrel_207:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_207)
.Lpcrel_208:
	auipc	ra,%pcrel_hi(my_cos)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_208)
	addi	a2,s2,0
	addi	a3,s1,0
.Lpcrel_209:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_209)
	addi	a2,s6,0
	addi	a3,s7,0
.Lpcrel_210:
	auipc	ra,%pcrel_hi(__subdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_210)
	lw	a6,292(sp)
	lui	a3,%hi(.LC27)
	lw	a2,%lo(.LC27)(a3)
	lw	a3,%lo(.LC27+4)(a3)
	addi	a5,a1,0
	addi	a4,a0,0
	sw	a5,12(a6)
	sw	a4,8(a6)
	addi	a0,s4,0
	addi	a1,s3,0
.Lpcrel_211:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_211)
	lw	a2,%lo(.LC25)(s0)
	lw	a3,%lo(.LC25+4)(s0)
.Lpcrel_212:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_212)
.Lpcrel_213:
	auipc	ra,%pcrel_hi(my_cos)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_213)
	addi	a2,s2,0
	addi	a3,s1,0
.Lpcrel_214:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_214)
	addi	a2,s6,0
	addi	a3,s7,0
.Lpcrel_215:
	auipc	ra,%pcrel_hi(__subdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_215)
	lw	a5,292(sp)
	sw	a0,16(a5)
	sw	a1,20(a5)
	jal	x0,.L15
.L84:
	addi	a0,s3,0
	addi	a1,s0,0
	addi	a2,zero,0
	addi	a3,zero,0
.Lpcrel_216:
	auipc	ra,%pcrel_hi(__ledf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_216)
	blt	a0,zero,.+8
	jal	x0,.L18
.L17:
	lw	a0,0(sp)
	addi	a1,s5,0
	addi	a2,zero,0
	addi	a3,zero,0
.Lpcrel_217:
	auipc	ra,%pcrel_hi(__gedf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_217)
	addi	s4,zero,0
	addi	s3,zero,0
	blt	a0,zero,.+8
	jal	x0,.L24
	lui	a5,%hi(.LC17)
	lw	s4,%lo(.LC17)(a5)
	lw	s3,%lo(.LC17+4)(a5)
	jal	x0,.L24
.L87:
	lui	s3,%hi(.LC23)
	lw	s9,%lo(.LC23+4)(s3)
	lw	s8,%lo(.LC23)(s3)
	addi	a0,s0,0
	addi	a1,s1,0
	addi	a2,s8,0
	addi	a3,s9,0
.Lpcrel_218:
	auipc	ra,%pcrel_hi(__ltdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_218)
	blt	a0,zero,.+8
	jal	x0,8
	jal	x0,.L27
	addi	s8,s0,0
	addi	s9,s1,0
.L27:
	lw	a2,%lo(.LC16)(s2)
	lw	a3,%lo(.LC16+4)(s2)
	addi	a0,s8,0
	addi	a1,s9,0
.Lpcrel_219:
	auipc	ra,%pcrel_hi(__gedf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_219)
	blt	a0,zero,.+8
	jal	x0,.L53
	lw	a2,%lo(.LC23)(s3)
	lw	a3,%lo(.LC23+4)(s3)
	addi	a0,s8,0
	addi	a1,s9,0
.Lpcrel_220:
	auipc	ra,%pcrel_hi(__ledf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_220)
	lui	a5,%hi(.LC17)
	blt	zero,a0,.+8
	jal	x0,.L54
	lw	s6,%lo(.LC17)(a5)
	lw	s2,%lo(.LC17+4)(a5)
	lw	s4,%lo(.LC1)(s11)
	lw	s5,%lo(.LC1+4)(s11)
	addi	s10,zero,60
	addi	s7,zero,0
	addi	s3,zero,0
	jal	x0,.L31
.L89:
	addi	s10,s10,-1
	addi	s7,s1,0
	addi	s3,s0,0
	beq	s10,zero,.L88
.L31:
	addi	a2,s7,0
	addi	a3,s3,0
	addi	a0,s6,0
	addi	a1,s2,0
.Lpcrel_221:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_221)
	addi	a2,s4,0
	addi	a3,s5,0
.Lpcrel_222:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_222)
	addi	s1,a0,0
	addi	s0,a1,0
.Lpcrel_223:
	auipc	ra,%pcrel_hi(my_cos)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_223)
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s8,0
	addi	a1,s9,0
.Lpcrel_224:
	auipc	ra,%pcrel_hi(__ltdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_224)
	blt	a0,zero,.L89
	addi	s10,s10,-1
	addi	s6,s1,0
	addi	s2,s0,0
	beq	s10,zero,.+8
	jal	x0,.L31
.L88:
	addi	a3,s3,0
	addi	a2,s7,0
	addi	a0,s6,0
	addi	a1,s2,0
.Lpcrel_225:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_225)
	lw	a2,%lo(.LC1)(s11)
	lw	a3,%lo(.LC1+4)(s11)
.Lpcrel_226:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_226)
	addi	s4,a0,0
	addi	s3,a1,0
	jal	x0,.L24
.L54:
	lw	s4,%lo(.LC17)(a5)
	lw	s3,%lo(.LC17+4)(a5)
	jal	x0,.L24
.L53:
	addi	s4,zero,0
	addi	s3,zero,0
	jal	x0,.L24
	.size	SolveCubic, .-SolveCubic
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC30:
	.string	"********* CUBIC FUNCTIONS ***********"
	.align	2
.LC34:
	.string	"Solutions:"
	.align	2
.LC35:
	.string	" %f"
	.align	2
.LC43:
	.string	"********* INTEGER SQR ROOTS ***********"
	.align	2
.LC44:
	.string	"sqrt(%3d) = %2d\n"
	.align	2
.LC45:
	.string	"\nsqrt(%lX) = %X\n"
	.align	2
.LC46:
	.string	"********* ANGLE CONVERSION ***********"
	.align	2
.LC48:
	.string	"%3.0f degrees = %.12f radians\n"
	.align	2
.LC49:
	.string	"%.12f radians = %3.0f degrees\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lui	a0,%hi(.LC30)
	addi	sp,sp,-224
	addi	a0,a0,%lo(.LC30)
	sw	ra,220(sp)
	sw	s0,216(sp)
	sw	s1,212(sp)
	sw	s5,196(sp)
	sw	s6,192(sp)
	sw	s7,188(sp)
	sw	s2,208(sp)
	sw	s3,204(sp)
	sw	s4,200(sp)
	sw	s8,184(sp)
	sw	s9,180(sp)
	sw	s10,176(sp)
	sw	s11,172(sp)
.Lpcrel_227:
	auipc	ra,%pcrel_hi(puts)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_227)
	lui	s5,%hi(.LC31)
	lui	a5,%hi(.LC32)
	lui	a3,%hi(.LC33)
	lui	a1,%hi(.LC16)
	lw	a4,%lo(.LC32)(a5)
	lw	a2,%lo(.LC33)(a3)
	lw	a0,%lo(.LC16)(a1)
	lw	a6,%lo(.LC31)(s5)
	lw	a7,%lo(.LC31+4)(s5)
	lw	a5,%lo(.LC32+4)(a5)
	lw	a3,%lo(.LC33+4)(a3)
	lw	a1,%lo(.LC16+4)(a1)
	addi	t1,sp,132
	addi	s6,sp,136
	sw	t1,0(sp)
	sw	s6,4(sp)
.Lpcrel_228:
	auipc	ra,%pcrel_hi(SolveCubic)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_228)
	lui	a5,%hi(.LC34)
	addi	a0,a5,%lo(.LC34)
.Lpcrel_229:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_229)
	lw	s7,132(sp)
	addi	s1,zero,0
	addi	s0,zero,0
	blt	s7,zero,.+8
	jal	x0,8
	jal	x0,.L91
	lui	a5,%hi(.LC35)
	addi	s2,a5,%lo(.LC35)
	addi	s4,s6,0
	addi	s3,zero,0
.L92:
	lw	s8,0(s4)
	lw	s9,4(s4)
	addi	a0,s1,0
	addi	a1,s0,0
	addi	a2,s8,0
	addi	a3,s9,0
.Lpcrel_230:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_230)
	addi	s1,a0,0
	addi	a2,s8,0
	addi	a3,s9,0
	addi	a0,s2,0
	addi	s3,s3,1
	addi	s0,a1,0
	addi	s4,s4,8
.Lpcrel_231:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_231)
	beq	s3,s7,.+8
	jal	x0,.L92
.L91:
	addi	a0,zero,10
.Lpcrel_232:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_232)
	lui	a4,%hi(.LC16)
	lui	a5,%hi(.LC36)
	lui	a3,%hi(.LC37)
	lw	a6,%lo(.LC31)(s5)
	lw	a7,%lo(.LC31+4)(s5)
	lw	a0,%lo(.LC16)(a4)
	lw	a1,%lo(.LC16+4)(a4)
	lw	a2,%lo(.LC37)(a3)
	lw	a4,%lo(.LC36)(a5)
	lw	a3,%lo(.LC37+4)(a3)
	lw	a5,%lo(.LC36+4)(a5)
	addi	t1,sp,132
	sw	t1,0(sp)
	sw	s6,4(sp)
.Lpcrel_233:
	auipc	ra,%pcrel_hi(SolveCubic)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_233)
	lui	a5,%hi(.LC34)
	addi	a0,a5,%lo(.LC34)
.Lpcrel_234:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_234)
	lw	s5,132(sp)
	blt	zero,s5,.+8
	jal	x0,.L93
	lui	a5,%hi(.LC35)
	addi	s2,a5,%lo(.LC35)
	addi	s4,s6,0
	addi	s3,zero,0
.L94:
	lw	s8,0(s4)
	lw	s9,4(s4)
	addi	a0,s1,0
	addi	a1,s0,0
	addi	a2,s8,0
	addi	a3,s9,0
.Lpcrel_235:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_235)
	addi	s1,a0,0
	addi	a2,s8,0
	addi	a3,s9,0
	addi	a0,s2,0
	addi	s3,s3,1
	addi	s0,a1,0
	addi	s4,s4,8
.Lpcrel_236:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_236)
	beq	s3,s5,.+8
	jal	x0,.L94
.L93:
	addi	a0,zero,10
.Lpcrel_237:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_237)
	lui	a4,%hi(.LC38)
	lui	a2,%hi(.LC16)
	lui	a5,%hi(.LC39)
	lui	a3,%hi(.LC40)
	lw	a0,%lo(.LC16)(a2)
	lw	a1,%lo(.LC16+4)(a2)
	lw	a6,%lo(.LC38)(a4)
	lw	a7,%lo(.LC38+4)(a4)
	lw	a2,%lo(.LC40)(a3)
	lw	a4,%lo(.LC39)(a5)
	lw	a3,%lo(.LC40+4)(a3)
	lw	a5,%lo(.LC39+4)(a5)
	addi	t1,sp,132
	sw	t1,0(sp)
	sw	s6,4(sp)
.Lpcrel_238:
	auipc	ra,%pcrel_hi(SolveCubic)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_238)
	lui	a5,%hi(.LC34)
	addi	a0,a5,%lo(.LC34)
.Lpcrel_239:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_239)
	lw	s5,132(sp)
	blt	zero,s5,.+8
	jal	x0,.L95
	lui	a5,%hi(.LC35)
	addi	s2,a5,%lo(.LC35)
	addi	s4,s6,0
	addi	s3,zero,0
.L96:
	lw	s8,0(s4)
	lw	s9,4(s4)
	addi	a0,s1,0
	addi	a1,s0,0
	addi	a2,s8,0
	addi	a3,s9,0
.Lpcrel_240:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_240)
	addi	s1,a0,0
	addi	a2,s8,0
	addi	a3,s9,0
	addi	a0,s2,0
	addi	s3,s3,1
	addi	s0,a1,0
	addi	s4,s4,8
.Lpcrel_241:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_241)
	beq	s3,s5,.+8
	jal	x0,.L96
.L95:
	addi	a0,zero,10
.Lpcrel_242:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_242)
	lui	a5,%hi(.LC16)
	lw	a4,%lo(.LC16)(a5)
	lui	a2,%hi(.LC41)
	lw	a5,%lo(.LC16+4)(a5)
	lui	a3,%hi(.LC42)
	lw	a6,%lo(.LC41)(a2)
	lw	a7,%lo(.LC41+4)(a2)
	lw	a2,%lo(.LC42)(a3)
	lw	a3,%lo(.LC42+4)(a3)
	addi	t1,sp,132
	addi	a0,a4,0
	addi	a1,a5,0
	sw	t1,0(sp)
	sw	s6,4(sp)
.Lpcrel_243:
	auipc	ra,%pcrel_hi(SolveCubic)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_243)
	lui	a5,%hi(.LC34)
	addi	a0,a5,%lo(.LC34)
.Lpcrel_244:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_244)
	lw	s5,132(sp)
	blt	zero,s5,.+8
	jal	x0,.L97
	lui	a5,%hi(.LC35)
	addi	s2,a5,%lo(.LC35)
	addi	s4,s6,0
	addi	s3,zero,0
.L98:
	lw	s8,0(s4)
	lw	s9,4(s4)
	addi	a0,s1,0
	addi	a1,s0,0
	addi	a2,s8,0
	addi	a3,s9,0
.Lpcrel_245:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_245)
	addi	s1,a0,0
	addi	a2,s8,0
	addi	a3,s9,0
	addi	a0,s2,0
	addi	s3,s3,1
	addi	s0,a1,0
	addi	s4,s4,8
.Lpcrel_246:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_246)
	beq	s3,s5,.+8
	jal	x0,.L98
.L97:
	addi	a0,zero,10
.Lpcrel_247:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_247)
	lui	a5,%hi(.LC16)
	lw	a4,%lo(.LC16)(a5)
	lw	a5,%lo(.LC16+4)(a5)
	lui	a2,%hi(.LC1)
	sw	a4,44(sp)
	lw	a1,44(sp)
	sw	a5,48(sp)
	lui	a3,%hi(.LC23)
	sw	a1,60(sp)
	sw	a1,96(sp)
	addi	s4,a1,0
	lw	a1,48(sp)
	lui	a4,%hi(.LC28)
	lui	a5,%hi(.LC29)
	sw	a1,64(sp)
	sw	a1,100(sp)
	sw	a1,104(sp)
	lw	a1,%lo(.LC1)(a2)
	lw	a2,%lo(.LC1+4)(a2)
	lw	s9,%lo(.LC23+4)(a3)
	lw	s7,%lo(.LC29)(a5)
	sw	a2,76(sp)
	lw	a2,%lo(.LC23)(a3)
	lw	a3,%lo(.LC28)(a4)
	lw	a4,%lo(.LC28+4)(a4)
	lw	s11,%lo(.LC29+4)(a5)
	addi	s2,s7,0
	sw	a1,72(sp)
	sw	a2,80(sp)
	sw	a3,88(sp)
	sw	a4,92(sp)
	sw	s9,84(sp)
	addi	s7,zero,9
.L99:
	lui	s5,%hi(.LC35)
	addi	s5,s5,%lo(.LC35)
	addi	s3,zero,10
	sw	s2,52(sp)
	sw	s11,56(sp)
	sw	s7,108(sp)
	sw	s2,112(sp)
	sw	s11,116(sp)
	sw	s4,120(sp)
.L107:
	lw	s7,88(sp)
	lw	s8,92(sp)
	addi	a5,zero,20
	sw	a5,68(sp)
	sw	s3,124(sp)
.L105:
	lw	s3,80(sp)
	lw	s2,84(sp)
	addi	s4,zero,10
.L102:
	lw	a2,52(sp)
	lw	a0,44(sp)
	lw	a3,56(sp)
	lw	a1,48(sp)
	addi	t1,sp,132
	addi	a6,s3,0
	addi	a4,s7,0
	addi	a7,s2,0
	addi	a5,s8,0
	sw	t1,0(sp)
	sw	s6,4(sp)
.Lpcrel_248:
	auipc	ra,%pcrel_hi(SolveCubic)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_248)
	lui	a5,%hi(.LC34)
	addi	a0,a5,%lo(.LC34)
.Lpcrel_249:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_249)
	lw	s11,132(sp)
	blt	zero,s11,.+8
	jal	x0,.L100
	sw	s3,24(sp)
	sw	s2,32(sp)
	addi	s3,s6,0
	addi	s2,zero,0
	addi	s9,s11,0
.L101:
	lw	s10,0(s3)
	lw	s11,4(s3)
	addi	a0,s1,0
	addi	a1,s0,0
	addi	a2,s10,0
	addi	a3,s11,0
.Lpcrel_250:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_250)
	addi	s1,a0,0
	addi	a2,s10,0
	addi	a3,s11,0
	addi	a0,s5,0
	addi	s2,s2,1
	addi	s0,a1,0
	addi	s3,s3,8
.Lpcrel_251:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_251)
	beq	s2,s9,.+8
	jal	x0,.L101
	lw	s3,24(sp)
	lw	s2,32(sp)
.L100:
	addi	a0,zero,10
.Lpcrel_252:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_252)
	lw	a2,60(sp)
	lw	a3,64(sp)
	addi	a0,s3,0
	addi	a1,s2,0
.Lpcrel_253:
	auipc	ra,%pcrel_hi(__subdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_253)
	addi	s4,s4,-1
	addi	s3,a0,0
	addi	s2,a1,0
	beq	s4,zero,.+8
	jal	x0,.L102
	lw	a2,72(sp)
	lw	a3,76(sp)
	addi	a0,s7,0
	addi	a1,s8,0
.Lpcrel_254:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_254)
	lw	a5,68(sp)
	addi	s7,a0,0
	addi	s8,a1,0
	addi	a5,a5,-1
	sw	a5,68(sp)
	beq	a5,zero,.+8
	jal	x0,.L105
	lw	a0,52(sp)
	lw	a1,56(sp)
	lw	a2,96(sp)
	lw	a3,100(sp)
	lw	s3,124(sp)
.Lpcrel_255:
	auipc	ra,%pcrel_hi(__subdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_255)
	addi	s3,s3,-1
	sw	a0,52(sp)
	sw	a1,56(sp)
	beq	s3,zero,.+8
	jal	x0,.L107
	lw	s4,120(sp)
	lw	a0,44(sp)
	lw	a1,48(sp)
	lw	a3,104(sp)
	lw	s7,108(sp)
	addi	a2,s4,0
.Lpcrel_256:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_256)
	addi	s7,s7,-1
	sw	a0,44(sp)
	sw	a1,48(sp)
	lw	s2,112(sp)
	lw	s11,116(sp)
	beq	s7,zero,.+8
	jal	x0,.L99
	lui	a0,%hi(.LC43)
	addi	a0,a0,%lo(.LC43)
	lui	s4,%hi(.LC44)
.Lpcrel_257:
	auipc	ra,%pcrel_hi(puts)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_257)
	addi	s4,s4,%lo(.LC44)
	addi	s5,zero,0
	addi	s6,zero,1001
.L110:
	addi	a3,s5,0
	addi	s2,zero,0
	addi	a5,zero,0
	addi	s3,zero,32
.L109:
	srli	a2,a3,30
	slli	a4,s2,2
	slli	a5,a5,2
	sub	a0,x0,a2
	sub	a5,a5,a0
	addi	a4,a4,1
	addi	s3,s3,-1
	slli	a3,a3,2
	slli	s2,s2,1
	bgeu	a4,a5,.+8
	jal	x0,8
	jal	x0,.L108
	sub	a5,a5,a4
	addi	s2,s2,1
.L108:
	beq	s3,zero,.+8
	jal	x0,.L109
	addi	a0,s2,0
.Lpcrel_258:
	auipc	ra,%pcrel_hi(__floatunsidf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_258)
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a0,s1,0
	addi	a1,s0,0
.Lpcrel_259:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_259)
	addi	s1,a0,0
	addi	s0,a1,0
	addi	a2,s2,0
	addi	a1,s5,0
	addi	a0,s4,0
	addi	s5,s5,1
.Lpcrel_260:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_260)
	beq	s5,s6,.+8
	jal	x0,.L110
	lui	a5,261840
	addi	a5,a5,361
	addi	s2,zero,0
	addi	a3,zero,32
.L112:
	srli	a2,a5,30
	slli	a4,s2,2
	slli	s3,s3,2
	sub	a0,x0,a2
	sub	s3,s3,a0
	addi	a4,a4,1
	addi	a3,a3,-1
	slli	a5,a5,2
	slli	s2,s2,1
	bgeu	s3,a4,.+8
	jal	x0,.L111
	sub	s3,s3,a4
	addi	s2,s2,1
.L111:
	beq	a3,zero,.+8
	jal	x0,.L112
	addi	a0,s2,0
.Lpcrel_261:
	auipc	ra,%pcrel_hi(__floatunsidf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_261)
	addi	a3,s0,0
	addi	a2,s1,0
.Lpcrel_262:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_262)
	addi	s1,a0,0
	addi	s0,a1,0
	lui	a0,%hi(.LC45)
	lui	a1,261840
	addi	a2,s2,0
	addi	a1,a1,361
	addi	a0,a0,%lo(.LC45)
.Lpcrel_263:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_263)
	lui	a0,%hi(.LC46)
	addi	a0,a0,%lo(.LC46)
.Lpcrel_264:
	auipc	ra,%pcrel_hi(puts)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_264)
	lui	a4,%hi(.LC17)
	lui	a5,%hi(.LC47)
	lw	s3,%lo(.LC17+4)(a4)
	lw	s5,%lo(.LC47+4)(a5)
	lui	a3,%hi(.LC16)
	lw	s2,%lo(.LC17)(a4)
	lw	s4,%lo(.LC47)(a5)
	lw	s10,%lo(.LC16)(a3)
	lw	s11,%lo(.LC16+4)(a3)
	lui	s7,%hi(.LC48)
	sw	s3,28(sp)
	sw	s5,36(sp)
	addi	s7,s7,%lo(.LC48)
	addi	s8,zero,0
	addi	s6,zero,0
	sw	s2,24(sp)
	addi	s3,zero,361
	sw	s4,32(sp)
	addi	s9,s1,0
	addi	s5,s0,0
.L113:
	lw	a2,24(sp)
	lw	a3,28(sp)
	addi	a0,s8,0
	addi	a1,s6,0
.Lpcrel_265:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_265)
	lw	a2,32(sp)
	lw	a3,36(sp)
	addi	s3,s3,-1
.Lpcrel_266:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_266)
	addi	a2,a0,0
	addi	a3,a1,0
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a0,s9,0
	addi	a1,s5,0
.Lpcrel_267:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_267)
	addi	a2,s8,0
	addi	a3,s6,0
	addi	a4,s0,0
	addi	a5,s1,0
	addi	s9,a0,0
	addi	a0,s7,0
	addi	s5,a1,0
.Lpcrel_268:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_268)
	addi	a0,s8,0
	addi	a1,s6,0
	addi	a2,s10,0
	addi	a3,s11,0
.Lpcrel_269:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_269)
	addi	s8,a0,0
	addi	s6,a1,0
	beq	s3,zero,.+8
	jal	x0,.L113
	addi	a0,zero,10
	lw	s3,28(sp)
	lw	s2,24(sp)
	lw	s4,32(sp)
	addi	s0,s5,0
	lw	s5,36(sp)
.Lpcrel_270:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_270)
	lui	a5,%hi(.LC50)
	lw	s10,%lo(.LC50)(a5)
	lw	s11,%lo(.LC50+4)(a5)
	lui	s7,%hi(.LC49)
	sw	s3,28(sp)
	sw	s5,36(sp)
	addi	s7,s7,%lo(.LC49)
	addi	s8,zero,0
	addi	s6,zero,0
	sw	s2,24(sp)
	addi	s3,zero,361
	sw	s4,32(sp)
	addi	s5,s0,0
.L114:
	lw	a2,32(sp)
	lw	a3,36(sp)
	addi	a0,s8,0
	addi	a1,s6,0
.Lpcrel_271:
	auipc	ra,%pcrel_hi(__muldf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_271)
	lw	a2,24(sp)
	lw	a3,28(sp)
	addi	s3,s3,-1
.Lpcrel_272:
	auipc	ra,%pcrel_hi(__divdf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_272)
	addi	a2,a0,0
	addi	a3,a1,0
	addi	s0,a0,0
	addi	s1,a1,0
	addi	a0,s9,0
	addi	a1,s5,0
.Lpcrel_273:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_273)
	addi	a2,s8,0
	addi	a3,s6,0
	addi	a4,s0,0
	addi	a5,s1,0
	addi	s9,a0,0
	addi	a0,s7,0
	addi	s5,a1,0
.Lpcrel_274:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_274)
	addi	a0,s8,0
	addi	a1,s6,0
	addi	a2,s10,0
	addi	a3,s11,0
.Lpcrel_275:
	auipc	ra,%pcrel_hi(__adddf3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_275)
	addi	s8,a0,0
	addi	s6,a1,0
	beq	s3,zero,.+8
	jal	x0,.L114
	addi	a0,s9,0
	addi	a1,s5,0
	addi	a2,zero,0
	addi	a3,zero,0
.Lpcrel_276:
	auipc	ra,%pcrel_hi(__eqdf2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_276)
	lw	ra,220(sp)
	lw	s0,216(sp)
	lw	s1,212(sp)
	lw	s2,208(sp)
	lw	s3,204(sp)
	lw	s4,200(sp)
	lw	s5,196(sp)
	lw	s6,192(sp)
	lw	s7,188(sp)
	lw	s8,184(sp)
	lw	s9,180(sp)
	lw	s10,176(sp)
	lw	s11,172(sp)
	addi	a2,x0,1
	bgeu	a2,a0,.+8
	addi	a0,x0,0
	jal	x0,4
	addi	a0,x0,1
	addi	sp,sp,224
	jalr	zero,ra,0
	.size	main, .-main
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	1841940611
	.word	1071931184
	.align	3
.LC1:
	.word	0
	.word	1071644672
	.align	3
.LC2:
	.word	1413754136
	.word	1073291771
	.align	3
.LC3:
	.word	856972295
	.word	1016178214
	.align	3
.LC4:
	.word	1523570044
	.word	1038473530
	.align	3
.LC5:
	.word	-1976853269
	.word	1046144486
	.align	3
.LC6:
	.word	1471282813
	.word	1053236707
	.align	3
.LC7:
	.word	432103893
	.word	1059717536
	.align	3
.LC8:
	.word	286324902
	.word	1065423121
	.align	3
.LC9:
	.word	1431655753
	.word	1069897045
	.align	3
.LC10:
	.word	-1098368812
	.word	-1112999191
	.align	3
.LC11:
	.word	-1112231484
	.word	1042411166
	.align	3
.LC12:
	.word	-2137238867
	.word	1049787983
	.align	3
.LC13:
	.word	432739728
	.word	1056571808
	.align	3
.LC14:
	.word	381768055
	.word	1062650220
	.align	3
.LC15:
	.word	1431655756
	.word	1067799893
	.align	3
.LC16:
	.word	0
	.word	1072693248
	.align	3
.LC17:
	.word	1413754136
	.word	1074340347
	.align	3
.LC18:
	.word	0
	.word	-2147483648
	.align	3
.LC23:
	.word	0
	.word	-1074790400
	.align	3
.LC24:
	.word	0
	.word	-1073741824
	.align	3
.LC25:
	.word	0
	.word	1074266112
	.align	3
.LC26:
	.word	1413754136
	.word	1075388923
	.align	3
.LC27:
	.word	1413754136
	.word	1076437499
	.align	3
.LC28:
	.word	0
	.word	1075052544
	.align	3
.LC29:
	.word	0
	.word	1076101120
	.align	3
.LC31:
	.word	0
	.word	-1069678592
	.align	3
.LC32:
	.word	0
	.word	1077936128
	.align	3
.LC33:
	.word	0
	.word	-1071316992
	.align	3
.LC36:
	.word	0
	.word	1076953088
	.align	3
.LC37:
	.word	0
	.word	-1072562176
	.align	3
.LC38:
	.word	0
	.word	-1069613056
	.align	3
.LC39:
	.word	0
	.word	1077280768
	.align	3
.LC40:
	.word	0
	.word	-1072955392
	.align	3
.LC41:
	.word	0
	.word	-1069449216
	.align	3
.LC42:
	.word	1717986918
	.word	-1070897562
	.align	3
.LC47:
	.word	0
	.word	1080459264
	.align	3
.LC50:
	.word	-1571644103
	.word	1066524486
	.globl	__floatunsidf
	.globl	__lttf2
	.globl	__nedf2
	.globl	__eqdf2
	.globl	__ltdf2
	.globl	__ledf2
	.globl	__gtdf2
	.globl	__trunctfdf2
	.globl	__addtf3
	.globl	__divtf3
	.globl	__subtf3
	.globl	__multf3
	.globl	__extenddftf2
	.globl	__divdf3
	.globl	__floatsidf
	.globl	__fixdfsi
	.globl	__subdf3
	.globl	__adddf3
	.globl	__gedf2
	.globl	__muldf3
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
