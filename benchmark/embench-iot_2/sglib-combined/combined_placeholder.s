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
	bne	a5,zero,.+8
	jal	x0,.L51
	lbu	a6,4(a5)
	addi	a2,zero,1
	lw	a1,12(a5)
	lw	a3,8(a5)
	bne	a6,a2,.+8
	jal	x0,.L52
	bne	a1,zero,.+8
	jal	x0,.L13
	lbu	a6,4(a1)
	bne	a6,zero,.L14
.L13:
	bne	a3,zero,.+8
	jal	x0,.L15
	lbu	a2,4(a3)
	bne	a2,zero,.+8
	jal	x0,.L15
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
	addi	a0,zero,0
	jalr	zero,ra,0
.L52:
	bne	a3,zero,.+8
	jal	x0,.L53
	lw	a7,12(a3)
	lw	a2,8(a3)
	bne	a7,zero,.+8
	jal	x0,.L47
	lbu	t1,4(a7)
	bne	t1,zero,.+8
	jal	x0,.L47
	bne	t1,a6,.+8
	jal	x0,.L54
	bne	a2,zero,.+8
	jal	x0,.L3
	lbu	a1,4(a2)
.L8:
	addi	a6,zero,1
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
	jal	x0,.L3
.L51:
	sb	zero,4(a4)
	addi	a0,zero,0
	jalr	zero,ra,0
.L14:
	bne	a6,a2,.L16
	bne	a3,zero,.+8
	jal	x0,.L17
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
	jal	x0,.L3
.L15:
	lbu	a0,4(a4)
	addi	a3,zero,1
	sb	zero,4(a4)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	sb	a3,4(a5)
	jalr	zero,ra,0
.L53:
	sw	a5,0(a0)
	sb	zero,4(a5)
	sw	a4,8(a5)
	sw	zero,12(a4)
	jal	x0,.L3
.L47:
	bne	a2,zero,.+8
	jal	x0,.L7
	lbu	a1,4(a2)
	bne	a1,zero,.L8
.L7:
	sw	a5,0(a0)
	sw	a4,8(a5)
	sb	zero,4(a5)
	sw	a3,12(a4)
	addi	a5,zero,1
	sb	a5,4(a3)
	jal	x0,.L3
.L54:
	bne	a2,zero,.+8
	jal	x0,.L12
	lbu	a6,4(a2)
	bne	a6,t1,.+8
	jal	x0,.L48
.L12:
	sw	a3,0(a0)
	sw	a5,12(a3)
	sw	a4,8(a3)
	sw	a1,12(a5)
	sw	a7,8(a5)
	sw	a2,12(a4)
	sb	zero,4(a7)
	jal	x0,.L3
	.size	sglib___rbtree_fix_left_deletion_discrepancy, .-sglib___rbtree_fix_left_deletion_discrepancy
	.align	2
	.type	sglib___rbtree_fix_right_deletion_discrepancy, @function
sglib___rbtree_fix_right_deletion_discrepancy:
	lw	a4,0(a0)
	lw	a5,8(a4)
	bne	a5,zero,.+8
	jal	x0,.L104
	lbu	a6,4(a5)
	addi	a2,zero,1
	lw	a1,8(a5)
	lw	a3,12(a5)
	bne	a6,a2,.+8
	jal	x0,.L105
	bne	a1,zero,.+8
	jal	x0,.L67
	lbu	a6,4(a1)
	bne	a6,zero,.L68
.L67:
	bne	a3,zero,.+8
	jal	x0,.L69
	lbu	a2,4(a3)
	bne	a2,zero,.+8
	jal	x0,.L69
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
	addi	a0,zero,0
	jalr	zero,ra,0
.L105:
	bne	a3,zero,.+8
	jal	x0,.L106
	lw	a7,8(a3)
	lw	a2,12(a3)
	bne	a7,zero,.+8
	jal	x0,.L101
	lbu	t1,4(a7)
	bne	t1,zero,.+8
	jal	x0,.L101
	bne	t1,a6,.+8
	jal	x0,.L107
	bne	a2,zero,.+8
	jal	x0,.L57
	lbu	a1,4(a2)
.L62:
	addi	a6,zero,1
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
	jal	x0,.L57
.L104:
	sb	zero,4(a4)
	addi	a0,zero,0
	jalr	zero,ra,0
.L68:
	bne	a6,a2,.L70
	bne	a3,zero,.+8
	jal	x0,.L71
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
	jal	x0,.L57
.L69:
	lbu	a0,4(a4)
	addi	a3,zero,1
	sb	zero,4(a4)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	sb	a3,4(a5)
	jalr	zero,ra,0
.L106:
	sw	a5,0(a0)
	sb	zero,4(a5)
	sw	a4,12(a5)
	sw	zero,8(a4)
	jal	x0,.L57
.L101:
	bne	a2,zero,.+8
	jal	x0,.L61
	lbu	a1,4(a2)
	bne	a1,zero,.L62
.L61:
	sw	a5,0(a0)
	sw	a4,12(a5)
	sb	zero,4(a5)
	sw	a3,8(a4)
	addi	a5,zero,1
	sb	a5,4(a3)
	jal	x0,.L57
.L107:
	bne	a2,zero,.+8
	jal	x0,.L66
	lbu	a6,4(a2)
	bne	a6,t1,.+8
	jal	x0,.L102
.L66:
	sw	a3,0(a0)
	sw	a5,8(a3)
	sw	a4,12(a3)
	sw	a1,8(a5)
	sw	a7,12(a5)
	sw	a2,8(a4)
	sb	zero,4(a7)
	jal	x0,.L57
	.size	sglib___rbtree_fix_right_deletion_discrepancy, .-sglib___rbtree_fix_right_deletion_discrepancy
	.align	2
	.type	sglib___rbtree_delete_rightmost_leaf, @function
sglib___rbtree_delete_rightmost_leaf:
	lw	a5,0(a0)
	addi	a4,a0,0
	lw	a3,12(a5)
	bne	a3,zero,.+8
	jal	x0,.L143
	lw	a6,12(a3)
	addi	sp,sp,-32
	sw	ra,28(sp)
	bne	a6,zero,.+8
	jal	x0,.L144
	lw	a0,12(a6)
	bne	a0,zero,.+8
	jal	x0,.L145
	lw	a7,12(a0)
	bne	a7,zero,.+8
	jal	x0,.L146
	addi	a0,a0,12
	sw	a4,12(sp)
	sw	a6,8(sp)
	sw	a5,4(sp)
	sw	a3,0(sp)
.Lpcrel_1:
	auipc	ra,%pcrel_hi(sglib___rbtree_delete_rightmost_leaf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
	lw	a6,8(sp)
	lw	a4,12(sp)
	bne	a0,zero,.L147
.L117:
	addi	a0,zero,0
.L148:
	lw	ra,28(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L144:
	sw	a3,0(a1)
	lw	a2,8(a3)
	bne	a2,zero,.+8
	jal	x0,.L114
	lbu	a3,4(a3)
	bne	a3,zero,.L115
	lbu	a3,4(a2)
	bne	a3,zero,.L115
	sw	a2,12(a5)
	jal	x0,.L116
.L143:
	sw	a5,0(a1)
	lw	a3,8(a5)
	bne	a3,zero,.+8
	jal	x0,.L110
	lbu	a5,4(a5)
	addi	a0,zero,0
	bne	a5,zero,.L111
	lbu	a0,4(a3)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
.L111:
	sb	zero,4(a3)
	sw	a3,0(a4)
	jalr	zero,ra,0
.L145:
	sw	a6,0(a1)
	lw	a2,8(a6)
	bne	a2,zero,.+8
	jal	x0,.L120
	lbu	a1,4(a6)
	bne	a1,zero,.L121
	lbu	a1,4(a2)
	bne	a1,zero,.L121
	sw	a2,12(a3)
	jal	x0,.L122
.L114:
	sw	zero,12(a5)
	lbu	a5,4(a3)
	bne	a5,zero,.L117
.L116:
	addi	a0,a4,0
.Lpcrel_2:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_2)
	lw	ra,28(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L121:
	sb	zero,4(a2)
	sw	a2,12(a3)
	addi	a0,zero,0
	jal	x0,.L148
.L115:
	sb	zero,4(a2)
	sw	a2,12(a5)
	addi	a0,zero,0
	jal	x0,.L148
.L110:
	sw	zero,0(a0)
	lbu	a0,4(a5)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
.L146:
	sw	a0,0(a1)
	lw	a2,8(a0)
	bne	a2,zero,.+8
	jal	x0,.L125
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
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_3)
	lw	a5,0(sp)
	lw	a4,4(sp)
	bne	a0,zero,.+8
	jal	x0,.L117
.L122:
	addi	a0,a5,12
	sw	a4,0(sp)
.Lpcrel_4:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_4)
	lw	a4,0(sp)
	bne	a0,zero,.L116
	addi	a0,zero,0
	jal	x0,.L148
.L147:
	addi	a0,a6,12
	sw	a4,8(sp)
.Lpcrel_5:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_5)
	lw	a3,0(sp)
	lw	a5,4(sp)
	lw	a4,8(sp)
	bne	a0,zero,.L128
	addi	a0,zero,0
	jal	x0,.L148
.L125:
	sw	zero,12(a6)
	lbu	a2,4(a0)
	bne	a2,zero,.+8
	jal	x0,.L128
	addi	a0,zero,0
	jal	x0,.L148
.L120:
	sw	zero,12(a3)
	lbu	a3,4(a6)
	bne	a3,zero,.+8
	jal	x0,.L122
	addi	a0,zero,0
	jal	x0,.L148
.L127:
	sb	zero,4(a2)
	sw	a2,12(a6)
	addi	a0,zero,0
	jal	x0,.L148
	.size	sglib___rbtree_delete_rightmost_leaf, .-sglib___rbtree_delete_rightmost_leaf
	.align	2
	.type	sglib___rbtree_consistency_check_recursive, @function
sglib___rbtree_consistency_check_recursive:
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	ra,44(sp)
	addi	s0,a1,0
	addi	s1,a2,0
	bne	a0,zero,.+8
	jal	x0,.L234
	lbu	a6,4(a0)
	addi	a3,zero,1
	lw	a4,8(a0)
	addi	a5,a0,0
	bne	a6,a3,.+8
	jal	x0,.L246
	sw	s3,28(sp)
	addi	s3,a2,1
	bne	a4,zero,.+8
	jal	x0,.L243
	lbu	a2,4(a4)
	lw	a6,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L247
	sw	s2,32(sp)
	addi	s2,s1,2
	bne	a6,zero,.+8
	jal	x0,.L248
	lbu	a2,4(a6)
	lw	a0,8(a6)
	bne	a2,a3,.+8
	jal	x0,.L249
	addi	a2,s1,3
	sw	a5,12(sp)
	sw	a4,8(sp)
	sw	a6,4(sp)
	sw	a2,0(sp)
.Lpcrel_6:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_6)
	lw	a6,4(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a6)
.Lpcrel_7:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_7)
	lw	a5,12(sp)
	lw	a4,8(sp)
.L185:
	lw	a4,12(a4)
	bne	a4,zero,.+8
	jal	x0,.L250
.L187:
	lbu	a2,4(a4)
	addi	a3,zero,1
	lw	a0,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L251
	addi	a2,s1,3
	addi	a1,s0,0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
.Lpcrel_8:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_8)
	lw	a4,4(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_9:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_9)
	lw	a5,8(sp)
	lw	s2,32(sp)
.L175:
	lw	a5,12(a5)
	bne	a5,zero,.+8
	jal	x0,.L245
.L189:
	lbu	a2,4(a5)
	addi	a3,zero,1
	lw	a4,8(a5)
	bne	a2,a3,.+8
	jal	x0,.L252
	sw	s2,32(sp)
	addi	s2,s1,2
	bne	a4,zero,.+8
	jal	x0,.L253
	lbu	a2,4(a4)
	lw	a0,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L254
	addi	a2,s1,3
	addi	a1,s0,0
	sw	a5,4(sp)
	sw	a4,8(sp)
	sw	a2,0(sp)
.Lpcrel_10:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_10)
	lw	a4,8(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_11:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_11)
	lw	a5,4(sp)
.L199:
	lw	a5,12(a5)
	bne	a5,zero,.+8
	jal	x0,.L255
.L201:
	lbu	a3,4(a5)
	addi	a4,zero,1
	sw	a5,0(sp)
	lw	a0,8(a5)
	bne	a3,a4,.+8
	jal	x0,.L256
	addi	a2,s1,3
	addi	a1,s0,0
.Lpcrel_12:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_12)
	addi	a2,s1,3
.L236:
	lw	a5,0(sp)
	addi	a1,s0,0
	lw	a0,12(a5)
.Lpcrel_13:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_13)
	lw	s2,32(sp)
	lw	s3,28(sp)
.L149:
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jalr	zero,ra,0
.L246:
	bne	a4,zero,.+8
	jal	x0,.L257
	lbu	a0,4(a4)
	lw	a3,8(a4)
	bne	a0,a6,.+8
	jal	x0,.L258
	sw	s2,32(sp)
	addi	s2,a2,1
	bne	a3,zero,.+8
	jal	x0,.L259
	lbu	a2,4(a3)
	lw	a0,8(a3)
	bne	a2,a6,.+8
	jal	x0,.L260
	addi	a2,s1,2
	sw	a5,12(sp)
	sw	a4,8(sp)
	sw	a3,4(sp)
	sw	a2,0(sp)
.Lpcrel_14:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_14)
	lw	a3,4(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a3)
.Lpcrel_15:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_15)
	lw	a5,12(sp)
	lw	a4,8(sp)
.L160:
	lw	a4,12(a4)
	bne	a4,zero,.+8
	jal	x0,.L261
.L162:
	lbu	a2,4(a4)
	addi	a3,zero,1
	lw	a0,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L262
	addi	a2,s1,2
	addi	a1,s0,0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
.Lpcrel_16:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_16)
	lw	a4,4(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_17:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_17)
	lw	a5,8(sp)
	lw	s2,32(sp)
.L156:
	lw	a5,12(a5)
	bne	a5,zero,.+8
	jal	x0,.L234
.L164:
	lbu	a2,4(a5)
	addi	a3,zero,1
	lw	a4,8(a5)
	bne	a2,a3,.+8
	jal	x0,.L263
	sw	s2,32(sp)
	addi	s2,s1,1
	bne	a4,zero,.+8
	jal	x0,.L264
	lbu	a2,4(a4)
	lw	a0,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L265
	addi	a2,s1,2
	addi	a1,s0,0
	sw	a5,4(sp)
	sw	a4,8(sp)
	sw	a2,0(sp)
.Lpcrel_18:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_18)
	lw	a4,8(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_19:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_19)
	lw	a5,4(sp)
.L169:
	lw	a5,12(a5)
	bne	a5,zero,.+8
	jal	x0,.L266
.L171:
	lbu	a3,4(a5)
	addi	a4,zero,1
	sw	a5,0(sp)
	lw	a0,8(a5)
	bne	a3,a4,.+8
	jal	x0,.L267
	addi	a2,s1,2
	addi	a1,s0,0
.Lpcrel_20:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_20)
	addi	a2,s1,2
.L238:
	lw	a5,0(sp)
	addi	a1,s0,0
	lw	a0,12(a5)
.Lpcrel_21:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_21)
.L239:
	lw	s2,32(sp)
	jal	x0,.L149
.L234:
	lw	a5,0(s0)
	bge	a5,zero,.L149
	sw	s1,0(s0)
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jalr	zero,ra,0
.L257:
	lw	a4,0(a1)
	bge	a4,zero,.+8
	jal	x0,.L268
.L155:
	lw	a5,12(a5)
	bne	a5,zero,.L164
	jal	x0,.L149
.L248:
	lw	a3,0(a1)
	bge	a3,zero,.+8
	jal	x0,.L269
	lw	a4,12(a4)
	bne	a4,zero,.L187
.L230:
	lw	s2,32(sp)
	jal	x0,.L174
.L243:
	lw	a4,0(s0)
	bge	a4,zero,.+8
	jal	x0,.L270
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
	jalr	zero,ra,0
.L245:
	lw	a5,0(s0)
	bge	a5,zero,.L237
	sw	s3,0(s0)
	lw	s3,28(sp)
	jal	x0,.L149
.L247:
	bne	a6,zero,.+8
	jal	x0,.L271
	lbu	a3,4(a6)
	lw	a0,8(a6)
	bne	a3,a2,.+8
	jal	x0,.L272
	addi	a2,s1,2
	sw	a5,12(sp)
	sw	a4,8(sp)
	sw	a6,4(sp)
	sw	a2,0(sp)
.Lpcrel_22:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_22)
	lw	a6,4(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a6)
.Lpcrel_23:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_23)
	lw	a5,12(sp)
	lw	a4,8(sp)
.L179:
	lw	a4,12(a4)
	bne	a4,zero,.+8
	jal	x0,.L243
.L181:
	lbu	a2,4(a4)
	addi	a3,zero,1
	lw	a0,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L273
	addi	a2,s1,2
	addi	a1,s0,0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
.Lpcrel_24:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_24)
	lw	a4,4(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_25:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_25)
	lw	a5,8(sp)
	jal	x0,.L175
.L252:
	bne	a4,zero,.+8
	jal	x0,.L274
	lbu	a3,4(a4)
	lw	a0,8(a4)
	bne	a3,a2,.+8
	jal	x0,.L275
	addi	a2,s1,2
	addi	a1,s0,0
	sw	a5,4(sp)
	sw	a4,8(sp)
	sw	a2,0(sp)
.Lpcrel_26:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_26)
	lw	a4,8(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_27:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_27)
	lw	a5,4(sp)
.L193:
	lw	a5,12(a5)
	bne	a5,zero,.+8
	jal	x0,.L245
.L195:
	lbu	a3,4(a5)
	addi	a4,zero,1
	sw	a5,0(sp)
	lw	a0,8(a5)
	bne	a3,a4,.+8
	jal	x0,.L276
	addi	a2,s1,2
	addi	a1,s0,0
.Lpcrel_28:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_28)
	addi	a2,s1,2
.L240:
	lw	a5,0(sp)
	addi	a1,s0,0
	lw	a0,12(a5)
.Lpcrel_29:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_29)
	lw	s3,28(sp)
	jal	x0,.L149
.L270:
	sw	s3,0(s0)
	jal	x0,.L175
.L253:
	lw	a4,0(s0)
	bge	a4,zero,.+8
	jal	x0,.L277
	lw	a5,12(a5)
	bne	a5,zero,.L201
.L233:
	lw	s2,32(sp)
	lw	s3,28(sp)
	jal	x0,.L278
.L263:
	addi	a0,a4,0
	addi	a2,s1,0
	addi	a1,s0,0
	sw	a5,0(sp)
.Lpcrel_30:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_30)
	lw	a5,0(sp)
	addi	a2,s1,0
	addi	a1,s0,0
	lw	a0,12(a5)
.Lpcrel_31:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_31)
	jal	x0,.L149
.L258:
	addi	a0,a3,0
	sw	a5,4(sp)
	sw	a4,0(sp)
.Lpcrel_32:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_32)
	lw	a4,0(sp)
	addi	a2,s1,0
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_33:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_33)
	lw	a5,4(sp)
	jal	x0,.L156
.L250:
	lw	a4,0(s0)
	bge	a4,zero,.L230
	sw	s2,0(s0)
	lw	s2,32(sp)
	jal	x0,.L175
.L255:
	lw	a5,0(s0)
	bge	a5,zero,.L233
	sw	s2,0(s0)
	lw	s3,28(sp)
	lw	s2,32(sp)
	jal	x0,.L149
.L249:
	addi	a2,s2,0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a6,0(sp)
.Lpcrel_34:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_34)
	lw	a6,0(sp)
	addi	a2,s2,0
	addi	a1,s0,0
	lw	a0,12(a6)
.Lpcrel_35:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_35)
	lw	a4,4(sp)
	lw	a5,8(sp)
	jal	x0,.L185
.L254:
	addi	a2,s2,0
	addi	a1,s0,0
	sw	a5,0(sp)
	sw	a4,4(sp)
.Lpcrel_36:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_36)
	lw	a4,4(sp)
	addi	a2,s2,0
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_37:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_37)
	lw	a5,0(sp)
	jal	x0,.L199
.L251:
	addi	a2,s2,0
	addi	a1,s0,0
	sw	a5,4(sp)
	sw	a4,0(sp)
.Lpcrel_38:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_38)
	lw	a4,0(sp)
	addi	a2,s2,0
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_39:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_39)
	lw	a5,4(sp)
	lw	s2,32(sp)
	jal	x0,.L175
.L256:
	addi	a2,s2,0
	addi	a1,s0,0
.Lpcrel_40:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_40)
	addi	a2,s2,0
	jal	x0,.L236
.L268:
	sw	a2,0(s0)
	jal	x0,.L156
.L269:
	sw	s2,0(a1)
	jal	x0,.L185
.L277:
	sw	s2,0(s0)
	jal	x0,.L199
.L271:
	lw	a3,0(a1)
	bge	a3,zero,.+8
	jal	x0,.L279
	lw	a4,12(a4)
	bne	a4,zero,.L181
	jal	x0,.L174
.L264:
	lw	a4,0(s0)
	bge	a4,zero,.+8
	jal	x0,.L280
	lw	a5,12(a5)
	bne	a5,zero,.L171
	lw	s2,32(sp)
	jal	x0,.L149
.L274:
	lw	a4,0(s0)
	bge	a4,zero,.+8
	jal	x0,.L281
	lw	a5,12(a5)
	bne	a5,zero,.L195
	lw	s3,28(sp)
	jal	x0,.L278
.L259:
	lw	a3,0(a1)
	bge	a3,zero,.+8
	jal	x0,.L282
	lw	a4,12(a4)
	bne	a4,zero,.L162
.L228:
	lw	s2,32(sp)
	jal	x0,.L155
.L266:
	lw	a5,0(s0)
	bge	a5,zero,.L239
	sw	s2,0(s0)
	lw	s2,32(sp)
	jal	x0,.L149
.L261:
	lw	a4,0(s0)
	bge	a4,zero,.L228
	sw	s2,0(s0)
	lw	s2,32(sp)
	jal	x0,.L156
.L276:
	addi	a2,s3,0
	addi	a1,s0,0
.Lpcrel_41:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_41)
	addi	a2,s3,0
	jal	x0,.L240
.L265:
	addi	a2,s2,0
	addi	a1,s0,0
	sw	a5,0(sp)
	sw	a4,4(sp)
.Lpcrel_42:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_42)
	lw	a4,4(sp)
	addi	a2,s2,0
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_43:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_43)
	lw	a5,0(sp)
	jal	x0,.L169
.L267:
	addi	a2,s2,0
	addi	a1,s0,0
.Lpcrel_44:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_44)
	addi	a2,s2,0
	jal	x0,.L238
.L262:
	addi	a2,s2,0
	addi	a1,s0,0
	sw	a5,4(sp)
	sw	a4,0(sp)
.Lpcrel_45:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_45)
	lw	a4,0(sp)
	addi	a2,s2,0
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_46:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_46)
	lw	a5,4(sp)
	lw	s2,32(sp)
	jal	x0,.L156
.L260:
	addi	a2,s2,0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a3,0(sp)
.Lpcrel_47:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_47)
	lw	a3,0(sp)
	addi	a2,s2,0
	addi	a1,s0,0
	lw	a0,12(a3)
.Lpcrel_48:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_48)
	lw	a4,4(sp)
	lw	a5,8(sp)
	jal	x0,.L160
.L273:
	addi	a2,s3,0
	addi	a1,s0,0
	sw	a5,4(sp)
	sw	a4,0(sp)
.Lpcrel_49:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_49)
	lw	a4,0(sp)
	addi	a2,s3,0
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_50:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_50)
	lw	a5,4(sp)
	jal	x0,.L175
.L272:
	addi	a2,s3,0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a6,0(sp)
.Lpcrel_51:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_51)
	lw	a6,0(sp)
	addi	a2,s3,0
	addi	a1,s0,0
	lw	a0,12(a6)
.Lpcrel_52:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_52)
	lw	a4,4(sp)
	lw	a5,8(sp)
	jal	x0,.L179
.L275:
	addi	a2,s3,0
	addi	a1,s0,0
	sw	a5,0(sp)
	sw	a4,4(sp)
.Lpcrel_53:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_53)
	lw	a4,4(sp)
	addi	a2,s3,0
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_54:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_54)
	lw	a5,0(sp)
	jal	x0,.L193
.L281:
	sw	s3,0(s0)
	jal	x0,.L193
.L280:
	sw	s2,0(s0)
	jal	x0,.L169
.L282:
	sw	s2,0(a1)
	jal	x0,.L160
.L279:
	sw	s3,0(a1)
	jal	x0,.L179
	.size	sglib___rbtree_consistency_check_recursive, .-sglib___rbtree_consistency_check_recursive
	.align	2
	.type	sglib___rbtree_consistency_check_recursive.constprop.2, @function
sglib___rbtree_consistency_check_recursive.constprop.2:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	ra,28(sp)
	addi	s0,a1,0
	bne	a0,zero,.+8
	jal	x0,.L327
	lbu	a2,4(a0)
	addi	a3,zero,1
	lw	a4,8(a0)
	addi	a5,a0,0
	bne	a2,a3,.+8
	jal	x0,.L330
	bne	a4,zero,.+8
	jal	x0,.L331
	lbu	a2,4(a4)
	lw	a6,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L332
	bne	a6,zero,.+8
	jal	x0,.L333
	lbu	a2,4(a6)
	sw	a5,12(sp)
	sw	a4,8(sp)
	sw	a6,4(sp)
	lw	a0,8(a6)
	bne	a2,a3,.+8
	jal	x0,.L334
	addi	a2,zero,5
.Lpcrel_55:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_55)
	lw	a6,4(sp)
	addi	a1,s0,0
	addi	a2,zero,5
	lw	a0,12(a6)
.Lpcrel_56:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_56)
	lw	a5,12(sp)
	lw	a4,8(sp)
.L303:
	lw	a4,12(a4)
	bne	a4,zero,.+8
	jal	x0,.L335
.L304:
	lbu	a2,4(a4)
	addi	a3,zero,1
	sw	a5,8(sp)
	sw	a4,4(sp)
	lw	a0,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L336
	addi	a2,zero,5
	addi	a1,s0,0
.Lpcrel_57:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_57)
	lw	a4,4(sp)
	addi	a1,s0,0
	addi	a2,zero,5
	lw	a0,12(a4)
.Lpcrel_58:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_58)
	lw	a5,8(sp)
.L299:
	lw	a5,12(a5)
	bne	a5,zero,.+8
	jal	x0,.L337
	lbu	a2,4(a5)
	addi	a3,zero,1
	lw	a4,8(a5)
	bne	a2,a3,.+8
	jal	x0,.L338
.L307:
	bne	a4,zero,.+8
	jal	x0,.L339
	lbu	a2,4(a4)
	sw	a4,8(sp)
	sw	a5,4(sp)
	lw	a0,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L340
	addi	a2,zero,5
	addi	a1,s0,0
.Lpcrel_59:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_59)
	lw	a4,8(sp)
	addi	a1,s0,0
	addi	a2,zero,5
	lw	a0,12(a4)
.Lpcrel_60:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_60)
	lw	a5,4(sp)
.L311:
	lw	a5,12(a5)
	bne	a5,zero,.+8
	jal	x0,.L341
.L312:
	lbu	a3,4(a5)
	addi	a4,zero,1
	sw	a5,4(sp)
	lw	a0,8(a5)
	bne	a3,a4,.+8
	jal	x0,.L342
	addi	a2,zero,5
	addi	a1,s0,0
.Lpcrel_61:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_61)
	lw	a5,4(sp)
	addi	a1,s0,0
	addi	a2,zero,5
	lw	a0,12(a5)
.Lpcrel_62:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_62)
.L283:
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L330:
	bne	a4,zero,.+8
	jal	x0,.L343
	lbu	a3,4(a4)
	sw	a5,8(sp)
	sw	a4,4(sp)
	lw	a0,8(a4)
	bne	a3,a2,.+8
	jal	x0,.L344
	addi	a2,zero,3
.Lpcrel_63:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_63)
	lw	a4,4(sp)
	addi	a1,s0,0
	addi	a2,zero,3
	lw	a0,12(a4)
.Lpcrel_64:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_64)
	lw	a5,8(sp)
.L291:
	lw	a5,12(a5)
	bne	a5,zero,.+8
	jal	x0,.L327
.L292:
	lbu	a3,4(a5)
	addi	a4,zero,1
	sw	a5,4(sp)
	lw	a0,8(a5)
	bne	a3,a4,.+8
	jal	x0,.L345
.L328:
	addi	a1,s0,0
	addi	a2,zero,3
.Lpcrel_65:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_65)
	lw	a5,4(sp)
	addi	a1,s0,0
	addi	a2,zero,3
	lw	a0,12(a5)
.Lpcrel_66:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_66)
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L327:
	lw	a5,0(s0)
	bge	a5,zero,.L283
	addi	a5,zero,2
	lw	ra,28(sp)
	sw	a5,0(s0)
	lw	s0,24(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L343:
	lw	a4,0(a1)
	bge	a4,zero,.+8
	jal	x0,.L346
.L289:
	lw	a5,12(a5)
	bne	a5,zero,.L292
	jal	x0,.L283
.L333:
	lw	a3,0(a1)
	bge	a3,zero,.+8
	jal	x0,.L347
.L301:
	lw	a4,12(a4)
	bne	a4,zero,.L304
.L297:
	lw	a5,12(a5)
	bne	a5,zero,.+8
	jal	x0,.L283
	lbu	a2,4(a5)
	addi	a3,zero,1
	lw	a4,8(a5)
	bne	a2,a3,.L307
.L338:
	sw	a5,4(sp)
	addi	a0,a4,0
	jal	x0,.L328
.L331:
	lw	a4,0(a1)
	bge	a4,zero,.L297
	addi	a4,zero,3
	sw	a4,0(a1)
	jal	x0,.L297
.L332:
	sw	a0,8(sp)
	addi	a2,zero,3
	addi	a0,a6,0
	sw	a4,4(sp)
.Lpcrel_67:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_67)
	lw	a4,4(sp)
	addi	a1,s0,0
	addi	a2,zero,3
	lw	a0,12(a4)
.Lpcrel_68:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_68)
	lw	a5,8(sp)
	jal	x0,.L299
.L337:
	lw	a5,0(s0)
	bge	a5,zero,.L283
	addi	a5,zero,3
	sw	a5,0(s0)
	jal	x0,.L283
.L339:
	lw	a4,0(s0)
	bge	a4,zero,.+8
	jal	x0,.L348
.L309:
	lw	a5,12(a5)
	bne	a5,zero,.L312
	jal	x0,.L283
.L345:
	addi	a1,s0,0
	addi	a2,zero,2
.Lpcrel_69:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_69)
	lw	a5,4(sp)
	addi	a1,s0,0
	addi	a2,zero,2
	lw	a0,12(a5)
.Lpcrel_70:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_70)
	jal	x0,.L283
.L344:
	addi	a2,zero,2
.Lpcrel_71:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_71)
	lw	a4,4(sp)
	addi	a1,s0,0
	addi	a2,zero,2
	lw	a0,12(a4)
.Lpcrel_72:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_72)
	lw	a5,8(sp)
	jal	x0,.L291
.L336:
	addi	a2,zero,4
	addi	a1,s0,0
.Lpcrel_73:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_73)
	lw	a4,4(sp)
	addi	a1,s0,0
	addi	a2,zero,4
	lw	a0,12(a4)
.Lpcrel_74:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_74)
	lw	a5,8(sp)
	jal	x0,.L299
.L334:
	addi	a2,zero,4
.Lpcrel_75:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_75)
	lw	a6,4(sp)
	addi	a1,s0,0
	addi	a2,zero,4
	lw	a0,12(a6)
.Lpcrel_76:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_76)
	lw	a4,8(sp)
	lw	a5,12(sp)
	jal	x0,.L303
.L342:
	addi	a1,s0,0
	addi	a2,zero,4
.Lpcrel_77:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_77)
	lw	a5,4(sp)
	addi	a1,s0,0
	addi	a2,zero,4
	lw	a0,12(a5)
.Lpcrel_78:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_78)
	jal	x0,.L283
.L340:
	addi	a2,zero,4
	addi	a1,s0,0
.Lpcrel_79:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_79)
	lw	a4,8(sp)
	addi	a1,s0,0
	addi	a2,zero,4
	lw	a0,12(a4)
.Lpcrel_80:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_80)
	lw	a5,4(sp)
	jal	x0,.L311
.L346:
	addi	a4,zero,2
	sw	a4,0(a1)
	jal	x0,.L289
.L348:
	addi	a4,zero,4
	sw	a4,0(s0)
	jal	x0,.L309
.L347:
	addi	a3,zero,4
	sw	a3,0(a1)
	jal	x0,.L301
.L341:
	lw	a5,0(s0)
	bge	a5,zero,.L283
	addi	a5,zero,4
	sw	a5,0(s0)
	jal	x0,.L283
.L335:
	lw	a4,0(s0)
	bge	a4,zero,.L297
	addi	a4,zero,4
	sw	a4,0(s0)
	jal	x0,.L297
	.size	sglib___rbtree_consistency_check_recursive.constprop.2, .-sglib___rbtree_consistency_check_recursive.constprop.2
	.align	2
	.type	sglib___rbtree_consistency_check_recursive.constprop.0, @function
sglib___rbtree_consistency_check_recursive.constprop.0:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	ra,28(sp)
	addi	s0,a1,0
	bne	a0,zero,.+8
	jal	x0,.L400
	lbu	a2,4(a0)
	addi	a3,zero,1
	lw	a4,8(a0)
	addi	a5,a0,0
	bne	a2,a3,.+8
	jal	x0,.L401
	bne	a4,zero,.+8
	jal	x0,.L397
	lbu	a7,4(a4)
	lw	a6,8(a4)
	bne	a7,a3,.+8
	jal	x0,.L402
	sw	a0,4(sp)
	addi	a0,a6,0
	sw	a4,0(sp)
.Lpcrel_81:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_81)
	lw	a4,0(sp)
	lw	a5,4(sp)
	addi	a3,zero,1
	lw	a4,12(a4)
	bne	a4,zero,.+8
	jal	x0,.L403
	lbu	a2,4(a4)
	lw	a6,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L404
	bne	a6,zero,.+8
	jal	x0,.L405
	lbu	a2,4(a6)
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a6,0(sp)
	lw	a0,8(a6)
	bne	a2,a3,.+8
	jal	x0,.L406
	addi	a2,zero,4
	addi	a1,s0,0
.Lpcrel_82:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_82)
	lw	a6,0(sp)
	addi	a1,s0,0
	addi	a2,zero,4
	lw	a0,12(a6)
.Lpcrel_83:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_83)
	lw	a5,8(sp)
	lw	a4,4(sp)
.L371:
	lw	a4,12(a4)
	bne	a4,zero,.+8
	jal	x0,.L407
.L372:
	lbu	a2,4(a4)
	addi	a3,zero,1
	sw	a5,4(sp)
	sw	a4,0(sp)
	lw	a0,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L408
	addi	a2,zero,4
	addi	a1,s0,0
.Lpcrel_84:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_84)
	lw	a4,0(sp)
	addi	a1,s0,0
	addi	a2,zero,4
	lw	a0,12(a4)
.Lpcrel_85:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_85)
	lw	a5,4(sp)
	jal	x0,.L365
.L401:
	sw	a0,0(sp)
	addi	a0,a4,0
.Lpcrel_86:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_86)
	lw	a5,0(sp)
	addi	a1,s0,0
	lw	a0,12(a5)
.Lpcrel_87:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_87)
.L349:
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L400:
	lw	a5,0(a1)
	bge	a5,zero,.L349
	lw	ra,28(sp)
	lw	s0,24(sp)
	sw	zero,0(a1)
	addi	sp,sp,32
	jalr	zero,ra,0
.L403:
	lw	a4,0(s0)
	bge	a4,zero,.+8
	jal	x0,.L409
.L356:
	lw	a5,12(a5)
	bne	a5,zero,.+8
	jal	x0,.L349
.L374:
	lbu	a3,4(a5)
	addi	a2,zero,1
	lw	a4,8(a5)
	bne	a3,a2,.+8
	jal	x0,.L410
	addi	a0,a4,0
	addi	a1,s0,0
	sw	a5,0(sp)
.Lpcrel_88:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_88)
	lw	a5,0(sp)
	addi	a1,s0,0
	lw	a0,12(a5)
.Lpcrel_89:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_89)
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L397:
	lw	a4,0(s0)
	bge	a4,zero,.L356
	addi	a4,zero,1
	sw	a4,0(s0)
	jal	x0,.L356
.L402:
	bne	a6,zero,.+8
	jal	x0,.L411
	lbu	a2,4(a6)
	lw	a0,8(a6)
	bne	a2,a7,.+8
	jal	x0,.L412
	addi	a2,zero,2
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a6,0(sp)
.Lpcrel_90:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_90)
	lw	a6,0(sp)
	addi	a1,s0,0
	addi	a2,zero,2
	lw	a0,12(a6)
.Lpcrel_91:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_91)
	lw	a5,8(sp)
	lw	a4,4(sp)
.L361:
	lw	a4,12(a4)
	bne	a4,zero,.+8
	jal	x0,.L397
.L362:
	lbu	a2,4(a4)
	addi	a3,zero,1
	lw	a0,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L413
	sw	a5,4(sp)
	sw	a4,0(sp)
.L398:
	addi	a2,zero,2
	addi	a1,s0,0
.Lpcrel_92:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_92)
	lw	a4,0(sp)
	addi	a1,s0,0
	addi	a2,zero,2
	lw	a0,12(a4)
.Lpcrel_93:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_93)
	lw	a5,4(sp)
.L365:
	lw	a5,12(a5)
	bne	a5,zero,.L374
.L399:
	lw	a5,0(s0)
	bge	a5,zero,.L349
	addi	a5,zero,1
	sw	a5,0(s0)
	jal	x0,.L349
.L410:
	bne	a4,zero,.+8
	jal	x0,.L414
	lbu	a2,4(a4)
	lw	a0,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L415
	addi	a2,zero,2
	addi	a1,s0,0
	sw	a5,4(sp)
	sw	a4,0(sp)
.Lpcrel_94:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_94)
	lw	a4,0(sp)
	addi	a1,s0,0
	addi	a2,zero,2
	lw	a0,12(a4)
.Lpcrel_95:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_95)
	lw	a5,4(sp)
.L380:
	lw	a5,12(a5)
	bne	a5,zero,.+8
	jal	x0,.L399
.L381:
	lbu	a2,4(a5)
	addi	a4,zero,1
	lw	a0,8(a5)
	bne	a2,a4,.+8
	jal	x0,.L416
	addi	a1,s0,0
	addi	a2,zero,2
	sw	a5,0(sp)
.Lpcrel_96:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_96)
	lw	a5,0(sp)
	addi	a1,s0,0
	addi	a2,zero,2
	lw	a0,12(a5)
.Lpcrel_97:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_97)
	jal	x0,.L349
.L404:
	sw	a5,4(sp)
	sw	a4,0(sp)
	addi	a0,a6,0
	jal	x0,.L398
.L409:
	addi	a4,zero,2
	sw	a4,0(s0)
	jal	x0,.L356
.L406:
	addi	a2,zero,3
	addi	a1,s0,0
.Lpcrel_98:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_98)
	lw	a6,0(sp)
	addi	a1,s0,0
	addi	a2,zero,3
	lw	a0,12(a6)
.Lpcrel_99:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_99)
	lw	a4,4(sp)
	lw	a5,8(sp)
	jal	x0,.L371
.L411:
	lw	a3,0(a1)
	bge	a3,zero,.L359
	sw	a7,0(a1)
.L359:
	lw	a4,12(a4)
	bne	a4,zero,.L362
	jal	x0,.L356
.L414:
	lw	a4,0(s0)
	bge	a4,zero,.L378
	sw	a3,0(s0)
.L378:
	lw	a5,12(a5)
	bne	a5,zero,.L381
	jal	x0,.L349
.L405:
	lw	a3,0(s0)
	bge	a3,zero,.L369
	addi	a3,zero,3
	sw	a3,0(s0)
.L369:
	lw	a4,12(a4)
	bne	a4,zero,.L372
	jal	x0,.L356
.L415:
	addi	a1,s0,0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
.Lpcrel_100:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_100)
	lw	a4,4(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_101:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_101)
	lw	a5,8(sp)
	jal	x0,.L380
.L416:
	addi	a1,s0,0
	sw	a5,4(sp)
	sw	a2,0(sp)
.Lpcrel_102:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_102)
	lw	a5,4(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a5)
.Lpcrel_103:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_103)
	jal	x0,.L349
.L413:
	addi	a1,s0,0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
.Lpcrel_104:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_104)
	lw	a4,4(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_105:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_105)
	lw	a5,8(sp)
	jal	x0,.L365
.L412:
	sw	a5,12(sp)
	sw	a4,8(sp)
	sw	a6,4(sp)
	sw	a2,0(sp)
.Lpcrel_106:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_106)
	lw	a6,4(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a6)
.Lpcrel_107:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_107)
	lw	a4,8(sp)
	lw	a5,12(sp)
	jal	x0,.L361
.L408:
	addi	a2,zero,3
	addi	a1,s0,0
.Lpcrel_108:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_108)
	lw	a4,0(sp)
	addi	a1,s0,0
	addi	a2,zero,3
	lw	a0,12(a4)
.Lpcrel_109:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_109)
	lw	a5,4(sp)
	jal	x0,.L365
.L407:
	lw	a4,0(s0)
	bge	a4,zero,.L356
	addi	a4,zero,3
	sw	a4,0(s0)
	jal	x0,.L356
	.size	sglib___rbtree_consistency_check_recursive.constprop.0, .-sglib___rbtree_consistency_check_recursive.constprop.0
	.align	2
	.type	sglib___rbtree_add_recursive.constprop.0, @function
sglib___rbtree_add_recursive.constprop.0:
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L577
	lw	a2,0(a1)
	lw	a4,0(a5)
	addi	sp,sp,-32
	sw	ra,28(sp)
	sub	a4,a2,a4
	addi	a3,a0,0
	bge	a4,zero,.+8
	jal	x0,.L420
	bne	a4,zero,.L421
	bltu	a1,a5,.+8
	jal	x0,.L421
.L420:
	lw	a4,8(a5)
	bne	a4,zero,.+8
	jal	x0,.L578
	lw	a0,0(a4)
	sub	a0,a2,a0
	bge	a0,zero,.+8
	jal	x0,.L424
	bne	a0,zero,.L425
	bltu	a1,a4,.+8
	jal	x0,.L425
.L424:
	lw	a6,8(a4)
	bne	a6,zero,.+8
	jal	x0,.L579
	lw	a0,0(a6)
	sub	a2,a2,a0
	bge	a2,zero,.+8
	jal	x0,.L428
	bne	a2,zero,.L429
	bltu	a1,a6,.+8
	jal	x0,.L429
.L428:
	addi	a0,a6,8
	sw	a3,12(sp)
	sw	a4,8(sp)
	sw	a5,4(sp)
	sw	a6,0(sp)
.Lpcrel_110:
	auipc	ra,%pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_110)
	lw	a6,0(sp)
	lw	a5,4(sp)
	lw	a4,8(sp)
	lbu	a2,4(a6)
	lw	a3,12(sp)
	bne	a2,zero,.+8
	jal	x0,.L580
.L427:
	lbu	a4,4(a4)
	bne	a4,zero,.+8
	jal	x0,.L581
.L423:
	lbu	a5,4(a5)
	bne	a5,zero,.+8
	jal	x0,.L582
.L417:
	lw	ra,28(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L577:
	addi	a5,zero,1
	sb	a5,4(a1)
	sw	a1,0(a0)
	jalr	zero,ra,0
.L578:
	addi	a4,zero,1
	sb	a4,4(a1)
	sw	a1,8(a5)
	lbu	a5,4(a5)
	bne	a5,zero,.L417
.L582:
	lw	a5,0(a3)
	lw	a4,8(a5)
	lw	a2,12(a5)
	lbu	a1,4(a4)
	bne	a2,zero,.+8
	jal	x0,.L451
	lbu	a0,4(a2)
	addi	a6,zero,1
	bne	a0,a6,.+8
	jal	x0,.L583
.L451:
	addi	a2,zero,1
	bne	a1,a2,.L417
	lw	a0,8(a4)
	lw	a2,12(a4)
	bne	a0,zero,.+8
	jal	x0,.L455
	lbu	a6,4(a0)
	bne	a6,a1,.+8
	jal	x0,.L584
.L455:
	bne	a2,zero,.+8
	jal	x0,.L417
	lbu	a1,4(a2)
	addi	a0,zero,1
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
	jal	x0,.L417
.L421:
	addi	a0,a5,12
	sw	a3,4(sp)
	sw	a5,0(sp)
.Lpcrel_111:
	auipc	ra,%pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_111)
	lw	a5,0(sp)
	lw	a3,4(sp)
	lbu	a5,4(a5)
	bne	a5,zero,.L417
	lw	a5,0(a3)
	lw	a4,12(a5)
	lw	a2,8(a5)
	lbu	a1,4(a4)
	bne	a2,zero,.+8
	jal	x0,.L456
	lbu	a0,4(a2)
	addi	a6,zero,1
	bne	a0,a6,.+8
	jal	x0,.L585
.L456:
	addi	a2,zero,1
	bne	a1,a2,.L417
	lw	a0,12(a4)
	lw	a2,8(a4)
	bne	a0,zero,.+8
	jal	x0,.L459
	lbu	a6,4(a0)
	bne	a6,a1,.+8
	jal	x0,.L586
.L459:
	bne	a2,zero,.+8
	jal	x0,.L417
	lbu	a1,4(a2)
	addi	a0,zero,1
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
	jal	x0,.L417
.L579:
	addi	a2,zero,1
	sb	a2,4(a1)
	sw	a1,8(a4)
	jal	x0,.L427
.L425:
	addi	a0,a4,12
	sw	a3,8(sp)
	sw	a5,4(sp)
	sw	a4,0(sp)
.Lpcrel_112:
	auipc	ra,%pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_112)
	lw	a4,0(sp)
	lw	a5,4(sp)
	lw	a3,8(sp)
	lbu	a4,4(a4)
	bne	a4,zero,.L423
	lw	a4,8(a5)
	lw	a2,12(a4)
	lw	a1,8(a4)
	lbu	a0,4(a2)
	bne	a1,zero,.+8
	jal	x0,.L446
	lbu	a6,4(a1)
	addi	a7,zero,1
	bne	a6,a7,.+8
	jal	x0,.L587
.L446:
	addi	a1,zero,1
	bne	a0,a1,.L423
	lw	a6,12(a2)
	lw	a1,8(a2)
	bne	a6,zero,.+8
	jal	x0,.L449
	lbu	a7,4(a6)
	bne	a7,a0,.+8
	jal	x0,.L588
.L449:
	bne	a1,zero,.+8
	jal	x0,.L423
	lbu	a0,4(a1)
	addi	a6,zero,1
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
	jal	x0,.L423
.L581:
	lw	a4,8(a5)
	lw	a2,8(a4)
	lw	a1,12(a4)
	lbu	a0,4(a2)
	bne	a1,zero,.+8
	jal	x0,.L441
	lbu	a6,4(a1)
	addi	a7,zero,1
	bne	a6,a7,.+8
	jal	x0,.L589
.L441:
	addi	a1,zero,1
	bne	a0,a1,.L423
	lw	a6,8(a2)
	lw	a1,12(a2)
	bne	a6,zero,.+8
	jal	x0,.L445
	lbu	a7,4(a6)
	bne	a7,a0,.+8
	jal	x0,.L590
.L445:
	bne	a1,zero,.+8
	jal	x0,.L423
	lbu	a0,4(a1)
	addi	a6,zero,1
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
	jal	x0,.L423
.L589:
	bne	a0,a6,.L423
	lw	a6,8(a2)
	bne	a6,zero,.+8
	jal	x0,.L443
	lbu	a6,4(a6)
	bne	a6,a0,.+8
	jal	x0,.L448
.L443:
	lw	a0,12(a2)
	bne	a0,zero,.+8
	jal	x0,.L423
.L574:
	lbu	a6,4(a0)
	addi	a0,zero,1
	bne	a6,a0,.L423
.L448:
	sb	zero,4(a2)
	sb	zero,4(a1)
	addi	a2,zero,1
	sb	a2,4(a4)
	jal	x0,.L423
.L584:
	sw	a2,8(a5)
	sw	a0,8(a4)
	sw	a5,12(a4)
	sb	a1,4(a5)
	sb	zero,4(a4)
	sw	a4,0(a3)
	jal	x0,.L417
.L590:
	sw	a1,8(a4)
	sw	a6,8(a2)
	sw	a4,12(a2)
	sb	a0,4(a4)
	sb	zero,4(a2)
	sw	a2,8(a5)
	jal	x0,.L423
.L586:
	sw	a2,12(a5)
	sw	a0,12(a4)
	sw	a5,8(a4)
	sb	a1,4(a5)
	sb	zero,4(a4)
	sw	a4,0(a3)
	jal	x0,.L417
.L588:
	sw	a1,12(a4)
	sw	a6,12(a2)
	sw	a4,8(a2)
	sb	a0,4(a4)
	sb	zero,4(a2)
	sw	a2,8(a5)
	jal	x0,.L423
.L580:
	lw	a2,8(a4)
	lw	a1,8(a2)
	lw	a0,12(a2)
	lbu	a6,4(a1)
	bne	a0,zero,.+8
	jal	x0,.L431
	lbu	a7,4(a0)
	addi	t1,zero,1
	bne	a7,t1,.+8
	jal	x0,.L591
.L431:
	addi	a0,zero,1
	bne	a6,a0,.L427
	lw	a7,8(a1)
	lw	a0,12(a1)
	bne	a7,zero,.+8
	jal	x0,.L435
	lbu	t1,4(a7)
	bne	t1,a6,.+8
	jal	x0,.L592
.L435:
	bne	a0,zero,.+8
	jal	x0,.L427
	lbu	a6,4(a0)
	addi	a7,zero,1
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
	jal	x0,.L427
.L592:
	sw	a0,8(a2)
	sw	a7,8(a1)
	sw	a2,12(a1)
	sb	a6,4(a2)
	sb	zero,4(a1)
	sw	a1,8(a4)
	jal	x0,.L427
.L429:
	addi	a0,a6,12
	sw	a3,12(sp)
	sw	a4,8(sp)
	sw	a5,4(sp)
	sw	a6,0(sp)
.Lpcrel_113:
	auipc	ra,%pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_113)
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
	bne	a0,zero,.+8
	jal	x0,.L436
	lbu	a7,4(a0)
	addi	t1,zero,1
	bne	a7,t1,.+8
	jal	x0,.L593
.L436:
	addi	a0,zero,1
	bne	a6,a0,.L427
	lw	a7,12(a1)
	lw	a0,8(a1)
	bne	a7,zero,.+8
	jal	x0,.L439
	lbu	t1,4(a7)
	bne	t1,a6,.+8
	jal	x0,.L594
.L439:
	bne	a0,zero,.+8
	jal	x0,.L427
	lbu	a6,4(a0)
	addi	a7,zero,1
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
	jal	x0,.L427
.L594:
	sw	a0,12(a2)
	sw	a7,12(a1)
	sw	a2,8(a1)
	sb	a6,4(a2)
	sb	zero,4(a1)
	sw	a1,8(a4)
	jal	x0,.L427
.L583:
	bne	a1,a0,.L417
	lw	a3,8(a4)
	bne	a3,zero,.+8
	jal	x0,.L453
	lbu	a3,4(a3)
	bne	a3,a1,.+8
	jal	x0,.L458
.L453:
	lw	a3,12(a4)
	bne	a3,zero,.+8
	jal	x0,.L417
.L576:
	lbu	a1,4(a3)
	addi	a3,zero,1
	bne	a1,a3,.L417
.L458:
	sb	zero,4(a4)
	sb	zero,4(a2)
	addi	a4,zero,1
	sb	a4,4(a5)
	jal	x0,.L417
.L585:
	bne	a1,a0,.L417
	lw	a3,12(a4)
	bne	a3,zero,.+8
	jal	x0,.L457
	lbu	a3,4(a3)
	bne	a3,a1,.+8
	jal	x0,.L458
.L457:
	lw	a3,8(a4)
	bne	a3,zero,.L576
	jal	x0,.L417
.L591:
	bne	a6,a7,.L427
	lw	a7,8(a1)
	bne	a7,zero,.+8
	jal	x0,.L433
	lbu	a7,4(a7)
	bne	a7,a6,.+8
	jal	x0,.L438
.L433:
	lw	a6,12(a1)
	bne	a6,zero,.+8
	jal	x0,.L427
.L572:
	lbu	a7,4(a6)
	addi	a6,zero,1
	bne	a7,a6,.L427
.L438:
	sb	zero,4(a1)
	sb	zero,4(a0)
	addi	a1,zero,1
	sb	a1,4(a2)
	jal	x0,.L427
.L587:
	bne	a0,a6,.L423
	lw	a6,12(a2)
	bne	a6,zero,.+8
	jal	x0,.L447
	lbu	a6,4(a6)
	bne	a6,a0,.+8
	jal	x0,.L448
.L447:
	lw	a0,8(a2)
	bne	a0,zero,.L574
	jal	x0,.L423
.L593:
	bne	a6,a7,.L427
	lw	a7,12(a1)
	bne	a7,zero,.+8
	jal	x0,.L437
	lbu	a7,4(a7)
	bne	a7,a6,.+8
	jal	x0,.L438
.L437:
	lw	a6,8(a1)
	bne	a6,zero,.L572
	jal	x0,.L427
	.size	sglib___rbtree_add_recursive.constprop.0, .-sglib___rbtree_add_recursive.constprop.0
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
	.globl	sglib_dllist_add
	.type	sglib_dllist_add, @function
sglib_dllist_add:
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L604
	lw	a4,8(a5)
	sw	a5,4(a1)
	sw	a4,8(a1)
	lw	a5,0(a0)
	sw	a1,8(a5)
	lw	a5,8(a1)
	bne	a5,zero,.+8
	jal	x0,.L598
	sw	a1,4(a5)
.L598:
	jalr	zero,ra,0
.L604:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	jalr	zero,ra,0
	.size	sglib_dllist_add, .-sglib_dllist_add
	.align	2
	.globl	sglib_dllist_add_after
	.type	sglib_dllist_add_after, @function
sglib_dllist_add_after:
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L611
	lw	a5,4(a5)
	sw	a5,4(a1)
	lw	a5,0(a0)
	sw	a5,8(a1)
	sw	a1,4(a5)
	lw	a5,4(a1)
	bne	a5,zero,.+8
	jal	x0,.L605
	sw	a1,8(a5)
.L605:
	jalr	zero,ra,0
.L611:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	jalr	zero,ra,0
	.size	sglib_dllist_add_after, .-sglib_dllist_add_after
	.align	2
	.globl	sglib_dllist_add_before
	.type	sglib_dllist_add_before, @function
sglib_dllist_add_before:
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L618
	lw	a4,8(a5)
	sw	a5,4(a1)
	sw	a4,8(a1)
	lw	a5,0(a0)
	sw	a1,8(a5)
	lw	a5,8(a1)
	bne	a5,zero,.+8
	jal	x0,.L612
	sw	a1,4(a5)
.L612:
	jalr	zero,ra,0
.L618:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	jalr	zero,ra,0
	.size	sglib_dllist_add_before, .-sglib_dllist_add_before
	.align	2
	.globl	sglib_dllist_add_if_not_member
	.type	sglib_dllist_add_if_not_member, @function
sglib_dllist_add_if_not_member:
	lw	a6,0(a0)
	bne	a6,zero,.+8
	jal	x0,.L620
	lw	a3,0(a1)
	addi	a5,a6,0
	jal	x0,.L621
.L623:
	lw	a5,8(a5)
	bne	a5,zero,.+8
	jal	x0,.L622
.L621:
	lw	a4,0(a5)
	bne	a4,a3,.L623
	sw	a5,0(a2)
	addi	a0,zero,0
	jalr	zero,ra,0
.L622:
	lw	a5,4(a6)
	bne	a5,zero,.L631
	jal	x0,.L620
.L625:
	lw	a5,4(a5)
	bne	a5,zero,.+8
	jal	x0,.L620
.L631:
	lw	a4,0(a5)
	bne	a3,a4,.L625
	sw	a5,0(a2)
	addi	a0,zero,0
	jalr	zero,ra,0
.L620:
	sw	zero,0(a2)
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L642
	lw	a4,8(a5)
	sw	a5,4(a1)
	sw	a4,8(a1)
	lw	a5,0(a0)
	sw	a1,8(a5)
	lw	a5,8(a1)
	bne	a5,zero,.+8
	jal	x0,.L641
	sw	a1,4(a5)
.L641:
	lw	a0,0(a2)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
.L642:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	lw	a0,0(a2)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
	.size	sglib_dllist_add_if_not_member, .-sglib_dllist_add_if_not_member
	.align	2
	.globl	sglib_dllist_add_after_if_not_member
	.type	sglib_dllist_add_after_if_not_member, @function
sglib_dllist_add_after_if_not_member:
	lw	a6,0(a0)
	bne	a6,zero,.+8
	jal	x0,.L644
	lw	a3,0(a1)
	addi	a5,a6,0
	jal	x0,.L645
.L647:
	lw	a5,8(a5)
	bne	a5,zero,.+8
	jal	x0,.L646
.L645:
	lw	a4,0(a5)
	bne	a4,a3,.L647
	sw	a5,0(a2)
	addi	a0,zero,0
	jalr	zero,ra,0
.L646:
	lw	a5,4(a6)
	bne	a5,zero,.L655
	jal	x0,.L644
.L649:
	lw	a5,4(a5)
	bne	a5,zero,.+8
	jal	x0,.L644
.L655:
	lw	a4,0(a5)
	bne	a3,a4,.L649
	sw	a5,0(a2)
	addi	a0,zero,0
	jalr	zero,ra,0
.L644:
	sw	zero,0(a2)
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L666
	lw	a5,4(a5)
	sw	a5,4(a1)
	lw	a5,0(a0)
	sw	a5,8(a1)
	sw	a1,4(a5)
	lw	a5,4(a1)
	bne	a5,zero,.+8
	jal	x0,.L665
	sw	a1,8(a5)
.L665:
	lw	a0,0(a2)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
.L666:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	lw	a0,0(a2)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
	.size	sglib_dllist_add_after_if_not_member, .-sglib_dllist_add_after_if_not_member
	.align	2
	.globl	sglib_dllist_add_before_if_not_member
	.type	sglib_dllist_add_before_if_not_member, @function
sglib_dllist_add_before_if_not_member:
	lw	a6,0(a0)
	bne	a6,zero,.+8
	jal	x0,.L668
	lw	a3,0(a1)
	addi	a5,a6,0
	jal	x0,.L669
.L671:
	lw	a5,8(a5)
	bne	a5,zero,.+8
	jal	x0,.L670
.L669:
	lw	a4,0(a5)
	bne	a4,a3,.L671
	sw	a5,0(a2)
	addi	a0,zero,0
	jalr	zero,ra,0
.L670:
	lw	a5,4(a6)
	bne	a5,zero,.L679
	jal	x0,.L668
.L673:
	lw	a5,4(a5)
	bne	a5,zero,.+8
	jal	x0,.L668
.L679:
	lw	a4,0(a5)
	bne	a3,a4,.L673
	sw	a5,0(a2)
	addi	a0,zero,0
	jalr	zero,ra,0
.L668:
	sw	zero,0(a2)
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L690
	lw	a4,8(a5)
	sw	a5,4(a1)
	sw	a4,8(a1)
	lw	a5,0(a0)
	sw	a1,8(a5)
	lw	a5,8(a1)
	bne	a5,zero,.+8
	jal	x0,.L689
	sw	a1,4(a5)
.L689:
	lw	a0,0(a2)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
.L690:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	lw	a0,0(a2)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
	.size	sglib_dllist_add_before_if_not_member, .-sglib_dllist_add_before_if_not_member
	.align	2
	.globl	sglib_dllist_concat
	.type	sglib_dllist_concat, @function
sglib_dllist_concat:
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L701
	bne	a1,zero,.+8
	jal	x0,.L691
.L694:
	addi	a4,a5,0
	lw	a5,4(a5)
	bne	a5,zero,.L694
	sw	zero,4(a1)
	sw	a4,8(a1)
	sw	a1,4(a4)
	lw	a5,4(a1)
	bne	a5,zero,.+8
	jal	x0,.L691
	sw	a1,8(a5)
.L691:
	jalr	zero,ra,0
.L701:
	sw	a1,0(a0)
	jalr	zero,ra,0
	.size	sglib_dllist_concat, .-sglib_dllist_concat
	.align	2
	.globl	sglib_dllist_delete
	.type	sglib_dllist_delete, @function
sglib_dllist_delete:
	lw	a3,0(a0)
	lw	a5,8(a1)
	lw	a4,4(a1)
	bne	a3,a1,.+8
	jal	x0,.L719
	bne	a4,zero,.+8
	jal	x0,.L707
.L705:
	sw	a5,8(a4)
	lw	a5,8(a1)
.L707:
	bne	a5,zero,.+8
	jal	x0,.L706
.L708:
	sw	a4,4(a5)
.L706:
	sw	a3,0(a0)
	jalr	zero,ra,0
.L719:
	bne	a5,zero,.+8
	jal	x0,.L720
	addi	a3,a5,0
	bne	a4,zero,.+8
	jal	x0,.L708
	sw	a5,8(a4)
	lw	a5,8(a1)
	jal	x0,.L707
.L720:
	addi	a3,a4,0
	bne	a4,zero,.L705
	jal	x0,.L706
	.size	sglib_dllist_delete, .-sglib_dllist_delete
	.align	2
	.globl	sglib_dllist_delete_if_member
	.type	sglib_dllist_delete_if_member, @function
sglib_dllist_delete_if_member:
	lw	a6,0(a0)
	bne	a6,zero,.+8
	jal	x0,.L728
	lw	a3,0(a1)
	addi	a5,a6,0
	jal	x0,.L723
.L726:
	lw	a5,8(a5)
	bne	a5,zero,.+8
	jal	x0,.L725
.L723:
	lw	a4,0(a5)
	bne	a4,a3,.L726
.L727:
	sw	a5,0(a2)
	lw	a1,0(a0)
	lw	a4,8(a5)
	lw	a3,4(a5)
	bne	a1,a5,.+8
	jal	x0,.L751
	bne	a3,zero,.+8
	jal	x0,.L734
.L732:
	sw	a4,8(a3)
	lw	a4,8(a5)
.L734:
	bne	a4,zero,.+8
	jal	x0,.L733
.L735:
	sw	a3,4(a4)
.L733:
	sw	a1,0(a0)
	lw	a0,0(a2)
	bltu	zero,a0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
.L751:
	bne	a4,zero,.+8
	jal	x0,.L752
	addi	a1,a4,0
	bne	a3,zero,.+8
	jal	x0,.L735
	sw	a4,8(a3)
	lw	a4,8(a5)
	jal	x0,.L734
.L725:
	lw	a5,4(a6)
	bne	a5,zero,.L737
	jal	x0,.L728
.L729:
	lw	a5,4(a5)
	bne	a5,zero,.+8
	jal	x0,.L728
.L737:
	lw	a4,0(a5)
	bne	a3,a4,.L729
	jal	x0,.L727
.L752:
	addi	a1,a3,0
	bne	a3,zero,.L732
	jal	x0,.L733
.L728:
	sw	zero,0(a2)
	addi	a0,zero,0
	jalr	zero,ra,0
	.size	sglib_dllist_delete_if_member, .-sglib_dllist_delete_if_member
	.align	2
	.globl	sglib_dllist_is_member
	.type	sglib_dllist_is_member, @function
sglib_dllist_is_member:
	addi	a5,a0,0
	bne	a0,a1,.+8
	jal	x0,.L763
	bne	a0,zero,.+8
	jal	x0,.L763
.L755:
	lw	a5,8(a5)
	bltu	zero,a5,.+12
	addi	a4,x0,0
	jal	x0,.+8
	addi	a4,x0,1
	bne	a1,a5,.+8
	jal	x0,.L754
	bne	a4,zero,.L755
.L754:
	bne	a5,zero,.L764
	bne	a0,zero,.+8
	jal	x0,.L764
	lw	a5,4(a0)
	bltu	zero,a5,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	bne	a1,a5,.+8
	jal	x0,.L753
.L788:
	bne	a0,zero,.+8
	jal	x0,.L753
	lw	a5,4(a5)
	bltu	zero,a5,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	bne	a1,a5,.L788
.L753:
	jalr	zero,ra,0
.L764:
	addi	a0,a4,0
	jalr	zero,ra,0
.L763:
	bltu	zero,a0,.+12
	addi	a4,x0,0
	jal	x0,.+8
	addi	a4,x0,1
	jal	x0,.L754
	.size	sglib_dllist_is_member, .-sglib_dllist_is_member
	.align	2
	.globl	sglib_dllist_find_member
	.type	sglib_dllist_find_member, @function
sglib_dllist_find_member:
	bne	a0,zero,.+8
	jal	x0,.L796
	lw	a3,0(a1)
	addi	a5,a0,0
	jal	x0,.L791
.L793:
	lw	a5,8(a5)
	bne	a5,zero,.+8
	jal	x0,.L792
.L791:
	lw	a4,0(a5)
	bne	a4,a3,.L793
.L789:
	addi	a0,a5,0
	jalr	zero,ra,0
.L792:
	lw	a5,4(a0)
	bne	a5,zero,.+8
	jal	x0,.L789
	lw	a4,0(a5)
	bne	a3,a4,.+8
	jal	x0,.L789
.L794:
	lw	a5,4(a5)
	bne	a5,zero,.+8
	jal	x0,.L789
	lw	a4,0(a5)
	bne	a3,a4,.L794
	addi	a0,a5,0
	jalr	zero,ra,0
.L796:
	addi	a5,zero,0
	jal	x0,.L789
	.size	sglib_dllist_find_member, .-sglib_dllist_find_member
	.align	2
	.globl	sglib_dllist_get_first
	.type	sglib_dllist_get_first, @function
sglib_dllist_get_first:
	addi	a5,a0,0
	bne	a0,zero,.+8
	jal	x0,.L805
.L804:
	addi	a0,a5,0
	lw	a5,8(a5)
	bne	a5,zero,.L804
	jalr	zero,ra,0
.L805:
	addi	a0,zero,0
	jalr	zero,ra,0
	.size	sglib_dllist_get_first, .-sglib_dllist_get_first
	.align	2
	.globl	sglib_dllist_get_last
	.type	sglib_dllist_get_last, @function
sglib_dllist_get_last:
	addi	a5,a0,0
	bne	a0,zero,.+8
	jal	x0,.L810
.L809:
	addi	a0,a5,0
	lw	a5,4(a5)
	bne	a5,zero,.L809
	jalr	zero,ra,0
.L810:
	addi	a0,zero,0
	jalr	zero,ra,0
	.size	sglib_dllist_get_last, .-sglib_dllist_get_last
	.align	2
	.globl	sglib_dllist_sort
	.type	sglib_dllist_sort, @function
sglib_dllist_sort:
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L872
	addi	sp,sp,-16
.L814:
	addi	a1,a5,0
	lw	a5,8(a5)
	bne	a5,zero,.L814
	addi	a6,zero,1
	addi	t3,a6,0
.L836:
	sw	zero,12(sp)
	addi	t1,zero,0
	addi	a3,sp,12
.L815:
	addi	a4,a1,0
	addi	a2,zero,1
	bge	t3,a6,.L875
.L816:
	lw	a4,4(a4)
	addi	a2,a2,1
	bge	a2,a6,.+8
	jal	x0,.+12
	addi	a5,x0,0
	jal	x0,.+8
	addi	a5,x0,1
	bltu	zero,a4,.+12
	addi	a7,x0,0
	jal	x0,.+8
	addi	a7,x0,1
	or	op_1,a5,a7
	sub	op_0,op_1,a7
	sub	a5,a5,op_0
	bne	a5,zero,.L816
	bne	a4,zero,.+8
	jal	x0,.L876
	lw	a5,4(a4)
	sw	zero,4(a4)
	bne	a5,zero,.+8
	jal	x0,.L843
	addi	a4,a5,0
	addi	a2,zero,1
.L821:
	addi	a2,a2,1
	lw	a4,4(a4)
	bge	a2,a6,.L823
	bne	a4,zero,.L821
.L823:
	addi	a7,zero,0
	bne	a4,zero,.+8
	jal	x0,.L825
	lw	a7,4(a4)
	sw	zero,4(a4)
.L825:
	lw	a2,0(a1)
.L874:
	lw	a4,0(a5)
.L831:
	bge	a2,a4,.+8
	jal	x0,.L877
	sw	a5,0(a3)
	addi	a3,a5,4
	lw	a5,4(a5)
	bne	a5,zero,.L874
.L826:
	sw	a1,0(a3)
	addi	a5,a1,0
	addi	a1,a7,0
.L832:
	addi	a3,a5,0
	lw	a5,4(a5)
	bne	a5,zero,.L832
	addi	a3,a3,4
	addi	t1,zero,1
	bne	a7,zero,.L815
	lw	a1,12(sp)
	addi	op_0,x0,1
	sll	a6,a6,op_0
	bne	a1,zero,.L836
.L835:
	sw	a1,0(a0)
	addi	sp,sp,16
	jalr	zero,ra,0
.L877:
	sw	a1,0(a3)
	lw	a2,4(a1)
	addi	a3,a1,4
	bne	a2,zero,.+8
	jal	x0,.L878
	addi	a1,a2,0
	lw	a2,0(a2)
	jal	x0,.L831
.L878:
	sw	a5,4(a1)
	addi	a1,a7,0
	jal	x0,.L832
.L875:
	lw	a4,4(a1)
	sw	zero,4(a1)
	addi	a5,a4,0
	bne	a4,zero,.+8
	jal	x0,.L879
	lw	a7,4(a4)
	sw	zero,4(a4)
	bne	a4,zero,.+8
	jal	x0,.L826
	lw	a2,0(a1)
	jal	x0,.L874
.L876:
	sw	a1,0(a3)
	lw	a1,12(sp)
	bne	t1,zero,.+8
	jal	x0,.L880
	addi	op_0,x0,1
	sll	a6,a6,op_0
	bne	a1,zero,.L836
	jal	x0,.L835
.L879:
	bne	a4,zero,.L881
.L843:
	addi	a7,zero,0
	jal	x0,.L826
.L880:
	bne	a1,zero,.+8
	jal	x0,.L835
	addi	a5,a1,0
.L839:
	sw	a4,8(a5)
	addi	a4,a5,0
	lw	a5,4(a5)
	bne	a5,zero,.L839
	sw	a1,0(a0)
	addi	sp,sp,16
	jalr	zero,ra,0
.L872:
	jalr	zero,ra,0
.L881:
	lw	a2,0(a1)
	addi	a7,zero,0
	jal	x0,.L874
	.size	sglib_dllist_sort, .-sglib_dllist_sort
	.align	2
	.globl	sglib_dllist_len
	.type	sglib_dllist_len, @function
sglib_dllist_len:
	addi	a4,zero,0
	bne	a0,zero,.+8
	jal	x0,.L882
	addi	a5,a0,0
	addi	a4,zero,0
.L884:
	lw	a5,8(a5)
	addi	a4,a4,1
	bne	a5,zero,.L884
	lw	a5,4(a0)
	bne	a5,zero,.+8
	jal	x0,.L882
	addi	a3,zero,0
.L886:
	lw	a5,4(a5)
	addi	a3,a3,1
	bne	a5,zero,.L886
	sub	op_0,x0,a4
	sub	a4,a3,op_0
.L882:
	addi	a0,a4,0
	jalr	zero,ra,0
	.size	sglib_dllist_len, .-sglib_dllist_len
	.align	2
	.globl	sglib_dllist_reverse
	.type	sglib_dllist_reverse, @function
sglib_dllist_reverse:
	lw	a3,0(a0)
	bne	a3,zero,.+8
	jal	x0,.L893
	lw	a4,4(a3)
	lw	a5,8(a3)
	sw	a4,8(a3)
	sw	a5,4(a3)
	bne	a5,zero,.+8
	jal	x0,.L907
.L896:
	lw	a2,4(a5)
	addi	a3,a5,0
	lw	a5,8(a5)
	sw	a2,8(a3)
	sw	a5,4(a3)
	bne	a5,zero,.L896
.L907:
	bne	a4,zero,.+8
	jal	x0,.L893
.L898:
	lw	a3,8(a4)
	addi	a5,a4,0
	lw	a4,4(a4)
	sw	a3,4(a5)
	sw	a4,8(a5)
	bne	a4,zero,.L898
.L893:
	jalr	zero,ra,0
	.size	sglib_dllist_reverse, .-sglib_dllist_reverse
	.align	2
	.globl	sglib_dllist_it_current
	.type	sglib_dllist_it_current, @function
sglib_dllist_it_current:
	lw	a0,0(a0)
	jalr	zero,ra,0
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
	addi	s2,a0,0
	bne	s1,zero,.+8
	jal	x0,.L910
	sw	s3,12(sp)
	bne	s0,zero,.+8
	jal	x0,.L936
	lw	s3,16(a0)
	jal	x0,.L913
.L915:
	lw	s0,8(s0)
	bne	s0,zero,.+8
	jal	x0,.L914
.L913:
	addi	a1,s0,0
	addi	a0,s3,0
	jalr	ra,s1,0
	bne	a0,zero,.L915
	lw	s3,12(sp)
.L923:
	lw	a5,8(s0)
	sw	a5,4(s2)
.L916:
	sw	s0,0(s2)
	lw	ra,28(sp)
	addi	a0,s0,0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L910:
	bne	s0,zero,.L923
	lw	s0,8(s2)
	sw	zero,8(s2)
	bne	s0,zero,.L920
	jal	x0,.L916
.L914:
	lw	s1,12(s2)
	lw	s0,8(s2)
	sw	zero,8(s2)
	bne	s1,zero,.+8
	jal	x0,.L937
	bne	s0,zero,.+8
	jal	x0,.L935
.L938:
	lw	s3,16(s2)
	jal	x0,.L917
.L919:
	lw	s0,4(s0)
	bne	s0,zero,.+8
	jal	x0,.L935
.L917:
	addi	a1,s3,0
	addi	a0,s0,0
	jalr	ra,s1,0
	bne	a0,zero,.L919
	lw	s3,12(sp)
.L920:
	lw	a5,4(s0)
	lw	ra,28(sp)
	sw	s0,0(s2)
	addi	a0,s0,0
	lw	s0,24(sp)
	sw	a5,8(s2)
	lw	s1,20(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L937:
	lw	s3,12(sp)
	bne	s0,zero,.L920
	jal	x0,.L916
.L935:
	lw	s3,12(sp)
	lw	ra,28(sp)
	sw	s0,0(s2)
	addi	a0,s0,0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L936:
	lw	s0,8(a0)
	sw	zero,8(a0)
	bne	s0,zero,.L938
	jal	x0,.L935
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
	bne	a1,zero,.+8
	jal	x0,.L940
	lw	a5,4(a1)
	sw	a5,8(a0)
.L940:
.Lpcrel_114:
	auipc	ra,%pcrel_hi(sglib_dllist_it_next)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_114)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
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
	bne	a1,zero,.+8
	jal	x0,.L946
	lw	a5,4(a1)
	sw	a5,8(a0)
.L946:
.Lpcrel_115:
	auipc	ra,%pcrel_hi(sglib_dllist_it_next)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_115)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
	.size	sglib_dllist_it_init, .-sglib_dllist_it_init
	.align	2
	.globl	ilist_hash_function
	.type	ilist_hash_function, @function
ilist_hash_function:
	lw	a0,0(a0)
	jalr	zero,ra,0
	.size	ilist_hash_function, .-ilist_hash_function
	.align	2
	.globl	sglib_ilist_is_member
	.type	sglib_ilist_is_member, @function
sglib_ilist_is_member:
	addi	a5,a0,0
	bltu	zero,a0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	bne	a5,a1,.+8
	jal	x0,.L953
.L966:
	bne	a0,zero,.+8
	jal	x0,.L953
	lw	a5,4(a5)
	bltu	zero,a5,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	bne	a1,a5,.L966
.L953:
	jalr	zero,ra,0
	.size	sglib_ilist_is_member, .-sglib_ilist_is_member
	.align	2
	.globl	sglib_ilist_find_member
	.type	sglib_ilist_find_member, @function
sglib_ilist_find_member:
	bne	a0,zero,.+8
	jal	x0,.L967
	lw	a4,0(a1)
	jal	x0,.L969
.L970:
	lw	a0,4(a0)
	bne	a0,zero,.+8
	jal	x0,.L967
.L969:
	lw	a5,0(a0)
	bne	a5,a4,.L970
.L967:
	jalr	zero,ra,0
	.size	sglib_ilist_find_member, .-sglib_ilist_find_member
	.align	2
	.globl	sglib_ilist_add_if_not_member
	.type	sglib_ilist_add_if_not_member, @function
sglib_ilist_add_if_not_member:
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L976
	lw	a3,0(a1)
	jal	x0,.L977
.L978:
	lw	a5,4(a5)
	bne	a5,zero,.+8
	jal	x0,.L976
.L977:
	lw	a4,0(a5)
	bne	a4,a3,.L978
	sw	a5,0(a2)
	addi	a0,zero,0
	jalr	zero,ra,0
.L976:
	sw	zero,0(a2)
	lw	a5,0(a0)
	sw	a5,4(a1)
	sw	a1,0(a0)
	lw	a0,0(a2)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
	.size	sglib_ilist_add_if_not_member, .-sglib_ilist_add_if_not_member
	.align	2
	.globl	sglib_ilist_add
	.type	sglib_ilist_add, @function
sglib_ilist_add:
	lw	a5,0(a0)
	sw	a5,4(a1)
	sw	a1,0(a0)
	jalr	zero,ra,0
	.size	sglib_ilist_add, .-sglib_ilist_add
	.align	2
	.globl	sglib_ilist_concat
	.type	sglib_ilist_concat, @function
sglib_ilist_concat:
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L994
.L990:
	addi	a4,a5,0
	lw	a5,4(a5)
	bne	a5,zero,.L990
	sw	a1,4(a4)
	jalr	zero,ra,0
.L994:
	sw	a1,0(a0)
	jalr	zero,ra,0
	.size	sglib_ilist_concat, .-sglib_ilist_concat
	.align	2
	.globl	sglib_ilist_delete
	.type	sglib_ilist_delete, @function
sglib_ilist_delete:
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L997
.L996:
	bne	a1,a5,.+8
	jal	x0,.L1004
	addi	a0,a5,4
	lw	a5,4(a5)
	bne	a5,zero,.L996
.L997:
	lw	a5,4(zero)
.L1004:
	lw	a5,4(a1)
	sw	a5,0(a0)
	jalr	zero,ra,0
	.size	sglib_ilist_delete, .-sglib_ilist_delete
	.align	2
	.globl	sglib_ilist_delete_if_member
	.type	sglib_ilist_delete_if_member, @function
sglib_ilist_delete_if_member:
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L1009
	lw	a3,0(a1)
	jal	x0,.L1007
.L1010:
	addi	a0,a5,4
	lw	a5,4(a5)
	bne	a5,zero,.+8
	jal	x0,.L1009
.L1007:
	lw	a4,0(a5)
	bne	a4,a3,.L1010
	sw	a5,0(a2)
	lw	a5,4(a5)
	sw	a5,0(a0)
	lw	a0,0(a2)
	bltu	zero,a0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
.L1009:
	sw	zero,0(a2)
	addi	a0,zero,0
	jalr	zero,ra,0
	.size	sglib_ilist_delete_if_member, .-sglib_ilist_delete_if_member
	.align	2
	.globl	sglib_ilist_sort
	.type	sglib_ilist_sort, @function
sglib_ilist_sort:
	lw	a1,0(a0)
	addi	a6,zero,1
	addi	sp,sp,-16
	addi	t3,a6,0
.L1035:
	sw	zero,12(sp)
	bne	a1,zero,.+8
	jal	x0,.L1016
.L1038:
	addi	t1,zero,0
	addi	a3,sp,12
.L1015:
	addi	a4,a1,0
	addi	a2,zero,1
	bge	t3,a6,.L1061
.L1017:
	lw	a4,4(a4)
	addi	a2,a2,1
	bge	a2,a6,.+8
	jal	x0,.+12
	addi	a5,x0,0
	jal	x0,.+8
	addi	a5,x0,1
	bltu	zero,a4,.+12
	addi	a7,x0,0
	jal	x0,.+8
	addi	a7,x0,1
	or	op_1,a5,a7
	sub	op_0,op_1,a7
	sub	a5,a5,op_0
	bne	a5,zero,.L1017
	bne	a4,zero,.+8
	jal	x0,.L1062
	lw	a5,4(a4)
	sw	zero,4(a4)
	bne	a5,zero,.+8
	jal	x0,.L1040
	addi	a4,a5,0
	addi	a2,zero,1
.L1021:
	addi	a2,a2,1
	lw	a4,4(a4)
	bge	a2,a6,.L1023
	bne	a4,zero,.L1021
.L1023:
	addi	a7,zero,0
	bne	a4,zero,.+8
	jal	x0,.L1025
	lw	a7,4(a4)
	sw	zero,4(a4)
.L1025:
	lw	a2,0(a1)
.L1060:
	lw	a4,0(a5)
.L1031:
	bge	a2,a4,.+8
	jal	x0,.L1063
	sw	a5,0(a3)
	addi	a3,a5,4
	lw	a5,4(a5)
	bne	a5,zero,.L1060
.L1026:
	sw	a1,0(a3)
	addi	a5,a1,0
	addi	a1,a7,0
.L1032:
	addi	a3,a5,0
	lw	a5,4(a5)
	bne	a5,zero,.L1032
	addi	a3,a3,4
	addi	t1,zero,1
	bne	a7,zero,.L1015
	lw	a1,12(sp)
	sw	zero,12(sp)
	addi	op_0,x0,1
	sll	a6,a6,op_0
	bne	a1,zero,.L1038
.L1016:
	sw	a1,0(a0)
	addi	sp,sp,16
	jalr	zero,ra,0
.L1063:
	sw	a1,0(a3)
	lw	a2,4(a1)
	addi	a3,a1,4
	bne	a2,zero,.+8
	jal	x0,.L1064
	addi	a1,a2,0
	lw	a2,0(a2)
	jal	x0,.L1031
.L1064:
	sw	a5,4(a1)
	addi	a1,a7,0
	jal	x0,.L1032
.L1061:
	lw	a4,4(a1)
	sw	zero,4(a1)
	addi	a5,a4,0
	bne	a4,zero,.+8
	jal	x0,.L1065
	lw	a7,4(a4)
	sw	zero,4(a4)
	bne	a4,zero,.+8
	jal	x0,.L1026
	lw	a2,0(a1)
	jal	x0,.L1060
.L1062:
	sw	a1,0(a3)
	lw	a1,12(sp)
	bne	t1,zero,.+8
	jal	x0,.L1016
	addi	op_0,x0,1
	sll	a6,a6,op_0
	jal	x0,.L1035
.L1065:
	bne	a4,zero,.L1066
.L1040:
	addi	a7,zero,0
	jal	x0,.L1026
.L1066:
	lw	a2,0(a1)
	addi	a7,zero,0
	jal	x0,.L1060
	.size	sglib_ilist_sort, .-sglib_ilist_sort
	.align	2
	.globl	sglib_ilist_len
	.type	sglib_ilist_len, @function
sglib_ilist_len:
	addi	a5,a0,0
	addi	a0,zero,0
	bne	a5,zero,.+8
	jal	x0,.L1070
.L1069:
	lw	a5,4(a5)
	addi	a0,a0,1
	bne	a5,zero,.L1069
	jalr	zero,ra,0
.L1070:
	jalr	zero,ra,0
	.size	sglib_ilist_len, .-sglib_ilist_len
	.align	2
	.globl	sglib_ilist_reverse
	.type	sglib_ilist_reverse, @function
sglib_ilist_reverse:
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L1073
	addi	a3,zero,0
	jal	x0,.L1074
.L1075:
	addi	a5,a4,0
.L1074:
	lw	a4,4(a5)
	sw	a3,4(a5)
	addi	a3,a5,0
	bne	a4,zero,.L1075
.L1073:
	sw	a5,0(a0)
	jalr	zero,ra,0
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
	addi	s3,a0,0
	addi	s0,a1,0
	bne	a2,zero,.+8
	jal	x0,.L1080
	sw	s1,20(sp)
	sw	s2,16(sp)
	addi	s1,a2,0
	addi	s2,a3,0
	bne	a1,zero,.L1081
	jal	x0,.L1092
.L1084:
	lw	s0,4(s0)
	bne	s0,zero,.+8
	jal	x0,.L1083
.L1081:
	addi	a1,s2,0
	addi	a0,s0,0
	jalr	ra,s1,0
	bne	a0,zero,.L1084
	lw	s1,20(sp)
	lw	s2,16(sp)
	sw	s0,0(s3)
.L1086:
	lw	a5,4(s0)
	sw	a5,4(s3)
.L1087:
	addi	a0,s0,0
.L1079:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L1080:
	sw	a1,0(a0)
	bne	a1,zero,.L1086
	addi	s0,zero,0
	jal	x0,.L1087
.L1083:
	lw	s1,20(sp)
	lw	s2,16(sp)
	sw	zero,0(s3)
	addi	s0,zero,0
	jal	x0,.L1087
.L1092:
	sw	zero,0(a0)
	lw	s1,20(sp)
	lw	s2,16(sp)
	addi	a0,zero,0
	jal	x0,.L1079
	.size	sglib_ilist_it_init_on_equal, .-sglib_ilist_it_init_on_equal
	.align	2
	.globl	sglib_ilist_it_init
	.type	sglib_ilist_it_init, @function
sglib_ilist_it_init:
	sw	zero,8(a0)
	sw	zero,12(a0)
	sw	zero,4(a0)
	sw	a1,0(a0)
	bne	a1,zero,.+8
	jal	x0,.L1094
	lw	a4,4(a1)
	sw	a4,4(a0)
.L1094:
	addi	a0,a1,0
	jalr	zero,ra,0
	.size	sglib_ilist_it_init, .-sglib_ilist_it_init
	.align	2
	.globl	sglib_ilist_it_current
	.type	sglib_ilist_it_current, @function
sglib_ilist_it_current:
	lw	a0,0(a0)
	jalr	zero,ra,0
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
	addi	s3,a0,0
	bne	s1,zero,.+8
	jal	x0,.L1100
	bne	s0,zero,.+8
	jal	x0,.L1101
	sw	s2,16(sp)
	lw	s2,12(a0)
	jal	x0,.L1102
.L1105:
	lw	s0,4(s0)
	bne	s0,zero,.+8
	jal	x0,.L1104
.L1102:
	addi	a1,s2,0
	addi	a0,s0,0
	jalr	ra,s1,0
	bne	a0,zero,.L1105
	lw	s2,16(sp)
	sw	s0,0(s3)
.L1107:
	lw	a5,4(s0)
	sw	a5,4(s3)
.L1099:
	lw	ra,28(sp)
	addi	a0,s0,0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L1100:
	sw	s0,0(a0)
	bne	s0,zero,.L1107
	addi	s0,zero,0
.L1112:
	lw	ra,28(sp)
	addi	a0,s0,0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L1104:
	lw	s2,16(sp)
	sw	zero,0(s3)
	addi	s0,zero,0
	jal	x0,.L1112
.L1101:
	sw	zero,0(a0)
	jal	x0,.L1099
	.size	sglib_ilist_it_next, .-sglib_ilist_it_next
	.align	2
	.globl	sglib_hashed_ilist_init
	.type	sglib_hashed_ilist_init, @function
sglib_hashed_ilist_init:
	addi	a5,a0,80
.L1114:
	sw	zero,0(a0)
	addi	a0,a0,4
	bne	a0,a5,.L1114
	jalr	zero,ra,0
	.size	sglib_hashed_ilist_init, .-sglib_hashed_ilist_init
	.align	2
	.globl	sglib_hashed_ilist_add
	.type	sglib_hashed_ilist_add, @function
sglib_hashed_ilist_add:
	lw	a4,0(a1)
	lui	a5,838861
	addi	a5,a5,-819
	lui	op_8,16
	addi	op_7,op_8,-1
	or	op_6,a4,op_7
	lui	op_10,16
	addi	op_9,op_10,-1
	sub	op_5,op_6,op_9
	sub	op_4,a4,op_5
	lui	op_15,16
	addi	op_14,op_15,-1
	or	op_13,a5,op_14
	lui	op_17,16
	addi	op_16,op_17,-1
	sub	op_12,op_13,op_16
	sub	op_11,a5,op_12
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
	or	op_36,a5,op_37
	lui	op_40,16
	addi	op_39,op_40,-1
	sub	op_35,op_36,op_39
	sub	op_34,a5,op_35
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
	or	op_57,a5,op_58
	lui	op_61,16
	addi	op_60,op_61,-1
	sub	op_56,op_57,op_60
	sub	op_55,a5,op_56
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
	srl	op_77,a5,op_78
	addi	op_82,x0,16
	srl	op_81,a5,op_82
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
	srl	op_98,a5,op_99
	addi	op_103,x0,16
	srl	op_102,a5,op_103
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
	or	op_130,a5,op_131
	lui	op_134,16
	addi	op_133,op_134,-1
	sub	op_129,op_130,op_133
	sub	op_128,a5,op_129
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
	srl	op_148,a5,op_149
	addi	op_153,x0,16
	srl	op_152,a5,op_153
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
	srl	op_173,a5,op_174
	addi	op_178,x0,16
	srl	op_177,a5,op_178
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
	sub	a5,op_0,op_113
	addi	op_0,x0,4
	srl	a5,a5,op_0
	addi	op_0,x0,2
	sll	a3,a5,op_0
	sub	op_0,x0,a3
	sub	a5,a5,op_0
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	a4,a4,a5
	addi	op_0,x0,2
	sll	a4,a4,op_0
	sub	op_0,x0,a0
	sub	a0,a4,op_0
	lw	a5,0(a0)
	sw	a5,4(a1)
	sw	a1,0(a0)
	jalr	zero,ra,0
	.size	sglib_hashed_ilist_add, .-sglib_hashed_ilist_add
	.align	2
	.globl	sglib_hashed_ilist_add_if_not_member
	.type	sglib_hashed_ilist_add_if_not_member, @function
sglib_hashed_ilist_add_if_not_member:
	lw	a3,0(a1)
	lui	a4,838861
	addi	a4,a4,-819
	lui	op_8,16
	addi	op_7,op_8,-1
	or	op_6,a3,op_7
	lui	op_10,16
	addi	op_9,op_10,-1
	sub	op_5,op_6,op_9
	sub	op_4,a3,op_5
	lui	op_15,16
	addi	op_14,op_15,-1
	or	op_13,a4,op_14
	lui	op_17,16
	addi	op_16,op_17,-1
	sub	op_12,op_13,op_16
	sub	op_11,a4,op_12
	callmul	op_3,op_4,op_11
	addi	op_18,x0,16
	srl	op_2,op_3,op_18
	addi	op_25,x0,16
	srl	op_24,a3,op_25
	addi	op_29,x0,16
	srl	op_28,a3,op_29
	lui	op_31,16
	addi	op_30,op_31,-1
	or	op_27,op_28,op_30
	lui	op_33,16
	addi	op_32,op_33,-1
	sub	op_26,op_27,op_32
	sub	op_23,op_24,op_26
	lui	op_38,16
	addi	op_37,op_38,-1
	or	op_36,a4,op_37
	lui	op_40,16
	addi	op_39,op_40,-1
	sub	op_35,op_36,op_39
	sub	op_34,a4,op_35
	callmul	op_22,op_23,op_34
	addi	op_46,x0,16
	srl	op_45,a3,op_46
	addi	op_50,x0,16
	srl	op_49,a3,op_50
	lui	op_52,16
	addi	op_51,op_52,-1
	or	op_48,op_49,op_51
	lui	op_54,16
	addi	op_53,op_54,-1
	sub	op_47,op_48,op_53
	sub	op_44,op_45,op_47
	lui	op_59,16
	addi	op_58,op_59,-1
	or	op_57,a4,op_58
	lui	op_61,16
	addi	op_60,op_61,-1
	sub	op_56,op_57,op_60
	sub	op_55,a4,op_56
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
	or	op_71,a3,op_72
	lui	op_75,16
	addi	op_74,op_75,-1
	sub	op_70,op_71,op_74
	sub	op_69,a3,op_70
	addi	op_78,x0,16
	srl	op_77,a4,op_78
	addi	op_82,x0,16
	srl	op_81,a4,op_82
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
	or	op_92,a3,op_93
	lui	op_96,16
	addi	op_95,op_96,-1
	sub	op_91,op_92,op_95
	sub	op_90,a3,op_91
	addi	op_99,x0,16
	srl	op_98,a4,op_99
	addi	op_103,x0,16
	srl	op_102,a4,op_103
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
	srl	op_118,a3,op_119
	addi	op_123,x0,16
	srl	op_122,a3,op_123
	lui	op_125,16
	addi	op_124,op_125,-1
	or	op_121,op_122,op_124
	lui	op_127,16
	addi	op_126,op_127,-1
	sub	op_120,op_121,op_126
	sub	op_117,op_118,op_120
	lui	op_132,16
	addi	op_131,op_132,-1
	or	op_130,a4,op_131
	lui	op_134,16
	addi	op_133,op_134,-1
	sub	op_129,op_130,op_133
	sub	op_128,a4,op_129
	callmul	op_116,op_117,op_128
	addi	op_135,x0,16
	srl	op_115,op_116,op_135
	lui	op_144,16
	addi	op_143,op_144,-1
	or	op_142,a3,op_143
	lui	op_146,16
	addi	op_145,op_146,-1
	sub	op_141,op_142,op_145
	sub	op_140,a3,op_141
	addi	op_149,x0,16
	srl	op_148,a4,op_149
	addi	op_153,x0,16
	srl	op_152,a4,op_153
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
	srl	op_162,a3,op_163
	addi	op_167,x0,16
	srl	op_166,a3,op_167
	lui	op_169,16
	addi	op_168,op_169,-1
	or	op_165,op_166,op_168
	lui	op_171,16
	addi	op_170,op_171,-1
	sub	op_164,op_165,op_170
	sub	op_161,op_162,op_164
	addi	op_174,x0,16
	srl	op_173,a4,op_174
	addi	op_178,x0,16
	srl	op_177,a4,op_178
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
	addi	op_0,x0,4
	srl	a4,a4,op_0
	addi	op_0,x0,2
	sll	a5,a4,op_0
	sub	op_0,x0,a5
	sub	a5,a4,op_0
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	a5,a3,a5
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	op_0,x0,a0
	sub	a0,a5,op_0
	lw	a5,0(a0)
	bne	a5,zero,.L1118
	jal	x0,.L1119
.L1120:
	lw	a5,4(a5)
	bne	a5,zero,.+8
	jal	x0,.L1119
.L1118:
	lw	a4,0(a5)
	bne	a4,a3,.L1120
	sw	a5,0(a2)
	addi	a0,zero,0
	jalr	zero,ra,0
.L1119:
	sw	zero,0(a2)
	lw	a5,0(a0)
	sw	a5,4(a1)
	sw	a1,0(a0)
	lw	a0,0(a2)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
	.size	sglib_hashed_ilist_add_if_not_member, .-sglib_hashed_ilist_add_if_not_member
	.align	2
	.globl	sglib_hashed_ilist_delete
	.type	sglib_hashed_ilist_delete, @function
sglib_hashed_ilist_delete:
	lw	a4,0(a1)
	lui	a5,838861
	addi	a5,a5,-819
	lui	op_8,16
	addi	op_7,op_8,-1
	or	op_6,a4,op_7
	lui	op_10,16
	addi	op_9,op_10,-1
	sub	op_5,op_6,op_9
	sub	op_4,a4,op_5
	lui	op_15,16
	addi	op_14,op_15,-1
	or	op_13,a5,op_14
	lui	op_17,16
	addi	op_16,op_17,-1
	sub	op_12,op_13,op_16
	sub	op_11,a5,op_12
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
	or	op_36,a5,op_37
	lui	op_40,16
	addi	op_39,op_40,-1
	sub	op_35,op_36,op_39
	sub	op_34,a5,op_35
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
	or	op_57,a5,op_58
	lui	op_61,16
	addi	op_60,op_61,-1
	sub	op_56,op_57,op_60
	sub	op_55,a5,op_56
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
	srl	op_77,a5,op_78
	addi	op_82,x0,16
	srl	op_81,a5,op_82
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
	srl	op_98,a5,op_99
	addi	op_103,x0,16
	srl	op_102,a5,op_103
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
	or	op_130,a5,op_131
	lui	op_134,16
	addi	op_133,op_134,-1
	sub	op_129,op_130,op_133
	sub	op_128,a5,op_129
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
	srl	op_148,a5,op_149
	addi	op_153,x0,16
	srl	op_152,a5,op_153
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
	srl	op_173,a5,op_174
	addi	op_178,x0,16
	srl	op_177,a5,op_178
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
	sub	a5,op_0,op_113
	addi	op_0,x0,4
	srl	a5,a5,op_0
	addi	op_0,x0,2
	sll	a3,a5,op_0
	sub	op_0,x0,a3
	sub	a5,a5,op_0
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	a4,a4,a5
	addi	op_0,x0,2
	sll	a4,a4,op_0
	sub	op_0,x0,a0
	sub	a0,a4,op_0
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L1130
.L1129:
	bne	a1,a5,.+8
	jal	x0,.L1137
	addi	a0,a5,4
	lw	a5,4(a5)
	bne	a5,zero,.L1129
.L1130:
	lw	a5,4(zero)
.L1137:
	lw	a5,4(a1)
	sw	a5,0(a0)
	jalr	zero,ra,0
	.size	sglib_hashed_ilist_delete, .-sglib_hashed_ilist_delete
	.align	2
	.globl	sglib_hashed_ilist_delete_if_member
	.type	sglib_hashed_ilist_delete_if_member, @function
sglib_hashed_ilist_delete_if_member:
	lw	a3,0(a1)
	lui	a4,838861
	addi	a4,a4,-819
	lui	op_8,16
	addi	op_7,op_8,-1
	or	op_6,a3,op_7
	lui	op_10,16
	addi	op_9,op_10,-1
	sub	op_5,op_6,op_9
	sub	op_4,a3,op_5
	lui	op_15,16
	addi	op_14,op_15,-1
	or	op_13,a4,op_14
	lui	op_17,16
	addi	op_16,op_17,-1
	sub	op_12,op_13,op_16
	sub	op_11,a4,op_12
	callmul	op_3,op_4,op_11
	addi	op_18,x0,16
	srl	op_2,op_3,op_18
	addi	op_25,x0,16
	srl	op_24,a3,op_25
	addi	op_29,x0,16
	srl	op_28,a3,op_29
	lui	op_31,16
	addi	op_30,op_31,-1
	or	op_27,op_28,op_30
	lui	op_33,16
	addi	op_32,op_33,-1
	sub	op_26,op_27,op_32
	sub	op_23,op_24,op_26
	lui	op_38,16
	addi	op_37,op_38,-1
	or	op_36,a4,op_37
	lui	op_40,16
	addi	op_39,op_40,-1
	sub	op_35,op_36,op_39
	sub	op_34,a4,op_35
	callmul	op_22,op_23,op_34
	addi	op_46,x0,16
	srl	op_45,a3,op_46
	addi	op_50,x0,16
	srl	op_49,a3,op_50
	lui	op_52,16
	addi	op_51,op_52,-1
	or	op_48,op_49,op_51
	lui	op_54,16
	addi	op_53,op_54,-1
	sub	op_47,op_48,op_53
	sub	op_44,op_45,op_47
	lui	op_59,16
	addi	op_58,op_59,-1
	or	op_57,a4,op_58
	lui	op_61,16
	addi	op_60,op_61,-1
	sub	op_56,op_57,op_60
	sub	op_55,a4,op_56
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
	or	op_71,a3,op_72
	lui	op_75,16
	addi	op_74,op_75,-1
	sub	op_70,op_71,op_74
	sub	op_69,a3,op_70
	addi	op_78,x0,16
	srl	op_77,a4,op_78
	addi	op_82,x0,16
	srl	op_81,a4,op_82
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
	or	op_92,a3,op_93
	lui	op_96,16
	addi	op_95,op_96,-1
	sub	op_91,op_92,op_95
	sub	op_90,a3,op_91
	addi	op_99,x0,16
	srl	op_98,a4,op_99
	addi	op_103,x0,16
	srl	op_102,a4,op_103
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
	srl	op_118,a3,op_119
	addi	op_123,x0,16
	srl	op_122,a3,op_123
	lui	op_125,16
	addi	op_124,op_125,-1
	or	op_121,op_122,op_124
	lui	op_127,16
	addi	op_126,op_127,-1
	sub	op_120,op_121,op_126
	sub	op_117,op_118,op_120
	lui	op_132,16
	addi	op_131,op_132,-1
	or	op_130,a4,op_131
	lui	op_134,16
	addi	op_133,op_134,-1
	sub	op_129,op_130,op_133
	sub	op_128,a4,op_129
	callmul	op_116,op_117,op_128
	addi	op_135,x0,16
	srl	op_115,op_116,op_135
	lui	op_144,16
	addi	op_143,op_144,-1
	or	op_142,a3,op_143
	lui	op_146,16
	addi	op_145,op_146,-1
	sub	op_141,op_142,op_145
	sub	op_140,a3,op_141
	addi	op_149,x0,16
	srl	op_148,a4,op_149
	addi	op_153,x0,16
	srl	op_152,a4,op_153
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
	srl	op_162,a3,op_163
	addi	op_167,x0,16
	srl	op_166,a3,op_167
	lui	op_169,16
	addi	op_168,op_169,-1
	or	op_165,op_166,op_168
	lui	op_171,16
	addi	op_170,op_171,-1
	sub	op_164,op_165,op_170
	sub	op_161,op_162,op_164
	addi	op_174,x0,16
	srl	op_173,a4,op_174
	addi	op_178,x0,16
	srl	op_177,a4,op_178
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
	addi	op_0,x0,4
	srl	a4,a4,op_0
	addi	op_0,x0,2
	sll	a5,a4,op_0
	sub	op_0,x0,a5
	sub	a5,a4,op_0
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	a5,a3,a5
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	op_0,x0,a0
	sub	a0,a5,op_0
	lw	a5,0(a0)
	bne	a5,zero,.L1139
	jal	x0,.L1141
.L1142:
	addi	a0,a5,4
	lw	a5,4(a5)
	bne	a5,zero,.+8
	jal	x0,.L1141
.L1139:
	lw	a4,0(a5)
	bne	a4,a3,.L1142
	sw	a5,0(a2)
	lw	a5,4(a5)
	sw	a5,0(a0)
	lw	a0,0(a2)
	bltu	zero,a0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
.L1141:
	sw	zero,0(a2)
	addi	a0,zero,0
	jalr	zero,ra,0
	.size	sglib_hashed_ilist_delete_if_member, .-sglib_hashed_ilist_delete_if_member
	.align	2
	.globl	sglib_hashed_ilist_is_member
	.type	sglib_hashed_ilist_is_member, @function
sglib_hashed_ilist_is_member:
	lw	a4,0(a1)
	lui	a5,838861
	addi	a5,a5,-819
	lui	op_8,16
	addi	op_7,op_8,-1
	or	op_6,a4,op_7
	lui	op_10,16
	addi	op_9,op_10,-1
	sub	op_5,op_6,op_9
	sub	op_4,a4,op_5
	lui	op_15,16
	addi	op_14,op_15,-1
	or	op_13,a5,op_14
	lui	op_17,16
	addi	op_16,op_17,-1
	sub	op_12,op_13,op_16
	sub	op_11,a5,op_12
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
	or	op_36,a5,op_37
	lui	op_40,16
	addi	op_39,op_40,-1
	sub	op_35,op_36,op_39
	sub	op_34,a5,op_35
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
	or	op_57,a5,op_58
	lui	op_61,16
	addi	op_60,op_61,-1
	sub	op_56,op_57,op_60
	sub	op_55,a5,op_56
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
	srl	op_77,a5,op_78
	addi	op_82,x0,16
	srl	op_81,a5,op_82
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
	srl	op_98,a5,op_99
	addi	op_103,x0,16
	srl	op_102,a5,op_103
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
	or	op_130,a5,op_131
	lui	op_134,16
	addi	op_133,op_134,-1
	sub	op_129,op_130,op_133
	sub	op_128,a5,op_129
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
	srl	op_148,a5,op_149
	addi	op_153,x0,16
	srl	op_152,a5,op_153
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
	srl	op_173,a5,op_174
	addi	op_178,x0,16
	srl	op_177,a5,op_178
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
	sub	a5,op_0,op_113
	addi	op_0,x0,4
	srl	a5,a5,op_0
	addi	op_0,x0,2
	sll	a3,a5,op_0
	sub	op_0,x0,a3
	sub	a5,a5,op_0
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	a4,a4,a5
	addi	op_0,x0,2
	sll	a4,a4,op_0
	sub	op_0,x0,a0
	sub	a0,a4,op_0
	lw	a5,0(a0)
	bltu	zero,a5,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	bne	a5,a1,.+8
	jal	x0,.L1148
.L1161:
	bne	a0,zero,.+8
	jal	x0,.L1148
	lw	a5,4(a5)
	bltu	zero,a5,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	bne	a1,a5,.L1161
.L1148:
	jalr	zero,ra,0
	.size	sglib_hashed_ilist_is_member, .-sglib_hashed_ilist_is_member
	.align	2
	.globl	sglib_hashed_ilist_find_member
	.type	sglib_hashed_ilist_find_member, @function
sglib_hashed_ilist_find_member:
	lw	a4,0(a1)
	lui	a3,838861
	addi	a3,a3,-819
	lui	op_8,16
	addi	op_7,op_8,-1
	or	op_6,a4,op_7
	lui	op_10,16
	addi	op_9,op_10,-1
	sub	op_5,op_6,op_9
	sub	op_4,a4,op_5
	lui	op_15,16
	addi	op_14,op_15,-1
	or	op_13,a3,op_14
	lui	op_17,16
	addi	op_16,op_17,-1
	sub	op_12,op_13,op_16
	sub	op_11,a3,op_12
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
	or	op_36,a3,op_37
	lui	op_40,16
	addi	op_39,op_40,-1
	sub	op_35,op_36,op_39
	sub	op_34,a3,op_35
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
	or	op_57,a3,op_58
	lui	op_61,16
	addi	op_60,op_61,-1
	sub	op_56,op_57,op_60
	sub	op_55,a3,op_56
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
	srl	op_77,a3,op_78
	addi	op_82,x0,16
	srl	op_81,a3,op_82
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
	srl	op_98,a3,op_99
	addi	op_103,x0,16
	srl	op_102,a3,op_103
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
	or	op_130,a3,op_131
	lui	op_134,16
	addi	op_133,op_134,-1
	sub	op_129,op_130,op_133
	sub	op_128,a3,op_129
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
	srl	op_148,a3,op_149
	addi	op_153,x0,16
	srl	op_152,a3,op_153
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
	srl	op_173,a3,op_174
	addi	op_178,x0,16
	srl	op_177,a3,op_178
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
	sub	a3,op_0,op_113
	addi	op_0,x0,4
	srl	a3,a3,op_0
	addi	op_0,x0,2
	sll	a5,a3,op_0
	sub	op_0,x0,a5
	sub	a5,a3,op_0
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	a5,a4,a5
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	op_0,x0,a0
	sub	a0,a5,op_0
	lw	a0,0(a0)
	bne	a0,zero,.L1163
	jalr	zero,ra,0
.L1165:
	lw	a0,4(a0)
	bne	a0,zero,.+8
	jal	x0,.L1162
.L1163:
	lw	a5,0(a0)
	bne	a5,a4,.L1165
.L1162:
	jalr	zero,ra,0
	.size	sglib_hashed_ilist_find_member, .-sglib_hashed_ilist_find_member
	.align	2
	.globl	sglib_hashed_ilist_it_current
	.type	sglib_hashed_ilist_it_current, @function
sglib_hashed_ilist_it_current:
	lw	a0,0(a0)
	jalr	zero,ra,0
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
	addi	s1,a0,0
	bne	s2,zero,.+8
	jal	x0,.L1172
	bne	s0,zero,.+8
	jal	x0,.L1176
	lw	s3,12(a0)
	jal	x0,.L1174
.L1177:
	lw	s0,4(s0)
	bne	s0,zero,.+8
	jal	x0,.L1176
.L1174:
	addi	a1,s3,0
	addi	a0,s0,0
	jalr	ra,s2,0
	bne	a0,zero,.L1177
	sw	s0,0(s1)
.L1189:
	lw	a5,4(s0)
	sw	a5,4(s1)
.L1171:
	lw	ra,28(sp)
	addi	a0,s0,0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L1172:
	sw	s0,0(a0)
	bne	s0,zero,.L1189
	sw	s4,8(sp)
	jal	x0,.L1175
.L1176:
	sw	s4,8(sp)
	sw	zero,0(s1)
.L1175:
	lw	a5,20(s1)
	addi	s4,zero,19
.L1180:
	addi	a5,a5,1
	sw	a5,20(s1)
	bge	s4,a5,.+8
	jal	x0,.L1201
.L1187:
	lw	a4,16(s1)
	lw	s2,24(s1)
	lw	s3,28(s1)
	addi	op_0,x0,2
	sll	a3,a5,op_0
	sub	op_0,x0,a4
	sub	a4,a3,op_0
	lw	s0,0(a4)
	sw	zero,4(s1)
	sw	s2,8(s1)
	sw	s3,12(s1)
	bne	s2,zero,.+8
	jal	x0,.L1181
	bne	s0,zero,.L1182
	jal	x0,.L1202
.L1185:
	lw	s0,4(s0)
	bne	s0,zero,.+8
	jal	x0,.L1184
.L1182:
	addi	a1,s3,0
	addi	a0,s0,0
	jalr	ra,s2,0
	bne	a0,zero,.L1185
	sw	s0,0(s1)
.L1188:
	lw	a5,4(s0)
	lw	ra,28(sp)
	addi	a0,s0,0
	lw	s0,24(sp)
	sw	a5,4(s1)
	lw	s4,8(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L1181:
	sw	s0,0(s1)
	bne	s0,zero,.L1188
	jal	x0,.L1180
.L1184:
	lw	a5,20(s1)
	sw	zero,0(s1)
	addi	a5,a5,1
	sw	a5,20(s1)
	bge	s4,a5,.L1187
.L1201:
	lw	s4,8(sp)
	addi	s0,zero,0
	jal	x0,.L1171
.L1202:
	sw	zero,0(s1)
	jal	x0,.L1180
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
	addi	s2,a0,0
	bne	a2,zero,.+8
	jal	x0,.L1204
	sw	s1,20(sp)
	sw	s3,12(sp)
	addi	s1,a2,0
	addi	s3,a3,0
	bne	s0,zero,.L1205
	jal	x0,.L1207
.L1208:
	lw	s0,4(s0)
	bne	s0,zero,.+8
	jal	x0,.L1207
.L1205:
	addi	a1,s3,0
	addi	a0,s0,0
	jalr	ra,s1,0
	bne	a0,zero,.L1208
	lw	s1,20(sp)
	lw	s3,12(sp)
	sw	s0,0(s2)
.L1210:
	lw	a5,4(s0)
	lw	ra,28(sp)
	addi	a0,s0,0
	lw	s0,24(sp)
	sw	a5,4(s2)
	lw	s2,16(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L1204:
	sw	s0,0(a0)
	bne	s0,zero,.L1210
	jal	x0,.L1206
.L1207:
	lw	s1,20(sp)
	lw	s3,12(sp)
	sw	zero,0(s2)
.L1206:
	addi	a0,s2,0
.Lpcrel_116:
	auipc	ra,%pcrel_hi(sglib_hashed_ilist_it_next)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_116)
	addi	s0,a0,0
	lw	ra,28(sp)
	addi	a0,s0,0
	lw	s0,24(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
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
	bne	a5,zero,.+8
	jal	x0,.L1222
	lw	a4,4(a5)
	sw	a4,4(a0)
	addi	a0,a5,0
	jalr	zero,ra,0
.L1222:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_117:
	auipc	ra,%pcrel_hi(sglib_hashed_ilist_it_next)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_117)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
	.size	sglib_hashed_ilist_it_init, .-sglib_hashed_ilist_it_init
	.align	2
	.globl	sglib_iq_init
	.type	sglib_iq_init, @function
sglib_iq_init:
	sw	zero,408(a0)
	sw	zero,404(a0)
	jalr	zero,ra,0
	.size	sglib_iq_init, .-sglib_iq_init
	.align	2
	.globl	sglib_iq_is_empty
	.type	sglib_iq_is_empty, @function
sglib_iq_is_empty:
	lw	a5,404(a0)
	lw	a4,408(a0)
	sub	a0,a5,a4
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
	.size	sglib_iq_is_empty, .-sglib_iq_is_empty
	.align	2
	.globl	sglib_iq_is_full
	.type	sglib_iq_is_full, @function
sglib_iq_is_full:
	lw	a4,408(a0)
	lui	a5,166111
	addi	a5,a5,203
	addi	a4,a4,1
	lui	op_7,16
	addi	op_6,op_7,-1
	or	op_5,a4,op_6
	lui	op_9,16
	addi	op_8,op_9,-1
	sub	op_4,op_5,op_8
	sub	op_3,a4,op_4
	addi	op_11,x0,16
	sra	op_10,a5,op_11
	callmul	op_2,op_3,op_10
	lui	op_21,16
	addi	op_20,op_21,-1
	or	op_19,a4,op_20
	lui	op_23,16
	addi	op_22,op_23,-1
	sub	op_18,op_19,op_22
	sub	op_17,a4,op_18
	lui	op_28,16
	addi	op_27,op_28,-1
	or	op_26,a5,op_27
	lui	op_30,16
	addi	op_29,op_30,-1
	sub	op_25,op_26,op_29
	sub	op_24,a5,op_25
	callmul	op_16,op_17,op_24
	addi	op_31,x0,16
	srl	op_15,op_16,op_31
	addi	op_35,x0,16
	sra	op_34,a4,op_35
	lui	op_40,16
	addi	op_39,op_40,-1
	or	op_38,a5,op_39
	lui	op_42,16
	addi	op_41,op_42,-1
	sub	op_37,op_38,op_41
	sub	op_36,a5,op_37
	callmul	op_33,op_34,op_36
	sub	op_32,x0,op_33
	sub	op_14,op_15,op_32
	lui	op_52,16
	addi	op_51,op_52,-1
	or	op_50,a4,op_51
	lui	op_54,16
	addi	op_53,op_54,-1
	sub	op_49,op_50,op_53
	sub	op_48,a4,op_49
	lui	op_59,16
	addi	op_58,op_59,-1
	or	op_57,a5,op_58
	lui	op_61,16
	addi	op_60,op_61,-1
	sub	op_56,op_57,op_60
	sub	op_55,a5,op_56
	callmul	op_47,op_48,op_55
	addi	op_62,x0,16
	srl	op_46,op_47,op_62
	addi	op_66,x0,16
	sra	op_65,a4,op_66
	lui	op_71,16
	addi	op_70,op_71,-1
	or	op_69,a5,op_70
	lui	op_73,16
	addi	op_72,op_73,-1
	sub	op_68,op_69,op_72
	sub	op_67,a5,op_68
	callmul	op_64,op_65,op_67
	sub	op_63,x0,op_64
	sub	op_45,op_46,op_63
	lui	op_75,16
	addi	op_74,op_75,-1
	or	op_44,op_45,op_74
	lui	op_77,16
	addi	op_76,op_77,-1
	sub	op_43,op_44,op_76
	sub	op_13,op_14,op_43
	sub	op_12,x0,op_13
	sub	op_1,op_2,op_12
	addi	op_78,x0,16
	sra	op_0,op_1,op_78
	lui	op_89,16
	addi	op_88,op_89,-1
	or	op_87,a4,op_88
	lui	op_91,16
	addi	op_90,op_91,-1
	sub	op_86,op_87,op_90
	sub	op_85,a4,op_86
	lui	op_96,16
	addi	op_95,op_96,-1
	or	op_94,a5,op_95
	lui	op_98,16
	addi	op_97,op_98,-1
	sub	op_93,op_94,op_97
	sub	op_92,a5,op_93
	callmul	op_84,op_85,op_92
	addi	op_99,x0,16
	srl	op_83,op_84,op_99
	addi	op_103,x0,16
	sra	op_102,a4,op_103
	lui	op_108,16
	addi	op_107,op_108,-1
	or	op_106,a5,op_107
	lui	op_110,16
	addi	op_109,op_110,-1
	sub	op_105,op_106,op_109
	sub	op_104,a5,op_105
	callmul	op_101,op_102,op_104
	sub	op_100,x0,op_101
	sub	op_82,op_83,op_100
	addi	op_111,x0,16
	sra	op_81,op_82,op_111
	addi	op_115,x0,16
	sra	op_114,a4,op_115
	addi	op_117,x0,16
	sra	op_116,a5,op_117
	callmul	op_113,op_114,op_116
	sub	op_112,x0,op_113
	sub	op_80,op_81,op_112
	sub	op_79,x0,op_80
	sub	a5,op_0,op_79
	addi	op_0,x0,31
	sra	a1,a4,op_0
	addi	a2,zero,101
	lw	a3,404(a0)
	addi	op_0,x0,4
	sra	a5,a5,op_0
	sub	a5,a5,a1
	callmul	a5,a5,a2
	sub	a0,a4,a5
	sub	a0,a0,a3
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jalr	zero,ra,0
	.size	sglib_iq_is_full, .-sglib_iq_is_full
	.align	2
	.globl	sglib_iq_first_element
	.type	sglib_iq_first_element, @function
sglib_iq_first_element:
	lw	a5,404(a0)
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	op_0,x0,a0
	sub	a0,a5,op_0
	lw	a0,0(a0)
	jalr	zero,ra,0
	.size	sglib_iq_first_element, .-sglib_iq_first_element
	.align	2
	.globl	sglib_iq_first_element_ptr
	.type	sglib_iq_first_element_ptr, @function
sglib_iq_first_element_ptr:
	lw	a5,404(a0)
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	op_0,x0,a0
	sub	a0,a5,op_0
	jalr	zero,ra,0
	.size	sglib_iq_first_element_ptr, .-sglib_iq_first_element_ptr
	.align	2
	.globl	sglib_iq_add_next
	.type	sglib_iq_add_next, @function
sglib_iq_add_next:
	lw	a4,408(a0)
	lui	a5,166111
	addi	a5,a5,203
	addi	a4,a4,1
	lui	op_7,16
	addi	op_6,op_7,-1
	or	op_5,a4,op_6
	lui	op_9,16
	addi	op_8,op_9,-1
	sub	op_4,op_5,op_8
	sub	op_3,a4,op_4
	addi	op_11,x0,16
	sra	op_10,a5,op_11
	callmul	op_2,op_3,op_10
	lui	op_21,16
	addi	op_20,op_21,-1
	or	op_19,a4,op_20
	lui	op_23,16
	addi	op_22,op_23,-1
	sub	op_18,op_19,op_22
	sub	op_17,a4,op_18
	lui	op_28,16
	addi	op_27,op_28,-1
	or	op_26,a5,op_27
	lui	op_30,16
	addi	op_29,op_30,-1
	sub	op_25,op_26,op_29
	sub	op_24,a5,op_25
	callmul	op_16,op_17,op_24
	addi	op_31,x0,16
	srl	op_15,op_16,op_31
	addi	op_35,x0,16
	sra	op_34,a4,op_35
	lui	op_40,16
	addi	op_39,op_40,-1
	or	op_38,a5,op_39
	lui	op_42,16
	addi	op_41,op_42,-1
	sub	op_37,op_38,op_41
	sub	op_36,a5,op_37
	callmul	op_33,op_34,op_36
	sub	op_32,x0,op_33
	sub	op_14,op_15,op_32
	lui	op_52,16
	addi	op_51,op_52,-1
	or	op_50,a4,op_51
	lui	op_54,16
	addi	op_53,op_54,-1
	sub	op_49,op_50,op_53
	sub	op_48,a4,op_49
	lui	op_59,16
	addi	op_58,op_59,-1
	or	op_57,a5,op_58
	lui	op_61,16
	addi	op_60,op_61,-1
	sub	op_56,op_57,op_60
	sub	op_55,a5,op_56
	callmul	op_47,op_48,op_55
	addi	op_62,x0,16
	srl	op_46,op_47,op_62
	addi	op_66,x0,16
	sra	op_65,a4,op_66
	lui	op_71,16
	addi	op_70,op_71,-1
	or	op_69,a5,op_70
	lui	op_73,16
	addi	op_72,op_73,-1
	sub	op_68,op_69,op_72
	sub	op_67,a5,op_68
	callmul	op_64,op_65,op_67
	sub	op_63,x0,op_64
	sub	op_45,op_46,op_63
	lui	op_75,16
	addi	op_74,op_75,-1
	or	op_44,op_45,op_74
	lui	op_77,16
	addi	op_76,op_77,-1
	sub	op_43,op_44,op_76
	sub	op_13,op_14,op_43
	sub	op_12,x0,op_13
	sub	op_1,op_2,op_12
	addi	op_78,x0,16
	sra	op_0,op_1,op_78
	lui	op_89,16
	addi	op_88,op_89,-1
	or	op_87,a4,op_88
	lui	op_91,16
	addi	op_90,op_91,-1
	sub	op_86,op_87,op_90
	sub	op_85,a4,op_86
	lui	op_96,16
	addi	op_95,op_96,-1
	or	op_94,a5,op_95
	lui	op_98,16
	addi	op_97,op_98,-1
	sub	op_93,op_94,op_97
	sub	op_92,a5,op_93
	callmul	op_84,op_85,op_92
	addi	op_99,x0,16
	srl	op_83,op_84,op_99
	addi	op_103,x0,16
	sra	op_102,a4,op_103
	lui	op_108,16
	addi	op_107,op_108,-1
	or	op_106,a5,op_107
	lui	op_110,16
	addi	op_109,op_110,-1
	sub	op_105,op_106,op_109
	sub	op_104,a5,op_105
	callmul	op_101,op_102,op_104
	sub	op_100,x0,op_101
	sub	op_82,op_83,op_100
	addi	op_111,x0,16
	sra	op_81,op_82,op_111
	addi	op_115,x0,16
	sra	op_114,a4,op_115
	addi	op_117,x0,16
	sra	op_116,a5,op_117
	callmul	op_113,op_114,op_116
	sub	op_112,x0,op_113
	sub	op_80,op_81,op_112
	sub	op_79,x0,op_80
	sub	a5,op_0,op_79
	addi	op_0,x0,31
	sra	a2,a4,op_0
	addi	a3,zero,101
	addi	op_0,x0,4
	sra	a5,a5,op_0
	sub	a5,a5,a2
	callmul	a5,a5,a3
	sub	a4,a4,a5
	sw	a4,408(a0)
	jalr	zero,ra,0
	.size	sglib_iq_add_next, .-sglib_iq_add_next
	.align	2
	.globl	sglib_iq_add
	.type	sglib_iq_add, @function
sglib_iq_add:
	lw	a4,408(a0)
	lui	a5,166111
	addi	a5,a5,203
	addi	a3,a4,1
	lui	op_7,16
	addi	op_6,op_7,-1
	or	op_5,a3,op_6
	lui	op_9,16
	addi	op_8,op_9,-1
	sub	op_4,op_5,op_8
	sub	op_3,a3,op_4
	addi	op_11,x0,16
	sra	op_10,a5,op_11
	callmul	op_2,op_3,op_10
	lui	op_21,16
	addi	op_20,op_21,-1
	or	op_19,a3,op_20
	lui	op_23,16
	addi	op_22,op_23,-1
	sub	op_18,op_19,op_22
	sub	op_17,a3,op_18
	lui	op_28,16
	addi	op_27,op_28,-1
	or	op_26,a5,op_27
	lui	op_30,16
	addi	op_29,op_30,-1
	sub	op_25,op_26,op_29
	sub	op_24,a5,op_25
	callmul	op_16,op_17,op_24
	addi	op_31,x0,16
	srl	op_15,op_16,op_31
	addi	op_35,x0,16
	sra	op_34,a3,op_35
	lui	op_40,16
	addi	op_39,op_40,-1
	or	op_38,a5,op_39
	lui	op_42,16
	addi	op_41,op_42,-1
	sub	op_37,op_38,op_41
	sub	op_36,a5,op_37
	callmul	op_33,op_34,op_36
	sub	op_32,x0,op_33
	sub	op_14,op_15,op_32
	lui	op_52,16
	addi	op_51,op_52,-1
	or	op_50,a3,op_51
	lui	op_54,16
	addi	op_53,op_54,-1
	sub	op_49,op_50,op_53
	sub	op_48,a3,op_49
	lui	op_59,16
	addi	op_58,op_59,-1
	or	op_57,a5,op_58
	lui	op_61,16
	addi	op_60,op_61,-1
	sub	op_56,op_57,op_60
	sub	op_55,a5,op_56
	callmul	op_47,op_48,op_55
	addi	op_62,x0,16
	srl	op_46,op_47,op_62
	addi	op_66,x0,16
	sra	op_65,a3,op_66
	lui	op_71,16
	addi	op_70,op_71,-1
	or	op_69,a5,op_70
	lui	op_73,16
	addi	op_72,op_73,-1
	sub	op_68,op_69,op_72
	sub	op_67,a5,op_68
	callmul	op_64,op_65,op_67
	sub	op_63,x0,op_64
	sub	op_45,op_46,op_63
	lui	op_75,16
	addi	op_74,op_75,-1
	or	op_44,op_45,op_74
	lui	op_77,16
	addi	op_76,op_77,-1
	sub	op_43,op_44,op_76
	sub	op_13,op_14,op_43
	sub	op_12,x0,op_13
	sub	op_1,op_2,op_12
	addi	op_78,x0,16
	sra	op_0,op_1,op_78
	lui	op_89,16
	addi	op_88,op_89,-1
	or	op_87,a3,op_88
	lui	op_91,16
	addi	op_90,op_91,-1
	sub	op_86,op_87,op_90
	sub	op_85,a3,op_86
	lui	op_96,16
	addi	op_95,op_96,-1
	or	op_94,a5,op_95
	lui	op_98,16
	addi	op_97,op_98,-1
	sub	op_93,op_94,op_97
	sub	op_92,a5,op_93
	callmul	op_84,op_85,op_92
	addi	op_99,x0,16
	srl	op_83,op_84,op_99
	addi	op_103,x0,16
	sra	op_102,a3,op_103
	lui	op_108,16
	addi	op_107,op_108,-1
	or	op_106,a5,op_107
	lui	op_110,16
	addi	op_109,op_110,-1
	sub	op_105,op_106,op_109
	sub	op_104,a5,op_105
	callmul	op_101,op_102,op_104
	sub	op_100,x0,op_101
	sub	op_82,op_83,op_100
	addi	op_111,x0,16
	sra	op_81,op_82,op_111
	addi	op_115,x0,16
	sra	op_114,a3,op_115
	addi	op_117,x0,16
	sra	op_116,a5,op_117
	callmul	op_113,op_114,op_116
	sub	op_112,x0,op_113
	sub	op_80,op_81,op_112
	sub	op_79,x0,op_80
	sub	a5,op_0,op_79
	addi	op_0,x0,31
	sra	a6,a3,op_0
	addi	a2,zero,101
	addi	op_0,x0,2
	sll	a4,a4,op_0
	sub	op_0,x0,a0
	sub	a4,a4,op_0
	sw	a1,0(a4)
	addi	op_0,x0,4
	sra	a5,a5,op_0
	sub	a5,a5,a6
	callmul	a5,a5,a2
	sub	a3,a3,a5
	sw	a3,408(a0)
	jalr	zero,ra,0
	.size	sglib_iq_add, .-sglib_iq_add
	.align	2
	.globl	sglib_iq_delete_first
	.type	sglib_iq_delete_first, @function
sglib_iq_delete_first:
	lw	a4,404(a0)
	lui	a5,166111
	addi	a5,a5,203
	addi	a4,a4,1
	lui	op_7,16
	addi	op_6,op_7,-1
	or	op_5,a4,op_6
	lui	op_9,16
	addi	op_8,op_9,-1
	sub	op_4,op_5,op_8
	sub	op_3,a4,op_4
	addi	op_11,x0,16
	sra	op_10,a5,op_11
	callmul	op_2,op_3,op_10
	lui	op_21,16
	addi	op_20,op_21,-1
	or	op_19,a4,op_20
	lui	op_23,16
	addi	op_22,op_23,-1
	sub	op_18,op_19,op_22
	sub	op_17,a4,op_18
	lui	op_28,16
	addi	op_27,op_28,-1
	or	op_26,a5,op_27
	lui	op_30,16
	addi	op_29,op_30,-1
	sub	op_25,op_26,op_29
	sub	op_24,a5,op_25
	callmul	op_16,op_17,op_24
	addi	op_31,x0,16
	srl	op_15,op_16,op_31
	addi	op_35,x0,16
	sra	op_34,a4,op_35
	lui	op_40,16
	addi	op_39,op_40,-1
	or	op_38,a5,op_39
	lui	op_42,16
	addi	op_41,op_42,-1
	sub	op_37,op_38,op_41
	sub	op_36,a5,op_37
	callmul	op_33,op_34,op_36
	sub	op_32,x0,op_33
	sub	op_14,op_15,op_32
	lui	op_52,16
	addi	op_51,op_52,-1
	or	op_50,a4,op_51
	lui	op_54,16
	addi	op_53,op_54,-1
	sub	op_49,op_50,op_53
	sub	op_48,a4,op_49
	lui	op_59,16
	addi	op_58,op_59,-1
	or	op_57,a5,op_58
	lui	op_61,16
	addi	op_60,op_61,-1
	sub	op_56,op_57,op_60
	sub	op_55,a5,op_56
	callmul	op_47,op_48,op_55
	addi	op_62,x0,16
	srl	op_46,op_47,op_62
	addi	op_66,x0,16
	sra	op_65,a4,op_66
	lui	op_71,16
	addi	op_70,op_71,-1
	or	op_69,a5,op_70
	lui	op_73,16
	addi	op_72,op_73,-1
	sub	op_68,op_69,op_72
	sub	op_67,a5,op_68
	callmul	op_64,op_65,op_67
	sub	op_63,x0,op_64
	sub	op_45,op_46,op_63
	lui	op_75,16
	addi	op_74,op_75,-1
	or	op_44,op_45,op_74
	lui	op_77,16
	addi	op_76,op_77,-1
	sub	op_43,op_44,op_76
	sub	op_13,op_14,op_43
	sub	op_12,x0,op_13
	sub	op_1,op_2,op_12
	addi	op_78,x0,16
	sra	op_0,op_1,op_78
	lui	op_89,16
	addi	op_88,op_89,-1
	or	op_87,a4,op_88
	lui	op_91,16
	addi	op_90,op_91,-1
	sub	op_86,op_87,op_90
	sub	op_85,a4,op_86
	lui	op_96,16
	addi	op_95,op_96,-1
	or	op_94,a5,op_95
	lui	op_98,16
	addi	op_97,op_98,-1
	sub	op_93,op_94,op_97
	sub	op_92,a5,op_93
	callmul	op_84,op_85,op_92
	addi	op_99,x0,16
	srl	op_83,op_84,op_99
	addi	op_103,x0,16
	sra	op_102,a4,op_103
	lui	op_108,16
	addi	op_107,op_108,-1
	or	op_106,a5,op_107
	lui	op_110,16
	addi	op_109,op_110,-1
	sub	op_105,op_106,op_109
	sub	op_104,a5,op_105
	callmul	op_101,op_102,op_104
	sub	op_100,x0,op_101
	sub	op_82,op_83,op_100
	addi	op_111,x0,16
	sra	op_81,op_82,op_111
	addi	op_115,x0,16
	sra	op_114,a4,op_115
	addi	op_117,x0,16
	sra	op_116,a5,op_117
	callmul	op_113,op_114,op_116
	sub	op_112,x0,op_113
	sub	op_80,op_81,op_112
	sub	op_79,x0,op_80
	sub	a5,op_0,op_79
	addi	op_0,x0,31
	sra	a2,a4,op_0
	addi	a3,zero,101
	addi	op_0,x0,4
	sra	a5,a5,op_0
	sub	a5,a5,a2
	callmul	a5,a5,a3
	sub	a4,a4,a5
	sw	a4,404(a0)
	jalr	zero,ra,0
	.size	sglib_iq_delete_first, .-sglib_iq_delete_first
	.align	2
	.globl	sglib_iq_delete
	.type	sglib_iq_delete, @function
sglib_iq_delete:
	lw	a4,404(a0)
	lui	a5,166111
	addi	a5,a5,203
	addi	a4,a4,1
	lui	op_7,16
	addi	op_6,op_7,-1
	or	op_5,a4,op_6
	lui	op_9,16
	addi	op_8,op_9,-1
	sub	op_4,op_5,op_8
	sub	op_3,a4,op_4
	addi	op_11,x0,16
	sra	op_10,a5,op_11
	callmul	op_2,op_3,op_10
	lui	op_21,16
	addi	op_20,op_21,-1
	or	op_19,a4,op_20
	lui	op_23,16
	addi	op_22,op_23,-1
	sub	op_18,op_19,op_22
	sub	op_17,a4,op_18
	lui	op_28,16
	addi	op_27,op_28,-1
	or	op_26,a5,op_27
	lui	op_30,16
	addi	op_29,op_30,-1
	sub	op_25,op_26,op_29
	sub	op_24,a5,op_25
	callmul	op_16,op_17,op_24
	addi	op_31,x0,16
	srl	op_15,op_16,op_31
	addi	op_35,x0,16
	sra	op_34,a4,op_35
	lui	op_40,16
	addi	op_39,op_40,-1
	or	op_38,a5,op_39
	lui	op_42,16
	addi	op_41,op_42,-1
	sub	op_37,op_38,op_41
	sub	op_36,a5,op_37
	callmul	op_33,op_34,op_36
	sub	op_32,x0,op_33
	sub	op_14,op_15,op_32
	lui	op_52,16
	addi	op_51,op_52,-1
	or	op_50,a4,op_51
	lui	op_54,16
	addi	op_53,op_54,-1
	sub	op_49,op_50,op_53
	sub	op_48,a4,op_49
	lui	op_59,16
	addi	op_58,op_59,-1
	or	op_57,a5,op_58
	lui	op_61,16
	addi	op_60,op_61,-1
	sub	op_56,op_57,op_60
	sub	op_55,a5,op_56
	callmul	op_47,op_48,op_55
	addi	op_62,x0,16
	srl	op_46,op_47,op_62
	addi	op_66,x0,16
	sra	op_65,a4,op_66
	lui	op_71,16
	addi	op_70,op_71,-1
	or	op_69,a5,op_70
	lui	op_73,16
	addi	op_72,op_73,-1
	sub	op_68,op_69,op_72
	sub	op_67,a5,op_68
	callmul	op_64,op_65,op_67
	sub	op_63,x0,op_64
	sub	op_45,op_46,op_63
	lui	op_75,16
	addi	op_74,op_75,-1
	or	op_44,op_45,op_74
	lui	op_77,16
	addi	op_76,op_77,-1
	sub	op_43,op_44,op_76
	sub	op_13,op_14,op_43
	sub	op_12,x0,op_13
	sub	op_1,op_2,op_12
	addi	op_78,x0,16
	sra	op_0,op_1,op_78
	lui	op_89,16
	addi	op_88,op_89,-1
	or	op_87,a4,op_88
	lui	op_91,16
	addi	op_90,op_91,-1
	sub	op_86,op_87,op_90
	sub	op_85,a4,op_86
	lui	op_96,16
	addi	op_95,op_96,-1
	or	op_94,a5,op_95
	lui	op_98,16
	addi	op_97,op_98,-1
	sub	op_93,op_94,op_97
	sub	op_92,a5,op_93
	callmul	op_84,op_85,op_92
	addi	op_99,x0,16
	srl	op_83,op_84,op_99
	addi	op_103,x0,16
	sra	op_102,a4,op_103
	lui	op_108,16
	addi	op_107,op_108,-1
	or	op_106,a5,op_107
	lui	op_110,16
	addi	op_109,op_110,-1
	sub	op_105,op_106,op_109
	sub	op_104,a5,op_105
	callmul	op_101,op_102,op_104
	sub	op_100,x0,op_101
	sub	op_82,op_83,op_100
	addi	op_111,x0,16
	sra	op_81,op_82,op_111
	addi	op_115,x0,16
	sra	op_114,a4,op_115
	addi	op_117,x0,16
	sra	op_116,a5,op_117
	callmul	op_113,op_114,op_116
	sub	op_112,x0,op_113
	sub	op_80,op_81,op_112
	sub	op_79,x0,op_80
	sub	a5,op_0,op_79
	addi	op_0,x0,31
	sra	a2,a4,op_0
	addi	a3,zero,101
	addi	op_0,x0,4
	sra	a5,a5,op_0
	sub	a5,a5,a2
	callmul	a5,a5,a3
	sub	a4,a4,a5
	sw	a4,404(a0)
	jalr	zero,ra,0
	.size	sglib_iq_delete, .-sglib_iq_delete
	.align	2
	.globl	sglib___rbtree_delete_recursive
	.type	sglib___rbtree_delete_recursive, @function
sglib___rbtree_delete_recursive:
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L1341
	lw	a3,0(a1)
	lw	a4,0(a5)
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	ra,44(sp)
	sub	a4,a3,a4
	addi	s0,a0,0
	bge	a4,zero,.+8
	jal	x0,.L1235
	bne	a4,zero,.L1281
	bltu	a1,a5,.+8
	jal	x0,.L1236
.L1235:
	lw	a4,8(a5)
	bne	a4,zero,.+8
	jal	x0,.L1234
	lw	a2,0(a4)
	sw	s1,36(sp)
	addi	s1,a5,8
	sub	a2,a3,a2
	bge	a2,zero,.+8
	jal	x0,.L1238
	bne	a2,zero,.L1239
	bltu	a1,a4,.+8
	jal	x0,.L1239
.L1238:
	lw	a5,8(a4)
	bne	a5,zero,.+8
	jal	x0,.L1355
	lw	a2,0(a5)
	sw	s2,32(sp)
	addi	s2,a4,8
	sub	a3,a3,a2
	bge	a3,zero,.+8
	jal	x0,.L1242
	bne	a3,zero,.L1243
	bltu	a1,a5,.+8
	jal	x0,.L1243
.L1242:
	addi	a0,a5,8
.Lpcrel_118:
	auipc	ra,%pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_118)
	bne	a0,zero,.L1356
.L1348:
	lw	s1,36(sp)
	lw	s2,32(sp)
.L1234:
	addi	a0,zero,0
.L1232:
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jalr	zero,ra,0
.L1341:
	addi	a0,zero,0
	jalr	zero,ra,0
.L1281:
	lw	a4,12(a5)
	bne	a4,zero,.+8
	jal	x0,.L1234
	lw	a2,0(a4)
	sw	s1,36(sp)
	addi	s1,a5,12
	sub	a3,a3,a2
	bge	a3,zero,.+8
	jal	x0,.L1265
	bne	a3,zero,.L1282
	bltu	a1,a4,.+8
	jal	x0,.L1266
.L1265:
	addi	a0,a4,8
.Lpcrel_119:
	auipc	ra,%pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_119)
	bne	a0,zero,.L1357
.L1355:
	lw	s1,36(sp)
	jal	x0,.L1234
.L1239:
	bltu	a4,a1,.L1280
	bne	a2,zero,.L1280
	lw	a3,8(a4)
	bne	a3,zero,.+8
	jal	x0,.L1358
	addi	a1,sp,28
	addi	a0,a4,8
	sw	a5,12(sp)
	sw	a4,8(sp)
.Lpcrel_120:
	auipc	ra,%pcrel_hi(sglib___rbtree_delete_rightmost_leaf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_120)
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
	bne	a0,zero,.+8
	jal	x0,.L1355
	addi	a0,s1,0
.Lpcrel_121:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_121)
.L1253:
	bne	a0,zero,.+8
	jal	x0,.L1355
.L1259:
	addi	a0,s0,0
.Lpcrel_122:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_122)
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jalr	zero,ra,0
.L1280:
	addi	a0,a4,12
.Lpcrel_123:
	auipc	ra,%pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_123)
	bne	a0,zero,.+8
	jal	x0,.L1355
	addi	a0,s1,0
.Lpcrel_124:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_124)
	jal	x0,.L1253
.L1236:
	bne	a4,zero,.L1281
	bltu	a5,a1,.L1281
	lw	a4,8(a5)
	bne	a4,zero,.+8
	jal	x0,.L1359
	addi	a0,a5,8
	addi	a1,sp,28
	sw	a5,8(sp)
.Lpcrel_125:
	auipc	ra,%pcrel_hi(sglib___rbtree_delete_rightmost_leaf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_125)
	lw	a5,8(sp)
	lw	a4,28(sp)
	lw	a2,8(a5)
	lw	a3,12(a5)
	sw	a2,8(a4)
	sw	a3,12(a4)
	lbu	a5,4(a5)
	sb	a5,4(a4)
	sw	a4,0(s0)
	bne	a0,zero,.+8
	jal	x0,.L1234
	addi	a0,s0,0
.Lpcrel_126:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_126)
	jal	x0,.L1232
.L1243:
	bltu	a5,a1,.L1279
	bne	a3,zero,.L1279
	lw	a3,8(a5)
	bne	a3,zero,.+8
	jal	x0,.L1360
	addi	a1,sp,28
	addi	a0,a5,8
	sw	a4,12(sp)
	sw	a5,8(sp)
.Lpcrel_127:
	auipc	ra,%pcrel_hi(sglib___rbtree_delete_rightmost_leaf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_127)
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
	bne	a0,zero,.+8
	jal	x0,.L1348
.L1356:
	addi	a0,s2,0
.Lpcrel_128:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_128)
.L1245:
	bne	a0,zero,.+8
	jal	x0,.L1348
.L1252:
	addi	a0,s1,0
.Lpcrel_129:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_129)
	lw	s2,32(sp)
	jal	x0,.L1253
.L1359:
	lw	a4,12(a5)
	bne	a4,zero,.+8
	jal	x0,.L1361
	lbu	a5,4(a5)
	addi	a0,zero,0
	bne	a5,zero,.L1277
	lbu	a0,4(a4)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
.L1277:
	sb	zero,4(a4)
	sw	a4,0(s0)
	jal	x0,.L1232
.L1266:
	bne	a3,zero,.L1282
	bltu	a4,a1,.L1282
	lw	a3,8(a4)
	bne	a3,zero,.+8
	jal	x0,.L1362
	addi	a1,sp,28
	addi	a0,a4,8
	sw	a5,12(sp)
	sw	a4,8(sp)
.Lpcrel_130:
	auipc	ra,%pcrel_hi(sglib___rbtree_delete_rightmost_leaf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_130)
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
	bne	a0,zero,.+8
	jal	x0,.L1355
.L1357:
	addi	a0,s1,0
.Lpcrel_131:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_131)
.L1268:
	bne	a0,zero,.+8
	jal	x0,.L1355
.L1274:
	addi	a0,s0,0
.Lpcrel_132:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_132)
	lw	s1,36(sp)
	jal	x0,.L1232
.L1279:
	addi	a0,a5,12
.Lpcrel_133:
	auipc	ra,%pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_133)
	bne	a0,zero,.+8
	jal	x0,.L1348
	addi	a0,s2,0
.Lpcrel_134:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_134)
	jal	x0,.L1245
.L1282:
	addi	a0,a4,12
.Lpcrel_135:
	auipc	ra,%pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_135)
	bne	a0,zero,.+8
	jal	x0,.L1355
	addi	a0,s1,0
.Lpcrel_136:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_136)
	jal	x0,.L1268
.L1358:
	lw	a3,12(a4)
	bne	a3,zero,.+8
	jal	x0,.L1363
	lbu	a4,4(a4)
	bne	a4,zero,.L1258
	lbu	a4,4(a3)
	bne	a4,zero,.L1258
	sw	a3,8(a5)
	jal	x0,.L1259
.L1361:
	sw	zero,0(a0)
	lbu	a0,4(a5)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jal	x0,.L1232
.L1258:
	sb	zero,4(a3)
	lw	s1,36(sp)
	sw	a3,8(a5)
	jal	x0,.L1234
.L1360:
	lw	a3,12(a5)
	bne	a3,zero,.+8
	jal	x0,.L1364
	lbu	a5,4(a5)
	bne	a5,zero,.L1251
	lbu	a5,4(a3)
	bne	a5,zero,.L1251
	sw	a3,8(a4)
	jal	x0,.L1252
.L1362:
	lw	a3,12(a4)
	bne	a3,zero,.+8
	jal	x0,.L1365
	lbu	a4,4(a4)
	bne	a4,zero,.L1273
	lbu	a4,4(a3)
	bne	a4,zero,.L1273
	sw	a3,12(a5)
	jal	x0,.L1274
.L1363:
	sw	zero,8(a5)
	lbu	a0,4(a4)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jal	x0,.L1253
.L1251:
	sb	zero,4(a3)
	lw	s1,36(sp)
	lw	s2,32(sp)
	sw	a3,8(a4)
	jal	x0,.L1234
.L1273:
	sb	zero,4(a3)
	lw	s1,36(sp)
	sw	a3,12(a5)
	jal	x0,.L1234
.L1364:
	sw	zero,8(a4)
	lbu	a0,4(a5)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jal	x0,.L1245
.L1365:
	sw	zero,12(a5)
	lbu	a0,4(a4)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jal	x0,.L1268
	.size	sglib___rbtree_delete_recursive, .-sglib___rbtree_delete_recursive
	.align	2
	.globl	sglib_rbtree_add
	.type	sglib_rbtree_add, @function
sglib_rbtree_add:
	sw	zero,12(a1)
	sw	zero,8(a1)
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L1472
	lw	a3,0(a1)
	lw	a4,0(a5)
	addi	sp,sp,-32
	sw	ra,28(sp)
	sub	a4,a3,a4
	addi	a2,a0,0
	bge	a4,zero,.+8
	jal	x0,.L1369
	bne	a4,zero,.L1370
	bltu	a1,a5,.+8
	jal	x0,.L1370
.L1369:
	lw	a4,8(a5)
	bne	a4,zero,.+8
	jal	x0,.L1473
	lw	a0,0(a4)
	sub	a3,a3,a0
	bge	a3,zero,.+8
	jal	x0,.L1373
	bne	a3,zero,.L1374
	bltu	a1,a4,.+8
	jal	x0,.L1374
.L1373:
	addi	a0,a4,8
	sw	a2,12(sp)
	sw	a5,8(sp)
	sw	a4,4(sp)
.Lpcrel_137:
	auipc	ra,%pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_137)
	lw	a4,4(sp)
	lw	a5,8(sp)
	lw	a2,12(sp)
	lbu	a4,4(a4)
	bne	a4,zero,.+8
	jal	x0,.L1474
.L1372:
	lbu	a5,4(a5)
	lw	a1,0(a2)
	bne	a5,zero,.+8
	jal	x0,.L1475
.L1368:
	sb	zero,4(a1)
	lw	ra,28(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L1472:
	sw	a1,0(a0)
	sb	zero,4(a1)
	jalr	zero,ra,0
.L1473:
	addi	a4,zero,1
	sb	a4,4(a1)
	sw	a1,8(a5)
	lbu	a5,4(a5)
	lw	a1,0(a2)
	bne	a5,zero,.L1368
.L1475:
	lw	a5,8(a1)
	lw	a4,12(a1)
	lbu	a3,4(a5)
	bne	a4,zero,.+8
	jal	x0,.L1386
	lbu	a0,4(a4)
	addi	a6,zero,1
	bne	a0,a6,.+8
	jal	x0,.L1476
.L1386:
	addi	a4,zero,1
	bne	a3,a4,.L1368
	lw	a0,8(a5)
	lw	a4,12(a5)
	bne	a0,zero,.+8
	jal	x0,.L1389
	lbu	a6,4(a0)
	bne	a6,a3,.+8
	jal	x0,.L1477
.L1389:
	bne	a4,zero,.+8
	jal	x0,.L1368
	lbu	a3,4(a4)
	addi	a0,zero,1
	bne	a3,a0,.L1368
	lw	a6,8(a4)
	lw	a0,12(a4)
	sw	a6,12(a5)
	sw	a0,8(a1)
	sw	a1,12(a4)
	sw	a5,8(a4)
	sb	zero,4(a4)
	sb	a3,4(a1)
	sw	a4,0(a2)
	addi	a1,a4,0
	jal	x0,.L1368
.L1474:
	lw	a4,8(a5)
	lw	a3,8(a4)
	lw	a1,12(a4)
	lbu	a0,4(a3)
	bne	a1,zero,.+8
	jal	x0,.L1376
	lbu	a6,4(a1)
	addi	a7,zero,1
	bne	a6,a7,.+8
	jal	x0,.L1478
.L1376:
	addi	a1,zero,1
	bne	a0,a1,.L1372
	lw	a6,8(a3)
	lw	a1,12(a3)
	bne	a6,zero,.+8
	jal	x0,.L1380
	lbu	a7,4(a6)
	bne	a7,a0,.+8
	jal	x0,.L1479
.L1380:
	bne	a1,zero,.+8
	jal	x0,.L1372
	lbu	a0,4(a1)
	addi	a6,zero,1
	bne	a0,a6,.L1372
	lw	a7,8(a1)
	lw	a6,12(a1)
	sw	a7,12(a3)
	sw	a6,8(a4)
	sw	a3,8(a1)
	sw	a4,12(a1)
	sb	zero,4(a1)
	sb	a0,4(a4)
	sw	a1,8(a5)
	jal	x0,.L1372
.L1370:
	addi	a0,a5,12
	sw	a2,8(sp)
	sw	a5,4(sp)
.Lpcrel_138:
	auipc	ra,%pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_138)
	lw	a5,4(sp)
	lw	a2,8(sp)
	lbu	a5,4(a5)
	lw	a1,0(a2)
	bne	a5,zero,.L1368
	lw	a5,12(a1)
	lw	a4,8(a1)
	lbu	a3,4(a5)
	bne	a4,zero,.+8
	jal	x0,.L1391
	lbu	a0,4(a4)
	addi	a6,zero,1
	bne	a0,a6,.+8
	jal	x0,.L1480
.L1391:
	addi	a4,zero,1
	bne	a3,a4,.L1368
	lw	a0,12(a5)
	lw	a4,8(a5)
	bne	a0,zero,.+8
	jal	x0,.L1395
	lbu	a6,4(a0)
	bne	a6,a3,.+8
	jal	x0,.L1481
.L1395:
	bne	a4,zero,.+8
	jal	x0,.L1368
	lbu	a3,4(a4)
	addi	a0,zero,1
	bne	a3,a0,.L1368
	lw	a6,12(a4)
	lw	a0,8(a4)
	sw	a6,8(a5)
	sw	a0,12(a1)
	sw	a1,8(a4)
	sw	a5,12(a4)
	sb	zero,4(a4)
	sb	a3,4(a1)
	sw	a4,0(a2)
	addi	a1,a4,0
	jal	x0,.L1368
.L1374:
	addi	a0,a4,12
	sw	a2,12(sp)
	sw	a5,8(sp)
	sw	a4,4(sp)
.Lpcrel_139:
	auipc	ra,%pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_139)
	lw	a4,4(sp)
	lw	a5,8(sp)
	lw	a2,12(sp)
	lbu	a4,4(a4)
	bne	a4,zero,.L1372
	lw	a4,8(a5)
	lw	a3,12(a4)
	lw	a1,8(a4)
	lbu	a0,4(a3)
	bne	a1,zero,.+8
	jal	x0,.L1381
	lbu	a6,4(a1)
	addi	a7,zero,1
	bne	a6,a7,.+8
	jal	x0,.L1482
.L1381:
	addi	a1,zero,1
	bne	a0,a1,.L1372
	lw	a6,12(a3)
	lw	a1,8(a3)
	bne	a6,zero,.+8
	jal	x0,.L1384
	lbu	a7,4(a6)
	bne	a7,a0,.+8
	jal	x0,.L1483
.L1384:
	bne	a1,zero,.+8
	jal	x0,.L1372
	lbu	a0,4(a1)
	addi	a6,zero,1
	bne	a0,a6,.L1372
	lw	a7,12(a1)
	lw	a6,8(a1)
	sw	a7,8(a3)
	sw	a6,12(a4)
	sw	a3,12(a1)
	sw	a4,8(a1)
	sb	zero,4(a1)
	sb	a0,4(a4)
	sw	a1,8(a5)
	jal	x0,.L1372
.L1478:
	bne	a0,a6,.L1372
	lw	a6,8(a3)
	bne	a6,zero,.+8
	jal	x0,.L1378
	lbu	a6,4(a6)
	bne	a6,a0,.+8
	jal	x0,.L1383
.L1378:
	lw	a0,12(a3)
	bne	a0,zero,.+8
	jal	x0,.L1372
.L1469:
	lbu	a6,4(a0)
	addi	a0,zero,1
	bne	a6,a0,.L1372
.L1383:
	sb	zero,4(a3)
	sb	zero,4(a1)
	addi	a3,zero,1
	sb	a3,4(a4)
	jal	x0,.L1372
.L1477:
	sw	a4,8(a1)
	sw	a1,12(a5)
	sw	a0,8(a5)
	sb	a3,4(a1)
	sb	zero,4(a5)
	sw	a5,0(a2)
	addi	a1,a5,0
	jal	x0,.L1368
.L1479:
	sw	a1,8(a4)
	sw	a6,8(a3)
	sw	a4,12(a3)
	sb	a0,4(a4)
	sb	zero,4(a3)
	sw	a3,8(a5)
	jal	x0,.L1372
.L1481:
	sw	a4,12(a1)
	sw	a1,8(a5)
	sw	a0,12(a5)
	sb	a3,4(a1)
	sb	zero,4(a5)
	sw	a5,0(a2)
	addi	a1,a5,0
	jal	x0,.L1368
.L1483:
	sw	a1,12(a4)
	sw	a6,12(a3)
	sw	a4,8(a3)
	sb	a0,4(a4)
	sb	zero,4(a3)
	sw	a3,8(a5)
	jal	x0,.L1372
.L1476:
	bne	a3,a0,.L1368
	lw	a2,8(a5)
	bne	a2,zero,.+8
	jal	x0,.L1387
	lbu	a2,4(a2)
	bne	a2,a3,.+8
	jal	x0,.L1393
.L1387:
	lw	a3,12(a5)
	bne	a3,zero,.+8
	jal	x0,.L1368
.L1471:
	lbu	a2,4(a3)
	addi	a3,zero,1
	bne	a2,a3,.L1368
.L1393:
	sb	zero,4(a5)
	sb	zero,4(a4)
	addi	a5,zero,1
	sb	a5,4(a1)
	jal	x0,.L1368
.L1480:
	bne	a3,a0,.L1368
	lw	a2,12(a5)
	bne	a2,zero,.+8
	jal	x0,.L1392
	lbu	a2,4(a2)
	bne	a2,a3,.+8
	jal	x0,.L1393
.L1392:
	lw	a3,8(a5)
	bne	a3,zero,.L1471
	jal	x0,.L1368
.L1482:
	bne	a0,a6,.L1372
	lw	a6,12(a3)
	bne	a6,zero,.+8
	jal	x0,.L1382
	lbu	a6,4(a6)
	bne	a6,a0,.+8
	jal	x0,.L1383
.L1382:
	lw	a0,8(a3)
	bne	a0,zero,.L1469
	jal	x0,.L1372
	.size	sglib_rbtree_add, .-sglib_rbtree_add
	.align	2
	.globl	sglib_rbtree_delete
	.type	sglib_rbtree_delete, @function
sglib_rbtree_delete:
	lw	a5,0(a0)
	bne	a5,zero,.+8
	jal	x0,.L1528
	lw	a3,0(a1)
	lw	a4,0(a5)
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	ra,44(sp)
	sub	a4,a3,a4
	addi	s0,a0,0
	bge	a4,zero,.+8
	jal	x0,.L1487
	bne	a4,zero,.L1511
	bltu	a1,a5,.+8
	jal	x0,.L1488
.L1487:
	lw	a4,8(a5)
	bne	a4,zero,.+8
	jal	x0,.L1490
	lw	a2,0(a4)
	sw	s1,36(sp)
	addi	s1,a5,8
	sub	a3,a3,a2
	bge	a3,zero,.+8
	jal	x0,.L1491
	bne	a3,zero,.L1510
	bltu	a1,a4,.+8
	jal	x0,.L1492
.L1491:
	addi	a0,a4,8
.Lpcrel_140:
	auipc	ra,%pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_140)
	bne	a0,zero,.L1503
.L1532:
	lw	a5,0(s0)
	lw	s1,36(sp)
	bne	a5,zero,.+8
	jal	x0,.L1484
.L1490:
	sb	zero,4(a5)
.L1484:
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jalr	zero,ra,0
.L1528:
	jalr	zero,ra,0
.L1511:
	addi	a0,a5,12
.Lpcrel_141:
	auipc	ra,%pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_141)
	bne	a0,zero,.L1506
	lw	a5,0(s0)
.L1535:
	bne	a5,zero,.L1490
	jal	x0,.L1484
.L1492:
	bne	a3,zero,.L1510
	bltu	a4,a1,.+8
	jal	x0,.L1496
.L1510:
	addi	a0,a4,12
.Lpcrel_142:
	auipc	ra,%pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_142)
	bne	a0,zero,.+8
	jal	x0,.L1532
	addi	a0,s1,0
.Lpcrel_143:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_143)
.L1495:
	bne	a0,zero,.+8
	jal	x0,.L1532
.L1502:
	addi	a0,s0,0
.Lpcrel_144:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_144)
	jal	x0,.L1532
.L1506:
	addi	a0,s0,0
.Lpcrel_145:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_right_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_145)
	lw	a5,0(s0)
	bne	a5,zero,.L1490
	jal	x0,.L1484
.L1488:
	bne	a4,zero,.L1511
	bltu	a5,a1,.L1511
	lw	a4,8(a5)
	bne	a4,zero,.+8
	jal	x0,.L1534
	addi	a0,a5,8
	addi	a1,sp,28
	sw	a5,8(sp)
.Lpcrel_146:
	auipc	ra,%pcrel_hi(sglib___rbtree_delete_rightmost_leaf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_146)
	lw	a5,8(sp)
	lw	a4,28(sp)
	lw	a2,8(a5)
	lw	a3,12(a5)
	sw	a2,8(a4)
	sw	a3,12(a4)
	lbu	a5,4(a5)
	sb	a5,4(a4)
	sw	a4,0(s0)
	addi	a5,a4,0
	bne	a0,zero,.+8
	jal	x0,.L1490
	addi	a0,s0,0
.Lpcrel_147:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_147)
	lw	a5,0(s0)
	jal	x0,.L1535
.L1496:
	lw	a3,8(a4)
	bne	a3,zero,.+8
	jal	x0,.L1536
	addi	a1,sp,28
	addi	a0,a4,8
	sw	a5,12(sp)
	sw	a4,8(sp)
.Lpcrel_148:
	auipc	ra,%pcrel_hi(sglib___rbtree_delete_rightmost_leaf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_148)
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
	bne	a0,zero,.+8
	jal	x0,.L1532
.L1503:
	addi	a0,s1,0
.Lpcrel_149:
	auipc	ra,%pcrel_hi(sglib___rbtree_fix_left_deletion_discrepancy)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_149)
	jal	x0,.L1495
.L1534:
	lw	a5,12(a5)
	bne	a5,zero,.+8
	jal	x0,.L1537
	sb	zero,4(a5)
	sw	a5,0(a0)
	jal	x0,.L1490
.L1536:
	lw	a3,12(a4)
	bne	a3,zero,.+8
	jal	x0,.L1538
	lbu	a4,4(a4)
	bne	a4,zero,.L1501
	lbu	a4,4(a3)
	bne	a4,zero,.L1501
	sw	a3,8(a5)
	jal	x0,.L1502
.L1537:
	sw	zero,0(a0)
	jal	x0,.L1484
.L1501:
	sb	zero,4(a3)
	sw	a3,8(a5)
	lw	a5,0(s0)
	lw	s1,36(sp)
	bne	a5,zero,.L1490
	jal	x0,.L1484
.L1538:
	sw	zero,8(a5)
	lbu	a0,4(a4)
	addi	op_0,x0,1
	bltu	a0,op_0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	jal	x0,.L1495
	.size	sglib_rbtree_delete, .-sglib_rbtree_delete
	.align	2
	.globl	sglib_rbtree_find_member
	.type	sglib_rbtree_find_member, @function
sglib_rbtree_find_member:
	bne	a0,zero,.+8
	jal	x0,.L1539
	lw	a4,0(a1)
.L1543:
	lw	a5,0(a0)
	sub	a5,a4,a5
	bge	a5,zero,.+8
	jal	x0,.L1549
	bne	a5,zero,.+8
	jal	x0,.L1539
	lw	a0,12(a0)
	bne	a0,zero,.L1543
.L1539:
	jalr	zero,ra,0
.L1549:
	lw	a0,8(a0)
	bne	a0,zero,.L1543
	jalr	zero,ra,0
	.size	sglib_rbtree_find_member, .-sglib_rbtree_find_member
	.align	2
	.globl	sglib_rbtree_is_member
	.type	sglib_rbtree_is_member, @function
sglib_rbtree_is_member:
	bne	a0,zero,.+8
	jal	x0,.L1550
	lw	a4,0(a1)
.L1556:
	lw	a5,0(a0)
	sub	a5,a4,a5
	bge	a5,zero,.+8
	jal	x0,.L1552
	bne	a5,zero,.L1553
	bltu	a1,a0,.+8
	jal	x0,.L1553
.L1552:
	lw	a0,8(a0)
	bne	a0,zero,.L1556
	jalr	zero,ra,0
.L1553:
	bltu	a0,a1,.L1559
	bne	a5,zero,.+8
	jal	x0,.L1558
.L1559:
	lw	a0,12(a0)
	bne	a0,zero,.L1556
	jalr	zero,ra,0
.L1558:
	addi	a0,zero,1
.L1550:
	jalr	zero,ra,0
	.size	sglib_rbtree_is_member, .-sglib_rbtree_is_member
	.align	2
	.globl	sglib_rbtree_delete_if_member
	.type	sglib_rbtree_delete_if_member, @function
sglib_rbtree_delete_if_member:
	lw	a4,0(a0)
	bne	a4,zero,.+8
	jal	x0,.L1568
	lw	a3,0(a1)
.L1572:
	lw	a5,0(a4)
	sub	a5,a3,a5
	bge	a5,zero,.+8
	jal	x0,.L1583
	bne	a5,zero,.+8
	jal	x0,.L1571
	lw	a4,12(a4)
	bne	a4,zero,.L1572
.L1568:
	sw	zero,0(a2)
	addi	a0,zero,0
	jalr	zero,ra,0
.L1583:
	lw	a4,8(a4)
	bne	a4,zero,.L1572
	jal	x0,.L1568
.L1571:
	addi	sp,sp,-32
	addi	a1,a4,0
	sw	a4,0(a2)
	sw	ra,28(sp)
	sw	a0,12(sp)
.Lpcrel_150:
	auipc	ra,%pcrel_hi(sglib___rbtree_delete_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_150)
	lw	a5,12(sp)
	lw	a5,0(a5)
	bne	a5,zero,.+8
	jal	x0,.L1575
	sb	zero,4(a5)
.L1575:
	lw	ra,28(sp)
	addi	a0,zero,1
	addi	sp,sp,32
	jalr	zero,ra,0
	.size	sglib_rbtree_delete_if_member, .-sglib_rbtree_delete_if_member
	.align	2
	.globl	sglib_rbtree_add_if_not_member
	.type	sglib_rbtree_add_if_not_member, @function
sglib_rbtree_add_if_not_member:
	lw	a4,0(a0)
	bne	a4,zero,.+8
	jal	x0,.L1585
	lw	a3,0(a1)
.L1589:
	lw	a5,0(a4)
	sub	a5,a3,a5
	bge	a5,zero,.+8
	jal	x0,.L1598
	bne	a5,zero,.+8
	jal	x0,.L1588
	lw	a4,12(a4)
	bne	a4,zero,.L1589
.L1585:
	addi	sp,sp,-32
	sw	zero,0(a2)
	sw	zero,12(a1)
	sw	zero,8(a1)
	sw	ra,28(sp)
	sw	a0,12(sp)
.Lpcrel_151:
	auipc	ra,%pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_151)
	lw	a0,12(sp)
	addi	a5,zero,1
	lw	a4,0(a0)
	addi	a0,a5,0
	sb	zero,4(a4)
	lw	ra,28(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L1598:
	lw	a4,8(a4)
	bne	a4,zero,.L1589
	jal	x0,.L1585
.L1588:
	sw	a4,0(a2)
	addi	a0,a5,0
	jalr	zero,ra,0
	.size	sglib_rbtree_add_if_not_member, .-sglib_rbtree_add_if_not_member
	.align	2
	.globl	sglib_rbtree_len
	.type	sglib_rbtree_len, @function
sglib_rbtree_len:
	bne	a0,zero,.+8
	jal	x0,.L1617
	addi	sp,sp,-640
	addi	t3,zero,1
	addi	a4,a0,0
	addi	a7,sp,0
	sub	t3,t3,sp
	addi	a5,zero,0
	addi	a0,zero,0
	addi	t1,sp,128
	addi	t4,sp,124
.L1600:
	addi	op_0,x0,2
	sll	a2,a5,op_0
	sub	op_0,x0,t1
	sub	a2,a2,op_0
	sub	op_0,x0,a7
	sub	a5,a5,op_0
.L1602:
	lw	a3,12(a4)
	lw	a4,8(a4)
	sb	zero,0(a5)
	sw	a3,0(a2)
	addi	a3,a5,0
	addi	a2,a2,4
	addi	a5,a5,1
	bne	a4,zero,.L1602
	sub	op_0,x0,t3
	sub	a3,a3,op_0
	addi	op_0,x0,2
	sll	a1,a3,op_0
	sub	op_0,x0,t4
	sub	a1,a1,op_0
	sub	op_0,x0,a7
	sub	a2,a3,op_0
	jal	x0,.L1605
.L1619:
	addi	a2,a2,-1
	addi	a1,a1,-4
	bne	a4,zero,.L1618
.L1605:
	lbu	a4,-1(a2)
	addi	a5,a3,0
	addi	a3,a3,-1
	addi	a6,a4,1
	sb	a6,-1(a2)
	addi	op_0,x0,1
	bltu	a4,op_0,.+12
	addi	a4,x0,0
	jal	x0,.+8
	addi	a4,x0,1
	sub	op_0,x0,a0
	sub	a0,a4,op_0
	lw	a4,0(a1)
	bge	zero,a3,.+8
	jal	x0,.L1619
	addi	op_0,x0,2
	sll	a3,a3,op_0
	sub	op_0,x0,t1
	sub	a3,a3,op_0
	sw	zero,0(a3)
	bne	a4,zero,.L1600
	addi	sp,sp,640
	jalr	zero,ra,0
.L1618:
	addi	op_0,x0,2
	sll	a3,a3,op_0
	sub	op_0,x0,t1
	sub	a3,a3,op_0
	sw	zero,0(a3)
	jal	x0,.L1600
.L1617:
	addi	a0,zero,0
	jalr	zero,ra,0
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
	bge	zero,a5,.L1620
	sw	s1,36(sp)
	sw	s7,12(sp)
	sw	s0,40(sp)
	sw	s3,28(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	addi	s1,a0,0
	addi	a3,a5,-1
	addi	s7,zero,1
.L1621:
	sub	op_0,x0,s1
	sub	s3,a3,op_0
	lbu	a4,4(s3)
	addi	s5,a5,0
	bltu	s7,a4,.+8
	jal	x0,.L1622
	addi	op_0,x0,16
	sll	a5,a3,op_0
	addi	op_0,x0,16
	sra	a5,a5,op_0
	sh	a5,644(s1)
.L1623:
	bge	zero,a5,.L1656
	addi	a3,a5,-1
	sub	op_0,x0,s1
	sub	a4,a3,op_0
	lbu	a4,4(a4)
	lh	a2,646(s1)
	bne	a2,a4,.L1641
	addi	op_0,x0,2
	sll	a4,a5,op_0
	sub	op_0,x0,s1
	sub	a4,a4,op_0
	lw	a4,128(a4)
	sw	a4,0(s1)
.L1641:
	lw	a4,0(s1)
	bne	a4,zero,.+8
	jal	x0,.L1621
.L1656:
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s3,28(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
.L1620:
	lw	ra,44(sp)
	lw	s2,32(sp)
	lw	s4,24(sp)
	addi	sp,sp,48
	jalr	zero,ra,0
.L1622:
	addi	op_0,x0,2
	sll	s6,a5,op_0
	sub	op_0,x0,s1
	sub	s6,s6,op_0
	lw	a5,128(s6)
	bne	a4,zero,.L1624
	lw	s0,8(a5)
.L1625:
	bne	s2,zero,.+8
	jal	x0,.L1626
	bne	s4,zero,.+8
	jal	x0,.L1627
	bne	s0,zero,.+8
	jal	x0,.L1657
.L1628:
	addi	a1,s0,0
	addi	a0,s2,0
	jalr	ra,s4,0
	bge	a0,zero,.+8
	jal	x0,.L1660
	bne	a0,zero,.+8
	jal	x0,.L1633
	lw	s0,12(s0)
	bne	s0,zero,.L1628
.L1635:
	lh	a5,644(s1)
.L1658:
	lbu	a4,4(s3)
.L1629:
	addi	a4,a4,1
	sb	a4,4(s3)
	jal	x0,.L1623
.L1660:
	lw	s0,8(s0)
	bne	s0,zero,.L1628
	jal	x0,.L1635
.L1626:
	lh	a5,644(s1)
	bne	s0,zero,.+8
	jal	x0,.L1658
.L1639:
	addi	a5,a5,1
	sw	s0,132(s6)
	addi	op_0,x0,16
	sll	a5,a5,op_0
	sub	op_0,x0,s1
	sub	s5,s5,op_0
	addi	op_0,x0,16
	sra	a5,a5,op_0
	sb	zero,4(s5)
	sh	a5,644(s1)
	jal	x0,.L1658
.L1624:
	lw	s0,12(a5)
	jal	x0,.L1625
.L1633:
	lh	a5,644(s1)
	jal	x0,.L1639
.L1627:
	bne	s0,zero,.+8
	jal	x0,.L1657
	lw	a4,0(s2)
	lw	a5,0(s0)
	sub	a5,a4,a5
	bge	a5,zero,.+8
	jal	x0,.L1661
.L1631:
	bne	a5,zero,.+8
	jal	x0,.L1633
	lw	s0,12(s0)
	bne	s0,zero,.+8
	jal	x0,.L1635
.L1659:
	lw	a5,0(s0)
	sub	a5,a4,a5
	bge	a5,zero,.L1631
.L1661:
	lw	s0,8(s0)
	bne	s0,zero,.L1659
	jal	x0,.L1635
.L1657:
	lh	a5,644(s1)
	jal	x0,.L1629
	.size	sglib__rbtree_it_compute_current_elem, .-sglib__rbtree_it_compute_current_elem
	.align	2
	.type	benchmark_body, @function
benchmark_body:
	addi	sp,sp,-1152
	sw	ra,1148(sp)
	bge	zero,a0,.L1664
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
	addi	s5,zero,1
	addi	s0,sp,28
.L1663:
	addi	a2,s2,0
	addi	a4,s2,0
	addi	a5,s1,0
.L1665:
	lw	a3,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a5)
	bne	s10,a5,.L1665
	addi	a5,zero,100
	sw	zero,28(sp)
	sw	a5,432(sp)
	addi	a7,a5,0
	addi	a6,zero,0
	addi	t1,zero,0
	addi	t3,zero,2
	addi	t4,sp,432
.L1687:
	sub	a5,a7,a6
	addi	t5,t1,0
.L1820:
	bge	t3,a5,.L1666
.L1825:
	addi	a3,a7,-1
	addi	op_0,x0,2
	sll	a1,a6,op_0
	addi	a5,a6,1
	addi	op_0,x0,2
	sll	t1,a3,op_0
	sub	op_0,x0,s1
	sub	t6,a1,op_0
	bge	a5,a3,.L1823
.L1667:
	lw	a0,0(t6)
	bge	a3,a5,.+8
	jal	x0,.L1669
	addi	op_0,x0,2
	sll	a4,a5,op_0
	sub	op_0,x0,s1
	sub	a4,a4,op_0
	jal	x0,.L1681
.L1670:
	addi	a5,a5,1
	addi	a4,a4,4
	bge	a3,a5,.+8
	jal	x0,.L1669
.L1681:
	lw	t0,0(a4)
	bge	a0,t0,.L1670
	bge	a3,a5,.+8
	jal	x0,.L1669
	sub	op_0,x0,s1
	sub	t1,t1,op_0
.L1671:
	lw	a4,0(t1)
	bge	a4,a0,.+8
	jal	x0,.L1824
	addi	a3,a3,-1
	addi	t1,t1,-4
	bge	a3,a5,.+8
	jal	x0,.+8
	jal	x0,.L1671
.L1673:
	addi	op_0,x0,2
	sll	a5,a3,op_0
	sub	op_0,x0,s1
	sub	a5,a5,op_0
	lw	a4,0(a5)
	sub	op_0,x0,s1
	sub	a1,a1,op_0
	sw	a0,0(a5)
	sw	a4,0(a1)
	sub	a5,a3,a6
	addi	a1,a3,0
.L1680:
	bge	s5,a5,.L1668
	sub	a4,a7,a1
	bge	s5,a4,.L1753
	addi	a4,a4,-1
	addi	a1,a1,1
	bge	a5,a4,.L1683
	addi	op_0,x0,2
	sll	a4,t5,op_0
	sub	op_0,x0,t4
	sub	a0,a4,op_0
	sub	op_0,x0,s0
	sub	a4,a4,op_0
	sw	a7,0(a0)
	sw	a1,0(a4)
	addi	t5,t5,1
	addi	a7,a3,0
	bge	t3,a5,.+8
	jal	x0,.L1825
.L1666:
	bne	a5,t3,.+8
	jal	x0,.L1826
.L1685:
	bge	zero,t5,.L1686
.L1828:
	addi	t1,t5,-1
	addi	op_0,x0,2
	sll	a5,t1,op_0
	sub	op_0,x0,s0
	sub	a4,a5,op_0
	sub	op_0,x0,t4
	sub	a5,a5,op_0
	lw	a6,0(a4)
	lw	a7,0(a5)
	jal	x0,.L1687
.L1669:
	sub	op_0,x0,s1
	sub	a4,t1,op_0
	lw	a5,0(a4)
	sub	op_0,x0,s1
	sub	a1,a1,op_0
	sw	a0,0(a4)
	sw	a5,0(a1)
	addi	a1,a3,0
	sub	a5,a3,a6
	jal	x0,.L1680
.L1824:
	bge	a3,a5,.+8
	jal	x0,.L1673
	bge	a5,a3,.L1751
	addi	op_0,x0,2
	sll	t1,a3,op_0
	sub	op_0,x0,s1
	sub	t0,t1,op_0
	addi	op_0,x0,2
	sll	a4,a5,op_0
	lw	a0,0(t0)
	sub	op_0,x0,s1
	sub	a4,a4,op_0
	lw	t2,0(a4)
	sw	a0,0(a4)
	addi	a0,a5,2
	sw	t2,0(t0)
	addi	a4,a5,1
	bge	a0,a3,.+8
	jal	x0,.L1827
	bge	a4,a3,.+8
	jal	x0,.L1677
	addi	a4,a5,0
.L1677:
	addi	a5,a4,0
	jal	x0,.L1667
.L1827:
	addi	a3,a3,-1
	bge	a4,a3,.L1809
	addi	op_0,x0,2
	sll	t1,a3,op_0
	addi	a5,a4,0
	jal	x0,.L1667
.L1751:
	addi	a1,a3,0
	addi	a3,a5,0
	sub	a5,a3,a6
	jal	x0,.L1680
.L1823:
	addi	a1,a3,0
.L1668:
	addi	a6,a1,1
	sub	a5,a7,a6
	jal	x0,.L1820
.L1753:
	addi	a7,a3,0
	jal	x0,.L1820
.L1683:
	addi	op_0,x0,2
	sll	a5,t5,op_0
	sub	op_0,x0,s0
	sub	a4,a5,op_0
	sub	op_0,x0,t4
	sub	a5,a5,op_0
	sw	a6,0(a4)
	sw	a3,0(a5)
	addi	t5,t5,1
	sub	a5,a7,a1
	addi	a6,a1,0
	jal	x0,.L1820
.L1826:
	addi	a5,a7,-1
	addi	op_0,x0,2
	sll	a5,a5,op_0
	addi	op_0,x0,2
	sll	a4,a6,op_0
	sub	op_0,x0,s1
	sub	a5,a5,op_0
	sub	op_0,x0,s1
	sub	a4,a4,op_0
	lw	a1,0(a5)
	lw	a3,0(a4)
	bge	a1,a3,.L1685
	sw	a1,0(a4)
	sw	a3,0(a5)
	bge	zero,t5,.+8
	jal	x0,.L1828
.L1686:
	lw	a5,4(sp)
	lw	s11,4(sp)
	sw	zero,%lo(the_list)(s9)
	sw	s11,%lo(heap_ptr)(s4)
	lui	a5,%hi(heap_end)
	sw	s8,%lo(heap_end)(a5)
	addi	a4,s2,0
	addi	s7,zero,0
	addi	a3,zero,0
	jal	x0,.L1691
.L1689:
	lw	a1,8(a3)
	sw	a3,4(a5)
	sw	a1,8(a5)
	sw	a5,8(a3)
	lw	a3,8(a5)
	bne	a3,zero,.+8
	jal	x0,.L1690
	sw	a5,4(a3)
.L1690:
	addi	a4,a4,4
	addi	a3,zero,1
	bne	s6,a4,.+8
	jal	x0,.L1829
.L1691:
	addi	a5,s11,0
	addi	s11,s11,12
	addi	s7,s7,12
	bltu	s8,s11,.L1688
	lw	a1,0(a4)
	lw	a3,%lo(the_list)(s9)
	sw	a1,0(a5)
	bne	a3,zero,.L1689
	sw	a5,%lo(the_list)(s9)
	sw	zero,8(a5)
	sw	zero,4(a5)
	addi	a4,a4,4
	addi	a3,zero,1
	bne	s6,a4,.L1691
.L1829:
	addi	a0,s9,%lo(the_list)
	sw	a2,12(sp)
	sw	s7,%lo(heap_requested)(s3)
	sw	s11,%lo(heap_ptr)(s4)
.Lpcrel_152:
	auipc	ra,%pcrel_hi(sglib_dllist_sort)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_152)
	lw	a5,%lo(the_list)(s9)
	sw	zero,20(sp)
	lw	a2,12(sp)
	bne	a5,zero,.+8
	jal	x0,.L1695
.L1692:
	addi	a4,a5,0
	lw	a5,8(a5)
	bne	a5,zero,.L1692
.L1694:
	lw	a5,20(sp)
	lw	a4,4(a4)
	addi	a5,a5,1
	sw	a5,20(sp)
	bne	a4,zero,.L1694
.L1695:
	addi	a4,s1,480
	addi	a5,s10,0
.L1693:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L1693
	lui	t1,838861
	addi	t1,t1,-819
	addi	a0,s2,0
	addi	a7,zero,0
.L1701:
	lw	a1,0(a0)
	lui	op_8,16
	addi	op_7,op_8,-1
	or	op_6,a1,op_7
	lui	op_10,16
	addi	op_9,op_10,-1
	sub	op_5,op_6,op_9
	sub	op_4,a1,op_5
	lui	op_15,16
	addi	op_14,op_15,-1
	or	op_13,t1,op_14
	lui	op_17,16
	addi	op_16,op_17,-1
	sub	op_12,op_13,op_16
	sub	op_11,t1,op_12
	callmul	op_3,op_4,op_11
	addi	op_18,x0,16
	srl	op_2,op_3,op_18
	addi	op_25,x0,16
	srl	op_24,a1,op_25
	addi	op_29,x0,16
	srl	op_28,a1,op_29
	lui	op_31,16
	addi	op_30,op_31,-1
	or	op_27,op_28,op_30
	lui	op_33,16
	addi	op_32,op_33,-1
	sub	op_26,op_27,op_32
	sub	op_23,op_24,op_26
	lui	op_38,16
	addi	op_37,op_38,-1
	or	op_36,t1,op_37
	lui	op_40,16
	addi	op_39,op_40,-1
	sub	op_35,op_36,op_39
	sub	op_34,t1,op_35
	callmul	op_22,op_23,op_34
	addi	op_46,x0,16
	srl	op_45,a1,op_46
	addi	op_50,x0,16
	srl	op_49,a1,op_50
	lui	op_52,16
	addi	op_51,op_52,-1
	or	op_48,op_49,op_51
	lui	op_54,16
	addi	op_53,op_54,-1
	sub	op_47,op_48,op_53
	sub	op_44,op_45,op_47
	lui	op_59,16
	addi	op_58,op_59,-1
	or	op_57,t1,op_58
	lui	op_61,16
	addi	op_60,op_61,-1
	sub	op_56,op_57,op_60
	sub	op_55,t1,op_56
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
	or	op_71,a1,op_72
	lui	op_75,16
	addi	op_74,op_75,-1
	sub	op_70,op_71,op_74
	sub	op_69,a1,op_70
	addi	op_78,x0,16
	srl	op_77,t1,op_78
	addi	op_82,x0,16
	srl	op_81,t1,op_82
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
	or	op_92,a1,op_93
	lui	op_96,16
	addi	op_95,op_96,-1
	sub	op_91,op_92,op_95
	sub	op_90,a1,op_91
	addi	op_99,x0,16
	srl	op_98,t1,op_99
	addi	op_103,x0,16
	srl	op_102,t1,op_103
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
	srl	op_118,a1,op_119
	addi	op_123,x0,16
	srl	op_122,a1,op_123
	lui	op_125,16
	addi	op_124,op_125,-1
	or	op_121,op_122,op_124
	lui	op_127,16
	addi	op_126,op_127,-1
	sub	op_120,op_121,op_126
	sub	op_117,op_118,op_120
	lui	op_132,16
	addi	op_131,op_132,-1
	or	op_130,t1,op_131
	lui	op_134,16
	addi	op_133,op_134,-1
	sub	op_129,op_130,op_133
	sub	op_128,t1,op_129
	callmul	op_116,op_117,op_128
	addi	op_135,x0,16
	srl	op_115,op_116,op_135
	lui	op_144,16
	addi	op_143,op_144,-1
	or	op_142,a1,op_143
	lui	op_146,16
	addi	op_145,op_146,-1
	sub	op_141,op_142,op_145
	sub	op_140,a1,op_141
	addi	op_149,x0,16
	srl	op_148,t1,op_149
	addi	op_153,x0,16
	srl	op_152,t1,op_153
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
	srl	op_162,a1,op_163
	addi	op_167,x0,16
	srl	op_166,a1,op_167
	lui	op_169,16
	addi	op_168,op_169,-1
	or	op_165,op_166,op_168
	lui	op_171,16
	addi	op_170,op_171,-1
	sub	op_164,op_165,op_170
	sub	op_161,op_162,op_164
	addi	op_174,x0,16
	srl	op_173,t1,op_174
	addi	op_178,x0,16
	srl	op_177,t1,op_178
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
	sub	a5,op_0,op_113
	addi	op_0,x0,4
	srl	a5,a5,op_0
	addi	op_0,x0,2
	sll	a3,a5,op_0
	sub	op_0,x0,a3
	sub	a3,a5,op_0
	addi	op_0,x0,2
	sll	a3,a3,op_0
	sub	a3,a1,a3
	addi	op_0,x0,2
	sll	a3,a3,op_0
	sub	op_0,x0,s10
	sub	a3,a3,op_0
	lw	a6,0(a3)
	addi	a5,a6,0
	bne	a6,zero,.L1696
	jal	x0,.L1697
.L1698:
	lw	a5,4(a5)
	bne	a5,zero,.+8
	jal	x0,.L1697
.L1696:
	lw	a4,0(a5)
	bne	a1,a4,.L1698
	addi	a0,a0,4
	bne	s6,a0,.L1701
.L1831:
	bne	a7,zero,.+8
	jal	x0,.L1702
	sw	s7,%lo(heap_requested)(s3)
	sw	s11,%lo(heap_ptr)(s4)
.L1702:
	lw	a5,400(s1)
	bne	a5,zero,.+8
	jal	x0,.L1703
	lui	a0,%hi(.LANCHOR0+404)
	lw	a4,4(a5)
	addi	a0,a0,%lo(.LANCHOR0+404)
	addi	a5,zero,0
.L1704:
	addi	a1,zero,19
.L1711:
	lw	a3,20(sp)
	addi	a3,a3,1
	sw	a3,20(sp)
	bne	a4,zero,.+8
	jal	x0,.L1708
.L1830:
	lw	a3,20(sp)
	lw	a4,4(a4)
	addi	a3,a3,1
	sw	a3,20(sp)
	bne	a4,zero,.L1830
.L1708:
	addi	op_0,x0,2
	sll	a4,a5,op_0
	sub	op_0,x0,a0
	sub	a4,a4,op_0
.L1710:
	addi	a5,a5,1
	bge	a1,a5,.+8
	jal	x0,.L1707
	lw	a3,0(a4)
	addi	a4,a4,4
	bne	a3,zero,.+8
	jal	x0,.L1710
	lw	a4,4(a3)
	jal	x0,.L1711
.L1697:
	addi	a5,s11,8
	addi	s7,s7,8
	bltu	s8,a5,.L1700
	sw	a1,0(s11)
	sw	a6,4(s11)
	sw	s11,0(a3)
	addi	a0,a0,4
	addi	a7,zero,1
	addi	s11,a5,0
	bne	s6,a0,.L1701
	jal	x0,.L1831
.L1707:
	lui	a7,166111
	addi	a7,a7,203
	addi	a4,s2,0
	addi	a5,zero,0
	addi	t1,zero,101
.L1712:
	addi	a3,a5,1
	lui	op_7,16
	addi	op_6,op_7,-1
	or	op_5,a3,op_6
	lui	op_9,16
	addi	op_8,op_9,-1
	sub	op_4,op_5,op_8
	sub	op_3,a3,op_4
	addi	op_11,x0,16
	sra	op_10,a7,op_11
	callmul	op_2,op_3,op_10
	lui	op_21,16
	addi	op_20,op_21,-1
	or	op_19,a3,op_20
	lui	op_23,16
	addi	op_22,op_23,-1
	sub	op_18,op_19,op_22
	sub	op_17,a3,op_18
	lui	op_28,16
	addi	op_27,op_28,-1
	or	op_26,a7,op_27
	lui	op_30,16
	addi	op_29,op_30,-1
	sub	op_25,op_26,op_29
	sub	op_24,a7,op_25
	callmul	op_16,op_17,op_24
	addi	op_31,x0,16
	srl	op_15,op_16,op_31
	addi	op_35,x0,16
	sra	op_34,a3,op_35
	lui	op_40,16
	addi	op_39,op_40,-1
	or	op_38,a7,op_39
	lui	op_42,16
	addi	op_41,op_42,-1
	sub	op_37,op_38,op_41
	sub	op_36,a7,op_37
	callmul	op_33,op_34,op_36
	sub	op_32,x0,op_33
	sub	op_14,op_15,op_32
	lui	op_52,16
	addi	op_51,op_52,-1
	or	op_50,a3,op_51
	lui	op_54,16
	addi	op_53,op_54,-1
	sub	op_49,op_50,op_53
	sub	op_48,a3,op_49
	lui	op_59,16
	addi	op_58,op_59,-1
	or	op_57,a7,op_58
	lui	op_61,16
	addi	op_60,op_61,-1
	sub	op_56,op_57,op_60
	sub	op_55,a7,op_56
	callmul	op_47,op_48,op_55
	addi	op_62,x0,16
	srl	op_46,op_47,op_62
	addi	op_66,x0,16
	sra	op_65,a3,op_66
	lui	op_71,16
	addi	op_70,op_71,-1
	or	op_69,a7,op_70
	lui	op_73,16
	addi	op_72,op_73,-1
	sub	op_68,op_69,op_72
	sub	op_67,a7,op_68
	callmul	op_64,op_65,op_67
	sub	op_63,x0,op_64
	sub	op_45,op_46,op_63
	lui	op_75,16
	addi	op_74,op_75,-1
	or	op_44,op_45,op_74
	lui	op_77,16
	addi	op_76,op_77,-1
	sub	op_43,op_44,op_76
	sub	op_13,op_14,op_43
	sub	op_12,x0,op_13
	sub	op_1,op_2,op_12
	addi	op_78,x0,16
	sra	op_0,op_1,op_78
	lui	op_89,16
	addi	op_88,op_89,-1
	or	op_87,a3,op_88
	lui	op_91,16
	addi	op_90,op_91,-1
	sub	op_86,op_87,op_90
	sub	op_85,a3,op_86
	lui	op_96,16
	addi	op_95,op_96,-1
	or	op_94,a7,op_95
	lui	op_98,16
	addi	op_97,op_98,-1
	sub	op_93,op_94,op_97
	sub	op_92,a7,op_93
	callmul	op_84,op_85,op_92
	addi	op_99,x0,16
	srl	op_83,op_84,op_99
	addi	op_103,x0,16
	sra	op_102,a3,op_103
	lui	op_108,16
	addi	op_107,op_108,-1
	or	op_106,a7,op_107
	lui	op_110,16
	addi	op_109,op_110,-1
	sub	op_105,op_106,op_109
	sub	op_104,a7,op_105
	callmul	op_101,op_102,op_104
	sub	op_100,x0,op_101
	sub	op_82,op_83,op_100
	addi	op_111,x0,16
	sra	op_81,op_82,op_111
	addi	op_115,x0,16
	sra	op_114,a3,op_115
	addi	op_117,x0,16
	sra	op_116,a7,op_117
	callmul	op_113,op_114,op_116
	sub	op_112,x0,op_113
	sub	op_80,op_81,op_112
	sub	op_79,x0,op_80
	sub	a1,op_0,op_79
	lw	a6,0(a4)
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	op_0,x0,s0
	sub	a5,a5,op_0
	addi	op_0,x0,31
	sra	a0,a3,op_0
	sw	a6,0(a5)
	addi	a4,a4,4
	addi	op_0,x0,4
	sra	a5,a1,op_0
	sub	a5,a5,a0
	callmul	a5,a5,t1
	sub	a5,a3,a5
	bne	s6,a4,.L1712
	lui	a3,166111
	addi	a3,a3,203
	addi	a4,zero,0
	addi	a6,zero,101
	bne	a5,zero,.+8
	jal	x0,.L1716
.L1714:
	addi	a1,a4,1
	lui	op_7,16
	addi	op_6,op_7,-1
	or	op_5,a1,op_6
	lui	op_9,16
	addi	op_8,op_9,-1
	sub	op_4,op_5,op_8
	sub	op_3,a1,op_4
	addi	op_11,x0,16
	sra	op_10,a3,op_11
	callmul	op_2,op_3,op_10
	lui	op_21,16
	addi	op_20,op_21,-1
	or	op_19,a1,op_20
	lui	op_23,16
	addi	op_22,op_23,-1
	sub	op_18,op_19,op_22
	sub	op_17,a1,op_18
	lui	op_28,16
	addi	op_27,op_28,-1
	or	op_26,a3,op_27
	lui	op_30,16
	addi	op_29,op_30,-1
	sub	op_25,op_26,op_29
	sub	op_24,a3,op_25
	callmul	op_16,op_17,op_24
	addi	op_31,x0,16
	srl	op_15,op_16,op_31
	addi	op_35,x0,16
	sra	op_34,a1,op_35
	lui	op_40,16
	addi	op_39,op_40,-1
	or	op_38,a3,op_39
	lui	op_42,16
	addi	op_41,op_42,-1
	sub	op_37,op_38,op_41
	sub	op_36,a3,op_37
	callmul	op_33,op_34,op_36
	sub	op_32,x0,op_33
	sub	op_14,op_15,op_32
	lui	op_52,16
	addi	op_51,op_52,-1
	or	op_50,a1,op_51
	lui	op_54,16
	addi	op_53,op_54,-1
	sub	op_49,op_50,op_53
	sub	op_48,a1,op_49
	lui	op_59,16
	addi	op_58,op_59,-1
	or	op_57,a3,op_58
	lui	op_61,16
	addi	op_60,op_61,-1
	sub	op_56,op_57,op_60
	sub	op_55,a3,op_56
	callmul	op_47,op_48,op_55
	addi	op_62,x0,16
	srl	op_46,op_47,op_62
	addi	op_66,x0,16
	sra	op_65,a1,op_66
	lui	op_71,16
	addi	op_70,op_71,-1
	or	op_69,a3,op_70
	lui	op_73,16
	addi	op_72,op_73,-1
	sub	op_68,op_69,op_72
	sub	op_67,a3,op_68
	callmul	op_64,op_65,op_67
	sub	op_63,x0,op_64
	sub	op_45,op_46,op_63
	lui	op_75,16
	addi	op_74,op_75,-1
	or	op_44,op_45,op_74
	lui	op_77,16
	addi	op_76,op_77,-1
	sub	op_43,op_44,op_76
	sub	op_13,op_14,op_43
	sub	op_12,x0,op_13
	sub	op_1,op_2,op_12
	addi	op_78,x0,16
	sra	op_0,op_1,op_78
	lui	op_89,16
	addi	op_88,op_89,-1
	or	op_87,a1,op_88
	lui	op_91,16
	addi	op_90,op_91,-1
	sub	op_86,op_87,op_90
	sub	op_85,a1,op_86
	lui	op_96,16
	addi	op_95,op_96,-1
	or	op_94,a3,op_95
	lui	op_98,16
	addi	op_97,op_98,-1
	sub	op_93,op_94,op_97
	sub	op_92,a3,op_93
	callmul	op_84,op_85,op_92
	addi	op_99,x0,16
	srl	op_83,op_84,op_99
	addi	op_103,x0,16
	sra	op_102,a1,op_103
	lui	op_108,16
	addi	op_107,op_108,-1
	or	op_106,a3,op_107
	lui	op_110,16
	addi	op_109,op_110,-1
	sub	op_105,op_106,op_109
	sub	op_104,a3,op_105
	callmul	op_101,op_102,op_104
	sub	op_100,x0,op_101
	sub	op_82,op_83,op_100
	addi	op_111,x0,16
	sra	op_81,op_82,op_111
	addi	op_115,x0,16
	sra	op_114,a1,op_115
	addi	op_117,x0,16
	sra	op_116,a3,op_117
	callmul	op_113,op_114,op_116
	sub	op_112,x0,op_113
	sub	op_80,op_81,op_112
	sub	op_79,x0,op_80
	sub	a0,op_0,op_79
	addi	op_0,x0,2
	sll	a4,a4,op_0
	sub	op_0,x0,s0
	sub	a4,a4,op_0
	lw	t1,0(a4)
	lw	a4,20(sp)
	addi	op_0,x0,31
	sra	a7,a1,op_0
	sub	op_0,x0,a4
	sub	a4,t1,op_0
	sw	a4,20(sp)
	addi	op_0,x0,4
	sra	a4,a0,op_0
	sub	a4,a4,a7
	callmul	a4,a4,a6
	sub	a4,a1,a4
	bne	a4,a5,.L1714
.L1716:
	addi	t1,s2,4
	addi	a7,s0,0
	addi	a6,zero,0
	addi	a1,zero,14
	addi	t3,zero,99
.L1715:
	sw	a1,0(a7)
	addi	a5,a6,0
	bne	a6,zero,.L1717
	jal	x0,.L1719
.L1722:
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	op_0,x0,s0
	sub	a5,a5,op_0
	sw	a1,0(a4)
	sw	a0,0(a5)
	bne	a3,zero,.+8
	jal	x0,.L1721
	lw	a1,0(a4)
	addi	a5,a3,0
.L1717:
	addi	op_0,x0,1
	sra	a3,a5,op_0
	addi	op_0,x0,2
	sll	a4,a3,op_0
	sub	op_0,x0,s0
	sub	a4,a4,op_0
	lw	a0,0(a4)
	bge	a0,a1,.+8
	jal	x0,.L1722
.L1721:
	bne	a6,t3,.+8
	jal	x0,.L1832
.L1719:
	lw	a1,0(t1)
	addi	a7,a7,4
	addi	a6,a6,1
	addi	t1,t1,4
	jal	x0,.L1715
.L1832:
	addi	a7,s0,396
	addi	a0,zero,100
	jal	x0,.L1728
.L1723:
	addi	a7,a7,-4
	bne	a0,zero,.+8
	jal	x0,.L1833
.L1728:
	lw	a5,20(sp)
	lw	a4,28(sp)
	lw	a6,0(a7)
	addi	a0,a0,-1
	sub	op_0,x0,a5
	sub	a5,a4,op_0
	sw	a5,20(sp)
	sw	a6,28(sp)
	addi	a5,zero,0
.L1727:
	addi	op_0,x0,1
	sll	a4,a5,op_0
	addi	a3,a4,1
	bge	a3,a0,.L1723
	addi	op_0,x0,2
	sll	a1,a3,op_0
	sub	op_0,x0,s0
	sub	a1,a1,op_0
	lw	a1,0(a1)
	addi	a4,a4,2
	bge	a6,a1,.+8
	jal	x0,.L1724
	bge	a4,a0,.L1723
	addi	op_0,x0,2
	sll	a3,a4,op_0
	sub	op_0,x0,s0
	sub	a3,a3,op_0
	lw	a1,0(a3)
	bge	a1,a6,.+8
	jal	x0,.L1723
	bge	a6,a1,.L1723
	addi	a3,a4,0
.L1726:
	bne	a5,a3,.+8
	jal	x0,.L1723
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	op_0,x0,s0
	sub	a5,a5,op_0
	addi	op_0,x0,2
	sll	a4,a3,op_0
	sw	a1,0(a5)
	sub	op_0,x0,s0
	sub	a5,a4,op_0
	sw	a6,0(a5)
	addi	a5,a3,0
	jal	x0,.L1727
.L1724:
	bge	a4,a0,.L1726
	addi	op_0,x0,2
	sll	t1,a4,op_0
	sub	op_0,x0,s0
	sub	t1,t1,op_0
	lw	t1,0(t1)
	bge	t1,a1,.+8
	jal	x0,.L1726
	bge	a1,t1,.L1726
	addi	a1,t1,0
	addi	a3,a4,0
	jal	x0,.L1726
.L1833:
	sw	zero,24(sp)
	addi	a3,zero,14
	addi	s11,zero,4
	addi	s7,a2,0
.L1729:
	lw	a1,%lo(heap_ptr)(s4)
	lw	a5,%lo(heap_requested)(s3)
	addi	op_0,x0,3
	addi	op_3,x0,3
	or	op_2,op_3,a1
	sub	op_1,op_2,a1
	sub	a4,op_0,op_1
	addi	a2,a1,16
	addi	a5,a5,16
	bne	a4,zero,.+8
	jal	x0,.L1734
	sub	a4,s11,a4
	sub	op_0,x0,a2
	sub	a2,a4,op_0
	sub	op_0,x0,a5
	sub	a5,a4,op_0
.L1734:
	sw	a5,%lo(heap_requested)(s3)
	bltu	s8,a2,.L1735
	sw	a3,0(a1)
	sw	zero,12(a1)
	sw	zero,8(a1)
	addi	a0,sp,24
	sw	a2,%lo(heap_ptr)(s4)
.Lpcrel_153:
	auipc	ra,%pcrel_hi(sglib___rbtree_add_recursive.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_153)
	lw	a1,24(sp)
	addi	s7,s7,4
	sb	zero,4(a1)
	bne	s6,s7,.+8
	jal	x0,.L1736
.L1821:
	addi	a4,a1,0
	lw	a3,0(s7)
	lw	a5,0(a4)
	sub	a5,a3,a5
	bge	a5,zero,.+8
	jal	x0,.L1834
.L1730:
	bne	a5,zero,.+8
	jal	x0,.L1732
	lw	a4,12(a4)
	bne	a4,zero,.+8
	jal	x0,.L1729
.L1822:
	lw	a5,0(a4)
	sub	a5,a3,a5
	bge	a5,zero,.L1730
.L1834:
	lw	a4,8(a4)
	bne	a4,zero,.L1822
	jal	x0,.L1729
.L1732:
	addi	s7,s7,4
	bne	s6,s7,.L1821
.L1736:
	lui	a5,16
	addi	a5,a5,1
	sw	a5,1076(sp)
	addi	a5,zero,1
	sw	zero,1080(sp)
	sw	zero,1084(sp)
	sb	zero,436(sp)
	sw	a1,564(sp)
	addi	a2,a5,0
	addi	a7,zero,0
	addi	a0,sp,1088
	addi	a6,sp,436
.L1738:
	lw	a3,8(a1)
	addi	a4,zero,0
.L1745:
	bne	a3,zero,.+8
	jal	x0,.L1740
	addi	op_0,x0,2
	sll	a4,a2,op_0
	sub	op_0,x0,a4
	sub	a4,a6,op_0
	sw	a3,128(a4)
	sub	op_0,x0,a2
	sub	a2,sp,op_0
	sb	zero,436(a2)
	addi	a5,a5,1
	lbu	a4,-652(a0)
	addi	op_0,x0,16
	sll	a5,a5,op_0
	addi	op_0,x0,16
	sra	a5,a5,op_0
	addi	a7,zero,1
.L1740:
	addi	a4,a4,1
	sb	a4,-652(a0)
	bge	zero,a5,.L1741
.L1836:
	addi	a3,a5,-1
	addi	a4,a3,1072
	addi	a2,sp,16
	sub	op_0,x0,a4
	sub	a0,a2,op_0
	lbu	a4,-652(a0)
	addi	a2,a5,0
	bne	a4,s5,.+8
	jal	x0,.L1742
	bltu	s5,a4,.+8
	jal	x0,.L1835
	addi	op_0,x0,16
	sll	a5,a3,op_0
	addi	op_0,x0,16
	sra	a5,a5,op_0
	addi	a7,zero,1
	bge	zero,a5,.+8
	jal	x0,.L1836
.L1741:
	lw	a5,0(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	lw	a4,0(sp)
	lw	a5,8(sp)
	bne	a5,a4,.L1663
.L1837:
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
.L1664:
	lw	ra,1148(sp)
	lw	a0,20(sp)
	addi	sp,sp,1152
	jalr	zero,ra,0
.L1835:
	addi	op_0,x0,2
	sll	a4,a5,op_0
	sub	op_0,x0,a4
	sub	a4,sp,op_0
	lw	a1,560(a4)
	jal	x0,.L1738
.L1742:
	addi	op_0,x0,2
	sll	a3,a5,op_0
	sub	op_0,x0,a3
	sub	a3,a6,op_0
	lw	a3,124(a3)
	bne	a3,zero,.L1744
	lw	a3,12(zero)
	jal	x0,.L1745
.L1703:
	addi	a0,s10,4
	addi	a4,a0,0
	addi	a1,zero,20
.L1705:
	addi	a5,a5,1
	bne	a5,a1,.+8
	jal	x0,.L1707
	lw	a3,0(a4)
	addi	a4,a4,4
	bne	a3,zero,.+8
	jal	x0,.L1705
	lw	a4,4(a3)
	jal	x0,.L1704
.L1744:
	bne	a7,zero,.+8
	jal	x0,.L1746
	sh	a5,1076(sp)
.L1746:
	sw	a3,432(sp)
.L1747:
	lw	a4,0(a3)
	lw	a5,20(sp)
	addi	a0,sp,432
	sub	op_0,x0,a5
	sub	a5,a4,op_0
	sw	a5,20(sp)
.Lpcrel_154:
	auipc	ra,%pcrel_hi(sglib__rbtree_it_compute_current_elem)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_154)
	lw	a3,432(sp)
	bne	a3,zero,.L1747
	lw	a5,0(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	lw	a4,0(sp)
	lw	a5,8(sp)
	bne	a5,a4,.L1663
	jal	x0,.L1837
.L1809:
	addi	a1,a3,0
	sub	a5,a4,a6
	addi	a3,a4,0
	jal	x0,.L1680
.L1700:
	sw	s7,%lo(heap_requested)(s3)
	bne	a7,zero,.+8
	jal	x0,.L1735
	sw	s11,%lo(heap_ptr)(s4)
.L1735:
	sw	zero,0(zero)
.L1688:
	sw	s7,%lo(heap_requested)(s3)
	bne	a3,zero,.+8
	jal	x0,.L1735
	sw	a5,%lo(heap_ptr)(s4)
	jal	x0,.L1735
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
	addi	s3,a0,0
	addi	s4,a2,0
	addi	s0,a1,0
	bne	a4,zero,.+8
	jal	x0,.L1839
	sw	s1,20(sp)
	sw	s2,16(sp)
	addi	s1,a4,0
	addi	s2,a3,0
	bne	a3,zero,.+8
	jal	x0,.L1840
.L1850:
	bne	s0,zero,.+8
	jal	x0,.L1869
.L1841:
	addi	a1,s0,0
	addi	a0,s1,0
	jalr	ra,s2,0
	bge	a0,zero,.+8
	jal	x0,.L1873
	bne	a0,zero,.+8
	jal	x0,.L1871
	lw	s0,12(s0)
	bne	s0,zero,.L1841
.L1869:
	lw	s1,20(sp)
	lw	s2,16(sp)
.L1843:
	lw	ra,28(sp)
	lw	s0,24(sp)
	sh	zero,644(s3)
	sw	zero,0(s3)
	lw	s4,8(sp)
	lw	s3,12(sp)
	addi	a0,zero,0
	addi	sp,sp,32
	jalr	zero,ra,0
.L1873:
	lw	s0,8(s0)
	jal	x0,.L1850
.L1839:
	bne	a1,zero,.+8
	jal	x0,.L1843
	addi	a5,zero,1
	sb	zero,4(s3)
	sw	s0,132(s3)
	sh	a5,644(s3)
	bne	s4,zero,.L1851
.L1875:
	sw	s0,0(s3)
	lw	ra,28(sp)
	addi	a0,s0,0
	lw	s0,24(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L1851:
	addi	a0,s3,0
.Lpcrel_155:
	auipc	ra,%pcrel_hi(sglib__rbtree_it_compute_current_elem)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_155)
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	a0,0(s3)
	lw	s4,8(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L1840:
	bne	a1,zero,.+8
	jal	x0,.L1869
	lw	a4,0(a4)
	lw	a5,0(s0)
	sub	a5,a4,a5
	bge	a5,zero,.+8
	jal	x0,.L1874
.L1844:
	bne	a5,zero,.+8
	jal	x0,.L1871
	lw	s0,12(s0)
	bne	s0,zero,.+8
	jal	x0,.L1869
.L1872:
	lw	a5,0(s0)
	sub	a5,a4,a5
	bge	a5,zero,.L1844
.L1874:
	lw	s0,8(s0)
	bne	s0,zero,.L1872
	jal	x0,.L1869
.L1871:
	addi	a5,zero,1
	lw	s1,20(sp)
	lw	s2,16(sp)
	sb	zero,4(s3)
	sw	s0,132(s3)
	sh	a5,644(s3)
	bne	s4,zero,.+8
	jal	x0,.L1875
	jal	x0,.L1851
	.size	sglib__rbtree_it_init, .-sglib__rbtree_it_init
	.align	2
	.globl	sglib_rbtree_it_init
	.type	sglib_rbtree_it_init, @function
sglib_rbtree_it_init:
	addi	a7,zero,2
	sw	zero,648(a0)
	sw	zero,652(a0)
	sh	a7,646(a0)
	addi	a4,a0,0
	bne	a1,zero,.+8
	jal	x0,.L1894
	addi	a3,zero,1
	addi	a5,a3,0
	sh	a3,644(a0)
	addi	a6,a3,0
	sw	a1,132(a0)
	sb	zero,4(a0)
	sw	zero,0(a0)
	addi	a3,zero,0
	addi	a2,zero,0
.L1879:
	bltu	a6,a3,.L1886
	addi	op_0,x0,2
	sll	a1,a5,op_0
	sub	op_0,x0,a4
	sub	a1,a1,op_0
	lw	a0,128(a1)
	bne	a3,zero,.L1881
	lw	a0,8(a0)
	bne	a0,zero,.+8
	jal	x0,.L1895
.L1883:
	addi	t1,a5,1
	sub	op_0,x0,a4
	sub	a3,a5,op_0
	sw	a0,132(a1)
	addi	op_0,x0,16
	sll	a5,t1,op_0
	sb	zero,4(a3)
	addi	op_0,x0,16
	sra	a5,a5,op_0
	sub	op_0,x0,a4
	sub	a2,a2,op_0
	sh	a5,644(a4)
	lbu	a3,4(a2)
.L1884:
	addi	a3,a3,1
	sb	a3,4(a2)
	bge	zero,a5,.L1896
.L1885:
	addi	a2,a5,-1
	sub	op_0,x0,a4
	sub	a3,a2,op_0
	lbu	a3,4(a3)
	bne	a3,a7,.L1879
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	op_0,x0,a4
	sub	a5,a5,op_0
	lw	a0,128(a5)
	sw	a0,0(a4)
	bne	a0,zero,.L1897
.L1886:
	addi	op_0,x0,16
	sll	a5,a2,op_0
	addi	op_0,x0,16
	sra	a5,a5,op_0
	sh	a5,644(a4)
	bge	zero,a5,.+8
	jal	x0,.L1885
.L1896:
	addi	a0,zero,0
	jalr	zero,ra,0
.L1881:
	lw	a0,12(a0)
	bne	a0,zero,.L1883
.L1895:
	lh	a5,644(a4)
	sub	op_0,x0,a4
	sub	a2,a2,op_0
	jal	x0,.L1884
.L1894:
	sh	zero,644(a0)
	sw	zero,0(a0)
	addi	a0,zero,0
	jalr	zero,ra,0
.L1897:
	jalr	zero,ra,0
	.size	sglib_rbtree_it_init, .-sglib_rbtree_it_init
	.align	2
	.globl	sglib_rbtree_it_init_preorder
	.type	sglib_rbtree_it_init_preorder, @function
sglib_rbtree_it_init_preorder:
	sh	zero,646(a0)
	sw	zero,648(a0)
	sw	zero,652(a0)
	addi	a4,zero,0
	bne	a1,zero,.+8
	jal	x0,.L1899
	sb	zero,4(a0)
	sw	a1,132(a0)
	addi	a4,zero,1
.L1899:
	sw	a1,0(a0)
	sh	a4,644(a0)
	addi	a0,a1,0
	jalr	zero,ra,0
	.size	sglib_rbtree_it_init_preorder, .-sglib_rbtree_it_init_preorder
	.align	2
	.globl	sglib_rbtree_it_init_inorder
	.type	sglib_rbtree_it_init_inorder, @function
sglib_rbtree_it_init_inorder:
	addi	a3,zero,1
	sw	zero,648(a0)
	sw	zero,652(a0)
	sh	a3,646(a0)
	addi	a4,a0,0
	bne	a1,zero,.+8
	jal	x0,.L1916
	addi	a5,a3,0
	sh	a3,644(a0)
	addi	a6,a3,0
	sw	a1,132(a0)
	sb	zero,4(a0)
	sw	zero,0(a0)
	addi	a3,zero,0
	addi	a2,zero,0
.L1905:
	bltu	a6,a3,.+8
	jal	x0,.L1917
	addi	op_0,x0,16
	sll	a5,a2,op_0
	addi	op_0,x0,16
	sra	a5,a5,op_0
	sh	a5,644(a4)
	bge	zero,a5,.L1918
.L1909:
	addi	a2,a5,-1
	sub	op_0,x0,a4
	sub	a3,a2,op_0
	lbu	a3,4(a3)
	bne	a3,a6,.L1905
	addi	op_0,x0,2
	sll	a1,a5,op_0
	sub	op_0,x0,a4
	sub	a1,a1,op_0
	lw	a0,128(a1)
	sw	a0,0(a4)
	bne	a0,zero,.L1919
	addi	op_0,x0,2
	sll	a1,a5,op_0
	sub	op_0,x0,a4
	sub	a1,a1,op_0
	lw	a0,128(a1)
	lw	a0,12(a0)
	bne	a0,zero,.+8
	jal	x0,.L1920
.L1907:
	addi	a7,a5,1
	sub	op_0,x0,a4
	sub	a3,a5,op_0
	sw	a0,132(a1)
	addi	op_0,x0,16
	sll	a5,a7,op_0
	sb	zero,4(a3)
	addi	op_0,x0,16
	sra	a5,a5,op_0
	sub	op_0,x0,a4
	sub	a2,a2,op_0
	sh	a5,644(a4)
	lbu	a3,4(a2)
.L1908:
	addi	a3,a3,1
	sb	a3,4(a2)
	bge	zero,a5,.+8
	jal	x0,.L1909
.L1918:
	addi	a0,zero,0
	jalr	zero,ra,0
.L1917:
	addi	op_0,x0,2
	sll	a1,a5,op_0
	sub	op_0,x0,a4
	sub	a1,a1,op_0
	lw	a0,128(a1)
	addi	a3,zero,0
	lw	a0,8(a0)
	bne	a0,zero,.L1907
.L1920:
	lh	a5,644(a4)
	sub	op_0,x0,a4
	sub	a2,a2,op_0
	jal	x0,.L1908
.L1916:
	sh	zero,644(a0)
	sw	zero,0(a0)
	addi	a0,zero,0
	jalr	zero,ra,0
.L1919:
	jalr	zero,ra,0
	.size	sglib_rbtree_it_init_inorder, .-sglib_rbtree_it_init_inorder
	.align	2
	.globl	sglib_rbtree_it_init_postorder
	.type	sglib_rbtree_it_init_postorder, @function
sglib_rbtree_it_init_postorder:
	addi	a7,zero,2
	sw	zero,648(a0)
	sw	zero,652(a0)
	sh	a7,646(a0)
	addi	a4,a0,0
	bne	a1,zero,.+8
	jal	x0,.L1939
	addi	a3,zero,1
	addi	a5,a3,0
	sh	a3,644(a0)
	addi	a6,a3,0
	sw	a1,132(a0)
	sb	zero,4(a0)
	sw	zero,0(a0)
	addi	a3,zero,0
	addi	a2,zero,0
.L1924:
	bltu	a6,a3,.L1931
	addi	op_0,x0,2
	sll	a1,a5,op_0
	sub	op_0,x0,a4
	sub	a1,a1,op_0
	lw	a0,128(a1)
	bne	a3,zero,.L1926
	lw	a0,8(a0)
	bne	a0,zero,.+8
	jal	x0,.L1940
.L1928:
	addi	t1,a5,1
	sub	op_0,x0,a4
	sub	a3,a5,op_0
	sw	a0,132(a1)
	addi	op_0,x0,16
	sll	a5,t1,op_0
	sb	zero,4(a3)
	addi	op_0,x0,16
	sra	a5,a5,op_0
	sub	op_0,x0,a4
	sub	a2,a2,op_0
	sh	a5,644(a4)
	lbu	a3,4(a2)
.L1929:
	addi	a3,a3,1
	sb	a3,4(a2)
	bge	zero,a5,.L1941
.L1930:
	addi	a2,a5,-1
	sub	op_0,x0,a4
	sub	a3,a2,op_0
	lbu	a3,4(a3)
	bne	a3,a7,.L1924
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	op_0,x0,a4
	sub	a5,a5,op_0
	lw	a0,128(a5)
	sw	a0,0(a4)
	bne	a0,zero,.L1942
.L1931:
	addi	op_0,x0,16
	sll	a5,a2,op_0
	addi	op_0,x0,16
	sra	a5,a5,op_0
	sh	a5,644(a4)
	bge	zero,a5,.+8
	jal	x0,.L1930
.L1941:
	addi	a0,zero,0
	jalr	zero,ra,0
.L1926:
	lw	a0,12(a0)
	bne	a0,zero,.L1928
.L1940:
	lh	a5,644(a4)
	sub	op_0,x0,a4
	sub	a2,a2,op_0
	jal	x0,.L1929
.L1939:
	sh	zero,644(a0)
	sw	zero,0(a0)
	addi	a0,zero,0
	jalr	zero,ra,0
.L1942:
	jalr	zero,ra,0
	.size	sglib_rbtree_it_init_postorder, .-sglib_rbtree_it_init_postorder
	.align	2
	.globl	sglib_rbtree_it_init_on_equal
	.type	sglib_rbtree_it_init_on_equal, @function
sglib_rbtree_it_init_on_equal:
	addi	sp,sp,-16
	addi	a4,a3,0
	addi	a3,a2,0
	addi	a2,zero,1
	sw	ra,12(sp)
.Lpcrel_156:
	auipc	ra,%pcrel_hi(sglib__rbtree_it_init)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_156)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
	.size	sglib_rbtree_it_init_on_equal, .-sglib_rbtree_it_init_on_equal
	.align	2
	.globl	sglib_rbtree_it_current
	.type	sglib_rbtree_it_current, @function
sglib_rbtree_it_current:
	lw	a0,0(a0)
	jalr	zero,ra,0
	.size	sglib_rbtree_it_current, .-sglib_rbtree_it_current
	.align	2
	.globl	sglib_rbtree_it_next
	.type	sglib_rbtree_it_next, @function
sglib_rbtree_it_next:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	a0,12(sp)
.Lpcrel_157:
	auipc	ra,%pcrel_hi(sglib__rbtree_it_compute_current_elem)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_157)
	lw	a0,12(sp)
	lw	ra,28(sp)
	lw	a0,0(a0)
	addi	sp,sp,32
	jalr	zero,ra,0
	.size	sglib_rbtree_it_next, .-sglib_rbtree_it_next
	.align	2
	.globl	sglib___rbtree_consistency_check
	.type	sglib___rbtree_consistency_check, @function
sglib___rbtree_consistency_check:
	addi	sp,sp,-48
	addi	a5,zero,-1
	sw	ra,44(sp)
	sw	a5,28(sp)
	bne	a0,zero,.+8
	jal	x0,.L1948
	lbu	a2,4(a0)
	addi	a3,zero,1
	lw	a4,8(a0)
	addi	a5,a0,0
	bne	a2,a3,.+8
	jal	x0,.L2007
	bne	a4,zero,.+8
	jal	x0,.L1960
	sw	s0,40(sp)
	lbu	a1,4(a4)
	lw	a6,8(a4)
	bne	a1,a3,.+8
	jal	x0,.L2008
	addi	s0,sp,28
	sw	a0,4(sp)
	addi	a1,s0,0
	addi	a0,a6,0
	sw	a4,0(sp)
.Lpcrel_158:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_158)
	lw	a4,0(sp)
	lw	a5,4(sp)
	addi	a3,zero,1
	lw	a4,12(a4)
	bne	a4,zero,.+8
	jal	x0,.L2009
	lbu	a2,4(a4)
	lw	a6,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L2010
	bne	a6,zero,.+8
	jal	x0,.L2011
	lbu	a2,4(a6)
	sw	a5,8(sp)
	sw	a6,4(sp)
	sw	a4,0(sp)
	lw	a0,8(a6)
	bne	a2,a3,.+8
	jal	x0,.L2012
	addi	a2,zero,4
	addi	a1,s0,0
.Lpcrel_159:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_159)
	lw	a6,4(sp)
	addi	a1,s0,0
	addi	a2,zero,4
	lw	a0,12(a6)
.Lpcrel_160:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_160)
	lw	a5,8(sp)
	lw	a4,0(sp)
.L1968:
	lw	a4,12(a4)
	bne	a4,zero,.+8
	jal	x0,.L2013
.L1969:
	lbu	a2,4(a4)
	addi	a3,zero,1
	sw	a5,4(sp)
	sw	a4,0(sp)
	lw	a0,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L2014
	addi	a2,zero,4
	addi	a1,s0,0
.Lpcrel_161:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_161)
	lw	a4,0(sp)
	addi	a1,s0,0
	addi	a2,zero,4
	lw	a0,12(a4)
.Lpcrel_162:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_162)
	lw	a5,4(sp)
	jal	x0,.L1962
.L2007:
	sw	a0,0(sp)
	addi	a1,sp,28
	addi	a0,a4,0
.Lpcrel_163:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_163)
	lw	a5,0(sp)
	addi	a1,sp,28
	lw	a0,12(a5)
.Lpcrel_164:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_164)
.L1948:
	lw	ra,44(sp)
	addi	sp,sp,48
	jalr	zero,ra,0
.L2009:
	lw	a4,28(sp)
	bge	a4,zero,.+8
	jal	x0,.L2015
.L2002:
	lw	s0,40(sp)
.L1953:
	lw	a5,12(a5)
	bne	a5,zero,.+8
	jal	x0,.L1948
	lbu	a3,4(a5)
	addi	a2,zero,1
	lw	a4,8(a5)
	bne	a3,a2,.+8
	jal	x0,.L2016
.L1972:
	addi	a0,a4,0
	addi	a1,sp,28
	sw	a5,0(sp)
.Lpcrel_165:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_165)
	lw	a5,0(sp)
	addi	a1,sp,28
	lw	a0,12(a5)
.Lpcrel_166:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive.constprop.2)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_166)
	lw	ra,44(sp)
	addi	sp,sp,48
	jalr	zero,ra,0
.L2008:
	bne	a6,zero,.+8
	jal	x0,.L2017
	lbu	a2,4(a6)
	lw	a0,8(a6)
	bne	a2,a1,.+8
	jal	x0,.L2018
	addi	s0,sp,28
	addi	a1,s0,0
	addi	a2,zero,2
	sw	a5,8(sp)
	sw	a4,0(sp)
	sw	a6,4(sp)
.Lpcrel_167:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_167)
	lw	a6,4(sp)
	addi	a1,s0,0
	addi	a2,zero,2
	lw	a0,12(a6)
.Lpcrel_168:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_168)
	lw	a5,8(sp)
	lw	a4,0(sp)
.L1959:
	lw	a4,12(a4)
	bne	a4,zero,.+8
	jal	x0,.L2019
.L1957:
	lbu	a2,4(a4)
	addi	a3,zero,1
	lw	a0,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L2020
	sw	a5,4(sp)
	sw	a4,0(sp)
.L2006:
	addi	a2,zero,2
	addi	a1,s0,0
.Lpcrel_169:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_169)
	lw	a4,0(sp)
	addi	a1,s0,0
	addi	a2,zero,2
	lw	a0,12(a4)
.Lpcrel_170:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_170)
	lw	a5,4(sp)
.L1962:
	lw	a5,12(a5)
	lw	s0,40(sp)
	bne	a5,zero,.+8
	jal	x0,.L1948
	lbu	a3,4(a5)
	addi	a2,zero,1
	lw	a4,8(a5)
	bne	a3,a2,.L1972
.L2016:
	sw	s0,40(sp)
	bne	a4,zero,.+8
	jal	x0,.L2021
	lbu	a2,4(a4)
	lw	a0,8(a4)
	bne	a2,a3,.+8
	jal	x0,.L2022
	addi	s0,sp,28
	addi	a1,s0,0
	addi	a2,zero,2
	sw	a5,0(sp)
	sw	a4,4(sp)
.Lpcrel_171:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_171)
	lw	a4,4(sp)
	addi	a1,s0,0
	addi	a2,zero,2
	lw	a0,12(a4)
.Lpcrel_172:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_172)
	lw	a5,0(sp)
.L1976:
	lw	a5,12(a5)
	bne	a5,zero,.+8
	jal	x0,.L2005
.L1978:
	lbu	a2,4(a5)
	addi	a4,zero,1
	lw	a0,8(a5)
	bne	a2,a4,.+8
	jal	x0,.L2023
	addi	a1,s0,0
	addi	a2,zero,2
	sw	a5,0(sp)
.Lpcrel_173:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_173)
	lw	a5,0(sp)
	addi	a1,s0,0
	addi	a2,zero,2
	lw	a0,12(a5)
.Lpcrel_174:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_174)
	lw	s0,40(sp)
	jal	x0,.L1948
.L2019:
	lw	a4,28(sp)
	lw	s0,40(sp)
	bge	a4,zero,.L1953
.L1960:
	addi	a4,zero,1
	sw	a4,28(sp)
	jal	x0,.L1953
.L2010:
	sw	a5,4(sp)
	sw	a4,0(sp)
	addi	a0,a6,0
	jal	x0,.L2006
.L2015:
	addi	a4,zero,2
	lw	s0,40(sp)
	sw	a4,28(sp)
	jal	x0,.L1953
.L2012:
	addi	a2,zero,3
	addi	a1,s0,0
.Lpcrel_175:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_175)
	lw	a6,4(sp)
	addi	a1,s0,0
	addi	a2,zero,3
	lw	a0,12(a6)
.Lpcrel_176:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_176)
	lw	a4,0(sp)
	lw	a5,8(sp)
	jal	x0,.L1968
.L2021:
	lw	a4,28(sp)
	bge	a4,zero,.L1974
	sw	a3,28(sp)
.L1974:
	lw	a5,12(a5)
	addi	s0,sp,28
	bne	a5,zero,.L1978
.L2005:
	lw	s0,40(sp)
	jal	x0,.L1948
.L2011:
	lw	a3,28(sp)
	bge	a3,zero,.L1966
	addi	a3,zero,3
	sw	a3,28(sp)
.L1966:
	lw	a4,12(a4)
	bne	a4,zero,.L1969
	jal	x0,.L2002
.L2018:
	addi	s0,sp,28
	addi	a1,s0,0
	sw	a5,12(sp)
	sw	a4,4(sp)
	sw	a6,8(sp)
	sw	a2,0(sp)
.Lpcrel_177:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_177)
	lw	a6,8(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a6)
.Lpcrel_178:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_178)
	lw	a4,4(sp)
	lw	a5,12(sp)
	jal	x0,.L1959
.L2020:
	addi	a1,s0,0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
.Lpcrel_179:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_179)
	lw	a4,4(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_180:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_180)
	lw	a5,8(sp)
	jal	x0,.L1962
.L2023:
	addi	a1,s0,0
	sw	a5,4(sp)
	sw	a2,0(sp)
.Lpcrel_181:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_181)
	lw	a5,4(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a5)
.Lpcrel_182:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_182)
	lw	s0,40(sp)
	jal	x0,.L1948
.L2022:
	addi	s0,sp,28
	addi	a1,s0,0
	sw	a5,4(sp)
	sw	a4,8(sp)
	sw	a2,0(sp)
.Lpcrel_183:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_183)
	lw	a4,8(sp)
	lw	a2,0(sp)
	addi	a1,s0,0
	lw	a0,12(a4)
.Lpcrel_184:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_184)
	lw	a5,4(sp)
	jal	x0,.L1976
.L2014:
	addi	a2,zero,3
	addi	a1,s0,0
.Lpcrel_185:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_185)
	lw	a4,0(sp)
	addi	a1,s0,0
	addi	a2,zero,3
	lw	a0,12(a4)
.Lpcrel_186:
	auipc	ra,%pcrel_hi(sglib___rbtree_consistency_check_recursive)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_186)
	lw	a5,4(sp)
	jal	x0,.L1962
.L2013:
	lw	a4,28(sp)
	bge	a4,zero,.L2002
	addi	a4,zero,3
	lw	s0,40(sp)
	sw	a4,28(sp)
	jal	x0,.L1953
.L2017:
	lw	a4,12(a4)
	sw	a1,28(sp)
	addi	s0,sp,28
	bne	a4,zero,.L1957
	jal	x0,.L2002
	.size	sglib___rbtree_consistency_check, .-sglib___rbtree_consistency_check
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a5,%hi(the_list)
	lw	a4,%lo(the_list)(a5)
	bne	a4,zero,.+8
	jal	x0,.L2025
.L2026:
	addi	a5,a4,0
	lw	a4,8(a4)
	bne	a4,zero,.L2026
	lw	a3,0(a5)
	bne	a3,a4,.L2034
.L2047:
	lw	a5,4(a5)
	addi	a4,a4,1
	bne	a5,zero,.+8
	jal	x0,.L2025
	lw	a3,0(a5)
	bne	a3,a4,.+8
	jal	x0,.L2047
.L2034:
	addi	a5,zero,0
.L2024:
	addi	a0,a5,0
	jalr	zero,ra,0
.L2025:
	lui	a5,%hi(.LANCHOR1)
	addi	t1,a5,%lo(.LANCHOR1)
	lui	a1,%hi(.LANCHOR0)
	lui	a6,838861
	addi	a2,t1,0
	addi	a7,t1,400
	addi	a1,a1,%lo(.LANCHOR0)
	addi	a6,a6,-819
.L2031:
	lw	a3,0(a2)
	lui	op_8,16
	addi	op_7,op_8,-1
	or	op_6,a3,op_7
	lui	op_10,16
	addi	op_9,op_10,-1
	sub	op_5,op_6,op_9
	sub	op_4,a3,op_5
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
	srl	op_24,a3,op_25
	addi	op_29,x0,16
	srl	op_28,a3,op_29
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
	srl	op_45,a3,op_46
	addi	op_50,x0,16
	srl	op_49,a3,op_50
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
	or	op_71,a3,op_72
	lui	op_75,16
	addi	op_74,op_75,-1
	sub	op_70,op_71,op_74
	sub	op_69,a3,op_70
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
	or	op_92,a3,op_93
	lui	op_96,16
	addi	op_95,op_96,-1
	sub	op_91,op_92,op_95
	sub	op_90,a3,op_91
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
	srl	op_118,a3,op_119
	addi	op_123,x0,16
	srl	op_122,a3,op_123
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
	or	op_142,a3,op_143
	lui	op_146,16
	addi	op_145,op_146,-1
	sub	op_141,op_142,op_145
	sub	op_140,a3,op_141
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
	srl	op_162,a3,op_163
	addi	op_167,x0,16
	srl	op_166,a3,op_167
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
	sub	a4,op_0,op_113
	addi	op_0,x0,4
	srl	a4,a4,op_0
	addi	op_0,x0,2
	sll	a5,a4,op_0
	sub	op_0,x0,a5
	sub	a5,a4,op_0
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	a5,a3,a5
	addi	op_0,x0,2
	sll	a5,a5,op_0
	sub	op_0,x0,a1
	sub	a5,a5,op_0
	lw	a5,400(a5)
	bne	a5,zero,.L2029
	jal	x0,.L2024
.L2030:
	lw	a5,4(a5)
	bne	a5,zero,.+8
	jal	x0,.L2024
.L2029:
	lw	a4,0(a5)
	bne	a3,a4,.L2030
	addi	a2,a2,4
	bne	a7,a2,.L2031
	lui	a4,4
	addi	a4,a4,-1334
	addi	a5,zero,0
	bne	a0,a4,.L2024
	lui	a4,%hi(heap_requested)
	lw	a4,%lo(heap_requested)(a4)
	lui	a2,%hi(heap_end)
	lui	a3,%hi(heap)
	lw	a2,%lo(heap_end)(a2)
	addi	a3,a3,%lo(heap)
	sub	op_0,x0,a4
	sub	a4,a3,op_0
	bltu	a2,a4,.L2024
	addi	a5,t1,401
	addi	a3,a1,400
	addi	a4,zero,0
	jal	x0,.L2033
.L2048:
	lbu	a4,0(a5)
	addi	a5,a5,1
.L2033:
	lbu	a2,0(a1)
	addi	a1,a1,1
	bne	a2,a4,.L2034
	bne	a3,a1,.L2048
	addi	a5,zero,1
	jal	x0,.L2024
	.size	verify_benchmark, .-verify_benchmark
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
.Lpcrel_187:
	auipc	ra,%pcrel_hi(benchmark_body)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_187)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	addi	sp,sp,-16
	addi	a0,zero,29
	sw	ra,12(sp)
.Lpcrel_188:
	auipc	ra,%pcrel_hi(benchmark_body)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_188)
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
.Lpcrel_189:
	auipc	ra,%pcrel_hi(benchmark_body)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_189)
.Lpcrel_190:
	auipc	ra,%pcrel_hi(benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_190)
	sw	a0,12(sp)
	lw	a0,12(sp)
.Lpcrel_191:
	auipc	ra,%pcrel_hi(verify_benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_191)
	lw	ra,28(sp)
	addi	op_1,x0,1
	or	op_0,op_1,a0
	addi	op_3,x0,1
	addi	op_6,x0,1
	or	op_5,op_6,a0
	sub	op_4,op_5,a0
	sub	op_2,op_3,op_4
	sub	a0,op_0,op_2
	addi	sp,sp,32
	jalr	zero,ra,0
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

