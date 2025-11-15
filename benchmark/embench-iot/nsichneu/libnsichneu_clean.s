	.file	"libnsichneu.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	bge	zero, a0, .L1
	lui	a4,%hi(.LANCHOR0)
	addi	a4,a4,%lo(.LANCHOR0)
	addi	t1, zero, 0
	lui	a6,%hi(P1_is_marked)
	lui	a5,%hi(P2_is_marked)
	lui	a1,%hi(P3_is_marked)
	addi	a2, zero, 3
	addi	t4, zero, 5
	addi	a7, zero, 2
	addi	a3, zero, 4
.L129:
	sw	a2,%lo(P1_is_marked)(a6)
	sw	t4,%lo(P2_is_marked)(a5)
	sw	zero,%lo(P3_is_marked)(a1)
	lw	t3,%lo(P1_is_marked)(a6)
	bge	a7, t3, .L3
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L3
	lw	t5,4(a4)
	lw	t3,8(a4)
	beq	t5,t3,.L132
.L3:
	lw	t3,%lo(P1_is_marked)(a6)
	bge	a7, t3, .L4
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L4
	lw	t5,8(a4)
	lw	t3,4(a4)
	beq	t5,t3,.L133
.L4:
	lw	t3,%lo(P1_is_marked)(a6)
	bge	a7, t3, .L5
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L5
	lw	t5,0(a4)
	lw	t3,8(a4)
	beq	t5,t3,.L134
.L5:
	lw	t3,%lo(P1_is_marked)(a6)
	bge	a7, t3, .L6
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L6
	lw	t5,8(a4)
	lw	t3,0(a4)
	beq	t5,t3,.L135
.L6:
	lw	t3,%lo(P1_is_marked)(a6)
	bge	a7, t3, .L7
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L7
	lw	t5,0(a4)
	lw	t3,4(a4)
	beq	t5,t3,.L136
.L7:
	lw	t3,%lo(P1_is_marked)(a6)
	bge	a7, t3, .L8
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L8
	lw	t5,4(a4)
	lw	t3,0(a4)
	beq	t5,t3,.L137
.L8:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L9
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L9
	lw	t5,40(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L138
.L9:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L10
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L10
	lw	t5,40(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L139
.L10:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L11
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L11
	lw	t5,44(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L140
.L11:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L12
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L12
	lw	t5,44(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L141
.L12:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L13
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L13
	lw	t5,48(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L142
.L13:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L14
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L14
	lw	t5,48(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L143
.L14:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L15
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L15
	lw	t5,36(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L144
.L15:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L16
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L16
	lw	t5,36(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L145
.L16:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L17
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L17
	lw	t5,44(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L146
.L17:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L18
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L18
	lw	t5,44(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L147
.L18:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L19
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L19
	lw	t5,48(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L148
.L19:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L20
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L20
	lw	t5,48(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L149
.L20:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L21
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L21
	lw	t5,36(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L150
.L21:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L22
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L22
	lw	t5,36(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L151
.L22:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L23
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L23
	lw	t5,40(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L152
.L23:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L24
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L24
	lw	t5,40(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L153
.L24:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L25
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L25
	lw	t5,48(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L154
.L25:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L26
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L26
	lw	t5,48(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L155
.L26:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L27
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L27
	lw	t5,36(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L156
.L27:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L28
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L28
	lw	t5,36(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L157
.L28:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L29
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L29
	lw	t5,40(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L158
.L29:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L30
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L30
	lw	t5,40(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L159
.L30:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L31
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L31
	lw	t5,44(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L160
.L31:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a2, t3, .L32
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L32
	lw	t5,44(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L161
.L32:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L33
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L33
	lw	t5,40(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L162
.L33:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L34
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L34
	lw	t5,40(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L163
.L34:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L35
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L35
	lw	t5,40(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L164
.L35:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L36
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L36
	lw	t5,40(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L165
.L36:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L37
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L37
	lw	t5,44(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L166
.L37:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L38
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L38
	lw	t5,44(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L167
.L38:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L39
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L39
	lw	t5,44(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L168
.L39:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L40
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L40
	lw	t5,44(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L169
.L40:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L41
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L41
	lw	t5,48(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L170
.L41:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L42
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L42
	lw	t5,48(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L171
.L42:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L43
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L43
	lw	t5,48(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L172
.L43:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L44
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L44
	lw	t5,48(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L173
.L44:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L45
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L45
	lw	t5,52(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L174
.L45:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L46
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L46
	lw	t5,52(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L175
.L46:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L47
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L47
	lw	t5,52(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L176
.L47:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L48
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L48
	lw	t5,52(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L177
.L48:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L49
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L49
	lw	t5,52(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L178
.L49:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L50
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L50
	lw	t5,52(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L179
.L50:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L51
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L51
	lw	t5,36(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L180
.L51:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L52
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L52
	lw	t5,36(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L181
.L52:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L53
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L53
	lw	t5,36(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L182
.L53:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L54
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L54
	lw	t5,36(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L183
.L54:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L55
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L55
	lw	t5,44(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L184
.L55:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L56
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L56
	lw	t5,44(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L185
.L56:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L57
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L57
	lw	t5,44(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L186
.L57:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L58
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L58
	lw	t5,44(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L187
.L58:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L59
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L59
	lw	t5,48(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L188
.L59:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L60
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L60
	lw	t5,48(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L189
.L60:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L61
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L61
	lw	t5,48(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L190
.L61:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L62
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L62
	lw	t5,48(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L191
.L62:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L63
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L63
	lw	t5,52(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L192
.L63:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L64
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L64
	lw	t5,52(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L193
.L64:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L65
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L65
	lw	t5,52(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L194
.L65:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L66
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L66
	lw	t5,52(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L195
.L66:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L67
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L67
	lw	t5,52(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L196
.L67:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L68
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L68
	lw	t5,52(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L197
.L68:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L69
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L69
	lw	t5,36(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L198
.L69:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L70
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L70
	lw	t5,36(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L199
.L70:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L71
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L71
	lw	t5,36(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L200
.L71:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L72
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L72
	lw	t5,36(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L201
.L72:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L73
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L73
	lw	t5,40(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L202
.L73:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L74
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L74
	lw	t5,40(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L203
.L74:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L75
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L75
	lw	t5,40(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L204
.L75:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L76
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L76
	lw	t5,40(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L205
.L76:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L77
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L77
	lw	t5,48(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L206
.L77:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L78
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L78
	lw	t5,48(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L207
.L78:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L79
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L79
	lw	t5,48(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L208
.L79:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L80
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L80
	lw	t5,48(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L209
.L80:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L81
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L81
	lw	t5,52(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L210
.L81:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L82
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L82
	lw	t5,52(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L211
.L82:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L83
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L83
	lw	t5,52(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L212
.L83:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L84
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L84
	lw	t5,52(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L213
.L84:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L85
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L85
	lw	t5,52(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L214
.L85:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L86
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L86
	lw	t5,52(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L215
.L86:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L87
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L87
	lw	t5,36(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L216
.L87:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L88
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L88
	lw	t5,36(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L217
.L88:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L89
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L89
	lw	t5,36(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L218
.L89:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L90
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L90
	lw	t5,36(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L219
.L90:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L91
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L91
	lw	t5,40(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L220
.L91:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L92
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L92
	lw	t5,40(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L221
.L92:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L93
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L93
	lw	t5,40(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L222
.L93:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L94
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L94
	lw	t5,40(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L223
.L94:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L95
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L95
	lw	t5,44(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L224
.L95:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L96
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L96
	lw	t5,44(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L225
.L96:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L97
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L97
	lw	t5,44(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L226
.L97:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L98
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L98
	lw	t5,44(a4)
	lw	t3,52(a4)
	beq	t5,t3,.L227
.L98:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L99
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L99
	lw	t5,52(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L228
.L99:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L100
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L100
	lw	t5,52(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L229
.L100:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L101
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L101
	lw	t5,52(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L230
.L101:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L102
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L102
	lw	t5,52(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L231
.L102:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L103
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L103
	lw	t5,52(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L232
.L103:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L104
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L104
	lw	t5,52(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L233
.L104:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L105
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L105
	lw	t5,36(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L234
.L105:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L106
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L106
	lw	t5,36(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L235
.L106:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L107
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L107
	lw	t5,36(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L236
.L107:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L108
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L108
	lw	t5,36(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L237
.L108:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L109
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L109
	lw	t5,36(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L238
.L109:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L110
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L110
	lw	t5,36(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L239
.L110:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L111
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L111
	lw	t5,40(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L240
.L111:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L112
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L112
	lw	t5,40(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L241
.L112:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L113
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L113
	lw	t5,40(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L242
.L113:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L114
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L114
	lw	t5,40(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L243
.L114:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L115
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L115
	lw	t5,40(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L244
.L115:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L116
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L116
	lw	t5,40(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L245
.L116:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L117
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L117
	lw	t5,44(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L246
.L117:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L118
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L118
	lw	t5,44(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L247
.L118:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L119
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L119
	lw	t5,44(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L248
.L119:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L120
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L120
	lw	t5,44(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L249
.L120:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L121
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L121
	lw	t5,44(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L250
.L121:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L122
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L122
	lw	t5,44(a4)
	lw	t3,48(a4)
	beq	t5,t3,.L251
.L122:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L123
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L123
	lw	t5,48(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L252
.L123:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L124
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L124
	lw	t5,48(a4)
	lw	t3,36(a4)
	beq	t5,t3,.L253
.L124:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L125
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L125
	lw	t5,48(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L254
.L125:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L126
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L126
	lw	t5,48(a4)
	lw	t3,40(a4)
	beq	t5,t3,.L255
.L126:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L127
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L127
	lw	t5,48(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L256
.L127:
	lw	t3,%lo(P2_is_marked)(a5)
	bge	a3, t3, .L128
	lw	t3,%lo(P3_is_marked)(a1)
	blt	a2, t3, .L128
	lw	t5,48(a4)
	lw	t3,44(a4)
	beq	t5,t3,.L257
.L128:
	addi	t1,t1,1
	bne	t1,a0,.L129
.L1:
	jalr	zero, ra, 0
.L255:
	lw	t5,48(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L126
	lw	t3,52(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L126
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L126
.L256:
	lw	t5,48(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L127
	lw	t3,52(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L127
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L127
.L251:
	lw	t5,44(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L122
	lw	t3,52(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L122
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L122
.L252:
	lw	t5,48(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L123
	lw	t3,52(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L123
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L123
.L253:
	lw	t5,48(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L124
	lw	t3,52(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L124
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L124
.L254:
	lw	t5,48(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L125
	lw	t3,52(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L125
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L125
.L243:
	lw	t5,40(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L114
	lw	t3,52(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L114
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L114
.L244:
	lw	t5,40(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L115
	lw	t3,52(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L115
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L115
.L245:
	lw	t5,40(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L116
	lw	t3,52(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L116
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L116
.L246:
	lw	t5,44(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L117
	lw	t3,52(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L117
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L117
.L247:
	lw	t5,44(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L118
	lw	t3,52(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L118
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L118
.L248:
	lw	t5,44(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L119
	lw	t3,52(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L119
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L119
.L249:
	lw	t5,44(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L120
	lw	t3,52(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L120
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L120
.L250:
	lw	t5,44(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L121
	lw	t3,52(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L121
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L121
.L227:
	lw	t5,44(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L98
	lw	t3,48(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L98
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L98
.L228:
	lw	t5,52(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L99
	lw	t3,48(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L99
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L99
.L229:
	lw	t5,52(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L100
	lw	t3,48(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L100
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L100
.L230:
	lw	t5,52(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L101
	lw	t3,48(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L101
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L101
.L231:
	lw	t5,52(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L102
	lw	t3,48(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L102
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L102
.L232:
	lw	t5,52(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L103
	lw	t3,48(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L103
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L103
.L233:
	lw	t5,52(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L104
	lw	t3,48(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L104
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L104
.L234:
	lw	t5,36(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L105
	lw	t3,52(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L105
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L105
.L235:
	lw	t5,36(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L106
	lw	t3,52(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L106
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L106
.L236:
	lw	t5,36(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L107
	lw	t3,52(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L107
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L107
.L237:
	lw	t5,36(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L108
	lw	t3,52(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L108
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L108
.L238:
	lw	t5,36(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L109
	lw	t3,52(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L109
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L109
.L239:
	lw	t5,36(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L110
	lw	t3,52(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L110
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L110
.L240:
	lw	t5,40(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L111
	lw	t3,52(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L111
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L111
.L241:
	lw	t5,40(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L112
	lw	t3,52(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L112
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L112
.L242:
	lw	t5,40(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L113
	lw	t3,52(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L113
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L113
.L195:
	lw	t5,52(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L66
	lw	t3,40(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L66
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L66
.L196:
	lw	t5,52(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L67
	lw	t3,40(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L67
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L67
.L197:
	lw	t5,52(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L68
	lw	t3,40(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L68
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L68
.L198:
	lw	t5,36(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L69
	lw	t3,44(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L69
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L69
.L199:
	lw	t5,36(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L70
	lw	t3,44(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L70
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L70
.L200:
	lw	t5,36(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L71
	lw	t3,44(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L71
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L71
.L201:
	lw	t5,36(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L72
	lw	t3,44(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L72
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L72
.L202:
	lw	t5,40(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L73
	lw	t3,44(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L73
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L73
.L203:
	lw	t5,40(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L74
	lw	t3,44(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L74
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L74
.L204:
	lw	t5,40(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L75
	lw	t3,44(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L75
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L75
.L205:
	lw	t5,40(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L76
	lw	t3,44(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L76
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L76
.L206:
	lw	t5,48(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L77
	lw	t3,44(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L77
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L77
.L207:
	lw	t5,48(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L78
	lw	t3,44(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L78
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L78
.L208:
	lw	t5,48(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L79
	lw	t3,44(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L79
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L79
.L209:
	lw	t5,48(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L80
	lw	t3,44(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L80
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L80
.L210:
	lw	t5,52(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L81
	lw	t3,44(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L81
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L81
.L211:
	lw	t5,52(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L82
	lw	t3,44(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L82
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L82
.L212:
	lw	t5,52(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L83
	lw	t3,44(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L83
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L83
.L213:
	lw	t5,52(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L84
	lw	t3,44(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L84
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L84
.L214:
	lw	t5,52(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L85
	lw	t3,44(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L85
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L85
.L215:
	lw	t5,52(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L86
	lw	t3,44(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L86
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L86
.L216:
	lw	t5,36(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L87
	lw	t3,48(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L87
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L87
.L217:
	lw	t5,36(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L88
	lw	t3,48(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L88
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L88
.L218:
	lw	t5,36(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L89
	lw	t3,48(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L89
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L89
.L219:
	lw	t5,36(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L90
	lw	t3,48(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L90
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L90
.L220:
	lw	t5,40(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L91
	lw	t3,48(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L91
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L91
.L221:
	lw	t5,40(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L92
	lw	t3,48(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L92
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L92
.L222:
	lw	t5,40(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L93
	lw	t3,48(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L93
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L93
.L223:
	lw	t5,40(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L94
	lw	t3,48(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L94
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L94
.L224:
	lw	t5,44(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L95
	lw	t3,48(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L95
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L95
.L225:
	lw	t5,44(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L96
	lw	t3,48(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L96
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L96
.L226:
	lw	t5,44(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L97
	lw	t3,48(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L97
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L97
.L257:
	lw	t5,48(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L128
	lw	t3,52(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L128
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L128
.L132:
	lw	t3,0(a4)
	lw	t5,4(a4)
	bge	t3,t5,.L3
	lw	t6,%lo(P1_is_marked)(a6)
	sub	t0,t3,t5
	addi	t6,t6,-3
	sw	t6,%lo(P1_is_marked)(a6)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L3
.L133:
	lw	t3,0(a4)
	lw	t5,8(a4)
	bge	t3,t5,.L4
	lw	t6,%lo(P1_is_marked)(a6)
	sub	t0,t3,t5
	addi	t6,t6,-3
	sw	t6,%lo(P1_is_marked)(a6)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L4
.L134:
	lw	t3,4(a4)
	lw	t5,0(a4)
	bge	t3,t5,.L5
	lw	t6,%lo(P1_is_marked)(a6)
	sub	t0,t3,t5
	addi	t6,t6,-3
	sw	t6,%lo(P1_is_marked)(a6)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L5
.L135:
	lw	t3,4(a4)
	lw	t5,8(a4)
	bge	t3,t5,.L6
	lw	t6,%lo(P1_is_marked)(a6)
	sub	t0,t3,t5
	addi	t6,t6,-3
	sw	t6,%lo(P1_is_marked)(a6)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L6
.L136:
	lw	t3,8(a4)
	lw	t5,0(a4)
	bge	t3,t5,.L7
	lw	t6,%lo(P1_is_marked)(a6)
	sub	t0,t3,t5
	addi	t6,t6,-3
	sw	t6,%lo(P1_is_marked)(a6)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L7
.L137:
	lw	t3,8(a4)
	lw	t5,4(a4)
	bge	t3,t5,.L8
	lw	t6,%lo(P1_is_marked)(a6)
	sub	t0,t3,t5
	addi	t6,t6,-3
	sw	t6,%lo(P1_is_marked)(a6)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L8
.L138:
	lw	t5,40(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L9
	lw	t3,36(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L9
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L9
.L139:
	lw	t5,40(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L10
	lw	t3,36(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L10
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L10
.L140:
	lw	t5,44(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L11
	lw	t3,36(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L11
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L11
.L141:
	lw	t5,44(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L12
	lw	t3,36(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L12
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L12
.L142:
	lw	t5,48(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L13
	lw	t3,36(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L13
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L13
.L143:
	lw	t5,48(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L14
	lw	t3,36(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L14
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L14
.L144:
	lw	t5,36(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L15
	lw	t3,40(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L15
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L15
.L145:
	lw	t5,36(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L16
	lw	t3,40(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L16
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L16
.L146:
	lw	t5,44(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L17
	lw	t3,40(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L17
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L17
.L147:
	lw	t5,44(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L18
	lw	t3,40(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L18
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L18
.L148:
	lw	t5,48(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L19
	lw	t3,40(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L19
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L19
.L149:
	lw	t5,48(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L20
	lw	t3,40(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L20
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L20
.L150:
	lw	t5,36(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L21
	lw	t3,44(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L21
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L21
.L151:
	lw	t5,36(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L22
	lw	t3,44(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L22
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L22
.L152:
	lw	t5,40(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L23
	lw	t3,44(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L23
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L23
.L153:
	lw	t5,40(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L24
	lw	t3,44(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L24
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L24
.L154:
	lw	t5,48(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L25
	lw	t3,44(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L25
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L25
.L155:
	lw	t5,48(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L26
	lw	t3,44(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L26
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L26
.L156:
	lw	t5,36(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L27
	lw	t3,48(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L27
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L27
.L157:
	lw	t5,36(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L28
	lw	t3,48(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L28
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L28
.L158:
	lw	t5,40(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L29
	lw	t3,48(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L29
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L29
.L159:
	lw	t5,40(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L30
	lw	t3,48(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L30
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L30
.L160:
	lw	t5,44(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L31
	lw	t3,48(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L31
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L31
.L161:
	lw	t5,44(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L32
	lw	t3,48(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L32
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L32
.L162:
	lw	t5,40(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L33
	lw	t3,36(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L33
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L33
.L163:
	lw	t5,40(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L34
	lw	t3,36(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L34
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L34
.L164:
	lw	t5,40(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L35
	lw	t3,36(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L35
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L35
.L165:
	lw	t5,40(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L36
	lw	t3,36(a4)
	lw	t5,40(a4)
	bge	t3,t5,.L36
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L36
.L166:
	lw	t5,44(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L37
	lw	t3,36(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L37
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L37
.L167:
	lw	t5,44(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L38
	lw	t3,36(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L38
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L38
.L168:
	lw	t5,44(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L39
	lw	t3,36(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L39
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L39
.L169:
	lw	t5,44(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L40
	lw	t3,36(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L40
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L40
.L170:
	lw	t5,48(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L41
	lw	t3,36(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L41
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L41
.L171:
	lw	t5,48(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L42
	lw	t3,36(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L42
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L42
.L172:
	lw	t5,48(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L43
	lw	t3,36(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L43
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L43
.L173:
	lw	t5,48(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L44
	lw	t3,36(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L44
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L44
.L174:
	lw	t5,52(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L45
	lw	t3,36(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L45
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L45
.L175:
	lw	t5,52(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L46
	lw	t3,36(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L46
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L46
.L176:
	lw	t5,52(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L47
	lw	t3,36(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L47
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L47
.L177:
	lw	t5,52(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L48
	lw	t3,36(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L48
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L48
.L178:
	lw	t5,52(a4)
	lw	t3,40(a4)
	bne	t5,t3,.L49
	lw	t3,36(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L49
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L49
.L179:
	lw	t5,52(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L50
	lw	t3,36(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L50
	lw	t6,40(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L50
.L180:
	lw	t5,36(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L51
	lw	t3,40(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L51
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L51
.L181:
	lw	t5,36(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L52
	lw	t3,40(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L52
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L52
.L182:
	lw	t5,36(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L53
	lw	t3,40(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L53
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L53
.L183:
	lw	t5,36(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L54
	lw	t3,40(a4)
	lw	t5,36(a4)
	bge	t3,t5,.L54
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L54
.L184:
	lw	t5,44(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L55
	lw	t3,40(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L55
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L55
.L185:
	lw	t5,44(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L56
	lw	t3,40(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L56
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L56
.L186:
	lw	t5,44(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L57
	lw	t3,40(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L57
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L57
.L187:
	lw	t5,44(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L58
	lw	t3,40(a4)
	lw	t5,44(a4)
	bge	t3,t5,.L58
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L58
.L188:
	lw	t5,48(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L59
	lw	t3,40(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L59
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L59
.L189:
	lw	t5,48(a4)
	lw	t3,52(a4)
	bne	t5,t3,.L60
	lw	t3,40(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L60
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L60
.L190:
	lw	t5,48(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L61
	lw	t3,40(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L61
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L61
.L191:
	lw	t5,48(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L62
	lw	t3,40(a4)
	lw	t5,48(a4)
	bge	t3,t5,.L62
	lw	t6,%lo(P2_is_marked)(a5)
	add	t0,t3,t5
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L62
.L192:
	lw	t5,52(a4)
	lw	t3,44(a4)
	bne	t5,t3,.L63
	lw	t3,40(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L63
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L63
.L193:
	lw	t5,52(a4)
	lw	t3,48(a4)
	bne	t5,t3,.L64
	lw	t3,40(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L64
	lw	t6,44(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L64
.L194:
	lw	t5,52(a4)
	lw	t3,36(a4)
	bne	t5,t3,.L65
	lw	t3,40(a4)
	lw	t5,52(a4)
	bge	t3,t5,.L65
	lw	t6,48(a4)
	add	t0,t3,t5
	sw	t6,36(a4)
	lw	t6,%lo(P2_is_marked)(a5)
	addi	t6,t6,-4
	sw	t6,%lo(P2_is_marked)(a5)
	lw	t6,%lo(P3_is_marked)(a1)
	slli	t6,t6,2
	add	t6,a4,t6
	sw	t3,12(t6)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,1
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t5,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,2
	slli	t3,t3,2
	add	t3,a4,t3
	sw	t0,12(t3)
	lw	t3,%lo(P3_is_marked)(a1)
	addi	t3,t3,3
	sw	t3,%lo(P3_is_marked)(a1)
	jal	zero, .L65
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
.Lpcrel_1:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_1)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	addi	sp,sp,-16
	addi	a0, zero, 1231
	sw	ra,12(sp)
.Lpcrel_2:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_2)
	lw	ra,12(sp)
	addi	a0, zero, 0
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	benchmark, .-benchmark
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a5,%hi(P1_is_marked)
	lw	a4,%lo(P1_is_marked)(a5)
	addi	a5, zero, 3
	addi	a0, zero, 0
	bne	a4,a5,.L266
	lui	a5,%hi(P2_is_marked)
	lw	a4,%lo(P2_is_marked)(a5)
	addi	a5, zero, 5
	beq	a4,a5,.L278
.L266:
	jalr	zero, ra, 0
.L278:
	lui	a5,%hi(P3_is_marked)
	lw	a0,%lo(P3_is_marked)(a5)
	bne	a0,zero,.L276
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lw	a4,0(a5)
	bne	a4,zero,.L266
	lw	a0,36(a5)
	bne	a0,zero,.L276
	lw	a4,12(a5)
	bne	a4,zero,.L266
	lw	a0,4(a5)
	bne	a0,zero,.L276
	lw	a4,40(a5)
	bne	a4,zero,.L266
	lw	a0,16(a5)
	bne	a0,zero,.L276
	lw	a4,8(a5)
	bne	a4,zero,.L266
	lw	a4,44(a5)
	bne	a4,zero,.L276
	lw	a0,20(a5)
	bne	a0,zero,.L276
	lw	a4,48(a5)
	bne	a4,zero,.L266
	lw	a0,24(a5)
	bne	a0,zero,.L276
	lw	a4,52(a5)
	bne	a4,zero,.L266
	lw	a4,28(a5)
	bne	a4,zero,.L266
	lw	a0,32(a5)
	sltiu	a0, a0, 1
	jalr	zero, ra, 0
.L276:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	verify_benchmark, .-verify_benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	addi	a0, zero, 1
	sw	ra,28(sp)
.Lpcrel_3:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_3)
.Lpcrel_4:
	auipc	ra, %pcrel_hi(benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_4)
	sw	zero,12(sp)
	lw	a0,12(sp)
.Lpcrel_5:
	auipc	ra, %pcrel_hi(verify_benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_5)
	lw	ra,28(sp)
	xori	a0,a0,1
	addi	sp,sp,32
	jalr	zero, ra, 0
	.size	main, .-main
	.globl	P3_marking_member_0
	.globl	P3_is_marked
	.globl	P2_marking_member_0
	.globl	P2_is_marked
	.globl	P1_marking_member_0
	.globl	P1_is_marked
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	P1_marking_member_0, @object
	.size	P1_marking_member_0, 12
P1_marking_member_0:
	.zero	12
	.type	P3_marking_member_0, @object
	.size	P3_marking_member_0, 24
P3_marking_member_0:
	.zero	24
	.type	P2_marking_member_0, @object
	.size	P2_marking_member_0, 20
P2_marking_member_0:
	.zero	20
	.section	.sbss,"aw",@nobits
	.align	2
	.type	P3_is_marked, @object
	.size	P3_is_marked, 4
P3_is_marked:
	.zero	4
	.section	.sdata,"aw"
	.align	2
	.type	P2_is_marked, @object
	.size	P2_is_marked, 4
P2_is_marked:
	.word	5
	.type	P1_is_marked, @object
	.size	P1_is_marked, 4
P1_is_marked:
	.word	3
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
