	.file	"combined.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	sglib___rbtree_fix_left_deletion_discrepancy, @function
sglib___rbtree_fix_left_deletion_discrepancy:
	lw	a4,0(a0)
	lw	a5,12(a4)
	beq	a5,zero,.L51
	lbu	a6,4(a5)
	addi	a2, zero, 1
	lw	a1,12(a5)
	lw	a3,8(a5)
	beq	a6,a2,.L52
	beq	a1,zero,.L13
	lbu	a6,4(a1)
	bne	a6,zero,.L14
.L13:
	beq	a3,zero,.L15
	lbu	a2,4(a3)
	beq	a2,zero,.L15
.L16:
	lw	a1,12(a3)
	lw	a2,8(a3)
	sw	a3,0(a0)
	lbu	a0,4(a4)
	sb	a0,4(a3)
	sb	zero,4(a4)
	sw	a5,12(a3)
	sw	a4,8(a3)
	sw	a1,8(a5)
	sw	a2,12(a4)
.L3:
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L52:
	beq	a3,zero,.L53
	lw	a7,12(a3)
	lw	a2,8(a3)
	beq	a7,zero,.L47
	lbu	t1,4(a7)
	beq	t1,zero,.L47
	beq	t1,a6,.L54
	beq	a2,zero,.L3
	lbu	a1,4(a2)
.L8:
	addi	a6, zero, 1
	bne	a1,a6,.L3
.L48:
	lw	a6,12(a2)
	lw	a1,8(a2)
	sw	a2,0(a0)
	sb	zero,4(a2)
	sw	a5,12(a2)
	sw	a6,8(a3)
	sw	a4,8(a2)
	sw	a1,12(a4)
	jal	zero, .L3
.L51:
	sb	zero,4(a4)
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L14:
	bne	a6,a2,.L16
	beq	a3,zero,.L17
	lbu	a2,4(a3)
	bne	a2,zero,.L16
.L17:
	sw	a5,0(a0)
	lbu	a2,4(a4)
	sb	a2,4(a5)
	sb	zero,4(a4)
	sw	a4,8(a5)
	sw	a3,12(a4)
	sb	zero,4(a1)
	jal	zero, .L3
.L15:
	lbu	a0,4(a4)
	addi	a3, zero, 1
	sb	zero,4(a4)
	sltiu	a0, a0, 1
	sb	a3,4(a5)
	jalr	zero, ra, 0
.L53:
	sw	a5,0(a0)
	sb	zero,4(a5)
	sw	a4,8(a5)
	sw	zero,12(a4)
	jal	zero, .L3
.L47:
	beq	a2,zero,.L7
	lbu	a1,4(a2)
	bne	a1,zero,.L8
.L7:
	sw	a5,0(a0)
	sw	a4,8(a5)
	sb	zero,4(a5)
	sw	a3,12(a4)
	addi	a5, zero, 1
	sb	a5,4(a3)
	jal	zero, .L3
.L54:
	beq	a2,zero,.L12
	lbu	a6,4(a2)
	beq	a6,t1,.L48
.L12:
	sw	a3,0(a0)
	sw	a5,12(a3)
	sw	a4,8(a3)
	sw	a1,12(a5)
	sw	a7,8(a5)
	sw	a2,12(a4)
	sb	zero,4(a7)
	jal	zero, .L3
	.size	sglib___rbtree_fix_left_deletion_discrepancy, .-sglib___rbtree_fix_left_deletion_discrepancy
	.align	2
	.type	sglib___rbtree_fix_right_deletion_discrepancy, @function
sglib___rbtree_fix_right_deletion_discrepancy:
	lw	a4,0(a0)
	lw	a5,8(a4)
	beq	a5,zero,.L104
	lbu	a6,4(a5)
	addi	a2, zero, 1
	lw	a1,8(a5)
	lw	a3,12(a5)
	beq	a6,a2,.L105
	beq	a1,zero,.L67
	lbu	a6,4(a1)
	bne	a6,zero,.L68
.L67:
	beq	a3,zero,.L69
	lbu	a2,4(a3)
	beq	a2,zero,.L69
.L70:
	lw	a1,8(a3)
	lw	a2,12(a3)
	sw	a3,0(a0)
	lbu	a0,4(a4)
	sb	a0,4(a3)
	sb	zero,4(a4)
	sw	a5,8(a3)
	sw	a4,12(a3)
	sw	a1,12(a5)
	sw	a2,8(a4)
.L57:
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L105:
	beq	a3,zero,.L106
	lw	a7,8(a3)
	lw	a2,12(a3)
	beq	a7,zero,.L101
	lbu	t1,4(a7)
	beq	t1,zero,.L101
	beq	t1,a6,.L107
	beq	a2,zero,.L57
	lbu	a1,4(a2)
.L62:
	addi	a6, zero, 1
	bne	a1,a6,.L57
.L102:
	lw	a6,8(a2)
	lw	a1,12(a2)
	sw	a2,0(a0)
	sb	zero,4(a2)
	sw	a5,8(a2)
	sw	a6,12(a3)
	sw	a4,12(a2)
	sw	a1,8(a4)
	jal	zero, .L57
.L104:
	sb	zero,4(a4)
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L68:
	bne	a6,a2,.L70
	beq	a3,zero,.L71
	lbu	a2,4(a3)
	bne	a2,zero,.L70
.L71:
	sw	a5,0(a0)
	lbu	a2,4(a4)
	sb	a2,4(a5)
	sb	zero,4(a4)
	sw	a4,12(a5)
	sw	a3,8(a4)
	sb	zero,4(a1)
	jal	zero, .L57
.L69:
	lbu	a0,4(a4)
	addi	a3, zero, 1
	sb	zero,4(a4)
	sltiu	a0, a0, 1
	sb	a3,4(a5)
	jalr	zero, ra, 0
.L106:
	sw	a5,0(a0)
	sb	zero,4(a5)
	sw	a4,12(a5)
	sw	zero,8(a4)
	jal	zero, .L57
.L101:
	beq	a2,zero,.L61
	lbu	a1,4(a2)
	bne	a1,zero,.L62
.L61:
	sw	a5,0(a0)
	sw	a4,12(a5)
	sb	zero,4(a5)
	sw	a3,8(a4)
	addi	a5, zero, 1
	sb	a5,4(a3)
	jal	zero, .L57
.L107:
	beq	a2,zero,.L66
	lbu	a6,4(a2)
	beq	a6,t1,.L102
.L66:
	sw	a3,0(a0)
	sw	a5,8(a3)
	sw	a4,12(a3)
	sw	a1,8(a5)
	sw	a7,12(a5)
	sw	a2,8(a4)
	sb	zero,4(a7)
	jal	zero, .L57
	.size	sglib___rbtree_fix_right_deletion_discrepancy, .-sglib___rbtree_fix_right_deletion_discrepancy
	.align	2
	.type	sglib___rbtree_delete_rightmost_leaf, @function
sglib___rbtree_delete_rightmost_leaf:
	lw	a5,0(a0)
	addi	a4, a0, 0
	lw	a3,12(a5)
	beq	a3,zero,.L143
	lw	a6,12(a3)
	addi	sp,sp,-32
	sw	ra,28(sp)
	beq	a6,zero,.L144
	lw	a0,12(a6)
	beq	a0,zero,.L145
	lw	a7,12(a0)
	beq	a7,zero,.L146
	addi	a0,a0,12
	sw	a4,12(sp)
	sw	a6,8(sp)
	sw	a5,4(sp)
	sw	a3,0(sp)
.Lpcrel_1:
	auipc	ra, %pcrel_hi(sglib___rbtree_delete_rightmost_leaf)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_1)
	lw	a6,8(sp)
	lw	a4,12(sp)
	bne	a0,zero,.L147
.L117:
	addi	a0, zero, 0
.L148:
	lw	ra,28(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L144:
	sw	a3,0(a1)
	lw	a2,8(a3)
	beq	a2,zero,.L114
	lbu	a3,4(a3)
	bne	a3,zero,.L115
	lbu	a3,4(a2)
	bne	a3,zero,.L115
	sw	a2,12(a5)
	jal	zero, .L116
.L143:
	sw	a5,0(a1)
	lw	a3,8(a5)
	beq	a3,zero,.L110
	lbu	a5,4(a5)
	addi	a0, zero, 0
	bne	a5,zero,.L111
	lbu	a0,4(a3)
	sltiu	a0, a0, 1
.L111:
	sb	zero,4(a3)
	sw	a3,0(a4)
	jalr	zero, ra, 0
.L145:
	sw	a6,0(a1)
	lw	a2,8(a6)
	beq	a2,zero,.L120
	lbu	a1,4(a6)
	bne	a1,zero,.L121
	lbu	a1,4(a2)
	bne	a1,zero,.L121
	sw	a2,12(a3)
	jal	zero, .L122
.L114:
	sw	zero,12(a5)
	lbu	a5,4(a3)
	bne	a5,zero,.L117
.L116:
	addi	a0, a4, 0
.Lpcrel_2:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_2)
	lw	ra,28(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L121:
	sb	zero,4(a2)
	sw	a2,12(a3)
	addi	a0, zero, 0
	jal	zero, .L148
.L115:
	sb	zero,4(a2)
	sw	a2,12(a5)
	addi	a0, zero, 0
	jal	zero, .L148
.L110:
	sw	zero,0(a0)
	lbu	a0,4(a5)
	sltiu	a0, a0, 1
	jalr	zero, ra, 0
.L146:
	sw	a0,0(a1)
	lw	a2,8(a0)
	beq	a2,zero,.L125
	lbu	a1,4(a0)
	bne	a1,zero,.L127
	lbu	a1,4(a2)
	bne	a1,zero,.L127
	sw	a2,12(a6)
.L128:
	addi	a0,a3,12
	sw	a4,4(sp)
	sw	a5,0(sp)
.Lpcrel_3:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_3)
	lw	a5,0(sp)
	lw	a4,4(sp)
	beq	a0,zero,.L117
.L122:
	addi	a0,a5,12
	sw	a4,0(sp)
.Lpcrel_4:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_4)
	lw	a4,0(sp)
	bne	a0,zero,.L116
	addi	a0, zero, 0
	jal	zero, .L148
.L147:
	addi	a0,a6,12
	sw	a4,8(sp)
.Lpcrel_5:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_5)
	lw	a3,0(sp)
	lw	a5,4(sp)
	lw	a4,8(sp)
	bne	a0,zero,.L128
	addi	a0, zero, 0
	jal	zero, .L148
.L125:
	sw	zero,12(a6)
	lbu	a2,4(a0)
	beq	a2,zero,.L128
	addi	a0, zero, 0
	jal	zero, .L148
.L120:
	sw	zero,12(a3)
	lbu	a3,4(a6)
	beq	a3,zero,.L122
	addi	a0, zero, 0
	jal	zero, .L148
.L127:
	sb	zero,4(a2)
	sw	a2,12(a6)
	addi	a0, zero, 0
	jal	zero, .L148
	.size	sglib___rbtree_delete_rightmost_leaf, .-sglib___rbtree_delete_rightmost_leaf
	.align	2
	.type	sglib___rbtree_consistency_check_recursive, @function
sglib___rbtree_consistency_check_recursive:
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	ra,44(sp)
	addi	s0, a1, 0
	addi	s1, a2, 0
	beq	a0,zero,.L234
	lbu	a6,4(a0)
	addi	a3, zero, 1
	lw	a4,8(a0)
	addi	a5, a0, 0
	beq	a6,a3,.L246
	sw	s3,28(sp)
	addi	s3,a2,1
	beq	a4,zero,.L243
	lbu	a2,4(a4)
	lw	a6,8(a4)
	beq	a2,a3,.L247
	sw	s2,32(sp)
	addi	s2,s1,2
	beq	a6,zero,.L248
	lbu	a2,4(a6)
	lw	a0,8(a6)
	beq	a2,a3,.L249
	addi	a2,s1,3
	sw	a5,12(sp)
	sw	a4,8(sp)
	sw	a6,4(sp)
	sw	a2,0(sp)
.Lpcrel_6:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_6)
	lw	a6,4(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a6)
.Lpcrel_7:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_7)
	lw	a5,12(sp)
	lw	a4,8(sp)
.L185:
	lw	a4,12(a4)
	beq	a4,zero,.L250
.L187:
	lbu	a2,4(a4)
	addi	a3, zero, 1
	lw	a0,8(a4)
	beq	a2,a3,.L251
	addi	a2,s1,3
	addi	a1, s0, 0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
.Lpcrel_8:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_8)
	lw	a4,4(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_9:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_9)
	lw	a5,8(sp)
	lw	s2,32(sp)
.L175:
	lw	a5,12(a5)
	beq	a5,zero,.L245
.L189:
	lbu	a2,4(a5)
	addi	a3, zero, 1
	lw	a4,8(a5)
	beq	a2,a3,.L252
	sw	s2,32(sp)
	addi	s2,s1,2
	beq	a4,zero,.L253
	lbu	a2,4(a4)
	lw	a0,8(a4)
	beq	a2,a3,.L254
	addi	a2,s1,3
	addi	a1, s0, 0
	sw	a5,4(sp)
	sw	a4,8(sp)
	sw	a2,0(sp)
.Lpcrel_10:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_10)
	lw	a4,8(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_11:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_11)
	lw	a5,4(sp)
.L199:
	lw	a5,12(a5)
	beq	a5,zero,.L255
.L201:
	lbu	a3,4(a5)
	addi	a4, zero, 1
	sw	a5,0(sp)
	lw	a0,8(a5)
	beq	a3,a4,.L256
	addi	a2,s1,3
	addi	a1, s0, 0
.Lpcrel_12:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_12)
	addi	a2,s1,3
.L236:
	lw	a5,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a5)
.Lpcrel_13:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_13)
	lw	s2,32(sp)
	lw	s3,28(sp)
.L149:
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jalr	zero, ra, 0
.L246:
	beq	a4,zero,.L257
	lbu	a0,4(a4)
	lw	a3,8(a4)
	beq	a0,a6,.L258
	sw	s2,32(sp)
	addi	s2,a2,1
	beq	a3,zero,.L259
	lbu	a2,4(a3)
	lw	a0,8(a3)
	beq	a2,a6,.L260
	addi	a2,s1,2
	sw	a5,12(sp)
	sw	a4,8(sp)
	sw	a3,4(sp)
	sw	a2,0(sp)
.Lpcrel_14:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_14)
	lw	a3,4(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a3)
.Lpcrel_15:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_15)
	lw	a5,12(sp)
	lw	a4,8(sp)
.L160:
	lw	a4,12(a4)
	beq	a4,zero,.L261
.L162:
	lbu	a2,4(a4)
	addi	a3, zero, 1
	lw	a0,8(a4)
	beq	a2,a3,.L262
	addi	a2,s1,2
	addi	a1, s0, 0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
.Lpcrel_16:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_16)
	lw	a4,4(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_17:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_17)
	lw	a5,8(sp)
	lw	s2,32(sp)
.L156:
	lw	a5,12(a5)
	beq	a5,zero,.L234
.L164:
	lbu	a2,4(a5)
	addi	a3, zero, 1
	lw	a4,8(a5)
	beq	a2,a3,.L263
	sw	s2,32(sp)
	addi	s2,s1,1
	beq	a4,zero,.L264
	lbu	a2,4(a4)
	lw	a0,8(a4)
	beq	a2,a3,.L265
	addi	a2,s1,2
	addi	a1, s0, 0
	sw	a5,4(sp)
	sw	a4,8(sp)
	sw	a2,0(sp)
.Lpcrel_18:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_18)
	lw	a4,8(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_19:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_19)
	lw	a5,4(sp)
.L169:
	lw	a5,12(a5)
	beq	a5,zero,.L266
.L171:
	lbu	a3,4(a5)
	addi	a4, zero, 1
	sw	a5,0(sp)
	lw	a0,8(a5)
	beq	a3,a4,.L267
	addi	a2,s1,2
	addi	a1, s0, 0
.Lpcrel_20:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_20)
	addi	a2,s1,2
.L238:
	lw	a5,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a5)
.Lpcrel_21:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_21)
.L239:
	lw	s2,32(sp)
	jal	zero, .L149
.L234:
	lw	a5,0(s0)
	bge	a5,zero,.L149
	sw	s1,0(s0)
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jalr	zero, ra, 0
.L257:
	lw	a4,0(a1)
	blt	a4,zero,.L268
.L155:
	lw	a5,12(a5)
	bne	a5,zero,.L164
	jal	zero, .L149
.L248:
	lw	a3,0(a1)
	blt	a3,zero,.L269
	lw	a4,12(a4)
	bne	a4,zero,.L187
.L230:
	lw	s2,32(sp)
	jal	zero, .L174
.L243:
	lw	a4,0(s0)
	blt	a4,zero,.L270
.L174:
	lw	a5,12(a5)
	bne	a5,zero,.L189
.L237:
	lw	s3,28(sp)
.L278:
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jalr	zero, ra, 0
.L245:
	lw	a5,0(s0)
	bge	a5,zero,.L237
	sw	s3,0(s0)
	lw	s3,28(sp)
	jal	zero, .L149
.L247:
	beq	a6,zero,.L271
	lbu	a3,4(a6)
	lw	a0,8(a6)
	beq	a3,a2,.L272
	addi	a2,s1,2
	sw	a5,12(sp)
	sw	a4,8(sp)
	sw	a6,4(sp)
	sw	a2,0(sp)
.Lpcrel_22:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_22)
	lw	a6,4(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a6)
.Lpcrel_23:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_23)
	lw	a5,12(sp)
	lw	a4,8(sp)
.L179:
	lw	a4,12(a4)
	beq	a4,zero,.L243
.L181:
	lbu	a2,4(a4)
	addi	a3, zero, 1
	lw	a0,8(a4)
	beq	a2,a3,.L273
	addi	a2,s1,2
	addi	a1, s0, 0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
.Lpcrel_24:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_24)
	lw	a4,4(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_25:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_25)
	lw	a5,8(sp)
	jal	zero, .L175
.L252:
	beq	a4,zero,.L274
	lbu	a3,4(a4)
	lw	a0,8(a4)
	beq	a3,a2,.L275
	addi	a2,s1,2
	addi	a1, s0, 0
	sw	a5,4(sp)
	sw	a4,8(sp)
	sw	a2,0(sp)
.Lpcrel_26:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_26)
	lw	a4,8(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_27:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_27)
	lw	a5,4(sp)
.L193:
	lw	a5,12(a5)
	beq	a5,zero,.L245
.L195:
	lbu	a3,4(a5)
	addi	a4, zero, 1
	sw	a5,0(sp)
	lw	a0,8(a5)
	beq	a3,a4,.L276
	addi	a2,s1,2
	addi	a1, s0, 0
.Lpcrel_28:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_28)
	addi	a2,s1,2
.L240:
	lw	a5,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a5)
.Lpcrel_29:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_29)
	lw	s3,28(sp)
	jal	zero, .L149
.L270:
	sw	s3,0(s0)
	jal	zero, .L175
.L253:
	lw	a4,0(s0)
	blt	a4,zero,.L277
	lw	a5,12(a5)
	bne	a5,zero,.L201
.L233:
	lw	s2,32(sp)
	lw	s3,28(sp)
	jal	zero, .L278
.L263:
	addi	a0, a4, 0
	addi	a2, s1, 0
	addi	a1, s0, 0
	sw	a5,0(sp)
.Lpcrel_30:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_30)
	lw	a5,0(sp)
	addi	a2, s1, 0
	addi	a1, s0, 0
	lw	a0,12(a5)
.Lpcrel_31:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_31)
	jal	zero, .L149
.L258:
	addi	a0, a3, 0
	sw	a5,4(sp)
	sw	a4,0(sp)
.Lpcrel_32:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_32)
	lw	a4,0(sp)
	addi	a2, s1, 0
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_33:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_33)
	lw	a5,4(sp)
	jal	zero, .L156
.L250:
	lw	a4,0(s0)
	bge	a4,zero,.L230
	sw	s2,0(s0)
	lw	s2,32(sp)
	jal	zero, .L175
.L255:
	lw	a5,0(s0)
	bge	a5,zero,.L233
	sw	s2,0(s0)
	lw	s3,28(sp)
	lw	s2,32(sp)
	jal	zero, .L149
.L249:
	addi	a2, s2, 0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a6,0(sp)
.Lpcrel_34:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_34)
	lw	a6,0(sp)
	addi	a2, s2, 0
	addi	a1, s0, 0
	lw	a0,12(a6)
.Lpcrel_35:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_35)
	lw	a4,4(sp)
	lw	a5,8(sp)
	jal	zero, .L185
.L254:
	addi	a2, s2, 0
	addi	a1, s0, 0
	sw	a5,0(sp)
	sw	a4,4(sp)
.Lpcrel_36:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_36)
	lw	a4,4(sp)
	addi	a2, s2, 0
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_37:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_37)
	lw	a5,0(sp)
	jal	zero, .L199
.L251:
	addi	a2, s2, 0
	addi	a1, s0, 0
	sw	a5,4(sp)
	sw	a4,0(sp)
.Lpcrel_38:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_38)
	lw	a4,0(sp)
	addi	a2, s2, 0
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_39:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_39)
	lw	a5,4(sp)
	lw	s2,32(sp)
	jal	zero, .L175
.L256:
	addi	a2, s2, 0
	addi	a1, s0, 0
.Lpcrel_40:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_40)
	addi	a2, s2, 0
	jal	zero, .L236
.L268:
	sw	a2,0(s0)
	jal	zero, .L156
.L269:
	sw	s2,0(a1)
	jal	zero, .L185
.L277:
	sw	s2,0(s0)
	jal	zero, .L199
.L271:
	lw	a3,0(a1)
	blt	a3,zero,.L279
	lw	a4,12(a4)
	bne	a4,zero,.L181
	jal	zero, .L174
.L264:
	lw	a4,0(s0)
	blt	a4,zero,.L280
	lw	a5,12(a5)
	bne	a5,zero,.L171
	lw	s2,32(sp)
	jal	zero, .L149
.L274:
	lw	a4,0(s0)
	blt	a4,zero,.L281
	lw	a5,12(a5)
	bne	a5,zero,.L195
	lw	s3,28(sp)
	jal	zero, .L278
.L259:
	lw	a3,0(a1)
	blt	a3,zero,.L282
	lw	a4,12(a4)
	bne	a4,zero,.L162
.L228:
	lw	s2,32(sp)
	jal	zero, .L155
.L266:
	lw	a5,0(s0)
	bge	a5,zero,.L239
	sw	s2,0(s0)
	lw	s2,32(sp)
	jal	zero, .L149
.L261:
	lw	a4,0(s0)
	bge	a4,zero,.L228
	sw	s2,0(s0)
	lw	s2,32(sp)
	jal	zero, .L156
.L276:
	addi	a2, s3, 0
	addi	a1, s0, 0
.Lpcrel_41:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_41)
	addi	a2, s3, 0
	jal	zero, .L240
.L265:
	addi	a2, s2, 0
	addi	a1, s0, 0
	sw	a5,0(sp)
	sw	a4,4(sp)
.Lpcrel_42:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_42)
	lw	a4,4(sp)
	addi	a2, s2, 0
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_43:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_43)
	lw	a5,0(sp)
	jal	zero, .L169
.L267:
	addi	a2, s2, 0
	addi	a1, s0, 0
.Lpcrel_44:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_44)
	addi	a2, s2, 0
	jal	zero, .L238
.L262:
	addi	a2, s2, 0
	addi	a1, s0, 0
	sw	a5,4(sp)
	sw	a4,0(sp)
.Lpcrel_45:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_45)
	lw	a4,0(sp)
	addi	a2, s2, 0
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_46:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_46)
	lw	a5,4(sp)
	lw	s2,32(sp)
	jal	zero, .L156
.L260:
	addi	a2, s2, 0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a3,0(sp)
.Lpcrel_47:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_47)
	lw	a3,0(sp)
	addi	a2, s2, 0
	addi	a1, s0, 0
	lw	a0,12(a3)
.Lpcrel_48:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_48)
	lw	a4,4(sp)
	lw	a5,8(sp)
	jal	zero, .L160
.L273:
	addi	a2, s3, 0
	addi	a1, s0, 0
	sw	a5,4(sp)
	sw	a4,0(sp)
.Lpcrel_49:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_49)
	lw	a4,0(sp)
	addi	a2, s3, 0
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_50:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_50)
	lw	a5,4(sp)
	jal	zero, .L175
.L272:
	addi	a2, s3, 0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a6,0(sp)
.Lpcrel_51:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_51)
	lw	a6,0(sp)
	addi	a2, s3, 0
	addi	a1, s0, 0
	lw	a0,12(a6)
.Lpcrel_52:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_52)
	lw	a4,4(sp)
	lw	a5,8(sp)
	jal	zero, .L179
.L275:
	addi	a2, s3, 0
	addi	a1, s0, 0
	sw	a5,0(sp)
	sw	a4,4(sp)
.Lpcrel_53:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_53)
	lw	a4,4(sp)
	addi	a2, s3, 0
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_54:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_54)
	lw	a5,0(sp)
	jal	zero, .L193
.L281:
	sw	s3,0(s0)
	jal	zero, .L193
.L280:
	sw	s2,0(s0)
	jal	zero, .L169
.L282:
	sw	s2,0(a1)
	jal	zero, .L160
.L279:
	sw	s3,0(a1)
	jal	zero, .L179
	.size	sglib___rbtree_consistency_check_recursive, .-sglib___rbtree_consistency_check_recursive
	.align	2
	.type	sglib___rbtree_consistency_check_recursive.constprop.2, @function
sglib___rbtree_consistency_check_recursive.constprop.2:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	ra,28(sp)
	addi	s0, a1, 0
	beq	a0,zero,.L327
	lbu	a2,4(a0)
	addi	a3, zero, 1
	lw	a4,8(a0)
	addi	a5, a0, 0
	beq	a2,a3,.L330
	beq	a4,zero,.L331
	lbu	a2,4(a4)
	lw	a6,8(a4)
	beq	a2,a3,.L332
	beq	a6,zero,.L333
	lbu	a2,4(a6)
	sw	a5,12(sp)
	sw	a4,8(sp)
	sw	a6,4(sp)
	lw	a0,8(a6)
	beq	a2,a3,.L334
	addi	a2, zero, 5
.Lpcrel_55:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_55)
	lw	a6,4(sp)
	addi	a1, s0, 0
	addi	a2, zero, 5
	lw	a0,12(a6)
.Lpcrel_56:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_56)
	lw	a5,12(sp)
	lw	a4,8(sp)
.L303:
	lw	a4,12(a4)
	beq	a4,zero,.L335
.L304:
	lbu	a2,4(a4)
	addi	a3, zero, 1
	sw	a5,8(sp)
	sw	a4,4(sp)
	lw	a0,8(a4)
	beq	a2,a3,.L336
	addi	a2, zero, 5
	addi	a1, s0, 0
.Lpcrel_57:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_57)
	lw	a4,4(sp)
	addi	a1, s0, 0
	addi	a2, zero, 5
	lw	a0,12(a4)
.Lpcrel_58:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_58)
	lw	a5,8(sp)
.L299:
	lw	a5,12(a5)
	beq	a5,zero,.L337
	lbu	a2,4(a5)
	addi	a3, zero, 1
	lw	a4,8(a5)
	beq	a2,a3,.L338
.L307:
	beq	a4,zero,.L339
	lbu	a2,4(a4)
	sw	a4,8(sp)
	sw	a5,4(sp)
	lw	a0,8(a4)
	beq	a2,a3,.L340
	addi	a2, zero, 5
	addi	a1, s0, 0
.Lpcrel_59:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_59)
	lw	a4,8(sp)
	addi	a1, s0, 0
	addi	a2, zero, 5
	lw	a0,12(a4)
.Lpcrel_60:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_60)
	lw	a5,4(sp)
.L311:
	lw	a5,12(a5)
	beq	a5,zero,.L341
.L312:
	lbu	a3,4(a5)
	addi	a4, zero, 1
	sw	a5,4(sp)
	lw	a0,8(a5)
	beq	a3,a4,.L342
	addi	a2, zero, 5
	addi	a1, s0, 0
.Lpcrel_61:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_61)
	lw	a5,4(sp)
	addi	a1, s0, 0
	addi	a2, zero, 5
	lw	a0,12(a5)
.Lpcrel_62:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_62)
.L283:
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L330:
	beq	a4,zero,.L343
	lbu	a3,4(a4)
	sw	a5,8(sp)
	sw	a4,4(sp)
	lw	a0,8(a4)
	beq	a3,a2,.L344
	addi	a2, zero, 3
.Lpcrel_63:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_63)
	lw	a4,4(sp)
	addi	a1, s0, 0
	addi	a2, zero, 3
	lw	a0,12(a4)
.Lpcrel_64:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_64)
	lw	a5,8(sp)
.L291:
	lw	a5,12(a5)
	beq	a5,zero,.L327
.L292:
	lbu	a3,4(a5)
	addi	a4, zero, 1
	sw	a5,4(sp)
	lw	a0,8(a5)
	beq	a3,a4,.L345
.L328:
	addi	a1, s0, 0
	addi	a2, zero, 3
.Lpcrel_65:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_65)
	lw	a5,4(sp)
	addi	a1, s0, 0
	addi	a2, zero, 3
	lw	a0,12(a5)
.Lpcrel_66:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_66)
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L327:
	lw	a5,0(s0)
	bge	a5,zero,.L283
	addi	a5, zero, 2
	lw	ra,28(sp)
	sw	a5,0(s0)
	lw	s0,24(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L343:
	lw	a4,0(a1)
	blt	a4,zero,.L346
.L289:
	lw	a5,12(a5)
	bne	a5,zero,.L292
	jal	zero, .L283
.L333:
	lw	a3,0(a1)
	blt	a3,zero,.L347
.L301:
	lw	a4,12(a4)
	bne	a4,zero,.L304
.L297:
	lw	a5,12(a5)
	beq	a5,zero,.L283
	lbu	a2,4(a5)
	addi	a3, zero, 1
	lw	a4,8(a5)
	bne	a2,a3,.L307
.L338:
	sw	a5,4(sp)
	addi	a0, a4, 0
	jal	zero, .L328
.L331:
	lw	a4,0(a1)
	bge	a4,zero,.L297
	addi	a4, zero, 3
	sw	a4,0(a1)
	jal	zero, .L297
.L332:
	sw	a0,8(sp)
	addi	a2, zero, 3
	addi	a0, a6, 0
	sw	a4,4(sp)
.Lpcrel_67:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_67)
	lw	a4,4(sp)
	addi	a1, s0, 0
	addi	a2, zero, 3
	lw	a0,12(a4)
.Lpcrel_68:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_68)
	lw	a5,8(sp)
	jal	zero, .L299
.L337:
	lw	a5,0(s0)
	bge	a5,zero,.L283
	addi	a5, zero, 3
	sw	a5,0(s0)
	jal	zero, .L283
.L339:
	lw	a4,0(s0)
	blt	a4,zero,.L348
.L309:
	lw	a5,12(a5)
	bne	a5,zero,.L312
	jal	zero, .L283
.L345:
	addi	a1, s0, 0
	addi	a2, zero, 2
.Lpcrel_69:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_69)
	lw	a5,4(sp)
	addi	a1, s0, 0
	addi	a2, zero, 2
	lw	a0,12(a5)
.Lpcrel_70:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_70)
	jal	zero, .L283
.L344:
	addi	a2, zero, 2
.Lpcrel_71:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_71)
	lw	a4,4(sp)
	addi	a1, s0, 0
	addi	a2, zero, 2
	lw	a0,12(a4)
.Lpcrel_72:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_72)
	lw	a5,8(sp)
	jal	zero, .L291
.L336:
	addi	a2, zero, 4
	addi	a1, s0, 0
.Lpcrel_73:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_73)
	lw	a4,4(sp)
	addi	a1, s0, 0
	addi	a2, zero, 4
	lw	a0,12(a4)
.Lpcrel_74:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_74)
	lw	a5,8(sp)
	jal	zero, .L299
.L334:
	addi	a2, zero, 4
.Lpcrel_75:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_75)
	lw	a6,4(sp)
	addi	a1, s0, 0
	addi	a2, zero, 4
	lw	a0,12(a6)
.Lpcrel_76:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_76)
	lw	a4,8(sp)
	lw	a5,12(sp)
	jal	zero, .L303
.L342:
	addi	a1, s0, 0
	addi	a2, zero, 4
.Lpcrel_77:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_77)
	lw	a5,4(sp)
	addi	a1, s0, 0
	addi	a2, zero, 4
	lw	a0,12(a5)
.Lpcrel_78:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_78)
	jal	zero, .L283
.L340:
	addi	a2, zero, 4
	addi	a1, s0, 0
.Lpcrel_79:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_79)
	lw	a4,8(sp)
	addi	a1, s0, 0
	addi	a2, zero, 4
	lw	a0,12(a4)
.Lpcrel_80:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_80)
	lw	a5,4(sp)
	jal	zero, .L311
.L346:
	addi	a4, zero, 2
	sw	a4,0(a1)
	jal	zero, .L289
.L348:
	addi	a4, zero, 4
	sw	a4,0(s0)
	jal	zero, .L309
.L347:
	addi	a3, zero, 4
	sw	a3,0(a1)
	jal	zero, .L301
.L341:
	lw	a5,0(s0)
	bge	a5,zero,.L283
	addi	a5, zero, 4
	sw	a5,0(s0)
	jal	zero, .L283
.L335:
	lw	a4,0(s0)
	bge	a4,zero,.L297
	addi	a4, zero, 4
	sw	a4,0(s0)
	jal	zero, .L297
	.size	sglib___rbtree_consistency_check_recursive.constprop.2, .-sglib___rbtree_consistency_check_recursive.constprop.2
	.align	2
	.type	sglib___rbtree_consistency_check_recursive.constprop.0, @function
sglib___rbtree_consistency_check_recursive.constprop.0:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	ra,28(sp)
	addi	s0, a1, 0
	beq	a0,zero,.L400
	lbu	a2,4(a0)
	addi	a3, zero, 1
	lw	a4,8(a0)
	addi	a5, a0, 0
	beq	a2,a3,.L401
	beq	a4,zero,.L397
	lbu	a7,4(a4)
	lw	a6,8(a4)
	beq	a7,a3,.L402
	sw	a0,4(sp)
	addi	a0, a6, 0
	sw	a4,0(sp)
.Lpcrel_81:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.2)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_81)
	lw	a4,0(sp)
	lw	a5,4(sp)
	addi	a3, zero, 1
	lw	a4,12(a4)
	beq	a4,zero,.L403
	lbu	a2,4(a4)
	lw	a6,8(a4)
	beq	a2,a3,.L404
	beq	a6,zero,.L405
	lbu	a2,4(a6)
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a6,0(sp)
	lw	a0,8(a6)
	beq	a2,a3,.L406
	addi	a2, zero, 4
	addi	a1, s0, 0
.Lpcrel_82:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_82)
	lw	a6,0(sp)
	addi	a1, s0, 0
	addi	a2, zero, 4
	lw	a0,12(a6)
.Lpcrel_83:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_83)
	lw	a5,8(sp)
	lw	a4,4(sp)
.L371:
	lw	a4,12(a4)
	beq	a4,zero,.L407
.L372:
	lbu	a2,4(a4)
	addi	a3, zero, 1
	sw	a5,4(sp)
	sw	a4,0(sp)
	lw	a0,8(a4)
	beq	a2,a3,.L408
	addi	a2, zero, 4
	addi	a1, s0, 0
.Lpcrel_84:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_84)
	lw	a4,0(sp)
	addi	a1, s0, 0
	addi	a2, zero, 4
	lw	a0,12(a4)
.Lpcrel_85:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_85)
	lw	a5,4(sp)
	jal	zero, .L365
.L401:
	sw	a0,0(sp)
	addi	a0, a4, 0
.Lpcrel_86:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_86)
	lw	a5,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a5)
.Lpcrel_87:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_87)
.L349:
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L400:
	lw	a5,0(a1)
	bge	a5,zero,.L349
	lw	ra,28(sp)
	lw	s0,24(sp)
	sw	zero,0(a1)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L403:
	lw	a4,0(s0)
	blt	a4,zero,.L409
.L356:
	lw	a5,12(a5)
	beq	a5,zero,.L349
.L374:
	lbu	a3,4(a5)
	addi	a2, zero, 1
	lw	a4,8(a5)
	beq	a3,a2,.L410
	addi	a0, a4, 0
	addi	a1, s0, 0
	sw	a5,0(sp)
.Lpcrel_88:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.2)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_88)
	lw	a5,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a5)
.Lpcrel_89:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.2)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_89)
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L397:
	lw	a4,0(s0)
	bge	a4,zero,.L356
	addi	a4, zero, 1
	sw	a4,0(s0)
	jal	zero, .L356
.L402:
	beq	a6,zero,.L411
	lbu	a2,4(a6)
	lw	a0,8(a6)
	beq	a2,a7,.L412
	addi	a2, zero, 2
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a6,0(sp)
.Lpcrel_90:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_90)
	lw	a6,0(sp)
	addi	a1, s0, 0
	addi	a2, zero, 2
	lw	a0,12(a6)
.Lpcrel_91:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_91)
	lw	a5,8(sp)
	lw	a4,4(sp)
.L361:
	lw	a4,12(a4)
	beq	a4,zero,.L397
.L362:
	lbu	a2,4(a4)
	addi	a3, zero, 1
	lw	a0,8(a4)
	beq	a2,a3,.L413
	sw	a5,4(sp)
	sw	a4,0(sp)
.L398:
	addi	a2, zero, 2
	addi	a1, s0, 0
.Lpcrel_92:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_92)
	lw	a4,0(sp)
	addi	a1, s0, 0
	addi	a2, zero, 2
	lw	a0,12(a4)
.Lpcrel_93:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_93)
	lw	a5,4(sp)
.L365:
	lw	a5,12(a5)
	bne	a5,zero,.L374
.L399:
	lw	a5,0(s0)
	bge	a5,zero,.L349
	addi	a5, zero, 1
	sw	a5,0(s0)
	jal	zero, .L349
.L410:
	beq	a4,zero,.L414
	lbu	a2,4(a4)
	lw	a0,8(a4)
	beq	a2,a3,.L415
	addi	a2, zero, 2
	addi	a1, s0, 0
	sw	a5,4(sp)
	sw	a4,0(sp)
.Lpcrel_94:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_94)
	lw	a4,0(sp)
	addi	a1, s0, 0
	addi	a2, zero, 2
	lw	a0,12(a4)
.Lpcrel_95:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_95)
	lw	a5,4(sp)
.L380:
	lw	a5,12(a5)
	beq	a5,zero,.L399
.L381:
	lbu	a2,4(a5)
	addi	a4, zero, 1
	lw	a0,8(a5)
	beq	a2,a4,.L416
	addi	a1, s0, 0
	addi	a2, zero, 2
	sw	a5,0(sp)
.Lpcrel_96:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_96)
	lw	a5,0(sp)
	addi	a1, s0, 0
	addi	a2, zero, 2
	lw	a0,12(a5)
.Lpcrel_97:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_97)
	jal	zero, .L349
.L404:
	sw	a5,4(sp)
	sw	a4,0(sp)
	addi	a0, a6, 0
	jal	zero, .L398
.L409:
	addi	a4, zero, 2
	sw	a4,0(s0)
	jal	zero, .L356
.L406:
	addi	a2, zero, 3
	addi	a1, s0, 0
.Lpcrel_98:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_98)
	lw	a6,0(sp)
	addi	a1, s0, 0
	addi	a2, zero, 3
	lw	a0,12(a6)
.Lpcrel_99:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_99)
	lw	a4,4(sp)
	lw	a5,8(sp)
	jal	zero, .L371
.L411:
	lw	a3,0(a1)
	bge	a3,zero,.L359
	sw	a7,0(a1)
.L359:
	lw	a4,12(a4)
	bne	a4,zero,.L362
	jal	zero, .L356
.L414:
	lw	a4,0(s0)
	bge	a4,zero,.L378
	sw	a3,0(s0)
.L378:
	lw	a5,12(a5)
	bne	a5,zero,.L381
	jal	zero, .L349
.L405:
	lw	a3,0(s0)
	bge	a3,zero,.L369
	addi	a3, zero, 3
	sw	a3,0(s0)
.L369:
	lw	a4,12(a4)
	bne	a4,zero,.L372
	jal	zero, .L356
.L415:
	addi	a1, s0, 0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
.Lpcrel_100:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_100)
	lw	a4,4(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_101:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_101)
	lw	a5,8(sp)
	jal	zero, .L380
.L416:
	addi	a1, s0, 0
	sw	a5,4(sp)
	sw	a2,0(sp)
.Lpcrel_102:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_102)
	lw	a5,4(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a5)
.Lpcrel_103:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_103)
	jal	zero, .L349
.L413:
	addi	a1, s0, 0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
.Lpcrel_104:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_104)
	lw	a4,4(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_105:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_105)
	lw	a5,8(sp)
	jal	zero, .L365
.L412:
	sw	a5,12(sp)
	sw	a4,8(sp)
	sw	a6,4(sp)
	sw	a2,0(sp)
.Lpcrel_106:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_106)
	lw	a6,4(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a6)
.Lpcrel_107:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_107)
	lw	a4,8(sp)
	lw	a5,12(sp)
	jal	zero, .L361
.L408:
	addi	a2, zero, 3
	addi	a1, s0, 0
.Lpcrel_108:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_108)
	lw	a4,0(sp)
	addi	a1, s0, 0
	addi	a2, zero, 3
	lw	a0,12(a4)
.Lpcrel_109:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_109)
	lw	a5,4(sp)
	jal	zero, .L365
.L407:
	lw	a4,0(s0)
	bge	a4,zero,.L356
	addi	a4, zero, 3
	sw	a4,0(s0)
	jal	zero, .L356
	.size	sglib___rbtree_consistency_check_recursive.constprop.0, .-sglib___rbtree_consistency_check_recursive.constprop.0
	.align	2
	.type	sglib___rbtree_add_recursive.constprop.0, @function
sglib___rbtree_add_recursive.constprop.0:
	lw	a5,0(a0)
	beq	a5,zero,.L577
	lw	a2,0(a1)
	lw	a4,0(a5)
	addi	sp,sp,-32
	sw	ra,28(sp)
	sub	a4,a2,a4
	addi	a3, a0, 0
	blt	a4,zero,.L420
	bne	a4,zero,.L421
	bgeu	a1, a5, .L421
.L420:
	lw	a4,8(a5)
	beq	a4,zero,.L578
	lw	a0,0(a4)
	sub	a0,a2,a0
	blt	a0,zero,.L424
	bne	a0,zero,.L425
	bgeu	a1,a4,.L425
.L424:
	lw	a6,8(a4)
	beq	a6,zero,.L579
	lw	a0,0(a6)
	sub	a2,a2,a0
	blt	a2,zero,.L428
	bne	a2,zero,.L429
	bgeu	a1,a6,.L429
.L428:
	addi	a0,a6,8
	sw	a3,12(sp)
	sw	a4,8(sp)
	sw	a5,4(sp)
	sw	a6,0(sp)
.Lpcrel_110:
	auipc	ra, %pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_110)
	lw	a6,0(sp)
	lw	a5,4(sp)
	lw	a4,8(sp)
	lbu	a2,4(a6)
	lw	a3,12(sp)
	beq	a2,zero,.L580
.L427:
	lbu	a4,4(a4)
	beq	a4,zero,.L581
.L423:
	lbu	a5,4(a5)
	beq	a5,zero,.L582
.L417:
	lw	ra,28(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L577:
	addi	a5, zero, 1
	sb	a5,4(a1)
	sw	a1,0(a0)
	jalr	zero, ra, 0
.L578:
	addi	a4, zero, 1
	sb	a4,4(a1)
	sw	a1,8(a5)
	lbu	a5,4(a5)
	bne	a5,zero,.L417
.L582:
	lw	a5,0(a3)
	lw	a4,8(a5)
	lw	a2,12(a5)
	lbu	a1,4(a4)
	beq	a2,zero,.L451
	lbu	a0,4(a2)
	addi	a6, zero, 1
	beq	a0,a6,.L583
.L451:
	addi	a2, zero, 1
	bne	a1,a2,.L417
	lw	a0,8(a4)
	lw	a2,12(a4)
	beq	a0,zero,.L455
	lbu	a6,4(a0)
	beq	a6,a1,.L584
.L455:
	beq	a2,zero,.L417
	lbu	a1,4(a2)
	addi	a0, zero, 1
	bne	a1,a0,.L417
	lw	a6,8(a2)
	lw	a0,12(a2)
	sw	a6,12(a4)
	sw	a0,8(a5)
	sw	a4,8(a2)
	sw	a5,12(a2)
	sb	zero,4(a2)
	sb	a1,4(a5)
	sw	a2,0(a3)
	jal	zero, .L417
.L421:
	addi	a0,a5,12
	sw	a3,4(sp)
	sw	a5,0(sp)
.Lpcrel_111:
	auipc	ra, %pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_111)
	lw	a5,0(sp)
	lw	a3,4(sp)
	lbu	a5,4(a5)
	bne	a5,zero,.L417
	lw	a5,0(a3)
	lw	a4,12(a5)
	lw	a2,8(a5)
	lbu	a1,4(a4)
	beq	a2,zero,.L456
	lbu	a0,4(a2)
	addi	a6, zero, 1
	beq	a0,a6,.L585
.L456:
	addi	a2, zero, 1
	bne	a1,a2,.L417
	lw	a0,12(a4)
	lw	a2,8(a4)
	beq	a0,zero,.L459
	lbu	a6,4(a0)
	beq	a6,a1,.L586
.L459:
	beq	a2,zero,.L417
	lbu	a1,4(a2)
	addi	a0, zero, 1
	bne	a1,a0,.L417
	lw	a6,12(a2)
	lw	a0,8(a2)
	sw	a6,8(a4)
	sw	a0,12(a5)
	sw	a4,12(a2)
	sw	a5,8(a2)
	sb	zero,4(a2)
	sb	a1,4(a5)
	sw	a2,0(a3)
	jal	zero, .L417
.L579:
	addi	a2, zero, 1
	sb	a2,4(a1)
	sw	a1,8(a4)
	jal	zero, .L427
.L425:
	addi	a0,a4,12
	sw	a3,8(sp)
	sw	a5,4(sp)
	sw	a4,0(sp)
.Lpcrel_112:
	auipc	ra, %pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_112)
	lw	a4,0(sp)
	lw	a5,4(sp)
	lw	a3,8(sp)
	lbu	a4,4(a4)
	bne	a4,zero,.L423
	lw	a4,8(a5)
	lw	a2,12(a4)
	lw	a1,8(a4)
	lbu	a0,4(a2)
	beq	a1,zero,.L446
	lbu	a6,4(a1)
	addi	a7, zero, 1
	beq	a6,a7,.L587
.L446:
	addi	a1, zero, 1
	bne	a0,a1,.L423
	lw	a6,12(a2)
	lw	a1,8(a2)
	beq	a6,zero,.L449
	lbu	a7,4(a6)
	beq	a7,a0,.L588
.L449:
	beq	a1,zero,.L423
	lbu	a0,4(a1)
	addi	a6, zero, 1
	bne	a0,a6,.L423
	lw	a7,12(a1)
	lw	a6,8(a1)
	sw	a7,8(a2)
	sw	a6,12(a4)
	sw	a2,12(a1)
	sw	a4,8(a1)
	sb	zero,4(a1)
	sb	a0,4(a4)
	sw	a1,8(a5)
	jal	zero, .L423
.L581:
	lw	a4,8(a5)
	lw	a2,8(a4)
	lw	a1,12(a4)
	lbu	a0,4(a2)
	beq	a1,zero,.L441
	lbu	a6,4(a1)
	addi	a7, zero, 1
	beq	a6,a7,.L589
.L441:
	addi	a1, zero, 1
	bne	a0,a1,.L423
	lw	a6,8(a2)
	lw	a1,12(a2)
	beq	a6,zero,.L445
	lbu	a7,4(a6)
	beq	a7,a0,.L590
.L445:
	beq	a1,zero,.L423
	lbu	a0,4(a1)
	addi	a6, zero, 1
	bne	a0,a6,.L423
	lw	a7,8(a1)
	lw	a6,12(a1)
	sw	a7,12(a2)
	sw	a6,8(a4)
	sw	a2,8(a1)
	sw	a4,12(a1)
	sb	zero,4(a1)
	sb	a0,4(a4)
	sw	a1,8(a5)
	jal	zero, .L423
.L589:
	bne	a0,a6,.L423
	lw	a6,8(a2)
	beq	a6,zero,.L443
	lbu	a6,4(a6)
	beq	a6,a0,.L448
.L443:
	lw	a0,12(a2)
	beq	a0,zero,.L423
.L574:
	lbu	a6,4(a0)
	addi	a0, zero, 1
	bne	a6,a0,.L423
.L448:
	sb	zero,4(a2)
	sb	zero,4(a1)
	addi	a2, zero, 1
	sb	a2,4(a4)
	jal	zero, .L423
.L584:
	sw	a2,8(a5)
	sw	a0,8(a4)
	sw	a5,12(a4)
	sb	a1,4(a5)
	sb	zero,4(a4)
	sw	a4,0(a3)
	jal	zero, .L417
.L590:
	sw	a1,8(a4)
	sw	a6,8(a2)
	sw	a4,12(a2)
	sb	a0,4(a4)
	sb	zero,4(a2)
	sw	a2,8(a5)
	jal	zero, .L423
.L586:
	sw	a2,12(a5)
	sw	a0,12(a4)
	sw	a5,8(a4)
	sb	a1,4(a5)
	sb	zero,4(a4)
	sw	a4,0(a3)
	jal	zero, .L417
.L588:
	sw	a1,12(a4)
	sw	a6,12(a2)
	sw	a4,8(a2)
	sb	a0,4(a4)
	sb	zero,4(a2)
	sw	a2,8(a5)
	jal	zero, .L423
.L580:
	lw	a2,8(a4)
	lw	a1,8(a2)
	lw	a0,12(a2)
	lbu	a6,4(a1)
	beq	a0,zero,.L431
	lbu	a7,4(a0)
	addi	t1, zero, 1
	beq	a7,t1,.L591
.L431:
	addi	a0, zero, 1
	bne	a6,a0,.L427
	lw	a7,8(a1)
	lw	a0,12(a1)
	beq	a7,zero,.L435
	lbu	t1,4(a7)
	beq	t1,a6,.L592
.L435:
	beq	a0,zero,.L427
	lbu	a6,4(a0)
	addi	a7, zero, 1
	bne	a6,a7,.L427
	lw	t1,8(a0)
	lw	a7,12(a0)
	sw	t1,12(a1)
	sw	a7,8(a2)
	sw	a1,8(a0)
	sw	a2,12(a0)
	sb	zero,4(a0)
	sb	a6,4(a2)
	sw	a0,8(a4)
	jal	zero, .L427
.L592:
	sw	a0,8(a2)
	sw	a7,8(a1)
	sw	a2,12(a1)
	sb	a6,4(a2)
	sb	zero,4(a1)
	sw	a1,8(a4)
	jal	zero, .L427
.L429:
	addi	a0,a6,12
	sw	a3,12(sp)
	sw	a4,8(sp)
	sw	a5,4(sp)
	sw	a6,0(sp)
.Lpcrel_113:
	auipc	ra, %pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_113)
	lw	a6,0(sp)
	lw	a5,4(sp)
	lw	a4,8(sp)
	lbu	a2,4(a6)
	lw	a3,12(sp)
	bne	a2,zero,.L427
	lw	a2,8(a4)
	lw	a1,12(a2)
	lw	a0,8(a2)
	lbu	a6,4(a1)
	beq	a0,zero,.L436
	lbu	a7,4(a0)
	addi	t1, zero, 1
	beq	a7,t1,.L593
.L436:
	addi	a0, zero, 1
	bne	a6,a0,.L427
	lw	a7,12(a1)
	lw	a0,8(a1)
	beq	a7,zero,.L439
	lbu	t1,4(a7)
	beq	t1,a6,.L594
.L439:
	beq	a0,zero,.L427
	lbu	a6,4(a0)
	addi	a7, zero, 1
	bne	a6,a7,.L427
	lw	t1,12(a0)
	lw	a7,8(a0)
	sw	t1,8(a1)
	sw	a7,12(a2)
	sw	a1,12(a0)
	sw	a2,8(a0)
	sb	zero,4(a0)
	sb	a6,4(a2)
	sw	a0,8(a4)
	jal	zero, .L427
.L594:
	sw	a0,12(a2)
	sw	a7,12(a1)
	sw	a2,8(a1)
	sb	a6,4(a2)
	sb	zero,4(a1)
	sw	a1,8(a4)
	jal	zero, .L427
.L583:
	bne	a1,a0,.L417
	lw	a3,8(a4)
	beq	a3,zero,.L453
	lbu	a3,4(a3)
	beq	a3,a1,.L458
.L453:
	lw	a3,12(a4)
	beq	a3,zero,.L417
.L576:
	lbu	a1,4(a3)
	addi	a3, zero, 1
	bne	a1,a3,.L417
.L458:
	sb	zero,4(a4)
	sb	zero,4(a2)
	addi	a4, zero, 1
	sb	a4,4(a5)
	jal	zero, .L417
.L585:
	bne	a1,a0,.L417
	lw	a3,12(a4)
	beq	a3,zero,.L457
	lbu	a3,4(a3)
	beq	a3,a1,.L458
.L457:
	lw	a3,8(a4)
	bne	a3,zero,.L576
	jal	zero, .L417
.L591:
	bne	a6,a7,.L427
	lw	a7,8(a1)
	beq	a7,zero,.L433
	lbu	a7,4(a7)
	beq	a7,a6,.L438
.L433:
	lw	a6,12(a1)
	beq	a6,zero,.L427
.L572:
	lbu	a7,4(a6)
	addi	a6, zero, 1
	bne	a7,a6,.L427
.L438:
	sb	zero,4(a1)
	sb	zero,4(a0)
	addi	a1, zero, 1
	sb	a1,4(a2)
	jal	zero, .L427
.L587:
	bne	a0,a6,.L423
	lw	a6,12(a2)
	beq	a6,zero,.L447
	lbu	a6,4(a6)
	beq	a6,a0,.L448
.L447:
	lw	a0,8(a2)
	bne	a0,zero,.L574
	jal	zero, .L423
.L593:
	bne	a6,a7,.L427
	lw	a7,12(a1)
	beq	a7,zero,.L437
	lbu	a7,4(a7)
	beq	a7,a6,.L438
.L437:
	lw	a6,8(a1)
	bne	a6,zero,.L572
	jal	zero, .L427
	.size	sglib___rbtree_add_recursive.constprop.0, .-sglib___rbtree_add_recursive.constprop.0
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
	beq	a0,zero,.L603
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a1,%lo(heap_requested)(a3)
	add	a4,a0,a5
	andi	a6,a4,3
	add	a5,a5,a1
	bne	a6,zero,.L607
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a1,a4,.L603
.L608:
	sw	a4,%lo(heap_ptr)(a2)
	jalr	zero, ra, 0
.L607:
	addi	a1, zero, 4
	sub	a1,a1,a6
	add	a5,a5,a1
	add	a4,a4,a1
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a1,a4,.L608
.L603:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	malloc_beebs, .-malloc_beebs
	.align	2
	.globl	calloc_beebs
	.type	calloc_beebs, @function
calloc_beebs:
	mul	a1,a0,a1
	beq	a1,zero,.L610
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a0,a1
	andi	a6,a4,3
	add	a5,a1,a5
	bne	a6,zero,.L635
.L611:
	lui	a6,%hi(heap_end)
	lw	a6,%lo(heap_end)(a6)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a6,a4,.L610
	sw	a4,%lo(heap_ptr)(a2)
	beq	a0,zero,.L610
	addi	a5,a1,-1
	addi	a4, zero, 5
	bgeu	a4, a5, .L619
	sub	a4, zero, a0
	andi	a5,a4,3
	addi	a3, zero, 0
	beq	a5,zero,.L613
	sb	zero,0(a0)
	andi	a4,a4,2
	addi	a3, zero, 1
	beq	a4,zero,.L613
	sb	zero,1(a0)
	addi	a4, zero, 3
	addi	a3, zero, 2
	bne	a5,a4,.L613
	sb	zero,2(a0)
	addi	a3, a5, 0
.L613:
	sub	a6,a1,a5
	andi	a2,a6,-4
	add	a5,a0,a5
	add	a4,a5,a2
.L615:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L615
	add	a5,a3,a2
	beq	a6,a2,.L609
.L612:
	add	a4,a0,a5
	sb	zero,0(a4)
	addi	a4,a5,1
	bgeu	a4, a1, .L609
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,2
	bgeu	a4, a1, .L609
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,3
	bgeu	a4, a1, .L609
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,4
	bgeu	a4, a1, .L609
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a5,a5,5
	bgeu	a5, a1, .L609
	add	a5,a0,a5
	sb	zero,0(a5)
	jalr	zero, ra, 0
.L610:
	addi	a0, zero, 0
.L609:
	jalr	zero, ra, 0
.L635:
	addi	a7, zero, 4
	sub	a6,a7,a6
	add	a4,a4,a6
	add	a5,a5,a6
	jal	zero, .L611
.L619:
	addi	a5, zero, 0
	jal	zero, .L612
	.size	calloc_beebs, .-calloc_beebs
	.align	2
	.globl	realloc_beebs
	.type	realloc_beebs, @function
realloc_beebs:
	beq	a0,zero,.L637
	beq	a1,zero,.L637
	lui	a6,%hi(heap_ptr)
	lw	a2,%lo(heap_ptr)(a6)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a2,a1
	andi	a7,a4,3
	add	a5,a1,a5
	bne	a7,zero,.L662
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a7,a4,.L637
.L663:
	sw	a4,%lo(heap_ptr)(a6)
	beq	a2,zero,.L637
	addi	a5,a1,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L647
	or	a3,a0,a2
	andi	a3,a3,3
	addi	a4, a2, 0
	addi	a5, a0, 0
	bne	a3,zero,.L647
	addi	a3,a2,-1
	sub	a3,a3,a0
	sltiu	a3,a3,3
	bne	a3,zero,.L647
	andi	a7,a1,-4
	add	a6,a0,a7
.L640:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L640
	beq	a1,a7,.L636
	lbu	a3,0(a6)
	add	a4,a2,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a1, .L636
	add	a4,a0,a5
	lbu	a4,0(a4)
	add	a5,a2,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a1, .L636
	add	a0,a0,a7
	lbu	a5,0(a0)
	add	a7,a2,a7
	sb	a5,0(a7)
.L636:
	addi	a0, a2, 0
	jalr	zero, ra, 0
.L662:
	addi	t1, zero, 4
	sub	a7,t1,a7
	add	a5,a5,a7
	add	a4,a4,a7
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a7,a4,.L663
.L637:
	addi	a2, zero, 0
	addi	a0, a2, 0
	jalr	zero, ra, 0
.L647:
	addi	a5, zero, 0
.L644:
	add	a4,a0,a5
	lbu	a3,0(a4)
	add	a4,a2,a5
	addi	a5,a5,1
	sb	a3,0(a4)
	bltu	a5, a1, .L644
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
	.globl	memset
	.type	memset, @function
memset:
	beq	a2,zero,.L678
	addi	a5,a2,-1
	addi	a4, zero, 5
	andi	a1,a1,0xff
	bgeu	a4, a5, .L674
	sub	a4, zero, a0
	andi	a5,a4,3
	addi	a6, zero, 0
	beq	a5,zero,.L668
	sb	a1,0(a0)
	andi	a4,a4,2
	addi	a6, zero, 1
	beq	a4,zero,.L668
	sb	a1,1(a0)
	addi	a4, zero, 3
	addi	a6, zero, 2
	bne	a5,a4,.L668
	sb	a1,2(a0)
	addi	a6, a5, 0
.L668:
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
.L670:
	sw	a4,0(a5)
	addi	a5,a5,4
	bne	a5,a3,.L670
	add	a5,a6,a7
	beq	t1,a7,.L678
.L667:
	add	a4,a0,a5
	sb	a1,0(a4)
	addi	a4,a5,1
	bgeu	a4, a2, .L678
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,2
	bgeu	a4, a2, .L678
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,3
	bgeu	a4, a2, .L678
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,4
	bgeu	a4, a2, .L678
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a5,a5,5
	bgeu	a5, a2, .L678
	add	a5,a0,a5
	sb	a1,0(a5)
.L678:
	jalr	zero, ra, 0
.L674:
	addi	a5, zero, 0
	jal	zero, .L667
	.size	memset, .-memset
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	beq	a2,zero,.L683
	addi	a5,a2,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L684
	or	a3,a0,a1
	andi	a3,a3,3
	addi	a4, a0, 0
	addi	a5, a1, 0
	bne	a3,zero,.L684
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L684
	andi	a7,a2,-4
	add	a6,a1,a7
.L685:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L685
	beq	a2,a7,.L683
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a2, .L683
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a2, .L683
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	jalr	zero, ra, 0
.L684:
	add	a2,a1,a2
	addi	a5, a0, 0
.L687:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L687
.L683:
	jalr	zero, ra, 0
	.size	memcpy, .-memcpy
	.align	2
	.globl	memcmp
	.type	memcmp, @function
memcmp:
	beq	a2,zero,.L704
	add	a2,a0,a2
	jal	zero, .L703
.L702:
	beq	a0,a2,.L704
.L703:
	lbu	a5,0(a0)
	lbu	a4,0(a1)
	addi	a0,a0,1
	addi	a1,a1,1
	beq	a5,a4,.L702
	sub	a0,a5,a4
	jalr	zero, ra, 0
.L704:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	memcmp, .-memcmp
	.align	2
	.globl	memmove
	.type	memmove, @function
memmove:
	bgeu	a0,a1,.L707
	beq	a2,zero,.L708
	addi	a5,a2,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L709
	or	a3,a1,a0
	andi	a3,a3,3
	addi	a4, a0, 0
	addi	a5, a1, 0
	bne	a3,zero,.L709
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L709
	andi	a7,a2,-4
	add	a6,a1,a7
.L710:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L710
	beq	a2,a7,.L708
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a2, .L708
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a2, .L708
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	jalr	zero, ra, 0
.L707:
	bltu	a1, a0, .L730
.L708:
	jalr	zero, ra, 0
.L730:
	beq	a2,zero,.L708
	addi	a2,a2,-1
	add	a5,a1,a2
	lbu	a4,0(a5)
	add	a5,a0,a2
	sb	a4,0(a5)
	jal	zero, .L730
.L709:
	add	a2,a1,a2
	addi	a5, a0, 0
.L712:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L712
	jalr	zero, ra, 0
	.size	memmove, .-memmove
	.align	2
	.globl	strlen
	.type	strlen, @function
strlen:
	lbu	a5,0(a0)
	beq	a5,zero,.L731
	addi	a5, zero, 0
.L733:
	addi	a5,a5,1
	add	a4,a0,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L733
.L731:
	addi	a0, a5, 0
	jalr	zero, ra, 0
	.size	strlen, .-strlen
	.align	2
	.globl	strchr
	.type	strchr, @function
strchr:
	lbu	a5,0(a0)
	beq	a5,zero,.L737
	andi	a4,a1,0xff
.L739:
	beq	a4,a5,.L736
	lbu	a5,1(a0)
	addi	a0,a0,1
	bne	a5,zero,.L739
.L737:
	sltiu	a1, a1, 1
	sub	a1, zero, a1
	and	a0,a0,a1
.L736:
	jalr	zero, ra, 0
	.size	strchr, .-strchr
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
	.globl	sglib_dllist_add
	.type	sglib_dllist_add, @function
sglib_dllist_add:
	lw	a5,0(a0)
	beq	a5,zero,.L753
	lw	a4,8(a5)
	sw	a5,4(a1)
	sw	a4,8(a1)
	lw	a5,0(a0)
	sw	a1,8(a5)
	lw	a5,8(a1)
	beq	a5,zero,.L747
	sw	a1,4(a5)
.L747:
	jalr	zero, ra, 0
.L753:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	jalr	zero, ra, 0
	.size	sglib_dllist_add, .-sglib_dllist_add
	.align	2
	.globl	sglib_dllist_add_after
	.type	sglib_dllist_add_after, @function
sglib_dllist_add_after:
	lw	a5,0(a0)
	beq	a5,zero,.L760
	lw	a5,4(a5)
	sw	a5,4(a1)
	lw	a5,0(a0)
	sw	a5,8(a1)
	sw	a1,4(a5)
	lw	a5,4(a1)
	beq	a5,zero,.L754
	sw	a1,8(a5)
.L754:
	jalr	zero, ra, 0
.L760:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	jalr	zero, ra, 0
	.size	sglib_dllist_add_after, .-sglib_dllist_add_after
	.align	2
	.globl	sglib_dllist_add_before
	.type	sglib_dllist_add_before, @function
sglib_dllist_add_before:
	lw	a5,0(a0)
	beq	a5,zero,.L767
	lw	a4,8(a5)
	sw	a5,4(a1)
	sw	a4,8(a1)
	lw	a5,0(a0)
	sw	a1,8(a5)
	lw	a5,8(a1)
	beq	a5,zero,.L761
	sw	a1,4(a5)
.L761:
	jalr	zero, ra, 0
.L767:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	jalr	zero, ra, 0
	.size	sglib_dllist_add_before, .-sglib_dllist_add_before
	.align	2
	.globl	sglib_dllist_add_if_not_member
	.type	sglib_dllist_add_if_not_member, @function
sglib_dllist_add_if_not_member:
	lw	a6,0(a0)
	beq	a6,zero,.L769
	lw	a3,0(a1)
	addi	a5, a6, 0
	jal	zero, .L770
.L772:
	lw	a5,8(a5)
	beq	a5,zero,.L771
.L770:
	lw	a4,0(a5)
	bne	a4,a3,.L772
	sw	a5,0(a2)
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L771:
	lw	a5,4(a6)
	bne	a5,zero,.L780
	jal	zero, .L769
.L774:
	lw	a5,4(a5)
	beq	a5,zero,.L769
.L780:
	lw	a4,0(a5)
	bne	a3,a4,.L774
	sw	a5,0(a2)
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L769:
	sw	zero,0(a2)
	lw	a5,0(a0)
	beq	a5,zero,.L791
	lw	a4,8(a5)
	sw	a5,4(a1)
	sw	a4,8(a1)
	lw	a5,0(a0)
	sw	a1,8(a5)
	lw	a5,8(a1)
	beq	a5,zero,.L790
	sw	a1,4(a5)
.L790:
	lw	a0,0(a2)
	sltiu	a0, a0, 1
	jalr	zero, ra, 0
.L791:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	lw	a0,0(a2)
	sltiu	a0, a0, 1
	jalr	zero, ra, 0
	.size	sglib_dllist_add_if_not_member, .-sglib_dllist_add_if_not_member
	.align	2
	.globl	sglib_dllist_add_after_if_not_member
	.type	sglib_dllist_add_after_if_not_member, @function
sglib_dllist_add_after_if_not_member:
	lw	a6,0(a0)
	beq	a6,zero,.L793
	lw	a3,0(a1)
	addi	a5, a6, 0
	jal	zero, .L794
.L796:
	lw	a5,8(a5)
	beq	a5,zero,.L795
.L794:
	lw	a4,0(a5)
	bne	a4,a3,.L796
	sw	a5,0(a2)
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L795:
	lw	a5,4(a6)
	bne	a5,zero,.L804
	jal	zero, .L793
.L798:
	lw	a5,4(a5)
	beq	a5,zero,.L793
.L804:
	lw	a4,0(a5)
	bne	a3,a4,.L798
	sw	a5,0(a2)
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L793:
	sw	zero,0(a2)
	lw	a5,0(a0)
	beq	a5,zero,.L815
	lw	a5,4(a5)
	sw	a5,4(a1)
	lw	a5,0(a0)
	sw	a5,8(a1)
	sw	a1,4(a5)
	lw	a5,4(a1)
	beq	a5,zero,.L814
	sw	a1,8(a5)
.L814:
	lw	a0,0(a2)
	sltiu	a0, a0, 1
	jalr	zero, ra, 0
.L815:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	lw	a0,0(a2)
	sltiu	a0, a0, 1
	jalr	zero, ra, 0
	.size	sglib_dllist_add_after_if_not_member, .-sglib_dllist_add_after_if_not_member
	.align	2
	.globl	sglib_dllist_add_before_if_not_member
	.type	sglib_dllist_add_before_if_not_member, @function
sglib_dllist_add_before_if_not_member:
	lw	a6,0(a0)
	beq	a6,zero,.L817
	lw	a3,0(a1)
	addi	a5, a6, 0
	jal	zero, .L818
.L820:
	lw	a5,8(a5)
	beq	a5,zero,.L819
.L818:
	lw	a4,0(a5)
	bne	a4,a3,.L820
	sw	a5,0(a2)
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L819:
	lw	a5,4(a6)
	bne	a5,zero,.L828
	jal	zero, .L817
.L822:
	lw	a5,4(a5)
	beq	a5,zero,.L817
.L828:
	lw	a4,0(a5)
	bne	a3,a4,.L822
	sw	a5,0(a2)
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L817:
	sw	zero,0(a2)
	lw	a5,0(a0)
	beq	a5,zero,.L839
	lw	a4,8(a5)
	sw	a5,4(a1)
	sw	a4,8(a1)
	lw	a5,0(a0)
	sw	a1,8(a5)
	lw	a5,8(a1)
	beq	a5,zero,.L838
	sw	a1,4(a5)
.L838:
	lw	a0,0(a2)
	sltiu	a0, a0, 1
	jalr	zero, ra, 0
.L839:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	lw	a0,0(a2)
	sltiu	a0, a0, 1
	jalr	zero, ra, 0
	.size	sglib_dllist_add_before_if_not_member, .-sglib_dllist_add_before_if_not_member
	.align	2
	.globl	sglib_dllist_concat
	.type	sglib_dllist_concat, @function
sglib_dllist_concat:
	lw	a5,0(a0)
	beq	a5,zero,.L850
	beq	a1,zero,.L840
.L843:
	addi	a4, a5, 0
	lw	a5,4(a5)
	bne	a5,zero,.L843
	sw	zero,4(a1)
	sw	a4,8(a1)
	sw	a1,4(a4)
	lw	a5,4(a1)
	beq	a5,zero,.L840
	sw	a1,8(a5)
.L840:
	jalr	zero, ra, 0
.L850:
	sw	a1,0(a0)
	jalr	zero, ra, 0
	.size	sglib_dllist_concat, .-sglib_dllist_concat
	.align	2
	.globl	sglib_dllist_delete
	.type	sglib_dllist_delete, @function
sglib_dllist_delete:
	lw	a3,0(a0)
	lw	a5,8(a1)
	lw	a4,4(a1)
	beq	a3,a1,.L868
	beq	a4,zero,.L856
.L854:
	sw	a5,8(a4)
	lw	a5,8(a1)
.L856:
	beq	a5,zero,.L855
.L857:
	sw	a4,4(a5)
.L855:
	sw	a3,0(a0)
	jalr	zero, ra, 0
.L868:
	beq	a5,zero,.L869
	addi	a3, a5, 0
	beq	a4,zero,.L857
	sw	a5,8(a4)
	lw	a5,8(a1)
	jal	zero, .L856
.L869:
	addi	a3, a4, 0
	bne	a4,zero,.L854
	jal	zero, .L855
	.size	sglib_dllist_delete, .-sglib_dllist_delete
	.align	2
	.globl	sglib_dllist_delete_if_member
	.type	sglib_dllist_delete_if_member, @function
sglib_dllist_delete_if_member:
	lw	a6,0(a0)
	beq	a6,zero,.L877
	lw	a3,0(a1)
	addi	a5, a6, 0
	jal	zero, .L872
.L875:
	lw	a5,8(a5)
	beq	a5,zero,.L874
.L872:
	lw	a4,0(a5)
	bne	a4,a3,.L875
.L876:
	sw	a5,0(a2)
	lw	a1,0(a0)
	lw	a4,8(a5)
	lw	a3,4(a5)
	beq	a1,a5,.L900
	beq	a3,zero,.L883
.L881:
	sw	a4,8(a3)
	lw	a4,8(a5)
.L883:
	beq	a4,zero,.L882
.L884:
	sw	a3,4(a4)
.L882:
	sw	a1,0(a0)
	lw	a0,0(a2)
	sltu	a0, zero, a0
	jalr	zero, ra, 0
.L900:
	beq	a4,zero,.L901
	addi	a1, a4, 0
	beq	a3,zero,.L884
	sw	a4,8(a3)
	lw	a4,8(a5)
	jal	zero, .L883
.L874:
	lw	a5,4(a6)
	bne	a5,zero,.L886
	jal	zero, .L877
.L878:
	lw	a5,4(a5)
	beq	a5,zero,.L877
.L886:
	lw	a4,0(a5)
	bne	a3,a4,.L878
	jal	zero, .L876
.L901:
	addi	a1, a3, 0
	bne	a3,zero,.L881
	jal	zero, .L882
.L877:
	sw	zero,0(a2)
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	sglib_dllist_delete_if_member, .-sglib_dllist_delete_if_member
	.align	2
	.globl	sglib_dllist_is_member
	.type	sglib_dllist_is_member, @function
sglib_dllist_is_member:
	addi	a5, a0, 0
	beq	a0,a1,.L912
	beq	a0,zero,.L912
.L904:
	lw	a5,8(a5)
	sltu	a4, zero, a5
	beq	a1,a5,.L903
	bne	a4,zero,.L904
.L903:
	bne	a5,zero,.L913
	beq	a0,zero,.L913
	lw	a5,4(a0)
	sltu	a0, zero, a5
	beq	a1,a5,.L902
.L937:
	beq	a0,zero,.L902
	lw	a5,4(a5)
	sltu	a0, zero, a5
	bne	a1,a5,.L937
.L902:
	jalr	zero, ra, 0
.L913:
	addi	a0, a4, 0
	jalr	zero, ra, 0
.L912:
	sltu	a4, zero, a0
	jal	zero, .L903
	.size	sglib_dllist_is_member, .-sglib_dllist_is_member
	.align	2
	.globl	sglib_dllist_find_member
	.type	sglib_dllist_find_member, @function
sglib_dllist_find_member:
	beq	a0,zero,.L945
	lw	a3,0(a1)
	addi	a5, a0, 0
	jal	zero, .L940
.L942:
	lw	a5,8(a5)
	beq	a5,zero,.L941
.L940:
	lw	a4,0(a5)
	bne	a4,a3,.L942
.L938:
	addi	a0, a5, 0
	jalr	zero, ra, 0
.L941:
	lw	a5,4(a0)
	beq	a5,zero,.L938
	lw	a4,0(a5)
	beq	a3,a4,.L938
.L943:
	lw	a5,4(a5)
	beq	a5,zero,.L938
	lw	a4,0(a5)
	bne	a3,a4,.L943
	addi	a0, a5, 0
	jalr	zero, ra, 0
.L945:
	addi	a5, zero, 0
	jal	zero, .L938
	.size	sglib_dllist_find_member, .-sglib_dllist_find_member
	.align	2
	.globl	sglib_dllist_get_first
	.type	sglib_dllist_get_first, @function
sglib_dllist_get_first:
	addi	a5, a0, 0
	beq	a0,zero,.L954
.L953:
	addi	a0, a5, 0
	lw	a5,8(a5)
	bne	a5,zero,.L953
	jalr	zero, ra, 0
.L954:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	sglib_dllist_get_first, .-sglib_dllist_get_first
	.align	2
	.globl	sglib_dllist_get_last
	.type	sglib_dllist_get_last, @function
sglib_dllist_get_last:
	addi	a5, a0, 0
	beq	a0,zero,.L959
.L958:
	addi	a0, a5, 0
	lw	a5,4(a5)
	bne	a5,zero,.L958
	jalr	zero, ra, 0
.L959:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	sglib_dllist_get_last, .-sglib_dllist_get_last
	.align	2
	.globl	sglib_dllist_sort
	.type	sglib_dllist_sort, @function
sglib_dllist_sort:
	lw	a5,0(a0)
	beq	a5,zero,.L1021
	addi	sp,sp,-16
.L963:
	addi	a1, a5, 0
	lw	a5,8(a5)
	bne	a5,zero,.L963
	addi	a6, zero, 1
	addi	t3, a6, 0
.L985:
	sw	zero,12(sp)
	addi	t1, zero, 0
	addi	a3,sp,12
.L964:
	addi	a4, a1, 0
	addi	a2, zero, 1
	bge	t3, a6, .L1024
.L965:
	lw	a4,4(a4)
	addi	a2,a2,1
	slt	a5,a2,a6
	sltu	a7, zero, a4
	and	a5,a5,a7
	bne	a5,zero,.L965
	beq	a4,zero,.L1025
	lw	a5,4(a4)
	sw	zero,4(a4)
	beq	a5,zero,.L992
	addi	a4, a5, 0
	addi	a2, zero, 1
.L970:
	addi	a2,a2,1
	lw	a4,4(a4)
	bge	a2,a6,.L972
	bne	a4,zero,.L970
.L972:
	addi	a7, zero, 0
	beq	a4,zero,.L974
	lw	a7,4(a4)
	sw	zero,4(a4)
.L974:
	lw	a2,0(a1)
.L1023:
	lw	a4,0(a5)
.L980:
	blt	a2,a4,.L1026
	sw	a5,0(a3)
	addi	a3,a5,4
	lw	a5,4(a5)
	bne	a5,zero,.L1023
.L975:
	sw	a1,0(a3)
	addi	a5, a1, 0
	addi	a1, a7, 0
.L981:
	addi	a3, a5, 0
	lw	a5,4(a5)
	bne	a5,zero,.L981
	addi	a3,a3,4
	addi	t1, zero, 1
	bne	a7,zero,.L964
	lw	a1,12(sp)
	slli	a6,a6,1
	bne	a1,zero,.L985
.L984:
	sw	a1,0(a0)
	addi	sp,sp,16
	jalr	zero, ra, 0
.L1026:
	sw	a1,0(a3)
	lw	a2,4(a1)
	addi	a3,a1,4
	beq	a2,zero,.L1027
	addi	a1, a2, 0
	lw	a2,0(a2)
	jal	zero, .L980
.L1027:
	sw	a5,4(a1)
	addi	a1, a7, 0
	jal	zero, .L981
.L1024:
	lw	a4,4(a1)
	sw	zero,4(a1)
	addi	a5, a4, 0
	beq	a4,zero,.L1028
	lw	a7,4(a4)
	sw	zero,4(a4)
	beq	a4,zero,.L975
	lw	a2,0(a1)
	jal	zero, .L1023
.L1025:
	sw	a1,0(a3)
	lw	a1,12(sp)
	beq	t1,zero,.L1029
	slli	a6,a6,1
	bne	a1,zero,.L985
	jal	zero, .L984
.L1028:
	bne	a4,zero,.L1030
.L992:
	addi	a7, zero, 0
	jal	zero, .L975
.L1029:
	beq	a1,zero,.L984
	addi	a5, a1, 0
.L988:
	sw	a4,8(a5)
	addi	a4, a5, 0
	lw	a5,4(a5)
	bne	a5,zero,.L988
	sw	a1,0(a0)
	addi	sp,sp,16
	jalr	zero, ra, 0
.L1021:
	jalr	zero, ra, 0
.L1030:
	lw	a2,0(a1)
	addi	a7, zero, 0
	jal	zero, .L1023
	.size	sglib_dllist_sort, .-sglib_dllist_sort
	.align	2
	.globl	sglib_dllist_len
	.type	sglib_dllist_len, @function
sglib_dllist_len:
	addi	a4, zero, 0
	beq	a0,zero,.L1031
	addi	a5, a0, 0
	addi	a4, zero, 0
.L1033:
	lw	a5,8(a5)
	addi	a4,a4,1
	bne	a5,zero,.L1033
	lw	a5,4(a0)
	beq	a5,zero,.L1031
	addi	a3, zero, 0
.L1035:
	lw	a5,4(a5)
	addi	a3,a3,1
	bne	a5,zero,.L1035
	add	a4,a4,a3
.L1031:
	addi	a0, a4, 0
	jalr	zero, ra, 0
	.size	sglib_dllist_len, .-sglib_dllist_len
	.align	2
	.globl	sglib_dllist_reverse
	.type	sglib_dllist_reverse, @function
sglib_dllist_reverse:
	lw	a3,0(a0)
	beq	a3,zero,.L1042
	lw	a4,4(a3)
	lw	a5,8(a3)
	sw	a4,8(a3)
	sw	a5,4(a3)
	beq	a5,zero,.L1056
.L1045:
	lw	a2,4(a5)
	addi	a3, a5, 0
	lw	a5,8(a5)
	sw	a2,8(a3)
	sw	a5,4(a3)
	bne	a5,zero,.L1045
.L1056:
	beq	a4,zero,.L1042
.L1047:
	lw	a3,8(a4)
	addi	a5, a4, 0
	lw	a4,4(a4)
	sw	a3,4(a5)
	sw	a4,8(a5)
	bne	a4,zero,.L1047
.L1042:
	jalr	zero, ra, 0
	.size	sglib_dllist_reverse, .-sglib_dllist_reverse
	.align	2
	.globl	sglib_dllist_it_current
	.type	sglib_dllist_it_current, @function
sglib_dllist_it_current:
	lw	a0,0(a0)
	jalr	zero, ra, 0
	.size	sglib_dllist_it_current, .-sglib_dllist_it_current
	.align	2
	.globl	sglib_dllist_it_next
	.type	sglib_dllist_it_next, @function
sglib_dllist_it_next:
	addi	sp,sp,-32
	sw	s1,20(sp)
	lw	s1,12(a0)
	sw	s0,24(sp)
	sw	s2,16(sp)
	sw	ra,28(sp)
	lw	s0,4(a0)
	sw	zero,4(a0)
	addi	s2, a0, 0
	beq	s1,zero,.L1059
	sw	s3,12(sp)
	beq	s0,zero,.L1085
	lw	s3,16(a0)
	jal	zero, .L1062
.L1064:
	lw	s0,8(s0)
	beq	s0,zero,.L1063
.L1062:
	addi	a1, s0, 0
	addi	a0, s3, 0
	jalr	s1
	bne	a0,zero,.L1064
	lw	s3,12(sp)
.L1072:
	lw	a5,8(s0)
	sw	a5,4(s2)
.L1065:
	sw	s0,0(s2)
	lw	ra,28(sp)
	addi	a0, s0, 0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L1059:
	bne	s0,zero,.L1072
	lw	s0,8(s2)
	sw	zero,8(s2)
	bne	s0,zero,.L1069
	jal	zero, .L1065
.L1063:
	lw	s1,12(s2)
	lw	s0,8(s2)
	sw	zero,8(s2)
	beq	s1,zero,.L1086
	beq	s0,zero,.L1084
.L1087:
	lw	s3,16(s2)
	jal	zero, .L1066
.L1068:
	lw	s0,4(s0)
	beq	s0,zero,.L1084
.L1066:
	addi	a1, s3, 0
	addi	a0, s0, 0
	jalr	s1
	bne	a0,zero,.L1068
	lw	s3,12(sp)
.L1069:
	lw	a5,4(s0)
	lw	ra,28(sp)
	sw	s0,0(s2)
	addi	a0, s0, 0
	lw	s0,24(sp)
	sw	a5,8(s2)
	lw	s1,20(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L1086:
	lw	s3,12(sp)
	bne	s0,zero,.L1069
	jal	zero, .L1065
.L1084:
	lw	s3,12(sp)
	lw	ra,28(sp)
	sw	s0,0(s2)
	addi	a0, s0, 0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L1085:
	lw	s0,8(a0)
	sw	zero,8(a0)
	bne	s0,zero,.L1087
	jal	zero, .L1084
	.size	sglib_dllist_it_next, .-sglib_dllist_it_next
	.align	2
	.globl	sglib_dllist_it_init_on_equal
	.type	sglib_dllist_it_init_on_equal, @function
sglib_dllist_it_init_on_equal:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	a1,4(a0)
	sw	a1,8(a0)
	sw	a2,12(a0)
	sw	a3,16(a0)
	beq	a1,zero,.L1089
	lw	a5,4(a1)
	sw	a5,8(a0)
.L1089:
.Lpcrel_114:
	auipc	ra, %pcrel_hi(sglib_dllist_it_next)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_114)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	sglib_dllist_it_init_on_equal, .-sglib_dllist_it_init_on_equal
	.align	2
	.globl	sglib_dllist_it_init
	.type	sglib_dllist_it_init, @function
sglib_dllist_it_init:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	zero,12(a0)
	sw	zero,16(a0)
	sw	a1,4(a0)
	sw	a1,8(a0)
	beq	a1,zero,.L1095
	lw	a5,4(a1)
	sw	a5,8(a0)
.L1095:
.Lpcrel_115:
	auipc	ra, %pcrel_hi(sglib_dllist_it_next)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_115)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	sglib_dllist_it_init, .-sglib_dllist_it_init
	.align	2
	.globl	ilist_hash_function
	.type	ilist_hash_function, @function
ilist_hash_function:
	lw	a0,0(a0)
	jalr	zero, ra, 0
	.size	ilist_hash_function, .-ilist_hash_function
	.align	2
	.globl	sglib_ilist_is_member
	.type	sglib_ilist_is_member, @function
sglib_ilist_is_member:
	addi	a5, a0, 0
	sltu	a0, zero, a0
	beq	a5,a1,.L1102
.L1115:
	beq	a0,zero,.L1102
	lw	a5,4(a5)
	sltu	a0, zero, a5
	bne	a1,a5,.L1115
.L1102:
	jalr	zero, ra, 0
	.size	sglib_ilist_is_member, .-sglib_ilist_is_member
	.align	2
	.globl	sglib_ilist_find_member
	.type	sglib_ilist_find_member, @function
sglib_ilist_find_member:
	beq	a0,zero,.L1116
	lw	a4,0(a1)
	jal	zero, .L1118
.L1119:
	lw	a0,4(a0)
	beq	a0,zero,.L1116
.L1118:
	lw	a5,0(a0)
	bne	a5,a4,.L1119
.L1116:
	jalr	zero, ra, 0
	.size	sglib_ilist_find_member, .-sglib_ilist_find_member
	.align	2
	.globl	sglib_ilist_add_if_not_member
	.type	sglib_ilist_add_if_not_member, @function
sglib_ilist_add_if_not_member:
	lw	a5,0(a0)
	beq	a5,zero,.L1125
	lw	a3,0(a1)
	jal	zero, .L1126
.L1127:
	lw	a5,4(a5)
	beq	a5,zero,.L1125
.L1126:
	lw	a4,0(a5)
	bne	a4,a3,.L1127
	sw	a5,0(a2)
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L1125:
	sw	zero,0(a2)
	lw	a5,0(a0)
	sw	a5,4(a1)
	sw	a1,0(a0)
	lw	a0,0(a2)
	sltiu	a0, a0, 1
	jalr	zero, ra, 0
	.size	sglib_ilist_add_if_not_member, .-sglib_ilist_add_if_not_member
	.align	2
	.globl	sglib_ilist_add
	.type	sglib_ilist_add, @function
sglib_ilist_add:
	lw	a5,0(a0)
	sw	a5,4(a1)
	sw	a1,0(a0)
	jalr	zero, ra, 0
	.size	sglib_ilist_add, .-sglib_ilist_add
	.align	2
	.globl	sglib_ilist_concat
	.type	sglib_ilist_concat, @function
sglib_ilist_concat:
	lw	a5,0(a0)
	beq	a5,zero,.L1143
.L1139:
	addi	a4, a5, 0
	lw	a5,4(a5)
	bne	a5,zero,.L1139
	sw	a1,4(a4)
	jalr	zero, ra, 0
.L1143:
	sw	a1,0(a0)
	jalr	zero, ra, 0
	.size	sglib_ilist_concat, .-sglib_ilist_concat
	.align	2
	.globl	sglib_ilist_delete
	.type	sglib_ilist_delete, @function
sglib_ilist_delete:
	lw	a5,0(a0)
	beq	a5,zero,.L1146
.L1145:
	beq	a1,a5,.L1153
	addi	a0,a5,4
	lw	a5,4(a5)
	bne	a5,zero,.L1145
.L1146:
	lw	a5,4(zero)
	ebreak
.L1153:
	lw	a5,4(a1)
	sw	a5,0(a0)
	jalr	zero, ra, 0
	.size	sglib_ilist_delete, .-sglib_ilist_delete
	.align	2
	.globl	sglib_ilist_delete_if_member
	.type	sglib_ilist_delete_if_member, @function
sglib_ilist_delete_if_member:
	lw	a5,0(a0)
	beq	a5,zero,.L1158
	lw	a3,0(a1)
	jal	zero, .L1156
.L1159:
	addi	a0,a5,4
	lw	a5,4(a5)
	beq	a5,zero,.L1158
.L1156:
	lw	a4,0(a5)
	bne	a4,a3,.L1159
	sw	a5,0(a2)
	lw	a5,4(a5)
	sw	a5,0(a0)
	lw	a0,0(a2)
	sltu	a0, zero, a0
	jalr	zero, ra, 0
.L1158:
	sw	zero,0(a2)
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	sglib_ilist_delete_if_member, .-sglib_ilist_delete_if_member
	.align	2
	.globl	sglib_ilist_sort
	.type	sglib_ilist_sort, @function
sglib_ilist_sort:
	lw	a1,0(a0)
	addi	a6, zero, 1
	addi	sp,sp,-16
	addi	t3, a6, 0
.L1184:
	sw	zero,12(sp)
	beq	a1,zero,.L1165
.L1187:
	addi	t1, zero, 0
	addi	a3,sp,12
.L1164:
	addi	a4, a1, 0
	addi	a2, zero, 1
	bge	t3, a6, .L1210
.L1166:
	lw	a4,4(a4)
	addi	a2,a2,1
	slt	a5,a2,a6
	sltu	a7, zero, a4
	and	a5,a5,a7
	bne	a5,zero,.L1166
	beq	a4,zero,.L1211
	lw	a5,4(a4)
	sw	zero,4(a4)
	beq	a5,zero,.L1189
	addi	a4, a5, 0
	addi	a2, zero, 1
.L1170:
	addi	a2,a2,1
	lw	a4,4(a4)
	bge	a2,a6,.L1172
	bne	a4,zero,.L1170
.L1172:
	addi	a7, zero, 0
	beq	a4,zero,.L1174
	lw	a7,4(a4)
	sw	zero,4(a4)
.L1174:
	lw	a2,0(a1)
.L1209:
	lw	a4,0(a5)
.L1180:
	blt	a2,a4,.L1212
	sw	a5,0(a3)
	addi	a3,a5,4
	lw	a5,4(a5)
	bne	a5,zero,.L1209
.L1175:
	sw	a1,0(a3)
	addi	a5, a1, 0
	addi	a1, a7, 0
.L1181:
	addi	a3, a5, 0
	lw	a5,4(a5)
	bne	a5,zero,.L1181
	addi	a3,a3,4
	addi	t1, zero, 1
	bne	a7,zero,.L1164
	lw	a1,12(sp)
	sw	zero,12(sp)
	slli	a6,a6,1
	bne	a1,zero,.L1187
.L1165:
	sw	a1,0(a0)
	addi	sp,sp,16
	jalr	zero, ra, 0
.L1212:
	sw	a1,0(a3)
	lw	a2,4(a1)
	addi	a3,a1,4
	beq	a2,zero,.L1213
	addi	a1, a2, 0
	lw	a2,0(a2)
	jal	zero, .L1180
.L1213:
	sw	a5,4(a1)
	addi	a1, a7, 0
	jal	zero, .L1181
.L1210:
	lw	a4,4(a1)
	sw	zero,4(a1)
	addi	a5, a4, 0
	beq	a4,zero,.L1214
	lw	a7,4(a4)
	sw	zero,4(a4)
	beq	a4,zero,.L1175
	lw	a2,0(a1)
	jal	zero, .L1209
.L1211:
	sw	a1,0(a3)
	lw	a1,12(sp)
	beq	t1,zero,.L1165
	slli	a6,a6,1
	jal	zero, .L1184
.L1214:
	bne	a4,zero,.L1215
.L1189:
	addi	a7, zero, 0
	jal	zero, .L1175
.L1215:
	lw	a2,0(a1)
	addi	a7, zero, 0
	jal	zero, .L1209
	.size	sglib_ilist_sort, .-sglib_ilist_sort
	.align	2
	.globl	sglib_ilist_len
	.type	sglib_ilist_len, @function
sglib_ilist_len:
	addi	a5, a0, 0
	addi	a0, zero, 0
	beq	a5,zero,.L1219
.L1218:
	lw	a5,4(a5)
	addi	a0,a0,1
	bne	a5,zero,.L1218
	jalr	zero, ra, 0
.L1219:
	jalr	zero, ra, 0
	.size	sglib_ilist_len, .-sglib_ilist_len
	.align	2
	.globl	sglib_ilist_reverse
	.type	sglib_ilist_reverse, @function
sglib_ilist_reverse:
	lw	a5,0(a0)
	beq	a5,zero,.L1222
	addi	a3, zero, 0
	jal	zero, .L1223
.L1224:
	addi	a5, a4, 0
.L1223:
	lw	a4,4(a5)
	sw	a3,4(a5)
	addi	a3, a5, 0
	bne	a4,zero,.L1224
.L1222:
	sw	a5,0(a0)
	jalr	zero, ra, 0
	.size	sglib_ilist_reverse, .-sglib_ilist_reverse
	.align	2
	.globl	sglib_ilist_it_init_on_equal
	.type	sglib_ilist_it_init_on_equal, @function
sglib_ilist_it_init_on_equal:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	sw	zero,4(a0)
	sw	a2,8(a0)
	sw	a3,12(a0)
	addi	s3, a0, 0
	addi	s0, a1, 0
	beq	a2,zero,.L1229
	sw	s1,20(sp)
	sw	s2,16(sp)
	addi	s1, a2, 0
	addi	s2, a3, 0
	bne	a1,zero,.L1230
	jal	zero, .L1241
.L1233:
	lw	s0,4(s0)
	beq	s0,zero,.L1232
.L1230:
	addi	a1, s2, 0
	addi	a0, s0, 0
	jalr	s1
	bne	a0,zero,.L1233
	lw	s1,20(sp)
	lw	s2,16(sp)
	sw	s0,0(s3)
.L1235:
	lw	a5,4(s0)
	sw	a5,4(s3)
.L1236:
	addi	a0, s0, 0
.L1228:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L1229:
	sw	a1,0(a0)
	bne	a1,zero,.L1235
	addi	s0, zero, 0
	jal	zero, .L1236
.L1232:
	lw	s1,20(sp)
	lw	s2,16(sp)
	sw	zero,0(s3)
	addi	s0, zero, 0
	jal	zero, .L1236
.L1241:
	sw	zero,0(a0)
	lw	s1,20(sp)
	lw	s2,16(sp)
	addi	a0, zero, 0
	jal	zero, .L1228
	.size	sglib_ilist_it_init_on_equal, .-sglib_ilist_it_init_on_equal
	.align	2
	.globl	sglib_ilist_it_init
	.type	sglib_ilist_it_init, @function
sglib_ilist_it_init:
	sw	zero,8(a0)
	sw	zero,12(a0)
	sw	zero,4(a0)
	sw	a1,0(a0)
	beq	a1,zero,.L1243
	lw	a4,4(a1)
	sw	a4,4(a0)
.L1243:
	addi	a0, a1, 0
	jalr	zero, ra, 0
	.size	sglib_ilist_it_init, .-sglib_ilist_it_init
	.align	2
	.globl	sglib_ilist_it_current
	.type	sglib_ilist_it_current, @function
sglib_ilist_it_current:
	lw	a0,0(a0)
	jalr	zero, ra, 0
	.size	sglib_ilist_it_current, .-sglib_ilist_it_current
	.align	2
	.globl	sglib_ilist_it_next
	.type	sglib_ilist_it_next, @function
sglib_ilist_it_next:
	addi	sp,sp,-32
	sw	s1,20(sp)
	lw	s1,8(a0)
	sw	s0,24(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	lw	s0,4(a0)
	sw	zero,4(a0)
	addi	s3, a0, 0
	beq	s1,zero,.L1249
	beq	s0,zero,.L1250
	sw	s2,16(sp)
	lw	s2,12(a0)
	jal	zero, .L1251
.L1254:
	lw	s0,4(s0)
	beq	s0,zero,.L1253
.L1251:
	addi	a1, s2, 0
	addi	a0, s0, 0
	jalr	s1
	bne	a0,zero,.L1254
	lw	s2,16(sp)
	sw	s0,0(s3)
.L1256:
	lw	a5,4(s0)
	sw	a5,4(s3)
.L1248:
	lw	ra,28(sp)
	addi	a0, s0, 0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L1249:
	sw	s0,0(a0)
	bne	s0,zero,.L1256
	addi	s0, zero, 0
.L1261:
	lw	ra,28(sp)
	addi	a0, s0, 0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L1253:
	lw	s2,16(sp)
	sw	zero,0(s3)
	addi	s0, zero, 0
	jal	zero, .L1261
.L1250:
	sw	zero,0(a0)
	jal	zero, .L1248
	.size	sglib_ilist_it_next, .-sglib_ilist_it_next
	.align	2
	.globl	sglib_hashed_ilist_init
	.type	sglib_hashed_ilist_init, @function
sglib_hashed_ilist_init:
	addi	a5,a0,80
.L1263:
	sw	zero,0(a0)
	addi	a0,a0,4
	bne	a0,a5,.L1263
	jalr	zero, ra, 0
	.size	sglib_hashed_ilist_init, .-sglib_hashed_ilist_init
	.align	2
	.globl	sglib_hashed_ilist_add
	.type	sglib_hashed_ilist_add, @function
sglib_hashed_ilist_add:
	lw	a4,0(a1)
	lui	a5, 838861
	addi	a5,a5,-819
	mulhu	a5,a4,a5
	srli	a5,a5,4
	slli	a3,a5,2
	add	a5,a3,a5
	slli	a5,a5,2
	sub	a4,a4,a5
	slli	a4,a4,2
	add	a0,a0,a4
	lw	a5,0(a0)
	sw	a5,4(a1)
	sw	a1,0(a0)
	jalr	zero, ra, 0
	.size	sglib_hashed_ilist_add, .-sglib_hashed_ilist_add
	.align	2
	.globl	sglib_hashed_ilist_add_if_not_member
	.type	sglib_hashed_ilist_add_if_not_member, @function
sglib_hashed_ilist_add_if_not_member:
	lw	a3,0(a1)
	lui	a4, 838861
	addi	a4,a4,-819
	mulhu	a4,a3,a4
	srli	a4,a4,4
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a5,a3,a5
	slli	a5,a5,2
	add	a0,a0,a5
	lw	a5,0(a0)
	bne	a5,zero,.L1267
	jal	zero, .L1268
.L1269:
	lw	a5,4(a5)
	beq	a5,zero,.L1268
.L1267:
	lw	a4,0(a5)
	bne	a4,a3,.L1269
	sw	a5,0(a2)
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L1268:
	sw	zero,0(a2)
	lw	a5,0(a0)
	sw	a5,4(a1)
	sw	a1,0(a0)
	lw	a0,0(a2)
	sltiu	a0, a0, 1
	jalr	zero, ra, 0
	.size	sglib_hashed_ilist_add_if_not_member, .-sglib_hashed_ilist_add_if_not_member
	.align	2
	.globl	sglib_hashed_ilist_delete
	.type	sglib_hashed_ilist_delete, @function
sglib_hashed_ilist_delete:
	lw	a4,0(a1)
	lui	a5, 838861
	addi	a5,a5,-819
	mulhu	a5,a4,a5
	srli	a5,a5,4
	slli	a3,a5,2
	add	a5,a3,a5
	slli	a5,a5,2
	sub	a4,a4,a5
	slli	a4,a4,2
	add	a0,a0,a4
	lw	a5,0(a0)
	beq	a5,zero,.L1279
.L1278:
	beq	a1,a5,.L1286
	addi	a0,a5,4
	lw	a5,4(a5)
	bne	a5,zero,.L1278
.L1279:
	lw	a5,4(zero)
	ebreak
.L1286:
	lw	a5,4(a1)
	sw	a5,0(a0)
	jalr	zero, ra, 0
	.size	sglib_hashed_ilist_delete, .-sglib_hashed_ilist_delete
	.align	2
	.globl	sglib_hashed_ilist_delete_if_member
	.type	sglib_hashed_ilist_delete_if_member, @function
sglib_hashed_ilist_delete_if_member:
	lw	a3,0(a1)
	lui	a4, 838861
	addi	a4,a4,-819
	mulhu	a4,a3,a4
	srli	a4,a4,4
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a5,a3,a5
	slli	a5,a5,2
	add	a0,a0,a5
	lw	a5,0(a0)
	bne	a5,zero,.L1288
	jal	zero, .L1290
.L1291:
	addi	a0,a5,4
	lw	a5,4(a5)
	beq	a5,zero,.L1290
.L1288:
	lw	a4,0(a5)
	bne	a4,a3,.L1291
	sw	a5,0(a2)
	lw	a5,4(a5)
	sw	a5,0(a0)
	lw	a0,0(a2)
	sltu	a0, zero, a0
	jalr	zero, ra, 0
.L1290:
	sw	zero,0(a2)
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	sglib_hashed_ilist_delete_if_member, .-sglib_hashed_ilist_delete_if_member
	.align	2
	.globl	sglib_hashed_ilist_is_member
	.type	sglib_hashed_ilist_is_member, @function
sglib_hashed_ilist_is_member:
	lw	a4,0(a1)
	lui	a5, 838861
	addi	a5,a5,-819
	mulhu	a5,a4,a5
	srli	a5,a5,4
	slli	a3,a5,2
	add	a5,a3,a5
	slli	a5,a5,2
	sub	a4,a4,a5
	slli	a4,a4,2
	add	a0,a0,a4
	lw	a5,0(a0)
	sltu	a0, zero, a5
	beq	a5,a1,.L1297
.L1310:
	beq	a0,zero,.L1297
	lw	a5,4(a5)
	sltu	a0, zero, a5
	bne	a1,a5,.L1310
.L1297:
	jalr	zero, ra, 0
	.size	sglib_hashed_ilist_is_member, .-sglib_hashed_ilist_is_member
	.align	2
	.globl	sglib_hashed_ilist_find_member
	.type	sglib_hashed_ilist_find_member, @function
sglib_hashed_ilist_find_member:
	lw	a4,0(a1)
	lui	a3, 838861
	addi	a3,a3,-819
	mulhu	a3,a4,a3
	srli	a3,a3,4
	slli	a5,a3,2
	add	a5,a5,a3
	slli	a5,a5,2
	sub	a5,a4,a5
	slli	a5,a5,2
	add	a0,a0,a5
	lw	a0,0(a0)
	bne	a0,zero,.L1312
	jalr	zero, ra, 0
.L1314:
	lw	a0,4(a0)
	beq	a0,zero,.L1311
.L1312:
	lw	a5,0(a0)
	bne	a5,a4,.L1314
.L1311:
	jalr	zero, ra, 0
	.size	sglib_hashed_ilist_find_member, .-sglib_hashed_ilist_find_member
	.align	2
	.globl	sglib_hashed_ilist_it_current
	.type	sglib_hashed_ilist_it_current, @function
sglib_hashed_ilist_it_current:
	lw	a0,0(a0)
	jalr	zero, ra, 0
	.size	sglib_hashed_ilist_it_current, .-sglib_hashed_ilist_it_current
	.align	2
	.globl	sglib_hashed_ilist_it_next
	.type	sglib_hashed_ilist_it_next, @function
sglib_hashed_ilist_it_next:
	addi	sp,sp,-32
	sw	s2,16(sp)
	lw	s2,8(a0)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	ra,28(sp)
	sw	s3,12(sp)
	lw	s0,4(a0)
	sw	zero,4(a0)
	addi	s1, a0, 0
	beq	s2,zero,.L1321
	beq	s0,zero,.L1325
	lw	s3,12(a0)
	jal	zero, .L1323
.L1326:
	lw	s0,4(s0)
	beq	s0,zero,.L1325
.L1323:
	addi	a1, s3, 0
	addi	a0, s0, 0
	jalr	s2
	bne	a0,zero,.L1326
	sw	s0,0(s1)
.L1338:
	lw	a5,4(s0)
	sw	a5,4(s1)
.L1320:
	lw	ra,28(sp)
	addi	a0, s0, 0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L1321:
	sw	s0,0(a0)
	bne	s0,zero,.L1338
	sw	s4,8(sp)
	jal	zero, .L1324
.L1325:
	sw	s4,8(sp)
	sw	zero,0(s1)
.L1324:
	lw	a5,20(s1)
	addi	s4, zero, 19
.L1329:
	addi	a5,a5,1
	sw	a5,20(s1)
	blt	s4, a5, .L1350
.L1336:
	lw	a4,16(s1)
	lw	s2,24(s1)
	lw	s3,28(s1)
	slli	a3,a5,2
	add	a4,a4,a3
	lw	s0,0(a4)
	sw	zero,4(s1)
	sw	s2,8(s1)
	sw	s3,12(s1)
	beq	s2,zero,.L1330
	bne	s0,zero,.L1331
	jal	zero, .L1351
.L1334:
	lw	s0,4(s0)
	beq	s0,zero,.L1333
.L1331:
	addi	a1, s3, 0
	addi	a0, s0, 0
	jalr	s2
	bne	a0,zero,.L1334
	sw	s0,0(s1)
.L1337:
	lw	a5,4(s0)
	lw	ra,28(sp)
	addi	a0, s0, 0
	lw	s0,24(sp)
	sw	a5,4(s1)
	lw	s4,8(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L1330:
	sw	s0,0(s1)
	bne	s0,zero,.L1337
	jal	zero, .L1329
.L1333:
	lw	a5,20(s1)
	sw	zero,0(s1)
	addi	a5,a5,1
	sw	a5,20(s1)
	bge	s4, a5, .L1336
.L1350:
	lw	s4,8(sp)
	addi	s0, zero, 0
	jal	zero, .L1320
.L1351:
	sw	zero,0(s1)
	jal	zero, .L1329
	.size	sglib_hashed_ilist_it_next, .-sglib_hashed_ilist_it_next
	.align	2
	.globl	sglib_hashed_ilist_it_init_on_equal
	.type	sglib_hashed_ilist_it_init_on_equal, @function
sglib_hashed_ilist_it_init_on_equal:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	s2,16(sp)
	sw	ra,28(sp)
	sw	a3,28(a0)
	lw	s0,0(a1)
	sw	a1,16(a0)
	sw	zero,20(a0)
	sw	a3,12(a0)
	sw	zero,4(a0)
	sw	a2,24(a0)
	sw	a2,8(a0)
	addi	s2, a0, 0
	beq	a2,zero,.L1353
	sw	s1,20(sp)
	sw	s3,12(sp)
	addi	s1, a2, 0
	addi	s3, a3, 0
	bne	s0,zero,.L1354
	jal	zero, .L1356
.L1357:
	lw	s0,4(s0)
	beq	s0,zero,.L1356
.L1354:
	addi	a1, s3, 0
	addi	a0, s0, 0
	jalr	s1
	bne	a0,zero,.L1357
	lw	s1,20(sp)
	lw	s3,12(sp)
	sw	s0,0(s2)
.L1359:
	lw	a5,4(s0)
	lw	ra,28(sp)
	addi	a0, s0, 0
	lw	s0,24(sp)
	sw	a5,4(s2)
	lw	s2,16(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L1353:
	sw	s0,0(a0)
	bne	s0,zero,.L1359
	jal	zero, .L1355
.L1356:
	lw	s1,20(sp)
	lw	s3,12(sp)
	sw	zero,0(s2)
.L1355:
	addi	a0, s2, 0
.Lpcrel_116:
	auipc	ra, %pcrel_hi(sglib_hashed_ilist_it_next)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_116)
	addi	s0, a0, 0
	lw	ra,28(sp)
	addi	a0, s0, 0
	lw	s0,24(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
	.size	sglib_hashed_ilist_it_init_on_equal, .-sglib_hashed_ilist_it_init_on_equal
	.align	2
	.globl	sglib_hashed_ilist_it_init
	.type	sglib_hashed_ilist_it_init, @function
sglib_hashed_ilist_it_init:
	sw	zero,28(a0)
	lw	a5,0(a1)
	sw	a1,16(a0)
	sw	zero,20(a0)
	sw	a5,0(a0)
	sw	zero,24(a0)
	sw	zero,8(a0)
	sw	zero,12(a0)
	sw	zero,4(a0)
	beq	a5,zero,.L1371
	lw	a4,4(a5)
	sw	a4,4(a0)
	addi	a0, a5, 0
	jalr	zero, ra, 0
.L1371:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_117:
	auipc	ra, %pcrel_hi(sglib_hashed_ilist_it_next)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_117)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	sglib_hashed_ilist_it_init, .-sglib_hashed_ilist_it_init
	.align	2
	.globl	sglib_iq_init
	.type	sglib_iq_init, @function
sglib_iq_init:
	sw	zero,408(a0)
	sw	zero,404(a0)
	jalr	zero, ra, 0
	.size	sglib_iq_init, .-sglib_iq_init
	.align	2
	.globl	sglib_iq_is_empty
	.type	sglib_iq_is_empty, @function
sglib_iq_is_empty:
	lw	a5,404(a0)
	lw	a4,408(a0)
	sub	a0,a5,a4
	sltiu	a0, a0, 1
	jalr	zero, ra, 0
	.size	sglib_iq_is_empty, .-sglib_iq_is_empty
	.align	2
	.globl	sglib_iq_is_full
	.type	sglib_iq_is_full, @function
sglib_iq_is_full:
	lw	a4,408(a0)
	lui	a5, 166111
	addi	a5,a5,203
	addi	a4,a4,1
	mulh	a5,a4,a5
	srai	a1,a4,31
	addi	a2, zero, 101
	lw	a3,404(a0)
	srai	a5,a5,4
	sub	a5,a5,a1
	mul	a5,a5,a2
	sub	a0,a4,a5
	sub	a0,a0,a3
	sltiu	a0, a0, 1
	jalr	zero, ra, 0
	.size	sglib_iq_is_full, .-sglib_iq_is_full
	.align	2
	.globl	sglib_iq_first_element
	.type	sglib_iq_first_element, @function
sglib_iq_first_element:
	lw	a5,404(a0)
	slli	a5,a5,2
	add	a0,a0,a5
	lw	a0,0(a0)
	jalr	zero, ra, 0
	.size	sglib_iq_first_element, .-sglib_iq_first_element
	.align	2
	.globl	sglib_iq_first_element_ptr
	.type	sglib_iq_first_element_ptr, @function
sglib_iq_first_element_ptr:
	lw	a5,404(a0)
	slli	a5,a5,2
	add	a0,a0,a5
	jalr	zero, ra, 0
	.size	sglib_iq_first_element_ptr, .-sglib_iq_first_element_ptr
	.align	2
	.globl	sglib_iq_add_next
	.type	sglib_iq_add_next, @function
sglib_iq_add_next:
	lw	a4,408(a0)
	lui	a5, 166111
	addi	a5,a5,203
	addi	a4,a4,1
	mulh	a5,a4,a5
	srai	a2,a4,31
	addi	a3, zero, 101
	srai	a5,a5,4
	sub	a5,a5,a2
	mul	a5,a5,a3
	sub	a4,a4,a5
	sw	a4,408(a0)
	jalr	zero, ra, 0
	.size	sglib_iq_add_next, .-sglib_iq_add_next
	.align	2
	.globl	sglib_iq_add
	.type	sglib_iq_add, @function
sglib_iq_add:
	lw	a4,408(a0)
	lui	a5, 166111
	addi	a5,a5,203
	addi	a3,a4,1
	mulh	a5,a3,a5
	srai	a6,a3,31
	addi	a2, zero, 101
	slli	a4,a4,2
	add	a4,a0,a4
	sw	a1,0(a4)
	srai	a5,a5,4
	sub	a5,a5,a6
	mul	a5,a5,a2
	sub	a3,a3,a5
	sw	a3,408(a0)
	jalr	zero, ra, 0
	.size	sglib_iq_add, .-sglib_iq_add
	.align	2
	.globl	sglib_iq_delete_first
	.type	sglib_iq_delete_first, @function
sglib_iq_delete_first:
	lw	a4,404(a0)
	lui	a5, 166111
	addi	a5,a5,203
	addi	a4,a4,1
	mulh	a5,a4,a5
	srai	a2,a4,31
	addi	a3, zero, 101
	srai	a5,a5,4
	sub	a5,a5,a2
	mul	a5,a5,a3
	sub	a4,a4,a5
	sw	a4,404(a0)
	jalr	zero, ra, 0
	.size	sglib_iq_delete_first, .-sglib_iq_delete_first
	.align	2
	.globl	sglib_iq_delete
	.type	sglib_iq_delete, @function
sglib_iq_delete:
	lw	a4,404(a0)
	lui	a5, 166111
	addi	a5,a5,203
	addi	a4,a4,1
	mulh	a5,a4,a5
	srai	a2,a4,31
	addi	a3, zero, 101
	srai	a5,a5,4
	sub	a5,a5,a2
	mul	a5,a5,a3
	sub	a4,a4,a5
	sw	a4,404(a0)
	jalr	zero, ra, 0
	.size	sglib_iq_delete, .-sglib_iq_delete
	.align	2
	.globl	sglib___rbtree_delete_recursive
	.type	sglib___rbtree_delete_recursive, @function
sglib___rbtree_delete_recursive:
	lw	a5,0(a0)
	beq	a5,zero,.L1490
	lw	a3,0(a1)
	lw	a4,0(a5)
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	ra,44(sp)
	sub	a4,a3,a4
	addi	s0, a0, 0
	blt	a4,zero,.L1384
	bne	a4,zero,.L1430
	bgeu	a1, a5, .L1385
.L1384:
	lw	a4,8(a5)
	beq	a4,zero,.L1383
	lw	a2,0(a4)
	sw	s1,36(sp)
	addi	s1,a5,8
	sub	a2,a3,a2
	blt	a2,zero,.L1387
	bne	a2,zero,.L1388
	bgeu	a1,a4,.L1388
.L1387:
	lw	a5,8(a4)
	beq	a5,zero,.L1504
	lw	a2,0(a5)
	sw	s2,32(sp)
	addi	s2,a4,8
	sub	a3,a3,a2
	blt	a3,zero,.L1391
	bne	a3,zero,.L1392
	bgeu	a1,a5,.L1392
.L1391:
	addi	a0,a5,8
.Lpcrel_118:
	auipc	ra, %pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_118)
	bne	a0,zero,.L1505
.L1497:
	lw	s1,36(sp)
	lw	s2,32(sp)
.L1383:
	addi	a0, zero, 0
.L1381:
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jalr	zero, ra, 0
.L1490:
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L1430:
	lw	a4,12(a5)
	beq	a4,zero,.L1383
	lw	a2,0(a4)
	sw	s1,36(sp)
	addi	s1,a5,12
	sub	a3,a3,a2
	blt	a3,zero,.L1414
	bne	a3,zero,.L1431
	bgeu	a1,a4,.L1415
.L1414:
	addi	a0,a4,8
.Lpcrel_119:
	auipc	ra, %pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_119)
	bne	a0,zero,.L1506
.L1504:
	lw	s1,36(sp)
	jal	zero, .L1383
.L1388:
	bltu	a4, a1, .L1429
	bne	a2,zero,.L1429
	lw	a3,8(a4)
	beq	a3,zero,.L1507
	addi	a1,sp,28
	addi	a0,a4,8
	sw	a5,12(sp)
	sw	a4,8(sp)
.Lpcrel_120:
	auipc	ra, %pcrel_hi(sglib___rbtree_delete_rightmost_leaf)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_120)
	lw	a4,8(sp)
	lw	a3,28(sp)
	lw	a5,12(sp)
	lw	a1,8(a4)
	lw	a2,12(a4)
	sw	a1,8(a3)
	sw	a2,12(a3)
	lbu	a4,4(a4)
	sb	a4,4(a3)
	sw	a3,8(a5)
	beq	a0,zero,.L1504
	addi	a0, s1, 0
.Lpcrel_121:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_121)
.L1402:
	beq	a0,zero,.L1504
.L1408:
	addi	a0, s0, 0
.Lpcrel_122:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_122)
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jalr	zero, ra, 0
.L1429:
	addi	a0,a4,12
.Lpcrel_123:
	auipc	ra, %pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_123)
	beq	a0,zero,.L1504
	addi	a0, s1, 0
.Lpcrel_124:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_124)
	jal	zero, .L1402
.L1385:
	bne	a4,zero,.L1430
	bltu	a5,a1,.L1430
	lw	a4,8(a5)
	beq	a4,zero,.L1508
	addi	a0,a5,8
	addi	a1,sp,28
	sw	a5,8(sp)
.Lpcrel_125:
	auipc	ra, %pcrel_hi(sglib___rbtree_delete_rightmost_leaf)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_125)
	lw	a5,8(sp)
	lw	a4,28(sp)
	lw	a2,8(a5)
	lw	a3,12(a5)
	sw	a2,8(a4)
	sw	a3,12(a4)
	lbu	a5,4(a5)
	sb	a5,4(a4)
	sw	a4,0(s0)
	beq	a0,zero,.L1383
	addi	a0, s0, 0
.Lpcrel_126:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_126)
	jal	zero, .L1381
.L1392:
	bltu	a5, a1, .L1428
	bne	a3,zero,.L1428
	lw	a3,8(a5)
	beq	a3,zero,.L1509
	addi	a1,sp,28
	addi	a0,a5,8
	sw	a4,12(sp)
	sw	a5,8(sp)
.Lpcrel_127:
	auipc	ra, %pcrel_hi(sglib___rbtree_delete_rightmost_leaf)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_127)
	lw	a5,8(sp)
	lw	a3,28(sp)
	lw	a4,12(sp)
	lw	a1,8(a5)
	lw	a2,12(a5)
	sw	a1,8(a3)
	sw	a2,12(a3)
	lbu	a5,4(a5)
	sb	a5,4(a3)
	sw	a3,8(a4)
	beq	a0,zero,.L1497
.L1505:
	addi	a0, s2, 0
.Lpcrel_128:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_128)
.L1394:
	beq	a0,zero,.L1497
.L1401:
	addi	a0, s1, 0
.Lpcrel_129:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_129)
	lw	s2,32(sp)
	jal	zero, .L1402
.L1508:
	lw	a4,12(a5)
	beq	a4,zero,.L1510
	lbu	a5,4(a5)
	addi	a0, zero, 0
	bne	a5,zero,.L1426
	lbu	a0,4(a4)
	sltiu	a0, a0, 1
.L1426:
	sb	zero,4(a4)
	sw	a4,0(s0)
	jal	zero, .L1381
.L1415:
	bne	a3,zero,.L1431
	bltu	a4, a1, .L1431
	lw	a3,8(a4)
	beq	a3,zero,.L1511
	addi	a1,sp,28
	addi	a0,a4,8
	sw	a5,12(sp)
	sw	a4,8(sp)
.Lpcrel_130:
	auipc	ra, %pcrel_hi(sglib___rbtree_delete_rightmost_leaf)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_130)
	lw	a4,8(sp)
	lw	a3,28(sp)
	lw	a5,12(sp)
	lw	a1,8(a4)
	lw	a2,12(a4)
	sw	a1,8(a3)
	sw	a2,12(a3)
	lbu	a4,4(a4)
	sb	a4,4(a3)
	sw	a3,12(a5)
	beq	a0,zero,.L1504
.L1506:
	addi	a0, s1, 0
.Lpcrel_131:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_131)
.L1417:
	beq	a0,zero,.L1504
.L1423:
	addi	a0, s0, 0
.Lpcrel_132:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_132)
	lw	s1,36(sp)
	jal	zero, .L1381
.L1428:
	addi	a0,a5,12
.Lpcrel_133:
	auipc	ra, %pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_133)
	beq	a0,zero,.L1497
	addi	a0, s2, 0
.Lpcrel_134:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_134)
	jal	zero, .L1394
.L1431:
	addi	a0,a4,12
.Lpcrel_135:
	auipc	ra, %pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_135)
	beq	a0,zero,.L1504
	addi	a0, s1, 0
.Lpcrel_136:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_136)
	jal	zero, .L1417
.L1507:
	lw	a3,12(a4)
	beq	a3,zero,.L1512
	lbu	a4,4(a4)
	bne	a4,zero,.L1407
	lbu	a4,4(a3)
	bne	a4,zero,.L1407
	sw	a3,8(a5)
	jal	zero, .L1408
.L1510:
	sw	zero,0(a0)
	lbu	a0,4(a5)
	sltiu	a0, a0, 1
	jal	zero, .L1381
.L1407:
	sb	zero,4(a3)
	lw	s1,36(sp)
	sw	a3,8(a5)
	jal	zero, .L1383
.L1509:
	lw	a3,12(a5)
	beq	a3,zero,.L1513
	lbu	a5,4(a5)
	bne	a5,zero,.L1400
	lbu	a5,4(a3)
	bne	a5,zero,.L1400
	sw	a3,8(a4)
	jal	zero, .L1401
.L1511:
	lw	a3,12(a4)
	beq	a3,zero,.L1514
	lbu	a4,4(a4)
	bne	a4,zero,.L1422
	lbu	a4,4(a3)
	bne	a4,zero,.L1422
	sw	a3,12(a5)
	jal	zero, .L1423
.L1512:
	sw	zero,8(a5)
	lbu	a0,4(a4)
	sltiu	a0, a0, 1
	jal	zero, .L1402
.L1400:
	sb	zero,4(a3)
	lw	s1,36(sp)
	lw	s2,32(sp)
	sw	a3,8(a4)
	jal	zero, .L1383
.L1422:
	sb	zero,4(a3)
	lw	s1,36(sp)
	sw	a3,12(a5)
	jal	zero, .L1383
.L1513:
	sw	zero,8(a4)
	lbu	a0,4(a5)
	sltiu	a0, a0, 1
	jal	zero, .L1394
.L1514:
	sw	zero,12(a5)
	lbu	a0,4(a4)
	sltiu	a0, a0, 1
	jal	zero, .L1417
	.size	sglib___rbtree_delete_recursive, .-sglib___rbtree_delete_recursive
	.align	2
	.globl	sglib_rbtree_add
	.type	sglib_rbtree_add, @function
sglib_rbtree_add:
	sw	zero,12(a1)
	sw	zero,8(a1)
	lw	a5,0(a0)
	beq	a5,zero,.L1621
	lw	a3,0(a1)
	lw	a4,0(a5)
	addi	sp,sp,-32
	sw	ra,28(sp)
	sub	a4,a3,a4
	addi	a2, a0, 0
	blt	a4,zero,.L1518
	bne	a4,zero,.L1519
	bgeu	a1,a5,.L1519
.L1518:
	lw	a4,8(a5)
	beq	a4,zero,.L1622
	lw	a0,0(a4)
	sub	a3,a3,a0
	blt	a3,zero,.L1522
	bne	a3,zero,.L1523
	bgeu	a1,a4,.L1523
.L1522:
	addi	a0,a4,8
	sw	a2,12(sp)
	sw	a5,8(sp)
	sw	a4,4(sp)
.Lpcrel_137:
	auipc	ra, %pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_137)
	lw	a4,4(sp)
	lw	a5,8(sp)
	lw	a2,12(sp)
	lbu	a4,4(a4)
	beq	a4,zero,.L1623
.L1521:
	lbu	a5,4(a5)
	lw	a1,0(a2)
	beq	a5,zero,.L1624
.L1517:
	sb	zero,4(a1)
	lw	ra,28(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L1621:
	sw	a1,0(a0)
	sb	zero,4(a1)
	jalr	zero, ra, 0
.L1622:
	addi	a4, zero, 1
	sb	a4,4(a1)
	sw	a1,8(a5)
	lbu	a5,4(a5)
	lw	a1,0(a2)
	bne	a5,zero,.L1517
.L1624:
	lw	a5,8(a1)
	lw	a4,12(a1)
	lbu	a3,4(a5)
	beq	a4,zero,.L1535
	lbu	a0,4(a4)
	addi	a6, zero, 1
	beq	a0,a6,.L1625
.L1535:
	addi	a4, zero, 1
	bne	a3,a4,.L1517
	lw	a0,8(a5)
	lw	a4,12(a5)
	beq	a0,zero,.L1538
	lbu	a6,4(a0)
	beq	a6,a3,.L1626
.L1538:
	beq	a4,zero,.L1517
	lbu	a3,4(a4)
	addi	a0, zero, 1
	bne	a3,a0,.L1517
	lw	a6,8(a4)
	lw	a0,12(a4)
	sw	a6,12(a5)
	sw	a0,8(a1)
	sw	a1,12(a4)
	sw	a5,8(a4)
	sb	zero,4(a4)
	sb	a3,4(a1)
	sw	a4,0(a2)
	addi	a1, a4, 0
	jal	zero, .L1517
.L1623:
	lw	a4,8(a5)
	lw	a3,8(a4)
	lw	a1,12(a4)
	lbu	a0,4(a3)
	beq	a1,zero,.L1525
	lbu	a6,4(a1)
	addi	a7, zero, 1
	beq	a6,a7,.L1627
.L1525:
	addi	a1, zero, 1
	bne	a0,a1,.L1521
	lw	a6,8(a3)
	lw	a1,12(a3)
	beq	a6,zero,.L1529
	lbu	a7,4(a6)
	beq	a7,a0,.L1628
.L1529:
	beq	a1,zero,.L1521
	lbu	a0,4(a1)
	addi	a6, zero, 1
	bne	a0,a6,.L1521
	lw	a7,8(a1)
	lw	a6,12(a1)
	sw	a7,12(a3)
	sw	a6,8(a4)
	sw	a3,8(a1)
	sw	a4,12(a1)
	sb	zero,4(a1)
	sb	a0,4(a4)
	sw	a1,8(a5)
	jal	zero, .L1521
.L1519:
	addi	a0,a5,12
	sw	a2,8(sp)
	sw	a5,4(sp)
.Lpcrel_138:
	auipc	ra, %pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_138)
	lw	a5,4(sp)
	lw	a2,8(sp)
	lbu	a5,4(a5)
	lw	a1,0(a2)
	bne	a5,zero,.L1517
	lw	a5,12(a1)
	lw	a4,8(a1)
	lbu	a3,4(a5)
	beq	a4,zero,.L1540
	lbu	a0,4(a4)
	addi	a6, zero, 1
	beq	a0,a6,.L1629
.L1540:
	addi	a4, zero, 1
	bne	a3,a4,.L1517
	lw	a0,12(a5)
	lw	a4,8(a5)
	beq	a0,zero,.L1544
	lbu	a6,4(a0)
	beq	a6,a3,.L1630
.L1544:
	beq	a4,zero,.L1517
	lbu	a3,4(a4)
	addi	a0, zero, 1
	bne	a3,a0,.L1517
	lw	a6,12(a4)
	lw	a0,8(a4)
	sw	a6,8(a5)
	sw	a0,12(a1)
	sw	a1,8(a4)
	sw	a5,12(a4)
	sb	zero,4(a4)
	sb	a3,4(a1)
	sw	a4,0(a2)
	addi	a1, a4, 0
	jal	zero, .L1517
.L1523:
	addi	a0,a4,12
	sw	a2,12(sp)
	sw	a5,8(sp)
	sw	a4,4(sp)
.Lpcrel_139:
	auipc	ra, %pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_139)
	lw	a4,4(sp)
	lw	a5,8(sp)
	lw	a2,12(sp)
	lbu	a4,4(a4)
	bne	a4,zero,.L1521
	lw	a4,8(a5)
	lw	a3,12(a4)
	lw	a1,8(a4)
	lbu	a0,4(a3)
	beq	a1,zero,.L1530
	lbu	a6,4(a1)
	addi	a7, zero, 1
	beq	a6,a7,.L1631
.L1530:
	addi	a1, zero, 1
	bne	a0,a1,.L1521
	lw	a6,12(a3)
	lw	a1,8(a3)
	beq	a6,zero,.L1533
	lbu	a7,4(a6)
	beq	a7,a0,.L1632
.L1533:
	beq	a1,zero,.L1521
	lbu	a0,4(a1)
	addi	a6, zero, 1
	bne	a0,a6,.L1521
	lw	a7,12(a1)
	lw	a6,8(a1)
	sw	a7,8(a3)
	sw	a6,12(a4)
	sw	a3,12(a1)
	sw	a4,8(a1)
	sb	zero,4(a1)
	sb	a0,4(a4)
	sw	a1,8(a5)
	jal	zero, .L1521
.L1627:
	bne	a0,a6,.L1521
	lw	a6,8(a3)
	beq	a6,zero,.L1527
	lbu	a6,4(a6)
	beq	a6,a0,.L1532
.L1527:
	lw	a0,12(a3)
	beq	a0,zero,.L1521
.L1618:
	lbu	a6,4(a0)
	addi	a0, zero, 1
	bne	a6,a0,.L1521
.L1532:
	sb	zero,4(a3)
	sb	zero,4(a1)
	addi	a3, zero, 1
	sb	a3,4(a4)
	jal	zero, .L1521
.L1626:
	sw	a4,8(a1)
	sw	a1,12(a5)
	sw	a0,8(a5)
	sb	a3,4(a1)
	sb	zero,4(a5)
	sw	a5,0(a2)
	addi	a1, a5, 0
	jal	zero, .L1517
.L1628:
	sw	a1,8(a4)
	sw	a6,8(a3)
	sw	a4,12(a3)
	sb	a0,4(a4)
	sb	zero,4(a3)
	sw	a3,8(a5)
	jal	zero, .L1521
.L1630:
	sw	a4,12(a1)
	sw	a1,8(a5)
	sw	a0,12(a5)
	sb	a3,4(a1)
	sb	zero,4(a5)
	sw	a5,0(a2)
	addi	a1, a5, 0
	jal	zero, .L1517
.L1632:
	sw	a1,12(a4)
	sw	a6,12(a3)
	sw	a4,8(a3)
	sb	a0,4(a4)
	sb	zero,4(a3)
	sw	a3,8(a5)
	jal	zero, .L1521
.L1625:
	bne	a3,a0,.L1517
	lw	a2,8(a5)
	beq	a2,zero,.L1536
	lbu	a2,4(a2)
	beq	a2,a3,.L1542
.L1536:
	lw	a3,12(a5)
	beq	a3,zero,.L1517
.L1620:
	lbu	a2,4(a3)
	addi	a3, zero, 1
	bne	a2,a3,.L1517
.L1542:
	sb	zero,4(a5)
	sb	zero,4(a4)
	addi	a5, zero, 1
	sb	a5,4(a1)
	jal	zero, .L1517
.L1629:
	bne	a3,a0,.L1517
	lw	a2,12(a5)
	beq	a2,zero,.L1541
	lbu	a2,4(a2)
	beq	a2,a3,.L1542
.L1541:
	lw	a3,8(a5)
	bne	a3,zero,.L1620
	jal	zero, .L1517
.L1631:
	bne	a0,a6,.L1521
	lw	a6,12(a3)
	beq	a6,zero,.L1531
	lbu	a6,4(a6)
	beq	a6,a0,.L1532
.L1531:
	lw	a0,8(a3)
	bne	a0,zero,.L1618
	jal	zero, .L1521
	.size	sglib_rbtree_add, .-sglib_rbtree_add
	.align	2
	.globl	sglib_rbtree_delete
	.type	sglib_rbtree_delete, @function
sglib_rbtree_delete:
	lw	a5,0(a0)
	beq	a5,zero,.L1677
	lw	a3,0(a1)
	lw	a4,0(a5)
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	ra,44(sp)
	sub	a4,a3,a4
	addi	s0, a0, 0
	blt	a4,zero,.L1636
	bne	a4,zero,.L1660
	bgeu	a1,a5,.L1637
.L1636:
	lw	a4,8(a5)
	beq	a4,zero,.L1639
	lw	a2,0(a4)
	sw	s1,36(sp)
	addi	s1,a5,8
	sub	a3,a3,a2
	blt	a3,zero,.L1640
	bne	a3,zero,.L1659
	bgeu	a1,a4,.L1641
.L1640:
	addi	a0,a4,8
.Lpcrel_140:
	auipc	ra, %pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_140)
	bne	a0,zero,.L1652
.L1681:
	lw	a5,0(s0)
	lw	s1,36(sp)
	beq	a5,zero,.L1633
.L1639:
	sb	zero,4(a5)
.L1633:
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jalr	zero, ra, 0
.L1677:
	jalr	zero, ra, 0
.L1660:
	addi	a0,a5,12
.Lpcrel_141:
	auipc	ra, %pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_141)
	bne	a0,zero,.L1655
	lw	a5,0(s0)
.L1684:
	bne	a5,zero,.L1639
	jal	zero, .L1633
.L1641:
	bne	a3,zero,.L1659
	bgeu	a4, a1, .L1645
.L1659:
	addi	a0,a4,12
.Lpcrel_142:
	auipc	ra, %pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_142)
	beq	a0,zero,.L1681
	addi	a0, s1, 0
.Lpcrel_143:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_143)
.L1644:
	beq	a0,zero,.L1681
.L1651:
	addi	a0, s0, 0
.Lpcrel_144:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_144)
	jal	zero, .L1681
.L1655:
	addi	a0, s0, 0
.Lpcrel_145:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_145)
	lw	a5,0(s0)
	bne	a5,zero,.L1639
	jal	zero, .L1633
.L1637:
	bne	a4,zero,.L1660
	bltu	a5, a1, .L1660
	lw	a4,8(a5)
	beq	a4,zero,.L1683
	addi	a0,a5,8
	addi	a1,sp,28
	sw	a5,8(sp)
.Lpcrel_146:
	auipc	ra, %pcrel_hi(sglib___rbtree_delete_rightmost_leaf)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_146)
	lw	a5,8(sp)
	lw	a4,28(sp)
	lw	a2,8(a5)
	lw	a3,12(a5)
	sw	a2,8(a4)
	sw	a3,12(a4)
	lbu	a5,4(a5)
	sb	a5,4(a4)
	sw	a4,0(s0)
	addi	a5, a4, 0
	beq	a0,zero,.L1639
	addi	a0, s0, 0
.Lpcrel_147:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_147)
	lw	a5,0(s0)
	jal	zero, .L1684
.L1645:
	lw	a3,8(a4)
	beq	a3,zero,.L1685
	addi	a1,sp,28
	addi	a0,a4,8
	sw	a5,12(sp)
	sw	a4,8(sp)
.Lpcrel_148:
	auipc	ra, %pcrel_hi(sglib___rbtree_delete_rightmost_leaf)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_148)
	lw	a4,8(sp)
	lw	a3,28(sp)
	lw	a5,12(sp)
	lw	a1,8(a4)
	lw	a2,12(a4)
	sw	a1,8(a3)
	sw	a2,12(a3)
	lbu	a4,4(a4)
	sb	a4,4(a3)
	sw	a3,8(a5)
	beq	a0,zero,.L1681
.L1652:
	addi	a0, s1, 0
.Lpcrel_149:
	auipc	ra, %pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_149)
	jal	zero, .L1644
.L1683:
	lw	a5,12(a5)
	beq	a5,zero,.L1686
	sb	zero,4(a5)
	sw	a5,0(a0)
	jal	zero, .L1639
.L1685:
	lw	a3,12(a4)
	beq	a3,zero,.L1687
	lbu	a4,4(a4)
	bne	a4,zero,.L1650
	lbu	a4,4(a3)
	bne	a4,zero,.L1650
	sw	a3,8(a5)
	jal	zero, .L1651
.L1686:
	sw	zero,0(a0)
	jal	zero, .L1633
.L1650:
	sb	zero,4(a3)
	sw	a3,8(a5)
	lw	a5,0(s0)
	lw	s1,36(sp)
	bne	a5,zero,.L1639
	jal	zero, .L1633
.L1687:
	sw	zero,8(a5)
	lbu	a0,4(a4)
	sltiu	a0, a0, 1
	jal	zero, .L1644
	.size	sglib_rbtree_delete, .-sglib_rbtree_delete
	.align	2
	.globl	sglib_rbtree_find_member
	.type	sglib_rbtree_find_member, @function
sglib_rbtree_find_member:
	beq	a0,zero,.L1688
	lw	a4,0(a1)
.L1692:
	lw	a5,0(a0)
	sub	a5,a4,a5
	blt	a5,zero,.L1698
	beq	a5,zero,.L1688
	lw	a0,12(a0)
	bne	a0,zero,.L1692
.L1688:
	jalr	zero, ra, 0
.L1698:
	lw	a0,8(a0)
	bne	a0,zero,.L1692
	jalr	zero, ra, 0
	.size	sglib_rbtree_find_member, .-sglib_rbtree_find_member
	.align	2
	.globl	sglib_rbtree_is_member
	.type	sglib_rbtree_is_member, @function
sglib_rbtree_is_member:
	beq	a0,zero,.L1699
	lw	a4,0(a1)
.L1705:
	lw	a5,0(a0)
	sub	a5,a4,a5
	blt	a5,zero,.L1701
	bne	a5,zero,.L1702
	bgeu	a1,a0,.L1702
.L1701:
	lw	a0,8(a0)
	bne	a0,zero,.L1705
	jalr	zero, ra, 0
.L1702:
	bltu	a0, a1, .L1708
	beq	a5,zero,.L1707
.L1708:
	lw	a0,12(a0)
	bne	a0,zero,.L1705
	jalr	zero, ra, 0
.L1707:
	addi	a0, zero, 1
.L1699:
	jalr	zero, ra, 0
	.size	sglib_rbtree_is_member, .-sglib_rbtree_is_member
	.align	2
	.globl	sglib_rbtree_delete_if_member
	.type	sglib_rbtree_delete_if_member, @function
sglib_rbtree_delete_if_member:
	lw	a4,0(a0)
	beq	a4,zero,.L1717
	lw	a3,0(a1)
.L1721:
	lw	a5,0(a4)
	sub	a5,a3,a5
	blt	a5,zero,.L1732
	beq	a5,zero,.L1720
	lw	a4,12(a4)
	bne	a4,zero,.L1721
.L1717:
	sw	zero,0(a2)
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L1732:
	lw	a4,8(a4)
	bne	a4,zero,.L1721
	jal	zero, .L1717
.L1720:
	addi	sp,sp,-32
	addi	a1, a4, 0
	sw	a4,0(a2)
	sw	ra,28(sp)
	sw	a0,12(sp)
.Lpcrel_150:
	auipc	ra, %pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_150)
	lw	a5,12(sp)
	lw	a5,0(a5)
	beq	a5,zero,.L1724
	sb	zero,4(a5)
.L1724:
	lw	ra,28(sp)
	addi	a0, zero, 1
	addi	sp,sp,32
	jalr	zero, ra, 0
	.size	sglib_rbtree_delete_if_member, .-sglib_rbtree_delete_if_member
	.align	2
	.globl	sglib_rbtree_add_if_not_member
	.type	sglib_rbtree_add_if_not_member, @function
sglib_rbtree_add_if_not_member:
	lw	a4,0(a0)
	beq	a4,zero,.L1734
	lw	a3,0(a1)
.L1738:
	lw	a5,0(a4)
	sub	a5,a3,a5
	blt	a5,zero,.L1747
	beq	a5,zero,.L1737
	lw	a4,12(a4)
	bne	a4,zero,.L1738
.L1734:
	addi	sp,sp,-32
	sw	zero,0(a2)
	sw	zero,12(a1)
	sw	zero,8(a1)
	sw	ra,28(sp)
	sw	a0,12(sp)
.Lpcrel_151:
	auipc	ra, %pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_151)
	lw	a0,12(sp)
	addi	a5, zero, 1
	lw	a4,0(a0)
	addi	a0, a5, 0
	sb	zero,4(a4)
	lw	ra,28(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L1747:
	lw	a4,8(a4)
	bne	a4,zero,.L1738
	jal	zero, .L1734
.L1737:
	sw	a4,0(a2)
	addi	a0, a5, 0
	jalr	zero, ra, 0
	.size	sglib_rbtree_add_if_not_member, .-sglib_rbtree_add_if_not_member
	.align	2
	.globl	sglib_rbtree_len
	.type	sglib_rbtree_len, @function
sglib_rbtree_len:
	beq	a0,zero,.L1766
	addi	sp,sp,-640
	addi	t3, zero, 1
	addi	a4, a0, 0
	addi	a7, sp, 0
	sub	t3,t3,sp
	addi	a5, zero, 0
	addi	a0, zero, 0
	addi	t1,sp,128
	addi	t4,sp,124
.L1749:
	slli	a2,a5,2
	add	a2,t1,a2
	add	a5,a7,a5
.L1751:
	lw	a3,12(a4)
	lw	a4,8(a4)
	sb	zero,0(a5)
	sw	a3,0(a2)
	addi	a3, a5, 0
	addi	a2,a2,4
	addi	a5,a5,1
	bne	a4,zero,.L1751
	add	a3,t3,a3
	slli	a1,a3,2
	add	a1,t4,a1
	add	a2,a7,a3
	jal	zero, .L1754
.L1768:
	addi	a2,a2,-1
	addi	a1,a1,-4
	bne	a4,zero,.L1767
.L1754:
	lbu	a4,-1(a2)
	addi	a5, a3, 0
	addi	a3,a3,-1
	addi	a6,a4,1
	sb	a6,-1(a2)
	sltiu	a4, a4, 1
	add	a0,a0,a4
	lw	a4,0(a1)
	blt	zero, a3, .L1768
	slli	a3,a3,2
	add	a3,t1,a3
	sw	zero,0(a3)
	bne	a4,zero,.L1749
	addi	sp,sp,640
	jalr	zero, ra, 0
.L1767:
	slli	a3,a3,2
	add	a3,t1,a3
	sw	zero,0(a3)
	jal	zero, .L1749
.L1766:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	sglib_rbtree_len, .-sglib_rbtree_len
	.align	2
	.globl	sglib__rbtree_it_compute_current_elem
	.type	sglib__rbtree_it_compute_current_elem, @function
sglib__rbtree_it_compute_current_elem:
	addi	sp,sp,-48
	lh	a5,644(a0)
	sw	s2,32(sp)
	sw	s4,24(sp)
	sw	ra,44(sp)
	sw	zero,0(a0)
	lw	s2,648(a0)
	lw	s4,652(a0)
	bge	zero, a5, .L1769
	sw	s1,36(sp)
	sw	s7,12(sp)
	sw	s0,40(sp)
	sw	s3,28(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	addi	s1, a0, 0
	addi	a3,a5,-1
	addi	s7, zero, 1
.L1770:
	add	s3,s1,a3
	lbu	a4,4(s3)
	addi	s5, a5, 0
	bgeu	s7, a4, .L1771
	slli	a5,a3,16
	srai	a5,a5,16
	sh	a5,644(s1)
.L1772:
	bge	zero, a5, .L1805
	addi	a3,a5,-1
	add	a4,s1,a3
	lbu	a4,4(a4)
	lh	a2,646(s1)
	bne	a2,a4,.L1790
	slli	a4,a5,2
	add	a4,s1,a4
	lw	a4,128(a4)
	sw	a4,0(s1)
.L1790:
	lw	a4,0(s1)
	beq	a4,zero,.L1770
.L1805:
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s3,28(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
.L1769:
	lw	ra,44(sp)
	lw	s2,32(sp)
	lw	s4,24(sp)
	addi	sp,sp,48
	jalr	zero, ra, 0
.L1771:
	slli	s6,a5,2
	add	s6,s1,s6
	lw	a5,128(s6)
	bne	a4,zero,.L1773
	lw	s0,8(a5)
.L1774:
	beq	s2,zero,.L1775
	beq	s4,zero,.L1776
	beq	s0,zero,.L1806
.L1777:
	addi	a1, s0, 0
	addi	a0, s2, 0
	jalr	s4
	blt	a0,zero,.L1809
	beq	a0,zero,.L1782
	lw	s0,12(s0)
	bne	s0,zero,.L1777
.L1784:
	lh	a5,644(s1)
.L1807:
	lbu	a4,4(s3)
.L1778:
	addi	a4,a4,1
	sb	a4,4(s3)
	jal	zero, .L1772
.L1809:
	lw	s0,8(s0)
	bne	s0,zero,.L1777
	jal	zero, .L1784
.L1775:
	lh	a5,644(s1)
	beq	s0,zero,.L1807
.L1788:
	addi	a5,a5,1
	sw	s0,132(s6)
	slli	a5,a5,16
	add	s5,s1,s5
	srai	a5,a5,16
	sb	zero,4(s5)
	sh	a5,644(s1)
	jal	zero, .L1807
.L1773:
	lw	s0,12(a5)
	jal	zero, .L1774
.L1782:
	lh	a5,644(s1)
	jal	zero, .L1788
.L1776:
	beq	s0,zero,.L1806
	lw	a4,0(s2)
	lw	a5,0(s0)
	sub	a5,a4,a5
	blt	a5,zero,.L1810
.L1780:
	beq	a5,zero,.L1782
	lw	s0,12(s0)
	beq	s0,zero,.L1784
.L1808:
	lw	a5,0(s0)
	sub	a5,a4,a5
	bge	a5,zero,.L1780
.L1810:
	lw	s0,8(s0)
	bne	s0,zero,.L1808
	jal	zero, .L1784
.L1806:
	lh	a5,644(s1)
	jal	zero, .L1778
	.size	sglib__rbtree_it_compute_current_elem, .-sglib__rbtree_it_compute_current_elem
	.align	2
	.type	benchmark_body, @function
benchmark_body:
	addi	sp,sp,-1152
	sw	ra,1148(sp)
	bge	zero, a0, .L1813
	sw	s3,1132(sp)
	lui	s3,%hi(heap)
	addi	a5,s3,%lo(heap)
	sw	s1,1140(sp)
	sw	s2,1136(sp)
	sw	s6,1120(sp)
	sw	s8,1112(sp)
	sw	s10,1104(sp)
	lui	s1,%hi(.LANCHOR0)
	lui	s8,%hi(heap+8192)
	lui	s6,%hi(.LANCHOR1+400)
	lui	s10,%hi(.LANCHOR0+400)
	lui	s2,%hi(.LANCHOR1)
	sw	s0,1144(sp)
	sw	s4,1128(sp)
	sw	s5,1124(sp)
	sw	s9,1108(sp)
	sw	s7,1116(sp)
	sw	s11,1100(sp)
	sw	a0,8(sp)
	addi	s1,s1,%lo(.LANCHOR0)
	sw	a5,4(sp)
	addi	s8,s8,%lo(heap+8192)
	addi	s6,s6,%lo(.LANCHOR1+400)
	addi	s10,s10,%lo(.LANCHOR0+400)
	addi	s2,s2,%lo(.LANCHOR1)
	sw	zero,0(sp)
	lui	s4,%hi(heap_ptr)
	lui	s9,%hi(the_list)
	lui	s3,%hi(heap_requested)
	addi	s5, zero, 1
	addi	s0,sp,28
.L1812:
	addi	a2, s2, 0
	addi	a4, s2, 0
	addi	a5, s1, 0
.L1814:
	lw	a3,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a5)
	bne	s10,a5,.L1814
	addi	a5, zero, 100
	sw	zero,28(sp)
	sw	a5,432(sp)
	addi	a7, a5, 0
	addi	a6, zero, 0
	addi	t1, zero, 0
	addi	t3, zero, 2
	addi	t4,sp,432
.L1836:
	sub	a5,a7,a6
	addi	t5, t1, 0
.L1969:
	bge	t3, a5, .L1815
.L1974:
	addi	a3,a7,-1
	slli	a1,a6,2
	addi	a5,a6,1
	slli	t1,a3,2
	add	t6,s1,a1
	bge	a5,a3,.L1972
.L1816:
	lw	a0,0(t6)
	blt	a3,a5,.L1818
	slli	a4,a5,2
	add	a4,s1,a4
	jal	zero, .L1830
.L1819:
	addi	a5,a5,1
	addi	a4,a4,4
	blt	a3, a5, .L1818
.L1830:
	lw	t0,0(a4)
	bge	a0, t0, .L1819
	blt	a3, a5, .L1818
	add	t1,s1,t1
.L1820:
	lw	a4,0(t1)
	blt	a4,a0,.L1973
	addi	a3,a3,-1
	addi	t1,t1,-4
	bge	a3,a5,.L1820
.L1822:
	slli	a5,a3,2
	add	a5,s1,a5
	lw	a4,0(a5)
	add	a1,s1,a1
	sw	a0,0(a5)
	sw	a4,0(a1)
	sub	a5,a3,a6
	addi	a1, a3, 0
.L1829:
	bge	s5, a5, .L1817
	sub	a4,a7,a1
	bge	s5, a4, .L1902
	addi	a4,a4,-1
	addi	a1,a1,1
	bge	a5, a4, .L1832
	slli	a4,t5,2
	add	a0,t4,a4
	add	a4,s0,a4
	sw	a7,0(a0)
	sw	a1,0(a4)
	addi	t5,t5,1
	addi	a7, a3, 0
	blt	t3, a5, .L1974
.L1815:
	beq	a5,t3,.L1975
.L1834:
	bge	zero, t5, .L1835
.L1977:
	addi	t1,t5,-1
	slli	a5,t1,2
	add	a4,s0,a5
	add	a5,t4,a5
	lw	a6,0(a4)
	lw	a7,0(a5)
	jal	zero, .L1836
.L1818:
	add	a4,s1,t1
	lw	a5,0(a4)
	add	a1,s1,a1
	sw	a0,0(a4)
	sw	a5,0(a1)
	addi	a1, a3, 0
	sub	a5,a3,a6
	jal	zero, .L1829
.L1973:
	blt	a3, a5, .L1822
	bge	a5,a3,.L1900
	slli	t1,a3,2
	add	t0,s1,t1
	slli	a4,a5,2
	lw	a0,0(t0)
	add	a4,s1,a4
	lw	t2,0(a4)
	sw	a0,0(a4)
	addi	a0,a5,2
	sw	t2,0(t0)
	addi	a4,a5,1
	blt	a0,a3,.L1976
	blt	a4, a3, .L1826
	addi	a4, a5, 0
.L1826:
	addi	a5, a4, 0
	jal	zero, .L1816
.L1976:
	addi	a3,a3,-1
	bge	a4, a3, .L1958
	slli	t1,a3,2
	addi	a5, a4, 0
	jal	zero, .L1816
.L1900:
	addi	a1, a3, 0
	addi	a3, a5, 0
	sub	a5,a3,a6
	jal	zero, .L1829
.L1972:
	addi	a1, a3, 0
.L1817:
	addi	a6,a1,1
	sub	a5,a7,a6
	jal	zero, .L1969
.L1902:
	addi	a7, a3, 0
	jal	zero, .L1969
.L1832:
	slli	a5,t5,2
	add	a4,s0,a5
	add	a5,t4,a5
	sw	a6,0(a4)
	sw	a3,0(a5)
	addi	t5,t5,1
	sub	a5,a7,a1
	addi	a6, a1, 0
	jal	zero, .L1969
.L1975:
	addi	a5,a7,-1
	slli	a5,a5,2
	slli	a4,a6,2
	add	a5,s1,a5
	add	a4,s1,a4
	lw	a1,0(a5)
	lw	a3,0(a4)
	bge	a1, a3, .L1834
	sw	a1,0(a4)
	sw	a3,0(a5)
	blt	zero, t5, .L1977
.L1835:
	lw	a5,4(sp)
	lw	s11,4(sp)
	sw	zero,%lo(the_list)(s9)
	sw	a5,%lo(heap_ptr)(s4)
	lui	a5,%hi(heap_end)
	sw	s8,%lo(heap_end)(a5)
	addi	a4, s2, 0
	addi	s7, zero, 0
	addi	a3, zero, 0
	jal	zero, .L1840
.L1838:
	lw	a1,8(a3)
	sw	a3,4(a5)
	sw	a1,8(a5)
	sw	a5,8(a3)
	lw	a3,8(a5)
	beq	a3,zero,.L1839
	sw	a5,4(a3)
.L1839:
	addi	a4,a4,4
	addi	a3, zero, 1
	beq	s6,a4,.L1978
.L1840:
	addi	a5, s11, 0
	addi	s11,s11,12
	addi	s7,s7,12
	bltu	s8, s11, .L1837
	lw	a1,0(a4)
	lw	a3,%lo(the_list)(s9)
	sw	a1,0(a5)
	bne	a3,zero,.L1838
	sw	a5,%lo(the_list)(s9)
	sw	zero,8(a5)
	sw	zero,4(a5)
	addi	a4,a4,4
	addi	a3, zero, 1
	bne	s6,a4,.L1840
.L1978:
	addi	a0,s9,%lo(the_list)
	sw	a2,12(sp)
	sw	s7,%lo(heap_requested)(s3)
	sw	s11,%lo(heap_ptr)(s4)
.Lpcrel_152:
	auipc	ra, %pcrel_hi(sglib_dllist_sort)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_152)
	lw	a5,%lo(the_list)(s9)
	sw	zero,20(sp)
	lw	a2,12(sp)
	beq	a5,zero,.L1844
.L1841:
	addi	a4, a5, 0
	lw	a5,8(a5)
	bne	a5,zero,.L1841
.L1843:
	lw	a5,20(sp)
	lw	a4,4(a4)
	addi	a5,a5,1
	sw	a5,20(sp)
	bne	a4,zero,.L1843
.L1844:
	addi	a4,s1,480
	addi	a5, s10, 0
.L1842:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L1842
	lui	t1, 838861
	addi	t1,t1,-819
	addi	a0, s2, 0
	addi	a7, zero, 0
.L1850:
	lw	a1,0(a0)
	mulhu	a5,a1,t1
	srli	a5,a5,4
	slli	a3,a5,2
	add	a3,a3,a5
	slli	a3,a3,2
	sub	a3,a1,a3
	slli	a3,a3,2
	add	a3,s10,a3
	lw	a6,0(a3)
	addi	a5, a6, 0
	bne	a6,zero,.L1845
	jal	zero, .L1846
.L1847:
	lw	a5,4(a5)
	beq	a5,zero,.L1846
.L1845:
	lw	a4,0(a5)
	bne	a1,a4,.L1847
	addi	a0,a0,4
	bne	s6,a0,.L1850
.L1980:
	beq	a7,zero,.L1851
	sw	s7,%lo(heap_requested)(s3)
	sw	s11,%lo(heap_ptr)(s4)
.L1851:
	lw	a5,400(s1)
	beq	a5,zero,.L1852
	lui	a0,%hi(.LANCHOR0+404)
	lw	a4,4(a5)
	addi	a0,a0,%lo(.LANCHOR0+404)
	addi	a5, zero, 0
.L1853:
	addi	a1, zero, 19
.L1860:
	lw	a3,20(sp)
	addi	a3,a3,1
	sw	a3,20(sp)
	beq	a4,zero,.L1857
.L1979:
	lw	a3,20(sp)
	lw	a4,4(a4)
	addi	a3,a3,1
	sw	a3,20(sp)
	bne	a4,zero,.L1979
.L1857:
	slli	a4,a5,2
	add	a4,a0,a4
.L1859:
	addi	a5,a5,1
	blt	a1, a5, .L1856
	lw	a3,0(a4)
	addi	a4,a4,4
	beq	a3,zero,.L1859
	lw	a4,4(a3)
	jal	zero, .L1860
.L1846:
	addi	a5,s11,8
	addi	s7,s7,8
	bltu	s8, a5, .L1849
	sw	a1,0(s11)
	sw	a6,4(s11)
	sw	s11,0(a3)
	addi	a0,a0,4
	addi	a7, zero, 1
	addi	s11, a5, 0
	bne	s6,a0,.L1850
	jal	zero, .L1980
.L1856:
	lui	a7, 166111
	addi	a7,a7,203
	addi	a4, s2, 0
	addi	a5, zero, 0
	addi	t1, zero, 101
.L1861:
	addi	a3,a5,1
	mulh	a1,a3,a7
	lw	a6,0(a4)
	slli	a5,a5,2
	add	a5,s0,a5
	srai	a0,a3,31
	sw	a6,0(a5)
	addi	a4,a4,4
	srai	a5,a1,4
	sub	a5,a5,a0
	mul	a5,a5,t1
	sub	a5,a3,a5
	bne	s6,a4,.L1861
	lui	a3, 166111
	addi	a3,a3,203
	addi	a4, zero, 0
	addi	a6, zero, 101
	beq	a5,zero,.L1865
.L1863:
	addi	a1,a4,1
	mulh	a0,a1,a3
	slli	a4,a4,2
	add	a4,s0,a4
	lw	t1,0(a4)
	lw	a4,20(sp)
	srai	a7,a1,31
	add	a4,a4,t1
	sw	a4,20(sp)
	srai	a4,a0,4
	sub	a4,a4,a7
	mul	a4,a4,a6
	sub	a4,a1,a4
	bne	a4,a5,.L1863
.L1865:
	addi	t1,s2,4
	addi	a7, s0, 0
	addi	a6, zero, 0
	addi	a1, zero, 14
	addi	t3, zero, 99
.L1864:
	sw	a1,0(a7)
	addi	a5, a6, 0
	bne	a6,zero,.L1866
	jal	zero, .L1868
.L1871:
	slli	a5,a5,2
	add	a5,s0,a5
	sw	a1,0(a4)
	sw	a0,0(a5)
	beq	a3,zero,.L1870
	lw	a1,0(a4)
	addi	a5, a3, 0
.L1866:
	srai	a3,a5,1
	slli	a4,a3,2
	add	a4,s0,a4
	lw	a0,0(a4)
	blt	a0,a1,.L1871
.L1870:
	beq	a6,t3,.L1981
.L1868:
	lw	a1,0(t1)
	addi	a7,a7,4
	addi	a6,a6,1
	addi	t1,t1,4
	jal	zero, .L1864
.L1981:
	addi	a7,s0,396
	addi	a0, zero, 100
	jal	zero, .L1877
.L1872:
	addi	a7,a7,-4
	beq	a0,zero,.L1982
.L1877:
	lw	a5,20(sp)
	lw	a4,28(sp)
	lw	a6,0(a7)
	addi	a0,a0,-1
	add	a5,a5,a4
	sw	a5,20(sp)
	sw	a6,28(sp)
	addi	a5, zero, 0
.L1876:
	slli	a4,a5,1
	addi	a3,a4,1
	bge	a3, a0, .L1872
	slli	a1,a3,2
	add	a1,s0,a1
	lw	a1,0(a1)
	addi	a4,a4,2
	blt	a6,a1,.L1873
	bge	a4, a0, .L1872
	slli	a3,a4,2
	add	a3,s0,a3
	lw	a1,0(a3)
	blt	a1, a6, .L1872
	bge	a6,a1,.L1872
	addi	a3, a4, 0
.L1875:
	beq	a5,a3,.L1872
	slli	a5,a5,2
	add	a5,s0,a5
	slli	a4,a3,2
	sw	a1,0(a5)
	add	a5,s0,a4
	sw	a6,0(a5)
	addi	a5, a3, 0
	jal	zero, .L1876
.L1873:
	bge	a4, a0, .L1875
	slli	t1,a4,2
	add	t1,s0,t1
	lw	t1,0(t1)
	blt	t1, a1, .L1875
	bge	a1,t1,.L1875
	addi	a1, t1, 0
	addi	a3, a4, 0
	jal	zero, .L1875
.L1982:
	sw	zero,24(sp)
	addi	a3, zero, 14
	addi	s11, zero, 4
	addi	s7, a2, 0
.L1878:
	lw	a1,%lo(heap_ptr)(s4)
	lw	a5,%lo(heap_requested)(s3)
	andi	a4,a1,3
	addi	a2,a1,16
	addi	a5,a5,16
	beq	a4,zero,.L1883
	sub	a4,s11,a4
	add	a2,a2,a4
	add	a5,a5,a4
.L1883:
	sw	a5,%lo(heap_requested)(s3)
	bltu	s8, a2, .L1884
	sw	a3,0(a1)
	sw	zero,12(a1)
	sw	zero,8(a1)
	addi	a0,sp,24
	sw	a2,%lo(heap_ptr)(s4)
.Lpcrel_153:
	auipc	ra, %pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_153)
	lw	a1,24(sp)
	addi	s7,s7,4
	sb	zero,4(a1)
	beq	s6,s7,.L1885
.L1970:
	addi	a4, a1, 0
	lw	a3,0(s7)
	lw	a5,0(a4)
	sub	a5,a3,a5
	blt	a5,zero,.L1983
.L1879:
	beq	a5,zero,.L1881
	lw	a4,12(a4)
	beq	a4,zero,.L1878
.L1971:
	lw	a5,0(a4)
	sub	a5,a3,a5
	bge	a5,zero,.L1879
.L1983:
	lw	a4,8(a4)
	bne	a4,zero,.L1971
	jal	zero, .L1878
.L1881:
	addi	s7,s7,4
	bne	s6,s7,.L1970
.L1885:
	lui	a5, 16
	addi	a5,a5,1
	sw	a5,1076(sp)
	addi	a5, zero, 1
	sw	zero,1080(sp)
	sw	zero,1084(sp)
	sb	zero,436(sp)
	sw	a1,564(sp)
	addi	a2, a5, 0
	addi	a7, zero, 0
	addi	a0,sp,1088
	addi	a6,sp,436
.L1887:
	lw	a3,8(a1)
	addi	a4, zero, 0
.L1894:
	beq	a3,zero,.L1889
	slli	a4,a2,2
	add	a4,a4,a6
	sw	a3,128(a4)
	add	a2,a2,sp
	sb	zero,436(a2)
	addi	a5,a5,1
	lbu	a4,-652(a0)
	slli	a5,a5,16
	srai	a5,a5,16
	addi	a7, zero, 1
.L1889:
	addi	a4,a4,1
	sb	a4,-652(a0)
	bge	zero, a5, .L1890
.L1985:
	addi	a3,a5,-1
	addi	a4,a3,1072
	addi	a2,sp,16
	add	a0,a4,a2
	lbu	a4,-652(a0)
	addi	a2, a5, 0
	beq	a4,s5,.L1891
	bgeu	s5, a4, .L1984
	slli	a5,a3,16
	srai	a5,a5,16
	addi	a7, zero, 1
	blt	zero, a5, .L1985
.L1890:
	lw	a5,0(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	lw	a4,0(sp)
	lw	a5,8(sp)
	bne	a5,a4,.L1812
.L1986:
	lw	s0,1144(sp)
	lw	s1,1140(sp)
	lw	s2,1136(sp)
	lw	s3,1132(sp)
	lw	s4,1128(sp)
	lw	s5,1124(sp)
	lw	s6,1120(sp)
	lw	s7,1116(sp)
	lw	s8,1112(sp)
	lw	s9,1108(sp)
	lw	s10,1104(sp)
	lw	s11,1100(sp)
.L1813:
	lw	ra,1148(sp)
	lw	a0,20(sp)
	addi	sp,sp,1152
	jalr	zero, ra, 0
.L1984:
	slli	a4,a5,2
	add	a4,a4,sp
	lw	a1,560(a4)
	jal	zero, .L1887
.L1891:
	slli	a3,a5,2
	add	a3,a3,a6
	lw	a3,124(a3)
	bne	a3,zero,.L1893
	lw	a3,12(zero)
	jal	zero, .L1894
.L1852:
	addi	a0,s10,4
	addi	a4, a0, 0
	addi	a1, zero, 20
.L1854:
	addi	a5,a5,1
	beq	a5,a1,.L1856
	lw	a3,0(a4)
	addi	a4,a4,4
	beq	a3,zero,.L1854
	lw	a4,4(a3)
	jal	zero, .L1853
.L1893:
	beq	a7,zero,.L1895
	sh	a5,1076(sp)
.L1895:
	sw	a3,432(sp)
.L1896:
	lw	a4,0(a3)
	lw	a5,20(sp)
	addi	a0,sp,432
	add	a5,a5,a4
	sw	a5,20(sp)
.Lpcrel_154:
	auipc	ra, %pcrel_hi(sglib__rbtree_it_compute_current_elem)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_154)
	lw	a3,432(sp)
	bne	a3,zero,.L1896
	lw	a5,0(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	lw	a4,0(sp)
	lw	a5,8(sp)
	bne	a5,a4,.L1812
	jal	zero, .L1986
.L1958:
	addi	a1, a3, 0
	sub	a5,a4,a6
	addi	a3, a4, 0
	jal	zero, .L1829
.L1849:
	sw	s7,%lo(heap_requested)(s3)
	beq	a7,zero,.L1884
	sw	s11,%lo(heap_ptr)(s4)
.L1884:
	sw	zero,0(zero)
	ebreak
.L1837:
	sw	s7,%lo(heap_requested)(s3)
	beq	a3,zero,.L1884
	sw	a5,%lo(heap_ptr)(s4)
	jal	zero, .L1884
	.size	benchmark_body, .-benchmark_body
	.align	2
	.globl	sglib__rbtree_it_init
	.type	sglib__rbtree_it_init, @function
sglib__rbtree_it_init:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	ra,28(sp)
	sh	a2,646(a0)
	sw	a3,652(a0)
	sw	a4,648(a0)
	addi	s3, a0, 0
	addi	s4, a2, 0
	addi	s0, a1, 0
	beq	a4,zero,.L1988
	sw	s1,20(sp)
	sw	s2,16(sp)
	addi	s1, a4, 0
	addi	s2, a3, 0
	beq	a3,zero,.L1989
.L1999:
	beq	s0,zero,.L2018
.L1990:
	addi	a1, s0, 0
	addi	a0, s1, 0
	jalr	s2
	blt	a0,zero,.L2022
	beq	a0,zero,.L2020
	lw	s0,12(s0)
	bne	s0,zero,.L1990
.L2018:
	lw	s1,20(sp)
	lw	s2,16(sp)
.L1992:
	lw	ra,28(sp)
	lw	s0,24(sp)
	sh	zero,644(s3)
	sw	zero,0(s3)
	lw	s4,8(sp)
	lw	s3,12(sp)
	addi	a0, zero, 0
	addi	sp,sp,32
	jalr	zero, ra, 0
.L2022:
	lw	s0,8(s0)
	jal	zero, .L1999
.L1988:
	beq	a1,zero,.L1992
	addi	a5, zero, 1
	sb	zero,4(s3)
	sw	s0,132(s3)
	sh	a5,644(s3)
	bne	s4,zero,.L2000
.L2024:
	sw	s0,0(s3)
	lw	ra,28(sp)
	addi	a0, s0, 0
	lw	s0,24(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L2000:
	addi	a0, s3, 0
.Lpcrel_155:
	auipc	ra, %pcrel_hi(sglib__rbtree_it_compute_current_elem)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_155)
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	a0,0(s3)
	lw	s4,8(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L1989:
	beq	a1,zero,.L2018
	lw	a4,0(a4)
	lw	a5,0(s0)
	sub	a5,a4,a5
	blt	a5,zero,.L2023
.L1993:
	beq	a5,zero,.L2020
	lw	s0,12(s0)
	beq	s0,zero,.L2018
.L2021:
	lw	a5,0(s0)
	sub	a5,a4,a5
	bge	a5,zero,.L1993
.L2023:
	lw	s0,8(s0)
	bne	s0,zero,.L2021
	jal	zero, .L2018
.L2020:
	addi	a5, zero, 1
	lw	s1,20(sp)
	lw	s2,16(sp)
	sb	zero,4(s3)
	sw	s0,132(s3)
	sh	a5,644(s3)
	beq	s4,zero,.L2024
	jal	zero, .L2000
	.size	sglib__rbtree_it_init, .-sglib__rbtree_it_init
	.align	2
	.globl	sglib_rbtree_it_init
	.type	sglib_rbtree_it_init, @function
sglib_rbtree_it_init:
	addi	a7, zero, 2
	sw	zero,648(a0)
	sw	zero,652(a0)
	sh	a7,646(a0)
	addi	a4, a0, 0
	beq	a1,zero,.L2043
	addi	a3, zero, 1
	addi	a5, a3, 0
	sh	a3,644(a0)
	addi	a6, a3, 0
	sw	a1,132(a0)
	sb	zero,4(a0)
	sw	zero,0(a0)
	addi	a3, zero, 0
	addi	a2, zero, 0
.L2028:
	bltu	a6, a3, .L2035
	slli	a1,a5,2
	add	a1,a4,a1
	lw	a0,128(a1)
	bne	a3,zero,.L2030
	lw	a0,8(a0)
	beq	a0,zero,.L2044
.L2032:
	addi	t1,a5,1
	add	a3,a4,a5
	sw	a0,132(a1)
	slli	a5,t1,16
	sb	zero,4(a3)
	srai	a5,a5,16
	add	a2,a4,a2
	sh	a5,644(a4)
	lbu	a3,4(a2)
.L2033:
	addi	a3,a3,1
	sb	a3,4(a2)
	bge	zero, a5, .L2045
.L2034:
	addi	a2,a5,-1
	add	a3,a4,a2
	lbu	a3,4(a3)
	bne	a3,a7,.L2028
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,128(a5)
	sw	a0,0(a4)
	bne	a0,zero,.L2046
.L2035:
	slli	a5,a2,16
	srai	a5,a5,16
	sh	a5,644(a4)
	blt	zero, a5, .L2034
.L2045:
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L2030:
	lw	a0,12(a0)
	bne	a0,zero,.L2032
.L2044:
	lh	a5,644(a4)
	add	a2,a4,a2
	jal	zero, .L2033
.L2043:
	sh	zero,644(a0)
	sw	zero,0(a0)
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L2046:
	jalr	zero, ra, 0
	.size	sglib_rbtree_it_init, .-sglib_rbtree_it_init
	.align	2
	.globl	sglib_rbtree_it_init_preorder
	.type	sglib_rbtree_it_init_preorder, @function
sglib_rbtree_it_init_preorder:
	sh	zero,646(a0)
	sw	zero,648(a0)
	sw	zero,652(a0)
	addi	a4, zero, 0
	beq	a1,zero,.L2048
	sb	zero,4(a0)
	sw	a1,132(a0)
	addi	a4, zero, 1
.L2048:
	sw	a1,0(a0)
	sh	a4,644(a0)
	addi	a0, a1, 0
	jalr	zero, ra, 0
	.size	sglib_rbtree_it_init_preorder, .-sglib_rbtree_it_init_preorder
	.align	2
	.globl	sglib_rbtree_it_init_inorder
	.type	sglib_rbtree_it_init_inorder, @function
sglib_rbtree_it_init_inorder:
	addi	a3, zero, 1
	sw	zero,648(a0)
	sw	zero,652(a0)
	sh	a3,646(a0)
	addi	a4, a0, 0
	beq	a1,zero,.L2065
	addi	a5, a3, 0
	sh	a3,644(a0)
	addi	a6, a3, 0
	sw	a1,132(a0)
	sb	zero,4(a0)
	sw	zero,0(a0)
	addi	a3, zero, 0
	addi	a2, zero, 0
.L2054:
	bgeu	a6, a3, .L2066
	slli	a5,a2,16
	srai	a5,a5,16
	sh	a5,644(a4)
	bge	zero, a5, .L2067
.L2058:
	addi	a2,a5,-1
	add	a3,a4,a2
	lbu	a3,4(a3)
	bne	a3,a6,.L2054
	slli	a1,a5,2
	add	a1,a4,a1
	lw	a0,128(a1)
	sw	a0,0(a4)
	bne	a0,zero,.L2068
	slli	a1,a5,2
	add	a1,a4,a1
	lw	a0,128(a1)
	lw	a0,12(a0)
	beq	a0,zero,.L2069
.L2056:
	addi	a7,a5,1
	add	a3,a4,a5
	sw	a0,132(a1)
	slli	a5,a7,16
	sb	zero,4(a3)
	srai	a5,a5,16
	add	a2,a4,a2
	sh	a5,644(a4)
	lbu	a3,4(a2)
.L2057:
	addi	a3,a3,1
	sb	a3,4(a2)
	blt	zero, a5, .L2058
.L2067:
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L2066:
	slli	a1,a5,2
	add	a1,a4,a1
	lw	a0,128(a1)
	addi	a3, zero, 0
	lw	a0,8(a0)
	bne	a0,zero,.L2056
.L2069:
	lh	a5,644(a4)
	add	a2,a4,a2
	jal	zero, .L2057
.L2065:
	sh	zero,644(a0)
	sw	zero,0(a0)
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L2068:
	jalr	zero, ra, 0
	.size	sglib_rbtree_it_init_inorder, .-sglib_rbtree_it_init_inorder
	.align	2
	.globl	sglib_rbtree_it_init_postorder
	.type	sglib_rbtree_it_init_postorder, @function
sglib_rbtree_it_init_postorder:
	addi	a7, zero, 2
	sw	zero,648(a0)
	sw	zero,652(a0)
	sh	a7,646(a0)
	addi	a4, a0, 0
	beq	a1,zero,.L2088
	addi	a3, zero, 1
	addi	a5, a3, 0
	sh	a3,644(a0)
	addi	a6, a3, 0
	sw	a1,132(a0)
	sb	zero,4(a0)
	sw	zero,0(a0)
	addi	a3, zero, 0
	addi	a2, zero, 0
.L2073:
	bltu	a6, a3, .L2080
	slli	a1,a5,2
	add	a1,a4,a1
	lw	a0,128(a1)
	bne	a3,zero,.L2075
	lw	a0,8(a0)
	beq	a0,zero,.L2089
.L2077:
	addi	t1,a5,1
	add	a3,a4,a5
	sw	a0,132(a1)
	slli	a5,t1,16
	sb	zero,4(a3)
	srai	a5,a5,16
	add	a2,a4,a2
	sh	a5,644(a4)
	lbu	a3,4(a2)
.L2078:
	addi	a3,a3,1
	sb	a3,4(a2)
	bge	zero, a5, .L2090
.L2079:
	addi	a2,a5,-1
	add	a3,a4,a2
	lbu	a3,4(a3)
	bne	a3,a7,.L2073
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,128(a5)
	sw	a0,0(a4)
	bne	a0,zero,.L2091
.L2080:
	slli	a5,a2,16
	srai	a5,a5,16
	sh	a5,644(a4)
	blt	zero, a5, .L2079
.L2090:
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L2075:
	lw	a0,12(a0)
	bne	a0,zero,.L2077
.L2089:
	lh	a5,644(a4)
	add	a2,a4,a2
	jal	zero, .L2078
.L2088:
	sh	zero,644(a0)
	sw	zero,0(a0)
	addi	a0, zero, 0
	jalr	zero, ra, 0
.L2091:
	jalr	zero, ra, 0
	.size	sglib_rbtree_it_init_postorder, .-sglib_rbtree_it_init_postorder
	.align	2
	.globl	sglib_rbtree_it_init_on_equal
	.type	sglib_rbtree_it_init_on_equal, @function
sglib_rbtree_it_init_on_equal:
	addi	sp,sp,-16
	addi	a4, a3, 0
	addi	a3, a2, 0
	addi	a2, zero, 1
	sw	ra,12(sp)
.Lpcrel_156:
	auipc	ra, %pcrel_hi(sglib__rbtree_it_init)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_156)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	sglib_rbtree_it_init_on_equal, .-sglib_rbtree_it_init_on_equal
	.align	2
	.globl	sglib_rbtree_it_current
	.type	sglib_rbtree_it_current, @function
sglib_rbtree_it_current:
	lw	a0,0(a0)
	jalr	zero, ra, 0
	.size	sglib_rbtree_it_current, .-sglib_rbtree_it_current
	.align	2
	.globl	sglib_rbtree_it_next
	.type	sglib_rbtree_it_next, @function
sglib_rbtree_it_next:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	a0,12(sp)
.Lpcrel_157:
	auipc	ra, %pcrel_hi(sglib__rbtree_it_compute_current_elem)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_157)
	lw	a0,12(sp)
	lw	ra,28(sp)
	lw	a0,0(a0)
	addi	sp,sp,32
	jalr	zero, ra, 0
	.size	sglib_rbtree_it_next, .-sglib_rbtree_it_next
	.align	2
	.globl	sglib___rbtree_consistency_check
	.type	sglib___rbtree_consistency_check, @function
sglib___rbtree_consistency_check:
	addi	sp,sp,-48
	addi	a5, zero, -1
	sw	ra,44(sp)
	sw	a5,28(sp)
	beq	a0,zero,.L2097
	lbu	a2,4(a0)
	addi	a3, zero, 1
	lw	a4,8(a0)
	addi	a5, a0, 0
	beq	a2,a3,.L2156
	beq	a4,zero,.L2109
	sw	s0,40(sp)
	lbu	a1,4(a4)
	lw	a6,8(a4)
	beq	a1,a3,.L2157
	addi	s0,sp,28
	sw	a0,4(sp)
	addi	a1, s0, 0
	addi	a0, a6, 0
	sw	a4,0(sp)
.Lpcrel_158:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.2)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_158)
	lw	a4,0(sp)
	lw	a5,4(sp)
	addi	a3, zero, 1
	lw	a4,12(a4)
	beq	a4,zero,.L2158
	lbu	a2,4(a4)
	lw	a6,8(a4)
	beq	a2,a3,.L2159
	beq	a6,zero,.L2160
	lbu	a2,4(a6)
	sw	a5,8(sp)
	sw	a6,4(sp)
	sw	a4,0(sp)
	lw	a0,8(a6)
	beq	a2,a3,.L2161
	addi	a2, zero, 4
	addi	a1, s0, 0
.Lpcrel_159:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_159)
	lw	a6,4(sp)
	addi	a1, s0, 0
	addi	a2, zero, 4
	lw	a0,12(a6)
.Lpcrel_160:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_160)
	lw	a5,8(sp)
	lw	a4,0(sp)
.L2117:
	lw	a4,12(a4)
	beq	a4,zero,.L2162
.L2118:
	lbu	a2,4(a4)
	addi	a3, zero, 1
	sw	a5,4(sp)
	sw	a4,0(sp)
	lw	a0,8(a4)
	beq	a2,a3,.L2163
	addi	a2, zero, 4
	addi	a1, s0, 0
.Lpcrel_161:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_161)
	lw	a4,0(sp)
	addi	a1, s0, 0
	addi	a2, zero, 4
	lw	a0,12(a4)
.Lpcrel_162:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_162)
	lw	a5,4(sp)
	jal	zero, .L2111
.L2156:
	sw	a0,0(sp)
	addi	a1,sp,28
	addi	a0, a4, 0
.Lpcrel_163:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_163)
	lw	a5,0(sp)
	addi	a1,sp,28
	lw	a0,12(a5)
.Lpcrel_164:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_164)
.L2097:
	lw	ra,44(sp)
	addi	sp,sp,48
	jalr	zero, ra, 0
.L2158:
	lw	a4,28(sp)
	blt	a4,zero,.L2164
.L2151:
	lw	s0,40(sp)
.L2102:
	lw	a5,12(a5)
	beq	a5,zero,.L2097
	lbu	a3,4(a5)
	addi	a2, zero, 1
	lw	a4,8(a5)
	beq	a3,a2,.L2165
.L2121:
	addi	a0, a4, 0
	addi	a1,sp,28
	sw	a5,0(sp)
.Lpcrel_165:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.2)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_165)
	lw	a5,0(sp)
	addi	a1,sp,28
	lw	a0,12(a5)
.Lpcrel_166:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.2)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_166)
	lw	ra,44(sp)
	addi	sp,sp,48
	jalr	zero, ra, 0
.L2157:
	beq	a6,zero,.L2166
	lbu	a2,4(a6)
	lw	a0,8(a6)
	beq	a2,a1,.L2167
	addi	s0,sp,28
	addi	a1, s0, 0
	addi	a2, zero, 2
	sw	a5,8(sp)
	sw	a4,0(sp)
	sw	a6,4(sp)
.Lpcrel_167:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_167)
	lw	a6,4(sp)
	addi	a1, s0, 0
	addi	a2, zero, 2
	lw	a0,12(a6)
.Lpcrel_168:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_168)
	lw	a5,8(sp)
	lw	a4,0(sp)
.L2108:
	lw	a4,12(a4)
	beq	a4,zero,.L2168
.L2106:
	lbu	a2,4(a4)
	addi	a3, zero, 1
	lw	a0,8(a4)
	beq	a2,a3,.L2169
	sw	a5,4(sp)
	sw	a4,0(sp)
.L2155:
	addi	a2, zero, 2
	addi	a1, s0, 0
.Lpcrel_169:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_169)
	lw	a4,0(sp)
	addi	a1, s0, 0
	addi	a2, zero, 2
	lw	a0,12(a4)
.Lpcrel_170:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_170)
	lw	a5,4(sp)
.L2111:
	lw	a5,12(a5)
	lw	s0,40(sp)
	beq	a5,zero,.L2097
	lbu	a3,4(a5)
	addi	a2, zero, 1
	lw	a4,8(a5)
	bne	a3,a2,.L2121
.L2165:
	sw	s0,40(sp)
	beq	a4,zero,.L2170
	lbu	a2,4(a4)
	lw	a0,8(a4)
	beq	a2,a3,.L2171
	addi	s0,sp,28
	addi	a1, s0, 0
	addi	a2, zero, 2
	sw	a5,0(sp)
	sw	a4,4(sp)
.Lpcrel_171:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_171)
	lw	a4,4(sp)
	addi	a1, s0, 0
	addi	a2, zero, 2
	lw	a0,12(a4)
.Lpcrel_172:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_172)
	lw	a5,0(sp)
.L2125:
	lw	a5,12(a5)
	beq	a5,zero,.L2154
.L2127:
	lbu	a2,4(a5)
	addi	a4, zero, 1
	lw	a0,8(a5)
	beq	a2,a4,.L2172
	addi	a1, s0, 0
	addi	a2, zero, 2
	sw	a5,0(sp)
.Lpcrel_173:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_173)
	lw	a5,0(sp)
	addi	a1, s0, 0
	addi	a2, zero, 2
	lw	a0,12(a5)
.Lpcrel_174:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_174)
	lw	s0,40(sp)
	jal	zero, .L2097
.L2168:
	lw	a4,28(sp)
	lw	s0,40(sp)
	bge	a4,zero,.L2102
.L2109:
	addi	a4, zero, 1
	sw	a4,28(sp)
	jal	zero, .L2102
.L2159:
	sw	a5,4(sp)
	sw	a4,0(sp)
	addi	a0, a6, 0
	jal	zero, .L2155
.L2164:
	addi	a4, zero, 2
	lw	s0,40(sp)
	sw	a4,28(sp)
	jal	zero, .L2102
.L2161:
	addi	a2, zero, 3
	addi	a1, s0, 0
.Lpcrel_175:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_175)
	lw	a6,4(sp)
	addi	a1, s0, 0
	addi	a2, zero, 3
	lw	a0,12(a6)
.Lpcrel_176:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_176)
	lw	a4,0(sp)
	lw	a5,8(sp)
	jal	zero, .L2117
.L2170:
	lw	a4,28(sp)
	bge	a4,zero,.L2123
	sw	a3,28(sp)
.L2123:
	lw	a5,12(a5)
	addi	s0,sp,28
	bne	a5,zero,.L2127
.L2154:
	lw	s0,40(sp)
	jal	zero, .L2097
.L2160:
	lw	a3,28(sp)
	bge	a3,zero,.L2115
	addi	a3, zero, 3
	sw	a3,28(sp)
.L2115:
	lw	a4,12(a4)
	bne	a4,zero,.L2118
	jal	zero, .L2151
.L2167:
	addi	s0,sp,28
	addi	a1, s0, 0
	sw	a5,12(sp)
	sw	a4,4(sp)
	sw	a6,8(sp)
	sw	a2,0(sp)
.Lpcrel_177:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_177)
	lw	a6,8(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a6)
.Lpcrel_178:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_178)
	lw	a4,4(sp)
	lw	a5,12(sp)
	jal	zero, .L2108
.L2169:
	addi	a1, s0, 0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
.Lpcrel_179:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_179)
	lw	a4,4(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_180:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_180)
	lw	a5,8(sp)
	jal	zero, .L2111
.L2172:
	addi	a1, s0, 0
	sw	a5,4(sp)
	sw	a2,0(sp)
.Lpcrel_181:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_181)
	lw	a5,4(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a5)
.Lpcrel_182:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_182)
	lw	s0,40(sp)
	jal	zero, .L2097
.L2171:
	addi	s0,sp,28
	addi	a1, s0, 0
	sw	a5,4(sp)
	sw	a4,8(sp)
	sw	a2,0(sp)
.Lpcrel_183:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_183)
	lw	a4,8(sp)
	lw	a2,0(sp)
	addi	a1, s0, 0
	lw	a0,12(a4)
.Lpcrel_184:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_184)
	lw	a5,4(sp)
	jal	zero, .L2125
.L2163:
	addi	a2, zero, 3
	addi	a1, s0, 0
.Lpcrel_185:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_185)
	lw	a4,0(sp)
	addi	a1, s0, 0
	addi	a2, zero, 3
	lw	a0,12(a4)
.Lpcrel_186:
	auipc	ra, %pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_186)
	lw	a5,4(sp)
	jal	zero, .L2111
.L2162:
	lw	a4,28(sp)
	bge	a4,zero,.L2151
	addi	a4, zero, 3
	lw	s0,40(sp)
	sw	a4,28(sp)
	jal	zero, .L2102
.L2166:
	lw	a4,12(a4)
	sw	a1,28(sp)
	addi	s0,sp,28
	bne	a4,zero,.L2106
	jal	zero, .L2151
	.size	sglib___rbtree_consistency_check, .-sglib___rbtree_consistency_check
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a5,%hi(the_list)
	lw	a4,%lo(the_list)(a5)
	beq	a4,zero,.L2174
.L2175:
	addi	a5, a4, 0
	lw	a4,8(a4)
	bne	a4,zero,.L2175
	lw	a3,0(a5)
	bne	a3,a4,.L2183
.L2196:
	lw	a5,4(a5)
	addi	a4,a4,1
	beq	a5,zero,.L2174
	lw	a3,0(a5)
	beq	a3,a4,.L2196
.L2183:
	addi	a5, zero, 0
.L2173:
	addi	a0, a5, 0
	jalr	zero, ra, 0
.L2174:
	lui	a5,%hi(.LANCHOR1)
	addi	t1,a5,%lo(.LANCHOR1)
	lui	a1,%hi(.LANCHOR0)
	lui	a6, 838861
	addi	a2, t1, 0
	addi	a7,t1,400
	addi	a1,a1,%lo(.LANCHOR0)
	addi	a6,a6,-819
.L2180:
	lw	a3,0(a2)
	mulhu	a4,a3,a6
	srli	a4,a4,4
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a5,a3,a5
	slli	a5,a5,2
	add	a5,a1,a5
	lw	a5,400(a5)
	bne	a5,zero,.L2178
	jal	zero, .L2173
.L2179:
	lw	a5,4(a5)
	beq	a5,zero,.L2173
.L2178:
	lw	a4,0(a5)
	bne	a3,a4,.L2179
	addi	a2,a2,4
	bne	a7,a2,.L2180
	lui	a4, 4
	addi	a4,a4,-1334
	addi	a5, zero, 0
	bne	a0,a4,.L2173
	lui	a4,%hi(heap_requested)
	lw	a4,%lo(heap_requested)(a4)
	lui	a2,%hi(heap_end)
	lui	a3,%hi(heap)
	lw	a2,%lo(heap_end)(a2)
	addi	a3,a3,%lo(heap)
	add	a4,a4,a3
	bltu	a2,a4,.L2173
	addi	a5,t1,401
	addi	a3,a1,400
	addi	a4, zero, 0
	jal	zero, .L2182
.L2197:
	lbu	a4,0(a5)
	addi	a5,a5,1
.L2182:
	lbu	a2,0(a1)
	addi	a1,a1,1
	bne	a2,a4,.L2183
	bne	a3,a1,.L2197
	addi	a5, zero, 1
	jal	zero, .L2173
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
.Lpcrel_187:
	auipc	ra, %pcrel_hi(benchmark_body)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_187)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	addi	sp,sp,-16
	addi	a0, zero, 29
	sw	ra,12(sp)
.Lpcrel_188:
	auipc	ra, %pcrel_hi(benchmark_body)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_188)
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
.Lpcrel_189:
	auipc	ra, %pcrel_hi(benchmark_body)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_189)
.Lpcrel_190:
	auipc	ra, %pcrel_hi(start_trigger)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_190)
.Lpcrel_191:
	auipc	ra, %pcrel_hi(benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_191)
	sw	a0,12(sp)
.Lpcrel_192:
	auipc	ra, %pcrel_hi(stop_trigger)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_192)
	lw	a0,12(sp)
.Lpcrel_193:
	auipc	ra, %pcrel_hi(verify_benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_193)
	lw	ra,28(sp)
	xori	a0,a0,1
	addi	sp,sp,32
	jalr	zero, ra, 0
	.size	main, .-main
	.globl	htab
	.globl	the_list
	.globl	array2
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	array, @object
	.size	array, 400
array:
	.word	14
	.word	66
	.word	12
	.word	41
	.word	86
	.word	69
	.word	19
	.word	77
	.word	68
	.word	38
	.word	26
	.word	42
	.word	37
	.word	23
	.word	17
	.word	29
	.word	55
	.word	13
	.word	90
	.word	92
	.word	76
	.word	99
	.word	10
	.word	54
	.word	57
	.word	83
	.word	40
	.word	44
	.word	75
	.word	33
	.word	24
	.word	28
	.word	80
	.word	18
	.word	78
	.word	32
	.word	93
	.word	89
	.word	52
	.word	11
	.word	21
	.word	96
	.word	50
	.word	15
	.word	48
	.word	63
	.word	87
	.word	20
	.word	8
	.word	85
	.word	43
	.word	16
	.word	94
	.word	88
	.word	53
	.word	84
	.word	74
	.word	91
	.word	67
	.word	36
	.word	95
	.word	61
	.word	64
	.word	5
	.word	30
	.word	82
	.word	72
	.word	46
	.word	59
	.word	9
	.word	7
	.word	3
	.word	39
	.word	31
	.word	4
	.word	73
	.word	70
	.word	60
	.word	58
	.word	81
	.word	56
	.word	51
	.word	45
	.word	1
	.word	6
	.word	49
	.word	27
	.word	47
	.word	34
	.word	35
	.word	62
	.word	97
	.word	2
	.word	79
	.word	98
	.word	25
	.word	22
	.word	65
	.word	71
	.word	0
	.type	array_exp.0, @object
	.size	array_exp.0, 400
array_exp.0:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	26
	.word	27
	.word	28
	.word	29
	.word	30
	.word	31
	.word	32
	.word	33
	.word	34
	.word	35
	.word	36
	.word	37
	.word	38
	.word	39
	.word	40
	.word	41
	.word	42
	.word	43
	.word	44
	.word	45
	.word	46
	.word	47
	.word	48
	.word	49
	.word	50
	.word	51
	.word	52
	.word	53
	.word	54
	.word	55
	.word	56
	.word	57
	.word	58
	.word	59
	.word	60
	.word	61
	.word	62
	.word	63
	.word	64
	.word	65
	.word	66
	.word	67
	.word	68
	.word	69
	.word	70
	.word	71
	.word	72
	.word	73
	.word	74
	.word	75
	.word	76
	.word	77
	.word	78
	.word	79
	.word	80
	.word	81
	.word	82
	.word	83
	.word	84
	.word	85
	.word	86
	.word	87
	.word	88
	.word	89
	.word	90
	.word	91
	.word	92
	.word	93
	.word	94
	.word	95
	.word	96
	.word	97
	.word	98
	.word	99
	.bss
	.align	4
	.set	.LANCHOR0,. + 0
	.type	array2, @object
	.size	array2, 400
array2:
	.zero	400
	.type	htab, @object
	.size	htab, 80
htab:
	.zero	80
	.type	heap, @object
	.size	heap, 8192
heap:
	.zero	8192
	.section	.sbss,"aw",@nobits
	.align	2
	.type	the_list, @object
	.size	the_list, 4
the_list:
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