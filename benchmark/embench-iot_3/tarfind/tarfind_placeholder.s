	.file	"tarfind.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	blt	zero,a0,.+8
	jal	x0,.L39
	addi	sp,sp,-64
	sw	s8,28(sp)
	lui	s8,%hi(seed)
	lw	a5,%lo(seed)(s8)
	sw	s2,52(sp)
	sw	s7,32(sp)
	lui	s2,%hi(heap)
	lui	t2,%hi(heap+8995)
	lui	s7,%hi(heap+5654)
	lui	a7,524288
	lui	t3,269413
	lui	t1,3
	lui	a6,322639
	sw	s1,56(sp)
	sw	s3,48(sp)
	sw	s4,44(sp)
	sw	s5,40(sp)
	sw	s6,36(sp)
	sw	s9,24(sp)
	sw	s10,20(sp)
	sw	s0,60(sp)
	sw	s11,16(sp)
	addi	s2,s2,%lo(heap)
	addi	t2,t2,%lo(heap+8995)
	addi	op_1,x0,%lo(heap+5654)
	or	op_0,x0,op_1
	sub	op_2,x0,s7
	sub	s7,op_0,op_2
	addi	t3,t3,-403
	addi	op_1,x0,57
	or	op_0,x0,op_1
	sub	op_2,x0,t1
	sub	t1,op_0,op_2
	addi	a7,a7,-1
	addi	op_1,x0,-945
	or	op_0,x0,op_1
	sub	op_2,x0,a6
	sub	a6,op_0,op_2
	addi	a1,zero,0
	lui	s9,%hi(heap+5)
	lui	s10,%hi(heap+4369)
	addi	s3,zero,257
	addi	s5,zero,1
	addi	s4,zero,3
	addi	op_1,x0,2
	or	op_0,x0,op_1
	sub	op_2,x0,zero
	sub	s6,op_0,op_2
	addi	s1,zero,48
	addi	t4,zero,26
.L17:
	addi	a3,s9,%lo(heap+5)
	addi	op_1,x0,0
	or	op_0,x0,op_1
	sub	op_2,x0,s2
	sub	a2,op_0,op_2
	addi	s0,zero,0
	sw	a1,12(sp)
	addi	op_1,x0,0
	or	op_0,x0,op_1
	sub	op_2,x0,a0
	sub	s11,op_0,op_2
.L8:
	sub	a1,zero,a2
	addi	op_2,x0,3
	or	op_1,a1,op_2
	addi	op_3,x0,3
	sub	op_0,op_1,op_3
	sub	a4,a1,op_0
	bne	a4,zero,.+8
	jal	x0,.L18
	sb	zero,0(a2)
	addi	op_2,x0,2
	or	op_1,a1,op_2
	addi	op_3,x0,2
	sub	op_0,op_1,op_3
	sub	a1,a1,op_0
	bne	a1,zero,.+8
	jal	x0,.L19
	sb	zero,1(a2)
	bne	a4,s4,.L20
	sb	zero,2(a2)
	addi	t5,s4,0
	addi	t0,zero,254
.L3:
	sub	a0,s3,a4
	sub	op_0,x0,a4
	sub	a4,s0,op_0
	sub	op_0,x0,s2
	sub	a4,a4,op_0
	addi	op_2,x0,-4
	or	op_1,a0,op_2
	addi	op_3,x0,-4
	sub	op_0,op_1,op_3
	sub	t6,a0,op_0
	sub	op_0,x0,t6
	sub	a1,a4,op_0
.L5:
	sw	zero,0(a4)
	addi	a4,a4,4
	bne	a1,a4,.L5
	bne	t6,a0,.+8
	jal	x0,.L6
	sub	op_0,x0,t6
	sub	t5,t5,op_0
	sub	op_0,x0,a2
	sub	t5,t5,op_0
	sb	zero,0(t5)
	sub	t0,t0,t6
	bne	t0,s5,.+8
	jal	x0,.L6
	sb	zero,1(t5)
	bne	t0,s6,.+8
	jal	x0,.L6
	sb	zero,2(t5)
.L6:
	sb	s1,156(a2)
	addi	a0,a2,0
.L7:
	callmul	a5,a5,t3
	addi	a0,a0,1
	sub	op_0,x0,a5
	sub	a5,t1,op_0
	or	op_2,a7,a5
	or	op_5,a7,a5
	sub	op_4,op_5,a5
	sub	op_3,a7,op_4
	sub	op_1,op_2,op_3
	or	op_6,a5,a7
	or	op_0,op_1,op_6
	or	op_9,a7,a5
	or	op_12,a7,a5
	sub	op_11,op_12,a5
	sub	op_10,a7,op_11
	sub	op_8,op_9,op_10
	or	op_16,a7,a5
	or	op_19,a7,a5
	sub	op_18,op_19,a5
	sub	op_17,a7,op_18
	sub	op_15,op_16,op_17
	or	op_20,a5,a7
	or	op_14,op_15,op_20
	or	op_21,a5,a7
	sub	op_13,op_14,op_21
	sub	op_7,op_8,op_13
	sub	a5,op_0,op_7
	addi	op_0,x0,16
	sra	a4,a5,op_0
	lui	op_8,16
	addi	op_7,op_8,-1
	or	op_6,a4,op_7
	lui	op_10,16
	addi	op_9,op_10,-1
	sub	op_5,op_6,op_9
	sub	op_4,a4,op_5
	lui	op_15,16
	addi	op_14,op_15,-1
	or	op_13,a6,op_14
	lui	op_17,16
	addi	op_16,op_17,-1
	sub	op_12,op_13,op_16
	sub	op_11,a6,op_12
	callmul	op_3,op_4,op_11
	addi	op_18,x0,16
	srl	op_2,op_3,op_18
	addi	op_25,x0,16
	srl	op_24,a4,op_25
	addi	op_29,x0,16
	srl	op_28,a4,op_29
	lui	op_31,16
	addi	op_30,op_31,-1
	or	op_27,op_28,op_30
	lui	op_33,16
	addi	op_32,op_33,-1
	sub	op_26,op_27,op_32
	sub	op_23,op_24,op_26
	lui	op_38,16
	addi	op_37,op_38,-1
	or	op_36,a6,op_37
	lui	op_40,16
	addi	op_39,op_40,-1
	sub	op_35,op_36,op_39
	sub	op_34,a6,op_35
	callmul	op_22,op_23,op_34
	addi	op_46,x0,16
	srl	op_45,a4,op_46
	addi	op_50,x0,16
	srl	op_49,a4,op_50
	lui	op_52,16
	addi	op_51,op_52,-1
	or	op_48,op_49,op_51
	lui	op_54,16
	addi	op_53,op_54,-1
	sub	op_47,op_48,op_53
	sub	op_44,op_45,op_47
	lui	op_59,16
	addi	op_58,op_59,-1
	or	op_57,a6,op_58
	lui	op_61,16
	addi	op_60,op_61,-1
	sub	op_56,op_57,op_60
	sub	op_55,a6,op_56
	callmul	op_43,op_44,op_55
	lui	op_63,16
	addi	op_62,op_63,-1
	or	op_42,op_43,op_62
	lui	op_65,16
	addi	op_64,op_65,-1
	sub	op_41,op_42,op_64
	sub	op_21,op_22,op_41
	lui	op_73,16
	addi	op_72,op_73,-1
	or	op_71,a4,op_72
	lui	op_75,16
	addi	op_74,op_75,-1
	sub	op_70,op_71,op_74
	sub	op_69,a4,op_70
	addi	op_78,x0,16
	srl	op_77,a6,op_78
	addi	op_82,x0,16
	srl	op_81,a6,op_82
	lui	op_84,16
	addi	op_83,op_84,-1
	or	op_80,op_81,op_83
	lui	op_86,16
	addi	op_85,op_86,-1
	sub	op_79,op_80,op_85
	sub	op_76,op_77,op_79
	callmul	op_68,op_69,op_76
	lui	op_94,16
	addi	op_93,op_94,-1
	or	op_92,a4,op_93
	lui	op_96,16
	addi	op_95,op_96,-1
	sub	op_91,op_92,op_95
	sub	op_90,a4,op_91
	addi	op_99,x0,16
	srl	op_98,a6,op_99
	addi	op_103,x0,16
	srl	op_102,a6,op_103
	lui	op_105,16
	addi	op_104,op_105,-1
	or	op_101,op_102,op_104
	lui	op_107,16
	addi	op_106,op_107,-1
	sub	op_100,op_101,op_106
	sub	op_97,op_98,op_100
	callmul	op_89,op_90,op_97
	lui	op_109,16
	addi	op_108,op_109,-1
	or	op_88,op_89,op_108
	lui	op_111,16
	addi	op_110,op_111,-1
	sub	op_87,op_88,op_110
	sub	op_67,op_68,op_87
	sub	op_66,x0,op_67
	sub	op_20,op_21,op_66
	sub	op_19,x0,op_20
	sub	op_1,op_2,op_19
	addi	op_112,x0,16
	srl	op_0,op_1,op_112
	addi	op_119,x0,16
	srl	op_118,a4,op_119
	addi	op_123,x0,16
	srl	op_122,a4,op_123
	lui	op_125,16
	addi	op_124,op_125,-1
	or	op_121,op_122,op_124
	lui	op_127,16
	addi	op_126,op_127,-1
	sub	op_120,op_121,op_126
	sub	op_117,op_118,op_120
	lui	op_132,16
	addi	op_131,op_132,-1
	or	op_130,a6,op_131
	lui	op_134,16
	addi	op_133,op_134,-1
	sub	op_129,op_130,op_133
	sub	op_128,a6,op_129
	callmul	op_116,op_117,op_128
	addi	op_135,x0,16
	srl	op_115,op_116,op_135
	lui	op_144,16
	addi	op_143,op_144,-1
	or	op_142,a4,op_143
	lui	op_146,16
	addi	op_145,op_146,-1
	sub	op_141,op_142,op_145
	sub	op_140,a4,op_141
	addi	op_149,x0,16
	srl	op_148,a6,op_149
	addi	op_153,x0,16
	srl	op_152,a6,op_153
	lui	op_155,16
	addi	op_154,op_155,-1
	or	op_151,op_152,op_154
	lui	op_157,16
	addi	op_156,op_157,-1
	sub	op_150,op_151,op_156
	sub	op_147,op_148,op_150
	callmul	op_139,op_140,op_147
	addi	op_158,x0,16
	srl	op_138,op_139,op_158
	addi	op_163,x0,16
	srl	op_162,a4,op_163
	addi	op_167,x0,16
	srl	op_166,a4,op_167
	lui	op_169,16
	addi	op_168,op_169,-1
	or	op_165,op_166,op_168
	lui	op_171,16
	addi	op_170,op_171,-1
	sub	op_164,op_165,op_170
	sub	op_161,op_162,op_164
	addi	op_174,x0,16
	srl	op_173,a6,op_174
	addi	op_178,x0,16
	srl	op_177,a6,op_178
	lui	op_180,16
	addi	op_179,op_180,-1
	or	op_176,op_177,op_179
	lui	op_182,16
	addi	op_181,op_182,-1
	sub	op_175,op_176,op_181
	sub	op_172,op_173,op_175
	callmul	op_160,op_161,op_172
	sub	op_159,x0,op_160
	sub	op_137,op_138,op_159
	sub	op_136,x0,op_137
	sub	op_114,op_115,op_136
	sub	op_113,x0,op_114
	sub	a1,op_0,op_113
	addi	op_0,x0,3
	srl	a1,a1,op_0
	callmul	a1,a1,t4
	sub	a4,a4,a1
	addi	a4,a4,65
	sb	a4,-1(a0)
	bne	a3,a0,.L7
	sb	s1,124(a2)
	addi	op_1,x0,257
	or	op_0,x0,op_1
	sub	op_2,x0,a2
	sub	a2,op_0,op_2
	addi	a3,a3,258
	addi	s0,s0,257
	bne	a2,t2,.L8
	lw	a1,12(sp)
	addi	a0,s11,0
	addi	t0,s10,%lo(heap+4369)
.L16:
	addi	t6,s2,0
.L15:
	lbu	a3,0(t6)
	addi	a2,t6,0
	addi	a4,t0,0
	bne	a3,zero,.L9
	jal	x0,.L10
.L43:
	bne	a3,t5,.L13
	lbu	a3,0(a2)
	bne	a3,zero,.+8
	jal	x0,.L10
.L9:
	lbu	t5,0(a4)
	addi	a2,a2,1
	addi	a4,a4,1
	bne	t5,zero,.L43
.L13:
	addi	t6,t6,257
	bne	t6,t2,.+8
	jal	x0,.+8
	jal	x0,.L15
.L14:
	addi	t0,t0,257
	bne	t0,s7,.L16
	addi	op_1,x0,1
	or	op_0,x0,op_1
	sub	op_2,x0,a1
	sub	a1,op_0,op_2
	bne	a1,a0,.L17
	lw	s0,60(sp)
	lui	a4,%hi(heap+8996)
	lui	a3,2
	addi	a4,a4,%lo(heap+8996)
	lui	a0,%hi(heap_ptr)
	lui	a1,%hi(heap_end)
	addi	a3,a3,804
	lui	a2,%hi(heap_requested)
	sw	a5,%lo(seed)(s8)
	sw	a4,%lo(heap_ptr)(a0)
	sw	a4,%lo(heap_end)(a1)
	sw	a3,%lo(heap_requested)(a2)
	lw	s1,56(sp)
	lw	s2,52(sp)
	lw	s3,48(sp)
	lw	s4,44(sp)
	lw	s5,40(sp)
	lw	s6,36(sp)
	lw	s7,32(sp)
	lw	s8,28(sp)
	lw	s9,24(sp)
	lw	s10,20(sp)
	lw	s11,16(sp)
	addi	op_1,x0,64
	or	op_0,x0,op_1
	sub	op_2,x0,sp
	sub	sp,op_0,op_2
	jalr	zero,ra,0
.L10:
	lbu	a4,0(a4)
	bne	a4,zero,.+8
	jal	x0,.L14
	addi	op_1,x0,257
	or	op_0,x0,op_1
	sub	op_2,x0,t6
	sub	t6,op_0,op_2
	bne	t6,t2,.+8
	jal	x0,.+8
	jal	x0,.L15
	jal	x0,.L14
.L19:
	addi	t5,zero,1
	addi	t0,zero,256
	jal	x0,.L3
.L18:
	addi	t5,zero,0
	addi	op_1,x0,257
	or	op_0,x0,op_1
	sub	op_2,x0,zero
	sub	t0,op_0,op_2
	jal	x0,.L3
.L20:
	addi	t5,zero,2
	addi	t0,zero,255
	jal	x0,.L3
.L39:
	jalr	zero,ra,0
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.type	benchmark_body.constprop.0, @function
benchmark_body.constprop.0:
	addi	sp,sp,-48
	sw	s4,28(sp)
	lui	s4,%hi(seed)
	lw	a1,%lo(seed)(s4)
	sw	s2,36(sp)
	lui	t6,%hi(heap)
	lui	t4,%hi(heap+8995)
	lui	s2,%hi(heap+5654)
	lui	a6,524288
	lui	t1,269413
	lui	a7,3
	lui	a0,322639
	sw	s0,44(sp)
	sw	s1,40(sp)
	sw	s3,32(sp)
	sw	s5,24(sp)
	sw	s6,20(sp)
	sw	s7,16(sp)
	sw	s8,12(sp)
	sw	s9,8(sp)
	sw	s10,4(sp)
	sw	s11,0(sp)
	addi	t6,t6,%lo(heap)
	addi	t4,t4,%lo(heap+8995)
	addi	s2,s2,%lo(heap+5654)
	addi	t1,t1,-403
	addi	op_1,x0,57
	or	op_0,x0,op_1
	sub	op_2,x0,a7
	sub	a7,op_0,op_2
	addi	a6,a6,-1
	addi	a0,a0,-945
	addi	s3,zero,47
	lui	s6,%hi(heap+5)
	lui	s5,%hi(heap+4369)
	addi	op_1,x0,257
	or	op_0,x0,op_1
	sub	op_2,x0,zero
	sub	t0,op_0,op_2
	addi	op_1,x0,1
	or	op_0,x0,op_1
	sub	op_2,x0,zero
	sub	s0,op_0,op_2
	addi	t2,zero,3
	addi	s1,zero,2
	addi	t5,zero,48
	addi	t3,zero,26
.L59:
	addi	a2,s6,%lo(heap+5)
	addi	s7,t6,0
	addi	s8,zero,0
.L50:
	sub	a4,zero,s7
	addi	op_0,x0,3
	addi	op_3,x0,3
	or	op_2,op_3,a4
	sub	op_1,op_2,a4
	sub	a5,op_0,op_1
	bne	a5,zero,.+8
	jal	x0,.L60
	sb	zero,0(s7)
	addi	op_0,x0,2
	addi	op_3,x0,2
	or	op_2,op_3,a4
	sub	op_1,op_2,a4
	sub	a4,op_0,op_1
	bne	a4,zero,.+8
	jal	x0,.L61
	sb	zero,1(s7)
	bne	a5,t2,.L62
	sb	zero,2(s7)
	addi	a4,t2,0
	addi	a3,zero,254
.L45:
	sub	s9,t0,a5
	sub	op_0,x0,a5
	sub	a5,s8,op_0
	sub	op_0,x0,t6
	sub	a5,a5,op_0
	addi	op_0,x0,-4
	addi	op_3,x0,-4
	or	op_2,op_3,s9
	sub	op_1,op_2,s9
	sub	s11,op_0,op_1
	sub	op_0,x0,s11
	sub	s10,a5,op_0
.L47:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	s10,a5,.L47
	bne	s11,s9,.+8
	jal	x0,.L48
	sub	op_0,x0,s11
	sub	a4,a4,op_0
	sub	op_0,x0,s7
	sub	a4,a4,op_0
	sb	zero,0(a4)
	sub	a3,a3,s11
	bne	a3,s0,.+8
	jal	x0,.L48
	sb	zero,1(a4)
	bne	a3,s1,.+8
	jal	x0,.L48
	sb	zero,2(a4)
.L48:
	sb	t5,156(s7)
	addi	op_1,x0,0
	or	op_0,x0,op_1
	sub	op_2,x0,s7
	sub	a3,op_0,op_2
.L49:
	callmul	a1,a1,t1
	addi	a3,a3,1
	sub	op_0,x0,a1
	sub	a1,a7,op_0
	or	op_2,a6,a1
	or	op_5,a6,a1
	sub	op_4,op_5,a1
	sub	op_3,a6,op_4
	sub	op_1,op_2,op_3
	or	op_6,a1,a6
	or	op_0,op_1,op_6
	or	op_9,a6,a1
	or	op_12,a6,a1
	sub	op_11,op_12,a1
	sub	op_10,a6,op_11
	sub	op_8,op_9,op_10
	or	op_16,a6,a1
	or	op_19,a6,a1
	sub	op_18,op_19,a1
	sub	op_17,a6,op_18
	sub	op_15,op_16,op_17
	or	op_20,a1,a6
	or	op_14,op_15,op_20
	or	op_21,a1,a6
	sub	op_13,op_14,op_21
	sub	op_7,op_8,op_13
	sub	a1,op_0,op_7
	addi	op_0,x0,16
	sra	a5,a1,op_0
	lui	op_8,16
	addi	op_7,op_8,-1
	or	op_6,a5,op_7
	lui	op_10,16
	addi	op_9,op_10,-1
	sub	op_5,op_6,op_9
	sub	op_4,a5,op_5
	lui	op_15,16
	addi	op_14,op_15,-1
	or	op_13,a0,op_14
	lui	op_17,16
	addi	op_16,op_17,-1
	sub	op_12,op_13,op_16
	sub	op_11,a0,op_12
	callmul	op_3,op_4,op_11
	addi	op_18,x0,16
	srl	op_2,op_3,op_18
	addi	op_25,x0,16
	srl	op_24,a5,op_25
	addi	op_29,x0,16
	srl	op_28,a5,op_29
	lui	op_31,16
	addi	op_30,op_31,-1
	or	op_27,op_28,op_30
	lui	op_33,16
	addi	op_32,op_33,-1
	sub	op_26,op_27,op_32
	sub	op_23,op_24,op_26
	lui	op_38,16
	addi	op_37,op_38,-1
	or	op_36,a0,op_37
	lui	op_40,16
	addi	op_39,op_40,-1
	sub	op_35,op_36,op_39
	sub	op_34,a0,op_35
	callmul	op_22,op_23,op_34
	addi	op_46,x0,16
	srl	op_45,a5,op_46
	addi	op_50,x0,16
	srl	op_49,a5,op_50
	lui	op_52,16
	addi	op_51,op_52,-1
	or	op_48,op_49,op_51
	lui	op_54,16
	addi	op_53,op_54,-1
	sub	op_47,op_48,op_53
	sub	op_44,op_45,op_47
	lui	op_59,16
	addi	op_58,op_59,-1
	or	op_57,a0,op_58
	lui	op_61,16
	addi	op_60,op_61,-1
	sub	op_56,op_57,op_60
	sub	op_55,a0,op_56
	callmul	op_43,op_44,op_55
	lui	op_63,16
	addi	op_62,op_63,-1
	or	op_42,op_43,op_62
	lui	op_65,16
	addi	op_64,op_65,-1
	sub	op_41,op_42,op_64
	sub	op_21,op_22,op_41
	lui	op_73,16
	addi	op_72,op_73,-1
	or	op_71,a5,op_72
	lui	op_75,16
	addi	op_74,op_75,-1
	sub	op_70,op_71,op_74
	sub	op_69,a5,op_70
	addi	op_78,x0,16
	srl	op_77,a0,op_78
	addi	op_82,x0,16
	srl	op_81,a0,op_82
	lui	op_84,16
	addi	op_83,op_84,-1
	or	op_80,op_81,op_83
	lui	op_86,16
	addi	op_85,op_86,-1
	sub	op_79,op_80,op_85
	sub	op_76,op_77,op_79
	callmul	op_68,op_69,op_76
	lui	op_94,16
	addi	op_93,op_94,-1
	or	op_92,a5,op_93
	lui	op_96,16
	addi	op_95,op_96,-1
	sub	op_91,op_92,op_95
	sub	op_90,a5,op_91
	addi	op_99,x0,16
	srl	op_98,a0,op_99
	addi	op_103,x0,16
	srl	op_102,a0,op_103
	lui	op_105,16
	addi	op_104,op_105,-1
	or	op_101,op_102,op_104
	lui	op_107,16
	addi	op_106,op_107,-1
	sub	op_100,op_101,op_106
	sub	op_97,op_98,op_100
	callmul	op_89,op_90,op_97
	lui	op_109,16
	addi	op_108,op_109,-1
	or	op_88,op_89,op_108
	lui	op_111,16
	addi	op_110,op_111,-1
	sub	op_87,op_88,op_110
	sub	op_67,op_68,op_87
	sub	op_66,x0,op_67
	sub	op_20,op_21,op_66
	sub	op_19,x0,op_20
	sub	op_1,op_2,op_19
	addi	op_112,x0,16
	srl	op_0,op_1,op_112
	addi	op_119,x0,16
	srl	op_118,a5,op_119
	addi	op_123,x0,16
	srl	op_122,a5,op_123
	lui	op_125,16
	addi	op_124,op_125,-1
	or	op_121,op_122,op_124
	lui	op_127,16
	addi	op_126,op_127,-1
	sub	op_120,op_121,op_126
	sub	op_117,op_118,op_120
	lui	op_132,16
	addi	op_131,op_132,-1
	or	op_130,a0,op_131
	lui	op_134,16
	addi	op_133,op_134,-1
	sub	op_129,op_130,op_133
	sub	op_128,a0,op_129
	callmul	op_116,op_117,op_128
	addi	op_135,x0,16
	srl	op_115,op_116,op_135
	lui	op_144,16
	addi	op_143,op_144,-1
	or	op_142,a5,op_143
	lui	op_146,16
	addi	op_145,op_146,-1
	sub	op_141,op_142,op_145
	sub	op_140,a5,op_141
	addi	op_149,x0,16
	srl	op_148,a0,op_149
	addi	op_153,x0,16
	srl	op_152,a0,op_153
	lui	op_155,16
	addi	op_154,op_155,-1
	or	op_151,op_152,op_154
	lui	op_157,16
	addi	op_156,op_157,-1
	sub	op_150,op_151,op_156
	sub	op_147,op_148,op_150
	callmul	op_139,op_140,op_147
	addi	op_158,x0,16
	srl	op_138,op_139,op_158
	addi	op_163,x0,16
	srl	op_162,a5,op_163
	addi	op_167,x0,16
	srl	op_166,a5,op_167
	lui	op_169,16
	addi	op_168,op_169,-1
	or	op_165,op_166,op_168
	lui	op_171,16
	addi	op_170,op_171,-1
	sub	op_164,op_165,op_170
	sub	op_161,op_162,op_164
	addi	op_174,x0,16
	srl	op_173,a0,op_174
	addi	op_178,x0,16
	srl	op_177,a0,op_178
	lui	op_180,16
	addi	op_179,op_180,-1
	or	op_176,op_177,op_179
	lui	op_182,16
	addi	op_181,op_182,-1
	sub	op_175,op_176,op_181
	sub	op_172,op_173,op_175
	callmul	op_160,op_161,op_172
	sub	op_159,x0,op_160
	sub	op_137,op_138,op_159
	sub	op_136,x0,op_137
	sub	op_114,op_115,op_136
	sub	op_113,x0,op_114
	sub	a4,op_0,op_113
	addi	op_0,x0,3
	srl	a4,a4,op_0
	callmul	a4,a4,t3
	sub	a5,a5,a4
	addi	a5,a5,65
	sb	a5,-1(a3)
	bne	a2,a3,.L49
	sb	t5,124(s7)
	addi	s7,s7,257
	addi	a2,a2,258
	addi	s8,s8,257
	bne	s7,t4,.L50
	addi	op_1,x0,%lo(heap+4369)
	or	op_0,x0,op_1
	sub	op_2,x0,s5
	sub	s8,op_0,op_2
	addi	s9,zero,0
.L58:
	addi	s7,t6,0
.L57:
	lbu	a4,0(s7)
	addi	a3,s7,0
	addi	a5,s8,0
	bne	a4,zero,.L51
	jal	x0,.L52
.L78:
	bne	a2,a4,.L55
	lbu	a4,0(a3)
	bne	a4,zero,.+8
	jal	x0,.L52
.L51:
	lbu	a2,0(a5)
	addi	a3,a3,1
	addi	a5,a5,1
	bne	a2,zero,.L78
.L55:
	addi	s7,s7,257
	bne	s7,t4,.L57
	addi	op_1,x0,257
	or	op_0,x0,op_1
	sub	op_2,x0,s8
	sub	s8,op_0,op_2
	bne	s8,s2,.L58
.L79:
	addi	op_1,x0,-1
	or	op_0,x0,op_1
	sub	op_2,x0,s3
	sub	s3,op_0,op_2
	bne	s3,zero,.L59
	lw	s0,44(sp)
	lui	a5,%hi(heap+8996)
	lui	a4,2
	addi	a5,a5,%lo(heap+8996)
	lui	a6,%hi(heap_ptr)
	lui	a2,%hi(heap_end)
	addi	a4,a4,804
	lui	a3,%hi(heap_requested)
	addi	a0,s9,-5
	sw	a1,%lo(seed)(s4)
	sw	a5,%lo(heap_ptr)(a6)
	sw	a5,%lo(heap_end)(a2)
	sw	a4,%lo(heap_requested)(a3)
	lw	s1,40(sp)
	lw	s2,36(sp)
	lw	s3,32(sp)
	lw	s4,28(sp)
	lw	s5,24(sp)
	lw	s6,20(sp)
	lw	s7,16(sp)
	lw	s8,12(sp)
	lw	s9,8(sp)
	lw	s10,4(sp)
	lw	s11,0(sp)
	addi	op_0,x0,1
	bgeu	a0,op_0,.+8
	jal	x0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	addi	sp,sp,48
	jalr	zero,ra,0
.L52:
	lbu	a5,0(a5)
	bne	a5,zero,.L55
	addi	s8,s8,257
	addi	s9,s9,1
	bne	s8,s2,.L58
	jal	x0,.L79
.L61:
	addi	a4,zero,1
	addi	op_1,x0,256
	or	op_0,x0,op_1
	sub	op_2,x0,zero
	sub	a3,op_0,op_2
	jal	x0,.L45
.L60:
	addi	a4,zero,0
	addi	a3,zero,257
	jal	x0,.L45
.L62:
	addi	a4,zero,2
	addi	a3,zero,255
	jal	x0,.L45
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
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
.Lpcrel_1:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
	lw	ra,12(sp)
	addi	op_1,x0,16
	or	op_0,x0,op_1
	sub	op_2,x0,sp
	sub	sp,op_0,op_2
	jalr	zero,ra,0
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_2:
	auipc	ra,%pcrel_hi(benchmark_body.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_2)
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
.Lpcrel_3:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_3)
.Lpcrel_4:
	auipc	ra,%pcrel_hi(benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_4)
	sw	a0,12(sp)
	lw	a0,12(sp)
	lw	ra,28(sp)
	addi	a0,a0,-1
	bgeu	zero,a0,.+8
	jal	x0,.+12
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
	addi	a0,a0,-1
	addi	op_0,x0,1
	bgeu	a0,op_0,.+8
	jal	x0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
	.size	verify_benchmark, .-verify_benchmark
	.bss
	.align	2
	.type	heap, @object
	.size	heap, 8996
heap:
	.zero	8996
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


    .text
    .align 2
__mul:
	sub	op_0,x0,a0
	sub	a2,x0,op_0
	addi	a0,x0,0
.Mul_loop:
	addi	op_2,x0,1
	or	op_1,a1,op_2
	addi	op_3,x0,1
	sub	op_0,op_1,op_3
	sub	a3,a1,op_0
	bne	a3,x0,.+8
	jal	x0,.Mul_skip
	sub	op_0,x0,a0
	sub	a0,a2,op_0
.Mul_skip:
	addi	op_0,x0,1
	srl	a1,a1,op_0
	addi	op_0,x0,1
	sll	a2,a2,op_0
	bne	a1,x0,.Mul_loop
	jalr	x0,ra,0

.text
.align 2

# Signed 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_divsi3
__riscv_div_lib_divsi3:
	blt	a0,zero,__riscv_div_lib_L10
	blt	a1,zero,__riscv_div_lib_L11
    # Since the quotient is positive, fall into udivsi3

# Unsigned 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_udivsi3
__riscv_div_lib_udivsi3:
	addi	a2,a1,0
	addi	a1,a0,0
	addi	op_1,x0,-1
	or	op_0,x0,op_1
	sub	op_2,x0,zero
	sub	a0,op_0,op_2
	bne	a2,zero,.+8
	jal	x0,__riscv_div_lib_L5
	addi	a3,zero,1
	bgeu	a2,a1,__riscv_div_lib_L2
__riscv_div_lib_L1:
	blt	zero,a2,.+8
	jal	x0,__riscv_div_lib_L2
	addi	op_0,x0,1
	sll	a2,a2,op_0
	addi	op_0,x0,1
	sll	a3,a3,op_0
	bgeu	a2,a1,.+8
	jal	x0,__riscv_div_lib_L1
__riscv_div_lib_L2:
	addi	a0,zero,0
__riscv_div_lib_L3:
	bgeu	a1,a2,.+8
	jal	x0,__riscv_div_lib_L4
	sub	a1,a1,a2
	or	a0,a0,a3
__riscv_div_lib_L4:
	addi	op_0,x0,1
	srl	a3,a3,op_0
	addi	op_0,x0,1
	srl	a2,a2,op_0
	bne	a3,zero,__riscv_div_lib_L3
__riscv_div_lib_L5:
	jalr	zero,ra,0

# Unsigned 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_umodsi3
__riscv_div_lib_umodsi3:
	addi	op_1,x0,0
	or	op_0,x0,op_1
	sub	op_2,x0,ra
	sub	t0,op_0,op_2
.Lpcrel_div1:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div1)
	addi	a0,a1,0
	jalr	zero,t0,0

# Handle negative arguments to divsi3
__riscv_div_lib_L10:
	sub	a0,zero,a0
	blt	zero,a1,__riscv_div_lib_L12
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
	blt	a1,zero,__riscv_div_lib_L31
	blt	a0,zero,__riscv_div_lib_L32
__riscv_div_lib_L30:
.Lpcrel_div3:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div3)
	addi	a0,a1,0
	jalr	zero,t0,0
__riscv_div_lib_L31:
	sub	a1,zero,a1
	blt	a0,zero,.+8
	jal	x0,__riscv_div_lib_L30
__riscv_div_lib_L32:
	sub	a0,zero,a0
.Lpcrel_div4:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div4)
	sub	a0,zero,a1
	jalr	zero,t0,0

# end of subrountine