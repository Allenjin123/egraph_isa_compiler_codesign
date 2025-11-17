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
	addi	a4,zero,92
	beq	a5,a4,.L2
	bltu	a4,a5,.L3
	addi	a4,zero,36
	addi	a0,zero,-1
	beq	a5,a4,.L1
	addi	a4,zero,46
	addi	a0,zero,1
	bne	a5,a4,.L5
.L1:
	jalr	zero,ra,0
.L3:
	addi	a4,zero,124
	addi	a0,zero,-4
	beq	a5,a4,.L1
.L5:
	addi	a2,a2,2047
	lw	a4,369(a2)
	lbu	a3,0(a1)
	addi	t0,x0,1
	and	a4,t0,a4
	beq	a4,zero,.L18
	lui	a4,%hi(_ctype_+1)
	addi	a4,a4,%lo(_ctype_+1)
	add	a2,a4,a5
	lbu	a2,0(a2)
	addi	a1,zero,1
	addi	t0,x0,3
	and	a2,t0,a2
	bne	a2,a1,.L19
	addi	a5,a5,32
.L19:
	add	a4,a4,a3
	lbu	a4,0(a4)
	addi	a2,zero,1
	addi	t0,x0,3
	and	a4,t0,a4
	beq	a4,a2,.L38
.L18:
	bne	a5,a3,.L30
.L34:
	addi	a0,zero,1
	jalr	zero,ra,0
.L2:
	lbu	a5,1(a0)
	addi	a4,zero,115
	lbu	a3,0(a1)
	beq	a5,a4,.L6
	bltu	a4,a5,.L7
	addi	a4,zero,83
	beq	a5,a4,.L8
	addi	a4,zero,100
	bne	a5,a4,.L18
	lui	a5,%hi(_ctype_+1)
	addi	a5,a5,%lo(_ctype_+1)
	add	a5,a3,a5
	lbu	a0,0(a5)
	addi	t0,x0,4
	and	a0,a0,t0
	addi	t0,x0,1
	bltu	a0,t0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	sub	a0,zero,a0
	addi	t0,x0,1
	and	t0,a0,t0
	addi	t1,x0,1
	sub	t0,t0,t1
	sub	a0,a0,t0
	jalr	zero,ra,0
.L7:
	addi	a4,zero,120
	bne	a5,a4,.L18
	lbu	a2,2(a0)
	lui	a4,%hi(_ctype_+1)
	addi	a4,a4,%lo(_ctype_+1)
	add	a5,a4,a2
	lbu	a5,0(a5)
	addi	a6,zero,1
	addi	a1,a2,0
	addi	a7,x0,3
	and	a7,a5,a7
	bne	a7,a6,.L12
	lui	a5,%hi(_ctype_+33)
	addi	a5,a5,%lo(_ctype_+33)
	add	a2,a2,a5
	lbu	a5,0(a2)
	addi	a1,a1,32
.L12:
	addi	a2,x0,4
	and	a2,a2,a5
	addi	a5,a1,-87
	beq	a2,zero,.L14
	addi	a5,a1,-48
.L14:
	lbu	a2,3(a0)
	addi	a0,zero,1
	addi	t0,x0,4
	sll	a5,a5,t0
	add	a4,a4,a2
	lbu	a4,0(a4)
	addi	a1,a2,0
	addi	a6,x0,3
	and	a6,a4,a6
	bne	a6,a0,.L15
	lui	a4,%hi(_ctype_+33)
	addi	a4,a4,%lo(_ctype_+33)
	add	a2,a2,a4
	lbu	a4,0(a2)
	addi	a1,a1,32
.L15:
	addi	t0,x0,4
	and	a4,a4,t0
	addi	a2,a1,-87
	beq	a4,zero,.L17
	addi	a2,a1,-48
.L17:
	and	t0,a5,a2
	sub	t0,t0,a2
	sub	a5,a5,t0
	beq	a3,a5,.L34
.L30:
	addi	a0,zero,-1
	jalr	zero,ra,0
.L6:
	lui	a5,%hi(_ctype_+1)
	addi	a5,a5,%lo(_ctype_+1)
	sub	t0,x0,a3
	sub	a5,a5,t0
	lbu	a0,0(a5)
	addi	t0,x0,8
	and	a0,a0,t0
	addi	t0,x0,1
	bltu	a0,t0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	sub	a0,zero,a0
	addi	t0,x0,1
	and	t0,a0,t0
	addi	t1,x0,1
	sub	t0,t0,t1
	sub	a0,a0,t0
	jalr	zero,ra,0
.L38:
	addi	a3,a3,32
	jal	x0,.L18
.L8:
	lui	a5,%hi(_ctype_+1)
	addi	a5,a5,%lo(_ctype_+1)
	add	a5,a3,a5
	lbu	a0,0(a5)
	addi	a5,x0,28
	sll	a5,a0,a5
	addi	a0,x0,31
	sra	a0,a5,a0
	addi	t0,x0,1
	and	t0,a0,t0
	addi	t1,x0,1
	sub	t0,t0,t1
	sub	a0,a0,t0
	jalr	zero,ra,0
	.size	match_op, .-match_op
	.align	2
	.type	bar, @function
bar:
	addi	a6,x0,-1
	addi	t0,x0,-1
	and	t0,t0,a3
	sub	t0,t0,a3
	sub	a6,a6,t0
	addi	t0,x0,-1
	and	t0,t0,a3
	sub	a6,a6,t0
	addi	t0,x0,31
	srl	a6,a6,t0
	slt	a7,zero,a1
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
	addi	s11,zero,0
	addi	s5,zero,0
	addi	s2,a0,0
	addi	s9,a1,0
	addi	s1,a3,0
	sw	a2,12(sp)
	addi	s8,a4,0
.L40:
	add	a0,s2,s5
	lbu	a1,0(a0)
	addi	a5,zero,40
	beq	a1,a5,.L208
	addi	a5,zero,91
	beq	a1,a5,.L209
	addi	a5,zero,92
	beq	a1,a5,.L52
	addi	a5,a1,-42
	addi	t0,x0,2
	bltu	a5,t0,.+12
	addi	a5,x0,0
	jal	x0,.+8
	addi	a5,x0,1
	bne	a5,zero,.L130
	addi	a5,a1,-63
	beq	a5,zero,.L130
	addi	a4,s5,1
	bge	a4,s9,.L210
	addi	s6,zero,1
	addi	s3,s6,0
.L53:
	add	s6,s5,s6
	add	s6,s2,s6
	lbu	a7,0(s6)
	addi	a5,a7,-42
	addi	t0,x0,2
	bltu	a5,t0,.+12
	addi	a5,x0,0
	jal	x0,.+8
	addi	a5,x0,1
	addi	a7,a7,-63
	addi	t0,x0,1
	bltu	a7,t0,.+12
	addi	a7,x0,0
	jal	x0,.+8
	addi	a7,x0,1
	bne	a5,zero,.L117
	bne	a7,zero,.L117
	addi	a5,zero,94
	bne	a1,a5,.L113
	beq	s11,zero,.L206
.L83:
	addi	s10,zero,-1
	jal	x0,.L203
.L208:
	lw	a5,16(sp)
	addi	s6,a5,1
	addi	a5,x0,4
	sll	a5,s6,a5
	add	a5,s8,a5
	lw	s3,4(a5)
	addi	s3,s3,2
	bge	zero,s3,.L129
	add	s0,s3,s5
	addi	a4,s0,0
	bge	s0,s9,.+8
	jal	x0,.L46
.L57:
	lw	a5,1600(s8)
	bge	s6,a5,.L138
	lw	a5,12(sp)
	sub	s4,s9,a4
	sub	s3,s1,s11
	add	s5,a5,s11
	bge	zero,s4,.+8
	jal	x0,.L139
	addi	a1,s3,0
	addi	a3,s6,0
	addi	a2,s8,0
	addi	a0,s5,0
	sw	a4,24(sp)
.Lpcrel_1:
	auipc	ra,%pcrel_hi(doh)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
	lw	a4,24(sp)
	addi	s10,a0,0
.L107:
	bge	s10,zero,.+8
	jal	x0,.L203
	add	a7,s10,s11
.L110:
	addi	a5,s8,2047
	lw	a5,361(a5)
	beq	a5,zero,.L112
	lw	a3,16(sp)
	addi	t0,x0,3
	sll	a3,a3,t0
	add	a5,a5,a3
	sw	s5,0(a5)
	sw	s10,4(a5)
.L112:
	slt	a2,s1,a7
	addi	s11,a7,0
	addi	s5,a4,0
	sw	s6,16(sp)
	addi	a5,x0,1
	addi	t0,x0,1
	and	t0,t0,a2
	sub	t0,t0,a2
	sub	a5,a5,t0
	addi	t0,x0,1
	and	t0,t0,a2
	sub	a5,a5,t0
.L62:
	bge	s5,s9,.L144
	bne	a5,zero,.L40
.L144:
	addi	s10,s11,0
	jal	x0,.L203
.L49:
	bge	a4,a3,.+8
	jal	x0,.L129
	addi	s3,a3,2
	bge	zero,s3,.L129
	add	a4,s5,s3
	addi	s0,a4,0
	bge	a4,s9,.L186
.L46:
	add	s6,s2,s0
	lbu	a7,0(s6)
	addi	a5,a7,-42
	addi	t0,x0,2
	bltu	a5,t0,.+12
	addi	a5,x0,0
	jal	x0,.+8
	addi	a5,x0,1
	addi	a7,a7,-63
	addi	t0,x0,1
	bltu	a7,t0,.+12
	addi	a7,x0,0
	jal	x0,.+8
	addi	a7,x0,1
	bne	a5,zero,.L117
	bne	a7,zero,.L117
	addi	a5,zero,91
	beq	a1,a5,.L186
	lw	a5,16(sp)
	addi	s6,a5,1
	jal	x0,.L57
.L117:
	lw	a5,12(sp)
	sub	a3,s1,s11
	add	a2,a5,s11
	bne	a7,zero,.L211
	addi	s0,s8,0
	sw	a2,24(sp)
	sw	a3,28(sp)
	addi	s8,a4,1
	addi	s4,a5,0
	addi	s7,a0,0
	bge	s8,s9,.L63
	add	a5,s2,s8
	lbu	a3,0(a5)
	addi	a5,zero,63
	beq	a3,a5,.L212
.L64:
	sub	a5,s9,s8
	sw	a5,12(sp)
	add	a5,s2,s8
	sw	s6,32(sp)
	sw	s8,36(sp)
	sw	s2,44(sp)
	addi	s10,s11,0
	sw	a5,20(sp)
	addi	s5,a7,0
	add	s6,s4,s11
	sub	s8,s1,s11
	sw	s9,40(sp)
	addi	s2,s11,0
.L74:
	lw	a5,16(sp)
	addi	a4,s0,0
	addi	a1,s3,0
	addi	a3,s8,0
	addi	a2,s6,0
	addi	a0,s7,0
.Lpcrel_2:
	auipc	ra,%pcrel_hi(bar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_2)
	addi	s9,a0,0
	lw	a5,16(sp)
	lw	a1,12(sp)
	lw	a0,20(sp)
	addi	a4,s0,0
	bge	zero,s9,.L213
	add	s2,s2,s9
	sub	s8,s1,s2
	add	s6,s4,s2
	addi	a3,s8,0
	addi	a2,s6,0
.Lpcrel_3:
	auipc	ra,%pcrel_hi(bar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_3)
	bge	a0,zero,.+8
	jal	x0,.L68
	add	s10,s2,a0
.L68:
	bge	s11,s10,.L74
	beq	s5,zero,.L74
	addi	s5,s9,0
	lw	s6,32(sp)
	lw	s8,36(sp)
	lw	s9,40(sp)
	lw	s2,44(sp)
.L67:
	lbu	a5,0(s6)
.L79:
	bge	s5,zero,.+8
	jal	x0,.L214
.L80:
	addi	a4,zero,43
	beq	a5,a4,.L69
	sub	a6,s10,s11
	addi	t0,x0,1
	bltu	a6,t0,.+12
	addi	a6,x0,0
	jal	x0,.+8
	addi	a6,x0,1
	slt	t6,s8,s9
	and	a6,a6,t6
	beq	a6,zero,.L203
	bge	a0,zero,.+8
	jal	x0,.L83
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
	addi	a0,s10,0
	lw	s10,64(sp)
	addi	sp,sp,112
	jalr	zero,ra,0
.L212:
	addi	s8,a4,2
	lw	a7,20(sp)
	bge	s8,s9,.+8
	jal	x0,.L64
.L63:
	addi	s10,s11,0
	addi	s5,a7,0
.L77:
	lw	a5,16(sp)
	addi	a4,s0,0
	sub	a3,s1,s10
	add	a2,s4,s10
	addi	a1,s3,0
	addi	a0,s7,0
.Lpcrel_4:
	auipc	ra,%pcrel_hi(bar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_4)
	bge	zero,a0,.L75
	add	s10,s10,a0
	bge	s11,s10,.L77
	beq	s5,zero,.L77
	addi	s5,a0,0
	lbu	a5,0(s6)
	addi	a0,zero,-1
	jal	x0,.L79
.L75:
	lbu	a5,0(s6)
	addi	s5,a0,0
	addi	a4,a5,-43
	bne	a4,zero,.L143
	bne	a0,zero,.L69
.L143:
	addi	a0,zero,-1
	bge	s5,zero,.L80
	jal	x0,.L214
.L209:
	sub	a4,s9,s5
	addi	a4,a4,-1
	addi	a3,zero,0
	addi	a7,zero,93
	addi	t1,zero,92
	addi	t3,zero,120
	bne	a4,zero,.L45
	jal	x0,.L215
.L48:
	add	a3,a3,a6
	bge	a3,a4,.L49
.L45:
	addi	a5,a3,1
	add	a5,a0,a5
	lbu	a2,0(a5)
	addi	a6,zero,1
	beq	a2,a7,.L49
	bne	a2,t1,.L48
	lbu	a5,1(a5)
	addi	a6,zero,4
	beq	a5,t3,.L48
	addi	a6,zero,2
	jal	x0,.L48
.L186:
	addi	a5,s5,2
.L47:
	addi	s5,s5,1
	add	s5,s2,s5
	lbu	a2,0(s5)
	addi	a3,zero,94
	sub	s10,s9,a5
	beq	a2,a3,.L216
	bge	s10,zero,.+8
	jal	x0,.L83
	addi	s4,a2,0
.L87:
	lw	a5,12(sp)
	addi	s0,zero,0
	sw	s1,32(sp)
	sw	s2,36(sp)
	addi	s6,zero,93
	sw	a2,24(sp)
	sw	a4,28(sp)
	addi	s2,s0,0
	addi	a0,zero,-1
	addi	s7,zero,1
	addi	s3,zero,45
	addi	s1,s5,0
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
	addi	a2,s8,0
	addi	a1,s0,0
	addi	a0,s5,0
.Lpcrel_5:
	auipc	ra,%pcrel_hi(match_op)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_5)
	addi	a5,zero,92
	addi	a3,zero,1
	bne	s4,a5,.L100
	lbu	a5,1(s5)
	addi	a4,zero,120
	addi	a3,zero,4
	beq	a5,a4,.L100
	addi	a3,zero,2
.L100:
	add	s2,s2,a3
.L99:
	bge	s10,s2,.+8
	jal	x0,.L204
	add	s5,s1,s2
	lbu	s4,0(s5)
	bne	s4,s6,.L105
.L204:
	lw	a2,24(sp)
	lw	a4,28(sp)
	lw	s1,32(sp)
	lw	s2,36(sp)
	addi	a0,a0,-1
	bltu	zero,a0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
.L104:
	addi	a5,a2,-94
	bltu	zero,a5,.+12
	addi	a5,x0,0
	jal	x0,.+8
	addi	a5,x0,1
	beq	a5,a0,.L83
.L86:
	addi	s11,s11,1
	slt	a5,s1,s11
	addi	s5,a4,0
	addi	t0,x0,1
	addi	t1,x0,1
	and	t1,t1,a5
	sub	t1,t1,a5
	sub	t0,t0,t1
	addi	t1,x0,1
	and	t1,t1,a5
	sub	a5,t0,t1
	jal	x0,.L62
.L52:
	lbu	a4,1(a0)
	addi	a5,zero,120
	beq	a4,a5,.L218
	addi	a4,s5,2
	addi	s3,zero,2
	bge	a4,s9,.+8
	jal	x0,.L219
.L115:
	bge	s11,s1,.L83
	lw	a5,12(sp)
	addi	a2,s8,0
	add	a1,a5,s11
.Lpcrel_6:
	auipc	ra,%pcrel_hi(match_op)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_6)
	addi	a5,zero,1
	addi	s10,a0,0
	bne	a0,a5,.L203
	add	s11,s11,a5
	slt	a5,s1,s11
	add	s5,s5,s3
	and	t0,a0,a5
	sub	t0,t0,a5
	sub	t0,a0,t0
	and	t1,a0,a5
	sub	a5,t0,t1
	jal	x0,.L62
.L210:
	addi	a5,zero,94
	beq	a1,a5,.L220
	addi	s3,zero,1
.L113:
	addi	a5,zero,36
	bne	a1,a5,.L115
	bne	s1,s11,.L83
.L206:
	lw	a5,20(sp)
	addi	s5,a4,0
	jal	x0,.L62
.L214:
	addi	a4,zero,42
	bne	a5,a4,.L80
	lw	a5,16(sp)
	lw	a3,28(sp)
	lw	a2,24(sp)
	addi	a4,s0,0
	add	a0,s2,s8
	sub	a1,s9,s8
.Lpcrel_7:
	auipc	ra,%pcrel_hi(bar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_7)
	bge	zero,a0,.L221
	add	s10,a0,s11
	jal	x0,.L203
.L139:
	add	s0,s2,s0
	sw	s2,28(sp)
	sw	a4,24(sp)
	addi	s2,zero,0
.L106:
	addi	a3,s6,0
	addi	a2,s8,0
	sub	a1,s3,s2
	addi	a0,s5,0
.Lpcrel_8:
	auipc	ra,%pcrel_hi(doh)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_8)
	addi	s10,a0,0
	bge	a0,zero,.L222
.L188:
	addi	s2,s2,1
	bge	s3,s2,.+8
	jal	x0,.L203
	addi	a3,s6,0
	addi	a2,s8,0
	sub	a1,s3,s2
	addi	a0,s5,0
.Lpcrel_9:
	auipc	ra,%pcrel_hi(doh)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_9)
	addi	s10,a0,0
	bge	a0,zero,.+8
	jal	x0,.L188
.L222:
	lw	a5,12(sp)
	add	s7,a0,s11
	sub	a3,s1,s7
	add	a2,a5,s7
	addi	a4,s8,0
	addi	a5,s6,0
	addi	a1,s4,0
	addi	a0,s0,0
.Lpcrel_10:
	auipc	ra,%pcrel_hi(bar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_10)
	addi	s2,s2,1
	bge	a0,zero,.L223
	bge	s3,s2,.L106
	lw	a4,24(sp)
	lw	s2,28(sp)
	jal	x0,.L107
.L69:
	bne	s11,s10,.L203
	addi	s10,zero,-1
	jal	x0,.L203
.L88:
	addi	a0,s5,0
	addi	a2,s8,0
	addi	a1,s0,0
.Lpcrel_11:
	auipc	ra,%pcrel_hi(match_op)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_11)
	addi	a3,zero,1
	add	s2,s2,a3
	jal	x0,.L99
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
	addi	a4,zero,1
	addi	t0,x0,3
	and	a5,t0,a5
	bne	a5,a4,.L92
	addi	a2,a2,32
.L92:
	add	a5,a1,s4
	lbu	a5,0(a5)
	addi	a4,zero,1
	addi	t0,x0,3
	and	a5,a5,t0
	beq	a5,a4,.L225
.L93:
	bge	a2,s4,.L94
	addi	s2,s2,3
	bge	s10,s2,.+8
	jal	x0,.L204
	add	s5,s1,s2
	lbu	s4,0(s5)
	addi	a5,zero,93
	bne	s4,a5,.L96
	jal	x0,.L204
.L219:
	addi	s6,zero,2
	addi	s3,s6,0
	jal	x0,.L53
.L216:
	addi	s10,s10,-1
	bge	s10,zero,.+8
	jal	x0,.L86
	lbu	s4,1(s5)
	addi	s5,s5,1
	jal	x0,.L87
.L224:
	bltu	a3,a2,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	bltu	a2,s4,.+12
	addi	a2,x0,0
	jal	x0,.+8
	addi	a2,x0,1
	addi	t0,x0,1
	bltu	a0,t0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	addi	t0,x0,1
	bltu	a2,t0,.+12
	addi	a2,x0,0
	jal	x0,.+8
	addi	a2,x0,1
	and	a0,a0,a2
	addi	s2,s2,3
	jal	x0,.L99
.L218:
	addi	a4,s5,4
	addi	s3,zero,4
	bge	a4,s9,.L115
	addi	s6,zero,4
	addi	s3,s6,0
	jal	x0,.L53
.L225:
	addi	s4,s4,32
	jal	x0,.L93
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
	addi	s10,zero,0
	addi	a0,s10,0
	lw	s10,64(sp)
	addi	sp,sp,112
	jalr	zero,ra,0
.L187:
	lw	a2,24(sp)
	lw	a4,28(sp)
	lw	s1,32(sp)
	lw	s2,36(sp)
	addi	a0,zero,0
	jal	x0,.L104
.L211:
	lw	a5,16(sp)
	addi	a4,s8,0
	addi	a1,s3,0
.Lpcrel_12:
	auipc	ra,%pcrel_hi(bar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_12)
	addi	a5,x0,-1
	addi	t0,x0,-1
	and	t0,t0,a0
	sub	t0,t0,a0
	sub	a5,a5,t0
	addi	t0,x0,-1
	and	t0,t0,a0
	sub	a5,a5,t0
	addi	t0,x0,31
	sra	a5,a5,t0
	and	a0,a0,a5
	add	s11,s11,a0
	addi	s5,s5,1
	slt	a5,s1,s11
	add	s5,s5,s3
	addi	t0,x0,1
	addi	t1,x0,1
	and	t1,t1,a5
	sub	t1,t1,a5
	sub	t0,t0,t1
	addi	t1,x0,1
	and	t1,t1,a5
	sub	a5,t0,t1
	jal	x0,.L62
.L94:
	add	a1,a1,a3
	addi	a5,a3,0
	lbu	a3,0(a1)
	addi	a1,zero,1
	addi	t0,x0,3
	and	a3,a3,t0
	bne	a3,a1,.L98
	addi	a5,a5,32
.L98:
	slt	a2,a5,a2
	addi	a0,x0,1
	bltu	a2,a0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	addi	s2,s2,3
	jal	x0,.L99
.L129:
	addi	s10,zero,-5
	jal	x0,.L203
.L223:
	lw	a4,24(sp)
	lw	s2,28(sp)
	addi	a7,s7,0
	jal	x0,.L110
.L221:
	lbu	a5,0(s6)
	jal	x0,.L80
.L213:
	addi	a2,s6,0
	lw	s6,32(sp)
	addi	s5,s9,0
	addi	a6,s2,0
	lbu	a5,0(s6)
	addi	a3,s8,0
	lw	s9,40(sp)
	addi	a5,a5,-43
	lw	s8,36(sp)
	lw	s2,44(sp)
	bne	a5,zero,.L71
	bne	s5,zero,.L69
.L71:
	lw	a5,16(sp)
	addi	a4,s0,0
	sub	a1,s9,s8
	add	a0,s2,s8
	sw	a6,12(sp)
.Lpcrel_13:
	auipc	ra,%pcrel_hi(bar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_13)
	lw	a6,12(sp)
	bge	a0,zero,.+8
	jal	x0,.L67
	lbu	a5,0(s6)
	add	s10,a0,a6
	jal	x0,.L79
.L215:
	addi	a4,s5,2
	addi	a5,a4,0
	bge	a4,s9,.L47
	addi	s3,zero,2
	addi	s0,a4,0
	jal	x0,.L46
.L130:
	addi	s10,zero,-2
	jal	x0,.L203
.L138:
	addi	s10,zero,-4
	jal	x0,.L203
	.size	bar, .-bar
	.align	2
	.type	doh, @function
doh:
	addi	sp,sp,-32
	sw	s5,4(sp)
	addi	s5,x0,4
	sll	s5,a3,s5
	add	s5,a2,s5
	sw	s0,24(sp)
	lw	s0,12(s5)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	ra,28(sp)
	addi	s2,a0,0
	addi	s1,a3,0
	lw	a0,0(s5)
	addi	s4,a2,0
	addi	s3,a1,0
	beq	s0,zero,.L234
	lw	a3,8(s5)
	addi	s0,zero,0
.L227:
	add	a3,s0,a3
	addi	t0,x0,3
	sll	a3,a3,t0
	add	a3,s4,a3
	lw	a1,1608(a3)
	sub	a1,a1,a0
.L229:
	addi	a5,s1,0
	addi	a4,s4,0
	addi	a3,s3,0
	addi	a2,s2,0
.Lpcrel_14:
	auipc	ra,%pcrel_hi(bar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_14)
	bge	zero,a0,.+8
	jal	x0,.L226
.L235:
	lw	a4,12(s5)
	bge	s0,a4,.L226
	lw	a3,8(s5)
	addi	s0,s0,1
	add	a5,s0,a3
	addi	t0,x0,3
	sll	a5,a5,t0
	add	a5,s4,a5
	lw	a0,1600(a5)
	addi	a0,a0,1
	bne	a4,s0,.L227
	lw	a5,4(s5)
	lw	a1,0(s5)
	addi	a4,s4,0
	addi	a3,s3,0
	add	a1,a1,a5
	sub	a1,a1,a0
	addi	a5,s1,0
	addi	a2,s2,0
.Lpcrel_15:
	auipc	ra,%pcrel_hi(bar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_15)
	bge	zero,a0,.L235
.L226:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	lw	s5,4(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L234:
	lw	a1,4(s5)
	jal	x0,.L229
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
	addi	t3,zero,1
	sw	a0,0(a4)
	sw	a1,4(a4)
	sw	t3,1600(a4)
	bge	zero,a1,.L322
	lui	s0,1
	lui	s5,%hi(_ctype_+1)
	addi	s2,zero,-1
	sw	s9,4(sp)
	sw	s10,0(sp)
	addi	s1,zero,0
	addi	t4,zero,0
	add	s0,a4,s0
	addi	s5,s5,%lo(_ctype_+1)
	addi	t2,zero,91
	addi	t6,zero,92
	addi	s4,zero,124
	addi	s6,zero,40
	addi	s9,zero,41
	addi	s3,zero,99
	addi	t0,zero,120
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
	bge	s3,a5,.+8
	jal	x0,.L306
	addi	t4,t4,1
	addi	a6,x0,4
	sll	a6,a5,a6
	add	a6,a4,a6
	add	a7,a0,t4
	sw	a7,0(a6)
	sw	s2,4(a6)
	lw	a6,-1684(s0)
	addi	a7,a5,1
	sw	a7,1600(a4)
	bge	a6,a5,.L311
	bge	zero,a6,.+8
	jal	x0,.L307
.L311:
	addi	s1,s1,1
.L248:
	bge	t4,a1,.+8
	jal	x0,.L237
.L332:
	bne	s1,zero,.L266
	addi	a5,a4,2047
	lw	a6,357(a5)
	lw	s9,4(sp)
	lw	s10,0(sp)
	bge	zero,a6,.L240
.L239:
	lui	t4,1
	add	t4,a4,t4
	addi	a7,a4,0
	addi	t3,zero,0
.L272:
	addi	t3,t3,1
	bge	t3,a6,.L240
	lw	t1,1604(a7)
	addi	a5,a7,0
	addi	a1,t3,0
.L271:
	lw	a0,1612(a5)
	bge	a0,t1,.L268
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
	bge	a1,a6,.L269
	lw	t1,1604(a7)
	lw	a0,1612(a5)
	bge	a0,t1,.+8
	jal	x0,.L331
.L268:
	addi	a1,a1,1
	bge	a1,a6,.L269
	addi	a5,a5,8
	jal	x0,.L271
.L330:
	lw	a5,-1692(s0)
	bge	s3,a5,.+8
	jal	x0,.L300
	lw	a6,1600(a4)
	addi	a6,a6,-1
	addi	a7,x0,4
	sll	a7,a6,a7
	add	a7,a4,a7
	lw	a7,4(a7)
	beq	a7,s2,.L254
	addi	a6,s1,0
.L254:
	addi	a7,x0,3
	sll	a7,a5,a7
	add	a7,a4,a7
	sw	a6,1604(a7)
	sw	t3,1608(a7)
	addi	a5,a5,1
	addi	t4,t4,1
	sw	a5,-1692(s0)
	bge	t4,a1,.+8
	jal	x0,.L237
	jal	x0,.L332
.L328:
	sub	t5,a1,t4
	addi	t5,t5,-1
	addi	a5,zero,0
	addi	s10,zero,93
	bne	t5,zero,.L242
	jal	x0,.L333
.L244:
	add	a5,a5,t1
	bge	a5,t5,.L245
.L242:
	addi	a6,a5,1
	add	a6,t3,a6
	lbu	a7,0(a6)
	addi	t1,zero,1
	beq	a7,s10,.L245
	bne	a7,t6,.L244
	lbu	a6,1(a6)
	addi	t1,zero,4
	beq	a6,t0,.L244
	addi	t1,zero,2
	add	a5,a5,t1
	bge	a5,t5,.+8
	jal	x0,.L242
.L245:
	bge	t5,a5,.+8
	jal	x0,.L248
	addi	a5,a5,2
	add	t4,t4,a5
.L341:
	bge	t4,a1,.+8
	jal	x0,.L237
	jal	x0,.L332
.L329:
	lbu	a5,1(t3)
	addi	a7,zero,2
	beq	a5,t0,.L334
.L251:
	bge	t4,s7,.L305
	lbu	a5,1(t3)
	bne	a5,t0,.L335
	bge	t4,s8,.L305
	lbu	a5,2(t3)
	add	a5,a5,s5
	lbu	a5,0(a5)
	addi	t1,x0,68
	and	a5,a5,t1
	beq	a5,zero,.L305
	lbu	a5,3(t3)
	sub	t1,x0,a5
	sub	a5,s5,t1
	lbu	a5,0(a5)
	addi	t1,x0,68
	and	a5,a5,t1
	beq	a5,zero,.L305
.L327:
	add	t4,t4,a7
	bge	t4,a1,.+8
	jal	x0,.L237
	jal	x0,.L332
.L334:
	addi	a7,zero,4
	jal	x0,.L251
.L259:
	bne	a5,s9,.L265
	lw	a5,1600(a4)
	addi	a5,a5,-1
	addi	t1,x0,4
	sll	a5,a5,t1
	add	a6,a4,a5
	lw	a6,4(a6)
	beq	a6,s2,.L262
	addi	a5,x0,4
	sll	a5,s1,a5
.L262:
	add	a5,a4,a5
	lw	a6,0(a5)
	addi	s1,s1,-1
	sub	a6,t3,a6
	sw	a6,4(a5)
	bge	s1,zero,.+8
	jal	x0,.L266
	bge	zero,t4,.L265
	lbu	a6,-1(t3)
	addi	a5,zero,40
	beq	a6,a5,.L336
.L265:
	addi	t4,t4,1
	bge	t4,a1,.+8
	jal	x0,.L237
	jal	x0,.L332
.L335:
	addi	a6,a5,-40
	addi	t1,x0,255
	and	a6,a6,t1
	addi	t1,zero,23
	bltu	t1,a6,.+8
	jal	x0,.L256
	addi	a6,x0,191
	and	a6,a6,a5
	addi	a6,a6,-36
	addi	t1,x0,1
	bltu	a6,t1,.+12
	addi	a6,x0,0
	jal	x0,.+8
	addi	a6,x0,1
.L257:
	addi	t3,a5,-124
	addi	t1,x0,1
	bltu	a5,t1,.+12
	addi	t1,x0,0
	jal	x0,.+8
	addi	t1,x0,1
	addi	t5,x0,1
	bltu	t3,t5,.+12
	addi	t3,x0,0
	jal	x0,.+8
	addi	t3,x0,1
	and	t5,t3,t1
	sub	t5,t5,t1
	sub	t3,t3,t5
	addi	t1,a5,-91
	addi	t5,x0,223
	and	a5,a5,t5
	addi	t5,x0,4
	bltu	t1,t5,.+12
	addi	t1,x0,0
	jal	x0,.+8
	addi	t1,x0,1
	addi	a5,a5,-83
	and	t5,t1,t3
	sub	t5,t5,t3
	sub	t1,t1,t5
	addi	t3,x0,1
	bltu	a5,t3,.+12
	addi	a5,x0,0
	jal	x0,.+8
	addi	a5,x0,1
	and	t3,a5,t1
	sub	t3,t3,t1
	sub	a5,a5,t3
	bne	a5,zero,.L327
	bne	a6,zero,.L327
.L305:
	lw	s9,4(sp)
	lw	s10,0(sp)
	addi	a0,zero,-6
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
	jalr	zero,ra,0
.L256:
	lui	t1,1046528
	addi	t1,t1,-80
	sra	a6,t1,a6
	addi	t1,x0,1
	and	a6,t1,a6
	addi	t1,x0,1
	addi	t3,x0,1
	and	t3,t3,a6
	sub	t3,t3,a6
	sub	t1,t1,t3
	addi	t3,x0,1
	and	t3,t3,a6
	sub	a6,t1,t3
	jal	x0,.L257
.L269:
	addi	a7,a7,8
	bge	t3,a6,.+8
	jal	x0,.L272
.L240:
	lw	t3,1600(a4)
	bge	zero,t3,.L280
.L273:
	addi	a0,zero,0
	sw	zero,12(a4)
	sw	a0,8(a4)
	addi	a7,a4,12
	addi	t1,zero,0
	bge	t1,a6,.L276
.L337:
	addi	a1,x0,3
	sll	a1,a0,a1
	add	a1,a4,a1
	jal	x0,.L277
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
	bge	a0,a6,.+8
	jal	x0,.L337
.L276:
	addi	t1,t1,1
	addi	a5,x0,4
	sll	a5,t1,a5
	add	a5,a4,a5
	beq	t1,t3,.L280
.L281:
	sw	zero,12(a5)
	sw	a0,8(a5)
	addi	t1,t1,1
	addi	a5,a5,16
	bge	t1,t3,.+8
	jal	x0,.L281
.L280:
	bge	a3,zero,.+8
	jal	x0,.L275
	lw	a5,0(a4)
	addi	s4,a3,0
	lw	a3,12(a4)
	lbu	s7,0(a5)
	addi	s5,a2,0
	addi	s0,a4,0
	addi	s3,zero,0
	addi	s6,zero,94
.L291:
	lw	a0,0(s0)
	addi	s8,a3,0
	add	s1,s5,s3
	sub	s2,s4,s3
	beq	a3,zero,.L338
	lw	a4,8(s0)
	addi	s8,zero,0
.L283:
	add	a5,s8,a4
	addi	t0,x0,3
	sll	a5,a5,t0
	add	a5,s0,a5
	lw	a1,1608(a5)
	sub	a1,a1,a0
.L285:
	addi	a5,zero,0
	addi	a4,s0,0
	addi	a3,s2,0
	addi	a2,s1,0
.Lpcrel_16:
	auipc	ra,%pcrel_hi(bar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_16)
	bge	zero,a0,.+8
	jal	x0,.L339
.L286:
	lw	a3,12(s0)
	bge	s8,a3,.L288
	lw	a4,8(s0)
	addi	s8,s8,1
	add	a5,s8,a4
	addi	t0,x0,3
	sll	a5,a5,t0
	add	a5,s0,a5
	lw	a0,1600(a5)
	addi	a0,a0,1
	bne	s8,a3,.L283
	lw	a5,4(s0)
	lw	a1,0(s0)
	addi	a4,s0,0
	addi	a3,s2,0
	add	a1,a1,a5
	sub	a1,a1,a0
	addi	a5,zero,0
	addi	a2,s1,0
.Lpcrel_17:
	auipc	ra,%pcrel_hi(bar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_17)
	bge	zero,a0,.L286
.L339:
	add	a0,a0,s3
	jal	x0,.L236
.L338:
	lw	a1,4(s0)
	jal	x0,.L285
.L288:
	beq	a0,zero,.L340
	beq	s7,s6,.L236
	addi	s3,s3,1
	bge	s4,s3,.L291
	jal	x0,.L236
.L333:
	addi	a5,zero,2
	add	t4,t4,a5
	jal	x0,.L341
.L300:
	lw	s9,4(sp)
	lw	s10,0(sp)
	addi	a0,zero,-8
	jal	x0,.L236
.L307:
	lw	s9,4(sp)
	lw	s10,0(sp)
	addi	a0,zero,-7
	jal	x0,.L236
.L336:
	lw	s9,4(sp)
	lw	s10,0(sp)
.L275:
	addi	a0,zero,-1
	jal	x0,.L236
.L306:
	lw	s9,4(sp)
	lw	s10,0(sp)
	addi	a0,zero,-9
	jal	x0,.L236
.L266:
	lw	s9,4(sp)
	lw	s10,0(sp)
	addi	a0,zero,-3
	jal	x0,.L236
.L322:
	addi	a5,a4,2047
	lw	a6,357(a5)
	bge	zero,a6,.+8
	jal	x0,.L239
	jal	x0,.L273
.L340:
	addi	a0,s3,0
	jal	x0,.L236
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
	addi	a4,a5,381
	addi	a5,a5,373
	sw	zero,0(a4)
	lbu	a6,0(a0)
	addi	a4,sp,2047
	addi	a4,a4,377
	sw	a2,0(a5)
	addi	a5,zero,1
	sw	a5,0(a4)
	sw	zero,1612(sp)
	addi	a4,zero,40
	addi	a3,a1,0
	bne	a6,a4,.L343
	lbu	a2,1(a0)
	addi	a4,zero,63
	bne	a2,a4,.L344
	lbu	a2,2(a0)
	addi	a4,zero,105
	bne	a2,a4,.L344
	lbu	a2,3(a0)
	addi	a4,zero,41
	bne	a2,a4,.L344
	addi	a4,sp,2047
	addi	a4,a4,381
	addi	a0,a0,4
	sw	a5,0(a4)
.L343:
	lbu	a5,0(a0)
	beq	a5,zero,.L347
.L344:
	addi	a5,zero,0
.L346:
	addi	a5,a5,1
	add	a4,a0,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L346
	addi	a1,a5,0
.L345:
	lui	a2,%hi(.LANCHOR0)
	addi	a4,sp,12
	addi	a2,a2,%lo(.LANCHOR0)
.Lpcrel_18:
	auipc	ra,%pcrel_hi(foo)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_18)
	addi	sp,sp,416
	lw	ra,2028(sp)
	addi	sp,sp,2032
	jalr	zero,ra,0
.L347:
	addi	a1,zero,0
	jal	x0,.L345
	.size	slre_match.constprop.0, .-slre_match.constprop.0
	.align	2
	.type	benchmark_body.constprop.0, @function
benchmark_body.constprop.0:
	addi	sp,sp,-48
	sw	s4,24(sp)
	lui	s4,%hi(.LANCHOR0)
	addi	s4,s4,%lo(.LANCHOR0)
	sw	s5,20(sp)
	addi	s5,zero,1
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s6,16(sp)
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	sub	s5,s5,s4
	addi	s2,s4,64
	addi	s3,zero,110
	lui	s6,%hi(.LANCHOR0+48)
.L351:
	lbu	a4,0(s4)
	addi	a5,s4,0
	addi	s1,zero,0
	beq	a4,zero,.L356
.L352:
	addi	a1,a5,0
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
	addi	a1,s1,0
.Lpcrel_19:
	auipc	ra,%pcrel_hi(slre_match.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_19)
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
	jalr	zero,ra,0
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	addi	sp,sp,-64
	sw	ra,60(sp)
	bge	zero,a0,.L363
	sw	s3,44(sp)
	lui	s3,%hi(.LANCHOR0)
	addi	s3,s3,%lo(.LANCHOR0)
	sw	s5,36(sp)
	addi	s5,zero,1
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s4,40(sp)
	sw	s6,32(sp)
	sw	s0,56(sp)
	sw	s7,28(sp)
	addi	s4,a0,0
	sub	s5,s5,s3
	addi	s1,s3,64
	addi	s2,zero,0
	lui	s6,%hi(.LANCHOR0+48)
.L362:
	lbu	a4,0(s3)
	addi	a5,s3,0
	addi	s7,zero,0
	beq	a4,zero,.L367
.L364:
	addi	a1,a5,0
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
	addi	a1,s7,0
.Lpcrel_20:
	auipc	ra,%pcrel_hi(slre_match.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_20)
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
	jalr	zero,ra,0
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.globl	initialise_board
	.type	initialise_board, @function
initialise_board:
	jalr	zero,ra,0
	.size	initialise_board, .-initialise_board
	.align	2
	.globl	start_trigger
	.type	start_trigger, @function
start_trigger:
	jalr	zero,ra,0
	.size	start_trigger, .-start_trigger
	.align	2
	.globl	stop_trigger
	.type	stop_trigger, @function
stop_trigger:
	jalr	zero,ra,0
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
	addi	a5,zero,40
	addi	a3,a2,0
	bne	a6,a5,.L377
	lbu	a4,1(a0)
	addi	a5,zero,63
	bne	a4,a5,.L378
	lbu	a4,2(a0)
	addi	a5,zero,105
	bne	a4,a5,.L378
	lbu	a4,3(a0)
	addi	a5,zero,41
	bne	a4,a5,.L378
	addi	a4,sp,2047
	addi	a5,zero,1
	addi	a4,a4,381
	addi	a0,a0,4
	sw	a5,0(a4)
.L377:
	lbu	a5,0(a0)
	beq	a5,zero,.L379
.L378:
	addi	a5,zero,0
.L380:
	addi	a5,a5,1
	add	a4,a0,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L380
.L379:
	addi	a2,a1,0
	addi	a4,sp,12
	addi	a1,a5,0
.Lpcrel_21:
	auipc	ra,%pcrel_hi(foo)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_21)
	addi	sp,sp,416
	lw	ra,2028(sp)
	addi	sp,sp,2032
	jalr	zero,ra,0
	.size	slre_match, .-slre_match
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	jalr	zero,ra,0
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	warm_caches
	.type	warm_caches, @function
warm_caches:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_22:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_22)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_23:
	auipc	ra,%pcrel_hi(benchmark_body.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_23)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
	.size	benchmark, .-benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	addi	a0,zero,1
	sw	ra,28(sp)
.Lpcrel_24:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_24)
.Lpcrel_25:
	auipc	ra,%pcrel_hi(benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_25)
	sw	a0,12(sp)
	lw	a0,12(sp)
	lw	ra,28(sp)
	addi	a0,a0,-102
	bltu	zero,a0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	addi	sp,sp,32
	jalr	zero,ra,0
	.size	main, .-main
	.text
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	addi	a0,a0,-102
	addi	t0,x0,1
	bltu	a0,t0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
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
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits


    .text
    .align 2
__mul:
	add	a2,a0,x0
	addi	a0,x0,0
.Mul_loop:
	addi	a3,x0,1
	and	a3,a3,a1
	beq	a3,x0,.Mul_skip
	add	a0,a0,a2
.Mul_skip:
	addi	t0,x0,1
	srl	a1,a1,t0
	addi	t0,x0,1
	sll	a2,a2,t0
	beq	a1,x0,.+8
	jal	x0,.Mul_loop
	jalr	x0,ra,0

.text
.align 2

# Signed 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_divsi3
__riscv_div_lib_divsi3:
	bge	a0,zero,.+8
	jal	x0,__riscv_div_lib_L10
	bge	a1,zero,.+8
	jal	x0,__riscv_div_lib_L11
    # Since the quotient is positive, fall into udivsi3

# Unsigned 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_udivsi3
__riscv_div_lib_udivsi3:
	addi	a2,a1,0
	addi	a1,a0,0
	addi	a0,zero,-1
	beq	a2,zero,__riscv_div_lib_L5
	addi	a3,zero,1
	bltu	a2,a1,.+8
	jal	x0,__riscv_div_lib_L2
__riscv_div_lib_L1:
	bge	zero,a2,__riscv_div_lib_L2
	addi	t0,x0,1
	sll	a2,a2,t0
	addi	t0,x0,1
	sll	a3,a3,t0
	bltu	a2,a1,__riscv_div_lib_L1
__riscv_div_lib_L2:
	addi	a0,zero,0
__riscv_div_lib_L3:
	bltu	a1,a2,__riscv_div_lib_L4
	sub	a1,a1,a2
	and	t0,a0,a3
	sub	t0,t0,a3
	sub	a0,a0,t0
__riscv_div_lib_L4:
	addi	t0,x0,1
	srl	a3,a3,t0
	addi	t0,x0,1
	srl	a2,a2,t0
	bne	a3,zero,__riscv_div_lib_L3
__riscv_div_lib_L5:
	jalr	zero,ra,0

# Unsigned 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_umodsi3
__riscv_div_lib_umodsi3:
	addi	t0,ra,0
.Lpcrel_div1:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div1)
	addi	a0,a1,0
	jalr	zero,t0,0

# Handle negative arguments to divsi3
__riscv_div_lib_L10:
	sub	a0,zero,a0
	bge	zero,a1,.+8
	jal	x0,__riscv_div_lib_L12
	sub	a1,zero,a1
	jal	x0,__riscv_div_lib_udivsi3
__riscv_div_lib_L11:                         # Compute udivsi3(a0, -a1), then negate
    sub   a1, zero, a1                        # neg a1, a1 -> sub a1, zero, a1
__riscv_div_lib_L12:
	addi	t0,ra,0
.Lpcrel_div2:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div2)
	sub	a0,zero,a0
	jalr	zero,t0,0

# Signed 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_modsi3
__riscv_div_lib_modsi3:
	addi	t0,ra,0
	bge	a1,zero,.+8
	jal	x0,__riscv_div_lib_L31
	bge	a0,zero,.+8
	jal	x0,__riscv_div_lib_L32
__riscv_div_lib_L30:
.Lpcrel_div3:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div3)
	addi	a0,a1,0
	jalr	zero,t0,0
__riscv_div_lib_L31:
	sub	a1,zero,a1
	bge	a0,zero,__riscv_div_lib_L30
__riscv_div_lib_L32:
	sub	a0,zero,a0
.Lpcrel_div4:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div4)
	sub	a0,zero,a1
	jalr	zero,t0,0

# end of subrountine