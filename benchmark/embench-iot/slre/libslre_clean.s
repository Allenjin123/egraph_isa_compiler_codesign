	.file	"libslre.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	match_op, @function
match_op:
	lbu	a5,0(a0)
	addi	a4, zero, 92
	beq	a5,a4,.L2
	bltu	a4, a5, .L3
	addi	a4, zero, 36
	addi	a0, zero, -1
	beq	a5,a4,.L1
	addi	a4, zero, 46
	addi	a0, zero, 1
	bne	a5,a4,.L5
.L1:
	jalr	zero, ra, 0
.L3:
	addi	a4, zero, 124
	addi	a0, zero, -4
	beq	a5,a4,.L1
.L5:
	addi	a2,a2,2047
	lw	a4,369(a2)
	lbu	a3,0(a1)
	andi	a4,a4,1
	beq	a4,zero,.L18
	lui	a4,%hi(_ctype_+1)
	addi	a4,a4,%lo(_ctype_+1)
	add	a2,a4,a5
	lbu	a2,0(a2)
	addi	a1, zero, 1
	andi	a2,a2,3
	bne	a2,a1,.L19
	addi	a5,a5,32
.L19:
	add	a4,a4,a3
	lbu	a4,0(a4)
	addi	a2, zero, 1
	andi	a4,a4,3
	beq	a4,a2,.L38
.L18:
	bne	a5,a3,.L30
.L34:
	addi	a0, zero, 1
	jalr	zero, ra, 0
.L2:
	lbu	a5,1(a0)
	addi	a4, zero, 115
	lbu	a3,0(a1)
	beq	a5,a4,.L6
	bltu	a4, a5, .L7
	addi	a4, zero, 83
	beq	a5,a4,.L8
	addi	a4, zero, 100
	bne	a5,a4,.L18
	lui	a5,%hi(_ctype_+1)
	addi	a5,a5,%lo(_ctype_+1)
	add	a5,a3,a5
	lbu	a0,0(a5)
	andi	a0,a0,4
	sltiu	a0, a0, 1
	sub	a0, zero, a0
	ori	a0,a0,1
	jalr	zero, ra, 0
.L7:
	addi	a4, zero, 120
	bne	a5,a4,.L18
	lbu	a2,2(a0)
	lui	a4,%hi(_ctype_+1)
	addi	a4,a4,%lo(_ctype_+1)
	add	a5,a4,a2
	lbu	a5,0(a5)
	addi	a6, zero, 1
	addi	a1, a2, 0
	andi	a7,a5,3
	bne	a7,a6,.L12
	lui	a5,%hi(_ctype_+33)
	addi	a5,a5,%lo(_ctype_+33)
	add	a2,a2,a5
	lbu	a5,0(a2)
	addi	a1,a1,32
.L12:
	andi	a2,a5,4
	addi	a5,a1,-87
	beq	a2,zero,.L14
	addi	a5,a1,-48
.L14:
	lbu	a2,3(a0)
	addi	a0, zero, 1
	slli	a5,a5,4
	add	a4,a4,a2
	lbu	a4,0(a4)
	addi	a1, a2, 0
	andi	a6,a4,3
	bne	a6,a0,.L15
	lui	a4,%hi(_ctype_+33)
	addi	a4,a4,%lo(_ctype_+33)
	add	a2,a2,a4
	lbu	a4,0(a2)
	addi	a1,a1,32
.L15:
	andi	a4,a4,4
	addi	a2,a1,-87
	beq	a4,zero,.L17
	addi	a2,a1,-48
.L17:
	or	a5,a5,a2
	beq	a3,a5,.L34
.L30:
	addi	a0, zero, -1
	jalr	zero, ra, 0
.L6:
	lui	a5,%hi(_ctype_+1)
	addi	a5,a5,%lo(_ctype_+1)
	add	a5,a3,a5
	lbu	a0,0(a5)
	andi	a0,a0,8
	sltiu	a0, a0, 1
	sub	a0, zero, a0
	ori	a0,a0,1
	jalr	zero, ra, 0
.L38:
	addi	a3,a3,32
	jal	zero, .L18
.L8:
	lui	a5,%hi(_ctype_+1)
	addi	a5,a5,%lo(_ctype_+1)
	add	a5,a3,a5
	lbu	a0,0(a5)
	slli	a5,a0,28
	srai	a0,a5,31
	ori	a0,a0,1
	jalr	zero, ra, 0
	.size	match_op, .-match_op
	.align	2
	.type	bar, @function
bar:
	xori	a6, a3, -1
	srli	a6,a6,31
	slt	a7, zero, a1
	addi	sp,sp,-112
	and	a6,a7,a6
	sw	ra,108(sp)
	sw	s10,64(sp)
	sw	a6,20(sp)
	sw	a5,16(sp)
	beq	a6,zero,.L114
	sw	s1,100(sp)
	sw	s2,96(sp)
	sw	s5,84(sp)
	sw	s8,72(sp)
	sw	s9,68(sp)
	sw	s11,60(sp)
	sw	s0,104(sp)
	sw	s3,92(sp)
	sw	s4,88(sp)
	sw	s6,80(sp)
	sw	s7,76(sp)
	addi	s11, zero, 0
	addi	s5, zero, 0
	addi	s2, a0, 0
	addi	s9, a1, 0
	addi	s1, a3, 0
	sw	a2,12(sp)
	addi	s8, a4, 0
.L40:
	add	a0,s2,s5
	lbu	a1,0(a0)
	addi	a5, zero, 40
	beq	a1,a5,.L208
	addi	a5, zero, 91
	beq	a1,a5,.L209
	addi	a5, zero, 92
	beq	a1,a5,.L52
	addi	a5,a1,-42
	sltiu	a5,a5,2
	bne	a5,zero,.L130
	addi	a5,a1,-63
	beq	a5,zero,.L130
	addi	a4,s5,1
	bge	a4, s9, .L210
	addi	s6, zero, 1
	addi	s3, s6, 0
.L53:
	add	s6,s5,s6
	add	s6,s2,s6
	lbu	a7,0(s6)
	addi	a5,a7,-42
	sltiu	a5,a5,2
	addi	a7,a7,-63
	sltiu	a7, a7, 1
	bne	a5,zero,.L117
	bne	a7,zero,.L117
	addi	a5, zero, 94
	bne	a1,a5,.L113
	beq	s11,zero,.L206
.L83:
	addi	s10, zero, -1
	jal	zero, .L203
.L208:
	lw	a5,16(sp)
	addi	s6,a5,1
	slli	a5,s6,4
	add	a5,s8,a5
	lw	s3,4(a5)
	addi	s3,s3,2
	bge	zero, s3, .L129
	add	s0,s3,s5
	addi	a4, s0, 0
	blt	s0, s9, .L46
.L57:
	lw	a5,1600(s8)
	bge	s6, a5, .L138
	lw	a5,12(sp)
	sub	s4,s9,a4
	sub	s3,s1,s11
	add	s5,a5,s11
	blt	zero, s4, .L139
	addi	a1, s3, 0
	addi	a3, s6, 0
	addi	a2, s8, 0
	addi	a0, s5, 0
	sw	a4,24(sp)
.Lpcrel_1:
	auipc	ra, %pcrel_hi(doh)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_1)
	lw	a4,24(sp)
	addi	s10, a0, 0
.L107:
	blt	s10,zero,.L203
	add	a7,s10,s11
.L110:
	addi	a5,s8,2047
	lw	a5,361(a5)
	beq	a5,zero,.L112
	lw	a3,16(sp)
	slli	a3,a3,3
	add	a5,a5,a3
	sw	s5,0(a5)
	sw	s10,4(a5)
.L112:
	slt	a2,s1,a7
	addi	s11, a7, 0
	addi	s5, a4, 0
	sw	s6,16(sp)
	xori	a5,a2,1
.L62:
	bge	s5, s9, .L144
	bne	a5,zero,.L40
.L144:
	addi	s10, s11, 0
	jal	zero, .L203
.L49:
	blt	a4,a3,.L129
	addi	s3,a3,2
	bge	zero, s3, .L129
	add	a4,s5,s3
	addi	s0, a4, 0
	bge	a4, s9, .L186
.L46:
	add	s6,s2,s0
	lbu	a7,0(s6)
	addi	a5,a7,-42
	sltiu	a5,a5,2
	addi	a7,a7,-63
	sltiu	a7, a7, 1
	bne	a5,zero,.L117
	bne	a7,zero,.L117
	addi	a5, zero, 91
	beq	a1,a5,.L186
	lw	a5,16(sp)
	addi	s6,a5,1
	jal	zero, .L57
.L117:
	lw	a5,12(sp)
	sub	a3,s1,s11
	add	a2,a5,s11
	bne	a7,zero,.L211
	addi	s0, s8, 0
	sw	a2,24(sp)
	sw	a3,28(sp)
	addi	s8,a4,1
	addi	s4, a5, 0
	addi	s7, a0, 0
	bge	s8, s9, .L63
	add	a5,s2,s8
	lbu	a3,0(a5)
	addi	a5, zero, 63
	beq	a3,a5,.L212
.L64:
	sub	a5,s9,s8
	sw	a5,12(sp)
	add	a5,s2,s8
	sw	s6,32(sp)
	sw	s8,36(sp)
	sw	s2,44(sp)
	addi	s10, s11, 0
	sw	a5,20(sp)
	addi	s5, a7, 0
	add	s6,s4,s11
	sub	s8,s1,s11
	sw	s9,40(sp)
	addi	s2, s11, 0
.L74:
	lw	a5,16(sp)
	addi	a4, s0, 0
	addi	a1, s3, 0
	addi	a3, s8, 0
	addi	a2, s6, 0
	addi	a0, s7, 0
.Lpcrel_2:
	auipc	ra, %pcrel_hi(bar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_2)
	addi	s9, a0, 0
	lw	a5,16(sp)
	lw	a1,12(sp)
	lw	a0,20(sp)
	addi	a4, s0, 0
	bge	zero, s9, .L213
	add	s2,s2,s9
	sub	s8,s1,s2
	add	s6,s4,s2
	addi	a3, s8, 0
	addi	a2, s6, 0
.Lpcrel_3:
	auipc	ra, %pcrel_hi(bar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_3)
	blt	a0,zero,.L68
	add	s10,s2,a0
.L68:
	bge	s11,s10,.L74
	beq	s5,zero,.L74
	addi	s5, s9, 0
	lw	s6,32(sp)
	lw	s8,36(sp)
	lw	s9,40(sp)
	lw	s2,44(sp)
.L67:
	lbu	a5,0(s6)
.L79:
	blt	s5,zero,.L214
.L80:
	addi	a4, zero, 43
	beq	a5,a4,.L69
	sub	a6,s10,s11
	sltiu	a6, a6, 1
	slt	t6, s8, s9
	and	a6,a6,t6
	beq	a6,zero,.L203
	blt	a0,zero,.L83
.L203:
	lw	s0,104(sp)
	lw	ra,108(sp)
	lw	s1,100(sp)
	lw	s2,96(sp)
	lw	s3,92(sp)
	lw	s4,88(sp)
	lw	s5,84(sp)
	lw	s6,80(sp)
	lw	s7,76(sp)
	lw	s8,72(sp)
	lw	s9,68(sp)
	lw	s11,60(sp)
	addi	a0, s10, 0
	lw	s10,64(sp)
	addi	sp,sp,112
	jalr	zero, ra, 0
.L212:
	addi	s8,a4,2
	lw	a7,20(sp)
	blt	s8, s9, .L64
.L63:
	addi	s10, s11, 0
	addi	s5, a7, 0
.L77:
	lw	a5,16(sp)
	addi	a4, s0, 0
	sub	a3,s1,s10
	add	a2,s4,s10
	addi	a1, s3, 0
	addi	a0, s7, 0
.Lpcrel_4:
	auipc	ra, %pcrel_hi(bar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_4)
	bge	zero, a0, .L75
	add	s10,s10,a0
	bge	s11, s10, .L77
	beq	s5,zero,.L77
	addi	s5, a0, 0
	lbu	a5,0(s6)
	addi	a0, zero, -1
	jal	zero, .L79
.L75:
	lbu	a5,0(s6)
	addi	s5, a0, 0
	addi	a4,a5,-43
	bne	a4,zero,.L143
	bne	a0,zero,.L69
.L143:
	addi	a0, zero, -1
	bge	s5,zero,.L80
	jal	zero, .L214
.L209:
	sub	a4,s9,s5
	addi	a4,a4,-1
	addi	a3, zero, 0
	addi	a7, zero, 93
	addi	t1, zero, 92
	addi	t3, zero, 120
	bne	a4,zero,.L45
	jal	zero, .L215
.L48:
	add	a3,a3,a6
	bge	a3, a4, .L49
.L45:
	addi	a5,a3,1
	add	a5,a0,a5
	lbu	a2,0(a5)
	addi	a6, zero, 1
	beq	a2,a7,.L49
	bne	a2,t1,.L48
	lbu	a5,1(a5)
	addi	a6, zero, 4
	beq	a5,t3,.L48
	addi	a6, zero, 2
	jal	zero, .L48
.L186:
	addi	a5,s5,2
.L47:
	addi	s5,s5,1
	add	s5,s2,s5
	lbu	a2,0(s5)
	addi	a3, zero, 94
	sub	s10,s9,a5
	beq	a2,a3,.L216
	blt	s10,zero,.L83
	addi	s4, a2, 0
.L87:
	lw	a5,12(sp)
	addi	s0, zero, 0
	sw	s1,32(sp)
	sw	s2,36(sp)
	addi	s6, zero, 93
	sw	a2,24(sp)
	sw	a4,28(sp)
	addi	s2, s0, 0
	addi	a0, zero, -1
	addi	s7, zero, 1
	addi	s3, zero, 45
	addi	s1, s5, 0
	add	s0,a5,s11
	beq	s4,s6,.L204
.L105:
	beq	a0,s7,.L187
	add	s5,s1,s2
.L96:
	beq	s4,s3,.L88
	lbu	a5,1(s5)
	beq	a5,s3,.L217
.L89:
	addi	a2, s8, 0
	addi	a1, s0, 0
	addi	a0, s5, 0
.Lpcrel_5:
	auipc	ra, %pcrel_hi(match_op)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_5)
	addi	a5, zero, 92
	addi	a3, zero, 1
	bne	s4,a5,.L100
	lbu	a5,1(s5)
	addi	a4, zero, 120
	addi	a3, zero, 4
	beq	a5,a4,.L100
	addi	a3, zero, 2
.L100:
	add	s2,s2,a3
.L99:
	blt	s10, s2, .L204
	add	s5,s1,s2
	lbu	s4,0(s5)
	bne	s4,s6,.L105
.L204:
	lw	a2,24(sp)
	lw	a4,28(sp)
	lw	s1,32(sp)
	lw	s2,36(sp)
	addi	a0,a0,-1
	sltu	a0, zero, a0
.L104:
	addi	a5,a2,-94
	sltu	a5, zero, a5
	beq	a5,a0,.L83
.L86:
	addi	s11,s11,1
	slt	a5,s1,s11
	addi	s5, a4, 0
	xori	a5,a5,1
	jal	zero, .L62
.L52:
	lbu	a4,1(a0)
	addi	a5, zero, 120
	beq	a4,a5,.L218
	addi	a4,s5,2
	addi	s3, zero, 2
	blt	a4, s9, .L219
.L115:
	bge	s11, s1, .L83
	lw	a5,12(sp)
	addi	a2, s8, 0
	add	a1,a5,s11
.Lpcrel_6:
	auipc	ra, %pcrel_hi(match_op)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_6)
	addi	a5, zero, 1
	addi	s10, a0, 0
	bne	a0,a5,.L203
	add	s11,s11,a5
	slt	a5,s1,s11
	add	s5,s5,s3
	xor	a5,a5,a0
	jal	zero, .L62
.L210:
	addi	a5, zero, 94
	beq	a1,a5,.L220
	addi	s3, zero, 1
.L113:
	addi	a5, zero, 36
	bne	a1,a5,.L115
	bne	s1,s11,.L83
.L206:
	lw	a5,20(sp)
	addi	s5, a4, 0
	jal	zero, .L62
.L214:
	addi	a4, zero, 42
	bne	a5,a4,.L80
	lw	a5,16(sp)
	lw	a3,28(sp)
	lw	a2,24(sp)
	addi	a4, s0, 0
	add	a0,s2,s8
	sub	a1,s9,s8
.Lpcrel_7:
	auipc	ra, %pcrel_hi(bar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_7)
	bge	zero, a0, .L221
	add	s10,a0,s11
	jal	zero, .L203
.L139:
	add	s0,s2,s0
	sw	s2,28(sp)
	sw	a4,24(sp)
	addi	s2, zero, 0
.L106:
	addi	a3, s6, 0
	addi	a2, s8, 0
	sub	a1,s3,s2
	addi	a0, s5, 0
.Lpcrel_8:
	auipc	ra, %pcrel_hi(doh)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_8)
	addi	s10, a0, 0
	bge	a0,zero,.L222
.L188:
	addi	s2,s2,1
	blt	s3, s2, .L203
	addi	a3, s6, 0
	addi	a2, s8, 0
	sub	a1,s3,s2
	addi	a0, s5, 0
.Lpcrel_9:
	auipc	ra, %pcrel_hi(doh)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_9)
	addi	s10, a0, 0
	blt	a0,zero,.L188
.L222:
	lw	a5,12(sp)
	add	s7,a0,s11
	sub	a3,s1,s7
	add	a2,a5,s7
	addi	a4, s8, 0
	addi	a5, s6, 0
	addi	a1, s4, 0
	addi	a0, s0, 0
.Lpcrel_10:
	auipc	ra, %pcrel_hi(bar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_10)
	addi	s2,s2,1
	bge	a0,zero,.L223
	bge	s3, s2, .L106
	lw	a4,24(sp)
	lw	s2,28(sp)
	jal	zero, .L107
.L69:
	bne	s11,s10,.L203
	addi	s10, zero, -1
	jal	zero, .L203
.L88:
	addi	a0, s5, 0
	addi	a2, s8, 0
	addi	a1, s0, 0
.Lpcrel_11:
	auipc	ra, %pcrel_hi(match_op)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_11)
	addi	a3, zero, 1
	add	s2,s2,a3
	jal	zero, .L99
.L217:
	lbu	a3,2(s5)
	addi	a5,a3,-93
	beq	a5,zero,.L89
	beq	a3,zero,.L89
	addi	a5,s8,2047
	lw	a0,369(a5)
	lbu	a2,0(s0)
	bne	a0,zero,.L224
	lui	a1,%hi(_ctype_+1)
	addi	a1,a1,%lo(_ctype_+1)
	add	a5,a1,a2
	lbu	a5,0(a5)
	addi	a4, zero, 1
	andi	a5,a5,3
	bne	a5,a4,.L92
	addi	a2,a2,32
.L92:
	add	a5,a1,s4
	lbu	a5,0(a5)
	addi	a4, zero, 1
	andi	a5,a5,3
	beq	a5,a4,.L225
.L93:
	bge	a2,s4,.L94
	addi	s2,s2,3
	blt	s10,s2,.L204
	add	s5,s1,s2
	lbu	s4,0(s5)
	addi	a5, zero, 93
	bne	s4,a5,.L96
	jal	zero, .L204
.L219:
	addi	s6, zero, 2
	addi	s3, s6, 0
	jal	zero, .L53
.L216:
	addi	s10,s10,-1
	blt	s10,zero,.L86
	lbu	s4,1(s5)
	addi	s5,s5,1
	jal	zero, .L87
.L224:
	sltu	a0,a3,a2
	sltu	a2, a2, s4
	sltiu	a0, a0, 1
	sltiu	a2, a2, 1
	and	a0,a0,a2
	addi	s2,s2,3
	jal	zero, .L99
.L218:
	addi	a4,s5,4
	addi	s3, zero, 4
	bge	a4, s9, .L115
	addi	s6, zero, 4
	addi	s3, s6, 0
	jal	zero, .L53
.L225:
	addi	s4,s4,32
	jal	zero, .L93
.L220:
	bne	s11,zero,.L83
	lw	s0,104(sp)
	lw	s1,100(sp)
	lw	s2,96(sp)
	lw	s3,92(sp)
	lw	s4,88(sp)
	lw	s5,84(sp)
	lw	s6,80(sp)
	lw	s7,76(sp)
	lw	s8,72(sp)
	lw	s9,68(sp)
	lw	s11,60(sp)
.L114:
	lw	ra,108(sp)
	addi	s10, zero, 0
	addi	a0, s10, 0
	lw	s10,64(sp)
	addi	sp,sp,112
	jalr	zero, ra, 0
.L187:
	lw	a2,24(sp)
	lw	a4,28(sp)
	lw	s1,32(sp)
	lw	s2,36(sp)
	addi	a0, zero, 0
	jal	zero, .L104
.L211:
	lw	a5,16(sp)
	addi	a4, s8, 0
	addi	a1, s3, 0
.Lpcrel_12:
	auipc	ra, %pcrel_hi(bar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_12)
	xori	a5, a0, -1
	srai	a5,a5,31
	and	a0,a0,a5
	add	s11,s11,a0
	addi	s5,s5,1
	slt	a5,s1,s11
	add	s5,s5,s3
	xori	a5,a5,1
	jal	zero, .L62
.L94:
	add	a1,a1,a3
	addi	a5, a3, 0
	lbu	a3,0(a1)
	addi	a1, zero, 1
	andi	a3,a3,3
	bne	a3,a1,.L98
	addi	a5,a5,32
.L98:
	slt	a2, a5, a2
	sltiu	a0, a2, 1
	addi	s2,s2,3
	jal	zero, .L99
.L129:
	addi	s10, zero, -5
	jal	zero, .L203
.L223:
	lw	a4,24(sp)
	lw	s2,28(sp)
	addi	a7, s7, 0
	jal	zero, .L110
.L221:
	lbu	a5,0(s6)
	jal	zero, .L80
.L213:
	addi	a2, s6, 0
	lw	s6,32(sp)
	addi	s5, s9, 0
	addi	a6, s2, 0
	lbu	a5,0(s6)
	addi	a3, s8, 0
	lw	s9,40(sp)
	addi	a5,a5,-43
	lw	s8,36(sp)
	lw	s2,44(sp)
	bne	a5,zero,.L71
	bne	s5,zero,.L69
.L71:
	lw	a5,16(sp)
	addi	a4, s0, 0
	sub	a1,s9,s8
	add	a0,s2,s8
	sw	a6,12(sp)
.Lpcrel_13:
	auipc	ra, %pcrel_hi(bar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_13)
	lw	a6,12(sp)
	blt	a0,zero,.L67
	lbu	a5,0(s6)
	add	s10,a0,a6
	jal	zero, .L79
.L215:
	addi	a4,s5,2
	addi	a5, a4, 0
	bge	a4, s9, .L47
	addi	s3, zero, 2
	addi	s0, a4, 0
	jal	zero, .L46
.L130:
	addi	s10, zero, -2
	jal	zero, .L203
.L138:
	addi	s10, zero, -4
	jal	zero, .L203
	.size	bar, .-bar
	.align	2
	.type	doh, @function
doh:
	addi	sp,sp,-32
	sw	s5,4(sp)
	slli	s5,a3,4
	add	s5,a2,s5
	sw	s0,24(sp)
	lw	s0,12(s5)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	ra,28(sp)
	addi	s2, a0, 0
	addi	s1, a3, 0
	lw	a0,0(s5)
	addi	s4, a2, 0
	addi	s3, a1, 0
	beq	s0,zero,.L234
	lw	a3,8(s5)
	addi	s0, zero, 0
.L227:
	add	a3,s0,a3
	slli	a3,a3,3
	add	a3,s4,a3
	lw	a1,1608(a3)
	sub	a1,a1,a0
.L229:
	addi	a5, s1, 0
	addi	a4, s4, 0
	addi	a3, s3, 0
	addi	a2, s2, 0
.Lpcrel_14:
	auipc	ra, %pcrel_hi(bar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_14)
	blt	zero, a0, .L226
.L235:
	lw	a4,12(s5)
	bge	s0, a4, .L226
	lw	a3,8(s5)
	addi	s0,s0,1
	add	a5,s0,a3
	slli	a5,a5,3
	add	a5,s4,a5
	lw	a0,1600(a5)
	addi	a0,a0,1
	bne	a4,s0,.L227
	lw	a5,4(s5)
	lw	a1,0(s5)
	addi	a4, s4, 0
	addi	a3, s3, 0
	add	a1,a1,a5
	sub	a1,a1,a0
	addi	a5, s1, 0
	addi	a2, s2, 0
.Lpcrel_15:
	auipc	ra, %pcrel_hi(bar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_15)
	bge	zero, a0, .L235
.L226:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	lw	s5,4(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L234:
	lw	a1,4(s5)
	jal	zero, .L229
	.size	doh, .-doh
	.align	2
	.type	foo, @function
foo:
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
	addi	t3, zero, 1
	sw	a0,0(a4)
	sw	a1,4(a4)
	sw	t3,1600(a4)
	bge	zero, a1, .L322
	lui	s0, 1
	lui	s5,%hi(_ctype_+1)
	addi	s2, zero, -1
	sw	s9,4(sp)
	sw	s10,0(sp)
	addi	s1, zero, 0
	addi	t4, zero, 0
	add	s0,a4,s0
	addi	s5,s5,%lo(_ctype_+1)
	addi	t2, zero, 91
	addi	t6, zero, 92
	addi	s4, zero, 124
	addi	s6, zero, 40
	addi	s9, zero, 41
	addi	s3, zero, 99
	addi	t0, zero, 120
	add	s7,a1,s2
	addi	s8,a1,-3
.L237:
	add	t3,a0,t4
	lbu	a5,0(t3)
	beq	a5,t2,.L328
	beq	a5,t6,.L329
	beq	a5,s4,.L330
	bne	a5,s6,.L259
	lw	a5,1600(a4)
	blt	s3, a5, .L306
	addi	t4,t4,1
	slli	a6,a5,4
	add	a6,a4,a6
	add	a7,a0,t4
	sw	a7,0(a6)
	sw	s2,4(a6)
	lw	a6,-1684(s0)
	addi	a7,a5,1
	sw	a7,1600(a4)
	bge	a6, a5, .L311
	blt	zero, a6, .L307
.L311:
	addi	s1,s1,1
.L248:
	blt	t4, a1, .L237
.L332:
	bne	s1,zero,.L266
	addi	a5,a4,2047
	lw	a6,357(a5)
	lw	s9,4(sp)
	lw	s10,0(sp)
	bge	zero, a6, .L240
.L239:
	lui	t4, 1
	add	t4,a4,t4
	addi	a7, a4, 0
	addi	t3, zero, 0
.L272:
	addi	t3,t3,1
	bge	t3,a6,.L240
	lw	t1,1604(a7)
	addi	a5, a7, 0
	addi	a1, t3, 0
.L271:
	lw	a0,1612(a5)
	bge	a0, t1, .L268
.L331:
	sw	a0,1604(a7)
	lw	a6,1616(a5)
	lw	a0,1608(a7)
	addi	a1,a1,1
	sw	a6,1608(a7)
	sw	a0,1616(a5)
	sw	t1,1612(a5)
	lw	a6,-1692(t4)
	addi	a5,a5,8
	bge	a1, a6, .L269
	lw	t1,1604(a7)
	lw	a0,1612(a5)
	blt	a0, t1, .L331
.L268:
	addi	a1,a1,1
	bge	a1,a6,.L269
	addi	a5,a5,8
	jal	zero, .L271
.L330:
	lw	a5,-1692(s0)
	blt	s3, a5, .L300
	lw	a6,1600(a4)
	addi	a6,a6,-1
	slli	a7,a6,4
	add	a7,a4,a7
	lw	a7,4(a7)
	beq	a7,s2,.L254
	addi	a6, s1, 0
.L254:
	slli	a7,a5,3
	add	a7,a4,a7
	sw	a6,1604(a7)
	sw	t3,1608(a7)
	addi	a5,a5,1
	addi	t4,t4,1
	sw	a5,-1692(s0)
	blt	t4, a1, .L237
	jal	zero, .L332
.L328:
	sub	t5,a1,t4
	addi	t5,t5,-1
	addi	a5, zero, 0
	addi	s10, zero, 93
	bne	t5,zero,.L242
	jal	zero, .L333
.L244:
	add	a5,a5,t1
	bge	a5, t5, .L245
.L242:
	addi	a6,a5,1
	add	a6,t3,a6
	lbu	a7,0(a6)
	addi	t1, zero, 1
	beq	a7,s10,.L245
	bne	a7,t6,.L244
	lbu	a6,1(a6)
	addi	t1, zero, 4
	beq	a6,t0,.L244
	addi	t1, zero, 2
	add	a5,a5,t1
	blt	a5, t5, .L242
.L245:
	blt	t5,a5,.L248
	addi	a5,a5,2
	add	t4,t4,a5
.L341:
	blt	t4, a1, .L237
	jal	zero, .L332
.L329:
	lbu	a5,1(t3)
	addi	a7, zero, 2
	beq	a5,t0,.L334
.L251:
	bge	t4, s7, .L305
	lbu	a5,1(t3)
	bne	a5,t0,.L335
	bge	t4, s8, .L305
	lbu	a5,2(t3)
	add	a5,a5,s5
	lbu	a5,0(a5)
	andi	a5,a5,68
	beq	a5,zero,.L305
	lbu	a5,3(t3)
	add	a5,a5,s5
	lbu	a5,0(a5)
	andi	a5,a5,68
	beq	a5,zero,.L305
.L327:
	add	t4,t4,a7
	blt	t4, a1, .L237
	jal	zero, .L332
.L334:
	addi	a7, zero, 4
	jal	zero, .L251
.L259:
	bne	a5,s9,.L265
	lw	a5,1600(a4)
	addi	a5,a5,-1
	slli	a5,a5,4
	add	a6,a4,a5
	lw	a6,4(a6)
	beq	a6,s2,.L262
	slli	a5,s1,4
.L262:
	add	a5,a4,a5
	lw	a6,0(a5)
	addi	s1,s1,-1
	sub	a6,t3,a6
	sw	a6,4(a5)
	blt	s1,zero,.L266
	bge	zero, t4, .L265
	lbu	a6,-1(t3)
	addi	a5, zero, 40
	beq	a6,a5,.L336
.L265:
	addi	t4,t4,1
	blt	t4, a1, .L237
	jal	zero, .L332
.L335:
	addi	a6,a5,-40
	andi	a6,a6,0xff
	addi	t1, zero, 23
	bgeu	t1, a6, .L256
	andi	a6,a5,191
	addi	a6,a6,-36
	sltiu	a6, a6, 1
.L257:
	addi	t3,a5,-124
	sltiu	t1, a5, 1
	sltiu	t3, t3, 1
	or	t3,t3,t1
	addi	t1,a5,-91
	andi	a5,a5,223
	sltiu	t1,t1,4
	addi	a5,a5,-83
	or	t1,t1,t3
	sltiu	a5, a5, 1
	or	a5,a5,t1
	bne	a5,zero,.L327
	bne	a6,zero,.L327
.L305:
	lw	s9,4(sp)
	lw	s10,0(sp)
	addi	a0, zero, -6
.L236:
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
	addi	sp,sp,48
	jalr	zero, ra, 0
.L256:
	lui	t1, 1046528
	addi	t1,t1,-80
	sra	a6,t1,a6
	andi	a6,a6,1
	xori	a6,a6,1
	jal	zero, .L257
.L269:
	addi	a7,a7,8
	blt	t3,a6,.L272
.L240:
	lw	t3,1600(a4)
	bge	zero, t3, .L280
.L273:
	addi	a0, zero, 0
	sw	zero,12(a4)
	sw	a0,8(a4)
	addi	a7,a4,12
	addi	t1, zero, 0
	bge	a0,a6,.L276
.L337:
	slli	a1,a0,3
	add	a1,a4,a1
	jal	zero, .L277
.L279:
	lw	a5,0(a7)
	addi	a0,a0,1
	addi	a5,a5,1
	sw	a5,0(a7)
	beq	a0,a6,.L278
.L277:
	lw	a5,1604(a1)
	addi	a1,a1,8
	beq	a5,t1,.L279
.L278:
	addi	t1,t1,1
	beq	t1,t3,.L280
	sw	zero,16(a7)
	sw	a0,12(a7)
	addi	a7,a7,16
	blt	a0,a6,.L337
.L276:
	addi	t1,t1,1
	slli	a5,t1,4
	add	a5,a4,a5
	beq	t1,t3,.L280
.L281:
	sw	zero,12(a5)
	sw	a0,8(a5)
	addi	t1,t1,1
	addi	a5,a5,16
	blt	t1,t3,.L281
.L280:
	blt	a3,zero,.L275
	lw	a5,0(a4)
	addi	s4, a3, 0
	lw	a3,12(a4)
	lbu	s7,0(a5)
	addi	s5, a2, 0
	addi	s0, a4, 0
	addi	s3, zero, 0
	addi	s6, zero, 94
.L291:
	lw	a0,0(s0)
	addi	s8, a3, 0
	add	s1,s5,s3
	sub	s2,s4,s3
	beq	a3,zero,.L338
	lw	a4,8(s0)
	addi	s8, zero, 0
.L283:
	add	a5,s8,a4
	slli	a5,a5,3
	add	a5,s0,a5
	lw	a1,1608(a5)
	sub	a1,a1,a0
.L285:
	addi	a5, zero, 0
	addi	a4, s0, 0
	addi	a3, s2, 0
	addi	a2, s1, 0
.Lpcrel_16:
	auipc	ra, %pcrel_hi(bar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_16)
	blt	zero, a0, .L339
.L286:
	lw	a3,12(s0)
	bge	s8, a3, .L288
	lw	a4,8(s0)
	addi	s8,s8,1
	add	a5,s8,a4
	slli	a5,a5,3
	add	a5,s0,a5
	lw	a0,1600(a5)
	addi	a0,a0,1
	bne	s8,a3,.L283
	lw	a5,4(s0)
	lw	a1,0(s0)
	addi	a4, s0, 0
	addi	a3, s2, 0
	add	a1,a1,a5
	sub	a1,a1,a0
	addi	a5, zero, 0
	addi	a2, s1, 0
.Lpcrel_17:
	auipc	ra, %pcrel_hi(bar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_17)
	bge	zero, a0, .L286
.L339:
	add	a0,a0,s3
	jal	zero, .L236
.L338:
	lw	a1,4(s0)
	jal	zero, .L285
.L288:
	beq	a0,zero,.L340
	beq	s7,s6,.L236
	addi	s3,s3,1
	bge	s4,s3,.L291
	jal	zero, .L236
.L333:
	addi	a5, zero, 2
	add	t4,t4,a5
	jal	zero, .L341
.L300:
	lw	s9,4(sp)
	lw	s10,0(sp)
	addi	a0, zero, -8
	jal	zero, .L236
.L307:
	lw	s9,4(sp)
	lw	s10,0(sp)
	addi	a0, zero, -7
	jal	zero, .L236
.L336:
	lw	s9,4(sp)
	lw	s10,0(sp)
.L275:
	addi	a0, zero, -1
	jal	zero, .L236
.L306:
	lw	s9,4(sp)
	lw	s10,0(sp)
	addi	a0, zero, -9
	jal	zero, .L236
.L266:
	lw	s9,4(sp)
	lw	s10,0(sp)
	addi	a0, zero, -3
	jal	zero, .L236
.L322:
	addi	a5,a4,2047
	lw	a6,357(a5)
	blt	zero, a6, .L239
	jal	zero, .L273
.L340:
	addi	a0, s3, 0
	jal	zero, .L236
	.size	foo, .-foo
	.align	2
	.type	slre_match.constprop.0, @function
slre_match.constprop.0:
	addi	sp,sp,-2032
	sw	ra,2028(sp)
	addi	sp,sp,-416
	addi	a4,sp,2047
	addi	a4,a4,369
	sw	zero,0(a4)
	addi	a4,sp,2047
	addi	a5,sp,2047
	addi	a4,a4,381
	addi	a5,a5,373
	sw	zero,0(a4)
	lbu	a6,0(a0)
	addi	a4,sp,2047
	addi	a4,a4,377
	sw	a2,0(a5)
	addi	a5, zero, 1
	sw	a5,0(a4)
	sw	zero,1612(sp)
	addi	a4, zero, 40
	addi	a3, a1, 0
	bne	a6,a4,.L343
	lbu	a2,1(a0)
	addi	a4, zero, 63
	bne	a2,a4,.L344
	lbu	a2,2(a0)
	addi	a4, zero, 105
	bne	a2,a4,.L344
	lbu	a2,3(a0)
	addi	a4, zero, 41
	bne	a2,a4,.L344
	addi	a4,sp,2047
	addi	a4,a4,381
	addi	a0,a0,4
	sw	a5,0(a4)
.L343:
	lbu	a5,0(a0)
	beq	a5,zero,.L347
.L344:
	addi	a5, zero, 0
.L346:
	addi	a5,a5,1
	add	a4,a0,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L346
	addi	a1, a5, 0
.L345:
	lui	a2,%hi(.LANCHOR0)
	addi	a4,sp,12
	addi	a2,a2,%lo(.LANCHOR0)
.Lpcrel_18:
	auipc	ra, %pcrel_hi(foo)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_18)
	addi	sp,sp,416
	lw	ra,2028(sp)
	addi	sp,sp,2032
	jalr	zero, ra, 0
.L347:
	addi	a1, zero, 0
	jal	zero, .L345
	.size	slre_match.constprop.0, .-slre_match.constprop.0
	.align	2
	.type	benchmark_body.constprop.0, @function
benchmark_body.constprop.0:
	addi	sp,sp,-48
	sw	s4,24(sp)
	lui	s4,%hi(.LANCHOR0)
	addi	s4,s4,%lo(.LANCHOR0)
	sw	s5,20(sp)
	addi	s5, zero, 1
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s6,16(sp)
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	sub	s5,s5,s4
	addi	s2,s4,64
	addi	s3, zero, 110
	lui	s6,%hi(.LANCHOR0+48)
.L351:
	lbu	a4,0(s4)
	addi	a5, s4, 0
	addi	s1, zero, 0
	beq	a4,zero,.L356
.L352:
	addi	a1, a5, 0
	lbu	a4,1(a5)
	addi	a5,a5,1
	bne	a4,zero,.L352
	add	s1,s5,a1
.L356:
	sw	zero,4(sp)
	addi	s0,s6,%lo(.LANCHOR0+48)
.L353:
	lw	a0,0(s0)
	addi	a2,sp,8
	addi	a1, s1, 0
.Lpcrel_19:
	auipc	ra, %pcrel_hi(slre_match.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_19)
	lw	a5,4(sp)
	addi	s0,s0,4
	add	a0,a0,a5
	sw	a0,4(sp)
	bne	s0,s2,.L353
	addi	s3,s3,-1
	bne	s3,zero,.L351
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	a0,4(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	addi	sp,sp,48
	jalr	zero, ra, 0
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	addi	sp,sp,-64
	sw	ra,60(sp)
	bge	zero, a0, .L363
	sw	s3,44(sp)
	lui	s3,%hi(.LANCHOR0)
	addi	s3,s3,%lo(.LANCHOR0)
	sw	s5,36(sp)
	addi	s5, zero, 1
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s4,40(sp)
	sw	s6,32(sp)
	sw	s0,56(sp)
	sw	s7,28(sp)
	addi	s4, a0, 0
	sub	s5,s5,s3
	addi	s1,s3,64
	addi	s2, zero, 0
	lui	s6,%hi(.LANCHOR0+48)
.L362:
	lbu	a4,0(s3)
	addi	a5, s3, 0
	addi	s7, zero, 0
	beq	a4,zero,.L367
.L364:
	addi	a1, a5, 0
	lbu	a4,1(a5)
	addi	a5,a5,1
	bne	a4,zero,.L364
	add	s7,s5,a1
.L367:
	sw	zero,4(sp)
	addi	s0,s6,%lo(.LANCHOR0+48)
.L365:
	lw	a0,0(s0)
	addi	a2,sp,8
	addi	a1, s7, 0
.Lpcrel_20:
	auipc	ra, %pcrel_hi(slre_match.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_20)
	lw	a5,4(sp)
	addi	s0,s0,4
	add	a0,a0,a5
	sw	a0,4(sp)
	bne	s0,s1,.L365
	addi	s2,s2,1
	bne	s2,s4,.L362
	lw	s0,56(sp)
	lw	s1,52(sp)
	lw	s2,48(sp)
	lw	s3,44(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	lw	s6,32(sp)
	lw	s7,28(sp)
.L363:
	lw	ra,60(sp)
	lw	a5,4(sp)
	addi	sp,sp,64
	jalr	zero, ra, 0
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.globl	memset
	.type	memset, @function
memset:
	beq	a2,zero,.L386
	addi	a5,a2,-1
	addi	a4, zero, 5
	andi	a1,a1,0xff
	bgeu	a4, a5, .L382
	sub	a4, zero, a0
	andi	a5,a4,3
	addi	a6, zero, 0
	beq	a5,zero,.L376
	sb	a1,0(a0)
	andi	a4,a4,2
	addi	a6, zero, 1
	beq	a4,zero,.L376
	sb	a1,1(a0)
	addi	a4, zero, 3
	addi	a6, zero, 2
	bne	a5,a4,.L376
	sb	a1,2(a0)
	addi	a6, a5, 0
.L376:
	slli	a4,a1,8
	slli	a3,a1,16
	sub	t1,a2,a5
	or	a4,a1,a4
	or	a4,a4,a3
	add	a5,a0,a5
	slli	a3,a1,24
	andi	a7,t1,-4
	or	a4,a4,a3
	add	a3,a5,a7
.L378:
	sw	a4,0(a5)
	addi	a5,a5,4
	bne	a5,a3,.L378
	add	a5,a6,a7
	beq	t1,a7,.L386
.L375:
	add	a4,a0,a5
	sb	a1,0(a4)
	addi	a4,a5,1
	bgeu	a4, a2, .L386
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,2
	bgeu	a4, a2, .L386
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,3
	bgeu	a4, a2, .L386
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,4
	bgeu	a4, a2, .L386
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a5,a5,5
	bgeu	a5, a2, .L386
	add	a5,a0,a5
	sb	a1,0(a5)
.L386:
	jalr	zero, ra, 0
.L382:
	addi	a5, zero, 0
	jal	zero, .L375
	.size	memset, .-memset
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	beq	a2,zero,.L391
	addi	a5,a2,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L392
	or	a3,a0,a1
	andi	a3,a3,3
	addi	a4, a0, 0
	addi	a5, a1, 0
	bne	a3,zero,.L392
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L392
	andi	a7,a2,-4
	add	a6,a1,a7
.L393:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L393
	beq	a2,a7,.L391
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a2, .L391
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a2, .L391
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	jalr	zero, ra, 0
.L392:
	add	a2,a1,a2
	addi	a5, a0, 0
.L395:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L395
.L391:
	jalr	zero, ra, 0
	.size	memcpy, .-memcpy
	.align	2
	.globl	memcmp
	.type	memcmp, @function
memcmp:
	beq	a2,zero,.L412
	add	a2,a0,a2
	jal	zero, .L411
.L410:
	beq	a0,a2,.L412
.L411:
	lbu	a5,0(a0)
	lbu	a4,0(a1)
	addi	a0,a0,1
	addi	a1,a1,1
	beq	a5,a4,.L410
	sub	a0,a5,a4
	jalr	zero, ra, 0
.L412:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	memcmp, .-memcmp
	.align	2
	.globl	memmove
	.type	memmove, @function
memmove:
	bgeu	a0,a1,.L415
	beq	a2,zero,.L416
	addi	a5,a2,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L417
	or	a3,a1,a0
	andi	a3,a3,3
	addi	a4, a0, 0
	addi	a5, a1, 0
	bne	a3,zero,.L417
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L417
	andi	a7,a2,-4
	add	a6,a1,a7
.L418:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L418
	beq	a2,a7,.L416
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a2, .L416
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a2, .L416
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	jalr	zero, ra, 0
.L415:
	bltu	a1, a0, .L438
.L416:
	jalr	zero, ra, 0
.L438:
	beq	a2,zero,.L416
	addi	a2,a2,-1
	add	a5,a1,a2
	lbu	a4,0(a5)
	add	a5,a0,a2
	sb	a4,0(a5)
	jal	zero, .L438
.L417:
	add	a2,a1,a2
	addi	a5, a0, 0
.L420:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L420
	jalr	zero, ra, 0
	.size	memmove, .-memmove
	.align	2
	.globl	strlen
	.type	strlen, @function
strlen:
	lbu	a5,0(a0)
	beq	a5,zero,.L439
	addi	a5, zero, 0
.L441:
	addi	a5,a5,1
	add	a4,a0,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L441
.L439:
	addi	a0, a5, 0
	jalr	zero, ra, 0
	.size	strlen, .-strlen
	.align	2
	.globl	strchr
	.type	strchr, @function
strchr:
	lbu	a5,0(a0)
	beq	a5,zero,.L445
	andi	a4,a1,0xff
.L447:
	beq	a4,a5,.L444
	lbu	a5,1(a0)
	addi	a0,a0,1
	bne	a5,zero,.L447
.L445:
	sltiu	a1, a1, 1
	sub	a1, zero, a1
	and	a0,a0,a1
.L444:
	jalr	zero, ra, 0
	.size	strchr, .-strchr
	.align	2
	.globl	rand_beebs
	.type	rand_beebs, @function
rand_beebs:
	lui	a4,%hi(seed)
	lw	a0,%lo(seed)(a4)
	lui	a5, 269413
	addi	a5,a5,-403
	mul	a0,a0,a5
	lui	a5, 3
	addi	a5,a5,57
	add	a0,a0,a5
	slli	a0,a0,1
	srli	a0,a0,1
	sw	a0,%lo(seed)(a4)
	srli	a0,a0,16
	jalr	zero, ra, 0
	.size	rand_beebs, .-rand_beebs
	.align	2
	.globl	srand_beebs
	.type	srand_beebs, @function
srand_beebs:
	lui	a5,%hi(seed)
	sw	a0,%lo(seed)(a5)
	jalr	zero, ra, 0
	.size	srand_beebs, .-srand_beebs
	.align	2
	.globl	init_heap_beebs
	.type	init_heap_beebs, @function
init_heap_beebs:
	add	a1,a0,a1
	lui	a3,%hi(heap_end)
	lui	a4,%hi(heap_ptr)
	lui	a5,%hi(heap_requested)
	sw	a1,%lo(heap_end)(a3)
	sw	a0,%lo(heap_ptr)(a4)
	sw	zero,%lo(heap_requested)(a5)
	jalr	zero, ra, 0
	.size	init_heap_beebs, .-init_heap_beebs
	.align	2
	.globl	check_heap_beebs
	.type	check_heap_beebs, @function
check_heap_beebs:
	lui	a5,%hi(heap_requested)
	lw	a4,%lo(heap_requested)(a5)
	lui	a5,%hi(heap_end)
	lw	a5,%lo(heap_end)(a5)
	add	a0,a0,a4
	sltu	a0,a5,a0
	xori	a0,a0,1
	jalr	zero, ra, 0
	.size	check_heap_beebs, .-check_heap_beebs
	.align	2
	.globl	malloc_beebs
	.type	malloc_beebs, @function
malloc_beebs:
	addi	a5, a0, 0
	beq	a0,zero,.L460
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a1,%lo(heap_requested)(a3)
	add	a4,a0,a5
	andi	a6,a4,3
	add	a5,a5,a1
	bne	a6,zero,.L464
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a1,a4,.L460
.L465:
	sw	a4,%lo(heap_ptr)(a2)
	jalr	zero, ra, 0
.L464:
	addi	a1, zero, 4
	sub	a1,a1,a6
	add	a5,a5,a1
	add	a4,a4,a1
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a1,a4,.L465
.L460:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	malloc_beebs, .-malloc_beebs
	.align	2
	.globl	calloc_beebs
	.type	calloc_beebs, @function
calloc_beebs:
	mul	a1,a0,a1
	beq	a1,zero,.L467
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a0,a1
	andi	a6,a4,3
	add	a5,a1,a5
	bne	a6,zero,.L492
.L468:
	lui	a6,%hi(heap_end)
	lw	a6,%lo(heap_end)(a6)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a6,a4,.L467
	sw	a4,%lo(heap_ptr)(a2)
	beq	a0,zero,.L467
	addi	a5,a1,-1
	addi	a4, zero, 5
	bgeu	a4, a5, .L476
	sub	a4, zero, a0
	andi	a5,a4,3
	addi	a3, zero, 0
	beq	a5,zero,.L470
	sb	zero,0(a0)
	andi	a4,a4,2
	addi	a3, zero, 1
	beq	a4,zero,.L470
	sb	zero,1(a0)
	addi	a4, zero, 3
	addi	a3, zero, 2
	bne	a5,a4,.L470
	sb	zero,2(a0)
	addi	a3, a5, 0
.L470:
	sub	a6,a1,a5
	andi	a2,a6,-4
	add	a5,a0,a5
	add	a4,a5,a2
.L472:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L472
	add	a5,a3,a2
	beq	a6,a2,.L466
.L469:
	add	a4,a0,a5
	sb	zero,0(a4)
	addi	a4,a5,1
	bgeu	a4, a1, .L466
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,2
	bgeu	a4, a1, .L466
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,3
	bgeu	a4, a1, .L466
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,4
	bgeu	a4, a1, .L466
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a5,a5,5
	bgeu	a5, a1, .L466
	add	a5,a0,a5
	sb	zero,0(a5)
	jalr	zero, ra, 0
.L467:
	addi	a0, zero, 0
.L466:
	jalr	zero, ra, 0
.L492:
	addi	a7, zero, 4
	sub	a6,a7,a6
	add	a4,a4,a6
	add	a5,a5,a6
	jal	zero, .L468
.L476:
	addi	a5, zero, 0
	jal	zero, .L469
	.size	calloc_beebs, .-calloc_beebs
	.align	2
	.globl	realloc_beebs
	.type	realloc_beebs, @function
realloc_beebs:
	beq	a0,zero,.L494
	beq	a1,zero,.L494
	lui	a6,%hi(heap_ptr)
	lw	a2,%lo(heap_ptr)(a6)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a2,a1
	andi	a7,a4,3
	add	a5,a1,a5
	bne	a7,zero,.L519
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a7,a4,.L494
.L520:
	sw	a4,%lo(heap_ptr)(a6)
	beq	a2,zero,.L494
	addi	a5,a1,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L504
	or	a3,a0,a2
	andi	a3,a3,3
	addi	a4, a2, 0
	addi	a5, a0, 0
	bne	a3,zero,.L504
	addi	a3,a2,-1
	sub	a3,a3,a0
	sltiu	a3,a3,3
	bne	a3,zero,.L504
	andi	a7,a1,-4
	add	a6,a0,a7
.L497:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L497
	beq	a1,a7,.L493
	lbu	a3,0(a6)
	add	a4,a2,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a1, .L493
	add	a4,a0,a5
	lbu	a4,0(a4)
	add	a5,a2,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a1, .L493
	add	a0,a0,a7
	lbu	a5,0(a0)
	add	a7,a2,a7
	sb	a5,0(a7)
.L493:
	addi	a0, a2, 0
	jalr	zero, ra, 0
.L519:
	addi	t1, zero, 4
	sub	a7,t1,a7
	add	a5,a5,a7
	add	a4,a4,a7
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a7,a4,.L520
.L494:
	addi	a2, zero, 0
	addi	a0, a2, 0
	jalr	zero, ra, 0
.L504:
	addi	a5, zero, 0
.L501:
	add	a4,a0,a5
	lbu	a3,0(a4)
	add	a4,a2,a5
	addi	a5,a5,1
	sb	a3,0(a4)
	bltu	a5, a1, .L501
	addi	a0, a2, 0
	jalr	zero, ra, 0
	.size	realloc_beebs, .-realloc_beebs
	.align	2
	.globl	free_beebs
	.type	free_beebs, @function
free_beebs:
	jalr	zero, ra, 0
	.size	free_beebs, .-free_beebs
	.align	2
	.globl	initialise_board
	.type	initialise_board, @function
initialise_board:
 #APP
# 15 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	addi	a0, zero, 0
# 0 "" 2
 #NO_APP
	jalr	zero, ra, 0
	.size	initialise_board, .-initialise_board
	.align	2
	.globl	start_trigger
	.type	start_trigger, @function
start_trigger:
 #APP
# 21 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	addi	a0, zero, 0
# 0 "" 2
 #NO_APP
	jalr	zero, ra, 0
	.size	start_trigger, .-start_trigger
	.align	2
	.globl	stop_trigger
	.type	stop_trigger, @function
stop_trigger:
 #APP
# 27 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	addi	a0, zero, 0
# 0 "" 2
 #NO_APP
	jalr	zero, ra, 0
	.size	stop_trigger, .-stop_trigger
	.align	2
	.globl	slre_match
	.type	slre_match, @function
slre_match:
	addi	sp,sp,-2032
	sw	ra,2028(sp)
	addi	sp,sp,-416
	addi	a5,sp,2047
	addi	a5,a5,373
	sw	a3,0(a5)
	addi	a5,sp,2047
	addi	a5,a5,377
	sw	a4,0(a5)
	addi	a5,sp,2047
	addi	a5,a5,369
	sw	zero,0(a5)
	lbu	a6,0(a0)
	addi	a5,sp,2047
	addi	a5,a5,381
	sw	zero,0(a5)
	sw	zero,1612(sp)
	addi	a5, zero, 40
	addi	a3, a2, 0
	bne	a6,a5,.L526
	lbu	a4,1(a0)
	addi	a5, zero, 63
	bne	a4,a5,.L527
	lbu	a4,2(a0)
	addi	a5, zero, 105
	bne	a4,a5,.L527
	lbu	a4,3(a0)
	addi	a5, zero, 41
	bne	a4,a5,.L527
	addi	a4,sp,2047
	addi	a5, zero, 1
	addi	a4,a4,381
	addi	a0,a0,4
	sw	a5,0(a4)
.L526:
	lbu	a5,0(a0)
	beq	a5,zero,.L528
.L527:
	addi	a5, zero, 0
.L529:
	addi	a5,a5,1
	add	a4,a0,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L529
.L528:
	addi	a2, a1, 0
	addi	a4,sp,12
	addi	a1, a5, 0
.Lpcrel_21:
	auipc	ra, %pcrel_hi(foo)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_21)
	addi	sp,sp,416
	lw	ra,2028(sp)
	addi	sp,sp,2032
	jalr	zero, ra, 0
	.size	slre_match, .-slre_match
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	jalr	zero, ra, 0
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	warm_caches
	.type	warm_caches, @function
warm_caches:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_22:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_22)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_23:
	auipc	ra, %pcrel_hi(benchmark_body.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_23)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	benchmark, .-benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
 #APP
# 15 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	addi	a0, zero, 0
# 0 "" 2
 #NO_APP
	addi	a0, zero, 1
.Lpcrel_24:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_24)
.Lpcrel_25:
	auipc	ra, %pcrel_hi(start_trigger)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_25)
.Lpcrel_26:
	auipc	ra, %pcrel_hi(benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_26)
	sw	a0,12(sp)
.Lpcrel_27:
	auipc	ra, %pcrel_hi(stop_trigger)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_27)
	lw	a0,12(sp)
	lw	ra,28(sp)
	addi	a0,a0,-102
	sltu	a0, zero, a0
	addi	sp,sp,32
	jalr	zero, ra, 0
	.size	main, .-main
	.text
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	addi	a0,a0,-102
	sltiu	a0, a0, 1
	jalr	zero, ra, 0
	.size	verify_benchmark, .-verify_benchmark
	.globl	regexes
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"(ab)+"
	.align	2
.LC1:
	.string	"(b.+)+"
	.align	2
.LC2:
	.string	"a[ab]*"
	.align	2
.LC3:
	.string	"([ab^c][ab^c])+"
	.globl	text
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	text, @object
	.size	text, 46
text:
	.string	"abbbababaabccababcacbcbcbabbabcbabcabcbbcbbac"
	.zero	2
	.type	regexes, @object
	.size	regexes, 16
regexes:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.section	.sbss,"aw",@nobits
	.align	2
	.type	heap_requested, @object
	.size	heap_requested, 4
heap_requested:
	.zero	4
	.type	heap_end, @object
	.size	heap_end, 4
heap_end:
	.zero	4
	.type	heap_ptr, @object
	.size	heap_ptr, 4
heap_ptr:
	.zero	4
	.type	seed, @object
	.size	seed, 4
seed:
	.zero	4
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
