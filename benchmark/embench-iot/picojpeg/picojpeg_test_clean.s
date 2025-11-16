	.file	"picojpeg_test.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	upsampleCb, @function
upsampleCb:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	slli	a0,a0,1
	addi	t0,a5,512
	add	t0,t0,a0
	addi	sp,sp,-16
	addi	t6,a5,256
	addi	t1,t0,8
	add	t6,t6,a1
	sw	s0,12(sp)
	addi	t0,t0,72
	add	a1,a5,a1
	addi	t5, zero, 88
	addi	a6, zero, 255
	addi	t4, zero, 198
	addi	t3, zero, -1
.L2:
	addi	a7,t1,-8
	addi	a3, t6, 0
	addi	a4, a1, 0
.L23:
	lbu	t2,0(a7)
	lbu	a2,0(a4)
	lbu	a0,1(a4)
	mul	a5,t2,t5
	addi	a7,a7,2
	srli	a5,a5,8
	addi	a5,a5,-44
	sub	a2,a2,a5
	slli	a2,a2,16
	sub	a0,a0,a5
	slli	a0,a0,16
	srli	a2,a2,16
	srli	a0,a0,16
	bgeu	a6, a2, .L4
	slli	s0,a2,16
	srai	s0,s0,16
	addi	a2, zero, 0
	bge	s0,zero,.L36
.L4:
	sb	a2,0(a4)
	bgeu	a6, a0, .L8
	slli	a2,a0,16
	srai	a2,a2,16
	addi	a0, zero, 0
	bge	a2,zero,.L9
.L8:
	lbu	a2,8(a4)
	sb	a0,1(a4)
	sub	a2,a2,a5
	slli	a2,a2,16
	srli	a2,a2,16
	bgeu	a6, a2, .L12
	slli	a0,a2,16
	srai	a0,a0,16
	addi	a2, zero, 0
	bge	a0,zero,.L6
.L12:
	lbu	a0,9(a4)
	sb	a2,8(a4)
	sub	a5,a0,a5
	slli	a5,a5,16
	srli	a5,a5,16
	bgeu	a6, a5, .L11
	xori	a5, a5, -1
	slli	a2,a5,16
	srai	a0,a2,31
.L10:
	mul	a5,t2,t4
	lbu	a2,0(a3)
	sb	a0,9(a4)
	addi	t2,t2,-227
	lbu	a0,1(a3)
	srli	a5,a5,8
	add	a5,a5,t2
	add	a2,a5,a2
	slli	a2,a2,16
	add	a0,a5,a0
	slli	a0,a0,16
	srli	a2,a2,16
	srli	a0,a0,16
	bgeu	a6, a2, .L14
	slli	t2,a2,16
	srai	t2,t2,16
	addi	a2, zero, 0
	bge	t2,zero,.L37
.L14:
	sb	a2,0(a3)
	bgeu	a6, a0, .L18
	slli	a2,a0,16
	srai	a2,a2,16
	addi	a0, zero, 0
	bge	a2,zero,.L19
.L18:
	lbu	a2,8(a3)
	sb	a0,1(a3)
	add	a2,a5,a2
	slli	a2,a2,16
	srli	a2,a2,16
	bgeu	a6, a2, .L22
	slli	a0,a2,16
	srai	a0,a0,16
	addi	a2, zero, 0
	bge	a0,zero,.L16
.L22:
	lbu	a0,9(a3)
	sb	a2,8(a3)
	add	a5,a5,a0
	slli	a5,a5,16
	srli	a5,a5,16
	bgeu	a6, a5, .L21
	xori	a5, a5, -1
	slli	a0,a5,16
	srai	a2,a0,31
.L20:
	sb	a2,9(a3)
	addi	a4,a4,2
	addi	a3,a3,2
	bne	a7,t1,.L23
	addi	t1,a7,16
	addi	a1,a1,16
	addi	t6,t6,16
	bne	t1,t0,.L2
	lw	s0,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
.L37:
	sb	t3,0(a3)
	bgeu	a6, a0, .L18
.L19:
	lbu	a2,8(a3)
	sb	t3,1(a3)
	add	a2,a5,a2
	slli	a2,a2,16
	srli	a2,a2,16
	bgeu	a6, a2, .L22
.L16:
	lbu	a0,9(a3)
	sb	t3,8(a3)
	addi	a2, zero, 255
	add	a5,a5,a0
	slli	a5,a5,16
	srli	a5,a5,16
	bltu	a6, a5, .L20
.L21:
	addi	a2, a5, 0
	jal	zero, .L20
.L36:
	sb	t3,0(a4)
	bgeu	a6, a0, .L8
.L9:
	lbu	a2,8(a4)
	sb	t3,1(a4)
	sub	a2,a2,a5
	slli	a2,a2,16
	srli	a2,a2,16
	bgeu	a6, a2, .L12
.L6:
	lbu	a2,9(a4)
	sb	t3,8(a4)
	addi	a0, zero, 255
	sub	a5,a2,a5
	slli	a5,a5,16
	srli	a5,a5,16
	bltu	a6, a5, .L10
.L11:
	addi	a0, a5, 0
	jal	zero, .L10
	.size	upsampleCb, .-upsampleCb
	.align	2
	.type	upsampleCbH, @function
upsampleCbH:
	lui	a4,%hi(.LANCHOR0)
	addi	a4,a4,%lo(.LANCHOR0)
	add	a5,a4,a1
	slli	a0,a0,1
	addi	a2,a4,512
	addi	a4,a4,256
	add	a2,a2,a0
	add	a1,a4,a1
	addi	t1,a5,64
	addi	a6, zero, 88
	addi	a4, zero, 255
	addi	a7, zero, -1
	addi	a0, zero, 198
	jal	zero, .L71
.L98:
	xori	t3, t3, -1
	slli	t4,t3,16
	srai	a3,t4,31
.L41:
	sb	a3,1(a5)
	mul	a3,t5,a0
	lbu	t3,0(a1)
	lbu	t4,1(a1)
	addi	t5,t5,-227
	srli	a3,a3,8
	add	a3,a3,t5
	add	t3,a3,t3
	slli	t3,t3,16
	add	a3,a3,t4
	slli	a3,a3,16
	srli	t3,t3,16
	srli	a3,a3,16
	bgeu	a4, t3, .L44
	slli	t4,t3,16
	srai	t4,t4,16
	addi	t3, zero, 0
	bge	t4,zero,.L89
.L44:
	sb	t3,0(a1)
	bgeu	a4, a3, .L46
	xori	a3, a3, -1
	slli	t4,a3,16
	srai	t3,t4,31
.L45:
	lbu	t5,2(a2)
	lbu	a3,2(a5)
	sb	t3,1(a1)
	mul	t4,t5,a6
	lbu	t3,3(a5)
	srli	t4,t4,8
	addi	t4,t4,-44
	sub	a3,a3,t4
	slli	a3,a3,16
	sub	t3,t3,t4
	slli	t3,t3,16
	srli	a3,a3,16
	srli	t3,t3,16
	bgeu	a4, a3, .L48
	slli	t4,a3,16
	srai	t4,t4,16
	addi	a3, zero, 0
	bge	t4,zero,.L90
.L48:
	sb	a3,2(a5)
	bgeu	a4, t3, .L50
	xori	t3, t3, -1
	slli	t4,t3,16
	srai	a3,t4,31
.L49:
	sb	a3,3(a5)
	mul	a3,t5,a0
	lbu	t3,2(a1)
	lbu	t4,3(a1)
	addi	t5,t5,-227
	srli	a3,a3,8
	add	a3,a3,t5
	add	t3,a3,t3
	slli	t3,t3,16
	add	a3,a3,t4
	slli	a3,a3,16
	srli	t3,t3,16
	srli	a3,a3,16
	bgeu	a4, t3, .L52
	slli	t4,t3,16
	srai	t4,t4,16
	addi	t3, zero, 0
	bge	t4,zero,.L91
.L52:
	sb	t3,2(a1)
	bgeu	a4, a3, .L54
	xori	a3, a3, -1
	slli	t4,a3,16
	srai	t3,t4,31
.L53:
	lbu	t5,4(a2)
	lbu	a3,4(a5)
	sb	t3,3(a1)
	mul	t4,t5,a6
	lbu	t3,5(a5)
	srli	t4,t4,8
	addi	t4,t4,-44
	sub	a3,a3,t4
	slli	a3,a3,16
	sub	t3,t3,t4
	slli	t3,t3,16
	srli	a3,a3,16
	srli	t3,t3,16
	bgeu	a4, a3, .L56
	slli	t4,a3,16
	srai	t4,t4,16
	addi	a3, zero, 0
	bge	t4,zero,.L92
.L56:
	sb	a3,4(a5)
	bgeu	a4, t3, .L58
	xori	t3, t3, -1
	slli	t4,t3,16
	srai	a3,t4,31
.L57:
	sb	a3,5(a5)
	mul	a3,t5,a0
	lbu	t3,4(a1)
	lbu	t4,5(a1)
	addi	t5,t5,-227
	srli	a3,a3,8
	add	a3,a3,t5
	add	t3,a3,t3
	slli	t3,t3,16
	add	a3,a3,t4
	slli	a3,a3,16
	srli	t3,t3,16
	srli	a3,a3,16
	bgeu	a4, t3, .L60
	slli	t4,t3,16
	srai	t4,t4,16
	addi	t3, zero, 0
	bge	t4,zero,.L93
.L60:
	sb	t3,4(a1)
	bgeu	a4, a3, .L62
	xori	a3, a3, -1
	slli	t4,a3,16
	srai	t3,t4,31
.L61:
	lbu	t5,6(a2)
	lbu	a3,6(a5)
	sb	t3,5(a1)
	mul	t4,t5,a6
	lbu	t3,7(a5)
	srli	t4,t4,8
	addi	t4,t4,-44
	sub	a3,a3,t4
	slli	a3,a3,16
	sub	t3,t3,t4
	slli	t3,t3,16
	srli	a3,a3,16
	srli	t3,t3,16
	bgeu	a4, a3, .L64
	slli	t4,a3,16
	srai	t4,t4,16
	addi	a3, zero, 0
	bge	t4,zero,.L94
.L64:
	sb	a3,6(a5)
	bgeu	a4, t3, .L66
	xori	t3, t3, -1
	slli	t4,t3,16
	srai	a3,t4,31
.L65:
	sb	a3,7(a5)
	mul	a3,t5,a0
	lbu	t3,6(a1)
	lbu	t4,7(a1)
	addi	t5,t5,-227
	srli	a3,a3,8
	add	a3,a3,t5
	add	t3,a3,t3
	slli	t3,t3,16
	add	a3,a3,t4
	slli	a3,a3,16
	srli	t3,t3,16
	srli	a3,a3,16
	bgeu	a4, t3, .L68
	slli	t4,t3,16
	srai	t4,t4,16
	addi	t3, zero, 0
	bge	t4,zero,.L95
.L68:
	sb	t3,6(a1)
	bgeu	a4, a3, .L70
	xori	a3, a3, -1
	slli	t4,a3,16
	srai	t3,t4,31
.L69:
	sb	t3,7(a1)
	addi	a5,a5,8
	addi	a1,a1,8
	addi	a2,a2,16
	beq	a5,t1,.L96
.L71:
	lbu	t5,0(a2)
	lbu	a3,0(a5)
	lbu	t3,1(a5)
	mul	t4,t5,a6
	srli	t4,t4,8
	addi	t4,t4,-44
	sub	a3,a3,t4
	slli	a3,a3,16
	sub	t3,t3,t4
	slli	t3,t3,16
	srli	a3,a3,16
	srli	t3,t3,16
	bgeu	a4, a3, .L40
	slli	t4,a3,16
	srai	t4,t4,16
	addi	a3, zero, 0
	bge	t4,zero,.L97
.L40:
	sb	a3,0(a5)
	bltu	a4, t3, .L98
	addi	a3, t3, 0
	jal	zero, .L41
.L91:
	sb	a7,2(a1)
	addi	t3, zero, 255
	bltu	a4, a3, .L53
.L54:
	addi	t3, a3, 0
	jal	zero, .L53
.L92:
	sb	a7,4(a5)
	addi	a3, zero, 255
	bltu	a4, t3, .L57
.L58:
	addi	a3, t3, 0
	jal	zero, .L57
.L93:
	sb	a7,4(a1)
	addi	t3, zero, 255
	bltu	a4, a3, .L61
.L62:
	addi	t3, a3, 0
	jal	zero, .L61
.L94:
	sb	a7,6(a5)
	addi	a3, zero, 255
	bltu	a4, t3, .L65
.L66:
	addi	a3, t3, 0
	jal	zero, .L65
.L89:
	sb	a7,0(a1)
	addi	t3, zero, 255
	bltu	a4, a3, .L45
.L46:
	addi	t3, a3, 0
	jal	zero, .L45
.L90:
	sb	a7,2(a5)
	addi	a3, zero, 255
	bltu	a4, t3, .L49
.L50:
	addi	a3, t3, 0
	jal	zero, .L49
.L95:
	sb	a7,6(a1)
	addi	t3, zero, 255
	bltu	a4, a3, .L69
.L70:
	addi	t3, a3, 0
	sb	t3,7(a1)
	addi	a5,a5,8
	addi	a1,a1,8
	addi	a2,a2,16
	bne	a5,t1,.L71
.L96:
	jalr	zero, ra, 0
.L97:
	sb	a7,0(a5)
	addi	a3, zero, 255
	bltu	a4, t3, .L41
	addi	a3, t3, 0
	jal	zero, .L41
	.size	upsampleCbH, .-upsampleCbH
	.align	2
	.type	upsampleCbV, @function
upsampleCbV:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	slli	a0,a0,1
	add	t4,a5,a1
	add	a0,a5,a0
	addi	a5,a5,256
	add	a1,a5,a1
	addi	a7,a0,528
	addi	t6,t4,64
	addi	t3, zero, 88
	addi	a6, zero, 255
	addi	t5, zero, -1
	addi	t1, zero, 198
.L100:
	addi	a0,a7,-16
	addi	a2, a1, 0
	addi	a3, t4, 0
	jal	zero, .L109
.L119:
	xori	a4, a4, -1
	slli	t0,a4,16
	srai	a5,t0,31
.L103:
	sb	a5,8(a3)
	mul	a5,t2,t1
	lbu	a4,0(a2)
	lbu	t0,8(a2)
	addi	t2,t2,-227
	srli	a5,a5,8
	add	a5,a5,t2
	add	a4,a5,a4
	slli	a4,a4,16
	add	a5,a5,t0
	slli	a5,a5,16
	srli	a4,a4,16
	srli	a5,a5,16
	bgeu	a6, a4, .L106
	slli	t0,a4,16
	srai	t0,t0,16
	addi	a4, zero, 0
	bge	t0,zero,.L116
.L106:
	sb	a4,0(a2)
	bgeu	a6, a5, .L108
	xori	a5, a5, -1
	slli	t0,a5,16
	srai	a4,t0,31
.L107:
	sb	a4,8(a2)
	addi	a3,a3,1
	addi	a2,a2,1
	beq	a0,a7,.L117
.L109:
	lbu	t2,0(a0)
	lbu	a5,0(a3)
	lbu	a4,8(a3)
	mul	t0,t2,t3
	addi	a0,a0,2
	srli	t0,t0,8
	addi	t0,t0,-44
	sub	a5,a5,t0
	slli	a5,a5,16
	sub	a4,a4,t0
	slli	a4,a4,16
	srli	a5,a5,16
	srli	a4,a4,16
	bgeu	a6, a5, .L102
	slli	t0,a5,16
	srai	t0,t0,16
	addi	a5, zero, 0
	bge	t0,zero,.L118
.L102:
	sb	a5,0(a3)
	bltu	a6, a4, .L119
	addi	a5, a4, 0
	jal	zero, .L103
.L116:
	sb	t5,0(a2)
	addi	a4, zero, 255
	bltu	a6, a5, .L107
.L108:
	addi	a4, a5, 0
	sb	a4,8(a2)
	addi	a3,a3,1
	addi	a2,a2,1
	bne	a0,a7,.L109
.L117:
	addi	t4,t4,16
	addi	a1,a1,16
	addi	a7,a0,16
	bne	t4,t6,.L100
	jalr	zero, ra, 0
.L118:
	sb	t5,0(a3)
	addi	a5, zero, 255
	bltu	a6, a4, .L103
	addi	a5, a4, 0
	jal	zero, .L103
	.size	upsampleCbV, .-upsampleCbV
	.align	2
	.type	upsampleCr, @function
upsampleCr:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	slli	a0,a0,1
	addi	t0,a5,512
	add	t0,t0,a0
	addi	sp,sp,-16
	addi	t6,a5,640
	addi	t1,t0,8
	add	t6,t6,a1
	sw	s0,12(sp)
	addi	t0,t0,72
	add	a1,a5,a1
	addi	t5, zero, 103
	addi	a6, zero, 255
	addi	t4, zero, 183
	addi	t3, zero, -1
.L121:
	addi	a7,t1,-8
	addi	a2, a1, 0
	addi	a3, t6, 0
.L142:
	lbu	a4,0(a7)
	lbu	a0,0(a3)
	lbu	t2,1(a3)
	mul	a5,a4,t5
	addi	s0,a4,-179
	addi	a7,a7,2
	srli	a5,a5,8
	add	a5,a5,s0
	add	a0,a5,a0
	slli	a0,a0,16
	add	t2,a5,t2
	slli	t2,t2,16
	srli	a0,a0,16
	srli	t2,t2,16
	bgeu	a6, a0, .L123
	slli	s0,a0,16
	srai	s0,s0,16
	addi	a0, zero, 0
	bge	s0,zero,.L154
.L123:
	sb	a0,0(a3)
	bgeu	a6, t2, .L127
	slli	a0,t2,16
	srai	a0,a0,16
	addi	t2, zero, 0
	bge	a0,zero,.L128
.L127:
	lbu	a0,8(a3)
	sb	t2,1(a3)
	add	a0,a5,a0
	slli	a0,a0,16
	srli	a0,a0,16
	bgeu	a6, a0, .L131
	slli	t2,a0,16
	srai	t2,t2,16
	addi	a0, zero, 0
	bge	t2,zero,.L125
.L131:
	lbu	t2,9(a3)
	sb	a0,8(a3)
	add	a5,a5,t2
	slli	a5,a5,16
	srli	a5,a5,16
	bgeu	a6, a5, .L130
	xori	a5, a5, -1
	slli	t2,a5,16
	srai	a0,t2,31
.L129:
	mul	a5,a4,t4
	lbu	a4,0(a2)
	sb	a0,9(a3)
	lbu	a0,1(a2)
	srli	a5,a5,8
	addi	a5,a5,-91
	sub	a4,a4,a5
	slli	a4,a4,16
	sub	a0,a0,a5
	slli	a0,a0,16
	srli	a4,a4,16
	srli	a0,a0,16
	bgeu	a6, a4, .L133
	slli	t2,a4,16
	srai	t2,t2,16
	addi	a4, zero, 0
	bge	t2,zero,.L155
.L133:
	sb	a4,0(a2)
	bgeu	a6, a0, .L137
	slli	a4,a0,16
	srai	a4,a4,16
	addi	a0, zero, 0
	bge	a4,zero,.L138
.L137:
	lbu	a4,8(a2)
	sb	a0,1(a2)
	sub	a4,a4,a5
	slli	a4,a4,16
	srli	a4,a4,16
	bgeu	a6, a4, .L141
	slli	a0,a4,16
	srai	a0,a0,16
	addi	a4, zero, 0
	bge	a0,zero,.L135
.L141:
	lbu	a0,9(a2)
	sb	a4,8(a2)
	sub	a5,a0,a5
	slli	a5,a5,16
	srli	a5,a5,16
	bgeu	a6, a5, .L140
	xori	a5, a5, -1
	slli	a4,a5,16
	srai	a0,a4,31
.L139:
	sb	a0,9(a2)
	addi	a3,a3,2
	addi	a2,a2,2
	bne	a7,t1,.L142
	addi	t1,a7,16
	addi	t6,t6,16
	addi	a1,a1,16
	bne	t1,t0,.L121
	lw	s0,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
.L155:
	sb	t3,0(a2)
	bgeu	a6, a0, .L137
.L138:
	lbu	a4,8(a2)
	sb	t3,1(a2)
	sub	a4,a4,a5
	slli	a4,a4,16
	srli	a4,a4,16
	bgeu	a6, a4, .L141
.L135:
	lbu	a4,9(a2)
	sb	t3,8(a2)
	addi	a0, zero, 255
	sub	a5,a4,a5
	slli	a5,a5,16
	srli	a5,a5,16
	bltu	a6, a5, .L139
.L140:
	addi	a0, a5, 0
	jal	zero, .L139
.L154:
	sb	t3,0(a3)
	bgeu	a6, t2, .L127
.L128:
	lbu	a0,8(a3)
	sb	t3,1(a3)
	add	a0,a5,a0
	slli	a0,a0,16
	srli	a0,a0,16
	bgeu	a6, a0, .L131
.L125:
	lbu	t2,9(a3)
	sb	t3,8(a3)
	addi	a0, zero, 255
	add	a5,a5,t2
	slli	a5,a5,16
	srli	a5,a5,16
	bltu	a6, a5, .L129
.L130:
	addi	a0, a5, 0
	jal	zero, .L129
	.size	upsampleCr, .-upsampleCr
	.align	2
	.type	upsampleCrH, @function
upsampleCrH:
	lui	a4,%hi(.LANCHOR0)
	addi	a4,a4,%lo(.LANCHOR0)
	addi	a5,a4,640
	slli	a0,a0,1
	addi	a2,a4,512
	add	a5,a5,a1
	add	a2,a2,a0
	add	a1,a4,a1
	addi	t1,a5,64
	addi	a6, zero, 103
	addi	a4, zero, 255
	addi	a7, zero, -1
	addi	a0, zero, 183
	jal	zero, .L189
.L216:
	xori	a3, a3, -1
	slli	t5,a3,16
	srai	t4,t5,31
.L159:
	mul	t3,t3,a0
	lbu	a3,0(a1)
	sb	t4,1(a5)
	lbu	t4,1(a1)
	srli	t3,t3,8
	addi	t3,t3,-91
	sub	a3,a3,t3
	slli	a3,a3,16
	sub	t3,t4,t3
	slli	t3,t3,16
	srli	a3,a3,16
	srli	t3,t3,16
	bgeu	a4, a3, .L162
	slli	t4,a3,16
	srai	t4,t4,16
	addi	a3, zero, 0
	bge	t4,zero,.L207
.L162:
	sb	a3,0(a1)
	bgeu	a4, t3, .L164
	xori	t3, t3, -1
	slli	t4,t3,16
	srai	a3,t4,31
.L163:
	lbu	t3,2(a2)
	sb	a3,1(a1)
	lbu	t4,2(a5)
	mul	a3,t3,a6
	lbu	t5,3(a5)
	addi	t6,t3,-179
	srli	a3,a3,8
	add	a3,a3,t6
	add	t4,a3,t4
	slli	t4,t4,16
	add	a3,a3,t5
	slli	a3,a3,16
	srli	t4,t4,16
	srli	a3,a3,16
	bgeu	a4, t4, .L166
	slli	t5,t4,16
	srai	t5,t5,16
	addi	t4, zero, 0
	bge	t5,zero,.L208
.L166:
	sb	t4,2(a5)
	bgeu	a4, a3, .L168
	xori	a3, a3, -1
	slli	t5,a3,16
	srai	t4,t5,31
.L167:
	mul	t3,t3,a0
	lbu	a3,2(a1)
	sb	t4,3(a5)
	lbu	t4,3(a1)
	srli	t3,t3,8
	addi	t3,t3,-91
	sub	a3,a3,t3
	slli	a3,a3,16
	sub	t3,t4,t3
	slli	t3,t3,16
	srli	a3,a3,16
	srli	t3,t3,16
	bgeu	a4, a3, .L170
	slli	t4,a3,16
	srai	t4,t4,16
	addi	a3, zero, 0
	bge	t4,zero,.L209
.L170:
	sb	a3,2(a1)
	bgeu	a4, t3, .L172
	xori	t3, t3, -1
	slli	t4,t3,16
	srai	a3,t4,31
.L171:
	lbu	t3,4(a2)
	sb	a3,3(a1)
	lbu	t4,4(a5)
	mul	a3,t3,a6
	lbu	t5,5(a5)
	addi	t6,t3,-179
	srli	a3,a3,8
	add	a3,a3,t6
	add	t4,a3,t4
	slli	t4,t4,16
	add	a3,a3,t5
	slli	a3,a3,16
	srli	t4,t4,16
	srli	a3,a3,16
	bgeu	a4, t4, .L174
	slli	t5,t4,16
	srai	t5,t5,16
	addi	t4, zero, 0
	bge	t5,zero,.L210
.L174:
	sb	t4,4(a5)
	bgeu	a4, a3, .L176
	xori	a3, a3, -1
	slli	t5,a3,16
	srai	t4,t5,31
.L175:
	mul	t3,t3,a0
	lbu	a3,4(a1)
	sb	t4,5(a5)
	lbu	t4,5(a1)
	srli	t3,t3,8
	addi	t3,t3,-91
	sub	a3,a3,t3
	slli	a3,a3,16
	sub	t3,t4,t3
	slli	t3,t3,16
	srli	a3,a3,16
	srli	t3,t3,16
	bgeu	a4, a3, .L178
	slli	t4,a3,16
	srai	t4,t4,16
	addi	a3, zero, 0
	bge	t4,zero,.L211
.L178:
	sb	a3,4(a1)
	bgeu	a4, t3, .L180
	xori	t3, t3, -1
	slli	t4,t3,16
	srai	a3,t4,31
.L179:
	lbu	t3,6(a2)
	sb	a3,5(a1)
	lbu	t4,6(a5)
	mul	a3,t3,a6
	lbu	t5,7(a5)
	addi	t6,t3,-179
	srli	a3,a3,8
	add	a3,a3,t6
	add	t4,a3,t4
	slli	t4,t4,16
	add	a3,a3,t5
	slli	a3,a3,16
	srli	t4,t4,16
	srli	a3,a3,16
	bgeu	a4, t4, .L182
	slli	t5,t4,16
	srai	t5,t5,16
	addi	t4, zero, 0
	bge	t5,zero,.L212
.L182:
	sb	t4,6(a5)
	bgeu	a4, a3, .L184
	xori	a3, a3, -1
	slli	t5,a3,16
	srai	t4,t5,31
.L183:
	mul	t3,t3,a0
	lbu	a3,6(a1)
	sb	t4,7(a5)
	lbu	t4,7(a1)
	srli	t3,t3,8
	addi	t3,t3,-91
	sub	a3,a3,t3
	slli	a3,a3,16
	sub	t3,t4,t3
	slli	t3,t3,16
	srli	a3,a3,16
	srli	t3,t3,16
	bgeu	a4, a3, .L186
	slli	t4,a3,16
	srai	t4,t4,16
	addi	a3, zero, 0
	bge	t4,zero,.L213
.L186:
	sb	a3,6(a1)
	bgeu	a4, t3, .L188
	xori	t3, t3, -1
	slli	t4,t3,16
	srai	a3,t4,31
.L187:
	sb	a3,7(a1)
	addi	a5,a5,8
	addi	a1,a1,8
	addi	a2,a2,16
	beq	a5,t1,.L214
.L189:
	lbu	t3,0(a2)
	lbu	t4,0(a5)
	lbu	t5,1(a5)
	mul	a3,t3,a6
	addi	t6,t3,-179
	srli	a3,a3,8
	add	a3,a3,t6
	add	t4,a3,t4
	slli	t4,t4,16
	add	a3,a3,t5
	slli	a3,a3,16
	srli	t4,t4,16
	srli	a3,a3,16
	bgeu	a4, t4, .L158
	slli	t5,t4,16
	srai	t5,t5,16
	addi	t4, zero, 0
	bge	t5,zero,.L215
.L158:
	sb	t4,0(a5)
	bltu	a4, a3, .L216
	addi	t4, a3, 0
	jal	zero, .L159
.L209:
	sb	a7,2(a1)
	addi	a3, zero, 255
	bltu	a4, t3, .L171
.L172:
	addi	a3, t3, 0
	jal	zero, .L171
.L210:
	sb	a7,4(a5)
	addi	t4, zero, 255
	bltu	a4, a3, .L175
.L176:
	addi	t4, a3, 0
	jal	zero, .L175
.L211:
	sb	a7,4(a1)
	addi	a3, zero, 255
	bltu	a4, t3, .L179
.L180:
	addi	a3, t3, 0
	jal	zero, .L179
.L212:
	sb	a7,6(a5)
	addi	t4, zero, 255
	bltu	a4, a3, .L183
.L184:
	addi	t4, a3, 0
	jal	zero, .L183
.L207:
	sb	a7,0(a1)
	addi	a3, zero, 255
	bltu	a4, t3, .L163
.L164:
	addi	a3, t3, 0
	jal	zero, .L163
.L208:
	sb	a7,2(a5)
	addi	t4, zero, 255
	bltu	a4, a3, .L167
.L168:
	addi	t4, a3, 0
	jal	zero, .L167
.L213:
	sb	a7,6(a1)
	addi	a3, zero, 255
	bltu	a4, t3, .L187
.L188:
	addi	a3, t3, 0
	sb	a3,7(a1)
	addi	a5,a5,8
	addi	a1,a1,8
	addi	a2,a2,16
	bne	a5,t1,.L189
.L214:
	jalr	zero, ra, 0
.L215:
	sb	a7,0(a5)
	addi	t4, zero, 255
	bltu	a4, a3, .L159
	addi	t4, a3, 0
	jal	zero, .L159
	.size	upsampleCrH, .-upsampleCrH
	.align	2
	.type	upsampleCrV, @function
upsampleCrV:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	slli	a0,a0,1
	addi	t5,a5,640
	add	t5,t5,a1
	addi	sp,sp,-16
	add	a0,a5,a0
	sw	s0,12(sp)
	add	a1,a5,a1
	addi	t1,a0,528
	addi	t0,t5,64
	addi	t4, zero, 103
	addi	a7, zero, 255
	addi	t6, zero, -1
	addi	t3, zero, 183
.L218:
	addi	a6,t1,-16
	addi	a0, a1, 0
	addi	a2, t5, 0
	jal	zero, .L227
.L238:
	xori	a5, a5, -1
	slli	t2,a5,16
	srai	a3,t2,31
.L221:
	mul	a4,a4,t3
	lbu	a5,0(a0)
	sb	a3,8(a2)
	lbu	a3,8(a0)
	srli	a4,a4,8
	addi	a4,a4,-91
	sub	a5,a5,a4
	slli	a5,a5,16
	sub	a4,a3,a4
	slli	a4,a4,16
	srli	a5,a5,16
	srli	a4,a4,16
	bgeu	a7, a5, .L224
	slli	a3,a5,16
	srai	a3,a3,16
	addi	a5, zero, 0
	bge	a3,zero,.L235
.L224:
	sb	a5,0(a0)
	bgeu	a7, a4, .L226
	xori	a4, a4, -1
	slli	a3,a4,16
	srai	a5,a3,31
.L225:
	sb	a5,8(a0)
	addi	a2,a2,1
	addi	a0,a0,1
	beq	a6,t1,.L236
.L227:
	lbu	a4,0(a6)
	lbu	a3,0(a2)
	lbu	t2,8(a2)
	mul	a5,a4,t4
	addi	s0,a4,-179
	addi	a6,a6,2
	srli	a5,a5,8
	add	a5,a5,s0
	add	a3,a5,a3
	slli	a3,a3,16
	add	a5,a5,t2
	slli	a5,a5,16
	srli	a3,a3,16
	srli	a5,a5,16
	bgeu	a7, a3, .L220
	slli	t2,a3,16
	srai	t2,t2,16
	addi	a3, zero, 0
	bge	t2,zero,.L237
.L220:
	sb	a3,0(a2)
	bltu	a7, a5, .L238
	addi	a3, a5, 0
	jal	zero, .L221
.L235:
	sb	t6,0(a0)
	addi	a5, zero, 255
	bltu	a7, a4, .L225
.L226:
	addi	a5, a4, 0
	sb	a5,8(a0)
	addi	a2,a2,1
	addi	a0,a0,1
	bne	a6,t1,.L227
.L236:
	addi	t5,t5,16
	addi	a1,a1,16
	addi	t1,a6,16
	bne	t5,t0,.L218
	lw	s0,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
.L237:
	sb	t6,0(a2)
	addi	a3, zero, 255
	bltu	a7, a5, .L221
	addi	a3, a5, 0
	jal	zero, .L221
	.size	upsampleCrV, .-upsampleCrV
	.align	2
	.globl	pjpeg_need_bytes_callback
	.type	pjpeg_need_bytes_callback, @function
pjpeg_need_bytes_callback:
	lui	t3,%hi(jpeg_off)
	lw	a4,%lo(jpeg_off)(t3)
	addi	a6, zero, 570
	sub	a6,a6,a4
	bgeu	a1, a6, .L240
	addi	a6, a1, 0
.L240:
	beq	a6,zero,.L241
	lui	a5,%hi(.LANCHOR1)
	addi	a5,a5,%lo(.LANCHOR1)
	add	a3,a5,a4
	addi	a5,a6,-1
	addi	a4, zero, 5
	bgeu	a4, a5, .L242
	or	a5,a3,a0
	andi	a5,a5,3
	bne	a5,zero,.L242
	andi	t1,a6,-4
	add	a7,a3,t1
	addi	a5, a3, 0
	addi	a4, a0, 0
.L243:
	lw	a1,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a1,-4(a4)
	bne	a7,a5,.L243
	beq	a6,t1,.L241
	lbu	a1,0(a7)
	add	a4,a0,t1
	addi	a5,t1,1
	sb	a1,0(a4)
	bgeu	a5, a6, .L241
	add	a4,a3,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	t1,t1,2
	sb	a4,0(a5)
	bgeu	t1, a6, .L241
	add	a5,a3,t1
	lbu	a5,0(a5)
	add	t1,a0,t1
	sb	a5,0(t1)
.L241:
	sb	a6,0(a2)
	lw	a5,%lo(jpeg_off)(t3)
	addi	a0, zero, 0
	add	a5,a5,a6
	sw	a5,%lo(jpeg_off)(t3)
	jalr	zero, ra, 0
.L242:
	addi	a5, a3, 0
	add	a3,a3,a6
.L245:
	lbu	a4,0(a5)
	addi	a5,a5,1
	addi	a0,a0,1
	sb	a4,-1(a0)
	bne	a3,a5,.L245
	sb	a6,0(a2)
	lw	a5,%lo(jpeg_off)(t3)
	addi	a0, zero, 0
	add	a5,a5,a6
	sw	a5,%lo(jpeg_off)(t3)
	jalr	zero, ra, 0
	.size	pjpeg_need_bytes_callback, .-pjpeg_need_bytes_callback
	.align	2
	.type	getChar, @function
getChar:
	lui	a6,%hi(gInBufLeft)
	lbu	a4,%lo(gInBufLeft)(a6)
	addi	sp,sp,-32
	sw	ra,28(sp)
	beq	a4,zero,.L261
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lui	a7,%hi(gInBufOfs)
.L253:
	lbu	a3,%lo(gInBufOfs)(a7)
	lw	ra,28(sp)
	addi	a4,a4,-1
	add	a5,a5,a3
	addi	a3,a3,1
	sb	a4,%lo(gInBufLeft)(a6)
	sb	a3,%lo(gInBufOfs)(a7)
	lbu	a0,896(a5)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L261:
	lui	a3,%hi(g_pCallback_data)
	lui	a4,%hi(g_pNeedBytesCallback)
	lw	a3,%lo(g_pCallback_data)(a3)
	lw	a4,%lo(g_pNeedBytesCallback)(a4)
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lui	a7,%hi(gInBufOfs)
	addi	a2, zero, 4
	sb	a2,%lo(gInBufOfs)(a7)
	addi	a0,a5,900
	addi	a2,a6,%lo(gInBufLeft)
	addi	a1, zero, 252
	sw	a5,12(sp)
	sw	a7,8(sp)
	sb	zero,%lo(gInBufLeft)(a6)
	jalr	ra, a4, 0
	lw	a7,8(sp)
	lw	a5,12(sp)
	lui	a6,%hi(gInBufLeft)
	beq	a0,zero,.L254
	lui	a4,%hi(gCallbackStatus)
	sb	a0,%lo(gCallbackStatus)(a4)
.L254:
	lbu	a4,%lo(gInBufLeft)(a6)
	bne	a4,zero,.L253
	lui	a4,%hi(gTemFlag)
	lbu	a5,%lo(gTemFlag)(a4)
	lw	ra,28(sp)
	xori	a5,a5,255
	sltiu	a0, a5, 1
	sub	a0, zero, a0
	andi	a0,a0,-38
	sb	a5,%lo(gTemFlag)(a4)
	addi	a0,a0,255
	addi	sp,sp,32
	jalr	zero, ra, 0
	.size	getChar, .-getChar
	.align	2
	.type	huffDecode, @function
huffDecode:
	addi	sp,sp,-64
	sw	s6,32(sp)
	sw	s7,28(sp)
	lui	s6,%hi(gBitsLeft)
	lui	s7,%hi(gBitBuf)
	lhu	a5,%lo(gBitBuf)(s7)
	lbu	a4,%lo(gBitsLeft)(s6)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s10,16(sp)
	sw	ra,60(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s8,24(sp)
	sw	s9,20(sp)
	addi	s0, a0, 0
	addi	s10, a1, 0
	srli	s1,a5,15
	beq	a4,zero,.L288
.L264:
	slli	a0,a5,1
	slli	a0,a0,16
	addi	a5,a4,-1
	srli	a0,a0,16
	andi	a5,a5,0xff
	lui	s8, 1048560
	sh	a0,%lo(gBitBuf)(s7)
	sb	a5,%lo(gBitsLeft)(s6)
	addi	a4, s1, 0
	addi	s8,s8,1
	addi	s4,s0,32
	addi	s3, zero, 0
	addi	s2, zero, 255
	addi	s9, zero, 16
	jal	zero, .L275
.L270:
	slli	a0,a0,1
	slli	a0,a0,16
	addi	a5,a5,-1
	srli	a0,a0,16
	andi	a5,a5,0xff
	or	a4,s1,s5
	slli	a4,a4,16
	sh	a0,%lo(gBitBuf)(s7)
	sb	a5,%lo(gBitsLeft)(s6)
	addi	s3,s3,1
	srli	a4,a4,16
	addi	s4,s4,2
	beq	s3,s9,.L289
.L275:
	lhu	a3,0(s4)
	srli	a2,a0,15
	slli	s5,a4,1
	add	a1,a3,s8
	bltu	a3,a4,.L277
	bne	a1,zero,.L268
.L277:
	andi	s1,a2,0xff
	bne	a5,zero,.L270
.Lpcrel_1:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_1)
	addi	a5, a0, 0
	beq	a0,s2,.L290
.L272:
	lhu	a3,%lo(gBitBuf)(s7)
	lbu	a4,%lo(gBitsLeft)(s6)
	or	a0,a5,a3
	addi	a5,a4,8
	jal	zero, .L270
.L290:
	sw	a0,12(sp)
.Lpcrel_2:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_2)
	lui	a4,%hi(.LANCHOR0)
	lw	a5,12(sp)
	lui	a7,%hi(gInBufOfs)
	lui	a1,%hi(gInBufLeft)
	addi	a4,a4,%lo(.LANCHOR0)
	addi	t1, zero, -1
	beq	a0,zero,.L272
	lbu	a3,%lo(gInBufOfs)(a7)
	lbu	a6,%lo(gInBufLeft)(a1)
	add	a2,a3,t1
	andi	a2,a2,0xff
	addi	a3,a3,-2
	add	a2,a4,a2
	andi	a3,a3,0xff
	sb	a0,896(a2)
	add	a4,a4,a3
	addi	a6,a6,2
	sb	t1,896(a4)
	sb	a3,%lo(gInBufOfs)(a7)
	sb	a6,%lo(gInBufLeft)(a1)
	jal	zero, .L272
.L289:
	addi	a0, zero, 0
.L274:
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	lw	s2,48(sp)
	lw	s3,44(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	lw	s6,32(sp)
	lw	s7,28(sp)
	lw	s8,24(sp)
	lw	s9,20(sp)
	lw	s10,16(sp)
	addi	sp,sp,64
	jalr	zero, ra, 0
.L268:
	add	a5,s0,s3
	slli	s3,s3,1
	lbu	a5,64(a5)
	add	s0,s0,s3
	lhu	a3,0(s0)
	add	a5,a5,a4
	sub	a5,a5,a3
	andi	a5,a5,0xff
	add	a5,s10,a5
	lbu	a0,0(a5)
	jal	zero, .L274
.L288:
.Lpcrel_3:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_3)
	addi	a4, zero, 255
	addi	s2, a0, 0
	beq	a0,a4,.L291
.L266:
	lhu	a3,%lo(gBitBuf)(s7)
	lbu	a4,%lo(gBitsLeft)(s6)
	or	a5,s2,a3
	addi	a4,a4,8
	jal	zero, .L264
.L291:
.Lpcrel_4:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_4)
	beq	a0,zero,.L266
	lui	a7,%hi(gInBufOfs)
	lbu	a4,%lo(gInBufOfs)(a7)
	lui	a6,%hi(gInBufLeft)
	lbu	a1,%lo(gInBufLeft)(a6)
	addi	a2,a4,-1
	lui	a3,%hi(.LANCHOR0)
	addi	a3,a3,%lo(.LANCHOR0)
	addi	a4,a4,-2
	andi	a2,a2,0xff
	add	a2,a3,a2
	andi	a4,a4,0xff
	sb	a0,896(a2)
	add	a3,a3,a4
	addi	a2, zero, -1
	addi	a1,a1,2
	sb	a4,%lo(gInBufOfs)(a7)
	sb	a2,896(a3)
	sb	a1,%lo(gInBufLeft)(a6)
	jal	zero, .L266
	.size	huffDecode, .-huffDecode
	.align	2
	.type	getBits.constprop.0, @function
getBits.constprop.0:
	lui	a2,%hi(gBitsLeft)
	lbu	a5,%lo(gBitsLeft)(a2)
	lui	a4,%hi(gBitBuf)
	addi	a1, zero, 7
	lhu	a3,%lo(gBitBuf)(a4)
	bgeu	a1, a5, .L309
	slli	a0,a3,8
	addi	a5,a5,-8
	sh	a0,%lo(gBitBuf)(a4)
	sb	a5,%lo(gBitsLeft)(a2)
	srli	a0,a3,8
	jalr	zero, ra, 0
.L309:
	addi	sp,sp,-32
	sll	a5,a3,a5
	sh	a5,%lo(gBitBuf)(a4)
	sw	s0,24(sp)
	sw	a3,8(sp)
	sw	ra,28(sp)
	addi	s0, a0, 0
.Lpcrel_5:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_5)
	addi	a1,a0,-255
	lw	a3,8(sp)
	addi	a5, a0, 0
	lui	a4,%hi(gBitBuf)
	lui	a2,%hi(gBitsLeft)
	bne	a1,zero,.L296
	andi	a0,s0,1
	bne	a0,zero,.L310
.L296:
	lbu	a0,%lo(gBitsLeft)(a2)
	lhu	a1,%lo(gBitBuf)(a4)
	addi	a2, zero, 8
	lw	ra,28(sp)
	lw	s0,24(sp)
	sub	a2,a2,a0
	or	a0,a5,a1
	sll	a0,a0,a2
	sh	a0,%lo(gBitBuf)(a4)
	srli	a0,a3,8
	addi	sp,sp,32
	jalr	zero, ra, 0
.L310:
	sw	a5,12(sp)
.Lpcrel_6:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_6)
	lw	a3,8(sp)
	lw	a5,12(sp)
	lui	a4,%hi(gBitBuf)
	lui	a2,%hi(gBitsLeft)
	beq	a0,zero,.L296
	lui	t4,%hi(gInBufOfs)
	lbu	a1,%lo(gInBufOfs)(t4)
	lui	t3,%hi(gInBufLeft)
	lbu	t1,%lo(gInBufLeft)(t3)
	addi	a7,a1,-1
	lui	a6,%hi(.LANCHOR0)
	addi	a6,a6,%lo(.LANCHOR0)
	addi	a1,a1,-2
	andi	a7,a7,0xff
	andi	a1,a1,0xff
	add	a7,a6,a7
	sb	a0,896(a7)
	add	a6,a6,a1
	addi	a0, zero, -1
	addi	t1,t1,2
	sb	a1,%lo(gInBufOfs)(t4)
	sb	a0,896(a6)
	sb	t1,%lo(gInBufLeft)(t3)
	jal	zero, .L296
	.size	getBits.constprop.0, .-getBits.constprop.0
	.align	2
	.type	getBits, @function
getBits:
	lui	a7,%hi(gBitBuf)
	lhu	a4,%lo(gBitBuf)(a7)
	addi	sp,sp,-48
	addi	a6, a0, 0
	lui	t1,%hi(gBitsLeft)
	sw	ra,44(sp)
	addi	a0, zero, 8
	lbu	a3,%lo(gBitsLeft)(t1)
	addi	a5, a4, 0
	addi	a2, a6, 0
	bltu	a0, a6, .L338
	bltu	a3, a2, .L339
.L317:
	sll	a5,a5,a2
	sh	a5,%lo(gBitBuf)(a7)
	addi	a5, zero, 16
	lw	ra,44(sp)
	sub	a5,a5,a6
	sub	a3,a3,a2
	sra	a0,a4,a5
	sb	a3,%lo(gBitsLeft)(t1)
	slli	a0,a0,16
	srli	a0,a0,16
	addi	sp,sp,48
	jalr	zero, ra, 0
.L338:
	addi	a2,a6,-8
	sll	a3,a4,a3
	andi	a2,a2,0xff
	sh	a3,%lo(gBitBuf)(a7)
	sw	a1,24(sp)
	sw	a4,20(sp)
	sw	a6,16(sp)
	sw	a2,12(sp)
.Lpcrel_7:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_7)
	addi	a3,a0,-255
	lw	a2,12(sp)
	lw	a6,16(sp)
	lw	a4,20(sp)
	lw	a1,24(sp)
	addi	a5, a0, 0
	lui	a7,%hi(gBitBuf)
	lui	t1,%hi(gBitsLeft)
	bne	a3,zero,.L315
	andi	a3,a1,1
	bne	a3,zero,.L340
.L315:
	lbu	a3,%lo(gBitsLeft)(t1)
	lhu	t3,%lo(gBitBuf)(a7)
	addi	a0, zero, 8
	sub	a0,a0,a3
	or	a5,a5,t3
	sll	a5,a5,a0
	slli	a5,a5,16
	srli	a5,a5,16
	andi	a4,a4,-256
	srli	a0,a5,8
	or	a4,a0,a4
	bgeu	a3, a2, .L317
.L339:
	sll	a5,a5,a3
	sh	a5,%lo(gBitBuf)(a7)
	sw	a6,20(sp)
	sw	a4,16(sp)
	sw	a2,12(sp)
	sw	a1,24(sp)
.Lpcrel_8:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_8)
	addi	a3,a0,-255
	lw	a2,12(sp)
	lw	a4,16(sp)
	lw	a6,20(sp)
	addi	a5, a0, 0
	lui	a7,%hi(gBitBuf)
	lui	t1,%hi(gBitsLeft)
	bne	a3,zero,.L320
	lw	a1,24(sp)
	andi	a1,a1,1
	bne	a1,zero,.L341
.L320:
	lbu	a3,%lo(gBitsLeft)(t1)
	lhu	a0,%lo(gBitBuf)(a7)
	lw	ra,44(sp)
	sub	a1,a2,a3
	or	a5,a5,a0
	sll	a5,a5,a1
	sh	a5,%lo(gBitBuf)(a7)
	addi	a5, zero, 16
	addi	a3,a3,8
	sub	a5,a5,a6
	sub	a3,a3,a2
	sra	a0,a4,a5
	sb	a3,%lo(gBitsLeft)(t1)
	slli	a0,a0,16
	srli	a0,a0,16
	addi	sp,sp,48
	jalr	zero, ra, 0
.L341:
	sw	a0,24(sp)
.Lpcrel_9:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_9)
	lw	a2,12(sp)
	lw	a4,16(sp)
	lw	a6,20(sp)
	lw	a5,24(sp)
	lui	a7,%hi(gBitBuf)
	lui	t1,%hi(gBitsLeft)
	beq	a0,zero,.L320
	lui	t6,%hi(gInBufOfs)
	lbu	a3,%lo(gInBufOfs)(t6)
	lui	t5,%hi(gInBufLeft)
	lbu	t4,%lo(gInBufLeft)(t5)
	addi	t3,a3,-1
	lui	a1,%hi(.LANCHOR0)
	addi	a1,a1,%lo(.LANCHOR0)
	addi	a3,a3,-2
	andi	t3,t3,0xff
	andi	a3,a3,0xff
	add	t3,a1,t3
	sb	a0,896(t3)
	add	a1,a1,a3
	addi	a0, zero, -1
	addi	t4,t4,2
	sb	a3,%lo(gInBufOfs)(t6)
	sb	a0,896(a1)
	sb	t4,%lo(gInBufLeft)(t5)
	jal	zero, .L320
.L340:
	sw	a6,20(sp)
	sw	a4,16(sp)
	sw	a0,28(sp)
.Lpcrel_10:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_10)
	lw	a2,12(sp)
	lw	a4,16(sp)
	lw	a6,20(sp)
	lw	a1,24(sp)
	lw	a5,28(sp)
	lui	a7,%hi(gBitBuf)
	lui	t1,%hi(gBitsLeft)
	beq	a0,zero,.L315
	lui	t0,%hi(gInBufOfs)
	lbu	a3,%lo(gInBufOfs)(t0)
	lui	t6,%hi(gInBufLeft)
	lbu	t5,%lo(gInBufLeft)(t6)
	addi	t4,a3,-1
	lui	t3,%hi(.LANCHOR0)
	addi	t3,t3,%lo(.LANCHOR0)
	addi	a3,a3,-2
	andi	t4,t4,0xff
	andi	a3,a3,0xff
	add	t4,t3,t4
	sb	a0,896(t4)
	add	t3,t3,a3
	addi	a0, zero, -1
	addi	t5,t5,2
	sb	a3,%lo(gInBufOfs)(t0)
	sb	a0,896(t3)
	sb	t5,%lo(gInBufLeft)(t6)
	jal	zero, .L315
	.size	getBits, .-getBits
	.align	2
	.type	getBits.constprop.1, @function
getBits.constprop.1:
	addi	sp,sp,-16
	sw	s1,4(sp)
	sw	s2,0(sp)
	lui	s1,%hi(gBitBuf)
	lui	s2,%hi(gBitsLeft)
	lbu	a5,%lo(gBitsLeft)(s2)
	sw	s0,8(sp)
	lhu	s0,%lo(gBitBuf)(s1)
	sw	ra,12(sp)
	sll	a5,s0,a5
	sh	a5,%lo(gBitBuf)(s1)
.Lpcrel_11:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_11)
	lhu	a5,%lo(gBitBuf)(s1)
	lbu	a4,%lo(gBitsLeft)(s2)
	addi	a3, zero, 8
	or	a5,a0,a5
	sub	a2,a3,a4
	sll	a5,a5,a2
	slli	a5,a5,16
	srli	a5,a5,16
	andi	s0,s0,-256
	srli	a1,a5,8
	addi	a2, zero, 7
	or	s0,s0,a1
	bgeu	a2, a4, .L346
	addi	a4,a4,-8
	sb	a4,%lo(gBitsLeft)(s2)
	slli	a5,a5,8
.L344:
	lw	ra,12(sp)
	addi	a0, s0, 0
	lw	s0,8(sp)
	sh	a5,%lo(gBitBuf)(s1)
	lw	s2,0(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
.L346:
	sll	a5,a5,a4
	sh	a5,%lo(gBitBuf)(s1)
.Lpcrel_12:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_12)
	lbu	a4,%lo(gBitsLeft)(s2)
	lhu	a5,%lo(gBitBuf)(s1)
	addi	a3, zero, 8
	sub	a3,a3,a4
	or	a5,a0,a5
	sll	a5,a5,a3
	jal	zero, .L344
	.size	getBits.constprop.1, .-getBits.constprop.1
	.align	2
	.type	getBits.constprop.2, @function
getBits.constprop.2:
	lui	a6,%hi(gBitBuf)
	lhu	a4,%lo(gBitBuf)(a6)
	addi	sp,sp,-32
	addi	a1, a0, 0
	lui	a7,%hi(gBitsLeft)
	sw	ra,28(sp)
	addi	a0, zero, 8
	lbu	a3,%lo(gBitsLeft)(a7)
	addi	a5, a4, 0
	addi	a2, a1, 0
	bltu	a0, a1, .L366
	bltu	a3, a2, .L367
.L352:
	sll	a5,a5,a2
	sh	a5,%lo(gBitBuf)(a6)
	addi	a5, zero, 16
	lw	ra,28(sp)
	sub	a5,a5,a1
	sub	a3,a3,a2
	sra	a0,a4,a5
	sb	a3,%lo(gBitsLeft)(a7)
	slli	a0,a0,16
	srli	a0,a0,16
	addi	sp,sp,32
	jalr	zero, ra, 0
.L366:
	addi	a2,a1,-8
	sll	a3,a4,a3
	andi	a2,a2,0xff
	sh	a3,%lo(gBitBuf)(a6)
	sw	a4,8(sp)
	sw	a1,4(sp)
	sw	a2,0(sp)
.Lpcrel_13:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_13)
	addi	a3, zero, 255
	lw	a2,0(sp)
	lw	a1,4(sp)
	lw	a4,8(sp)
	addi	a5, a0, 0
	lui	a6,%hi(gBitBuf)
	lui	a7,%hi(gBitsLeft)
	beq	a0,a3,.L368
.L350:
	lhu	t1,%lo(gBitBuf)(a6)
	lbu	a3,%lo(gBitsLeft)(a7)
	addi	a0, zero, 8
	or	a5,a5,t1
	sub	a0,a0,a3
	sll	a5,a5,a0
	slli	a5,a5,16
	srli	a5,a5,16
	andi	a4,a4,-256
	srli	t1,a5,8
	or	a4,a4,t1
	bgeu	a3, a2, .L352
.L367:
	sll	a5,a5,a3
	sh	a5,%lo(gBitBuf)(a6)
	sw	a1,8(sp)
	sw	a2,4(sp)
	sw	a4,0(sp)
.Lpcrel_14:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_14)
	addi	a3, zero, 255
	lw	a4,0(sp)
	lw	a2,4(sp)
	lw	a1,8(sp)
	addi	a5, a0, 0
	lui	a6,%hi(gBitBuf)
	lui	a7,%hi(gBitsLeft)
	beq	a0,a3,.L369
.L354:
	lbu	a3,%lo(gBitsLeft)(a7)
	lhu	t1,%lo(gBitBuf)(a6)
	lw	ra,28(sp)
	sub	a0,a2,a3
	or	a5,a5,t1
	sll	a5,a5,a0
	sh	a5,%lo(gBitBuf)(a6)
	addi	a5, zero, 16
	addi	a3,a3,8
	sub	a5,a5,a1
	sub	a3,a3,a2
	sra	a0,a4,a5
	sb	a3,%lo(gBitsLeft)(a7)
	slli	a0,a0,16
	srli	a0,a0,16
	addi	sp,sp,32
	jalr	zero, ra, 0
.L368:
	sw	a1,8(sp)
	sw	a2,4(sp)
	sw	a4,0(sp)
	sw	a0,12(sp)
.Lpcrel_15:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_15)
	lw	a4,0(sp)
	lw	a2,4(sp)
	lw	a1,8(sp)
	lw	a5,12(sp)
	lui	a6,%hi(gBitBuf)
	lui	a7,%hi(gBitsLeft)
	beq	a0,zero,.L350
	lui	t6,%hi(gInBufOfs)
	lbu	a3,%lo(gInBufOfs)(t6)
	lui	t5,%hi(gInBufLeft)
	lbu	t4,%lo(gInBufLeft)(t5)
	addi	t3,a3,-1
	lui	t1,%hi(.LANCHOR0)
	addi	t1,t1,%lo(.LANCHOR0)
	addi	a3,a3,-2
	andi	t3,t3,0xff
	andi	a3,a3,0xff
	add	t3,t1,t3
	sb	a0,896(t3)
	add	t1,t1,a3
	addi	a0, zero, -1
	addi	t4,t4,2
	sb	a3,%lo(gInBufOfs)(t6)
	sb	a0,896(t1)
	sb	t4,%lo(gInBufLeft)(t5)
	jal	zero, .L350
.L369:
	sw	a0,12(sp)
.Lpcrel_16:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_16)
	lw	a4,0(sp)
	lw	a2,4(sp)
	lw	a1,8(sp)
	lw	a5,12(sp)
	lui	a6,%hi(gBitBuf)
	lui	a7,%hi(gBitsLeft)
	beq	a0,zero,.L354
	lui	t6,%hi(gInBufOfs)
	lbu	a3,%lo(gInBufOfs)(t6)
	lui	t5,%hi(gInBufLeft)
	lbu	t4,%lo(gInBufLeft)(t5)
	addi	t3,a3,-1
	lui	t1,%hi(.LANCHOR0)
	addi	t1,t1,%lo(.LANCHOR0)
	addi	a3,a3,-2
	andi	t3,t3,0xff
	andi	a3,a3,0xff
	add	t3,t1,t3
	sb	a0,896(t3)
	add	t1,t1,a3
	addi	a0, zero, -1
	addi	t4,t4,2
	sb	a3,%lo(gInBufOfs)(t6)
	sb	a0,896(t1)
	sb	t4,%lo(gInBufLeft)(t5)
	jal	zero, .L354
	.size	getBits.constprop.2, .-getBits.constprop.2
	.align	2
	.type	decodeNextMCU, @function
decodeNextMCU:
	addi	sp,sp,-96
	sw	s2,80(sp)
	lui	s2,%hi(gRestartInterval)
	lhu	a5,%lo(gRestartInterval)(s2)
	sw	ra,92(sp)
	sw	s0,88(sp)
	sw	s1,84(sp)
	sw	s3,76(sp)
	beq	a5,zero,.L371
	lui	s3,%hi(gRestartsLeft)
	lhu	a5,%lo(gRestartsLeft)(s3)
	beq	a5,zero,.L664
.L372:
	addi	a5,a5,-1
	sh	a5,%lo(gRestartsLeft)(s3)
.L371:
	lui	a5,%hi(gMaxBlocksPerMCU)
	lbu	a5,%lo(gMaxBlocksPerMCU)(a5)
	beq	a5,zero,.L582
	lui	a5,%hi(.LANCHOR1)
	sw	s10,48(sp)
	lui	s10,%hi(gCompDCTab)
	sw	s11,44(sp)
	lui	a0,%hi(gCompQuant)
	addi	s11,a5,%lo(.LANCHOR1)
	addi	a5,s10,%lo(gCompDCTab)
	lui	a1,%hi(gCompACTab)
	sw	a5,0(sp)
	addi	a5,a0,%lo(gCompQuant)
	lui	a2,%hi(.LANCHOR2)
	sw	a5,4(sp)
	addi	a5,a1,%lo(gCompACTab)
	lui	a4,%hi(gLastDC)
	lui	a3,%hi(.L546)
	sw	a5,8(sp)
	addi	a5,a2,%lo(.LANCHOR2)
	sw	s9,52(sp)
	lui	s0,%hi(.LANCHOR0)
	lui	s9,%hi(gMCUOrg)
	addi	t4,a4,%lo(gLastDC)
	sw	a5,16(sp)
	addi	a5,a3,%lo(.L546)
	sw	s6,64(sp)
	sw	s8,56(sp)
	sw	s4,72(sp)
	sw	s5,68(sp)
	sw	s7,60(sp)
	addi	s9,s9,%lo(gMCUOrg)
	addi	s0,s0,%lo(.LANCHOR0)
	sw	a5,28(sp)
	addi	s6, zero, 0
	addi	s8, zero, 196
	sw	t4,12(sp)
.L580:
	lbu	s2,0(s9)
	lw	a5,4(sp)
	addi	s4,s0,1280
	add	a5,a5,s2
	lbu	a4,0(a5)
	lw	a5,0(sp)
	add	a5,a5,s2
	lbu	a5,0(a5)
	beq	a4,zero,.L378
	addi	s4,s0,1152
.L378:
	beq	a5,zero,.L585
	addi	a0,s0,1408
	addi	a1,s0,1488
.Lpcrel_17:
	auipc	ra, %pcrel_hi(huffDecode)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_17)
	addi	s1, a0, 0
	andi	a0,a0,15
	addi	a4, zero, 0
	bne	a0,zero,.L665
.L381:
	lw	a5,12(sp)
	slli	a3,s2,1
	lhu	a2,0(s4)
	add	a3,a5,a3
	lhu	a5,0(a3)
	lui	a1,%hi(gReduce)
	lbu	a1,%lo(gReduce)(a1)
	add	a4,a4,a5
	mul	a2,a4,a2
	lw	a5,8(sp)
	sh	a4,0(a3)
	add	a5,a5,s2
	lbu	a5,0(a5)
	sh	a2,512(s0)
	beq	a1,zero,.L382
	beq	a5,zero,.L383
	lw	a5,16(sp)
	addi	s3,s0,1600
	addi	s4,a5,-1984
.L386:
	addi	s1, zero, 1
	addi	s5, zero, 15
	addi	s7, zero, 48
	addi	s2, zero, 63
	jal	zero, .L395
.L387:
	bne	s10,s5,.L396
	bltu	s7, s1, .L394
	addi	s1,s1,15
.L389:
	addi	s1,s1,1
	andi	s1,s1,0xff
	bltu	s2, s1, .L396
.L395:
	addi	a1, s3, 0
	addi	a0, s4, 0
.Lpcrel_18:
	auipc	ra, %pcrel_hi(huffDecode)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_18)
	srli	s10,a0,4
	andi	a0,a0,15
	andi	s10,s10,0xff
	beq	a0,zero,.L387
.Lpcrel_19:
	auipc	ra, %pcrel_hi(getBits.constprop.2)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_19)
	beq	s10,zero,.L389
	add	s1,s1,s10
	bge	s2, s1, .L389
.L394:
	lw	s4,72(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	lw	s7,60(sp)
	lw	s8,56(sp)
	lw	s9,52(sp)
	lw	s10,48(sp)
	lw	s11,44(sp)
	addi	a0, zero, 28
.L655:
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s1,84(sp)
	lw	s2,80(sp)
	lw	s3,76(sp)
	addi	sp,sp,96
	jalr	zero, ra, 0
.L382:
	beq	a5,zero,.L505
	lw	a5,16(sp)
	addi	s2,s0,1600
	addi	s3,a5,-1984
.L508:
	addi	s10, zero, 1
	addi	s5, zero, 15
	addi	s7, zero, 48
	addi	s1, zero, 63
	sw	s6,20(sp)
	sw	s9,24(sp)
	jal	zero, .L517
.L509:
	bne	s9,s5,.L666
	bltu	s7, s10, .L394
	addi	a3,s10,1
	add	a5,s11,s10
	addi	a4,s10,2
	andi	a3,a3,0xff
	lb	a2,636(a5)
	add	a3,s11,a3
	andi	a4,a4,0xff
	lb	a3,636(a3)
	add	a4,s11,a4
	addi	a5,s10,3
	lb	a4,636(a4)
	andi	a5,a5,0xff
	slli	a2,a2,1
	add	a2,s0,a2
	add	a5,s11,a5
	slli	a3,a3,1
	sh	zero,512(a2)
	add	a3,s0,a3
	addi	a2,s10,4
	lb	a5,636(a5)
	slli	a4,a4,1
	sh	zero,512(a3)
	add	a4,s0,a4
	addi	a3,s10,5
	andi	a2,a2,0xff
	sh	zero,512(a4)
	add	a2,s11,a2
	addi	a4,s10,6
	andi	a3,a3,0xff
	lb	a2,636(a2)
	add	a3,s11,a3
	slli	a5,a5,1
	andi	a4,a4,0xff
	add	a5,s0,a5
	lb	a3,636(a3)
	add	a4,s11,a4
	sh	zero,512(a5)
	lb	a4,636(a4)
	addi	a5,s10,7
	slli	a2,a2,1
	andi	a5,a5,0xff
	add	a2,s0,a2
	add	a5,s11,a5
	slli	a3,a3,1
	sh	zero,512(a2)
	add	a3,s0,a3
	addi	a2,s10,8
	lb	a5,636(a5)
	slli	a4,a4,1
	sh	zero,512(a3)
	add	a4,s0,a4
	addi	a3,s10,9
	andi	a2,a2,0xff
	sh	zero,512(a4)
	add	a2,s11,a2
	addi	a4,s10,10
	andi	a3,a3,0xff
	lb	a2,636(a2)
	add	a3,s11,a3
	slli	a5,a5,1
	andi	a4,a4,0xff
	add	a5,s0,a5
	lb	a3,636(a3)
	add	a4,s11,a4
	sh	zero,512(a5)
	lb	a4,636(a4)
	addi	a5,s10,11
	slli	a2,a2,1
	andi	a5,a5,0xff
	add	a2,s0,a2
	add	a5,s11,a5
	slli	a3,a3,1
	sh	zero,512(a2)
	add	a3,s0,a3
	addi	a2,s10,12
	lb	a5,636(a5)
	slli	a4,a4,1
	sh	zero,512(a3)
	add	a4,s0,a4
	addi	a3,s10,13
	andi	a2,a2,0xff
	sh	zero,512(a4)
	add	a2,s11,a2
	addi	a4,s10,14
	andi	a3,a3,0xff
	lb	a2,636(a2)
	add	a3,s11,a3
	slli	a5,a5,1
	andi	a4,a4,0xff
	addi	s10,s10,15
	andi	s10,s10,0xff
	add	a5,s0,a5
	lb	a3,636(a3)
	add	a4,s11,a4
	sh	zero,512(a5)
	lb	a4,636(a4)
	add	a5,s11,s10
	lb	a5,636(a5)
	slli	a2,a2,1
	add	a2,s0,a2
	slli	a3,a3,1
	sh	zero,512(a2)
	add	a3,s0,a3
	slli	a4,a4,1
	sh	zero,512(a3)
	add	a4,s0,a4
	slli	a5,a5,1
	sh	zero,512(a4)
	add	a5,s0,a5
	addi	s10,s10,1
	sh	zero,512(a5)
	andi	s10,s10,0xff
	bltu	s1, s10, .L667
.L517:
	addi	a1, s2, 0
	addi	a0, s3, 0
.Lpcrel_20:
	auipc	ra, %pcrel_hi(huffDecode)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_20)
	srli	a5,a0,4
	andi	s6,a0,15
	andi	s9,a5,0xff
	beq	s6,zero,.L509
	addi	a0, s6, 0
.Lpcrel_21:
	auipc	ra, %pcrel_hi(getBits.constprop.2)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_21)
	bne	s9,zero,.L668
.L511:
	addi	a5,s6,-1
	andi	a5,a5,0xff
	slli	a5,a5,1
	add	a5,s11,a5
	lhu	a4,572(a5)
	bgeu	a0, a4, .L515
	lhu	a5,604(a5)
	add	a0,a0,a5
.L515:
	slli	a5,s10,1
	add	a5,s4,a5
	lhu	a4,0(a5)
	add	a5,s11,s10
	lb	a5,636(a5)
	mul	a0,a0,a4
	addi	s10,s10,1
	slli	a5,a5,1
	add	a5,s0,a5
	andi	s10,s10,0xff
	sh	a0,512(a5)
	bgeu	s1, s10, .L517
.L667:
	lw	s6,20(sp)
	lw	s9,24(sp)
.L518:
	addi	a5,s0,512
	addi	a1,s0,640
	addi	a6, zero, 277
	addi	a0, zero, 669
	addi	a2, zero, 362
.L520:
	lh	t1,2(a5)
	lh	t4,4(a5)
	lh	t0,6(a5)
	lh	a3,8(a5)
	lh	t3,10(a5)
	or	a4,t1,t4
	lh	t5,12(a5)
	or	a4,t0,a4
	lh	a7,14(a5)
	or	a4,a3,a4
	or	a4,t3,a4
	or	a4,t5,a4
	or	a4,a7,a4
	lh	t6,0(a5)
	beq	a4,zero,.L521
	sub	s2,t1,a7
	slli	s2,s2,16
	srai	s2,s2,16
	mul	s2,s2,a6
	sub	a4,t3,t0
	sub	t2,a4,t1
	add	t3,t3,t0
	add	t1,t1,a7
	add	t2,a7,t2
	sub	a7,t1,t3
	sub	t0,t4,t5
	slli	s1,a7,16
	slli	t2,t2,16
	add	a7,t4,t5
	sub	t4,t6,a3
	add	a3,t6,a3
	add	t3,t3,t1
	sub	t6,a3,a7
	srai	t2,t2,16
	add	a3,a3,a7
	slli	a4,a4,16
	sub	t5,t4,a7
	mul	t1,t2,s8
	add	t4,t4,a7
	srai	a4,a4,16
	sub	a7,a3,t3
	srai	s1,s1,16
	sh	a7,14(a5)
	add	s3,t3,a3
	slli	t0,t0,16
	addi	a3,s2,128
	srai	t0,t0,16
	mul	a4,a4,a0
	srai	a3,a3,8
	sub	t2,t3,a3
	sub	a3,a3,t3
	addi	t1,t1,128
	srai	t1,t1,8
	add	t2,t1,t2
	sh	s3,0(a5)
	addi	a5,a5,16
	mul	a7,s1,a2
	addi	a4,a4,128
	srai	a4,a4,8
	sub	a4,t1,a4
	mul	t3,t0,a2
	addi	a7,a7,128
	srai	a7,a7,8
	add	a7,t2,a7
	add	a4,a7,a4
	sub	t0,t6,a4
	add	a4,a4,t6
	sh	a4,-8(a5)
	sh	t0,-10(a5)
	addi	a4,t3,128
	srai	a4,a4,8
	add	t5,a4,t5
	sub	t4,t4,a4
	add	a3,t5,a3
	add	a4,a7,t4
	sub	a3,a3,t1
	add	t2,t2,t5
	sub	t4,t4,a7
	sh	t2,-4(a5)
	sh	a3,-14(a5)
	sh	a4,-12(a5)
	sh	t4,-6(a5)
	bne	a5,a1,.L520
.L523:
	addi	a5,s0,512
	addi	a6, zero, 277
	addi	a0, zero, 669
	addi	a1, zero, 362
	addi	a3, zero, 255
	addi	a2,s0,528
	jal	zero, .L544
.L670:
	addi	a7,t2,64
	srli	a7,a7,7
	addi	a7,a7,128
	slli	a4,a7,16
	srli	a4,a4,16
	andi	a7,a7,0xff
	bgeu	a3, a4, .L526
	xori	a4, a4, -1
	slli	a7,a4,16
	srai	a4,a7,31
	andi	a7,a4,0xff
.L526:
	addi	t0, a7, 0
	addi	t6, a7, 0
	addi	t5, a7, 0
	addi	t4, a7, 0
	addi	a4, a7, 0
	addi	t1, a7, 0
	addi	t3, a7, 0
.L527:
	sh	t0,0(a5)
	sh	t6,16(a5)
	sh	t5,32(a5)
	sh	t4,48(a5)
	sh	a4,64(a5)
	sh	t1,80(a5)
	sh	t3,96(a5)
	sh	a7,112(a5)
	addi	a5,a5,2
	beq	a5,a2,.L669
.L544:
	lh	t6,16(a5)
	lh	t0,32(a5)
	lh	t4,48(a5)
	lh	t5,64(a5)
	lh	s2,80(a5)
	or	a4,t0,t6
	lh	t3,96(a5)
	or	a4,t4,a4
	lh	a7,112(a5)
	or	a4,t5,a4
	or	a4,s2,a4
	or	a4,t3,a4
	or	a4,a7,a4
	lh	t2,0(a5)
	beq	a4,zero,.L670
	add	a4,t4,s2
	add	s1,a7,t6
	sub	s2,s2,t4
	sub	s5,s1,a4
	add	s1,s1,a4
	sub	a4,t6,a7
	sub	t1,s2,t6
	slli	s5,s5,16
	slli	a4,a4,16
	add	a7,a7,t1
	srai	s5,s5,16
	srai	a4,a4,16
	sub	t6,t0,t3
	slli	s4,a7,16
	mul	s5,s5,a1
	slli	s2,s2,16
	add	t3,t3,t0
	add	s3,t5,t2
	sub	t1,t2,t5
	srai	s4,s4,16
	srai	s2,s2,16
	slli	t6,t6,16
	add	a7,t3,s3
	sub	t5,t1,t3
	mul	a4,a4,a6
	add	t1,t3,t1
	sub	s3,s3,t3
	srai	t6,t6,16
	slli	t2,s1,16
	slli	a7,a7,16
	srai	t2,t2,16
	srai	a7,a7,16
	addi	s5,s5,128
	add	t0,t2,a7
	mul	t3,s4,s8
	addi	a4,a4,128
	srai	a4,a4,8
	srai	s5,s5,8
	sub	s5,s5,a4
	addi	t0,t0,64
	add	s5,s1,s5
	srli	t0,t0,7
	sub	s1,a4,s1
	addi	t0,t0,128
	mul	s4,s2,a0
	addi	t3,t3,128
	srai	t3,t3,8
	add	a4,t3,s5
	sub	s1,s1,t3
	slli	t4,t0,16
	slli	s2,a4,16
	slli	s3,s3,16
	slli	s1,s1,16
	srli	t4,t4,16
	mul	t6,t6,a1
	addi	s4,s4,128
	srai	s4,s4,8
	sub	t3,t3,s4
	add	a4,a4,t3
	slli	a4,a4,16
	srai	s3,s3,16
	andi	t0,t0,0xff
	srai	s1,s1,16
	srai	s2,s2,16
	addi	t6,t6,128
	srai	t6,t6,8
	add	t3,t6,t5
	sub	t1,t1,t6
	slli	t3,t3,16
	slli	t1,t1,16
	srai	a4,a4,16
	srai	t3,t3,16
	srai	t1,t1,16
	bgeu	a3, t4, .L529
	xori	t4, t4, -1
	slli	t5,t4,16
	srai	t4,t5,31
	andi	t0,t4,0xff
.L529:
	add	t6,s1,t3
	addi	t6,t6,64
	srli	t6,t6,7
	addi	t6,t6,128
	slli	t4,t6,16
	srli	t4,t4,16
	andi	t6,t6,0xff
	bgeu	a3, t4, .L531
	xori	t4, t4, -1
	slli	t5,t4,16
	srai	t4,t5,31
	andi	t6,t4,0xff
.L531:
	add	t5,s2,t1
	addi	t5,t5,64
	srli	t5,t5,7
	addi	t5,t5,128
	slli	t4,t5,16
	srli	t4,t4,16
	andi	t5,t5,0xff
	bgeu	a3, t4, .L533
	xori	t4, t4, -1
	slli	t5,t4,16
	srai	t4,t5,31
	andi	t5,t4,0xff
.L533:
	sub	t4,s3,a4
	addi	t4,t4,64
	srli	t4,t4,7
	addi	t4,t4,128
	slli	s4,t4,16
	srli	s4,s4,16
	andi	t4,t4,0xff
	bgeu	a3, s4, .L535
	xori	s4, s4, -1
	slli	t4,s4,16
	srai	s4,t4,31
	andi	t4,s4,0xff
.L535:
	add	a4,a4,s3
	addi	a4,a4,64
	srli	a4,a4,7
	addi	a4,a4,128
	slli	s3,a4,16
	srli	s3,s3,16
	andi	a4,a4,0xff
	bgeu	a3, s3, .L537
	xori	s3, s3, -1
	slli	a4,s3,16
	srai	s3,a4,31
	andi	a4,s3,0xff
.L537:
	sub	t1,t1,s2
	addi	t1,t1,64
	srli	t1,t1,7
	addi	t1,t1,128
	slli	s2,t1,16
	srli	s2,s2,16
	andi	t1,t1,0xff
	bgeu	a3, s2, .L539
	xori	s2, s2, -1
	slli	t1,s2,16
	srai	s2,t1,31
	andi	t1,s2,0xff
.L539:
	sub	t3,t3,s1
	addi	t3,t3,64
	srli	t3,t3,7
	addi	t3,t3,128
	slli	s1,t3,16
	srli	s1,s1,16
	andi	t3,t3,0xff
	bgeu	a3, s1, .L541
	xori	s1, s1, -1
	slli	t3,s1,16
	srai	s1,t3,31
	andi	t3,s1,0xff
.L541:
	sub	a7,a7,t2
	addi	a7,a7,64
	srli	a7,a7,7
	addi	a7,a7,128
	slli	t2,a7,16
	srli	t2,t2,16
	andi	a7,a7,0xff
	bgeu	a3, t2, .L527
	xori	t2, t2, -1
	slli	a7,t2,16
	srai	t2,a7,31
	andi	a7,t2,0xff
	jal	zero, .L527
.L668:
	add	s10,s9,s10
	blt	s1, s10, .L394
	addi	a5, s9, 0
	andi	s10,s10,0xff
.L514:
	sub	a3,s10,a5
	andi	a3,a3,0xff
	add	a3,s11,a3
	lb	a3,636(a3)
	addi	a5,a5,-1
	slli	a5,a5,16
	slli	a3,a3,1
	add	a3,s0,a3
	srli	a5,a5,16
	sh	zero,512(a3)
	bne	a5,zero,.L514
	jal	zero, .L511
.L585:
	addi	a0,s0,1504
	addi	a1,s0,1584
.Lpcrel_22:
	auipc	ra, %pcrel_hi(huffDecode)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_22)
	addi	s1, a0, 0
	andi	a0,a0,15
	addi	a4, zero, 0
	beq	a0,zero,.L381
.L665:
.Lpcrel_23:
	auipc	ra, %pcrel_hi(getBits.constprop.2)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_23)
	addi	a3,s1,-1
	andi	a3,a3,0xff
	addi	a5, zero, 14
	addi	a4, a0, 0
	bltu	a5, a3, .L381
	lui	a5,%hi(.LANCHOR1)
	slli	a3,a3,1
	addi	a5,a5,%lo(.LANCHOR1)
	add	a5,a5,a3
	lhu	a3,572(a5)
	bgeu	a0, a3, .L381
	lhu	a5,604(a5)
	add	a4,a0,a5
	jal	zero, .L381
.L396:
	lh	a5,512(s0)
	addi	a4, zero, 255
	addi	a5,a5,64
	srli	a5,a5,7
	addi	a5,a5,128
	slli	a5,a5,16
	srli	a5,a5,16
	bgeu	a4, a5, .L671
	xori	a5, a5, -1
	slli	a4,a5,16
	srai	a5,a4,31
	andi	a5,a5,0xff
.L397:
	lui	a4,%hi(gScanType)
	lw	a4,%lo(gScanType)(a4)
	addi	a3, zero, 4
	bltu	a3, a4, .L405
	lui	a3,%hi(.L400)
	slli	a4,a4,2
	addi	a3,a3,%lo(.L400)
	add	a4,a4,a3
	lw	a4,0(a4)
	jalr	zero, a4, 0
	.section	.rodata
	.align	2
	.align	2
.L400:
	.word	.L404
	.word	.L403
	.word	.L402
	.word	.L401
	.word	.L399
	.text
.L619:
	addi	a3,s0,640
	addi	a0, a3, 0
	addi	a1,s0,256
	addi	a2, s0, 0
	addi	a5,s0,512
.L550:
	lhu	a4,0(a5)
	addi	a5,a5,2
	addi	a3,a3,1
	sb	a4,-1(a3)
	sb	a4,0(a2)
	sb	a4,0(a1)
	addi	a2,a2,1
	addi	a1,a1,1
	bne	a5,a0,.L550
.L405:
	lui	a5,%hi(gMaxBlocksPerMCU)
	lbu	a5,%lo(gMaxBlocksPerMCU)(a5)
	addi	s6,s6,1
	andi	s6,s6,0xff
	addi	s9,s9,1
	bltu	s6, a5, .L580
.L672:
	lw	s4,72(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	lw	s7,60(sp)
	lw	s8,56(sp)
	lw	s9,52(sp)
	lw	s10,48(sp)
	lw	s11,44(sp)
.L582:
	addi	a0, zero, 0
	jal	zero, .L655
.L521:
	sh	t6,2(a5)
	sh	t6,4(a5)
	sh	t6,6(a5)
	sh	t6,8(a5)
	sh	t6,10(a5)
	sh	t6,12(a5)
	sh	t6,14(a5)
	addi	a5,a5,16
	bne	a5,a1,.L520
	jal	zero, .L523
.L669:
	lui	a5,%hi(gScanType)
	lw	a5,%lo(gScanType)(a5)
	addi	a4, zero, 4
	bltu	a4, a5, .L405
	lw	a4,28(sp)
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	jalr	zero, a5, 0
	.section	.rodata
	.align	2
	.align	2
.L546:
	.word	.L619
	.word	.L549
	.word	.L548
	.word	.L547
	.word	.L545
	.text
.L505:
	lw	a5,16(sp)
	addi	s2,s0,1856
	addi	s3,a5,-1904
	jal	zero, .L508
.L383:
	lw	a5,16(sp)
	addi	s3,s0,1856
	addi	s4,a5,-1904
	jal	zero, .L386
.L666:
	addi	a4, zero, 63
	sub	a4,a4,s10
	addi	a3,s11,637
	lui	a5,%hi(.LANCHOR1+636)
	lw	s6,20(sp)
	lw	s9,24(sp)
	andi	a4,a4,0xff
	add	a3,a3,s10
	addi	a5,a5,%lo(.LANCHOR1+636)
	add	a3,a3,a4
	add	a5,a5,s10
.L519:
	lb	a4,0(a5)
	addi	a5,a5,1
	slli	a4,a4,1
	add	a4,s0,a4
	sh	zero,512(a4)
	bne	a5,a3,.L519
	jal	zero, .L518
.L671:
	andi	a5,a5,0xff
	jal	zero, .L397
.L545:
	addi	a5, zero, 5
	bltu	a5, s6, .L624
	lui	a4,%hi(.L575)
	addi	a4,a4,%lo(.L575)
	slli	a5,s6,2
	add	a5,a5,a4
	lw	a5,0(a5)
	jalr	zero, a5, 0
	.section	.rodata
	.align	2
	.align	2
.L575:
	.word	.L624
	.word	.L625
	.word	.L626
	.word	.L627
	.word	.L576
	.word	.L574
	.text
.L547:
	addi	a5, zero, 2
	beq	s6,a5,.L563
	bltu	a5, s6, .L564
	beq	s6,zero,.L622
	addi	a1,s0,384
	addi	a2,s0,128
	addi	a3,s0,768
	addi	a5,s0,512
	addi	a0,s0,640
.L566:
	lhu	a4,0(a5)
	addi	a5,a5,2
	addi	a3,a3,1
	sb	a4,-1(a3)
	sb	a4,0(a2)
	sb	a4,0(a1)
	addi	a2,a2,1
	addi	a1,a1,1
	bne	a5,a0,.L566
	jal	zero, .L405
.L549:
	addi	a5, zero, 1
	beq	s6,a5,.L620
	addi	a5, zero, 2
	beq	s6,a5,.L621
	bne	s6,zero,.L405
	addi	a3,s0,640
	addi	a0, a3, 0
	addi	a1,s0,256
	addi	a2, s0, 0
	addi	a5,s0,512
.L553:
	lhu	a4,0(a5)
	addi	a5,a5,2
	addi	a3,a3,1
	sb	a4,-1(a3)
	sb	a4,0(a2)
	sb	a4,0(a1)
	addi	a2,a2,1
	addi	a1,a1,1
	bne	a5,a0,.L553
	jal	zero, .L405
.L548:
	addi	a5, zero, 2
	beq	s6,a5,.L568
	bltu	a5, s6, .L569
	beq	s6,zero,.L623
	addi	a1,s0,320
	addi	a2,s0,64
	addi	a3,s0,704
	addi	a5,s0,512
	addi	a0,s0,640
.L571:
	lhu	a4,0(a5)
	addi	a5,a5,2
	addi	a3,a3,1
	sb	a4,-1(a3)
	sb	a4,0(a2)
	sb	a4,0(a1)
	addi	a2,a2,1
	addi	a1,a1,1
	bne	a5,a0,.L571
	jal	zero, .L405
.L401:
	addi	a4, zero, 2
	beq	s6,a4,.L416
	bltu	a4, s6, .L417
	beq	s6,zero,.L458
.L463:
	sb	a5,768(s0)
	sb	a5,128(s0)
	sb	a5,384(s0)
	jal	zero, .L405
.L399:
	addi	a4, zero, 5
	bltu	a4, s6, .L458
	lui	a3,%hi(.L460)
	addi	a3,a3,%lo(.L460)
	slli	a4,s6,2
	add	a4,a4,a3
	lw	a4,0(a4)
	jalr	zero, a4, 0
	.section	.rodata
	.align	2
	.align	2
.L460:
	.word	.L458
	.word	.L464
	.word	.L463
	.word	.L462
	.word	.L461
	.word	.L459
	.text
.L404:
	sb	a5,640(s0)
	lui	a5,%hi(gMaxBlocksPerMCU)
	lbu	a5,%lo(gMaxBlocksPerMCU)(a5)
	addi	s6,s6,1
	andi	s6,s6,0xff
	addi	s9,s9,1
	bltu	s6, a5, .L580
	jal	zero, .L672
.L403:
	addi	a4, zero, 1
	beq	s6,a4,.L406
	addi	a4, zero, 2
	beq	s6,a4,.L407
	bne	s6,zero,.L405
.L458:
	sb	a5,640(s0)
	sb	a5,0(s0)
	sb	a5,256(s0)
	lui	a5,%hi(gMaxBlocksPerMCU)
	lbu	a5,%lo(gMaxBlocksPerMCU)(a5)
	addi	s6,s6,1
	andi	s6,s6,0xff
	addi	s9,s9,1
	bltu	s6, a5, .L580
	jal	zero, .L672
.L402:
	addi	a4, zero, 2
	beq	s6,a4,.L437
	bltu	a4, s6, .L438
	beq	s6,zero,.L458
.L464:
	sb	a5,704(s0)
	sb	a5,64(s0)
	sb	a5,320(s0)
	jal	zero, .L405
.L664:
	addi	s0, zero, 1536
	addi	s1, zero, 255
	jal	zero, .L374
.L654:
	addi	s0,s0,-1
	slli	s0,s0,16
	srli	s0,s0,16
	beq	s0,zero,.L377
.L374:
.Lpcrel_24:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_24)
	bne	a0,s1,.L654
	addi	s1, zero, 255
.L373:
.Lpcrel_25:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_25)
	bne	a0,s1,.L376
	addi	s0,s0,-1
	slli	s0,s0,16
	srli	s0,s0,16
	bne	s0,zero,.L373
.L377:
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s1,84(sp)
	lw	s2,80(sp)
	lw	s3,76(sp)
	addi	a0, zero, 29
	addi	sp,sp,96
	jalr	zero, ra, 0
.L376:
	lui	a3,%hi(gNextRestartNum)
	lhu	a5,%lo(gNextRestartNum)(a3)
	addi	a4,a5,208
	bne	a0,a4,.L377
	lhu	a6,%lo(gRestartInterval)(s2)
	lui	a4,%hi(gLastDC)
	addi	a5,a5,1
	andi	a5,a5,7
	addi	t4,a4,%lo(gLastDC)
	lui	a2,%hi(gBitsLeft)
	addi	a1, zero, 8
	addi	a0, zero, 1
	sh	a5,%lo(gNextRestartNum)(a3)
	sh	a6,%lo(gRestartsLeft)(s3)
	sw	zero,%lo(gLastDC)(a4)
	sh	zero,4(t4)
	sb	a1,%lo(gBitsLeft)(a2)
.Lpcrel_26:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_26)
	addi	a0, zero, 1
.Lpcrel_27:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_27)
	lhu	a5,%lo(gRestartsLeft)(s3)
	jal	zero, .L372
.L417:
	addi	a4, zero, 3
	bne	s6,a4,.L405
	addi	a4, zero, 103
	mul	a4,a5,a4
	lbu	a3,640(s0)
	lbu	a0,768(s0)
	addi	a1,a5,-179
	addi	a2, zero, 255
	srli	a4,a4,8
	add	a4,a4,a1
	add	a3,a4,a3
	slli	a3,a3,16
	add	a4,a4,a0
	slli	a4,a4,16
	srli	a3,a3,16
	srli	a4,a4,16
	bgeu	a2, a3, .L430
	slli	a1,a3,16
	srai	a1,a1,16
	addi	a3, zero, 0
	bge	a1,zero,.L673
.L430:
	sb	a3,640(s0)
	addi	a3, zero, 255
	bgeu	a3, a4, .L432
	xori	a4, a4, -1
	slli	a2,a4,16
	srai	a3,a2,31
.L431:
	sb	a3,768(s0)
	addi	a3, zero, 183
	mul	a3,a5,a3
	lbu	a4,0(s0)
	lbu	a5,128(s0)
	addi	a2, zero, 255
	srli	a3,a3,8
	addi	a3,a3,-91
	sub	a4,a4,a3
	sub	a5,a5,a3
	slli	a4,a4,16
	slli	a5,a5,16
	srli	a4,a4,16
	srli	a5,a5,16
	bgeu	a2, a4, .L434
	slli	a3,a4,16
	srai	a3,a3,16
	addi	a4, zero, 0
	bge	a3,zero,.L674
.L434:
	sb	a4,0(s0)
	addi	a4, zero, 255
	bgeu	a4, a5, .L436
	xori	a5, a5, -1
	slli	a3,a5,16
	srai	a4,a3,31
.L435:
	sb	a4,128(s0)
	jal	zero, .L405
.L569:
	addi	a5, zero, 3
	bne	s6,a5,.L405
	addi	a1, zero, 0
	addi	a0, zero, 0
.Lpcrel_28:
	auipc	ra, %pcrel_hi(upsampleCrH)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_28)
	addi	a1, zero, 64
	addi	a0, zero, 4
.Lpcrel_29:
	auipc	ra, %pcrel_hi(upsampleCrH)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_29)
	jal	zero, .L405
.L438:
	addi	a4, zero, 3
	bne	s6,a4,.L405
	addi	a4, zero, 103
	mul	a4,a5,a4
	lbu	a3,640(s0)
	lbu	a0,704(s0)
	addi	a1,a5,-179
	addi	a2, zero, 255
	srli	a4,a4,8
	add	a4,a4,a1
	add	a3,a4,a3
	slli	a3,a3,16
	add	a4,a4,a0
	slli	a4,a4,16
	srli	a3,a3,16
	srli	a4,a4,16
	bgeu	a2, a3, .L451
	slli	a1,a3,16
	srai	a1,a1,16
	addi	a3, zero, 0
	bge	a1,zero,.L675
.L451:
	sb	a3,640(s0)
	addi	a3, zero, 255
	bgeu	a3, a4, .L453
	xori	a4, a4, -1
	slli	a2,a4,16
	srai	a3,a2,31
.L452:
	sb	a3,704(s0)
	addi	a3, zero, 183
	mul	a3,a5,a3
	lbu	a4,0(s0)
	lbu	a5,64(s0)
	addi	a2, zero, 255
	srli	a3,a3,8
	addi	a3,a3,-91
	sub	a4,a4,a3
	sub	a5,a5,a3
	slli	a4,a4,16
	slli	a5,a5,16
	srli	a4,a4,16
	srli	a5,a5,16
	bgeu	a2, a4, .L455
	slli	a3,a4,16
	srai	a3,a3,16
	addi	a4, zero, 0
	bge	a3,zero,.L676
.L455:
	sb	a4,0(s0)
	addi	a4, zero, 255
	bgeu	a4, a5, .L457
	xori	a5, a5, -1
	slli	a3,a5,16
	srai	a4,a3,31
.L456:
	sb	a4,64(s0)
	jal	zero, .L405
.L564:
	addi	a5, zero, 3
	bne	s6,a5,.L405
	addi	a1, zero, 0
	addi	a0, zero, 0
.Lpcrel_30:
	auipc	ra, %pcrel_hi(upsampleCrV)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_30)
	addi	a1, zero, 128
	addi	a0, zero, 32
.Lpcrel_31:
	auipc	ra, %pcrel_hi(upsampleCrV)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_31)
	jal	zero, .L405
.L576:
	addi	a1, zero, 0
	addi	a0, zero, 0
.Lpcrel_32:
	auipc	ra, %pcrel_hi(upsampleCb)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_32)
	addi	a1, zero, 64
	addi	a0, zero, 4
.Lpcrel_33:
	auipc	ra, %pcrel_hi(upsampleCb)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_33)
	addi	a1, zero, 128
	addi	a0, zero, 32
.Lpcrel_34:
	auipc	ra, %pcrel_hi(upsampleCb)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_34)
	addi	a1, zero, 192
	addi	a0, zero, 36
.Lpcrel_35:
	auipc	ra, %pcrel_hi(upsampleCb)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_35)
	jal	zero, .L405
.L627:
	addi	a1,s0,448
	addi	a2,s0,192
	addi	a3,s0,832
	addi	a5,s0,512
	addi	a0,s0,640
.L577:
	lhu	a4,0(a5)
	addi	a5,a5,2
	addi	a3,a3,1
	sb	a4,-1(a3)
	sb	a4,0(a2)
	sb	a4,0(a1)
	addi	a2,a2,1
	addi	a1,a1,1
	bne	a5,a0,.L577
	jal	zero, .L405
.L461:
	addi	a3, zero, 88
	mul	a3,a5,a3
	lbu	a2,0(s0)
	lbu	a4,64(s0)
	addi	a1, zero, 255
	srli	a3,a3,8
	addi	a3,a3,-44
	sub	a2,a2,a3
	slli	a2,a2,16
	sub	a4,a4,a3
	slli	a4,a4,16
	srli	a2,a2,16
	srli	a4,a4,16
	bgeu	a1, a2, .L466
	slli	a0,a2,16
	srai	a0,a0,16
	addi	a2, zero, 0
	bge	a0,zero,.L677
.L466:
	sb	a2,0(s0)
	addi	a2, zero, 255
	bgeu	a2, a4, .L470
	slli	a2,a4,16
	srai	a2,a2,16
	addi	a4, zero, 0
	bge	a2,zero,.L471
.L470:
	sb	a4,64(s0)
	lbu	a4,128(s0)
	addi	a2, zero, 255
	sub	a4,a4,a3
	slli	a4,a4,16
	srli	a4,a4,16
	bgeu	a2, a4, .L474
	slli	a2,a4,16
	srai	a2,a2,16
	addi	a4, zero, 0
	bge	a2,zero,.L468
.L474:
	sb	a4,128(s0)
	lbu	a4,192(s0)
	addi	a2, zero, 255
	sub	a4,a4,a3
	slli	a4,a4,16
	srli	a4,a4,16
	bgeu	a2, a4, .L473
	xori	a4, a4, -1
	slli	a2,a4,16
	srai	a3,a2,31
.L472:
	addi	a2, zero, 198
	mul	a2,a5,a2
	sb	a3,192(s0)
	lbu	a3,256(s0)
	addi	a0,a5,-227
	lbu	a4,320(s0)
	addi	a1, zero, 255
	srli	a5,a2,8
	add	a5,a5,a0
	add	a3,a5,a3
	slli	a3,a3,16
	add	a4,a5,a4
	slli	a4,a4,16
	srli	a3,a3,16
	srli	a4,a4,16
	bgeu	a1, a3, .L476
	slli	a2,a3,16
	srai	a2,a2,16
	addi	a3, zero, 0
	bge	a2,zero,.L678
.L476:
	sb	a3,256(s0)
	addi	a3, zero, 255
	bgeu	a3, a4, .L480
	slli	a3,a4,16
	srai	a3,a3,16
	addi	a4, zero, 0
	bge	a3,zero,.L481
.L480:
	sb	a4,320(s0)
	lbu	a4,384(s0)
	addi	a3, zero, 255
	add	a4,a5,a4
	slli	a4,a4,16
	srli	a4,a4,16
	bgeu	a3, a4, .L484
	slli	a3,a4,16
	srai	a3,a3,16
	addi	a4, zero, 0
	bge	a3,zero,.L478
.L484:
	lbu	a3,448(s0)
	sb	a4,384(s0)
	addi	a4, zero, 255
	add	a5,a5,a3
	slli	a5,a5,16
	srli	a5,a5,16
	bgeu	a4, a5, .L483
	xori	a5, a5, -1
	slli	a3,a5,16
	srai	a4,a3,31
.L482:
	sb	a4,448(s0)
	jal	zero, .L405
.L462:
	sb	a5,832(s0)
	sb	a5,192(s0)
	sb	a5,448(s0)
	jal	zero, .L405
.L459:
	addi	a4, zero, 103
	mul	a4,a5,a4
	lbu	a2,640(s0)
	lbu	a3,704(s0)
	addi	a1,a5,-179
	addi	a0, zero, 255
	srli	a4,a4,8
	add	a4,a4,a1
	add	a2,a4,a2
	slli	a2,a2,16
	add	a3,a4,a3
	slli	a3,a3,16
	srli	a2,a2,16
	srli	a3,a3,16
	bgeu	a0, a2, .L486
	slli	a1,a2,16
	srai	a1,a1,16
	addi	a2, zero, 0
	bge	a1,zero,.L679
.L486:
	sb	a2,640(s0)
	addi	a2, zero, 255
	bgeu	a2, a3, .L490
	slli	a2,a3,16
	srai	a2,a2,16
	addi	a3, zero, 0
	bge	a2,zero,.L491
.L490:
	sb	a3,704(s0)
	lbu	a3,768(s0)
	addi	a2, zero, 255
	add	a3,a4,a3
	slli	a3,a3,16
	srli	a3,a3,16
	bgeu	a2, a3, .L494
	slli	a2,a3,16
	srai	a2,a2,16
	addi	a3, zero, 0
	bge	a2,zero,.L488
.L494:
	lbu	a2,832(s0)
	sb	a3,768(s0)
	addi	a3, zero, 255
	add	a4,a4,a2
	slli	a4,a4,16
	srli	a4,a4,16
	bgeu	a3, a4, .L493
	xori	a4, a4, -1
	slli	a2,a4,16
	srai	a3,a2,31
.L492:
	addi	a4, zero, 183
	mul	a5,a5,a4
	sb	a3,832(s0)
	lbu	a3,0(s0)
	lbu	a4,64(s0)
	addi	a2, zero, 255
	srli	a5,a5,8
	addi	a5,a5,-91
	sub	a3,a3,a5
	slli	a3,a3,16
	sub	a4,a4,a5
	slli	a4,a4,16
	srli	a3,a3,16
	srli	a4,a4,16
	bgeu	a2, a3, .L496
	slli	a1,a3,16
	srai	a1,a1,16
	addi	a3, zero, 0
	bge	a1,zero,.L680
.L496:
	sb	a3,0(s0)
	addi	a3, zero, 255
	bgeu	a3, a4, .L500
	slli	a3,a4,16
	srai	a3,a3,16
	addi	a4, zero, 0
	bge	a3,zero,.L501
.L500:
	sb	a4,64(s0)
	lbu	a4,128(s0)
	addi	a3, zero, 255
	sub	a4,a4,a5
	slli	a4,a4,16
	srli	a4,a4,16
	bgeu	a3, a4, .L504
	slli	a3,a4,16
	srai	a3,a3,16
	addi	a4, zero, 0
	bge	a3,zero,.L498
.L504:
	sb	a4,128(s0)
	lbu	a4,192(s0)
	addi	a3, zero, 255
	sub	a5,a4,a5
	slli	a5,a5,16
	srli	a5,a5,16
	bgeu	a3, a5, .L503
	xori	a5, a5, -1
	slli	a3,a5,16
	srai	a4,a3,31
.L502:
	sb	a4,192(s0)
	jal	zero, .L405
.L626:
	addi	a1,s0,384
	addi	a2,s0,128
	addi	a3,s0,768
	addi	a5,s0,512
	addi	a0,s0,640
.L578:
	lhu	a4,0(a5)
	addi	a5,a5,2
	addi	a3,a3,1
	sb	a4,-1(a3)
	sb	a4,0(a2)
	sb	a4,0(a1)
	addi	a2,a2,1
	addi	a1,a1,1
	bne	a5,a0,.L578
	jal	zero, .L405
.L625:
	addi	a1,s0,320
	addi	a2,s0,64
	addi	a3,s0,704
	addi	a5,s0,512
	addi	a0,s0,640
.L579:
	lhu	a4,0(a5)
	addi	a5,a5,2
	addi	a3,a3,1
	sb	a4,-1(a3)
	sb	a4,0(a2)
	sb	a4,0(a1)
	addi	a2,a2,1
	addi	a1,a1,1
	bne	a5,a0,.L579
	jal	zero, .L405
.L574:
	addi	a1, zero, 0
	addi	a0, zero, 0
.Lpcrel_36:
	auipc	ra, %pcrel_hi(upsampleCr)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_36)
	addi	a1, zero, 64
	addi	a0, zero, 4
.Lpcrel_37:
	auipc	ra, %pcrel_hi(upsampleCr)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_37)
	addi	a1, zero, 128
	addi	a0, zero, 32
.Lpcrel_38:
	auipc	ra, %pcrel_hi(upsampleCr)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_38)
	addi	a1, zero, 192
	addi	a0, zero, 36
.Lpcrel_39:
	auipc	ra, %pcrel_hi(upsampleCr)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_39)
	jal	zero, .L405
.L624:
	addi	a3,s0,640
	addi	a0, a3, 0
	addi	a1,s0,256
	addi	a2, s0, 0
	addi	a5,s0,512
.L573:
	lhu	a4,0(a5)
	addi	a5,a5,2
	addi	a3,a3,1
	sb	a4,-1(a3)
	sb	a4,0(a2)
	sb	a4,0(a1)
	addi	a2,a2,1
	addi	a1,a1,1
	bne	a5,a0,.L573
	jal	zero, .L405
.L416:
	addi	a2, zero, 88
	mul	a2,a5,a2
	lbu	a3,0(s0)
	lbu	a4,128(s0)
	addi	a1, zero, 255
	srli	a2,a2,8
	addi	a2,a2,-44
	sub	a3,a3,a2
	sub	a4,a4,a2
	slli	a3,a3,16
	slli	a4,a4,16
	srli	a3,a3,16
	srli	a4,a4,16
	bgeu	a1, a3, .L422
	slli	a2,a3,16
	srai	a2,a2,16
	addi	a3, zero, 0
	bge	a2,zero,.L681
.L422:
	sb	a3,0(s0)
	addi	a3, zero, 255
	bgeu	a3, a4, .L424
	xori	a4, a4, -1
	slli	a2,a4,16
	srai	a3,a2,31
.L423:
	addi	a4, zero, 198
	mul	a4,a5,a4
	sb	a3,128(s0)
	lbu	a3,256(s0)
	addi	a0,a5,-227
	lbu	a1,384(s0)
	addi	a2, zero, 255
	srli	a5,a4,8
	add	a5,a5,a0
	add	a4,a5,a3
	slli	a4,a4,16
	add	a5,a5,a1
	slli	a5,a5,16
	srli	a4,a4,16
	srli	a5,a5,16
	bgeu	a2, a4, .L426
	slli	a3,a4,16
	srai	a3,a3,16
	addi	a4, zero, 0
	bge	a3,zero,.L682
.L426:
	sb	a4,256(s0)
	addi	a4, zero, 255
	bgeu	a4, a5, .L428
	xori	a5, a5, -1
	slli	a3,a5,16
	srai	a4,a3,31
.L427:
	sb	a4,384(s0)
	jal	zero, .L405
.L623:
	addi	a3,s0,640
	addi	a0, a3, 0
	addi	a1,s0,256
	addi	a2, s0, 0
	addi	a5,s0,512
.L570:
	lhu	a4,0(a5)
	addi	a5,a5,2
	addi	a3,a3,1
	sb	a4,-1(a3)
	sb	a4,0(a2)
	sb	a4,0(a1)
	addi	a2,a2,1
	addi	a1,a1,1
	bne	a5,a0,.L570
	jal	zero, .L405
.L621:
	lui	a6,%hi(.LANCHOR0+64)
	addi	a6,a6,%lo(.LANCHOR0+64)
	addi	a3, s0, 0
	addi	a2,s0,640
	addi	a1,s0,512
	addi	t3, zero, 103
	addi	a0, zero, 255
	addi	t1, zero, 183
	addi	a7, zero, 91
.L552:
	lbu	a5,0(a1)
	lbu	t4,0(a2)
	addi	a1,a1,2
	mul	a4,a5,t3
	addi	t5,a5,-179
	srli	a4,a4,8
	add	a4,a4,t5
	add	a4,a4,t4
	slli	a4,a4,16
	srli	a4,a4,16
	addi	t4, a4, 0
	bgeu	a0, a4, .L560
	xori	a4, a4, -1
	slli	t5,a4,16
	srai	t4,t5,31
.L560:
	mul	a5,a5,t1
	lbu	a4,0(a3)
	sb	t4,0(a2)
	srli	a5,a5,8
	sub	a5,a7,a5
	add	a5,a5,a4
	slli	a5,a5,16
	srli	a5,a5,16
	bgeu	a0, a5, .L561
	xori	a5, a5, -1
	slli	a4,a5,16
	srai	a5,a4,31
	sb	a5,0(a3)
	addi	a3,a3,1
	beq	a3,a6,.L405
	addi	a2,a2,1
	jal	zero, .L552
.L561:
	sb	a5,0(a3)
	addi	a3,a3,1
	beq	a3,a6,.L405
	addi	a2,a2,1
	jal	zero, .L552
.L620:
	addi	a4,s0,256
	addi	a3, s0, 0
	addi	a2,s0,512
	addi	t1, zero, 88
	addi	a7, zero, 44
	addi	a1, zero, 255
	addi	a6, zero, 198
	addi	a0,s0,320
.L551:
	lbu	t3,0(a2)
	lbu	t4,0(a3)
	addi	a2,a2,2
	mul	a5,t3,t1
	srli	a5,a5,8
	sub	a5,a7,a5
	add	a5,a5,t4
	slli	a5,a5,16
	srli	a5,a5,16
	addi	t4, a5, 0
	bgeu	a1, a5, .L556
	xori	a5, a5, -1
	slli	t5,a5,16
	srai	t4,t5,31
.L556:
	mul	a5,t3,a6
	sb	t4,0(a3)
	lbu	t4,0(a4)
	addi	t3,t3,-227
	srli	a5,a5,8
	add	a5,a5,t3
	add	a5,a5,t4
	slli	a5,a5,16
	srli	a5,a5,16
	bgeu	a1, a5, .L557
	xori	a5, a5, -1
	slli	t3,a5,16
	srai	a5,t3,31
	sb	a5,0(a4)
	addi	a4,a4,1
	beq	a4,a0,.L405
	addi	a3,a3,1
	jal	zero, .L551
.L557:
	sb	a5,0(a4)
	addi	a4,a4,1
	beq	a4,a0,.L405
	addi	a3,a3,1
	jal	zero, .L551
.L406:
	addi	a3, zero, 88
	mul	a3,a5,a3
	lbu	a4,0(s0)
	addi	a2, zero, 255
	addi	a4,a4,44
	srli	a3,a3,8
	sub	a4,a4,a3
	slli	a4,a4,16
	srli	a4,a4,16
	addi	a3, a4, 0
	bgeu	a2, a4, .L409
	xori	a4, a4, -1
	slli	a2,a4,16
	srai	a3,a2,31
.L409:
	addi	a4, zero, 198
	sb	a3,0(s0)
	mul	a3,a5,a4
	lbu	a4,256(s0)
	addi	a2, zero, 255
	addi	a4,a4,-227
	add	a5,a5,a4
	srli	a4,a3,8
	add	a5,a5,a4
	slli	a5,a5,16
	srli	a5,a5,16
	addi	a4, a5, 0
	bgeu	a2, a5, .L411
	xori	a5, a5, -1
	slli	a3,a5,16
	srai	a4,a3,31
.L411:
	sb	a4,256(s0)
	jal	zero, .L405
.L437:
	addi	a2, zero, 88
	mul	a2,a5,a2
	lbu	a3,0(s0)
	lbu	a4,64(s0)
	addi	a1, zero, 255
	srli	a2,a2,8
	addi	a2,a2,-44
	sub	a3,a3,a2
	sub	a4,a4,a2
	slli	a3,a3,16
	slli	a4,a4,16
	srli	a3,a3,16
	srli	a4,a4,16
	bgeu	a1, a3, .L443
	slli	a2,a3,16
	srai	a2,a2,16
	addi	a3, zero, 0
	bge	a2,zero,.L683
.L443:
	sb	a3,0(s0)
	addi	a3, zero, 255
	bgeu	a3, a4, .L445
	xori	a4, a4, -1
	slli	a2,a4,16
	srai	a3,a2,31
.L444:
	addi	a4, zero, 198
	mul	a4,a5,a4
	sb	a3,64(s0)
	lbu	a3,256(s0)
	addi	a0,a5,-227
	lbu	a1,320(s0)
	addi	a2, zero, 255
	srli	a5,a4,8
	add	a5,a5,a0
	add	a4,a5,a3
	slli	a4,a4,16
	add	a5,a5,a1
	slli	a5,a5,16
	srli	a4,a4,16
	srli	a5,a5,16
	bgeu	a2, a4, .L447
	slli	a3,a4,16
	srai	a3,a3,16
	addi	a4, zero, 0
	bge	a3,zero,.L684
.L447:
	sb	a4,256(s0)
	addi	a4, zero, 255
	bgeu	a4, a5, .L449
	xori	a5, a5, -1
	slli	a3,a5,16
	srai	a4,a3,31
.L448:
	sb	a4,320(s0)
	jal	zero, .L405
.L407:
	addi	a3, zero, 103
	mul	a3,a5,a3
	lbu	a4,640(s0)
	addi	a2, zero, 255
	addi	a4,a4,-179
	add	a4,a5,a4
	srli	a3,a3,8
	add	a4,a4,a3
	slli	a4,a4,16
	srli	a4,a4,16
	addi	a3, a4, 0
	bgeu	a2, a4, .L413
	xori	a4, a4, -1
	slli	a2,a4,16
	srai	a3,a2,31
.L413:
	addi	a4, zero, 183
	mul	a4,a5,a4
	lbu	a5,0(s0)
	sb	a3,640(s0)
	addi	a3, zero, 255
	addi	a5,a5,91
	srli	a4,a4,8
	sub	a5,a5,a4
	slli	a5,a5,16
	srli	a5,a5,16
	addi	a4, a5, 0
	bgeu	a3, a5, .L415
	xori	a5, a5, -1
	slli	a3,a5,16
	srai	a4,a3,31
.L415:
	sb	a4,0(s0)
	jal	zero, .L405
.L622:
	addi	a3,s0,640
	addi	a0, a3, 0
	addi	a1,s0,256
	addi	a2, s0, 0
	addi	a5,s0,512
.L565:
	lhu	a4,0(a5)
	addi	a5,a5,2
	addi	a3,a3,1
	sb	a4,-1(a3)
	sb	a4,0(a2)
	sb	a4,0(a1)
	addi	a2,a2,1
	addi	a1,a1,1
	bne	a5,a0,.L565
	jal	zero, .L405
.L563:
	addi	a1, zero, 0
	addi	a0, zero, 0
.Lpcrel_40:
	auipc	ra, %pcrel_hi(upsampleCbV)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_40)
	addi	a1, zero, 128
	addi	a0, zero, 32
.Lpcrel_41:
	auipc	ra, %pcrel_hi(upsampleCbV)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_41)
	jal	zero, .L405
.L568:
	addi	a1, zero, 0
	addi	a0, zero, 0
.Lpcrel_42:
	auipc	ra, %pcrel_hi(upsampleCbH)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_42)
	addi	a1, zero, 64
	addi	a0, zero, 4
.Lpcrel_43:
	auipc	ra, %pcrel_hi(upsampleCbH)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_43)
	jal	zero, .L405
.L673:
	addi	a1, zero, -1
	sb	a1,640(s0)
	addi	a3, a2, 0
	bltu	a2, a4, .L431
.L432:
	addi	a3, a4, 0
	jal	zero, .L431
.L675:
	addi	a1, zero, -1
	sb	a1,640(s0)
	addi	a3, a2, 0
	bltu	a2, a4, .L452
.L453:
	addi	a3, a4, 0
	jal	zero, .L452
.L676:
	addi	a3, zero, -1
	sb	a3,0(s0)
	addi	a4, a2, 0
	bltu	a2, a5, .L456
.L457:
	addi	a4, a5, 0
	sb	a4,64(s0)
	jal	zero, .L405
.L678:
	addi	a3, zero, -1
	sb	a3,256(s0)
	bgeu	a1, a4, .L480
.L481:
	lbu	a4,384(s0)
	addi	a3, zero, -1
	sb	a3,320(s0)
	add	a4,a5,a4
	slli	a4,a4,16
	srli	a4,a4,16
	addi	a3, zero, 255
	bgeu	a3, a4, .L484
.L478:
	lbu	a4,448(s0)
	addi	a3, zero, -1
	sb	a3,384(s0)
	add	a5,a5,a4
	slli	a5,a5,16
	srli	a5,a5,16
	addi	a4, zero, 255
	bltu	a4, a5, .L482
.L483:
	addi	a4, a5, 0
	sb	a4,448(s0)
	jal	zero, .L405
.L674:
	addi	a3, zero, -1
	sb	a3,0(s0)
	addi	a4, a2, 0
	bltu	a2, a5, .L435
.L436:
	addi	a4, a5, 0
	sb	a4,128(s0)
	jal	zero, .L405
.L680:
	addi	a3, zero, -1
	sb	a3,0(s0)
	bgeu	a2, a4, .L500
.L501:
	lbu	a4,128(s0)
	addi	a3, zero, -1
	sb	a3,64(s0)
	sub	a4,a4,a5
	slli	a4,a4,16
	srli	a4,a4,16
	addi	a3, zero, 255
	bgeu	a3, a4, .L504
.L498:
	lbu	a4,192(s0)
	addi	a3, zero, -1
	sb	a3,128(s0)
	sub	a5,a4,a5
	slli	a5,a5,16
	srli	a5,a5,16
	addi	a4, zero, 255
	bltu	a4, a5, .L502
.L503:
	addi	a4, a5, 0
	sb	a4,192(s0)
	jal	zero, .L405
.L677:
	addi	a2, zero, -1
	sb	a2,0(s0)
	bgeu	a1, a4, .L470
.L471:
	lbu	a4,128(s0)
	addi	a2, zero, -1
	sb	a2,64(s0)
	sub	a4,a4,a3
	slli	a4,a4,16
	srli	a4,a4,16
	addi	a2, zero, 255
	bgeu	a2, a4, .L474
.L468:
	lbu	a4,192(s0)
	addi	a2, zero, -1
	sb	a2,128(s0)
	sub	a4,a4,a3
	slli	a4,a4,16
	srli	a4,a4,16
	addi	a3, zero, 255
	bltu	a3, a4, .L472
.L473:
	addi	a3, a4, 0
	jal	zero, .L472
.L684:
	addi	a3, zero, -1
	sb	a3,256(s0)
	addi	a4, a2, 0
	bltu	a2, a5, .L448
.L449:
	addi	a4, a5, 0
	sb	a4,320(s0)
	jal	zero, .L405
.L683:
	addi	a2, zero, -1
	sb	a2,0(s0)
	addi	a3, a1, 0
	bltu	a1, a4, .L444
.L445:
	addi	a3, a4, 0
	jal	zero, .L444
.L682:
	addi	a3, zero, -1
	sb	a3,256(s0)
	addi	a4, a2, 0
	bltu	a2, a5, .L427
.L428:
	addi	a4, a5, 0
	sb	a4,384(s0)
	jal	zero, .L405
.L681:
	addi	a2, zero, -1
	sb	a2,0(s0)
	addi	a3, a1, 0
	bltu	a1, a4, .L423
.L424:
	addi	a3, a4, 0
	jal	zero, .L423
.L679:
	addi	a2, zero, -1
	sb	a2,640(s0)
	bgeu	a0, a3, .L490
.L491:
	lbu	a3,768(s0)
	addi	a2, zero, -1
	sb	a2,704(s0)
	add	a3,a4,a3
	slli	a3,a3,16
	srli	a3,a3,16
	addi	a2, zero, 255
	bgeu	a2, a3, .L494
.L488:
	lbu	a3,832(s0)
	addi	a2, zero, -1
	sb	a2,768(s0)
	add	a4,a4,a3
	slli	a4,a4,16
	srli	a4,a4,16
	addi	a3, zero, 255
	bltu	a3, a4, .L492
.L493:
	addi	a3, a4, 0
	jal	zero, .L492
	.size	decodeNextMCU, .-decodeNextMCU
	.align	2
	.type	processMarkers, @function
processMarkers:
	addi	sp,sp,-96
	sw	s0,88(sp)
	sw	s1,84(sp)
	sw	s2,80(sp)
	sw	s3,76(sp)
	sw	s7,60(sp)
	sw	ra,92(sp)
	sw	s4,72(sp)
	sw	s5,68(sp)
	sw	a0,12(sp)
	lui	s0,%hi(gBitBuf)
	lui	s2,%hi(gBitsLeft)
	addi	s1, zero, 255
	addi	s3, zero, 7
	addi	s7, zero, 8
.L687:
	addi	a0, zero, 0
.Lpcrel_44:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_44)
	addi	s4, a0, 0
	bne	a0,s1,.L687
	lhu	a0,%lo(gBitBuf)(s0)
	lbu	a5,%lo(gBitsLeft)(s2)
.L691:
	addi	a3,a5,-8
	addi	s5, a0, 0
	srai	a4,a0,8
	bgeu	s3, a5, .L802
	andi	a0,a0,255
	slli	a0,a0,8
	andi	a5,a3,0xff
	sh	a0,%lo(gBitBuf)(s0)
	sb	a5,%lo(gBitsLeft)(s2)
	beq	a4,s1,.L691
	beq	a4,zero,.L687
.L804:
	andi	a4,a4,0xff
	addi	a5, zero, 215
	bltu	a5, a4, .L693
	addi	a5, zero, 196
	bgeu	a5, a4, .L803
	addi	a2,a4,59
	addi	a5, zero, 1
	lui	a3, 128
	sll	a5,a5,a2
	addi	a3,a3,-2040
	and	a3,a5,a3
	bne	a3,zero,.L745
	andi	a5,a5,1911
	bne	a5,zero,.L698
	addi	a0, zero, 17
.L789:
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s1,84(sp)
	lw	s2,80(sp)
	lw	s3,76(sp)
	lw	s4,72(sp)
	lw	s5,68(sp)
	lw	s7,60(sp)
	addi	sp,sp,96
	jalr	zero, ra, 0
.L802:
	sll	a0,a0,a5
	sh	a0,%lo(gBitBuf)(s0)
.Lpcrel_45:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_45)
	lhu	a3,%lo(gBitBuf)(s0)
	lbu	a5,%lo(gBitsLeft)(s2)
	srai	a4,s5,8
	or	a0,a0,a3
	sub	a3,s7,a5
	sll	a0,a0,a3
	slli	a0,a0,16
	srli	a0,a0,16
	sh	a0,%lo(gBitBuf)(s0)
	beq	a4,s1,.L691
	beq	a4,zero,.L687
	jal	zero, .L804
.L693:
	addi	a5, zero, 219
	beq	a4,a5,.L699
	bgeu	a5, a4, .L698
	addi	a5, zero, 221
	bne	a4,a5,.L697
.Lpcrel_46:
	auipc	ra, %pcrel_hi(getBits.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_46)
	addi	a5, zero, 4
	bne	a0,a5,.L687
.Lpcrel_47:
	auipc	ra, %pcrel_hi(getBits.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_47)
	lui	a5,%hi(gRestartInterval)
	sh	a0,%lo(gRestartInterval)(a5)
	jal	zero, .L687
.L803:
	bne	a4,a5,.L805
.Lpcrel_48:
	auipc	ra, %pcrel_hi(getBits.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_48)
	addi	a5, zero, 1
	bgeu	a5, a0, .L687
	addi	a0,a0,-2
	sw	s11,44(sp)
	slli	s11,a0,16
	srli	s11,s11,16
	beq	s11,zero,.L801
	lui	a5,%hi(.LANCHOR1)
	addi	a5,a5,%lo(.LANCHOR1)
	sw	s9,52(sp)
	sw	s6,64(sp)
	sw	s8,56(sp)
	sw	s10,48(sp)
	sw	a5,8(sp)
	lui	s9, 16
.L726:
	addi	a0, zero, 0
.Lpcrel_49:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_49)
	andi	a5,a0,14
	sw	a5,4(sp)
	bne	a5,zero,.L800
	andi	a5,a0,240
	addi	a4, zero, 16
	bltu	a4, a5, .L800
	srli	s10,a0,3
	lw	a2,8(sp)
	andi	s10,s10,2
	andi	a0,a0,1
	or	a5,s10,a0
	sw	a5,0(sp)
	slli	a5,a5,2
	add	a5,a2,a5
	lui	a3,%hi(gValidHuffTables)
	lw	a2,0(sp)
	lbu	a4,%lo(gValidHuffTables)(a3)
	lw	s6,700(a5)
	lw	s8,716(a5)
	addi	a5, zero, 1
	sll	a5,a5,a2
	or	a5,a4,a5
	sb	a5,%lo(gValidHuffTables)(a3)
	addi	s10,sp,16
	addi	s5, zero, 0
.L704:
	addi	a0, zero, 0
.Lpcrel_50:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_50)
	sb	a0,0(s10)
	add	a0,s5,a0
	slli	s5,a0,16
	addi	s10,s10,1
	addi	a5,sp,32
	srli	s5,s5,16
	bne	a5,s10,.L704
	lw	a4,0(sp)
	addi	a3, zero, 1
	addi	a5, s4, 0
	bgeu	a3, a4, .L806
.L705:
	bltu	a5, s5, .L800
	addi	s10, zero, 0
	beq	s5,zero,.L708
.L706:
	addi	a0, zero, 0
.Lpcrel_51:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_51)
	add	a5,s8,s10
	addi	s10,s10,1
	sb	a0,0(a5)
	andi	s10,s10,0xff
	bltu	s10, s5, .L706
.L708:
	addi	a5,s5,17
	slli	a5,a5,16
	srli	a5,a5,16
	bltu	s11,a5,.L800
	lbu	a4,16(sp)
	sub	a5,s11,a5
	slli	s11,a5,16
	srli	s11,s11,16
	beq	a4,zero,.L748
	addi	a5, a4, 0
	addi	a2,a4,-1
.L709:
	lbu	a3,17(sp)
	sh	zero,0(s6)
	sh	a2,32(s6)
	sb	zero,64(s6)
	slli	a5,a5,1
	beq	a3,zero,.L749
	add	a0,a3,a5
	add	a6,a3,a4
	addi	a2, a5, 0
	addi	a3, a4, 0
	addi	a1,a0,-1
	andi	a4,a6,0xff
	addi	a5, a0, 0
.L710:
	sh	a2,2(s6)
	lbu	a2,18(sp)
	sh	a1,34(s6)
	sb	a3,65(s6)
	slli	a5,a5,1
	beq	a2,zero,.L750
	add	a0,a2,a5
	add	a6,a4,a2
	addi	a3, a5, 0
	addi	a2, a4, 0
	addi	a1,a0,-1
	andi	a4,a6,0xff
	addi	a5, a0, 0
.L711:
	sh	a3,4(s6)
	lbu	a3,19(sp)
	sh	a1,36(s6)
	sb	a2,66(s6)
	slli	a5,a5,1
	beq	a3,zero,.L751
	add	a0,a3,a5
	add	a6,a4,a3
	addi	a2, a5, 0
	addi	a3, a4, 0
	addi	a1,a0,-1
	andi	a4,a6,0xff
	addi	a5, a0, 0
.L712:
	sh	a2,6(s6)
	lbu	a2,20(sp)
	sh	a1,38(s6)
	sb	a3,67(s6)
	slli	a5,a5,1
	beq	a2,zero,.L752
	add	a0,a2,a5
	add	a6,a4,a2
	addi	a3, a5, 0
	addi	a2, a4, 0
	addi	a1,a0,-1
	andi	a4,a6,0xff
	addi	a5, a0, 0
.L713:
	sh	a3,8(s6)
	lbu	a3,21(sp)
	sh	a1,40(s6)
	sb	a2,68(s6)
	slli	a5,a5,1
	beq	a3,zero,.L753
	add	a0,a3,a5
	add	a6,a4,a3
	addi	a2, a5, 0
	addi	a3, a4, 0
	addi	a1,a0,-1
	andi	a4,a6,0xff
	addi	a5, a0, 0
.L714:
	sh	a2,10(s6)
	lbu	a2,22(sp)
	sh	a1,42(s6)
	sb	a3,69(s6)
	slli	a5,a5,1
	beq	a2,zero,.L754
	add	a0,a2,a5
	add	a6,a4,a2
	addi	a3, a5, 0
	addi	a2, a4, 0
	addi	a1,a0,-1
	andi	a4,a6,0xff
	addi	a5, a0, 0
.L715:
	sh	a3,12(s6)
	lbu	a3,23(sp)
	sh	a1,44(s6)
	sb	a2,70(s6)
	slli	a5,a5,1
	beq	a3,zero,.L755
	add	a0,a3,a5
	add	a6,a4,a3
	addi	a2, a5, 0
	addi	a3, a4, 0
	addi	a1,a0,-1
	andi	a4,a6,0xff
	addi	a5, a0, 0
.L716:
	sh	a2,14(s6)
	lbu	a2,24(sp)
	sh	a1,46(s6)
	sb	a3,71(s6)
	slli	a5,a5,1
	beq	a2,zero,.L756
	add	a0,a2,a5
	add	a6,a4,a2
	addi	a3, a5, 0
	addi	a2, a4, 0
	addi	a1,a0,-1
	andi	a4,a6,0xff
	addi	a5, a0, 0
.L717:
	sh	a3,16(s6)
	lbu	a3,25(sp)
	sh	a1,48(s6)
	sb	a2,72(s6)
	slli	a5,a5,1
	beq	a3,zero,.L757
	add	a0,a3,a5
	add	a6,a4,a3
	addi	a2, a5, 0
	addi	a3, a4, 0
	addi	a1,a0,-1
	andi	a4,a6,0xff
	addi	a5, a0, 0
.L718:
	sh	a2,18(s6)
	lbu	a2,26(sp)
	sh	a1,50(s6)
	sb	a3,73(s6)
	slli	a5,a5,1
	beq	a2,zero,.L758
	add	a0,a2,a5
	add	a6,a4,a2
	addi	a3, a5, 0
	addi	a2, a4, 0
	addi	a1,a0,-1
	andi	a4,a6,0xff
	addi	a5, a0, 0
.L719:
	sh	a3,20(s6)
	lbu	a3,27(sp)
	sh	a1,52(s6)
	sb	a2,74(s6)
	slli	a5,a5,1
	beq	a3,zero,.L759
	add	a0,a3,a5
	add	a6,a4,a3
	addi	a2, a5, 0
	addi	a3, a4, 0
	addi	a1,a0,-1
	andi	a4,a6,0xff
	addi	a5, a0, 0
.L720:
	sh	a2,22(s6)
	lbu	a2,28(sp)
	sh	a1,54(s6)
	sb	a3,75(s6)
	slli	a5,a5,1
	beq	a2,zero,.L760
	add	a0,a2,a5
	add	a6,a4,a2
	addi	a3, a5, 0
	addi	a2, a4, 0
	addi	a1,a0,-1
	andi	a4,a6,0xff
	addi	a5, a0, 0
.L721:
	sh	a3,24(s6)
	lbu	a3,29(sp)
	sh	a1,56(s6)
	sb	a2,76(s6)
	slli	a5,a5,1
	beq	a3,zero,.L761
	add	a0,a3,a5
	add	a6,a4,a3
	addi	a2, a5, 0
	addi	a3, a4, 0
	addi	a1,a0,-1
	andi	a4,a6,0xff
	addi	a5, a0, 0
.L722:
	sh	a2,26(s6)
	lbu	a2,30(sp)
	sh	a1,58(s6)
	sb	a3,77(s6)
	slli	a5,a5,1
	addi	a1,s9,-1
	beq	a2,zero,.L723
	add	a3,a2,a5
	add	a0,a4,a2
	sw	a5,4(sp)
	addi	a2, a4, 0
	addi	a1,a3,-1
	andi	a4,a0,0xff
	addi	a5, a3, 0
.L723:
	lw	a0,4(sp)
	lbu	a3,31(sp)
	sh	a1,60(s6)
	sh	a0,28(s6)
	sb	a2,78(s6)
	beq	a3,zero,.L724
	slli	a5,a5,1
	add	a3,a3,a5
	addi	a3,a3,-1
	sh	a3,62(s6)
	sh	a5,30(s6)
	sb	a4,79(s6)
	bne	s11,zero,.L726
.L800:
	lw	s6,64(sp)
	lw	s8,56(sp)
	lw	s9,52(sp)
	lw	s10,48(sp)
.L801:
	lw	s11,44(sp)
	jal	zero, .L687
.L806:
	addi	a5, zero, 12
	jal	zero, .L705
.L805:
	addi	a5, zero, 1
	beq	a4,a5,.L745
	addi	a5,a4,64
	andi	a5,a5,0xff
	addi	a3, zero, 3
	bltu	a3, a5, .L697
.L698:
	lw	a5,12(sp)
	addi	a0, zero, 0
	sb	a4,0(a5)
	jal	zero, .L789
.L745:
	addi	a0, zero, 18
	jal	zero, .L789
.L761:
	addi	a2, zero, 0
	addi	a1,s9,-1
	jal	zero, .L722
.L760:
	addi	a3, zero, 0
	addi	a1,s9,-1
	jal	zero, .L721
.L724:
	addi	a5, zero, -1
	sh	zero,30(s6)
	sb	zero,79(s6)
	sh	a5,62(s6)
	bne	s11,zero,.L726
	jal	zero, .L800
.L759:
	addi	a2, zero, 0
	addi	a1,s9,-1
	jal	zero, .L720
.L758:
	addi	a3, zero, 0
	addi	a1,s9,-1
	jal	zero, .L719
.L757:
	addi	a2, zero, 0
	addi	a1,s9,-1
	jal	zero, .L718
.L756:
	addi	a3, zero, 0
	addi	a1,s9,-1
	jal	zero, .L717
.L755:
	addi	a2, zero, 0
	addi	a1,s9,-1
	jal	zero, .L716
.L754:
	addi	a3, zero, 0
	addi	a1,s9,-1
	jal	zero, .L715
.L753:
	addi	a2, zero, 0
	addi	a1,s9,-1
	jal	zero, .L714
.L752:
	addi	a3, zero, 0
	addi	a1,s9,-1
	jal	zero, .L713
.L751:
	addi	a2, zero, 0
	addi	a1,s9,-1
	jal	zero, .L712
.L750:
	addi	a3, zero, 0
	addi	a1,s9,-1
	jal	zero, .L711
.L749:
	addi	a2, zero, 0
	addi	a1,s9,-1
	jal	zero, .L710
.L748:
	addi	a5, zero, 0
	addi	a2,s9,-1
	jal	zero, .L709
.L699:
.Lpcrel_52:
	auipc	ra, %pcrel_hi(getBits.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_52)
	addi	a5, zero, 1
	bgeu	a5, a0, .L687
	addi	a0,a0,-2
	sw	s9,52(sp)
	slli	s9,a0,16
	srli	s9,s9,16
	beq	s9,zero,.L798
	lui	a5,%hi(.LANCHOR1)
	addi	a5,a5,%lo(.LANCHOR1)
	sw	s10,48(sp)
	lui	s10,%hi(.LANCHOR0)
	sw	s6,64(sp)
	sw	s8,56(sp)
	sw	s11,44(sp)
	sw	a5,4(sp)
	addi	s4,a5,796
	addi	s10,s10,%lo(.LANCHOR0)
.L741:
	addi	a0, zero, 0
.Lpcrel_53:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_53)
	andi	a5,a0,14
	andi	a0,a0,0xff
	bne	a5,zero,.L800
	andi	a5,a0,15
	srli	s6,a0,4
	lui	a4,%hi(gValidQuantTables)
	bne	a5,zero,.L728
	lbu	a5,%lo(gValidQuantTables)(a4)
	ori	a5,a5,1
	sb	a5,%lo(gValidQuantTables)(a4)
	bne	s6,zero,.L807
	addi	a5,s10,1280
	sw	a5,0(sp)
	addi	s8, a5, 0
	addi	s5,s10,1408
.L733:
	addi	a0, zero, 0
.Lpcrel_54:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_54)
	sh	a0,0(s8)
	addi	s8,s8,2
	bne	s5,s8,.L733
.L734:
	lw	a4,0(sp)
.L743:
	lw	a5,4(sp)
	addi	a3,a5,732
.L739:
	lh	a2,0(a4)
	lbu	a5,0(a3)
	addi	a3,a3,1
	addi	a4,a4,2
	mul	a5,a5,a2
	addi	a5,a5,4
	srai	a5,a5,3
	sh	a5,-2(a4)
	bne	s4,a3,.L739
	sltu	a5, zero, s6
	slli	a5,a5,6
	addi	a5,a5,65
	bltu	s9, a5, .L800
	sub	a5,s9,a5
	slli	s9,a5,16
	srli	s9,s9,16
	bne	s9,zero,.L741
	jal	zero, .L800
.L728:
	lbu	a5,%lo(gValidQuantTables)(a4)
	addi	s8,s10,1152
	addi	s5,s10,1280
	ori	a5,a5,2
	sb	a5,%lo(gValidQuantTables)(a4)
	bne	s6,zero,.L808
.L735:
	addi	a0, zero, 0
.Lpcrel_55:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_55)
	sh	a0,0(s8)
	addi	s8,s8,2
	bne	s5,s8,.L735
	addi	a4,s10,1152
	jal	zero, .L743
.L808:
	addi	s11,s10,1152
	addi	s8,s10,1280
.L738:
	addi	a0, zero, 0
.Lpcrel_56:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_56)
	slli	s5,a0,8
	addi	a0, zero, 0
.Lpcrel_57:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_57)
	add	a0,a0,s5
	sh	a0,0(s11)
	addi	s11,s11,2
	bne	s8,s11,.L738
	addi	a4,s10,1152
	jal	zero, .L743
.L807:
	addi	a5,s10,1280
	sw	a5,0(sp)
	addi	s11, a5, 0
	addi	s8,s10,1408
.L737:
	addi	a0, zero, 0
.Lpcrel_58:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_58)
	slli	s5,a0,8
	addi	a0, zero, 0
.Lpcrel_59:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_59)
	add	a0,a0,s5
	sh	a0,0(s11)
	addi	s11,s11,2
	bne	s8,s11,.L737
	jal	zero, .L734
.L697:
.Lpcrel_60:
	auipc	ra, %pcrel_hi(getBits.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_60)
	addi	a5, zero, 1
	bgeu	a5, a0, .L687
	addi	a0,a0,-2
	slli	s4,a0,16
	srli	s4,s4,16
	beq	s4,zero,.L687
.L742:
	addi	s4,s4,-1
	slli	s4,s4,16
	addi	a0, zero, 0
	srli	s4,s4,16
.Lpcrel_61:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_61)
	bne	s4,zero,.L742
	jal	zero, .L687
.L798:
	lw	s9,52(sp)
	jal	zero, .L687
	.size	processMarkers, .-processMarkers
	.align	2
	.globl	pjpeg_decode_mcu
	.type	pjpeg_decode_mcu, @function
pjpeg_decode_mcu:
	lui	a5,%hi(gCallbackStatus)
	lbu	a0,%lo(gCallbackStatus)(a5)
	bne	a0,zero,.L818
	lui	a4,%hi(gNumMCUSRemaining)
	lhu	a3,%lo(gNumMCUSRemaining)(a4)
	addi	a0, zero, 1
	bne	a3,zero,.L821
.L818:
	jalr	zero, ra, 0
.L821:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_62:
	auipc	ra, %pcrel_hi(decodeNextMCU)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_62)
	lui	a5,%hi(gCallbackStatus)
	lbu	a5,%lo(gCallbackStatus)(a5)
	bne	a0,zero,.L811
	lui	a4,%hi(gNumMCUSRemaining)
	bne	a5,zero,.L812
	lhu	a3,%lo(gNumMCUSRemaining)(a4)
	addi	a3,a3,-1
	sh	a3,%lo(gNumMCUSRemaining)(a4)
.L812:
	addi	a0, a5, 0
.L810:
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
.L811:
	beq	a5,zero,.L810
	jal	zero, .L812
	.size	pjpeg_decode_mcu, .-pjpeg_decode_mcu
	.align	2
	.globl	pjpeg_decode_init
	.type	pjpeg_decode_init, @function
pjpeg_decode_init:
	lui	a4,%hi(gImageXSize)
	addi	sp,sp,-96
	sh	zero,%lo(gImageXSize)(a4)
	lui	a4,%hi(gImageYSize)
	sh	zero,%lo(gImageYSize)(a4)
	lui	a4,%hi(gRestartInterval)
	lui	a5,%hi(g_pNeedBytesCallback)
	sh	zero,%lo(gRestartInterval)(a4)
	lui	a4,%hi(gCompsInScan)
	sw	a1,%lo(g_pNeedBytesCallback)(a5)
	sb	zero,%lo(gCompsInScan)(a4)
	lui	a5,%hi(g_pCallback_data)
	lui	a4,%hi(gValidHuffTables)
	sw	a2,%lo(g_pCallback_data)(a5)
	sb	zero,%lo(gValidHuffTables)(a4)
	lui	a5,%hi(gReduce)
	lui	a4,%hi(gValidQuantTables)
	sw	ra,92(sp)
	sw	s0,88(sp)
	sw	s3,76(sp)
	sw	s4,72(sp)
	sw	s8,56(sp)
	sw	s10,48(sp)
	sw	s11,44(sp)
	sb	a3,%lo(gReduce)(a5)
	lui	s0,%hi(gCallbackStatus)
	lui	a5,%hi(gTemFlag)
	sb	zero,%lo(gValidQuantTables)(a4)
	lui	s4,%hi(gCompsInFrame)
	lui	a4,%hi(gInBufOfs)
	sw	zero,0(a0)
	sw	zero,4(a0)
	sw	zero,8(a0)
	sw	zero,12(a0)
	sw	zero,16(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	zero,32(a0)
	sw	zero,36(a0)
	sw	zero,40(a0)
	sb	zero,%lo(gTemFlag)(a5)
	sb	zero,%lo(gInBufOfs)(a4)
	addi	a5, zero, 8
	lui	a4,%hi(gInBufLeft)
	addi	s8, a0, 0
	lui	s11,%hi(gBitBuf)
	lui	s10,%hi(gBitsLeft)
	sb	zero,%lo(gCallbackStatus)(s0)
	sb	zero,%lo(gCompsInFrame)(s4)
	addi	a0, zero, 0
	sb	zero,%lo(gInBufLeft)(a4)
	sb	a5,%lo(gBitsLeft)(s10)
	sh	zero,%lo(gBitBuf)(s11)
.Lpcrel_63:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_63)
	addi	a0, zero, 0
.Lpcrel_64:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_64)
	lbu	s3,%lo(gCallbackStatus)(s0)
	beq	s3,zero,.L961
.L913:
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s4,72(sp)
	lw	s8,56(sp)
	lw	s10,48(sp)
	lw	s11,44(sp)
	addi	a0, s3, 0
	lw	s3,76(sp)
	addi	sp,sp,96
	jalr	zero, ra, 0
.L961:
	addi	a0, zero, 0
	sw	s1,84(sp)
.Lpcrel_65:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_65)
	addi	s1,a0,-255
	addi	a0, zero, 0
.Lpcrel_66:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_66)
	bne	s1,zero,.L824
	addi	a5,a0,-216
	bne	a5,zero,.L824
.L832:
	addi	a0,sp,31
.Lpcrel_67:
	auipc	ra, %pcrel_hi(processMarkers)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_67)
	addi	s3, a0, 0
	bne	a0,zero,.L825
	lbu	a4,31(sp)
	addi	a3, zero, 194
	beq	a4,a3,.L876
	addi	a3, zero, 201
	beq	a4,a3,.L877
	addi	a3, zero, 192
	bne	a4,a3,.L878
	sw	s2,80(sp)
.Lpcrel_68:
	auipc	ra, %pcrel_hi(getBits.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_68)
	addi	s1, a0, 0
	addi	a0, zero, 0
.Lpcrel_69:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_69)
	addi	a4, zero, 8
	addi	s2, a0, 0
	beq	a0,a4,.L962
	lw	s2,80(sp)
	addi	s3, zero, 7
	jal	zero, .L825
.L824:
	lui	a3, 1
	sw	s2,80(sp)
	sw	s5,68(sp)
	sw	s6,64(sp)
	sw	s7,60(sp)
	sw	s8,4(sp)
	lhu	a5,%lo(gBitBuf)(s11)
	sw	s9,52(sp)
	addi	s5,a3,-1
	addi	s6, zero, 7
	addi	s2, zero, 8
	addi	s7, zero, 255
	addi	s1, zero, 216
	addi	s3, zero, 217
	andi	s8,a0,0xff
	jal	zero, .L827
.L830:
	andi	s8,a4,0xff
	beq	s5,zero,.L875
.L827:
	lbu	a4,%lo(gBitsLeft)(s10)
	addi	s9, a5, 0
	addi	a2,a4,-8
	bgeu	s6, a4, .L963
	andi	a5,a5,255
	slli	a5,a5,8
	sb	a2,%lo(gBitsLeft)(s10)
.L829:
	addi	s5,s5,-1
	slli	s5,s5,16
	sh	a5,%lo(gBitBuf)(s11)
	srli	s5,s5,16
	srai	a4,s9,8
	bne	s8,s7,.L830
	beq	a4,s1,.L831
	bne	a4,s3,.L830
.L875:
	lw	s2,80(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	lw	s7,60(sp)
	lw	s9,52(sp)
	addi	s3, zero, 19
.L825:
	lbu	a4,%lo(gCallbackStatus)(s0)
	bne	a4,zero,.L964
	lw	s1,84(sp)
	jal	zero, .L913
.L963:
	sll	a5,a5,a4
	sh	a5,%lo(gBitBuf)(s11)
.Lpcrel_70:
	auipc	ra, %pcrel_hi(getChar)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_70)
	lhu	a5,%lo(gBitBuf)(s11)
	lbu	a4,%lo(gBitsLeft)(s10)
	or	a5,a0,a5
	sub	a4,s2,a4
	sll	a5,a5,a4
	slli	a5,a5,16
	srli	a5,a5,16
	jal	zero, .L829
.L876:
	addi	s3, zero, 37
	jal	zero, .L825
.L831:
	addi	s9, s8, 0
	srli	a5,a5,8
	lw	s8,4(sp)
	bne	a5,s9,.L875
	lw	s2,80(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	lw	s7,60(sp)
	lw	s9,52(sp)
	jal	zero, .L832
.L878:
	addi	s3, zero, 20
	jal	zero, .L825
.L877:
	addi	s3, zero, 17
	jal	zero, .L825
.L962:
	sw	s5,68(sp)
.Lpcrel_71:
	auipc	ra, %pcrel_hi(getBits.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_71)
	addi	a4,a0,-1
	slli	a4,a4,16
	lui	a5,%hi(gImageYSize)
	srli	a4,a4,16
	sh	a0,%lo(gImageYSize)(a5)
	lui	s5, 4
	bgeu	a4,s5,.L880
.Lpcrel_72:
	auipc	ra, %pcrel_hi(getBits.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_72)
	addi	a4,a0,-1
	lui	a5,%hi(gImageXSize)
	slli	a4,a4,16
	sh	a0,%lo(gImageXSize)(a5)
	srli	a4,a4,16
	bgeu	a4,s5,.L881
	addi	a0, zero, 0
.Lpcrel_73:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_73)
	sb	a0,%lo(gCompsInFrame)(s4)
	addi	a4, zero, 3
	bltu	a4, a0, .L882
	slli	a4,a0,1
	add	a4,a4,a0
	add	a4,a4,s2
	bne	s1,a4,.L883
	beq	a0,zero,.L833
	lui	a5,%hi(gCompVSamp)
	lui	a4,%hi(gCompQuant)
	addi	s5,a5,%lo(gCompVSamp)
	addi	a5,a4,%lo(gCompQuant)
	sw	a5,4(sp)
	lui	t4,%hi(gCompHSamp)
	lui	a5,%hi(gCompIdent)
	sw	s6,64(sp)
	addi	s2,a5,%lo(gCompIdent)
	lw	s6,4(sp)
	addi	s1,t4,%lo(gCompHSamp)
	jal	zero, .L834
.L966:
	lbu	a3,%lo(gCompsInFrame)(s4)
	lui	t4,%hi(gCompHSamp)
	lui	a5,%hi(gCompVSamp)
	add	s2,s2,a4
	add	s1,s1,a4
	add	s5,s5,a4
	add	s6,s6,a4
	addi	t5,a5,%lo(gCompVSamp)
	addi	t3,t4,%lo(gCompHSamp)
	bgeu	s3, a3, .L965
.L834:
	addi	a0, zero, 0
.Lpcrel_74:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_74)
	sb	a0,0(s2)
	addi	a1, zero, 0
	addi	a0, zero, 4
.Lpcrel_75:
	auipc	ra, %pcrel_hi(getBits)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_75)
	sb	a0,0(s1)
	addi	a1, zero, 0
	addi	a0, zero, 4
.Lpcrel_76:
	auipc	ra, %pcrel_hi(getBits)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_76)
	addi	a5, a0, 0
	sb	a5,0(s5)
	addi	a0, zero, 0
.Lpcrel_77:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_77)
	addi	s3,s3,1
	sb	a0,0(s6)
	addi	a4, zero, 1
	andi	s3,s3,0xff
	bgeu	a4, a0, .L966
	lw	s2,80(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	addi	s3, zero, 36
	jal	zero, .L825
.L964:
	lw	s1,84(sp)
	addi	s3, a4, 0
	jal	zero, .L913
.L880:
	addi	s3, s2, 0
	lw	s5,68(sp)
	lw	s2,80(sp)
	jal	zero, .L825
.L881:
	lw	s2,80(sp)
	lw	s5,68(sp)
	addi	s3, zero, 9
	jal	zero, .L825
.L883:
	lw	s2,80(sp)
	lw	s5,68(sp)
	addi	s3, zero, 11
	jal	zero, .L825
.L882:
	lw	s2,80(sp)
	lw	s5,68(sp)
	addi	s3, zero, 10
	jal	zero, .L825
.L965:
	lbu	s3,%lo(gCallbackStatus)(s0)
	sw	s7,60(sp)
	sw	s9,52(sp)
	bne	s3,zero,.L957
	beq	a3,a4,.L967
	addi	a5, zero, 3
	bne	a3,a5,.L949
	lbu	a3,1(t3)
	addi	s3, zero, 27
	bne	a3,a4,.L957
	lbu	a3,1(t5)
	bne	a3,a4,.L957
	lbu	a3,2(t3)
	bne	a3,a4,.L957
	lbu	a3,2(t5)
	bne	a3,a4,.L957
	lbu	a3,%lo(gCompHSamp)(t4)
	beq	a3,a4,.L968
	addi	a4, zero, 2
	addi	s3, zero, 27
	beq	a3,a4,.L969
.L957:
	lw	s1,84(sp)
	lw	s2,80(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	lw	s7,60(sp)
	lw	s9,52(sp)
	jal	zero, .L913
.L967:
	lbu	a3,%lo(gCompHSamp)(t4)
	addi	s3, zero, 27
	bne	a3,a4,.L957
	lui	a5,%hi(gCompVSamp)
	lbu	a3,%lo(gCompVSamp)(a5)
	bne	a3,a4,.L957
	lui	a5,%hi(gMaxBlocksPerMCU)
	lui	s2,%hi(gScanType)
	sb	a4,%lo(gMaxBlocksPerMCU)(a5)
	lui	a5,%hi(gMCUOrg)
	sw	zero,%lo(gScanType)(s2)
	sb	zero,%lo(gMCUOrg)(a5)
.L838:
	addi	a1, zero, 7
	addi	a5, zero, 8
.L842:
	lui	a4,%hi(gImageXSize)
	lhu	a3,%lo(gImageXSize)(a4)
	lui	a4,%hi(gMaxMCUXSize)
	sw	a4,8(sp)
	lui	a2,%hi(gMaxMCUXSize)
	addi	a4, zero, 8
	sb	a4,%lo(gMaxMCUXSize)(a2)
	lui	a4,%hi(gMaxMCUYSize)
	sw	a4,12(sp)
	sb	a5,%lo(gMaxMCUYSize)(a4)
	addi	a3,a3,7
	addi	a4, zero, 3
.L871:
	sra	a3,a3,a4
	lui	a4,%hi(gImageYSize)
	lhu	a4,%lo(gImageYSize)(a4)
	addi	a5,a5,-8
	sltu	a5, zero, a5
	add	a4,a4,a1
	addi	a5,a5,3
	sra	a5,a4,a5
	mul	a4,a3,a5
	lui	a2,%hi(gMaxMCUSPerCol)
	lui	t1,%hi(gNumMCUSRemaining)
	sh	a5,%lo(gMaxMCUSPerCol)(a2)
	addi	a0,sp,31
	lui	a5,%hi(gMaxMCUSPerRow)
	sh	a3,%lo(gMaxMCUSPerRow)(a5)
	sh	a4,%lo(gNumMCUSRemaining)(t1)
.Lpcrel_78:
	auipc	ra, %pcrel_hi(processMarkers)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_78)
	addi	s3, a0, 0
	bne	a0,zero,.L847
	lbu	a4,31(sp)
	addi	a5, zero, 218
	addi	s3, zero, 18
	bne	a4,a5,.L847
.Lpcrel_79:
	auipc	ra, %pcrel_hi(getBits.constprop.1)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_79)
	addi	s1, a0, 0
	addi	a0, zero, 0
.Lpcrel_80:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_80)
	addi	a5,s1,-3
	slli	s3,a5,16
	slli	a4,a0,1
	lui	a5,%hi(gCompsInScan)
	srli	s3,s3,16
	sb	a0,%lo(gCompsInScan)(a5)
	addi	a4,a4,3
	bne	s3,a4,.L850
	addi	a4,a0,-1
	slli	a4,a4,16
	srli	a4,a4,16
	addi	a5, zero, 2
	bltu	a5, a4, .L850
	lui	a3,%hi(gCompDCTab)
	lui	a4,%hi(gCompACTab)
	lui	a5,%hi(gCompList)
	addi	s7,a5,%lo(gCompList)
	addi	s9,a3,%lo(gCompDCTab)
	addi	s5,a4,%lo(gCompACTab)
	addi	s6, zero, 0
.L853:
	addi	a0, zero, 0
.Lpcrel_81:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_81)
	addi	s1, a0, 0
	addi	a0, zero, 0
.Lpcrel_82:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_82)
	lbu	a4,%lo(gCompsInFrame)(s4)
	beq	a4,zero,.L851
	lui	a2,%hi(gCompIdent)
	lbu	a3,%lo(gCompIdent)(a2)
	andi	a5,s1,0xff
	beq	a3,a5,.L896
	addi	a3, zero, 1
	beq	a4,a3,.L851
	addi	a3,a2,%lo(gCompIdent)
	lbu	a3,1(a3)
	beq	a3,a5,.L897
	addi	a3, zero, 2
	beq	a4,a3,.L851
	addi	a4,a2,%lo(gCompIdent)
	lbu	a4,2(a4)
	beq	a4,a5,.L970
.L851:
	addi	s3, zero, 15
.L847:
	lbu	a4,%lo(gCallbackStatus)(s0)
	beq	a4,zero,.L957
	addi	s3, a4, 0
	jal	zero, .L957
.L970:
	addi	a4, a3, 0
	addi	a5, a3, 0
.L852:
	sb	a5,0(s7)
	andi	a5,a0,0xff
	add	a3,s9,a4
	srli	a2,a5,4
	sb	a2,0(a3)
	lui	a3,%hi(gCompsInScan)
	lbu	a3,%lo(gCompsInScan)(a3)
	addi	s6,s6,1
	andi	a5,a5,15
	add	a4,s5,a4
	andi	s6,s6,0xff
	sb	a5,0(a4)
	addi	s7,s7,1
	bgeu	s6, a3, .L971
	addi	s3,s3,-2
	jal	zero, .L853
.L949:
	lw	s6,64(sp)
	lw	s7,60(sp)
	lw	s9,52(sp)
.L839:
	lw	s1,84(sp)
	lw	s2,80(sp)
	lw	s5,68(sp)
	addi	s3, zero, 26
	jal	zero, .L913
.L850:
	addi	s3, zero, 14
	jal	zero, .L847
.L968:
	lui	a5,%hi(gCompVSamp)
	lbu	a4,%lo(gCompVSamp)(a5)
	addi	a5, zero, 1
	beq	a4,a5,.L972
	addi	a3, zero, 2
	addi	s3, zero, 27
	bne	a4,a3,.L957
	addi	a5, zero, 3
	lui	s2,%hi(gScanType)
	addi	a4, zero, 4
	sw	a5,%lo(gScanType)(s2)
	lui	a5,%hi(gMaxBlocksPerMCU)
	sb	a4,%lo(gMaxBlocksPerMCU)(a5)
	lui	a5,%hi(gMCUOrg)
	lui	a4, 8208
	sw	a4,%lo(gMCUOrg)(a5)
	addi	a1, zero, 15
	addi	a5, zero, 16
	jal	zero, .L842
.L969:
	lui	a5,%hi(gCompVSamp)
	lbu	a4,%lo(gCompVSamp)(a5)
	addi	a1, zero, 1
	beq	a4,a1,.L973
	bne	a4,a3,.L957
	lui	a5,%hi(gMCUOrg)
	addi	a4,a5,%lo(gMCUOrg)
	sw	zero,%lo(gMCUOrg)(a5)
	addi	a5, zero, 513
	sh	a5,4(a4)
	lui	s2,%hi(gScanType)
	addi	a5, zero, 4
	sw	a5,%lo(gScanType)(s2)
	addi	a4, zero, 6
	lui	a5,%hi(gMaxBlocksPerMCU)
	sb	a4,%lo(gMaxBlocksPerMCU)(a5)
	addi	a1, zero, 15
	addi	a5, zero, 16
.L844:
	lui	a4,%hi(gImageXSize)
	lhu	a3,%lo(gImageXSize)(a4)
	lui	a4,%hi(gMaxMCUXSize)
	sw	a4,8(sp)
	lui	a2,%hi(gMaxMCUXSize)
	addi	a4, zero, 16
	sb	a4,%lo(gMaxMCUXSize)(a2)
	lui	a4,%hi(gMaxMCUYSize)
	sw	a4,12(sp)
	sb	a5,%lo(gMaxMCUYSize)(a4)
	addi	a3,a3,15
	addi	a4, zero, 4
	jal	zero, .L871
.L971:
	addi	a0, zero, 0
.Lpcrel_83:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_83)
	lui	a3,%hi(spectral_start)
	sb	a0,%lo(spectral_start)(a3)
	addi	a0, zero, 0
.Lpcrel_84:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_84)
	lui	a3,%hi(spectral_end)
	sb	a0,%lo(spectral_end)(a3)
	addi	a1, zero, 0
	addi	a0, zero, 4
.Lpcrel_85:
	auipc	ra, %pcrel_hi(getBits)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_85)
	lui	a3,%hi(successive_high)
	sb	a0,%lo(successive_high)(a3)
	addi	a1, zero, 0
	addi	a0, zero, 4
.Lpcrel_86:
	auipc	ra, %pcrel_hi(getBits)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_86)
	addi	a5,s3,-5
	slli	s1,a5,16
	lui	a4,%hi(successive_low)
	srli	s1,s1,16
	sb	a0,%lo(successive_low)(a4)
	beq	s1,zero,.L854
.L855:
	addi	s1,s1,-1
	slli	s1,s1,16
	addi	a0, zero, 0
	srli	s1,s1,16
.Lpcrel_87:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_87)
	bne	s1,zero,.L855
.L854:
	lui	a5,%hi(gCompsInScan)
	lbu	t1,%lo(gCompsInScan)(a5)
	beq	t1,zero,.L856
	lui	a2,%hi(gCompList)
	lbu	a5,%lo(gCompList)(a2)
	lui	a4,%hi(gValidHuffTables)
	lbu	a0,%lo(gValidHuffTables)(a4)
	add	a3,s5,a5
	lbu	a3,0(a3)
	add	a1,s9,a5
	lbu	a1,0(a1)
	addi	a4, zero, 1
	addi	a3,a3,2
	sll	a1,a4,a1
	sll	a3,a4,a3
	or	a3,a3,a1
	and	a1,a0,a3
	bne	a1,a3,.L901
	beq	t1,a4,.L857
	addi	a3,a2,%lo(gCompList)
	lbu	a1,1(a3)
	add	a3,s5,a1
	lbu	a3,0(a3)
	add	a1,s9,a1
	lbu	a1,0(a1)
	addi	a3,a3,2
	sll	a3,a4,a3
	sll	a1,a4,a1
	or	a3,a3,a1
	and	a1,a0,a3
	bne	a1,a3,.L901
	addi	a3, zero, 2
	beq	t1,a3,.L858
	addi	a3,a2,%lo(gCompList)
	lbu	a3,2(a3)
	add	s3,s5,a3
	lbu	a1,0(s3)
	add	a3,s9,a3
	lbu	t3,0(a3)
	addi	a3,a1,2
	sll	a3,a4,a3
	sll	a4,a4,t3
	or	a4,a3,a4
	and	a0,a0,a4
	bne	a0,a4,.L901
.L858:
	lw	a4,4(sp)
	add	a5,a4,a5
	lbu	a5,0(a5)
	lui	a4,%hi(gValidQuantTables)
	lbu	a4,%lo(gValidQuantTables)(a4)
	beq	a5,zero,.L974
	andi	a5,a4,2
	beq	a5,zero,.L911
.L864:
	lui	a3,%hi(gCompList)
	addi	a5,a3,%lo(gCompList)
	lbu	a5,1(a5)
	lw	a2,4(sp)
	add	a5,a2,a5
	lbu	a5,0(a5)
	sltu	a5, zero, a5
	addi	a5,a5,1
	and	a5,a4,a5
	beq	a5,zero,.L911
	addi	a5, zero, 2
	beq	t1,a5,.L856
	addi	a5,a3,%lo(gCompList)
	lbu	a5,2(a5)
	add	a5,a2,a5
	lbu	a5,0(a5)
	sltu	a5, zero, a5
	addi	a5,a5,1
	and	a5,a5,a4
	beq	a5,zero,.L911
.L856:
	lui	a5,%hi(gRestartInterval)
	lhu	a4,%lo(gRestartInterval)(a5)
	lui	a5,%hi(gLastDC)
	sw	zero,%lo(gLastDC)(a5)
	addi	a5,a5,%lo(gLastDC)
	sh	zero,4(a5)
	beq	a4,zero,.L867
	lui	a5,%hi(gRestartsLeft)
	sh	a4,%lo(gRestartsLeft)(a5)
	lui	a5,%hi(gNextRestartNum)
	sh	zero,%lo(gNextRestartNum)(a5)
.L867:
	lbu	a1,%lo(gBitsLeft)(s10)
	lui	a5,%hi(gInBufOfs)
	lui	a4,%hi(gInBufLeft)
	lhu	a3,%lo(gBitBuf)(s11)
	lbu	a5,%lo(gInBufOfs)(a5)
	lbu	a4,%lo(gInBufLeft)(a4)
	bne	a1,zero,.L940
	lui	s1,%hi(.LANCHOR0)
	addi	s1,s1,%lo(.LANCHOR0)
.L868:
	addi	a5,a5,-1
	lui	a2,%hi(gInBufOfs)
	andi	a5,a5,0xff
	srli	a3,a3,8
	sb	a5,%lo(gInBufOfs)(a2)
	add	a5,s1,a5
	addi	a4,a4,1
	addi	a1, zero, 8
	sb	a3,896(a5)
	addi	a0, zero, 1
	lui	a5,%hi(gInBufLeft)
	sb	a4,%lo(gInBufLeft)(a5)
	sb	a1,%lo(gBitsLeft)(s10)
.Lpcrel_88:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_88)
	addi	a0, zero, 1
.Lpcrel_89:
	auipc	ra, %pcrel_hi(getBits.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_89)
	lbu	s3,%lo(gCallbackStatus)(s0)
	bne	s3,zero,.L957
	lui	a5,%hi(gImageXSize)
	lhu	t5,%lo(gImageXSize)(a5)
	lui	a5,%hi(gImageYSize)
	lhu	t4,%lo(gImageYSize)(a5)
	lui	a5,%hi(gMaxMCUSPerRow)
	lhu	a7,%lo(gMaxMCUSPerRow)(a5)
	lui	a5,%hi(gMaxMCUSPerCol)
	lhu	a0,%lo(gMaxMCUSPerCol)(a5)
	lw	a5,8(sp)
	lbu	t3,%lo(gCompsInFrame)(s4)
	lw	t1,%lo(gScanType)(s2)
	lbu	a1,%lo(gMaxMCUXSize)(a5)
	lw	a5,12(sp)
	addi	a3,s1,640
	addi	a4,s1,256
	lbu	a2,%lo(gMaxMCUYSize)(a5)
	sw	t5,0(s8)
	sw	t4,4(s8)
	sw	t3,8(s8)
	sw	t1,20(s8)
	sw	a7,12(s8)
	sw	a0,16(s8)
	sw	a1,24(s8)
	sw	a2,28(s8)
	sw	s1,36(s8)
	sw	a3,32(s8)
	sw	a4,40(s8)
	jal	zero, .L957
.L940:
	addi	a5,a5,-1
	lui	s1,%hi(.LANCHOR0)
	andi	a5,a5,0xff
	addi	s1,s1,%lo(.LANCHOR0)
	add	a1,s1,a5
	addi	a4,a4,1
	sb	a3,896(a1)
	jal	zero, .L868
.L897:
	addi	a4, zero, 1
	addi	a5, a4, 0
	jal	zero, .L852
.L896:
	addi	a5, zero, 0
	addi	a4, zero, 0
	jal	zero, .L852
.L974:
	andi	a5,a4,1
	bne	a5,zero,.L864
.L911:
	addi	s3, zero, 23
	jal	zero, .L847
.L972:
	lui	a5,%hi(gMCUOrg)
	addi	a3, zero, 256
	sh	a3,%lo(gMCUOrg)(a5)
	lui	s2,%hi(gScanType)
	addi	a5,a5,%lo(gMCUOrg)
	addi	a3, zero, 2
	sb	a3,2(a5)
	sw	a4,%lo(gScanType)(s2)
	lui	a5,%hi(gMaxBlocksPerMCU)
	addi	a4, zero, 3
	sb	a4,%lo(gMaxBlocksPerMCU)(a5)
	jal	zero, .L838
.L973:
	lui	a5,%hi(gMaxBlocksPerMCU)
	addi	a4, zero, 4
	sb	a4,%lo(gMaxBlocksPerMCU)(a5)
	lui	s2,%hi(gScanType)
	lui	a5,%hi(gMCUOrg)
	lui	a4, 8208
	sw	a4,%lo(gMCUOrg)(a5)
	sw	a3,%lo(gScanType)(s2)
	addi	a1, zero, 7
	addi	a5, zero, 8
	jal	zero, .L844
.L901:
	addi	s3, zero, 24
	jal	zero, .L847
.L833:
	lbu	s3,%lo(gCallbackStatus)(s0)
	beq	s3,zero,.L839
	lw	s1,84(sp)
	lw	s2,80(sp)
	lw	s5,68(sp)
	jal	zero, .L913
.L857:
	lw	a4,4(sp)
	add	a5,a4,a5
	lbu	a4,0(a5)
	lui	a5,%hi(gValidQuantTables)
	lbu	a5,%lo(gValidQuantTables)(a5)
	beq	a4,zero,.L863
	andi	a5,a5,2
	bne	a5,zero,.L856
	addi	s3, zero, 23
	jal	zero, .L847
.L863:
	andi	a5,a5,1
	bne	a5,zero,.L856
	addi	s3, zero, 23
	jal	zero, .L847
	.size	pjpeg_decode_init, .-pjpeg_decode_init
	.align	2
	.type	benchmark_body.constprop.0.isra.0, @function
benchmark_body.constprop.0.isra.0:
	addi	sp,sp,-32
	sw	s4,8(sp)
	sw	s5,4(sp)
	lui	s4,%hi(pjpeg_need_bytes_callback)
	lui	s5,%hi(.LANCHOR2-1824)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s6,0(sp)
	sw	ra,28(sp)
	addi	s5,s5,%lo(.LANCHOR2-1824)
	addi	s4,s4,%lo(pjpeg_need_bytes_callback)
	addi	s0, zero, 6
	lui	s6,%hi(jpeg_off)
	lui	s2,%hi(gCallbackStatus)
	addi	s3, zero, 1
	lui	s1,%hi(gNumMCUSRemaining)
.L981:
	addi	a3, zero, 0
	addi	a2, zero, 0
	addi	a1, s4, 0
	addi	a0, s5, 0
	sw	zero,%lo(jpeg_off)(s6)
.Lpcrel_90:
	auipc	ra, %pcrel_hi(pjpeg_decode_init)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_90)
	lbu	a5,%lo(gCallbackStatus)(s2)
	beq	a5,zero,.L977
	beq	a5,s3,.L988
.L992:
	jal	zero, .L992
.L980:
.Lpcrel_91:
	auipc	ra, %pcrel_hi(decodeNextMCU)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_91)
	lbu	a5,%lo(gCallbackStatus)(s2)
	bne	a0,zero,.L983
	bne	a5,zero,.L994
	lhu	a5,%lo(gNumMCUSRemaining)(s1)
	addi	a5,a5,-1
	sh	a5,%lo(gNumMCUSRemaining)(s1)
.L977:
	lhu	a5,%lo(gNumMCUSRemaining)(s1)
	bne	a5,zero,.L980
.L988:
	addi	s0,s0,-1
	bne	s0,zero,.L981
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	lw	s5,4(sp)
	lw	s6,0(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L983:
	beq	a5,zero,.L977
	addi	a4, zero, 1
	beq	a5,a4,.L988
	jal	zero, .L992
.L994:
	beq	a5,s3,.L988
	jal	zero, .L992
	.size	benchmark_body.constprop.0.isra.0, .-benchmark_body.constprop.0.isra.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	bge	zero, a0, .L1014
	addi	sp,sp,-48
	sw	s5,20(sp)
	sw	s6,16(sp)
	lui	s5,%hi(pjpeg_need_bytes_callback)
	lui	s6,%hi(.LANCHOR2-1824)
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s7,12(sp)
	sw	ra,44(sp)
	addi	s3, a0, 0
	addi	s6,s6,%lo(.LANCHOR2-1824)
	addi	s5,s5,%lo(pjpeg_need_bytes_callback)
	addi	s0, zero, 0
	lui	s7,%hi(jpeg_off)
	lui	s2,%hi(gCallbackStatus)
	addi	s4, zero, 1
	lui	s1,%hi(gNumMCUSRemaining)
.L996:
	addi	a3, zero, 0
	addi	a2, zero, 0
	addi	a1, s5, 0
	addi	a0, s6, 0
	sw	zero,%lo(jpeg_off)(s7)
.Lpcrel_92:
	auipc	ra, %pcrel_hi(pjpeg_decode_init)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_92)
	lbu	a5,%lo(gCallbackStatus)(s2)
	beq	a5,zero,.L998
	beq	a5,s4,.L1008
.L1012:
	jal	zero, .L1012
.L1001:
.Lpcrel_93:
	auipc	ra, %pcrel_hi(decodeNextMCU)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_93)
	lbu	a5,%lo(gCallbackStatus)(s2)
	bne	a0,zero,.L1003
	bne	a5,zero,.L1017
	lhu	a5,%lo(gNumMCUSRemaining)(s1)
	addi	a5,a5,-1
	sh	a5,%lo(gNumMCUSRemaining)(s1)
.L998:
	lhu	a5,%lo(gNumMCUSRemaining)(s1)
	bne	a5,zero,.L1001
.L1008:
	addi	s0,s0,1
	bne	s0,s3,.L996
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
	addi	sp,sp,48
	jalr	zero, ra, 0
.L1003:
	beq	a5,zero,.L998
	addi	a4, zero, 1
	beq	a5,a4,.L1008
	jal	zero, .L1012
.L1017:
	beq	a5,s4,.L1008
	jal	zero, .L1012
.L1014:
	jalr	zero, ra, 0
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.globl	initialise_board
	.type	initialise_board, @function
initialise_board:
	jalr	zero, ra, 0
	.size	initialise_board, .-initialise_board
	.align	2
	.globl	start_trigger
	.type	start_trigger, @function
start_trigger:
	jalr	zero, ra, 0
	.size	start_trigger, .-start_trigger
	.align	2
	.globl	stop_trigger
	.type	stop_trigger, @function
stop_trigger:
	jalr	zero, ra, 0
	.size	stop_trigger, .-stop_trigger
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a6,%hi(.LANCHOR2)
	addi	a6,a6,%lo(.LANCHOR2)
	lui	a0,%hi(.LANCHOR1)
	lw	a4,-1792(a6)
	addi	a0,a0,%lo(.LANCHOR1)
	addi	a5,a0,796
	addi	a1,a0,860
.L1025:
	lbu	a2,0(a4)
	lbu	a3,0(a5)
	addi	a4,a4,1
	addi	a5,a5,1
	bne	a2,a3,.L1031
	bne	a5,a1,.L1025
	lw	a4,-1788(a6)
	addi	a5,a0,860
	addi	a1,a0,924
.L1028:
	lbu	a2,0(a4)
	lbu	a3,0(a5)
	addi	a4,a4,1
	addi	a5,a5,1
	bne	a2,a3,.L1031
	bne	a5,a1,.L1028
	addi	a5,a0,925
	lw	a4,-1784(a6)
	addi	a0,a0,988
	addi	a2, zero, 67
	jal	zero, .L1030
.L1036:
	lbu	a2,0(a5)
	addi	a5,a5,1
.L1030:
	lbu	a3,0(a4)
	addi	a4,a4,1
	bne	a3,a2,.L1031
	bne	a0,a5,.L1036
	addi	a0, zero, 1
	jalr	zero, ra, 0
.L1031:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	verify_benchmark, .-verify_benchmark
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
.Lpcrel_94:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_94)
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
.Lpcrel_95:
	auipc	ra, %pcrel_hi(benchmark_body.constprop.0.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_95)
	lw	ra,12(sp)
	addi	a0, zero, 0
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	benchmark, .-benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	addi	a0, zero, 1
	sw	ra,28(sp)
.Lpcrel_96:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_96)
.Lpcrel_97:
	auipc	ra, %pcrel_hi(benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_97)
	sw	zero,12(sp)
	lw	a0,12(sp)
.Lpcrel_98:
	auipc	ra, %pcrel_hi(verify_benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_98)
	lw	ra,28(sp)
	xori	a0,a0,1
	addi	sp,sp,32
	jalr	zero, ra, 0
	.size	main, .-main
	.globl	pInfo
	.globl	jpeg_off
	.globl	jpeg_data
	.globl	gWinogradQuant
	.globl	successive_low
	.globl	successive_high
	.globl	spectral_end
	.globl	spectral_start
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.set	.LANCHOR2,. + 4096
	.type	gMCUBufG, @object
	.size	gMCUBufG, 256
gMCUBufG:
	.zero	256
	.type	gMCUBufB, @object
	.size	gMCUBufB, 256
gMCUBufB:
	.zero	256
	.type	gCoeffBuf, @object
	.size	gCoeffBuf, 128
gCoeffBuf:
	.zero	128
	.type	gMCUBufR, @object
	.size	gMCUBufR, 256
gMCUBufR:
	.zero	256
	.type	gInBuf, @object
	.size	gInBuf, 256
gInBuf:
	.zero	256
	.type	gQuant1, @object
	.size	gQuant1, 128
gQuant1:
	.zero	128
	.type	gQuant0, @object
	.size	gQuant0, 128
gQuant0:
	.zero	128
	.type	gHuffTab1, @object
	.size	gHuffTab1, 80
gHuffTab1:
	.zero	80
	.type	gHuffVal1, @object
	.size	gHuffVal1, 16
gHuffVal1:
	.zero	16
	.type	gHuffTab0, @object
	.size	gHuffTab0, 80
gHuffTab0:
	.zero	80
	.type	gHuffVal0, @object
	.size	gHuffVal0, 16
gHuffVal0:
	.zero	16
	.type	gHuffVal3, @object
	.size	gHuffVal3, 256
gHuffVal3:
	.zero	256
	.type	gHuffVal2, @object
	.size	gHuffVal2, 256
gHuffVal2:
	.zero	256
	.type	gHuffTab3, @object
	.size	gHuffTab3, 80
gHuffTab3:
	.zero	80
	.type	gHuffTab2, @object
	.size	gHuffTab2, 80
gHuffTab2:
	.zero	80
	.type	pInfo, @object
	.size	pInfo, 44
pInfo:
	.zero	44
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	jpeg_data, @object
	.size	jpeg_data, 570
jpeg_data:
	.base64	"/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAFA3PEY8MlBGQUZaVVBfeMiCeG5uePWvuZHI////////////////////////////////////////////////////2wBDAVVaWnhpeOuCguv/////////////////////////////////////////////////////////////////////////wAARCABAADMDAREAAhEBAxEB/8QAGAAAAwEBAAAAAAAAAAAAAAAAAQIDAAT/xAAmEAACAgEDAwQDAQAAAAAAAAABAgARAxIhMUFhcQQiU5ETI1Fi/8QAFQEBAQAAAAAA"
	.base64	"AAAAAAAAAAAAAAH/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwDHiAsoTWbhAs9YBUWIAKkQNA6vb2hUM2QDYQJqSdtJhFlQkVCgPaSAfIgY1UgFCUPr/wAr9QJ41BysSBCOtVWoDKUv21IqGVP2ggShDkX4hA2tfiEg0DAEk1yZQ+LGVyDU130gOuFA9knxIKOLF8UJRyY1BbUeIHUClcD6gc9SDGwNoCW93dHzKihDsAQOOtwpshP4ahElUyKpfeAuqAbB2qApIU0wNSoouReFBhVQl4zY7yDlAfnTUqG1DrAUkDkyKOJg2RfMotmxAjVYHmAM"
	.base64	"WJUGpiD4kDtnQbCzAk+cVUCOtf4JURLXAf07EZl7mFV9S7tkAOy9BAVFYjayO0IbKhxAdLgRBgC4H//Z"
	.zero	2
	.type	CSWTCH.294, @object
	.size	CSWTCH.294, 30
CSWTCH.294:
	.half	1
	.half	2
	.half	4
	.half	8
	.half	16
	.half	32
	.half	64
	.half	128
	.half	256
	.half	512
	.half	1024
	.half	2048
	.half	4096
	.half	8192
	.half	16384
	.zero	2
	.type	CSWTCH.296, @object
	.size	CSWTCH.296, 30
CSWTCH.296:
	.half	-1
	.half	-3
	.half	-7
	.half	-15
	.half	-31
	.half	-63
	.half	-127
	.half	-255
	.half	-511
	.half	-1023
	.half	-2047
	.half	-4095
	.half	-8191
	.half	-16383
	.half	-32767
	.zero	2
	.type	ZAG, @object
	.size	ZAG, 64
ZAG:
	.base64	"AAEIEAkCAwoRGCAZEgsEBQwTGiEoMCkiGxQNBgcOFRwjKjE4OTIrJB0WDxceJSwzOjs0LSYfJy41PD02Lzc+Pw=="
	.type	CSWTCH.301, @object
	.size	CSWTCH.301, 16
CSWTCH.301:
	.word	gHuffTab0
	.word	gHuffTab1
	.word	gHuffTab2
	.word	gHuffTab3
	.type	CSWTCH.303, @object
	.size	CSWTCH.303, 16
CSWTCH.303:
	.word	gHuffVal0
	.word	gHuffVal1
	.word	gHuffVal2
	.word	gHuffVal3
	.type	gWinogradQuant, @object
	.size	gWinogradQuant, 64
gWinogradQuant:
	.base64	"gLKyp/anl+jol4DR29GAZbLFxbJlRYunsaeLRSNgg5eXg2AjMVt2gHZbMS5RZWVRLipFT0UqIzY2IxwlHBMTCg=="
	.type	r_ref.2, @object
	.size	r_ref.2, 64
r_ref.2:
	.base64	"ISEhISEhISEgICAgICAgIB0dHR0dHR0dGRkZGRkZGRkVFRUVFRUVFRERERERERERDg4ODg4ODg4NDQ0NDQ0NDQ=="
	.type	g_ref.1, @object
	.size	g_ref.1, 64
g_ref.1:
	.ascii	"555555554444444411111111--------))))))))%%%%%%%%\"\"\"\"\"\""
	.ascii	"\"\"!!!!!!!!"
	.type	b_ref.0, @object
	.size	b_ref.0, 64
b_ref.0:
	.ascii	"CCCCCCCCBBBBBBBB????????;;;;;;;;777777773333333300000000////"
	.ascii	"////"
	.section	.sbss,"aw",@nobits
	.align	2
	.type	jpeg_off, @object
	.size	jpeg_off, 4
jpeg_off:
	.zero	4
	.type	successive_low, @object
	.size	successive_low, 1
successive_low:
	.zero	1
	.type	successive_high, @object
	.size	successive_high, 1
successive_high:
	.zero	1
	.type	spectral_end, @object
	.size	spectral_end, 1
spectral_end:
	.zero	1
	.type	spectral_start, @object
	.size	spectral_start, 1
spectral_start:
	.zero	1
	.type	gReduce, @object
	.size	gReduce, 1
gReduce:
	.zero	1
	.type	gCallbackStatus, @object
	.size	gCallbackStatus, 1
gCallbackStatus:
	.zero	1
	.zero	2
	.type	g_pCallback_data, @object
	.size	g_pCallback_data, 4
g_pCallback_data:
	.zero	4
	.type	g_pNeedBytesCallback, @object
	.size	g_pNeedBytesCallback, 4
g_pNeedBytesCallback:
	.zero	4
	.type	gMCUOrg, @object
	.size	gMCUOrg, 6
gMCUOrg:
	.zero	6
	.type	gNumMCUSRemaining, @object
	.size	gNumMCUSRemaining, 2
gNumMCUSRemaining:
	.zero	2
	.type	gMaxMCUSPerCol, @object
	.size	gMaxMCUSPerCol, 2
gMaxMCUSPerCol:
	.zero	2
	.type	gMaxMCUSPerRow, @object
	.size	gMaxMCUSPerRow, 2
gMaxMCUSPerRow:
	.zero	2
	.type	gMaxMCUYSize, @object
	.size	gMaxMCUYSize, 1
gMaxMCUYSize:
	.zero	1
	.type	gMaxMCUXSize, @object
	.size	gMaxMCUXSize, 1
gMaxMCUXSize:
	.zero	1
	.type	gMaxBlocksPerMCU, @object
	.size	gMaxBlocksPerMCU, 1
gMaxBlocksPerMCU:
	.zero	1
	.zero	1
	.type	gScanType, @object
	.size	gScanType, 4
gScanType:
	.zero	4
	.type	gCompACTab, @object
	.size	gCompACTab, 3
gCompACTab:
	.zero	3
	.zero	1
	.type	gCompDCTab, @object
	.size	gCompDCTab, 3
gCompDCTab:
	.zero	3
	.zero	1
	.type	gCompList, @object
	.size	gCompList, 3
gCompList:
	.zero	3
	.type	gCompsInScan, @object
	.size	gCompsInScan, 1
gCompsInScan:
	.zero	1
	.type	gRestartsLeft, @object
	.size	gRestartsLeft, 2
gRestartsLeft:
	.zero	2
	.type	gNextRestartNum, @object
	.size	gNextRestartNum, 2
gNextRestartNum:
	.zero	2
	.type	gRestartInterval, @object
	.size	gRestartInterval, 2
gRestartInterval:
	.zero	2
	.zero	2
	.type	gCompQuant, @object
	.size	gCompQuant, 3
gCompQuant:
	.zero	3
	.zero	1
	.type	gCompVSamp, @object
	.size	gCompVSamp, 3
gCompVSamp:
	.zero	3
	.zero	1
	.type	gCompHSamp, @object
	.size	gCompHSamp, 3
gCompHSamp:
	.zero	3
	.zero	1
	.type	gCompIdent, @object
	.size	gCompIdent, 3
gCompIdent:
	.zero	3
	.type	gCompsInFrame, @object
	.size	gCompsInFrame, 1
gCompsInFrame:
	.zero	1
	.type	gImageYSize, @object
	.size	gImageYSize, 2
gImageYSize:
	.zero	2
	.type	gImageXSize, @object
	.size	gImageXSize, 2
gImageXSize:
	.zero	2
	.type	gBitsLeft, @object
	.size	gBitsLeft, 1
gBitsLeft:
	.zero	1
	.zero	1
	.type	gBitBuf, @object
	.size	gBitBuf, 2
gBitBuf:
	.zero	2
	.type	gInBufLeft, @object
	.size	gInBufLeft, 1
gInBufLeft:
	.zero	1
	.type	gInBufOfs, @object
	.size	gInBufOfs, 1
gInBufOfs:
	.zero	1
	.type	gTemFlag, @object
	.size	gTemFlag, 1
gTemFlag:
	.zero	1
	.type	gValidQuantTables, @object
	.size	gValidQuantTables, 1
gValidQuantTables:
	.zero	1
	.type	gValidHuffTables, @object
	.size	gValidHuffTables, 1
gValidHuffTables:
	.zero	1
	.zero	3
	.type	gLastDC, @object
	.size	gLastDC, 6
gLastDC:
	.zero	6
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits


    .text
    .align 2
__mul:
    add    a2, a0, x0
    addi   a0, x0, 0
.Mul_loop:
    andi   a3, a1, 1
    beq    a3, x0, .Mul_skip
    add    a0, a0, a2
.Mul_skip:
    srli   a1, a1, 1
    slli   a2, a2, 1
    bne    a1, x0, .Mul_loop
    jalr   x0, ra, 0

.text
.align 2

# Signed 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_divsi3
__riscv_div_lib_divsi3:
    blt   a0, zero, __riscv_div_lib_L10      # bltz a0 -> blt a0, zero
    blt   a1, zero, __riscv_div_lib_L11      # bltz a1 -> blt a1, zero
    # Since the quotient is positive, fall into udivsi3

# Unsigned 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_udivsi3
__riscv_div_lib_udivsi3:
    addi  a2, a1, 0                           # mv a2, a1 -> addi a2, a1, 0
    addi  a1, a0, 0                           # mv a1, a0 -> addi a1, a0, 0
    addi  a0, zero, -1                        # li a0, -1 -> addi a0, zero, -1
    beq   a2, zero, __riscv_div_lib_L5       # beqz a2 -> beq a2, zero
    addi  a3, zero, 1                         # li a3, 1 -> addi a3, zero, 1
    bgeu  a2, a1, __riscv_div_lib_L2
__riscv_div_lib_L1:
    bge   zero, a2, __riscv_div_lib_L2       # blez a2 -> bge zero, a2
    slli  a2, a2, 1
    slli  a3, a3, 1
    bltu  a2, a1, __riscv_div_lib_L1         # bgtu a1, a2 -> bltu a2, a1
__riscv_div_lib_L2:
    addi  a0, zero, 0                         # li a0, 0 -> addi a0, zero, 0
__riscv_div_lib_L3:
    bltu  a1, a2, __riscv_div_lib_L4
    sub   a1, a1, a2
    or    a0, a0, a3
__riscv_div_lib_L4:
    srli  a3, a3, 1
    srli  a2, a2, 1
    bne   a3, zero, __riscv_div_lib_L3       # bnez a3 -> bne a3, zero
__riscv_div_lib_L5:
    jalr  zero, ra, 0                         # ret -> jalr zero, ra, 0

# Unsigned 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_umodsi3
__riscv_div_lib_umodsi3:
    # Call udivsi3(a0, a1), then return the remainder, which is in a1
    addi  t0, ra, 0                           # mv t0, ra -> addi t0, ra, 0
.Lpcrel_div1:
    auipc ra, %pcrel_hi(__riscv_div_lib_udivsi3)
    jalr  ra, ra, %pcrel_lo(.Lpcrel_div1)
    addi  a0, a1, 0                           # mv a0, a1 -> addi a0, a1, 0
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0

# Handle negative arguments to divsi3
__riscv_div_lib_L10:
    sub   a0, zero, a0                        # neg a0, a0 -> sub a0, zero, a0
    # Zero is handled as a negative so that the result will not be inverted
    blt   zero, a1, __riscv_div_lib_L12      # bgtz a1 -> blt zero, a1

    sub   a1, zero, a1                        # neg a1, a1 -> sub a1, zero, a1
    jal   zero, __riscv_div_lib_udivsi3      # j __riscv_div_lib_udivsi3 -> jal zero
__riscv_div_lib_L11:                         # Compute udivsi3(a0, -a1), then negate
    sub   a1, zero, a1                        # neg a1, a1 -> sub a1, zero, a1
__riscv_div_lib_L12:
    addi  t0, ra, 0                           # mv t0, ra -> addi t0, ra, 0
.Lpcrel_div2:
    auipc ra, %pcrel_hi(__riscv_div_lib_udivsi3)
    jalr  ra, ra, %pcrel_lo(.Lpcrel_div2)
    sub   a0, zero, a0                        # neg a0, a0 -> sub a0, zero, a0
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0

# Signed 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_modsi3
__riscv_div_lib_modsi3:
    addi  t0, ra, 0                           # mv t0, ra -> addi t0, ra, 0
    blt   a1, zero, __riscv_div_lib_L31      # bltz a1 -> blt a1, zero
    blt   a0, zero, __riscv_div_lib_L32      # bltz a0 -> blt a0, zero
__riscv_div_lib_L30:
.Lpcrel_div3:
    auipc ra, %pcrel_hi(__riscv_div_lib_udivsi3)
    jalr  ra, ra, %pcrel_lo(.Lpcrel_div3)
    addi  a0, a1, 0                           # mv a0, a1 -> addi a0, a1, 0
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0
__riscv_div_lib_L31:
    sub   a1, zero, a1                        # neg a1, a1 -> sub a1, zero, a1
    bge   a0, zero, __riscv_div_lib_L30      # bgez a0 -> bge a0, zero
__riscv_div_lib_L32:
    sub   a0, zero, a0                        # neg a0, a0 -> sub a0, zero, a0
.Lpcrel_div4:
    auipc ra, %pcrel_hi(__riscv_div_lib_udivsi3)
    jalr  ra, ra, %pcrel_lo(.Lpcrel_div4)
    sub   a0, zero, a1                        # neg a0, a1 -> sub a0, zero, a1
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0

# end of subrountine