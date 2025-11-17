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
	li	a4,92
	beq	a5,a4,.L2
	bgtu	a5,a4,.L3
	li	a4,36
	li	a0,-1
	beq	a5,a4,.L1
	li	a4,46
	li	a0,1
	bne	a5,a4,.L5
.L1:
	ret
.L3:
	li	a4,124
	li	a0,-4
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
	li	a1,1
	andi	a2,a2,3
	bne	a2,a1,.L19
	addi	a5,a5,32
.L19:
	add	a4,a4,a3
	lbu	a4,0(a4)
	li	a2,1
	andi	a4,a4,3
	beq	a4,a2,.L38
.L18:
	bne	a5,a3,.L30
.L34:
	li	a0,1
	ret
.L2:
	lbu	a5,1(a0)
	li	a4,115
	lbu	a3,0(a1)
	beq	a5,a4,.L6
	bgtu	a5,a4,.L7
	li	a4,83
	beq	a5,a4,.L8
	li	a4,100
	bne	a5,a4,.L18
	lui	a5,%hi(_ctype_+1)
	addi	a5,a5,%lo(_ctype_+1)
	add	a5,a3,a5
	lbu	a0,0(a5)
	andi	a0,a0,4
	seqz	a0,a0
	neg	a0,a0
	ori	a0,a0,1
	ret
.L7:
	li	a4,120
	bne	a5,a4,.L18
	lbu	a2,2(a0)
	lui	a4,%hi(_ctype_+1)
	addi	a4,a4,%lo(_ctype_+1)
	add	a5,a4,a2
	lbu	a5,0(a5)
	li	a6,1
	mv	a1,a2
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
	li	a0,1
	slli	a5,a5,4
	add	a4,a4,a2
	lbu	a4,0(a4)
	mv	a1,a2
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
	li	a0,-1
	ret
.L6:
	lui	a5,%hi(_ctype_+1)
	addi	a5,a5,%lo(_ctype_+1)
	add	a5,a3,a5
	lbu	a0,0(a5)
	andi	a0,a0,8
	seqz	a0,a0
	neg	a0,a0
	ori	a0,a0,1
	ret
.L38:
	addi	a3,a3,32
	j	.L18
.L8:
	lui	a5,%hi(_ctype_+1)
	addi	a5,a5,%lo(_ctype_+1)
	add	a5,a3,a5
	lbu	a0,0(a5)
	slli	a5,a0,28
	srai	a0,a5,31
	ori	a0,a0,1
	ret
	.size	match_op, .-match_op
	.align	2
	.type	bar, @function
bar:
	not	a6,a3
	srli	a6,a6,31
	sgt	a7,a1,zero
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
	li	s11,0
	li	s5,0
	mv	s2,a0
	mv	s9,a1
	mv	s1,a3
	sw	a2,12(sp)
	mv	s8,a4
.L40:
	add	a0,s2,s5
	lbu	a1,0(a0)
	li	a5,40
	beq	a1,a5,.L208
	li	a5,91
	beq	a1,a5,.L209
	li	a5,92
	beq	a1,a5,.L52
	addi	a5,a1,-42
	sltiu	a5,a5,2
	bne	a5,zero,.L130
	addi	a5,a1,-63
	beq	a5,zero,.L130
	addi	a4,s5,1
	ble	s9,a4,.L210
	li	s6,1
	mv	s3,s6
.L53:
	add	s6,s5,s6
	add	s6,s2,s6
	lbu	a7,0(s6)
	addi	a5,a7,-42
	sltiu	a5,a5,2
	addi	a7,a7,-63
	seqz	a7,a7
	bne	a5,zero,.L117
	bne	a7,zero,.L117
	li	a5,94
	bne	a1,a5,.L113
	beq	s11,zero,.L206
.L83:
	li	s10,-1
	j	.L203
.L208:
	lw	a5,16(sp)
	addi	s6,a5,1
	slli	a5,s6,4
	add	a5,s8,a5
	lw	s3,4(a5)
	addi	s3,s3,2
	ble	s3,zero,.L129
	add	s0,s3,s5
	mv	a4,s0
	bgt	s9,s0,.L46
.L57:
	lw	a5,1600(s8)
	ble	a5,s6,.L138
	lw	a5,12(sp)
	sub	s4,s9,a4
	sub	s3,s1,s11
	add	s5,a5,s11
	bgt	s4,zero,.L139
	mv	a1,s3
	mv	a3,s6
	mv	a2,s8
	mv	a0,s5
	sw	a4,24(sp)
	call	doh
	lw	a4,24(sp)
	mv	s10,a0
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
	mv	s11,a7
	mv	s5,a4
	sw	s6,16(sp)
	xori	a5,a2,1
.L62:
	ble	s9,s5,.L144
	bne	a5,zero,.L40
.L144:
	mv	s10,s11
	j	.L203
.L49:
	blt	a4,a3,.L129
	addi	s3,a3,2
	ble	s3,zero,.L129
	add	a4,s5,s3
	mv	s0,a4
	ble	s9,a4,.L186
.L46:
	add	s6,s2,s0
	lbu	a7,0(s6)
	addi	a5,a7,-42
	sltiu	a5,a5,2
	addi	a7,a7,-63
	seqz	a7,a7
	bne	a5,zero,.L117
	bne	a7,zero,.L117
	li	a5,91
	beq	a1,a5,.L186
	lw	a5,16(sp)
	addi	s6,a5,1
	j	.L57
.L117:
	lw	a5,12(sp)
	sub	a3,s1,s11
	add	a2,a5,s11
	bne	a7,zero,.L211
	mv	s0,s8
	sw	a2,24(sp)
	sw	a3,28(sp)
	addi	s8,a4,1
	mv	s4,a5
	mv	s7,a0
	ble	s9,s8,.L63
	add	a5,s2,s8
	lbu	a3,0(a5)
	li	a5,63
	beq	a3,a5,.L212
.L64:
	sub	a5,s9,s8
	sw	a5,12(sp)
	add	a5,s2,s8
	sw	s6,32(sp)
	sw	s8,36(sp)
	sw	s2,44(sp)
	mv	s10,s11
	sw	a5,20(sp)
	mv	s5,a7
	add	s6,s4,s11
	sub	s8,s1,s11
	sw	s9,40(sp)
	mv	s2,s11
.L74:
	lw	a5,16(sp)
	mv	a4,s0
	mv	a1,s3
	mv	a3,s8
	mv	a2,s6
	mv	a0,s7
	call	bar
	mv	s9,a0
	lw	a5,16(sp)
	lw	a1,12(sp)
	lw	a0,20(sp)
	mv	a4,s0
	ble	s9,zero,.L213
	add	s2,s2,s9
	sub	s8,s1,s2
	add	s6,s4,s2
	mv	a3,s8
	mv	a2,s6
	call	bar
	blt	a0,zero,.L68
	add	s10,s2,a0
.L68:
	bge	s11,s10,.L74
	beq	s5,zero,.L74
	mv	s5,s9
	lw	s6,32(sp)
	lw	s8,36(sp)
	lw	s9,40(sp)
	lw	s2,44(sp)
.L67:
	lbu	a5,0(s6)
.L79:
	blt	s5,zero,.L214
.L80:
	li	a4,43
	beq	a5,a4,.L69
	sub	a6,s10,s11
	seqz	a6,a6
	sgt	t6,s9,s8
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
	mv	a0,s10
	lw	s10,64(sp)
	addi	sp,sp,112
	jr	ra
.L212:
	addi	s8,a4,2
	lw	a7,20(sp)
	bgt	s9,s8,.L64
.L63:
	mv	s10,s11
	mv	s5,a7
.L77:
	lw	a5,16(sp)
	mv	a4,s0
	sub	a3,s1,s10
	add	a2,s4,s10
	mv	a1,s3
	mv	a0,s7
	call	bar
	ble	a0,zero,.L75
	add	s10,s10,a0
	ble	s10,s11,.L77
	beq	s5,zero,.L77
	mv	s5,a0
	lbu	a5,0(s6)
	li	a0,-1
	j	.L79
.L75:
	lbu	a5,0(s6)
	mv	s5,a0
	addi	a4,a5,-43
	bne	a4,zero,.L143
	bne	a0,zero,.L69
.L143:
	li	a0,-1
	bge	s5,zero,.L80
	j	.L214
.L209:
	sub	a4,s9,s5
	addi	a4,a4,-1
	li	a3,0
	li	a7,93
	li	t1,92
	li	t3,120
	bne	a4,zero,.L45
	j	.L215
.L48:
	add	a3,a3,a6
	ble	a4,a3,.L49
.L45:
	addi	a5,a3,1
	add	a5,a0,a5
	lbu	a2,0(a5)
	li	a6,1
	beq	a2,a7,.L49
	bne	a2,t1,.L48
	lbu	a5,1(a5)
	li	a6,4
	beq	a5,t3,.L48
	li	a6,2
	j	.L48
.L186:
	addi	a5,s5,2
.L47:
	addi	s5,s5,1
	add	s5,s2,s5
	lbu	a2,0(s5)
	li	a3,94
	sub	s10,s9,a5
	beq	a2,a3,.L216
	blt	s10,zero,.L83
	mv	s4,a2
.L87:
	lw	a5,12(sp)
	li	s0,0
	sw	s1,32(sp)
	sw	s2,36(sp)
	li	s6,93
	sw	a2,24(sp)
	sw	a4,28(sp)
	mv	s2,s0
	li	a0,-1
	li	s7,1
	li	s3,45
	mv	s1,s5
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
	mv	a2,s8
	mv	a1,s0
	mv	a0,s5
	call	match_op
	li	a5,92
	li	a3,1
	bne	s4,a5,.L100
	lbu	a5,1(s5)
	li	a4,120
	li	a3,4
	beq	a5,a4,.L100
	li	a3,2
.L100:
	add	s2,s2,a3
.L99:
	bgt	s2,s10,.L204
	add	s5,s1,s2
	lbu	s4,0(s5)
	bne	s4,s6,.L105
.L204:
	lw	a2,24(sp)
	lw	a4,28(sp)
	lw	s1,32(sp)
	lw	s2,36(sp)
	addi	a0,a0,-1
	snez	a0,a0
.L104:
	addi	a5,a2,-94
	snez	a5,a5
	beq	a5,a0,.L83
.L86:
	addi	s11,s11,1
	slt	a5,s1,s11
	mv	s5,a4
	xori	a5,a5,1
	j	.L62
.L52:
	lbu	a4,1(a0)
	li	a5,120
	beq	a4,a5,.L218
	addi	a4,s5,2
	li	s3,2
	bgt	s9,a4,.L219
.L115:
	ble	s1,s11,.L83
	lw	a5,12(sp)
	mv	a2,s8
	add	a1,a5,s11
	call	match_op
	li	a5,1
	mv	s10,a0
	bne	a0,a5,.L203
	add	s11,s11,a5
	slt	a5,s1,s11
	add	s5,s5,s3
	xor	a5,a5,a0
	j	.L62
.L210:
	li	a5,94
	beq	a1,a5,.L220
	li	s3,1
.L113:
	li	a5,36
	bne	a1,a5,.L115
	bne	s1,s11,.L83
.L206:
	lw	a5,20(sp)
	mv	s5,a4
	j	.L62
.L214:
	li	a4,42
	bne	a5,a4,.L80
	lw	a5,16(sp)
	lw	a3,28(sp)
	lw	a2,24(sp)
	mv	a4,s0
	add	a0,s2,s8
	sub	a1,s9,s8
	call	bar
	ble	a0,zero,.L221
	add	s10,a0,s11
	j	.L203
.L139:
	add	s0,s2,s0
	sw	s2,28(sp)
	sw	a4,24(sp)
	li	s2,0
.L106:
	mv	a3,s6
	mv	a2,s8
	sub	a1,s3,s2
	mv	a0,s5
	call	doh
	mv	s10,a0
	bge	a0,zero,.L222
.L188:
	addi	s2,s2,1
	bgt	s2,s3,.L203
	mv	a3,s6
	mv	a2,s8
	sub	a1,s3,s2
	mv	a0,s5
	call	doh
	mv	s10,a0
	blt	a0,zero,.L188
.L222:
	lw	a5,12(sp)
	add	s7,a0,s11
	sub	a3,s1,s7
	add	a2,a5,s7
	mv	a4,s8
	mv	a5,s6
	mv	a1,s4
	mv	a0,s0
	call	bar
	addi	s2,s2,1
	bge	a0,zero,.L223
	ble	s2,s3,.L106
	lw	a4,24(sp)
	lw	s2,28(sp)
	j	.L107
.L69:
	bne	s11,s10,.L203
	li	s10,-1
	j	.L203
.L88:
	mv	a0,s5
	mv	a2,s8
	mv	a1,s0
	call	match_op
	li	a3,1
	add	s2,s2,a3
	j	.L99
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
	li	a4,1
	andi	a5,a5,3
	bne	a5,a4,.L92
	addi	a2,a2,32
.L92:
	add	a5,a1,s4
	lbu	a5,0(a5)
	li	a4,1
	andi	a5,a5,3
	beq	a5,a4,.L225
.L93:
	bge	a2,s4,.L94
	addi	s2,s2,3
	blt	s10,s2,.L204
	add	s5,s1,s2
	lbu	s4,0(s5)
	li	a5,93
	bne	s4,a5,.L96
	j	.L204
.L219:
	li	s6,2
	mv	s3,s6
	j	.L53
.L216:
	addi	s10,s10,-1
	blt	s10,zero,.L86
	lbu	s4,1(s5)
	addi	s5,s5,1
	j	.L87
.L224:
	sltu	a0,a3,a2
	sgtu	a2,s4,a2
	seqz	a0,a0
	seqz	a2,a2
	and	a0,a0,a2
	addi	s2,s2,3
	j	.L99
.L218:
	addi	a4,s5,4
	li	s3,4
	ble	s9,a4,.L115
	li	s6,4
	mv	s3,s6
	j	.L53
.L225:
	addi	s4,s4,32
	j	.L93
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
	li	s10,0
	mv	a0,s10
	lw	s10,64(sp)
	addi	sp,sp,112
	jr	ra
.L187:
	lw	a2,24(sp)
	lw	a4,28(sp)
	lw	s1,32(sp)
	lw	s2,36(sp)
	li	a0,0
	j	.L104
.L211:
	lw	a5,16(sp)
	mv	a4,s8
	mv	a1,s3
	call	bar
	not	a5,a0
	srai	a5,a5,31
	and	a0,a0,a5
	add	s11,s11,a0
	addi	s5,s5,1
	slt	a5,s1,s11
	add	s5,s5,s3
	xori	a5,a5,1
	j	.L62
.L94:
	add	a1,a1,a3
	mv	a5,a3
	lbu	a3,0(a1)
	li	a1,1
	andi	a3,a3,3
	bne	a3,a1,.L98
	addi	a5,a5,32
.L98:
	sgt	a2,a2,a5
	seqz	a0,a2
	addi	s2,s2,3
	j	.L99
.L129:
	li	s10,-5
	j	.L203
.L223:
	lw	a4,24(sp)
	lw	s2,28(sp)
	mv	a7,s7
	j	.L110
.L221:
	lbu	a5,0(s6)
	j	.L80
.L213:
	mv	a2,s6
	lw	s6,32(sp)
	mv	s5,s9
	mv	a6,s2
	lbu	a5,0(s6)
	mv	a3,s8
	lw	s9,40(sp)
	addi	a5,a5,-43
	lw	s8,36(sp)
	lw	s2,44(sp)
	bne	a5,zero,.L71
	bne	s5,zero,.L69
.L71:
	lw	a5,16(sp)
	mv	a4,s0
	sub	a1,s9,s8
	add	a0,s2,s8
	sw	a6,12(sp)
	call	bar
	lw	a6,12(sp)
	blt	a0,zero,.L67
	lbu	a5,0(s6)
	add	s10,a0,a6
	j	.L79
.L215:
	addi	a4,s5,2
	mv	a5,a4
	ble	s9,a4,.L47
	li	s3,2
	mv	s0,a4
	j	.L46
.L130:
	li	s10,-2
	j	.L203
.L138:
	li	s10,-4
	j	.L203
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
	mv	s2,a0
	mv	s1,a3
	lw	a0,0(s5)
	mv	s4,a2
	mv	s3,a1
	beq	s0,zero,.L234
	lw	a3,8(s5)
	li	s0,0
.L227:
	add	a3,s0,a3
	slli	a3,a3,3
	add	a3,s4,a3
	lw	a1,1608(a3)
	sub	a1,a1,a0
.L229:
	mv	a5,s1
	mv	a4,s4
	mv	a3,s3
	mv	a2,s2
	call	bar
	bgt	a0,zero,.L226
.L235:
	lw	a4,12(s5)
	ble	a4,s0,.L226
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
	mv	a4,s4
	mv	a3,s3
	add	a1,a1,a5
	sub	a1,a1,a0
	mv	a5,s1
	mv	a2,s2
	call	bar
	ble	a0,zero,.L235
.L226:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	lw	s5,4(sp)
	addi	sp,sp,32
	jr	ra
.L234:
	lw	a1,4(s5)
	j	.L229
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
	li	t3,1
	sw	a0,0(a4)
	sw	a1,4(a4)
	sw	t3,1600(a4)
	ble	a1,zero,.L322
	li	s0,4096
	lui	s5,%hi(_ctype_+1)
	li	s2,-1
	sw	s9,4(sp)
	sw	s10,0(sp)
	li	s1,0
	li	t4,0
	add	s0,a4,s0
	addi	s5,s5,%lo(_ctype_+1)
	li	t2,91
	li	t6,92
	li	s4,124
	li	s6,40
	li	s9,41
	li	s3,99
	li	t0,120
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
	bgt	a5,s3,.L306
	addi	t4,t4,1
	slli	a6,a5,4
	add	a6,a4,a6
	add	a7,a0,t4
	sw	a7,0(a6)
	sw	s2,4(a6)
	lw	a6,-1684(s0)
	addi	a7,a5,1
	sw	a7,1600(a4)
	ble	a5,a6,.L311
	bgt	a6,zero,.L307
.L311:
	addi	s1,s1,1
.L248:
	bgt	a1,t4,.L237
.L332:
	bne	s1,zero,.L266
	addi	a5,a4,2047
	lw	a6,357(a5)
	lw	s9,4(sp)
	lw	s10,0(sp)
	ble	a6,zero,.L240
.L239:
	li	t4,4096
	add	t4,a4,t4
	mv	a7,a4
	li	t3,0
.L272:
	addi	t3,t3,1
	bge	t3,a6,.L240
	lw	t1,1604(a7)
	mv	a5,a7
	mv	a1,t3
.L271:
	lw	a0,1612(a5)
	ble	t1,a0,.L268
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
	ble	a6,a1,.L269
	lw	t1,1604(a7)
	lw	a0,1612(a5)
	bgt	t1,a0,.L331
.L268:
	addi	a1,a1,1
	bge	a1,a6,.L269
	addi	a5,a5,8
	j	.L271
.L330:
	lw	a5,-1692(s0)
	bgt	a5,s3,.L300
	lw	a6,1600(a4)
	addi	a6,a6,-1
	slli	a7,a6,4
	add	a7,a4,a7
	lw	a7,4(a7)
	beq	a7,s2,.L254
	mv	a6,s1
.L254:
	slli	a7,a5,3
	add	a7,a4,a7
	sw	a6,1604(a7)
	sw	t3,1608(a7)
	addi	a5,a5,1
	addi	t4,t4,1
	sw	a5,-1692(s0)
	bgt	a1,t4,.L237
	j	.L332
.L328:
	sub	t5,a1,t4
	addi	t5,t5,-1
	li	a5,0
	li	s10,93
	bne	t5,zero,.L242
	j	.L333
.L244:
	add	a5,a5,t1
	ble	t5,a5,.L245
.L242:
	addi	a6,a5,1
	add	a6,t3,a6
	lbu	a7,0(a6)
	li	t1,1
	beq	a7,s10,.L245
	bne	a7,t6,.L244
	lbu	a6,1(a6)
	li	t1,4
	beq	a6,t0,.L244
	li	t1,2
	add	a5,a5,t1
	bgt	t5,a5,.L242
.L245:
	blt	t5,a5,.L248
	addi	a5,a5,2
	add	t4,t4,a5
.L341:
	bgt	a1,t4,.L237
	j	.L332
.L329:
	lbu	a5,1(t3)
	li	a7,2
	beq	a5,t0,.L334
.L251:
	ble	s7,t4,.L305
	lbu	a5,1(t3)
	bne	a5,t0,.L335
	ble	s8,t4,.L305
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
	bgt	a1,t4,.L237
	j	.L332
.L334:
	li	a7,4
	j	.L251
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
	ble	t4,zero,.L265
	lbu	a6,-1(t3)
	li	a5,40
	beq	a6,a5,.L336
.L265:
	addi	t4,t4,1
	bgt	a1,t4,.L237
	j	.L332
.L335:
	addi	a6,a5,-40
	andi	a6,a6,0xff
	li	t1,23
	bleu	a6,t1,.L256
	andi	a6,a5,191
	addi	a6,a6,-36
	seqz	a6,a6
.L257:
	addi	t3,a5,-124
	seqz	t1,a5
	seqz	t3,t3
	or	t3,t3,t1
	addi	t1,a5,-91
	andi	a5,a5,223
	sltiu	t1,t1,4
	addi	a5,a5,-83
	or	t1,t1,t3
	seqz	a5,a5
	or	a5,a5,t1
	bne	a5,zero,.L327
	bne	a6,zero,.L327
.L305:
	lw	s9,4(sp)
	lw	s10,0(sp)
	li	a0,-6
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
	jr	ra
.L256:
	li	t1,-8388608
	addi	t1,t1,-80
	sra	a6,t1,a6
	andi	a6,a6,1
	xori	a6,a6,1
	j	.L257
.L269:
	addi	a7,a7,8
	blt	t3,a6,.L272
.L240:
	lw	t3,1600(a4)
	ble	t3,zero,.L280
.L273:
	li	a0,0
	sw	zero,12(a4)
	sw	a0,8(a4)
	addi	a7,a4,12
	li	t1,0
	bge	a0,a6,.L276
.L337:
	slli	a1,a0,3
	add	a1,a4,a1
	j	.L277
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
	mv	s4,a3
	lw	a3,12(a4)
	lbu	s7,0(a5)
	mv	s5,a2
	mv	s0,a4
	li	s3,0
	li	s6,94
.L291:
	lw	a0,0(s0)
	mv	s8,a3
	add	s1,s5,s3
	sub	s2,s4,s3
	beq	a3,zero,.L338
	lw	a4,8(s0)
	li	s8,0
.L283:
	add	a5,s8,a4
	slli	a5,a5,3
	add	a5,s0,a5
	lw	a1,1608(a5)
	sub	a1,a1,a0
.L285:
	li	a5,0
	mv	a4,s0
	mv	a3,s2
	mv	a2,s1
	call	bar
	bgt	a0,zero,.L339
.L286:
	lw	a3,12(s0)
	ble	a3,s8,.L288
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
	mv	a4,s0
	mv	a3,s2
	add	a1,a1,a5
	sub	a1,a1,a0
	li	a5,0
	mv	a2,s1
	call	bar
	ble	a0,zero,.L286
.L339:
	add	a0,a0,s3
	j	.L236
.L338:
	lw	a1,4(s0)
	j	.L285
.L288:
	beq	a0,zero,.L340
	beq	s7,s6,.L236
	addi	s3,s3,1
	bge	s4,s3,.L291
	j	.L236
.L333:
	li	a5,2
	add	t4,t4,a5
	j	.L341
.L300:
	lw	s9,4(sp)
	lw	s10,0(sp)
	li	a0,-8
	j	.L236
.L307:
	lw	s9,4(sp)
	lw	s10,0(sp)
	li	a0,-7
	j	.L236
.L336:
	lw	s9,4(sp)
	lw	s10,0(sp)
.L275:
	li	a0,-1
	j	.L236
.L306:
	lw	s9,4(sp)
	lw	s10,0(sp)
	li	a0,-9
	j	.L236
.L266:
	lw	s9,4(sp)
	lw	s10,0(sp)
	li	a0,-3
	j	.L236
.L322:
	addi	a5,a4,2047
	lw	a6,357(a5)
	bgt	a6,zero,.L239
	j	.L273
.L340:
	mv	a0,s3
	j	.L236
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
	li	a5,1
	sw	a5,0(a4)
	sw	zero,1612(sp)
	li	a4,40
	mv	a3,a1
	bne	a6,a4,.L343
	lbu	a2,1(a0)
	li	a4,63
	bne	a2,a4,.L344
	lbu	a2,2(a0)
	li	a4,105
	bne	a2,a4,.L344
	lbu	a2,3(a0)
	li	a4,41
	bne	a2,a4,.L344
	addi	a4,sp,2047
	addi	a4,a4,381
	addi	a0,a0,4
	sw	a5,0(a4)
.L343:
	lbu	a5,0(a0)
	beq	a5,zero,.L347
.L344:
	li	a5,0
.L346:
	addi	a5,a5,1
	add	a4,a0,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L346
	mv	a1,a5
.L345:
	lui	a2,%hi(.LANCHOR0)
	addi	a4,sp,12
	addi	a2,a2,%lo(.LANCHOR0)
	call	foo
	addi	sp,sp,416
	lw	ra,2028(sp)
	addi	sp,sp,2032
	jr	ra
.L347:
	li	a1,0
	j	.L345
	.size	slre_match.constprop.0, .-slre_match.constprop.0
	.align	2
	.type	benchmark_body.constprop.0, @function
benchmark_body.constprop.0:
	addi	sp,sp,-48
	sw	s4,24(sp)
	lui	s4,%hi(.LANCHOR0)
	addi	s4,s4,%lo(.LANCHOR0)
	sw	s5,20(sp)
	li	s5,1
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s6,16(sp)
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	sub	s5,s5,s4
	addi	s2,s4,64
	li	s3,110
	lui	s6,%hi(.LANCHOR0+48)
.L351:
	lbu	a4,0(s4)
	mv	a5,s4
	li	s1,0
	beq	a4,zero,.L356
.L352:
	mv	a1,a5
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
	mv	a1,s1
	call	slre_match.constprop.0
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
	jr	ra
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	addi	sp,sp,-64
	sw	ra,60(sp)
	ble	a0,zero,.L363
	sw	s3,44(sp)
	lui	s3,%hi(.LANCHOR0)
	addi	s3,s3,%lo(.LANCHOR0)
	sw	s5,36(sp)
	li	s5,1
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s4,40(sp)
	sw	s6,32(sp)
	sw	s0,56(sp)
	sw	s7,28(sp)
	mv	s4,a0
	sub	s5,s5,s3
	addi	s1,s3,64
	li	s2,0
	lui	s6,%hi(.LANCHOR0+48)
.L362:
	lbu	a4,0(s3)
	mv	a5,s3
	li	s7,0
	beq	a4,zero,.L367
.L364:
	mv	a1,a5
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
	mv	a1,s7
	call	slre_match.constprop.0
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
	jr	ra
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.globl	initialise_board
	.type	initialise_board, @function
initialise_board:
	ret
	.size	initialise_board, .-initialise_board
	.align	2
	.globl	start_trigger
	.type	start_trigger, @function
start_trigger:
	ret
	.size	start_trigger, .-start_trigger
	.align	2
	.globl	stop_trigger
	.type	stop_trigger, @function
stop_trigger:
	ret
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
	li	a5,40
	mv	a3,a2
	bne	a6,a5,.L377
	lbu	a4,1(a0)
	li	a5,63
	bne	a4,a5,.L378
	lbu	a4,2(a0)
	li	a5,105
	bne	a4,a5,.L378
	lbu	a4,3(a0)
	li	a5,41
	bne	a4,a5,.L378
	addi	a4,sp,2047
	li	a5,1
	addi	a4,a4,381
	addi	a0,a0,4
	sw	a5,0(a4)
.L377:
	lbu	a5,0(a0)
	beq	a5,zero,.L379
.L378:
	li	a5,0
.L380:
	addi	a5,a5,1
	add	a4,a0,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L380
.L379:
	mv	a2,a1
	addi	a4,sp,12
	mv	a1,a5
	call	foo
	addi	sp,sp,416
	lw	ra,2028(sp)
	addi	sp,sp,2032
	jr	ra
	.size	slre_match, .-slre_match
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	ret
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	warm_caches
	.type	warm_caches, @function
warm_caches:
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	benchmark_body.isra.0
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	benchmark_body.constprop.0
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	benchmark, .-benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	li	a0,1
	sw	ra,28(sp)
	call	benchmark_body.isra.0
	call	benchmark
	sw	a0,12(sp)
	lw	a0,12(sp)
	lw	ra,28(sp)
	addi	a0,a0,-102
	snez	a0,a0
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.text
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	addi	a0,a0,-102
	seqz	a0,a0
	ret
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
