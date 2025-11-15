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
	.globl	memset
	.type	memset, @function
memset:
	beq	a2,zero,.L271
	addi	a5,a2,-1
	addi	a4, zero, 5
	andi	a1,a1,0xff
	bgeu	a4, a5, .L267
	sub	a4, zero, a0
	andi	a5,a4,3
	addi	a6, zero, 0
	beq	a5,zero,.L261
	sb	a1,0(a0)
	andi	a4,a4,2
	addi	a6, zero, 1
	beq	a4,zero,.L261
	sb	a1,1(a0)
	addi	a4, zero, 3
	addi	a6, zero, 2
	bne	a5,a4,.L261
	sb	a1,2(a0)
	addi	a6, a5, 0
.L261:
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
.L263:
	sw	a4,0(a5)
	addi	a5,a5,4
	bne	a5,a3,.L263
	add	a5,a6,a7
	beq	t1,a7,.L271
.L260:
	add	a4,a0,a5
	sb	a1,0(a4)
	addi	a4,a5,1
	bgeu	a4, a2, .L271
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,2
	bgeu	a4, a2, .L271
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,3
	bgeu	a4, a2, .L271
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,4
	bgeu	a4, a2, .L271
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a5,a5,5
	bgeu	a5, a2, .L271
	add	a5,a0,a5
	sb	a1,0(a5)
.L271:
	jalr	zero, ra, 0
.L267:
	addi	a5, zero, 0
	jal	zero, .L260
	.size	memset, .-memset
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	beq	a2,zero,.L276
	addi	a5,a2,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L277
	or	a3,a0,a1
	andi	a3,a3,3
	addi	a4, a0, 0
	addi	a5, a1, 0
	bne	a3,zero,.L277
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L277
	andi	a7,a2,-4
	add	a6,a1,a7
.L278:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L278
	beq	a2,a7,.L276
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a2, .L276
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a2, .L276
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	jalr	zero, ra, 0
.L277:
	add	a2,a1,a2
	addi	a5, a0, 0
.L280:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L280
.L276:
	jalr	zero, ra, 0
	.size	memcpy, .-memcpy
	.align	2
	.globl	memcmp
	.type	memcmp, @function
memcmp:
	beq	a2,zero,.L297
	add	a2,a0,a2
	jal	zero, .L296
.L295:
	beq	a0,a2,.L297
.L296:
	lbu	a5,0(a0)
	lbu	a4,0(a1)
	addi	a0,a0,1
	addi	a1,a1,1
	beq	a5,a4,.L295
	sub	a0,a5,a4
	jalr	zero, ra, 0
.L297:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	memcmp, .-memcmp
	.align	2
	.globl	memmove
	.type	memmove, @function
memmove:
	bgeu	a0,a1,.L300
	beq	a2,zero,.L301
	addi	a5,a2,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L302
	or	a3,a1,a0
	andi	a3,a3,3
	addi	a4, a0, 0
	addi	a5, a1, 0
	bne	a3,zero,.L302
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L302
	andi	a7,a2,-4
	add	a6,a1,a7
.L303:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L303
	beq	a2,a7,.L301
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a2, .L301
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a2, .L301
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	jalr	zero, ra, 0
.L300:
	bltu	a1, a0, .L323
.L301:
	jalr	zero, ra, 0
.L323:
	beq	a2,zero,.L301
	addi	a2,a2,-1
	add	a5,a1,a2
	lbu	a4,0(a5)
	add	a5,a0,a2
	sb	a4,0(a5)
	jal	zero, .L323
.L302:
	add	a2,a1,a2
	addi	a5, a0, 0
.L305:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L305
	jalr	zero, ra, 0
	.size	memmove, .-memmove
	.align	2
	.globl	strlen
	.type	strlen, @function
strlen:
	lbu	a5,0(a0)
	beq	a5,zero,.L324
	addi	a5, zero, 0
.L326:
	addi	a5,a5,1
	add	a4,a0,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L326
.L324:
	addi	a0, a5, 0
	jalr	zero, ra, 0
	.size	strlen, .-strlen
	.align	2
	.globl	strchr
	.type	strchr, @function
strchr:
	lbu	a5,0(a0)
	beq	a5,zero,.L330
	andi	a4,a1,0xff
.L332:
	beq	a4,a5,.L329
	lbu	a5,1(a0)
	addi	a0,a0,1
	bne	a5,zero,.L332
.L330:
	sltiu	a1, a1, 1
	sub	a1, zero, a1
	and	a0,a0,a1
.L329:
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
	beq	a0,zero,.L345
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a1,%lo(heap_requested)(a3)
	add	a4,a0,a5
	andi	a6,a4,3
	add	a5,a5,a1
	bne	a6,zero,.L349
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a1,a4,.L345
.L350:
	sw	a4,%lo(heap_ptr)(a2)
	jalr	zero, ra, 0
.L349:
	addi	a1, zero, 4
	sub	a1,a1,a6
	add	a5,a5,a1
	add	a4,a4,a1
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a1,a4,.L350
.L345:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	malloc_beebs, .-malloc_beebs
	.align	2
	.globl	calloc_beebs
	.type	calloc_beebs, @function
calloc_beebs:
	mul	a1,a0,a1
	beq	a1,zero,.L352
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a0,a1
	andi	a6,a4,3
	add	a5,a1,a5
	bne	a6,zero,.L377
.L353:
	lui	a6,%hi(heap_end)
	lw	a6,%lo(heap_end)(a6)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a6,a4,.L352
	sw	a4,%lo(heap_ptr)(a2)
	beq	a0,zero,.L352
	addi	a5,a1,-1
	addi	a4, zero, 5
	bgeu	a4, a5, .L361
	sub	a4, zero, a0
	andi	a5,a4,3
	addi	a3, zero, 0
	beq	a5,zero,.L355
	sb	zero,0(a0)
	andi	a4,a4,2
	addi	a3, zero, 1
	beq	a4,zero,.L355
	sb	zero,1(a0)
	addi	a4, zero, 3
	addi	a3, zero, 2
	bne	a5,a4,.L355
	sb	zero,2(a0)
	addi	a3, a5, 0
.L355:
	sub	a6,a1,a5
	andi	a2,a6,-4
	add	a5,a0,a5
	add	a4,a5,a2
.L357:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L357
	add	a5,a3,a2
	beq	a6,a2,.L351
.L354:
	add	a4,a0,a5
	sb	zero,0(a4)
	addi	a4,a5,1
	bgeu	a4, a1, .L351
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,2
	bgeu	a4, a1, .L351
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,3
	bgeu	a4, a1, .L351
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,4
	bgeu	a4, a1, .L351
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a5,a5,5
	bgeu	a5, a1, .L351
	add	a5,a0,a5
	sb	zero,0(a5)
	jalr	zero, ra, 0
.L352:
	addi	a0, zero, 0
.L351:
	jalr	zero, ra, 0
.L377:
	addi	a7, zero, 4
	sub	a6,a7,a6
	add	a4,a4,a6
	add	a5,a5,a6
	jal	zero, .L353
.L361:
	addi	a5, zero, 0
	jal	zero, .L354
	.size	calloc_beebs, .-calloc_beebs
	.align	2
	.globl	realloc_beebs
	.type	realloc_beebs, @function
realloc_beebs:
	beq	a0,zero,.L379
	beq	a1,zero,.L379
	lui	a6,%hi(heap_ptr)
	lw	a2,%lo(heap_ptr)(a6)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a2,a1
	andi	a7,a4,3
	add	a5,a1,a5
	bne	a7,zero,.L404
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a7,a4,.L379
.L405:
	sw	a4,%lo(heap_ptr)(a6)
	beq	a2,zero,.L379
	addi	a5,a1,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L389
	or	a3,a0,a2
	andi	a3,a3,3
	addi	a4, a2, 0
	addi	a5, a0, 0
	bne	a3,zero,.L389
	addi	a3,a2,-1
	sub	a3,a3,a0
	sltiu	a3,a3,3
	bne	a3,zero,.L389
	andi	a7,a1,-4
	add	a6,a0,a7
.L382:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L382
	beq	a1,a7,.L378
	lbu	a3,0(a6)
	add	a4,a2,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a1, .L378
	add	a4,a0,a5
	lbu	a4,0(a4)
	add	a5,a2,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a1, .L378
	add	a0,a0,a7
	lbu	a5,0(a0)
	add	a7,a2,a7
	sb	a5,0(a7)
.L378:
	addi	a0, a2, 0
	jalr	zero, ra, 0
.L404:
	addi	t1, zero, 4
	sub	a7,t1,a7
	add	a5,a5,a7
	add	a4,a4,a7
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a7,a4,.L405
.L379:
	addi	a2, zero, 0
	addi	a0, a2, 0
	jalr	zero, ra, 0
.L389:
	addi	a5, zero, 0
.L386:
	add	a4,a0,a5
	lbu	a3,0(a4)
	add	a4,a2,a5
	addi	a5,a5,1
	sb	a3,0(a4)
	bltu	a5, a1, .L386
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
	bne	a4,a5,.L415
	lui	a5,%hi(P2_is_marked)
	lw	a4,%lo(P2_is_marked)(a5)
	addi	a5, zero, 5
	beq	a4,a5,.L427
.L415:
	jalr	zero, ra, 0
.L427:
	lui	a5,%hi(P3_is_marked)
	lw	a0,%lo(P3_is_marked)(a5)
	bne	a0,zero,.L425
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lw	a4,0(a5)
	bne	a4,zero,.L415
	lw	a0,36(a5)
	bne	a0,zero,.L425
	lw	a4,12(a5)
	bne	a4,zero,.L415
	lw	a0,4(a5)
	bne	a0,zero,.L425
	lw	a4,40(a5)
	bne	a4,zero,.L415
	lw	a0,16(a5)
	bne	a0,zero,.L425
	lw	a4,8(a5)
	bne	a4,zero,.L415
	lw	a4,44(a5)
	bne	a4,zero,.L425
	lw	a0,20(a5)
	bne	a0,zero,.L425
	lw	a4,48(a5)
	bne	a4,zero,.L415
	lw	a0,24(a5)
	bne	a0,zero,.L425
	lw	a4,52(a5)
	bne	a4,zero,.L415
	lw	a4,28(a5)
	bne	a4,zero,.L415
	lw	a0,32(a5)
	sltiu	a0, a0, 1
	jalr	zero, ra, 0
.L425:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	verify_benchmark, .-verify_benchmark
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
.Lpcrel_3:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_3)
.Lpcrel_4:
	auipc	ra, %pcrel_hi(start_trigger)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_4)
.Lpcrel_5:
	auipc	ra, %pcrel_hi(benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_5)
	sw	zero,12(sp)
.Lpcrel_6:
	auipc	ra, %pcrel_hi(stop_trigger)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_6)
	lw	a0,12(sp)
.Lpcrel_7:
	auipc	ra, %pcrel_hi(verify_benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_7)
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
    jal   ra, __riscv_div_lib_udivsi3        # jal __riscv_div_lib_udivsi3
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
    jal   ra, __riscv_div_lib_udivsi3        # jal __riscv_div_lib_udivsi3
    sub   a0, zero, a0                        # neg a0, a0 -> sub a0, zero, a0
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0

# Signed 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_modsi3
__riscv_div_lib_modsi3:
    addi  t0, ra, 0                           # mv t0, ra -> addi t0, ra, 0
    blt   a1, zero, __riscv_div_lib_L31      # bltz a1 -> blt a1, zero
    blt   a0, zero, __riscv_div_lib_L32      # bltz a0 -> blt a0, zero
__riscv_div_lib_L30:
    jal   ra, __riscv_div_lib_udivsi3        # jal __riscv_div_lib_udivsi3
    addi  a0, a1, 0                           # mv a0, a1 -> addi a0, a1, 0
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0
__riscv_div_lib_L31:
    sub   a1, zero, a1                        # neg a1, a1 -> sub a1, zero, a1
    bge   a0, zero, __riscv_div_lib_L30      # bgez a0 -> bge a0, zero
__riscv_div_lib_L32:
    sub   a0, zero, a0                        # neg a0, a0 -> sub a0, zero, a0
    jal   ra, __riscv_div_lib_udivsi3        # jal __riscv_div_lib_udivsi3
    sub   a0, zero, a1                        # neg a0, a1 -> sub a0, zero, a1
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0

# end of subrountine