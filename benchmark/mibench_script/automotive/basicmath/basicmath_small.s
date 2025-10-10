	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zalrsc1p0"
	.file	"llvm-link"
	.option	push
	.option	arch, +a, +c, +m, +zaamo, +zalrsc, +zmmul
	.text
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -224
	sw	ra, 220(sp)                     # 4-byte Folded Spill
	sw	s0, 216(sp)                     # 4-byte Folded Spill
	sw	s1, 212(sp)                     # 4-byte Folded Spill
	sw	s2, 208(sp)                     # 4-byte Folded Spill
	sw	s3, 204(sp)                     # 4-byte Folded Spill
	sw	s4, 200(sp)                     # 4-byte Folded Spill
	addi	s0, sp, 224
	sw	zero, -28(s0)
	lui	a0, 261888
	sw	a0, -36(s0)
	sw	zero, -40(s0)
	lui	a1, 787024
	sw	a1, -44(s0)
	sw	zero, -48(s0)
	lui	a1, 263168
	sw	a1, -52(s0)
	sw	zero, -56(s0)
	lui	a1, 787424
	sw	a1, -60(s0)
	sw	zero, -64(s0)
	sw	a0, -68(s0)
	sw	zero, -72(s0)
	lui	a2, 786720
	sw	a2, -76(s0)
	sw	zero, -80(s0)
	lui	a2, 262928
	sw	a2, -84(s0)
	sw	zero, -88(s0)
	sw	a1, -92(s0)
	sw	zero, -96(s0)
	sw	a0, -100(s0)
	sw	zero, -104(s0)
	lui	a1, 786624
	sw	a1, -108(s0)
	sw	zero, -112(s0)
	lui	a1, 263008
	sw	a1, -116(s0)
	sw	zero, -120(s0)
	lui	a1, 787440
	sw	a1, -124(s0)
	sw	zero, -128(s0)
	sw	a0, -132(s0)
	sw	zero, -136(s0)
	lui	a1, 787126
	addi	a1, a1, 1638
	sw	a1, -140(s0)
	lui	a1, 419430
	addi	a1, a1, 1638
	sw	a1, -144(s0)
	sw	a0, -148(s0)
	sw	zero, -152(s0)
	lui	a0, 787480
	sw	a0, -156(s0)
	sw	zero, -160(s0)
	lui	a0, 261840
	addi	a0, a0, 361
	sw	a0, -204(s0)
	sw	zero, -216(s0)
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	call	printf
	lw	a7, -60(s0)
	lw	a6, -64(s0)
	lw	a5, -52(s0)
	lw	a4, -56(s0)
	lw	a3, -44(s0)
	lw	a2, -48(s0)
	lw	a1, -36(s0)
	lw	a0, -40(s0)
	addi	s1, s0, -184
	sw	s1, 4(sp)
	addi	s1, s0, -196
	sw	s1, 0(sp)
	call	SolveCubic
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	call	printf
	sw	zero, -200(s0)
	j	.LBB0_1
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -200(s0)
	lw	a1, -196(s0)
	bge	a0, a1, .LBB0_4
	j	.LBB0_2
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -200(s0)
	slli	a0, a0, 3
	addi	a1, s0, -184
	add	a0, a0, a1
	lw	a3, 4(a0)
	lw	a2, 0(a0)
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	call	printf
	j	.LBB0_3
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -200(s0)
	addi	a0, a0, 1
	sw	a0, -200(s0)
	j	.LBB0_1
.LBB0_4:
	lui	a0, %hi(.L.str.3)
	addi	a0, a0, %lo(.L.str.3)
	call	printf
	lw	a7, -92(s0)
	lw	a6, -96(s0)
	lw	a5, -84(s0)
	lw	a4, -88(s0)
	lw	a3, -76(s0)
	lw	a2, -80(s0)
	lw	a1, -68(s0)
	lw	a0, -72(s0)
	addi	s1, s0, -184
	sw	s1, 4(sp)
	addi	s1, s0, -196
	sw	s1, 0(sp)
	call	SolveCubic
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	call	printf
	sw	zero, -200(s0)
	j	.LBB0_5
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -200(s0)
	lw	a1, -196(s0)
	bge	a0, a1, .LBB0_8
	j	.LBB0_6
.LBB0_6:                                #   in Loop: Header=BB0_5 Depth=1
	lw	a0, -200(s0)
	slli	a0, a0, 3
	addi	a1, s0, -184
	add	a0, a0, a1
	lw	a3, 4(a0)
	lw	a2, 0(a0)
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	call	printf
	j	.LBB0_7
.LBB0_7:                                #   in Loop: Header=BB0_5 Depth=1
	lw	a0, -200(s0)
	addi	a0, a0, 1
	sw	a0, -200(s0)
	j	.LBB0_5
.LBB0_8:
	lui	a0, %hi(.L.str.3)
	addi	a0, a0, %lo(.L.str.3)
	call	printf
	lw	a7, -124(s0)
	lw	a6, -128(s0)
	lw	a5, -116(s0)
	lw	a4, -120(s0)
	lw	a3, -108(s0)
	lw	a2, -112(s0)
	lw	a1, -100(s0)
	lw	a0, -104(s0)
	addi	s1, s0, -184
	sw	s1, 4(sp)
	addi	s1, s0, -196
	sw	s1, 0(sp)
	call	SolveCubic
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	call	printf
	sw	zero, -200(s0)
	j	.LBB0_9
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -200(s0)
	lw	a1, -196(s0)
	bge	a0, a1, .LBB0_12
	j	.LBB0_10
.LBB0_10:                               #   in Loop: Header=BB0_9 Depth=1
	lw	a0, -200(s0)
	slli	a0, a0, 3
	addi	a1, s0, -184
	add	a0, a0, a1
	lw	a3, 4(a0)
	lw	a2, 0(a0)
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	call	printf
	j	.LBB0_11
.LBB0_11:                               #   in Loop: Header=BB0_9 Depth=1
	lw	a0, -200(s0)
	addi	a0, a0, 1
	sw	a0, -200(s0)
	j	.LBB0_9
.LBB0_12:
	lui	a0, %hi(.L.str.3)
	addi	a0, a0, %lo(.L.str.3)
	call	printf
	lw	a7, -156(s0)
	lw	a6, -160(s0)
	lw	a5, -148(s0)
	lw	a4, -152(s0)
	lw	a3, -140(s0)
	lw	a2, -144(s0)
	lw	a1, -132(s0)
	lw	a0, -136(s0)
	addi	s1, s0, -184
	sw	s1, 4(sp)
	addi	s1, s0, -196
	sw	s1, 0(sp)
	call	SolveCubic
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	call	printf
	sw	zero, -200(s0)
	j	.LBB0_13
.LBB0_13:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -200(s0)
	lw	a1, -196(s0)
	bge	a0, a1, .LBB0_16
	j	.LBB0_14
.LBB0_14:                               #   in Loop: Header=BB0_13 Depth=1
	lw	a0, -200(s0)
	slli	a0, a0, 3
	addi	a1, s0, -184
	add	a0, a0, a1
	lw	a3, 4(a0)
	lw	a2, 0(a0)
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	call	printf
	j	.LBB0_15
.LBB0_15:                               #   in Loop: Header=BB0_13 Depth=1
	lw	a0, -200(s0)
	addi	a0, a0, 1
	sw	a0, -200(s0)
	j	.LBB0_13
.LBB0_16:
	lui	a0, %hi(.L.str.3)
	addi	a0, a0, %lo(.L.str.3)
	call	printf
	lui	a0, 261888
	sw	a0, -36(s0)
	sw	zero, -40(s0)
	j	.LBB0_17
.LBB0_17:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_19 Depth 2
                                        #       Child Loop BB0_21 Depth 3
                                        #         Child Loop BB0_23 Depth 4
                                        #           Child Loop BB0_25 Depth 5
	lw	a0, -40(s0)
	lw	a1, -36(s0)
	li	a2, 0
	lui	a3, 262720
	call	__ltdf2
	bgez	a0, .LBB0_36
	j	.LBB0_18
.LBB0_18:                               #   in Loop: Header=BB0_17 Depth=1
	lui	a0, 262720
	sw	a0, -44(s0)
	sw	zero, -48(s0)
	j	.LBB0_19
.LBB0_19:                               #   Parent Loop BB0_17 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_21 Depth 3
                                        #         Child Loop BB0_23 Depth 4
                                        #           Child Loop BB0_25 Depth 5
	lw	a0, -48(s0)
	lw	a1, -44(s0)
	li	a2, 0
	li	a3, 0
	call	__gtdf2
	blez	a0, .LBB0_34
	j	.LBB0_20
.LBB0_20:                               #   in Loop: Header=BB0_19 Depth=2
	lui	a0, 262464
	sw	a0, -52(s0)
	sw	zero, -56(s0)
	j	.LBB0_21
.LBB0_21:                               #   Parent Loop BB0_17 Depth=1
                                        #     Parent Loop BB0_19 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_23 Depth 4
                                        #           Child Loop BB0_25 Depth 5
	lw	a0, -56(s0)
	lw	a1, -52(s0)
	li	a2, 0
	lui	a3, 262880
	call	__ltdf2
	bgez	a0, .LBB0_32
	j	.LBB0_22
.LBB0_22:                               #   in Loop: Header=BB0_21 Depth=3
	lui	a0, 786176
	sw	a0, -60(s0)
	sw	zero, -64(s0)
	j	.LBB0_23
.LBB0_23:                               #   Parent Loop BB0_17 Depth=1
                                        #     Parent Loop BB0_19 Depth=2
                                        #       Parent Loop BB0_21 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB0_25 Depth 5
	lw	a0, -64(s0)
	lw	a1, -60(s0)
	li	a2, 0
	lui	a3, 787040
	call	__gtdf2
	blez	a0, .LBB0_30
	j	.LBB0_24
.LBB0_24:                               #   in Loop: Header=BB0_23 Depth=4
	lw	a7, -60(s0)
	lw	a6, -64(s0)
	lw	a5, -52(s0)
	lw	a4, -56(s0)
	lw	a3, -44(s0)
	lw	a2, -48(s0)
	lw	a1, -36(s0)
	lw	a0, -40(s0)
	addi	s1, s0, -184
	sw	s1, 4(sp)
	addi	s1, s0, -196
	sw	s1, 0(sp)
	call	SolveCubic
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	call	printf
	sw	zero, -200(s0)
	j	.LBB0_25
.LBB0_25:                               #   Parent Loop BB0_17 Depth=1
                                        #     Parent Loop BB0_19 Depth=2
                                        #       Parent Loop BB0_21 Depth=3
                                        #         Parent Loop BB0_23 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	lw	a0, -200(s0)
	lw	a1, -196(s0)
	bge	a0, a1, .LBB0_28
	j	.LBB0_26
.LBB0_26:                               #   in Loop: Header=BB0_25 Depth=5
	lw	a0, -200(s0)
	slli	a0, a0, 3
	addi	a1, s0, -184
	add	a0, a0, a1
	lw	a3, 4(a0)
	lw	a2, 0(a0)
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	call	printf
	j	.LBB0_27
.LBB0_27:                               #   in Loop: Header=BB0_25 Depth=5
	lw	a0, -200(s0)
	addi	a0, a0, 1
	sw	a0, -200(s0)
	j	.LBB0_25
.LBB0_28:                               #   in Loop: Header=BB0_23 Depth=4
	lui	a0, %hi(.L.str.3)
	addi	a0, a0, %lo(.L.str.3)
	call	printf
	j	.LBB0_29
.LBB0_29:                               #   in Loop: Header=BB0_23 Depth=4
	lw	a0, -64(s0)
	lw	a1, -60(s0)
	li	a2, 0
	lui	a3, 786176
	call	__adddf3
	sw	a1, -60(s0)
	sw	a0, -64(s0)
	j	.LBB0_23
.LBB0_30:                               #   in Loop: Header=BB0_21 Depth=3
	j	.LBB0_31
.LBB0_31:                               #   in Loop: Header=BB0_21 Depth=3
	lw	a0, -56(s0)
	lw	a1, -52(s0)
	li	a2, 0
	lui	a3, 261632
	call	__adddf3
	sw	a1, -52(s0)
	sw	a0, -56(s0)
	j	.LBB0_21
.LBB0_32:                               #   in Loop: Header=BB0_19 Depth=2
	j	.LBB0_33
.LBB0_33:                               #   in Loop: Header=BB0_19 Depth=2
	lw	a0, -48(s0)
	lw	a1, -44(s0)
	li	a2, 0
	lui	a3, 786176
	call	__adddf3
	sw	a1, -44(s0)
	sw	a0, -48(s0)
	j	.LBB0_19
.LBB0_34:                               #   in Loop: Header=BB0_17 Depth=1
	j	.LBB0_35
.LBB0_35:                               #   in Loop: Header=BB0_17 Depth=1
	lw	a0, -40(s0)
	lw	a1, -36(s0)
	li	a2, 0
	lui	a3, 261888
	call	__adddf3
	sw	a1, -36(s0)
	sw	a0, -40(s0)
	j	.LBB0_17
.LBB0_36:
	lui	a0, %hi(.L.str.4)
	addi	a0, a0, %lo(.L.str.4)
	call	printf
	sw	zero, -200(s0)
	j	.LBB0_37
.LBB0_37:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -200(s0)
	li	a1, 1000
	blt	a1, a0, .LBB0_40
	j	.LBB0_38
.LBB0_38:                               #   in Loop: Header=BB0_37 Depth=1
	lw	a0, -200(s0)
	addi	a1, s0, -212
	call	usqrt
	lw	a1, -200(s0)
	lw	a2, -212(s0)
	lui	a0, %hi(.L.str.5)
	addi	a0, a0, %lo(.L.str.5)
	call	printf
	j	.LBB0_39
.LBB0_39:                               #   in Loop: Header=BB0_37 Depth=1
	lw	a0, -200(s0)
	addi	a0, a0, 1
	sw	a0, -200(s0)
	j	.LBB0_37
.LBB0_40:
	lw	a0, -204(s0)
	addi	a1, s0, -212
	call	usqrt
	lw	a1, -204(s0)
	lw	a2, -212(s0)
	lui	a0, %hi(.L.str.6)
	addi	a0, a0, %lo(.L.str.6)
	call	printf
	lui	a0, %hi(.L.str.7)
	addi	a0, a0, %lo(.L.str.7)
	call	printf
	sw	zero, -188(s0)
	sw	zero, -192(s0)
	j	.LBB0_41
.LBB0_41:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -192(s0)
	lw	a1, -188(s0)
	li	a2, 0
	lui	a3, 264040
	call	__ledf2
	bgtz	a0, .LBB0_44
	j	.LBB0_42
.LBB0_42:                               #   in Loop: Header=BB0_41 Depth=1
	lw	s2, -188(s0)
	lw	s1, -192(s0)
	li	a0, 0
	lui	a1, 261888
	call	atan
	li	a2, 0
	lui	a3, 262400
	call	__muldf3
	mv	a2, a0
	mv	a3, a1
	mv	a0, s1
	mv	a1, s2
	call	__muldf3
	li	a2, 0
	lui	a3, 263784
	call	__divdf3
	mv	a4, a0
	lui	a0, %hi(.L.str.8)
	addi	a0, a0, %lo(.L.str.8)
	mv	a2, s1
	mv	a3, s2
	mv	a5, a1
	call	printf
	j	.LBB0_43
.LBB0_43:                               #   in Loop: Header=BB0_41 Depth=1
	lw	a0, -192(s0)
	lw	a1, -188(s0)
	li	a2, 0
	lui	a3, 261888
	call	__adddf3
	sw	a1, -188(s0)
	sw	a0, -192(s0)
	j	.LBB0_41
.LBB0_44:
	lui	a0, %hi(.L.str.9)
	addi	a0, a0, %lo(.L.str.9)
	call	puts
	sw	zero, -188(s0)
	sw	zero, -192(s0)
	j	.LBB0_45
.LBB0_45:                               # =>This Inner Loop Header: Depth=1
	lw	s2, -188(s0)
	lw	s1, -192(s0)
	li	a0, 0
	lui	a1, 261888
	call	atan
	li	a2, 0
	lui	a3, 262400
	call	__muldf3
	mv	a2, a0
	mv	a3, a1
	call	__adddf3
	lui	a2, 658271
	addi	a2, a2, -627
	lui	a3, 256780
	addi	a3, a3, 1783
	call	__adddf3
	mv	a2, a0
	mv	a3, a1
	mv	a0, s1
	mv	a1, s2
	call	__ledf2
	bgtz	a0, .LBB0_48
	j	.LBB0_46
.LBB0_46:                               #   in Loop: Header=BB0_45 Depth=1
	lw	s1, -192(s0)
	lw	s2, -188(s0)
	mv	a0, s1
	mv	a1, s2
	li	a2, 0
	lui	a3, 263784
	call	__muldf3
	mv	s3, a0
	mv	s4, a1
	li	a0, 0
	lui	a1, 261888
	call	atan
	li	a2, 0
	lui	a3, 262400
	call	__muldf3
	mv	a2, a0
	mv	a3, a1
	mv	a0, s3
	mv	a1, s4
	call	__divdf3
	mv	a4, a0
	lui	a0, %hi(.L.str.10)
	addi	a0, a0, %lo(.L.str.10)
	mv	a2, s1
	mv	a3, s2
	mv	a5, a1
	call	printf
	j	.LBB0_47
.LBB0_47:                               #   in Loop: Header=BB0_45 Depth=1
	li	a0, 0
	lui	a1, 261888
	call	atan
	li	a2, 0
	lui	a3, 262400
	call	__muldf3
	li	a2, 0
	lui	a3, 263784
	call	__divdf3
	mv	a2, a0
	mv	a3, a1
	lw	a0, -192(s0)
	lw	a1, -188(s0)
	call	__adddf3
	sw	a1, -188(s0)
	sw	a0, -192(s0)
	j	.LBB0_45
.LBB0_48:
	li	a0, 0
	lw	ra, 220(sp)                     # 4-byte Folded Reload
	lw	s0, 216(sp)                     # 4-byte Folded Reload
	lw	s1, 212(sp)                     # 4-byte Folded Reload
	lw	s2, 208(sp)                     # 4-byte Folded Reload
	lw	s3, 204(sp)                     # 4-byte Folded Reload
	lw	s4, 200(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 224
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +m, +zaamo, +zalrsc, +zmmul
	.globl	rad2deg                         # -- Begin function rad2deg
	.p2align	1
	.type	rad2deg,@function
rad2deg:                                # @rad2deg
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	sw	s1, 20(sp)                      # 4-byte Folded Spill
	sw	s2, 16(sp)                      # 4-byte Folded Spill
	addi	s0, sp, 32
	sw	a1, -20(s0)
	sw	a0, -24(s0)
	lw	a0, -24(s0)
	lw	a1, -20(s0)
	li	a2, 0
	lui	a3, 263784
	call	__muldf3
	mv	s1, a0
	mv	s2, a1
	li	a0, 0
	lui	a1, 261888
	call	atan
	li	a2, 0
	lui	a3, 262400
	call	__muldf3
	mv	a2, a0
	mv	a3, a1
	mv	a0, s1
	mv	a1, s2
	call	__divdf3
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	lw	s1, 20(sp)                      # 4-byte Folded Reload
	lw	s2, 16(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end1:
	.size	rad2deg, .Lfunc_end1-rad2deg
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +m, +zaamo, +zalrsc, +zmmul
	.globl	deg2rad                         # -- Begin function deg2rad
	.p2align	1
	.type	deg2rad,@function
deg2rad:                                # @deg2rad
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	addi	s0, sp, 16
	sw	a1, -12(s0)
	sw	a0, -16(s0)
	li	a0, 0
	lui	a1, 261888
	call	atan
	li	a2, 0
	lui	a3, 262400
	call	__muldf3
	lw	a2, -16(s0)
	lw	a3, -12(s0)
	call	__muldf3
	li	a2, 0
	lui	a3, 263784
	call	__divdf3
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end2:
	.size	deg2rad, .Lfunc_end2-deg2rad
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +m, +zaamo, +zalrsc, +zmmul
	.globl	SolveCubic                      # -- Begin function SolveCubic
	.p2align	1
	.type	SolveCubic,@function
SolveCubic:                             # @SolveCubic
# %bb.0:
	addi	sp, sp, -2016
	sw	ra, 2012(sp)                    # 4-byte Folded Spill
	sw	s0, 2008(sp)                    # 4-byte Folded Spill
	sw	s1, 2004(sp)                    # 4-byte Folded Spill
	sw	s2, 2000(sp)                    # 4-byte Folded Spill
	sw	s3, 1996(sp)                    # 4-byte Folded Spill
	sw	s4, 1992(sp)                    # 4-byte Folded Spill
	sw	s5, 1988(sp)                    # 4-byte Folded Spill
	sw	s6, 1984(sp)                    # 4-byte Folded Spill
	sw	s7, 1980(sp)                    # 4-byte Folded Spill
	sw	s8, 1976(sp)                    # 4-byte Folded Spill
	sw	s9, 1972(sp)                    # 4-byte Folded Spill
	sw	s10, 1968(sp)                   # 4-byte Folded Spill
	sw	s11, 1964(sp)                   # 4-byte Folded Spill
	addi	s0, sp, 2016
	lw	s1, 4(s0)
	lw	s1, 0(s0)
	sw	a1, -60(s0)
	sw	a0, -64(s0)
	sw	a3, -68(s0)
	sw	a2, -72(s0)
	sw	a5, -76(s0)
	sw	a4, -80(s0)
	sw	a7, -84(s0)
	sw	a6, -88(s0)
	lw	a0, -72(s0)
	lw	a1, -68(s0)
	lw	a2, -64(s0)
	lw	a3, -60(s0)
	call	__divdf3
	mv	a2, a0
	mv	a3, a1
	addi	a0, s0, -208
	mv	a1, a2
	mv	a2, a3
	call	__extenddftf2
	lw	a0, -208(s0)
	lw	a1, -204(s0)
	lw	a2, -200(s0)
	lw	a3, -196(s0)
	sw	a3, -100(s0)
	sw	a2, -104(s0)
	sw	a1, -108(s0)
	sw	a0, -112(s0)
	lw	a0, -80(s0)
	lw	a1, -76(s0)
	lw	a2, -64(s0)
	lw	a3, -60(s0)
	call	__divdf3
	mv	a2, a0
	mv	a3, a1
	addi	a0, s0, -224
	mv	a1, a2
	mv	a2, a3
	call	__extenddftf2
	lw	a0, -224(s0)
	lw	a1, -220(s0)
	lw	a2, -216(s0)
	lw	a3, -212(s0)
	sw	a3, -116(s0)
	sw	a2, -120(s0)
	sw	a1, -124(s0)
	sw	a0, -128(s0)
	lw	a0, -88(s0)
	lw	a1, -84(s0)
	lw	a2, -64(s0)
	lw	a3, -60(s0)
	call	__divdf3
	mv	a2, a0
	mv	a3, a1
	addi	a0, s0, -240
	mv	a1, a2
	mv	a2, a3
	call	__extenddftf2
	lw	a0, -240(s0)
	lw	a1, -236(s0)
	lw	a2, -232(s0)
	lw	a3, -228(s0)
	sw	a3, -132(s0)
	sw	a2, -136(s0)
	sw	a1, -140(s0)
	sw	a0, -144(s0)
	lw	s2, -112(s0)
	lw	s3, -108(s0)
	lw	s4, -104(s0)
	lw	s1, -100(s0)
	lw	a0, -128(s0)
	lw	a1, -124(s0)
	lw	a2, -120(s0)
	lw	a3, -116(s0)
	lui	a4, 786440
	sw	a4, -324(s0)
	sw	zero, -328(s0)
	sw	zero, -332(s0)
	sw	zero, -336(s0)
	sw	a3, -308(s0)
	sw	a2, -312(s0)
	sw	a1, -316(s0)
	sw	a0, -320(s0)
	addi	a0, s0, -304
	addi	a1, s0, -320
	addi	a2, s0, -336
	call	__multf3
	lw	s5, -304(s0)
	lw	s6, -300(s0)
	lw	s7, -296(s0)
	lw	s8, -292(s0)
	sw	s1, -276(s0)
	sw	s4, -280(s0)
	sw	s3, -284(s0)
	sw	s2, -288(s0)
	sw	s1, -260(s0)
	sw	s4, -264(s0)
	sw	s3, -268(s0)
	sw	s2, -272(s0)
	addi	a0, s0, -256
	addi	a1, s0, -272
	addi	a2, s0, -288
	call	__multf3
	sw	s8, -372(s0)
	sw	s7, -376(s0)
	sw	s6, -380(s0)
	sw	s5, -384(s0)
	lw	a0, -244(s0)
	sw	a0, -356(s0)
	lw	a0, -248(s0)
	sw	a0, -360(s0)
	lw	a0, -252(s0)
	sw	a0, -364(s0)
	lw	a0, -256(s0)
	sw	a0, -368(s0)
	addi	a0, s0, -352
	addi	a1, s0, -368
	addi	a2, s0, -384
	call	__addtf3
	lw	a0, -352(s0)
	lw	a1, -348(s0)
	lw	a2, -344(s0)
	lw	a3, -340(s0)
	lui	s5, 262178
	sw	s5, -420(s0)
	sw	zero, -424(s0)
	sw	zero, -428(s0)
	sw	zero, -432(s0)
	sw	a3, -404(s0)
	sw	a2, -408(s0)
	sw	a1, -412(s0)
	sw	a0, -416(s0)
	addi	a0, s0, -400
	addi	a1, s0, -416
	addi	a2, s0, -432
	call	__divtf3
	lw	a0, -400(s0)
	lw	a1, -396(s0)
	lw	a2, -392(s0)
	lw	a3, -388(s0)
	sw	a3, -148(s0)
	sw	a2, -152(s0)
	sw	a1, -156(s0)
	sw	a0, -160(s0)
	lw	s2, -112(s0)
	lw	s3, -108(s0)
	lw	s4, -104(s0)
	lw	s1, -100(s0)
	sw	s1, -516(s0)
	sw	s4, -520(s0)
	sw	s3, -524(s0)
	sw	s2, -528(s0)
	sw	s1, -500(s0)
	sw	s4, -504(s0)
	sw	s3, -508(s0)
	sw	s2, -512(s0)
	addi	a0, s0, -496
	addi	a1, s0, -512
	addi	a2, s0, -528
	call	__addtf3
	lw	a0, -496(s0)
	lw	a1, -492(s0)
	lw	a2, -488(s0)
	lw	a3, -484(s0)
	sw	s1, -564(s0)
	sw	s4, -568(s0)
	sw	s3, -572(s0)
	sw	s2, -576(s0)
	sw	a3, -548(s0)
	sw	a2, -552(s0)
	sw	a1, -556(s0)
	sw	a0, -560(s0)
	addi	a0, s0, -544
	addi	a1, s0, -560
	addi	a2, s0, -576
	call	__multf3
	lw	a0, -544(s0)
	sw	a0, -2004(s0)                   # 4-byte Folded Spill
	lw	s7, -540(s0)
	lw	s8, -536(s0)
	lw	s9, -532(s0)
	sw	s5, -468(s0)
	sw	zero, -472(s0)
	sw	zero, -476(s0)
	sw	zero, -480(s0)
	sw	s1, -452(s0)
	sw	s4, -456(s0)
	sw	s3, -460(s0)
	sw	s2, -464(s0)
	addi	a0, s0, -448
	addi	a1, s0, -464
	addi	a2, s0, -480
	call	__multf3
	lw	a6, -448(s0)
	lw	a7, -444(s0)
	lw	a2, -440(s0)
	lw	a3, -436(s0)
	lw	a4, -128(s0)
	lw	a5, -124(s0)
	lw	a0, -120(s0)
	lw	a1, -116(s0)
	sw	a1, -660(s0)
	sw	a0, -664(s0)
	sw	a5, -668(s0)
	sw	a4, -672(s0)
	sw	a3, -644(s0)
	sw	a2, -648(s0)
	sw	a7, -652(s0)
	sw	a6, -656(s0)
	addi	a0, s0, -640
	addi	a1, s0, -656
	addi	a2, s0, -672
	call	__multf3
	lw	s5, -640(s0)
	lw	s10, -636(s0)
	lw	s11, -632(s0)
	lw	s6, -628(s0)
	sw	s1, -612(s0)
	sw	s4, -616(s0)
	sw	s3, -620(s0)
	sw	s2, -624(s0)
	sw	s9, -596(s0)
	sw	s8, -600(s0)
	sw	s7, -604(s0)
	lw	a0, -2004(s0)                   # 4-byte Folded Reload
	sw	a0, -608(s0)
	addi	a0, s0, -592
	addi	a1, s0, -608
	addi	a2, s0, -624
	call	__multf3
	sw	s6, -708(s0)
	sw	s11, -712(s0)
	sw	s10, -716(s0)
	sw	s5, -720(s0)
	lw	a0, -580(s0)
	sw	a0, -692(s0)
	lw	a0, -584(s0)
	sw	a0, -696(s0)
	lw	a0, -588(s0)
	sw	a0, -700(s0)
	lw	a0, -592(s0)
	sw	a0, -704(s0)
	addi	a0, s0, -688
	addi	a1, s0, -704
	addi	a2, s0, -720
	call	__subtf3
	lw	s2, -688(s0)
	lw	s3, -684(s0)
	lw	s4, -680(s0)
	lw	s1, -676(s0)
	lw	a0, -144(s0)
	lw	a1, -140(s0)
	lw	a2, -136(s0)
	lw	a3, -132(s0)
	lui	a4, 262203
	sw	a4, -756(s0)
	sw	zero, -760(s0)
	sw	zero, -764(s0)
	sw	zero, -768(s0)
	sw	a3, -740(s0)
	sw	a2, -744(s0)
	sw	a1, -748(s0)
	sw	a0, -752(s0)
	addi	a0, s0, -736
	addi	a1, s0, -752
	addi	a2, s0, -768
	call	__multf3
	lw	a0, -724(s0)
	sw	a0, -788(s0)
	lw	a0, -728(s0)
	sw	a0, -792(s0)
	lw	a0, -732(s0)
	sw	a0, -796(s0)
	lw	a0, -736(s0)
	sw	a0, -800(s0)
	sw	s1, -804(s0)
	sw	s4, -808(s0)
	sw	s3, -812(s0)
	sw	s2, -816(s0)
	addi	a0, s0, -784
	addi	a1, s0, -800
	addi	a2, s0, -816
	call	__addtf3
	lw	a0, -784(s0)
	lw	a1, -780(s0)
	lw	a2, -776(s0)
	lw	a3, -772(s0)
	lui	a4, 262219
	sw	a4, -852(s0)
	sw	zero, -856(s0)
	sw	zero, -860(s0)
	sw	zero, -864(s0)
	sw	a3, -836(s0)
	sw	a2, -840(s0)
	sw	a1, -844(s0)
	sw	a0, -848(s0)
	addi	a0, s0, -832
	addi	a1, s0, -848
	addi	a2, s0, -864
	call	__divtf3
	lw	a0, -832(s0)
	lw	a1, -828(s0)
	lw	a2, -824(s0)
	lw	a3, -820(s0)
	sw	a3, -164(s0)
	sw	a2, -168(s0)
	sw	a1, -172(s0)
	sw	a0, -176(s0)
	lw	s2, -176(s0)
	lw	s3, -172(s0)
	lw	s4, -168(s0)
	lw	s5, -164(s0)
	lw	s6, -160(s0)
	lw	s7, -156(s0)
	lw	s8, -152(s0)
	lw	s1, -148(s0)
	sw	s1, -948(s0)
	sw	s8, -952(s0)
	sw	s7, -956(s0)
	sw	s6, -960(s0)
	sw	s1, -932(s0)
	sw	s8, -936(s0)
	sw	s7, -940(s0)
	sw	s6, -944(s0)
	addi	a0, s0, -928
	addi	a1, s0, -944
	addi	a2, s0, -960
	call	__multf3
	lw	a0, -928(s0)
	lw	a1, -924(s0)
	lw	a2, -920(s0)
	lw	a3, -916(s0)
	sw	s1, -996(s0)
	sw	s8, -1000(s0)
	sw	s7, -1004(s0)
	sw	s6, -1008(s0)
	sw	a3, -980(s0)
	sw	a2, -984(s0)
	sw	a1, -988(s0)
	sw	a0, -992(s0)
	addi	a0, s0, -976
	addi	a1, s0, -992
	addi	a2, s0, -1008
	call	__multf3
	lw	s6, -976(s0)
	lw	s7, -972(s0)
	lw	s8, -968(s0)
	lw	s1, -964(s0)
	sw	s5, -900(s0)
	sw	s4, -904(s0)
	sw	s3, -908(s0)
	sw	s2, -912(s0)
	sw	s5, -884(s0)
	sw	s4, -888(s0)
	sw	s3, -892(s0)
	sw	s2, -896(s0)
	addi	a0, s0, -880
	addi	a1, s0, -896
	addi	a2, s0, -912
	call	__multf3
	lw	a0, -868(s0)
	sw	a0, -1028(s0)
	lw	a0, -872(s0)
	sw	a0, -1032(s0)
	lw	a0, -876(s0)
	sw	a0, -1036(s0)
	lw	a0, -880(s0)
	sw	a0, -1040(s0)
	sw	s1, -1044(s0)
	sw	s8, -1048(s0)
	sw	s7, -1052(s0)
	sw	s6, -1056(s0)
	addi	a0, s0, -1024
	addi	a1, s0, -1040
	addi	a2, s0, -1056
	call	__subtf3
	lw	a0, -1024(s0)
	lw	a1, -1020(s0)
	lw	a2, -1016(s0)
	lw	a3, -1012(s0)
	sw	a3, -1060(s0)
	sw	a2, -1064(s0)
	sw	a1, -1068(s0)
	sw	a0, -1072(s0)
	addi	a0, s0, -1072
	call	__trunctfdf2
	sw	a1, -180(s0)
	sw	a0, -184(s0)
	lw	a0, -184(s0)
	lw	a1, -180(s0)
	li	a2, 0
	li	a3, 0
	call	__ledf2
	bgtz	a0, .LBB3_2
	j	.LBB3_1
.LBB3_1:
	lw	a0, 0(s0)
	li	a1, 3
	sw	a1, 0(a0)
	lw	s2, -176(s0)
	lw	s3, -172(s0)
	lw	s4, -168(s0)
	lw	s5, -164(s0)
	lw	s6, -160(s0)
	lw	s7, -156(s0)
	lw	s8, -152(s0)
	lw	s1, -148(s0)
	sw	s1, -1412(s0)
	sw	s8, -1416(s0)
	sw	s7, -1420(s0)
	sw	s6, -1424(s0)
	sw	s1, -1396(s0)
	sw	s8, -1400(s0)
	sw	s7, -1404(s0)
	sw	s6, -1408(s0)
	addi	a0, s0, -1392
	addi	a1, s0, -1408
	addi	a2, s0, -1424
	call	__multf3
	lw	a0, -1392(s0)
	lw	a1, -1388(s0)
	lw	a2, -1384(s0)
	lw	a3, -1380(s0)
	sw	s1, -1460(s0)
	sw	s8, -1464(s0)
	sw	s7, -1468(s0)
	sw	s6, -1472(s0)
	sw	a3, -1444(s0)
	sw	a2, -1448(s0)
	sw	a1, -1452(s0)
	sw	a0, -1456(s0)
	addi	a0, s0, -1440
	addi	a1, s0, -1456
	addi	a2, s0, -1472
	call	__multf3
	lw	a0, -1440(s0)
	lw	a1, -1436(s0)
	lw	a2, -1432(s0)
	lw	a3, -1428(s0)
	sw	a3, -1476(s0)
	sw	a2, -1480(s0)
	sw	a1, -1484(s0)
	sw	a0, -1488(s0)
	addi	a0, s0, -1488
	call	__trunctfdf2
	call	sqrt
	mv	a2, a0
	mv	a3, a1
	addi	a0, s0, -1504
	mv	a1, a2
	mv	a2, a3
	call	__extenddftf2
	lw	a0, -1504(s0)
	lw	a1, -1500(s0)
	lw	a2, -1496(s0)
	lw	a3, -1492(s0)
	sw	s5, -1524(s0)
	sw	s4, -1528(s0)
	sw	s3, -1532(s0)
	sw	s2, -1536(s0)
	sw	a3, -1540(s0)
	sw	a2, -1544(s0)
	sw	a1, -1548(s0)
	sw	a0, -1552(s0)
	addi	a0, s0, -1520
	addi	a1, s0, -1536
	addi	a2, s0, -1552
	call	__divtf3
	lw	a0, -1520(s0)
	lw	a1, -1516(s0)
	lw	a2, -1512(s0)
	lw	a3, -1508(s0)
	sw	a3, -1556(s0)
	sw	a2, -1560(s0)
	sw	a1, -1564(s0)
	sw	a0, -1568(s0)
	addi	a0, s0, -1568
	call	__trunctfdf2
	call	acos
	sw	a1, -188(s0)
	sw	a0, -192(s0)
	lw	a0, -160(s0)
	lw	a1, -156(s0)
	lw	a2, -152(s0)
	lw	a3, -148(s0)
	sw	a3, -1572(s0)
	sw	a2, -1576(s0)
	sw	a1, -1580(s0)
	sw	a0, -1584(s0)
	addi	a0, s0, -1584
	call	__trunctfdf2
	call	sqrt
	li	a2, 0
	lui	a3, 786432
	call	__muldf3
	mv	s1, a0
	mv	s2, a1
	lw	a0, -192(s0)
	lw	a1, -188(s0)
	li	a2, 0
	lui	a3, 262272
	call	__divdf3
	call	cos
	mv	a2, a0
	mv	a3, a1
	mv	a0, s1
	mv	a1, s2
	call	__muldf3
	mv	a2, a0
	mv	a3, a1
	addi	a0, s0, -1600
	mv	a1, a2
	mv	a2, a3
	call	__extenddftf2
	lw	s2, -1600(s0)
	lw	s3, -1596(s0)
	lw	s4, -1592(s0)
	lw	s1, -1588(s0)
	lw	a0, -112(s0)
	lw	a1, -108(s0)
	lw	a2, -104(s0)
	lw	a3, -100(s0)
	lui	s5, 262152
	sw	s5, -1636(s0)
	sw	zero, -1640(s0)
	sw	zero, -1644(s0)
	sw	zero, -1648(s0)
	sw	a3, -1620(s0)
	sw	a2, -1624(s0)
	sw	a1, -1628(s0)
	sw	a0, -1632(s0)
	addi	a0, s0, -1616
	addi	a1, s0, -1632
	addi	a2, s0, -1648
	call	__divtf3
	lw	a0, -1616(s0)
	lw	a1, -1612(s0)
	lw	a2, -1608(s0)
	lw	a3, -1604(s0)
	sw	s1, -1668(s0)
	sw	s4, -1672(s0)
	sw	s3, -1676(s0)
	sw	s2, -1680(s0)
	sw	a3, -1684(s0)
	sw	a2, -1688(s0)
	sw	a1, -1692(s0)
	sw	a0, -1696(s0)
	addi	a0, s0, -1664
	addi	a1, s0, -1680
	addi	a2, s0, -1696
	call	__subtf3
	lw	a0, -1664(s0)
	lw	a1, -1660(s0)
	lw	a2, -1656(s0)
	lw	a3, -1652(s0)
	sw	a3, -1700(s0)
	sw	a2, -1704(s0)
	sw	a1, -1708(s0)
	sw	a0, -1712(s0)
	addi	a0, s0, -1712
	call	__trunctfdf2
	lw	a2, 4(s0)
	sw	a1, 4(a2)
	sw	a0, 0(a2)
	lw	a0, -160(s0)
	lw	a1, -156(s0)
	lw	a2, -152(s0)
	lw	a3, -148(s0)
	sw	a3, -1716(s0)
	sw	a2, -1720(s0)
	sw	a1, -1724(s0)
	sw	a0, -1728(s0)
	addi	a0, s0, -1728
	call	__trunctfdf2
	call	sqrt
	li	a2, 0
	lui	a3, 786432
	call	__muldf3
	mv	s3, a0
	mv	s2, a1
	lw	s4, -188(s0)
	lw	s1, -192(s0)
	li	a0, 0
	lui	a1, 261888
	call	atan
	li	a2, 0
	lui	a3, 262400
	call	__muldf3
	mv	a2, a0
	mv	a3, a1
	call	__adddf3
	mv	a2, s1
	mv	a3, s4
	call	__adddf3
	li	a2, 0
	lui	a3, 262272
	call	__divdf3
	call	cos
	mv	a2, a0
	mv	a3, a1
	mv	a0, s3
	mv	a1, s2
	call	__muldf3
	mv	a2, a0
	mv	a3, a1
	addi	a0, s0, -1744
	mv	a1, a2
	mv	a2, a3
	call	__extenddftf2
	lw	s2, -1744(s0)
	lw	s3, -1740(s0)
	lw	s4, -1736(s0)
	lw	s1, -1732(s0)
	lw	a0, -112(s0)
	lw	a1, -108(s0)
	lw	a2, -104(s0)
	lw	a3, -100(s0)
	sw	s5, -1780(s0)
	sw	zero, -1784(s0)
	sw	zero, -1788(s0)
	sw	zero, -1792(s0)
	sw	a3, -1764(s0)
	sw	a2, -1768(s0)
	sw	a1, -1772(s0)
	sw	a0, -1776(s0)
	addi	a0, s0, -1760
	addi	a1, s0, -1776
	addi	a2, s0, -1792
	call	__divtf3
	lw	a0, -1760(s0)
	lw	a1, -1756(s0)
	lw	a2, -1752(s0)
	lw	a3, -1748(s0)
	sw	s1, -1812(s0)
	sw	s4, -1816(s0)
	sw	s3, -1820(s0)
	sw	s2, -1824(s0)
	sw	a3, -1828(s0)
	sw	a2, -1832(s0)
	sw	a1, -1836(s0)
	sw	a0, -1840(s0)
	addi	a0, s0, -1808
	addi	a1, s0, -1824
	addi	a2, s0, -1840
	call	__subtf3
	lw	a0, -1808(s0)
	lw	a1, -1804(s0)
	lw	a2, -1800(s0)
	lw	a3, -1796(s0)
	sw	a3, -1844(s0)
	sw	a2, -1848(s0)
	sw	a1, -1852(s0)
	sw	a0, -1856(s0)
	addi	a0, s0, -1856
	call	__trunctfdf2
	lw	a2, 4(s0)
	sw	a1, 12(a2)
	sw	a0, 8(a2)
	lw	a0, -160(s0)
	lw	a1, -156(s0)
	lw	a2, -152(s0)
	lw	a3, -148(s0)
	sw	a3, -1860(s0)
	sw	a2, -1864(s0)
	sw	a1, -1868(s0)
	sw	a0, -1872(s0)
	addi	a0, s0, -1872
	call	__trunctfdf2
	call	sqrt
	li	a2, 0
	lui	a3, 786432
	call	__muldf3
	mv	s3, a0
	mv	s2, a1
	lw	s4, -188(s0)
	lw	s1, -192(s0)
	li	a0, 0
	lui	a1, 261888
	call	atan
	li	a2, 0
	lui	a3, 262400
	call	__muldf3
	li	a2, 0
	lui	a3, 262400
	call	__muldf3
	mv	a2, s1
	mv	a3, s4
	call	__adddf3
	li	a2, 0
	lui	a3, 262272
	call	__divdf3
	call	cos
	mv	a2, a0
	mv	a3, a1
	mv	a0, s3
	mv	a1, s2
	call	__muldf3
	mv	a2, a0
	mv	a3, a1
	addi	a0, s0, -1888
	mv	a1, a2
	mv	a2, a3
	call	__extenddftf2
	lw	s2, -1888(s0)
	lw	s3, -1884(s0)
	lw	s4, -1880(s0)
	lw	s1, -1876(s0)
	lw	a0, -112(s0)
	lw	a1, -108(s0)
	lw	a2, -104(s0)
	lw	a3, -100(s0)
	sw	s5, -1924(s0)
	sw	zero, -1928(s0)
	sw	zero, -1932(s0)
	sw	zero, -1936(s0)
	sw	a3, -1908(s0)
	sw	a2, -1912(s0)
	sw	a1, -1916(s0)
	sw	a0, -1920(s0)
	addi	a0, s0, -1904
	addi	a1, s0, -1920
	addi	a2, s0, -1936
	call	__divtf3
	lw	a0, -1904(s0)
	lw	a1, -1900(s0)
	lw	a2, -1896(s0)
	lw	a3, -1892(s0)
	sw	s1, -1956(s0)
	sw	s4, -1960(s0)
	sw	s3, -1964(s0)
	sw	s2, -1968(s0)
	sw	a3, -1972(s0)
	sw	a2, -1976(s0)
	sw	a1, -1980(s0)
	sw	a0, -1984(s0)
	addi	a0, s0, -1952
	addi	a1, s0, -1968
	addi	a2, s0, -1984
	call	__subtf3
	lw	a0, -1952(s0)
	lw	a1, -1948(s0)
	lw	a2, -1944(s0)
	lw	a3, -1940(s0)
	sw	a3, -1988(s0)
	sw	a2, -1992(s0)
	sw	a1, -1996(s0)
	sw	a0, -2000(s0)
	addi	a0, s0, -2000
	call	__trunctfdf2
	lw	a2, 4(s0)
	sw	a1, 20(a2)
	sw	a0, 16(a2)
	j	.LBB3_3
.LBB3_2:
	lw	a0, 0(s0)
	li	a1, 1
	sw	a1, 0(a0)
	lw	a1, -180(s0)
	lw	a0, -184(s0)
	call	sqrt
	mv	s1, a0
	mv	s2, a1
	lw	a0, -176(s0)
	lw	a1, -172(s0)
	lw	a2, -168(s0)
	lw	a3, -164(s0)
	sw	a3, -1076(s0)
	sw	a2, -1080(s0)
	sw	a1, -1084(s0)
	sw	a0, -1088(s0)
	addi	a0, s0, -1088
	call	__trunctfdf2
	mv	a2, a0
	slli	a1, a1, 1
	srli	a3, a1, 1
	mv	a0, s1
	mv	a1, s2
	call	__adddf3
	lui	a2, 349525
	addi	a2, a2, 1365
	lui	a3, 261461
	addi	a3, a3, 1365
	call	pow
	lw	a2, 4(s0)
	sw	a1, 4(a2)
	sw	a0, 0(a2)
	lw	s2, -160(s0)
	lw	s3, -156(s0)
	lw	s4, -152(s0)
	lw	s5, -148(s0)
	lw	s6, 4(s0)
	lw	a1, 0(s6)
	lw	a2, 4(s6)
	addi	a0, s0, -1216
	call	__extenddftf2
	lw	s7, -1216(s0)
	lw	s8, -1212(s0)
	lw	s9, -1208(s0)
	lw	s1, -1204(s0)
	sw	s5, -1108(s0)
	sw	s4, -1112(s0)
	sw	s3, -1116(s0)
	sw	s2, -1120(s0)
	sw	s1, -1124(s0)
	sw	s9, -1128(s0)
	sw	s8, -1132(s0)
	sw	s7, -1136(s0)
	addi	a0, s0, -1104
	addi	a1, s0, -1120
	addi	a2, s0, -1136
	call	__divtf3
	lw	a0, -1104(s0)
	lw	a1, -1100(s0)
	lw	a2, -1096(s0)
	lw	a3, -1092(s0)
	sw	s1, -1156(s0)
	sw	s9, -1160(s0)
	sw	s8, -1164(s0)
	sw	s7, -1168(s0)
	sw	a3, -1172(s0)
	sw	a2, -1176(s0)
	sw	a1, -1180(s0)
	sw	a0, -1184(s0)
	addi	a0, s0, -1152
	addi	a1, s0, -1168
	addi	a2, s0, -1184
	call	__addtf3
	lw	a0, -1152(s0)
	lw	a1, -1148(s0)
	lw	a2, -1144(s0)
	lw	a3, -1140(s0)
	sw	a3, -1188(s0)
	sw	a2, -1192(s0)
	sw	a1, -1196(s0)
	sw	a0, -1200(s0)
	addi	a0, s0, -1200
	call	__trunctfdf2
	sw	a1, 4(s6)
	sw	a0, 0(s6)
	lw	a0, -176(s0)
	lw	a1, -172(s0)
	lw	a2, -168(s0)
	lw	a3, -164(s0)
	sw	zero, -1236(s0)
	sw	zero, -1240(s0)
	sw	zero, -1244(s0)
	sw	zero, -1248(s0)
	sw	a3, -1220(s0)
	sw	a2, -1224(s0)
	sw	a1, -1228(s0)
	sw	a0, -1232(s0)
	addi	a0, s0, -1232
	addi	a1, s0, -1248
	call	__lttf2
	slti	a0, a0, 0
	addi	a0, a0, -1
	ori	a0, a0, 1
	call	__floatsidf
	mv	a2, a0
	mv	a3, a1
	lw	s1, 4(s0)
	lw	a0, 0(s1)
	lw	a1, 4(s1)
	call	__muldf3
	sw	a1, 4(s1)
	sw	a0, 0(s1)
	lw	a0, -112(s0)
	lw	a1, -108(s0)
	lw	a2, -104(s0)
	lw	a3, -100(s0)
	lui	a4, 786440
	sw	a4, -1284(s0)
	sw	zero, -1288(s0)
	sw	zero, -1292(s0)
	sw	zero, -1296(s0)
	sw	a3, -1268(s0)
	sw	a2, -1272(s0)
	sw	a1, -1276(s0)
	sw	a0, -1280(s0)
	addi	a0, s0, -1264
	addi	a1, s0, -1280
	addi	a2, s0, -1296
	call	__divtf3
	lw	s2, -1264(s0)
	lw	s3, -1260(s0)
	lw	s4, -1256(s0)
	lw	s5, -1252(s0)
	lw	s1, 4(s0)
	lw	a1, 0(s1)
	lw	a2, 4(s1)
	addi	a0, s0, -1376
	call	__extenddftf2
	lw	a0, -1376(s0)
	lw	a1, -1372(s0)
	lw	a2, -1368(s0)
	lw	a3, -1364(s0)
	sw	s5, -1332(s0)
	sw	s4, -1336(s0)
	sw	s3, -1340(s0)
	sw	s2, -1344(s0)
	sw	a3, -1316(s0)
	sw	a2, -1320(s0)
	sw	a1, -1324(s0)
	sw	a0, -1328(s0)
	addi	a0, s0, -1312
	addi	a1, s0, -1328
	addi	a2, s0, -1344
	call	__addtf3
	lw	a0, -1312(s0)
	lw	a1, -1308(s0)
	lw	a2, -1304(s0)
	lw	a3, -1300(s0)
	sw	a3, -1348(s0)
	sw	a2, -1352(s0)
	sw	a1, -1356(s0)
	sw	a0, -1360(s0)
	addi	a0, s0, -1360
	call	__trunctfdf2
	sw	a1, 4(s1)
	sw	a0, 0(s1)
	j	.LBB3_3
.LBB3_3:
	lw	ra, 2012(sp)                    # 4-byte Folded Reload
	lw	s0, 2008(sp)                    # 4-byte Folded Reload
	lw	s1, 2004(sp)                    # 4-byte Folded Reload
	lw	s2, 2000(sp)                    # 4-byte Folded Reload
	lw	s3, 1996(sp)                    # 4-byte Folded Reload
	lw	s4, 1992(sp)                    # 4-byte Folded Reload
	lw	s5, 1988(sp)                    # 4-byte Folded Reload
	lw	s6, 1984(sp)                    # 4-byte Folded Reload
	lw	s7, 1980(sp)                    # 4-byte Folded Reload
	lw	s8, 1976(sp)                    # 4-byte Folded Reload
	lw	s9, 1972(sp)                    # 4-byte Folded Reload
	lw	s10, 1968(sp)                   # 4-byte Folded Reload
	lw	s11, 1964(sp)                   # 4-byte Folded Reload
	addi	sp, sp, 2016
	ret
.Lfunc_end3:
	.size	SolveCubic, .Lfunc_end3-SolveCubic
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +m, +zaamo, +zalrsc, +zmmul
	.globl	usqrt                           # -- Begin function usqrt
	.p2align	1
	.type	usqrt,@function
usqrt:                                  # @usqrt
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	zero, -20(s0)
	sw	zero, -24(s0)
	sw	zero, -28(s0)
	sw	zero, -32(s0)
	j	.LBB4_1
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -32(s0)
	li	a1, 31
	blt	a1, a0, .LBB4_6
	j	.LBB4_2
.LBB4_2:                                #   in Loop: Header=BB4_1 Depth=1
	lw	a0, -24(s0)
	slli	a0, a0, 2
	lw	a1, -12(s0)
	srli	a1, a1, 30
	or	a0, a0, a1
	sw	a0, -24(s0)
	lw	a0, -12(s0)
	slli	a0, a0, 2
	sw	a0, -12(s0)
	lw	a0, -20(s0)
	slli	a0, a0, 1
	sw	a0, -20(s0)
	lw	a0, -20(s0)
	slli	a0, a0, 1
	addi	a0, a0, 1
	sw	a0, -28(s0)
	lw	a0, -24(s0)
	lw	a1, -28(s0)
	bltu	a0, a1, .LBB4_4
	j	.LBB4_3
.LBB4_3:                                #   in Loop: Header=BB4_1 Depth=1
	lw	a0, -28(s0)
	lw	a1, -24(s0)
	sub	a1, a1, a0
	sw	a1, -24(s0)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB4_4
.LBB4_4:                                #   in Loop: Header=BB4_1 Depth=1
	j	.LBB4_5
.LBB4_5:                                #   in Loop: Header=BB4_1 Depth=1
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB4_1
.LBB4_6:
	lw	a0, -16(s0)
	lw	a1, -20(s0)
	sw	a1, 0(a0)
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end4:
	.size	usqrt, .Lfunc_end4-usqrt
                                        # -- End function
	.option	pop
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"********* CUBIC FUNCTIONS ***********\n"
	.size	.L.str, 39

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Solutions:"
	.size	.L.str.1, 11

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	" %f"
	.size	.L.str.2, 4

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"\n"
	.size	.L.str.3, 2

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"********* INTEGER SQR ROOTS ***********\n"
	.size	.L.str.4, 41

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"sqrt(%3d) = %2d\n"
	.size	.L.str.5, 17

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"\nsqrt(%lX) = %X\n"
	.size	.L.str.6, 17

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"********* ANGLE CONVERSION ***********\n"
	.size	.L.str.7, 40

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"%3.0f degrees = %.12f radians\n"
	.size	.L.str.8, 31

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.zero	1
	.size	.L.str.9, 1

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"%.12f radians = %3.0f degrees\n"
	.size	.L.str.10, 31

	.ident	"clang version 20.1.6"
	.ident	"clang version 20.1.6"
	.ident	"clang version 20.1.6"
	.ident	"clang version 20.1.6"
	.section	".note.GNU-stack","",@progbits
