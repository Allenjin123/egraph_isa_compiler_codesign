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
	li	a2,1
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
	li	a0,0
	ret
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
	li	a6,1
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
	j	.L3
.L51:
	sb	zero,4(a4)
	li	a0,0
	ret
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
	j	.L3
.L15:
	lbu	a0,4(a4)
	li	a3,1
	sb	zero,4(a4)
	seqz	a0,a0
	sb	a3,4(a5)
	ret
.L53:
	sw	a5,0(a0)
	sb	zero,4(a5)
	sw	a4,8(a5)
	sw	zero,12(a4)
	j	.L3
.L47:
	beq	a2,zero,.L7
	lbu	a1,4(a2)
	bne	a1,zero,.L8
.L7:
	sw	a5,0(a0)
	sw	a4,8(a5)
	sb	zero,4(a5)
	sw	a3,12(a4)
	li	a5,1
	sb	a5,4(a3)
	j	.L3
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
	j	.L3
	.size	sglib___rbtree_fix_left_deletion_discrepancy, .-sglib___rbtree_fix_left_deletion_discrepancy
	.align	2
	.type	sglib___rbtree_fix_right_deletion_discrepancy, @function
sglib___rbtree_fix_right_deletion_discrepancy:
	lw	a4,0(a0)
	lw	a5,8(a4)
	beq	a5,zero,.L104
	lbu	a6,4(a5)
	li	a2,1
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
	li	a0,0
	ret
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
	li	a6,1
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
	j	.L57
.L104:
	sb	zero,4(a4)
	li	a0,0
	ret
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
	j	.L57
.L69:
	lbu	a0,4(a4)
	li	a3,1
	sb	zero,4(a4)
	seqz	a0,a0
	sb	a3,4(a5)
	ret
.L106:
	sw	a5,0(a0)
	sb	zero,4(a5)
	sw	a4,12(a5)
	sw	zero,8(a4)
	j	.L57
.L101:
	beq	a2,zero,.L61
	lbu	a1,4(a2)
	bne	a1,zero,.L62
.L61:
	sw	a5,0(a0)
	sw	a4,12(a5)
	sb	zero,4(a5)
	sw	a3,8(a4)
	li	a5,1
	sb	a5,4(a3)
	j	.L57
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
	j	.L57
	.size	sglib___rbtree_fix_right_deletion_discrepancy, .-sglib___rbtree_fix_right_deletion_discrepancy
	.align	2
	.type	sglib___rbtree_delete_rightmost_leaf, @function
sglib___rbtree_delete_rightmost_leaf:
	lw	a5,0(a0)
	mv	a4,a0
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
	call	sglib___rbtree_delete_rightmost_leaf
	lw	a6,8(sp)
	lw	a4,12(sp)
	bne	a0,zero,.L147
.L117:
	li	a0,0
.L148:
	lw	ra,28(sp)
	addi	sp,sp,32
	jr	ra
.L144:
	sw	a3,0(a1)
	lw	a2,8(a3)
	beq	a2,zero,.L114
	lbu	a3,4(a3)
	bne	a3,zero,.L115
	lbu	a3,4(a2)
	bne	a3,zero,.L115
	sw	a2,12(a5)
	j	.L116
.L143:
	sw	a5,0(a1)
	lw	a3,8(a5)
	beq	a3,zero,.L110
	lbu	a5,4(a5)
	li	a0,0
	bne	a5,zero,.L111
	lbu	a0,4(a3)
	seqz	a0,a0
.L111:
	sb	zero,4(a3)
	sw	a3,0(a4)
	ret
.L145:
	sw	a6,0(a1)
	lw	a2,8(a6)
	beq	a2,zero,.L120
	lbu	a1,4(a6)
	bne	a1,zero,.L121
	lbu	a1,4(a2)
	bne	a1,zero,.L121
	sw	a2,12(a3)
	j	.L122
.L114:
	sw	zero,12(a5)
	lbu	a5,4(a3)
	bne	a5,zero,.L117
.L116:
	mv	a0,a4
	call	sglib___rbtree_fix_right_deletion_discrepancy
	lw	ra,28(sp)
	addi	sp,sp,32
	jr	ra
.L121:
	sb	zero,4(a2)
	sw	a2,12(a3)
	li	a0,0
	j	.L148
.L115:
	sb	zero,4(a2)
	sw	a2,12(a5)
	li	a0,0
	j	.L148
.L110:
	sw	zero,0(a0)
	lbu	a0,4(a5)
	seqz	a0,a0
	ret
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
	call	sglib___rbtree_fix_right_deletion_discrepancy
	lw	a5,0(sp)
	lw	a4,4(sp)
	beq	a0,zero,.L117
.L122:
	addi	a0,a5,12
	sw	a4,0(sp)
	call	sglib___rbtree_fix_right_deletion_discrepancy
	lw	a4,0(sp)
	bne	a0,zero,.L116
	li	a0,0
	j	.L148
.L147:
	addi	a0,a6,12
	sw	a4,8(sp)
	call	sglib___rbtree_fix_right_deletion_discrepancy
	lw	a3,0(sp)
	lw	a5,4(sp)
	lw	a4,8(sp)
	bne	a0,zero,.L128
	li	a0,0
	j	.L148
.L125:
	sw	zero,12(a6)
	lbu	a2,4(a0)
	beq	a2,zero,.L128
	li	a0,0
	j	.L148
.L120:
	sw	zero,12(a3)
	lbu	a3,4(a6)
	beq	a3,zero,.L122
	li	a0,0
	j	.L148
.L127:
	sb	zero,4(a2)
	sw	a2,12(a6)
	li	a0,0
	j	.L148
	.size	sglib___rbtree_delete_rightmost_leaf, .-sglib___rbtree_delete_rightmost_leaf
	.align	2
	.type	sglib___rbtree_consistency_check_recursive, @function
sglib___rbtree_consistency_check_recursive:
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	ra,44(sp)
	mv	s0,a1
	mv	s1,a2
	beq	a0,zero,.L234
	lbu	a6,4(a0)
	li	a3,1
	lw	a4,8(a0)
	mv	a5,a0
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
	call	sglib___rbtree_consistency_check_recursive
	lw	a6,4(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a6)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,12(sp)
	lw	a4,8(sp)
.L185:
	lw	a4,12(a4)
	beq	a4,zero,.L250
.L187:
	lbu	a2,4(a4)
	li	a3,1
	lw	a0,8(a4)
	beq	a2,a3,.L251
	addi	a2,s1,3
	mv	a1,s0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,8(sp)
	lw	s2,32(sp)
.L175:
	lw	a5,12(a5)
	beq	a5,zero,.L245
.L189:
	lbu	a2,4(a5)
	li	a3,1
	lw	a4,8(a5)
	beq	a2,a3,.L252
	sw	s2,32(sp)
	addi	s2,s1,2
	beq	a4,zero,.L253
	lbu	a2,4(a4)
	lw	a0,8(a4)
	beq	a2,a3,.L254
	addi	a2,s1,3
	mv	a1,s0
	sw	a5,4(sp)
	sw	a4,8(sp)
	sw	a2,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,8(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
.L199:
	lw	a5,12(a5)
	beq	a5,zero,.L255
.L201:
	lbu	a3,4(a5)
	li	a4,1
	sw	a5,0(sp)
	lw	a0,8(a5)
	beq	a3,a4,.L256
	addi	a2,s1,3
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	addi	a2,s1,3
.L236:
	lw	a5,0(sp)
	mv	a1,s0
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive
	lw	s2,32(sp)
	lw	s3,28(sp)
.L149:
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
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
	call	sglib___rbtree_consistency_check_recursive
	lw	a3,4(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a3)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,12(sp)
	lw	a4,8(sp)
.L160:
	lw	a4,12(a4)
	beq	a4,zero,.L261
.L162:
	lbu	a2,4(a4)
	li	a3,1
	lw	a0,8(a4)
	beq	a2,a3,.L262
	addi	a2,s1,2
	mv	a1,s0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,8(sp)
	lw	s2,32(sp)
.L156:
	lw	a5,12(a5)
	beq	a5,zero,.L234
.L164:
	lbu	a2,4(a5)
	li	a3,1
	lw	a4,8(a5)
	beq	a2,a3,.L263
	sw	s2,32(sp)
	addi	s2,s1,1
	beq	a4,zero,.L264
	lbu	a2,4(a4)
	lw	a0,8(a4)
	beq	a2,a3,.L265
	addi	a2,s1,2
	mv	a1,s0
	sw	a5,4(sp)
	sw	a4,8(sp)
	sw	a2,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,8(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
.L169:
	lw	a5,12(a5)
	beq	a5,zero,.L266
.L171:
	lbu	a3,4(a5)
	li	a4,1
	sw	a5,0(sp)
	lw	a0,8(a5)
	beq	a3,a4,.L267
	addi	a2,s1,2
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	addi	a2,s1,2
.L238:
	lw	a5,0(sp)
	mv	a1,s0
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive
.L239:
	lw	s2,32(sp)
	j	.L149
.L234:
	lw	a5,0(s0)
	bge	a5,zero,.L149
	sw	s1,0(s0)
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
.L257:
	lw	a4,0(a1)
	blt	a4,zero,.L268
.L155:
	lw	a5,12(a5)
	bne	a5,zero,.L164
	j	.L149
.L248:
	lw	a3,0(a1)
	blt	a3,zero,.L269
	lw	a4,12(a4)
	bne	a4,zero,.L187
.L230:
	lw	s2,32(sp)
	j	.L174
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
	jr	ra
.L245:
	lw	a5,0(s0)
	bge	a5,zero,.L237
	sw	s3,0(s0)
	lw	s3,28(sp)
	j	.L149
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
	call	sglib___rbtree_consistency_check_recursive
	lw	a6,4(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a6)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,12(sp)
	lw	a4,8(sp)
.L179:
	lw	a4,12(a4)
	beq	a4,zero,.L243
.L181:
	lbu	a2,4(a4)
	li	a3,1
	lw	a0,8(a4)
	beq	a2,a3,.L273
	addi	a2,s1,2
	mv	a1,s0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,8(sp)
	j	.L175
.L252:
	beq	a4,zero,.L274
	lbu	a3,4(a4)
	lw	a0,8(a4)
	beq	a3,a2,.L275
	addi	a2,s1,2
	mv	a1,s0
	sw	a5,4(sp)
	sw	a4,8(sp)
	sw	a2,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,8(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
.L193:
	lw	a5,12(a5)
	beq	a5,zero,.L245
.L195:
	lbu	a3,4(a5)
	li	a4,1
	sw	a5,0(sp)
	lw	a0,8(a5)
	beq	a3,a4,.L276
	addi	a2,s1,2
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	addi	a2,s1,2
.L240:
	lw	a5,0(sp)
	mv	a1,s0
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive
	lw	s3,28(sp)
	j	.L149
.L270:
	sw	s3,0(s0)
	j	.L175
.L253:
	lw	a4,0(s0)
	blt	a4,zero,.L277
	lw	a5,12(a5)
	bne	a5,zero,.L201
.L233:
	lw	s2,32(sp)
	lw	s3,28(sp)
	j	.L278
.L263:
	mv	a0,a4
	mv	a2,s1
	mv	a1,s0
	sw	a5,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,0(sp)
	mv	a2,s1
	mv	a1,s0
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive
	j	.L149
.L258:
	mv	a0,a3
	sw	a5,4(sp)
	sw	a4,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,0(sp)
	mv	a2,s1
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	j	.L156
.L250:
	lw	a4,0(s0)
	bge	a4,zero,.L230
	sw	s2,0(s0)
	lw	s2,32(sp)
	j	.L175
.L255:
	lw	a5,0(s0)
	bge	a5,zero,.L233
	sw	s2,0(s0)
	lw	s3,28(sp)
	lw	s2,32(sp)
	j	.L149
.L249:
	mv	a2,s2
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a6,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a6,0(sp)
	mv	a2,s2
	mv	a1,s0
	lw	a0,12(a6)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	lw	a5,8(sp)
	j	.L185
.L254:
	mv	a2,s2
	mv	a1,s0
	sw	a5,0(sp)
	sw	a4,4(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	mv	a2,s2
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,0(sp)
	j	.L199
.L251:
	mv	a2,s2
	mv	a1,s0
	sw	a5,4(sp)
	sw	a4,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,0(sp)
	mv	a2,s2
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	lw	s2,32(sp)
	j	.L175
.L256:
	mv	a2,s2
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	mv	a2,s2
	j	.L236
.L268:
	sw	a2,0(s0)
	j	.L156
.L269:
	sw	s2,0(a1)
	j	.L185
.L277:
	sw	s2,0(s0)
	j	.L199
.L271:
	lw	a3,0(a1)
	blt	a3,zero,.L279
	lw	a4,12(a4)
	bne	a4,zero,.L181
	j	.L174
.L264:
	lw	a4,0(s0)
	blt	a4,zero,.L280
	lw	a5,12(a5)
	bne	a5,zero,.L171
	lw	s2,32(sp)
	j	.L149
.L274:
	lw	a4,0(s0)
	blt	a4,zero,.L281
	lw	a5,12(a5)
	bne	a5,zero,.L195
	lw	s3,28(sp)
	j	.L278
.L259:
	lw	a3,0(a1)
	blt	a3,zero,.L282
	lw	a4,12(a4)
	bne	a4,zero,.L162
.L228:
	lw	s2,32(sp)
	j	.L155
.L266:
	lw	a5,0(s0)
	bge	a5,zero,.L239
	sw	s2,0(s0)
	lw	s2,32(sp)
	j	.L149
.L261:
	lw	a4,0(s0)
	bge	a4,zero,.L228
	sw	s2,0(s0)
	lw	s2,32(sp)
	j	.L156
.L276:
	mv	a2,s3
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	mv	a2,s3
	j	.L240
.L265:
	mv	a2,s2
	mv	a1,s0
	sw	a5,0(sp)
	sw	a4,4(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	mv	a2,s2
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,0(sp)
	j	.L169
.L267:
	mv	a2,s2
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	mv	a2,s2
	j	.L238
.L262:
	mv	a2,s2
	mv	a1,s0
	sw	a5,4(sp)
	sw	a4,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,0(sp)
	mv	a2,s2
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	lw	s2,32(sp)
	j	.L156
.L260:
	mv	a2,s2
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a3,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a3,0(sp)
	mv	a2,s2
	mv	a1,s0
	lw	a0,12(a3)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	lw	a5,8(sp)
	j	.L160
.L273:
	mv	a2,s3
	mv	a1,s0
	sw	a5,4(sp)
	sw	a4,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,0(sp)
	mv	a2,s3
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	j	.L175
.L272:
	mv	a2,s3
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a6,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a6,0(sp)
	mv	a2,s3
	mv	a1,s0
	lw	a0,12(a6)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	lw	a5,8(sp)
	j	.L179
.L275:
	mv	a2,s3
	mv	a1,s0
	sw	a5,0(sp)
	sw	a4,4(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	mv	a2,s3
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,0(sp)
	j	.L193
.L281:
	sw	s3,0(s0)
	j	.L193
.L280:
	sw	s2,0(s0)
	j	.L169
.L282:
	sw	s2,0(a1)
	j	.L160
.L279:
	sw	s3,0(a1)
	j	.L179
	.size	sglib___rbtree_consistency_check_recursive, .-sglib___rbtree_consistency_check_recursive
	.align	2
	.type	sglib___rbtree_consistency_check_recursive.constprop.2, @function
sglib___rbtree_consistency_check_recursive.constprop.2:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	ra,28(sp)
	mv	s0,a1
	beq	a0,zero,.L327
	lbu	a2,4(a0)
	li	a3,1
	lw	a4,8(a0)
	mv	a5,a0
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
	li	a2,5
	call	sglib___rbtree_consistency_check_recursive
	lw	a6,4(sp)
	mv	a1,s0
	li	a2,5
	lw	a0,12(a6)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,12(sp)
	lw	a4,8(sp)
.L303:
	lw	a4,12(a4)
	beq	a4,zero,.L335
.L304:
	lbu	a2,4(a4)
	li	a3,1
	sw	a5,8(sp)
	sw	a4,4(sp)
	lw	a0,8(a4)
	beq	a2,a3,.L336
	li	a2,5
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	mv	a1,s0
	li	a2,5
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,8(sp)
.L299:
	lw	a5,12(a5)
	beq	a5,zero,.L337
	lbu	a2,4(a5)
	li	a3,1
	lw	a4,8(a5)
	beq	a2,a3,.L338
.L307:
	beq	a4,zero,.L339
	lbu	a2,4(a4)
	sw	a4,8(sp)
	sw	a5,4(sp)
	lw	a0,8(a4)
	beq	a2,a3,.L340
	li	a2,5
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,8(sp)
	mv	a1,s0
	li	a2,5
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
.L311:
	lw	a5,12(a5)
	beq	a5,zero,.L341
.L312:
	lbu	a3,4(a5)
	li	a4,1
	sw	a5,4(sp)
	lw	a0,8(a5)
	beq	a3,a4,.L342
	li	a2,5
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	mv	a1,s0
	li	a2,5
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive
.L283:
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
.L330:
	beq	a4,zero,.L343
	lbu	a3,4(a4)
	sw	a5,8(sp)
	sw	a4,4(sp)
	lw	a0,8(a4)
	beq	a3,a2,.L344
	li	a2,3
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	mv	a1,s0
	li	a2,3
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,8(sp)
.L291:
	lw	a5,12(a5)
	beq	a5,zero,.L327
.L292:
	lbu	a3,4(a5)
	li	a4,1
	sw	a5,4(sp)
	lw	a0,8(a5)
	beq	a3,a4,.L345
.L328:
	mv	a1,s0
	li	a2,3
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	mv	a1,s0
	li	a2,3
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
.L327:
	lw	a5,0(s0)
	bge	a5,zero,.L283
	li	a5,2
	lw	ra,28(sp)
	sw	a5,0(s0)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
.L343:
	lw	a4,0(a1)
	blt	a4,zero,.L346
.L289:
	lw	a5,12(a5)
	bne	a5,zero,.L292
	j	.L283
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
	li	a3,1
	lw	a4,8(a5)
	bne	a2,a3,.L307
.L338:
	sw	a5,4(sp)
	mv	a0,a4
	j	.L328
.L331:
	lw	a4,0(a1)
	bge	a4,zero,.L297
	li	a4,3
	sw	a4,0(a1)
	j	.L297
.L332:
	sw	a0,8(sp)
	li	a2,3
	mv	a0,a6
	sw	a4,4(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	mv	a1,s0
	li	a2,3
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,8(sp)
	j	.L299
.L337:
	lw	a5,0(s0)
	bge	a5,zero,.L283
	li	a5,3
	sw	a5,0(s0)
	j	.L283
.L339:
	lw	a4,0(s0)
	blt	a4,zero,.L348
.L309:
	lw	a5,12(a5)
	bne	a5,zero,.L312
	j	.L283
.L345:
	mv	a1,s0
	li	a2,2
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	mv	a1,s0
	li	a2,2
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive
	j	.L283
.L344:
	li	a2,2
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	mv	a1,s0
	li	a2,2
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,8(sp)
	j	.L291
.L336:
	li	a2,4
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	mv	a1,s0
	li	a2,4
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,8(sp)
	j	.L299
.L334:
	li	a2,4
	call	sglib___rbtree_consistency_check_recursive
	lw	a6,4(sp)
	mv	a1,s0
	li	a2,4
	lw	a0,12(a6)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,8(sp)
	lw	a5,12(sp)
	j	.L303
.L342:
	mv	a1,s0
	li	a2,4
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	mv	a1,s0
	li	a2,4
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive
	j	.L283
.L340:
	li	a2,4
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,8(sp)
	mv	a1,s0
	li	a2,4
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	j	.L311
.L346:
	li	a4,2
	sw	a4,0(a1)
	j	.L289
.L348:
	li	a4,4
	sw	a4,0(s0)
	j	.L309
.L347:
	li	a3,4
	sw	a3,0(a1)
	j	.L301
.L341:
	lw	a5,0(s0)
	bge	a5,zero,.L283
	li	a5,4
	sw	a5,0(s0)
	j	.L283
.L335:
	lw	a4,0(s0)
	bge	a4,zero,.L297
	li	a4,4
	sw	a4,0(s0)
	j	.L297
	.size	sglib___rbtree_consistency_check_recursive.constprop.2, .-sglib___rbtree_consistency_check_recursive.constprop.2
	.align	2
	.type	sglib___rbtree_consistency_check_recursive.constprop.0, @function
sglib___rbtree_consistency_check_recursive.constprop.0:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	ra,28(sp)
	mv	s0,a1
	beq	a0,zero,.L400
	lbu	a2,4(a0)
	li	a3,1
	lw	a4,8(a0)
	mv	a5,a0
	beq	a2,a3,.L401
	beq	a4,zero,.L397
	lbu	a7,4(a4)
	lw	a6,8(a4)
	beq	a7,a3,.L402
	sw	a0,4(sp)
	mv	a0,a6
	sw	a4,0(sp)
	call	sglib___rbtree_consistency_check_recursive.constprop.2
	lw	a4,0(sp)
	lw	a5,4(sp)
	li	a3,1
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
	li	a2,4
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a6,0(sp)
	mv	a1,s0
	li	a2,4
	lw	a0,12(a6)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,8(sp)
	lw	a4,4(sp)
.L371:
	lw	a4,12(a4)
	beq	a4,zero,.L407
.L372:
	lbu	a2,4(a4)
	li	a3,1
	sw	a5,4(sp)
	sw	a4,0(sp)
	lw	a0,8(a4)
	beq	a2,a3,.L408
	li	a2,4
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,0(sp)
	mv	a1,s0
	li	a2,4
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	j	.L365
.L401:
	sw	a0,0(sp)
	mv	a0,a4
	call	sglib___rbtree_consistency_check_recursive.constprop.0
	lw	a5,0(sp)
	mv	a1,s0
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive.constprop.0
.L349:
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
.L400:
	lw	a5,0(a1)
	bge	a5,zero,.L349
	lw	ra,28(sp)
	lw	s0,24(sp)
	sw	zero,0(a1)
	addi	sp,sp,32
	jr	ra
.L403:
	lw	a4,0(s0)
	blt	a4,zero,.L409
.L356:
	lw	a5,12(a5)
	beq	a5,zero,.L349
.L374:
	lbu	a3,4(a5)
	li	a2,1
	lw	a4,8(a5)
	beq	a3,a2,.L410
	mv	a0,a4
	mv	a1,s0
	sw	a5,0(sp)
	call	sglib___rbtree_consistency_check_recursive.constprop.2
	lw	a5,0(sp)
	mv	a1,s0
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive.constprop.2
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
.L397:
	lw	a4,0(s0)
	bge	a4,zero,.L356
	li	a4,1
	sw	a4,0(s0)
	j	.L356
.L402:
	beq	a6,zero,.L411
	lbu	a2,4(a6)
	lw	a0,8(a6)
	beq	a2,a7,.L412
	li	a2,2
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a6,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a6,0(sp)
	mv	a1,s0
	li	a2,2
	lw	a0,12(a6)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,8(sp)
	lw	a4,4(sp)
.L361:
	lw	a4,12(a4)
	beq	a4,zero,.L397
.L362:
	lbu	a2,4(a4)
	li	a3,1
	lw	a0,8(a4)
	beq	a2,a3,.L413
	sw	a5,4(sp)
	sw	a4,0(sp)
.L398:
	li	a2,2
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,0(sp)
	mv	a1,s0
	li	a2,2
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
.L365:
	lw	a5,12(a5)
	bne	a5,zero,.L374
.L399:
	lw	a5,0(s0)
	bge	a5,zero,.L349
	li	a5,1
	sw	a5,0(s0)
	j	.L349
.L410:
	beq	a4,zero,.L414
	lbu	a2,4(a4)
	lw	a0,8(a4)
	beq	a2,a3,.L415
	li	a2,2
	mv	a1,s0
	sw	a5,4(sp)
	sw	a4,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,0(sp)
	mv	a1,s0
	li	a2,2
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
.L380:
	lw	a5,12(a5)
	beq	a5,zero,.L399
.L381:
	lbu	a2,4(a5)
	li	a4,1
	lw	a0,8(a5)
	beq	a2,a4,.L416
	mv	a1,s0
	li	a2,2
	sw	a5,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,0(sp)
	mv	a1,s0
	li	a2,2
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive
	j	.L349
.L404:
	sw	a5,4(sp)
	sw	a4,0(sp)
	mv	a0,a6
	j	.L398
.L409:
	li	a4,2
	sw	a4,0(s0)
	j	.L356
.L406:
	li	a2,3
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a6,0(sp)
	mv	a1,s0
	li	a2,3
	lw	a0,12(a6)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	lw	a5,8(sp)
	j	.L371
.L411:
	lw	a3,0(a1)
	bge	a3,zero,.L359
	sw	a7,0(a1)
.L359:
	lw	a4,12(a4)
	bne	a4,zero,.L362
	j	.L356
.L414:
	lw	a4,0(s0)
	bge	a4,zero,.L378
	sw	a3,0(s0)
.L378:
	lw	a5,12(a5)
	bne	a5,zero,.L381
	j	.L349
.L405:
	lw	a3,0(s0)
	bge	a3,zero,.L369
	li	a3,3
	sw	a3,0(s0)
.L369:
	lw	a4,12(a4)
	bne	a4,zero,.L372
	j	.L356
.L415:
	mv	a1,s0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,8(sp)
	j	.L380
.L416:
	mv	a1,s0
	sw	a5,4(sp)
	sw	a2,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive
	j	.L349
.L413:
	mv	a1,s0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,8(sp)
	j	.L365
.L412:
	sw	a5,12(sp)
	sw	a4,8(sp)
	sw	a6,4(sp)
	sw	a2,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a6,4(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a6)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,8(sp)
	lw	a5,12(sp)
	j	.L361
.L408:
	li	a2,3
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,0(sp)
	mv	a1,s0
	li	a2,3
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	j	.L365
.L407:
	lw	a4,0(s0)
	bge	a4,zero,.L356
	li	a4,3
	sw	a4,0(s0)
	j	.L356
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
	mv	a3,a0
	blt	a4,zero,.L420
	bne	a4,zero,.L421
	bleu	a5,a1,.L421
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
	call	sglib___rbtree_add_recursive.constprop.0
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
	jr	ra
.L577:
	li	a5,1
	sb	a5,4(a1)
	sw	a1,0(a0)
	ret
.L578:
	li	a4,1
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
	li	a6,1
	beq	a0,a6,.L583
.L451:
	li	a2,1
	bne	a1,a2,.L417
	lw	a0,8(a4)
	lw	a2,12(a4)
	beq	a0,zero,.L455
	lbu	a6,4(a0)
	beq	a6,a1,.L584
.L455:
	beq	a2,zero,.L417
	lbu	a1,4(a2)
	li	a0,1
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
	j	.L417
.L421:
	addi	a0,a5,12
	sw	a3,4(sp)
	sw	a5,0(sp)
	call	sglib___rbtree_add_recursive.constprop.0
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
	li	a6,1
	beq	a0,a6,.L585
.L456:
	li	a2,1
	bne	a1,a2,.L417
	lw	a0,12(a4)
	lw	a2,8(a4)
	beq	a0,zero,.L459
	lbu	a6,4(a0)
	beq	a6,a1,.L586
.L459:
	beq	a2,zero,.L417
	lbu	a1,4(a2)
	li	a0,1
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
	j	.L417
.L579:
	li	a2,1
	sb	a2,4(a1)
	sw	a1,8(a4)
	j	.L427
.L425:
	addi	a0,a4,12
	sw	a3,8(sp)
	sw	a5,4(sp)
	sw	a4,0(sp)
	call	sglib___rbtree_add_recursive.constprop.0
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
	li	a7,1
	beq	a6,a7,.L587
.L446:
	li	a1,1
	bne	a0,a1,.L423
	lw	a6,12(a2)
	lw	a1,8(a2)
	beq	a6,zero,.L449
	lbu	a7,4(a6)
	beq	a7,a0,.L588
.L449:
	beq	a1,zero,.L423
	lbu	a0,4(a1)
	li	a6,1
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
	j	.L423
.L581:
	lw	a4,8(a5)
	lw	a2,8(a4)
	lw	a1,12(a4)
	lbu	a0,4(a2)
	beq	a1,zero,.L441
	lbu	a6,4(a1)
	li	a7,1
	beq	a6,a7,.L589
.L441:
	li	a1,1
	bne	a0,a1,.L423
	lw	a6,8(a2)
	lw	a1,12(a2)
	beq	a6,zero,.L445
	lbu	a7,4(a6)
	beq	a7,a0,.L590
.L445:
	beq	a1,zero,.L423
	lbu	a0,4(a1)
	li	a6,1
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
	j	.L423
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
	li	a0,1
	bne	a6,a0,.L423
.L448:
	sb	zero,4(a2)
	sb	zero,4(a1)
	li	a2,1
	sb	a2,4(a4)
	j	.L423
.L584:
	sw	a2,8(a5)
	sw	a0,8(a4)
	sw	a5,12(a4)
	sb	a1,4(a5)
	sb	zero,4(a4)
	sw	a4,0(a3)
	j	.L417
.L590:
	sw	a1,8(a4)
	sw	a6,8(a2)
	sw	a4,12(a2)
	sb	a0,4(a4)
	sb	zero,4(a2)
	sw	a2,8(a5)
	j	.L423
.L586:
	sw	a2,12(a5)
	sw	a0,12(a4)
	sw	a5,8(a4)
	sb	a1,4(a5)
	sb	zero,4(a4)
	sw	a4,0(a3)
	j	.L417
.L588:
	sw	a1,12(a4)
	sw	a6,12(a2)
	sw	a4,8(a2)
	sb	a0,4(a4)
	sb	zero,4(a2)
	sw	a2,8(a5)
	j	.L423
.L580:
	lw	a2,8(a4)
	lw	a1,8(a2)
	lw	a0,12(a2)
	lbu	a6,4(a1)
	beq	a0,zero,.L431
	lbu	a7,4(a0)
	li	t1,1
	beq	a7,t1,.L591
.L431:
	li	a0,1
	bne	a6,a0,.L427
	lw	a7,8(a1)
	lw	a0,12(a1)
	beq	a7,zero,.L435
	lbu	t1,4(a7)
	beq	t1,a6,.L592
.L435:
	beq	a0,zero,.L427
	lbu	a6,4(a0)
	li	a7,1
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
	j	.L427
.L592:
	sw	a0,8(a2)
	sw	a7,8(a1)
	sw	a2,12(a1)
	sb	a6,4(a2)
	sb	zero,4(a1)
	sw	a1,8(a4)
	j	.L427
.L429:
	addi	a0,a6,12
	sw	a3,12(sp)
	sw	a4,8(sp)
	sw	a5,4(sp)
	sw	a6,0(sp)
	call	sglib___rbtree_add_recursive.constprop.0
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
	li	t1,1
	beq	a7,t1,.L593
.L436:
	li	a0,1
	bne	a6,a0,.L427
	lw	a7,12(a1)
	lw	a0,8(a1)
	beq	a7,zero,.L439
	lbu	t1,4(a7)
	beq	t1,a6,.L594
.L439:
	beq	a0,zero,.L427
	lbu	a6,4(a0)
	li	a7,1
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
	j	.L427
.L594:
	sw	a0,12(a2)
	sw	a7,12(a1)
	sw	a2,8(a1)
	sb	a6,4(a2)
	sb	zero,4(a1)
	sw	a1,8(a4)
	j	.L427
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
	li	a3,1
	bne	a1,a3,.L417
.L458:
	sb	zero,4(a4)
	sb	zero,4(a2)
	li	a4,1
	sb	a4,4(a5)
	j	.L417
.L585:
	bne	a1,a0,.L417
	lw	a3,12(a4)
	beq	a3,zero,.L457
	lbu	a3,4(a3)
	beq	a3,a1,.L458
.L457:
	lw	a3,8(a4)
	bne	a3,zero,.L576
	j	.L417
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
	li	a6,1
	bne	a7,a6,.L427
.L438:
	sb	zero,4(a1)
	sb	zero,4(a0)
	li	a1,1
	sb	a1,4(a2)
	j	.L427
.L587:
	bne	a0,a6,.L423
	lw	a6,12(a2)
	beq	a6,zero,.L447
	lbu	a6,4(a6)
	beq	a6,a0,.L448
.L447:
	lw	a0,8(a2)
	bne	a0,zero,.L574
	j	.L423
.L593:
	bne	a6,a7,.L427
	lw	a7,12(a1)
	beq	a7,zero,.L437
	lbu	a7,4(a7)
	beq	a7,a6,.L438
.L437:
	lw	a6,8(a1)
	bne	a6,zero,.L572
	j	.L427
	.size	sglib___rbtree_add_recursive.constprop.0, .-sglib___rbtree_add_recursive.constprop.0
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
	.globl	sglib_dllist_add
	.type	sglib_dllist_add, @function
sglib_dllist_add:
	lw	a5,0(a0)
	beq	a5,zero,.L604
	lw	a4,8(a5)
	sw	a5,4(a1)
	sw	a4,8(a1)
	lw	a5,0(a0)
	sw	a1,8(a5)
	lw	a5,8(a1)
	beq	a5,zero,.L598
	sw	a1,4(a5)
.L598:
	ret
.L604:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	ret
	.size	sglib_dllist_add, .-sglib_dllist_add
	.align	2
	.globl	sglib_dllist_add_after
	.type	sglib_dllist_add_after, @function
sglib_dllist_add_after:
	lw	a5,0(a0)
	beq	a5,zero,.L611
	lw	a5,4(a5)
	sw	a5,4(a1)
	lw	a5,0(a0)
	sw	a5,8(a1)
	sw	a1,4(a5)
	lw	a5,4(a1)
	beq	a5,zero,.L605
	sw	a1,8(a5)
.L605:
	ret
.L611:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	ret
	.size	sglib_dllist_add_after, .-sglib_dllist_add_after
	.align	2
	.globl	sglib_dllist_add_before
	.type	sglib_dllist_add_before, @function
sglib_dllist_add_before:
	lw	a5,0(a0)
	beq	a5,zero,.L618
	lw	a4,8(a5)
	sw	a5,4(a1)
	sw	a4,8(a1)
	lw	a5,0(a0)
	sw	a1,8(a5)
	lw	a5,8(a1)
	beq	a5,zero,.L612
	sw	a1,4(a5)
.L612:
	ret
.L618:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	ret
	.size	sglib_dllist_add_before, .-sglib_dllist_add_before
	.align	2
	.globl	sglib_dllist_add_if_not_member
	.type	sglib_dllist_add_if_not_member, @function
sglib_dllist_add_if_not_member:
	lw	a6,0(a0)
	beq	a6,zero,.L620
	lw	a3,0(a1)
	mv	a5,a6
	j	.L621
.L623:
	lw	a5,8(a5)
	beq	a5,zero,.L622
.L621:
	lw	a4,0(a5)
	bne	a4,a3,.L623
	sw	a5,0(a2)
	li	a0,0
	ret
.L622:
	lw	a5,4(a6)
	bne	a5,zero,.L631
	j	.L620
.L625:
	lw	a5,4(a5)
	beq	a5,zero,.L620
.L631:
	lw	a4,0(a5)
	bne	a3,a4,.L625
	sw	a5,0(a2)
	li	a0,0
	ret
.L620:
	sw	zero,0(a2)
	lw	a5,0(a0)
	beq	a5,zero,.L642
	lw	a4,8(a5)
	sw	a5,4(a1)
	sw	a4,8(a1)
	lw	a5,0(a0)
	sw	a1,8(a5)
	lw	a5,8(a1)
	beq	a5,zero,.L641
	sw	a1,4(a5)
.L641:
	lw	a0,0(a2)
	seqz	a0,a0
	ret
.L642:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	lw	a0,0(a2)
	seqz	a0,a0
	ret
	.size	sglib_dllist_add_if_not_member, .-sglib_dllist_add_if_not_member
	.align	2
	.globl	sglib_dllist_add_after_if_not_member
	.type	sglib_dllist_add_after_if_not_member, @function
sglib_dllist_add_after_if_not_member:
	lw	a6,0(a0)
	beq	a6,zero,.L644
	lw	a3,0(a1)
	mv	a5,a6
	j	.L645
.L647:
	lw	a5,8(a5)
	beq	a5,zero,.L646
.L645:
	lw	a4,0(a5)
	bne	a4,a3,.L647
	sw	a5,0(a2)
	li	a0,0
	ret
.L646:
	lw	a5,4(a6)
	bne	a5,zero,.L655
	j	.L644
.L649:
	lw	a5,4(a5)
	beq	a5,zero,.L644
.L655:
	lw	a4,0(a5)
	bne	a3,a4,.L649
	sw	a5,0(a2)
	li	a0,0
	ret
.L644:
	sw	zero,0(a2)
	lw	a5,0(a0)
	beq	a5,zero,.L666
	lw	a5,4(a5)
	sw	a5,4(a1)
	lw	a5,0(a0)
	sw	a5,8(a1)
	sw	a1,4(a5)
	lw	a5,4(a1)
	beq	a5,zero,.L665
	sw	a1,8(a5)
.L665:
	lw	a0,0(a2)
	seqz	a0,a0
	ret
.L666:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	lw	a0,0(a2)
	seqz	a0,a0
	ret
	.size	sglib_dllist_add_after_if_not_member, .-sglib_dllist_add_after_if_not_member
	.align	2
	.globl	sglib_dllist_add_before_if_not_member
	.type	sglib_dllist_add_before_if_not_member, @function
sglib_dllist_add_before_if_not_member:
	lw	a6,0(a0)
	beq	a6,zero,.L668
	lw	a3,0(a1)
	mv	a5,a6
	j	.L669
.L671:
	lw	a5,8(a5)
	beq	a5,zero,.L670
.L669:
	lw	a4,0(a5)
	bne	a4,a3,.L671
	sw	a5,0(a2)
	li	a0,0
	ret
.L670:
	lw	a5,4(a6)
	bne	a5,zero,.L679
	j	.L668
.L673:
	lw	a5,4(a5)
	beq	a5,zero,.L668
.L679:
	lw	a4,0(a5)
	bne	a3,a4,.L673
	sw	a5,0(a2)
	li	a0,0
	ret
.L668:
	sw	zero,0(a2)
	lw	a5,0(a0)
	beq	a5,zero,.L690
	lw	a4,8(a5)
	sw	a5,4(a1)
	sw	a4,8(a1)
	lw	a5,0(a0)
	sw	a1,8(a5)
	lw	a5,8(a1)
	beq	a5,zero,.L689
	sw	a1,4(a5)
.L689:
	lw	a0,0(a2)
	seqz	a0,a0
	ret
.L690:
	sw	a1,0(a0)
	sw	zero,8(a1)
	lw	a5,0(a0)
	sw	zero,4(a5)
	lw	a0,0(a2)
	seqz	a0,a0
	ret
	.size	sglib_dllist_add_before_if_not_member, .-sglib_dllist_add_before_if_not_member
	.align	2
	.globl	sglib_dllist_concat
	.type	sglib_dllist_concat, @function
sglib_dllist_concat:
	lw	a5,0(a0)
	beq	a5,zero,.L701
	beq	a1,zero,.L691
.L694:
	mv	a4,a5
	lw	a5,4(a5)
	bne	a5,zero,.L694
	sw	zero,4(a1)
	sw	a4,8(a1)
	sw	a1,4(a4)
	lw	a5,4(a1)
	beq	a5,zero,.L691
	sw	a1,8(a5)
.L691:
	ret
.L701:
	sw	a1,0(a0)
	ret
	.size	sglib_dllist_concat, .-sglib_dllist_concat
	.align	2
	.globl	sglib_dllist_delete
	.type	sglib_dllist_delete, @function
sglib_dllist_delete:
	lw	a3,0(a0)
	lw	a5,8(a1)
	lw	a4,4(a1)
	beq	a3,a1,.L719
	beq	a4,zero,.L707
.L705:
	sw	a5,8(a4)
	lw	a5,8(a1)
.L707:
	beq	a5,zero,.L706
.L708:
	sw	a4,4(a5)
.L706:
	sw	a3,0(a0)
	ret
.L719:
	beq	a5,zero,.L720
	mv	a3,a5
	beq	a4,zero,.L708
	sw	a5,8(a4)
	lw	a5,8(a1)
	j	.L707
.L720:
	mv	a3,a4
	bne	a4,zero,.L705
	j	.L706
	.size	sglib_dllist_delete, .-sglib_dllist_delete
	.align	2
	.globl	sglib_dllist_delete_if_member
	.type	sglib_dllist_delete_if_member, @function
sglib_dllist_delete_if_member:
	lw	a6,0(a0)
	beq	a6,zero,.L728
	lw	a3,0(a1)
	mv	a5,a6
	j	.L723
.L726:
	lw	a5,8(a5)
	beq	a5,zero,.L725
.L723:
	lw	a4,0(a5)
	bne	a4,a3,.L726
.L727:
	sw	a5,0(a2)
	lw	a1,0(a0)
	lw	a4,8(a5)
	lw	a3,4(a5)
	beq	a1,a5,.L751
	beq	a3,zero,.L734
.L732:
	sw	a4,8(a3)
	lw	a4,8(a5)
.L734:
	beq	a4,zero,.L733
.L735:
	sw	a3,4(a4)
.L733:
	sw	a1,0(a0)
	lw	a0,0(a2)
	snez	a0,a0
	ret
.L751:
	beq	a4,zero,.L752
	mv	a1,a4
	beq	a3,zero,.L735
	sw	a4,8(a3)
	lw	a4,8(a5)
	j	.L734
.L725:
	lw	a5,4(a6)
	bne	a5,zero,.L737
	j	.L728
.L729:
	lw	a5,4(a5)
	beq	a5,zero,.L728
.L737:
	lw	a4,0(a5)
	bne	a3,a4,.L729
	j	.L727
.L752:
	mv	a1,a3
	bne	a3,zero,.L732
	j	.L733
.L728:
	sw	zero,0(a2)
	li	a0,0
	ret
	.size	sglib_dllist_delete_if_member, .-sglib_dllist_delete_if_member
	.align	2
	.globl	sglib_dllist_is_member
	.type	sglib_dllist_is_member, @function
sglib_dllist_is_member:
	mv	a5,a0
	beq	a0,a1,.L763
	beq	a0,zero,.L763
.L755:
	lw	a5,8(a5)
	snez	a4,a5
	beq	a1,a5,.L754
	bne	a4,zero,.L755
.L754:
	bne	a5,zero,.L764
	beq	a0,zero,.L764
	lw	a5,4(a0)
	snez	a0,a5
	beq	a1,a5,.L753
.L788:
	beq	a0,zero,.L753
	lw	a5,4(a5)
	snez	a0,a5
	bne	a1,a5,.L788
.L753:
	ret
.L764:
	mv	a0,a4
	ret
.L763:
	snez	a4,a0
	j	.L754
	.size	sglib_dllist_is_member, .-sglib_dllist_is_member
	.align	2
	.globl	sglib_dllist_find_member
	.type	sglib_dllist_find_member, @function
sglib_dllist_find_member:
	beq	a0,zero,.L796
	lw	a3,0(a1)
	mv	a5,a0
	j	.L791
.L793:
	lw	a5,8(a5)
	beq	a5,zero,.L792
.L791:
	lw	a4,0(a5)
	bne	a4,a3,.L793
.L789:
	mv	a0,a5
	ret
.L792:
	lw	a5,4(a0)
	beq	a5,zero,.L789
	lw	a4,0(a5)
	beq	a3,a4,.L789
.L794:
	lw	a5,4(a5)
	beq	a5,zero,.L789
	lw	a4,0(a5)
	bne	a3,a4,.L794
	mv	a0,a5
	ret
.L796:
	li	a5,0
	j	.L789
	.size	sglib_dllist_find_member, .-sglib_dllist_find_member
	.align	2
	.globl	sglib_dllist_get_first
	.type	sglib_dllist_get_first, @function
sglib_dllist_get_first:
	mv	a5,a0
	beq	a0,zero,.L805
.L804:
	mv	a0,a5
	lw	a5,8(a5)
	bne	a5,zero,.L804
	ret
.L805:
	li	a0,0
	ret
	.size	sglib_dllist_get_first, .-sglib_dllist_get_first
	.align	2
	.globl	sglib_dllist_get_last
	.type	sglib_dllist_get_last, @function
sglib_dllist_get_last:
	mv	a5,a0
	beq	a0,zero,.L810
.L809:
	mv	a0,a5
	lw	a5,4(a5)
	bne	a5,zero,.L809
	ret
.L810:
	li	a0,0
	ret
	.size	sglib_dllist_get_last, .-sglib_dllist_get_last
	.align	2
	.globl	sglib_dllist_sort
	.type	sglib_dllist_sort, @function
sglib_dllist_sort:
	lw	a5,0(a0)
	beq	a5,zero,.L872
	addi	sp,sp,-16
.L814:
	mv	a1,a5
	lw	a5,8(a5)
	bne	a5,zero,.L814
	li	a6,1
	mv	t3,a6
.L836:
	sw	zero,12(sp)
	li	t1,0
	addi	a3,sp,12
.L815:
	mv	a4,a1
	li	a2,1
	ble	a6,t3,.L875
.L816:
	lw	a4,4(a4)
	addi	a2,a2,1
	slt	a5,a2,a6
	snez	a7,a4
	and	a5,a5,a7
	bne	a5,zero,.L816
	beq	a4,zero,.L876
	lw	a5,4(a4)
	sw	zero,4(a4)
	beq	a5,zero,.L843
	mv	a4,a5
	li	a2,1
.L821:
	addi	a2,a2,1
	lw	a4,4(a4)
	bge	a2,a6,.L823
	bne	a4,zero,.L821
.L823:
	li	a7,0
	beq	a4,zero,.L825
	lw	a7,4(a4)
	sw	zero,4(a4)
.L825:
	lw	a2,0(a1)
.L874:
	lw	a4,0(a5)
.L831:
	blt	a2,a4,.L877
	sw	a5,0(a3)
	addi	a3,a5,4
	lw	a5,4(a5)
	bne	a5,zero,.L874
.L826:
	sw	a1,0(a3)
	mv	a5,a1
	mv	a1,a7
.L832:
	mv	a3,a5
	lw	a5,4(a5)
	bne	a5,zero,.L832
	addi	a3,a3,4
	li	t1,1
	bne	a7,zero,.L815
	lw	a1,12(sp)
	slli	a6,a6,1
	bne	a1,zero,.L836
.L835:
	sw	a1,0(a0)
	addi	sp,sp,16
	jr	ra
.L877:
	sw	a1,0(a3)
	lw	a2,4(a1)
	addi	a3,a1,4
	beq	a2,zero,.L878
	mv	a1,a2
	lw	a2,0(a2)
	j	.L831
.L878:
	sw	a5,4(a1)
	mv	a1,a7
	j	.L832
.L875:
	lw	a4,4(a1)
	sw	zero,4(a1)
	mv	a5,a4
	beq	a4,zero,.L879
	lw	a7,4(a4)
	sw	zero,4(a4)
	beq	a4,zero,.L826
	lw	a2,0(a1)
	j	.L874
.L876:
	sw	a1,0(a3)
	lw	a1,12(sp)
	beq	t1,zero,.L880
	slli	a6,a6,1
	bne	a1,zero,.L836
	j	.L835
.L879:
	bne	a4,zero,.L881
.L843:
	li	a7,0
	j	.L826
.L880:
	beq	a1,zero,.L835
	mv	a5,a1
.L839:
	sw	a4,8(a5)
	mv	a4,a5
	lw	a5,4(a5)
	bne	a5,zero,.L839
	sw	a1,0(a0)
	addi	sp,sp,16
	jr	ra
.L872:
	ret
.L881:
	lw	a2,0(a1)
	li	a7,0
	j	.L874
	.size	sglib_dllist_sort, .-sglib_dllist_sort
	.align	2
	.globl	sglib_dllist_len
	.type	sglib_dllist_len, @function
sglib_dllist_len:
	li	a4,0
	beq	a0,zero,.L882
	mv	a5,a0
	li	a4,0
.L884:
	lw	a5,8(a5)
	addi	a4,a4,1
	bne	a5,zero,.L884
	lw	a5,4(a0)
	beq	a5,zero,.L882
	li	a3,0
.L886:
	lw	a5,4(a5)
	addi	a3,a3,1
	bne	a5,zero,.L886
	add	a4,a4,a3
.L882:
	mv	a0,a4
	ret
	.size	sglib_dllist_len, .-sglib_dllist_len
	.align	2
	.globl	sglib_dllist_reverse
	.type	sglib_dllist_reverse, @function
sglib_dllist_reverse:
	lw	a3,0(a0)
	beq	a3,zero,.L893
	lw	a4,4(a3)
	lw	a5,8(a3)
	sw	a4,8(a3)
	sw	a5,4(a3)
	beq	a5,zero,.L907
.L896:
	lw	a2,4(a5)
	mv	a3,a5
	lw	a5,8(a5)
	sw	a2,8(a3)
	sw	a5,4(a3)
	bne	a5,zero,.L896
.L907:
	beq	a4,zero,.L893
.L898:
	lw	a3,8(a4)
	mv	a5,a4
	lw	a4,4(a4)
	sw	a3,4(a5)
	sw	a4,8(a5)
	bne	a4,zero,.L898
.L893:
	ret
	.size	sglib_dllist_reverse, .-sglib_dllist_reverse
	.align	2
	.globl	sglib_dllist_it_current
	.type	sglib_dllist_it_current, @function
sglib_dllist_it_current:
	lw	a0,0(a0)
	ret
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
	mv	s2,a0
	beq	s1,zero,.L910
	sw	s3,12(sp)
	beq	s0,zero,.L936
	lw	s3,16(a0)
	j	.L913
.L915:
	lw	s0,8(s0)
	beq	s0,zero,.L914
.L913:
	mv	a1,s0
	mv	a0,s3
	jalr	s1
	bne	a0,zero,.L915
	lw	s3,12(sp)
.L923:
	lw	a5,8(s0)
	sw	a5,4(s2)
.L916:
	sw	s0,0(s2)
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	jr	ra
.L910:
	bne	s0,zero,.L923
	lw	s0,8(s2)
	sw	zero,8(s2)
	bne	s0,zero,.L920
	j	.L916
.L914:
	lw	s1,12(s2)
	lw	s0,8(s2)
	sw	zero,8(s2)
	beq	s1,zero,.L937
	beq	s0,zero,.L935
.L938:
	lw	s3,16(s2)
	j	.L917
.L919:
	lw	s0,4(s0)
	beq	s0,zero,.L935
.L917:
	mv	a1,s3
	mv	a0,s0
	jalr	s1
	bne	a0,zero,.L919
	lw	s3,12(sp)
.L920:
	lw	a5,4(s0)
	lw	ra,28(sp)
	sw	s0,0(s2)
	mv	a0,s0
	lw	s0,24(sp)
	sw	a5,8(s2)
	lw	s1,20(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	jr	ra
.L937:
	lw	s3,12(sp)
	bne	s0,zero,.L920
	j	.L916
.L935:
	lw	s3,12(sp)
	lw	ra,28(sp)
	sw	s0,0(s2)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	jr	ra
.L936:
	lw	s0,8(a0)
	sw	zero,8(a0)
	bne	s0,zero,.L938
	j	.L935
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
	beq	a1,zero,.L940
	lw	a5,4(a1)
	sw	a5,8(a0)
.L940:
	call	sglib_dllist_it_next
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
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
	beq	a1,zero,.L946
	lw	a5,4(a1)
	sw	a5,8(a0)
.L946:
	call	sglib_dllist_it_next
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	sglib_dllist_it_init, .-sglib_dllist_it_init
	.align	2
	.globl	ilist_hash_function
	.type	ilist_hash_function, @function
ilist_hash_function:
	lw	a0,0(a0)
	ret
	.size	ilist_hash_function, .-ilist_hash_function
	.align	2
	.globl	sglib_ilist_is_member
	.type	sglib_ilist_is_member, @function
sglib_ilist_is_member:
	mv	a5,a0
	snez	a0,a0
	beq	a5,a1,.L953
.L966:
	beq	a0,zero,.L953
	lw	a5,4(a5)
	snez	a0,a5
	bne	a1,a5,.L966
.L953:
	ret
	.size	sglib_ilist_is_member, .-sglib_ilist_is_member
	.align	2
	.globl	sglib_ilist_find_member
	.type	sglib_ilist_find_member, @function
sglib_ilist_find_member:
	beq	a0,zero,.L967
	lw	a4,0(a1)
	j	.L969
.L970:
	lw	a0,4(a0)
	beq	a0,zero,.L967
.L969:
	lw	a5,0(a0)
	bne	a5,a4,.L970
.L967:
	ret
	.size	sglib_ilist_find_member, .-sglib_ilist_find_member
	.align	2
	.globl	sglib_ilist_add_if_not_member
	.type	sglib_ilist_add_if_not_member, @function
sglib_ilist_add_if_not_member:
	lw	a5,0(a0)
	beq	a5,zero,.L976
	lw	a3,0(a1)
	j	.L977
.L978:
	lw	a5,4(a5)
	beq	a5,zero,.L976
.L977:
	lw	a4,0(a5)
	bne	a4,a3,.L978
	sw	a5,0(a2)
	li	a0,0
	ret
.L976:
	sw	zero,0(a2)
	lw	a5,0(a0)
	sw	a5,4(a1)
	sw	a1,0(a0)
	lw	a0,0(a2)
	seqz	a0,a0
	ret
	.size	sglib_ilist_add_if_not_member, .-sglib_ilist_add_if_not_member
	.align	2
	.globl	sglib_ilist_add
	.type	sglib_ilist_add, @function
sglib_ilist_add:
	lw	a5,0(a0)
	sw	a5,4(a1)
	sw	a1,0(a0)
	ret
	.size	sglib_ilist_add, .-sglib_ilist_add
	.align	2
	.globl	sglib_ilist_concat
	.type	sglib_ilist_concat, @function
sglib_ilist_concat:
	lw	a5,0(a0)
	beq	a5,zero,.L994
.L990:
	mv	a4,a5
	lw	a5,4(a5)
	bne	a5,zero,.L990
	sw	a1,4(a4)
	ret
.L994:
	sw	a1,0(a0)
	ret
	.size	sglib_ilist_concat, .-sglib_ilist_concat
	.align	2
	.globl	sglib_ilist_delete
	.type	sglib_ilist_delete, @function
sglib_ilist_delete:
	lw	a5,0(a0)
	beq	a5,zero,.L997
.L996:
	beq	a1,a5,.L1004
	addi	a0,a5,4
	lw	a5,4(a5)
	bne	a5,zero,.L996
.L997:
	lw	a5,4(zero)
	ebreak
.L1004:
	lw	a5,4(a1)
	sw	a5,0(a0)
	ret
	.size	sglib_ilist_delete, .-sglib_ilist_delete
	.align	2
	.globl	sglib_ilist_delete_if_member
	.type	sglib_ilist_delete_if_member, @function
sglib_ilist_delete_if_member:
	lw	a5,0(a0)
	beq	a5,zero,.L1009
	lw	a3,0(a1)
	j	.L1007
.L1010:
	addi	a0,a5,4
	lw	a5,4(a5)
	beq	a5,zero,.L1009
.L1007:
	lw	a4,0(a5)
	bne	a4,a3,.L1010
	sw	a5,0(a2)
	lw	a5,4(a5)
	sw	a5,0(a0)
	lw	a0,0(a2)
	snez	a0,a0
	ret
.L1009:
	sw	zero,0(a2)
	li	a0,0
	ret
	.size	sglib_ilist_delete_if_member, .-sglib_ilist_delete_if_member
	.align	2
	.globl	sglib_ilist_sort
	.type	sglib_ilist_sort, @function
sglib_ilist_sort:
	lw	a1,0(a0)
	li	a6,1
	addi	sp,sp,-16
	mv	t3,a6
.L1035:
	sw	zero,12(sp)
	beq	a1,zero,.L1016
.L1038:
	li	t1,0
	addi	a3,sp,12
.L1015:
	mv	a4,a1
	li	a2,1
	ble	a6,t3,.L1061
.L1017:
	lw	a4,4(a4)
	addi	a2,a2,1
	slt	a5,a2,a6
	snez	a7,a4
	and	a5,a5,a7
	bne	a5,zero,.L1017
	beq	a4,zero,.L1062
	lw	a5,4(a4)
	sw	zero,4(a4)
	beq	a5,zero,.L1040
	mv	a4,a5
	li	a2,1
.L1021:
	addi	a2,a2,1
	lw	a4,4(a4)
	bge	a2,a6,.L1023
	bne	a4,zero,.L1021
.L1023:
	li	a7,0
	beq	a4,zero,.L1025
	lw	a7,4(a4)
	sw	zero,4(a4)
.L1025:
	lw	a2,0(a1)
.L1060:
	lw	a4,0(a5)
.L1031:
	blt	a2,a4,.L1063
	sw	a5,0(a3)
	addi	a3,a5,4
	lw	a5,4(a5)
	bne	a5,zero,.L1060
.L1026:
	sw	a1,0(a3)
	mv	a5,a1
	mv	a1,a7
.L1032:
	mv	a3,a5
	lw	a5,4(a5)
	bne	a5,zero,.L1032
	addi	a3,a3,4
	li	t1,1
	bne	a7,zero,.L1015
	lw	a1,12(sp)
	sw	zero,12(sp)
	slli	a6,a6,1
	bne	a1,zero,.L1038
.L1016:
	sw	a1,0(a0)
	addi	sp,sp,16
	jr	ra
.L1063:
	sw	a1,0(a3)
	lw	a2,4(a1)
	addi	a3,a1,4
	beq	a2,zero,.L1064
	mv	a1,a2
	lw	a2,0(a2)
	j	.L1031
.L1064:
	sw	a5,4(a1)
	mv	a1,a7
	j	.L1032
.L1061:
	lw	a4,4(a1)
	sw	zero,4(a1)
	mv	a5,a4
	beq	a4,zero,.L1065
	lw	a7,4(a4)
	sw	zero,4(a4)
	beq	a4,zero,.L1026
	lw	a2,0(a1)
	j	.L1060
.L1062:
	sw	a1,0(a3)
	lw	a1,12(sp)
	beq	t1,zero,.L1016
	slli	a6,a6,1
	j	.L1035
.L1065:
	bne	a4,zero,.L1066
.L1040:
	li	a7,0
	j	.L1026
.L1066:
	lw	a2,0(a1)
	li	a7,0
	j	.L1060
	.size	sglib_ilist_sort, .-sglib_ilist_sort
	.align	2
	.globl	sglib_ilist_len
	.type	sglib_ilist_len, @function
sglib_ilist_len:
	mv	a5,a0
	li	a0,0
	beq	a5,zero,.L1070
.L1069:
	lw	a5,4(a5)
	addi	a0,a0,1
	bne	a5,zero,.L1069
	ret
.L1070:
	ret
	.size	sglib_ilist_len, .-sglib_ilist_len
	.align	2
	.globl	sglib_ilist_reverse
	.type	sglib_ilist_reverse, @function
sglib_ilist_reverse:
	lw	a5,0(a0)
	beq	a5,zero,.L1073
	li	a3,0
	j	.L1074
.L1075:
	mv	a5,a4
.L1074:
	lw	a4,4(a5)
	sw	a3,4(a5)
	mv	a3,a5
	bne	a4,zero,.L1075
.L1073:
	sw	a5,0(a0)
	ret
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
	mv	s3,a0
	mv	s0,a1
	beq	a2,zero,.L1080
	sw	s1,20(sp)
	sw	s2,16(sp)
	mv	s1,a2
	mv	s2,a3
	bne	a1,zero,.L1081
	j	.L1092
.L1084:
	lw	s0,4(s0)
	beq	s0,zero,.L1083
.L1081:
	mv	a1,s2
	mv	a0,s0
	jalr	s1
	bne	a0,zero,.L1084
	lw	s1,20(sp)
	lw	s2,16(sp)
	sw	s0,0(s3)
.L1086:
	lw	a5,4(s0)
	sw	a5,4(s3)
.L1087:
	mv	a0,s0
.L1079:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
.L1080:
	sw	a1,0(a0)
	bne	a1,zero,.L1086
	li	s0,0
	j	.L1087
.L1083:
	lw	s1,20(sp)
	lw	s2,16(sp)
	sw	zero,0(s3)
	li	s0,0
	j	.L1087
.L1092:
	sw	zero,0(a0)
	lw	s1,20(sp)
	lw	s2,16(sp)
	li	a0,0
	j	.L1079
	.size	sglib_ilist_it_init_on_equal, .-sglib_ilist_it_init_on_equal
	.align	2
	.globl	sglib_ilist_it_init
	.type	sglib_ilist_it_init, @function
sglib_ilist_it_init:
	sw	zero,8(a0)
	sw	zero,12(a0)
	sw	zero,4(a0)
	sw	a1,0(a0)
	beq	a1,zero,.L1094
	lw	a4,4(a1)
	sw	a4,4(a0)
.L1094:
	mv	a0,a1
	ret
	.size	sglib_ilist_it_init, .-sglib_ilist_it_init
	.align	2
	.globl	sglib_ilist_it_current
	.type	sglib_ilist_it_current, @function
sglib_ilist_it_current:
	lw	a0,0(a0)
	ret
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
	mv	s3,a0
	beq	s1,zero,.L1100
	beq	s0,zero,.L1101
	sw	s2,16(sp)
	lw	s2,12(a0)
	j	.L1102
.L1105:
	lw	s0,4(s0)
	beq	s0,zero,.L1104
.L1102:
	mv	a1,s2
	mv	a0,s0
	jalr	s1
	bne	a0,zero,.L1105
	lw	s2,16(sp)
	sw	s0,0(s3)
.L1107:
	lw	a5,4(s0)
	sw	a5,4(s3)
.L1099:
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
.L1100:
	sw	s0,0(a0)
	bne	s0,zero,.L1107
	li	s0,0
.L1112:
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
.L1104:
	lw	s2,16(sp)
	sw	zero,0(s3)
	li	s0,0
	j	.L1112
.L1101:
	sw	zero,0(a0)
	j	.L1099
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
	ret
	.size	sglib_hashed_ilist_init, .-sglib_hashed_ilist_init
	.align	2
	.globl	sglib_hashed_ilist_add
	.type	sglib_hashed_ilist_add, @function
sglib_hashed_ilist_add:
	lw	a4,0(a1)
	li	a5,-858992640
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
	ret
	.size	sglib_hashed_ilist_add, .-sglib_hashed_ilist_add
	.align	2
	.globl	sglib_hashed_ilist_add_if_not_member
	.type	sglib_hashed_ilist_add_if_not_member, @function
sglib_hashed_ilist_add_if_not_member:
	lw	a3,0(a1)
	li	a4,-858992640
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
	bne	a5,zero,.L1118
	j	.L1119
.L1120:
	lw	a5,4(a5)
	beq	a5,zero,.L1119
.L1118:
	lw	a4,0(a5)
	bne	a4,a3,.L1120
	sw	a5,0(a2)
	li	a0,0
	ret
.L1119:
	sw	zero,0(a2)
	lw	a5,0(a0)
	sw	a5,4(a1)
	sw	a1,0(a0)
	lw	a0,0(a2)
	seqz	a0,a0
	ret
	.size	sglib_hashed_ilist_add_if_not_member, .-sglib_hashed_ilist_add_if_not_member
	.align	2
	.globl	sglib_hashed_ilist_delete
	.type	sglib_hashed_ilist_delete, @function
sglib_hashed_ilist_delete:
	lw	a4,0(a1)
	li	a5,-858992640
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
	beq	a5,zero,.L1130
.L1129:
	beq	a1,a5,.L1137
	addi	a0,a5,4
	lw	a5,4(a5)
	bne	a5,zero,.L1129
.L1130:
	lw	a5,4(zero)
	ebreak
.L1137:
	lw	a5,4(a1)
	sw	a5,0(a0)
	ret
	.size	sglib_hashed_ilist_delete, .-sglib_hashed_ilist_delete
	.align	2
	.globl	sglib_hashed_ilist_delete_if_member
	.type	sglib_hashed_ilist_delete_if_member, @function
sglib_hashed_ilist_delete_if_member:
	lw	a3,0(a1)
	li	a4,-858992640
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
	bne	a5,zero,.L1139
	j	.L1141
.L1142:
	addi	a0,a5,4
	lw	a5,4(a5)
	beq	a5,zero,.L1141
.L1139:
	lw	a4,0(a5)
	bne	a4,a3,.L1142
	sw	a5,0(a2)
	lw	a5,4(a5)
	sw	a5,0(a0)
	lw	a0,0(a2)
	snez	a0,a0
	ret
.L1141:
	sw	zero,0(a2)
	li	a0,0
	ret
	.size	sglib_hashed_ilist_delete_if_member, .-sglib_hashed_ilist_delete_if_member
	.align	2
	.globl	sglib_hashed_ilist_is_member
	.type	sglib_hashed_ilist_is_member, @function
sglib_hashed_ilist_is_member:
	lw	a4,0(a1)
	li	a5,-858992640
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
	snez	a0,a5
	beq	a5,a1,.L1148
.L1161:
	beq	a0,zero,.L1148
	lw	a5,4(a5)
	snez	a0,a5
	bne	a1,a5,.L1161
.L1148:
	ret
	.size	sglib_hashed_ilist_is_member, .-sglib_hashed_ilist_is_member
	.align	2
	.globl	sglib_hashed_ilist_find_member
	.type	sglib_hashed_ilist_find_member, @function
sglib_hashed_ilist_find_member:
	lw	a4,0(a1)
	li	a3,-858992640
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
	bne	a0,zero,.L1163
	ret
.L1165:
	lw	a0,4(a0)
	beq	a0,zero,.L1162
.L1163:
	lw	a5,0(a0)
	bne	a5,a4,.L1165
.L1162:
	ret
	.size	sglib_hashed_ilist_find_member, .-sglib_hashed_ilist_find_member
	.align	2
	.globl	sglib_hashed_ilist_it_current
	.type	sglib_hashed_ilist_it_current, @function
sglib_hashed_ilist_it_current:
	lw	a0,0(a0)
	ret
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
	mv	s1,a0
	beq	s2,zero,.L1172
	beq	s0,zero,.L1176
	lw	s3,12(a0)
	j	.L1174
.L1177:
	lw	s0,4(s0)
	beq	s0,zero,.L1176
.L1174:
	mv	a1,s3
	mv	a0,s0
	jalr	s2
	bne	a0,zero,.L1177
	sw	s0,0(s1)
.L1189:
	lw	a5,4(s0)
	sw	a5,4(s1)
.L1171:
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
.L1172:
	sw	s0,0(a0)
	bne	s0,zero,.L1189
	sw	s4,8(sp)
	j	.L1175
.L1176:
	sw	s4,8(sp)
	sw	zero,0(s1)
.L1175:
	lw	a5,20(s1)
	li	s4,19
.L1180:
	addi	a5,a5,1
	sw	a5,20(s1)
	bgt	a5,s4,.L1201
.L1187:
	lw	a4,16(s1)
	lw	s2,24(s1)
	lw	s3,28(s1)
	slli	a3,a5,2
	add	a4,a4,a3
	lw	s0,0(a4)
	sw	zero,4(s1)
	sw	s2,8(s1)
	sw	s3,12(s1)
	beq	s2,zero,.L1181
	bne	s0,zero,.L1182
	j	.L1202
.L1185:
	lw	s0,4(s0)
	beq	s0,zero,.L1184
.L1182:
	mv	a1,s3
	mv	a0,s0
	jalr	s2
	bne	a0,zero,.L1185
	sw	s0,0(s1)
.L1188:
	lw	a5,4(s0)
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	sw	a5,4(s1)
	lw	s4,8(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
.L1181:
	sw	s0,0(s1)
	bne	s0,zero,.L1188
	j	.L1180
.L1184:
	lw	a5,20(s1)
	sw	zero,0(s1)
	addi	a5,a5,1
	sw	a5,20(s1)
	ble	a5,s4,.L1187
.L1201:
	lw	s4,8(sp)
	li	s0,0
	j	.L1171
.L1202:
	sw	zero,0(s1)
	j	.L1180
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
	mv	s2,a0
	beq	a2,zero,.L1204
	sw	s1,20(sp)
	sw	s3,12(sp)
	mv	s1,a2
	mv	s3,a3
	bne	s0,zero,.L1205
	j	.L1207
.L1208:
	lw	s0,4(s0)
	beq	s0,zero,.L1207
.L1205:
	mv	a1,s3
	mv	a0,s0
	jalr	s1
	bne	a0,zero,.L1208
	lw	s1,20(sp)
	lw	s3,12(sp)
	sw	s0,0(s2)
.L1210:
	lw	a5,4(s0)
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	sw	a5,4(s2)
	lw	s2,16(sp)
	addi	sp,sp,32
	jr	ra
.L1204:
	sw	s0,0(a0)
	bne	s0,zero,.L1210
	j	.L1206
.L1207:
	lw	s1,20(sp)
	lw	s3,12(sp)
	sw	zero,0(s2)
.L1206:
	mv	a0,s2
	call	sglib_hashed_ilist_it_next
	mv	s0,a0
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	jr	ra
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
	beq	a5,zero,.L1222
	lw	a4,4(a5)
	sw	a4,4(a0)
	mv	a0,a5
	ret
.L1222:
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	sglib_hashed_ilist_it_next
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	sglib_hashed_ilist_it_init, .-sglib_hashed_ilist_it_init
	.align	2
	.globl	sglib_iq_init
	.type	sglib_iq_init, @function
sglib_iq_init:
	sw	zero,408(a0)
	sw	zero,404(a0)
	ret
	.size	sglib_iq_init, .-sglib_iq_init
	.align	2
	.globl	sglib_iq_is_empty
	.type	sglib_iq_is_empty, @function
sglib_iq_is_empty:
	lw	a5,404(a0)
	lw	a4,408(a0)
	sub	a0,a5,a4
	seqz	a0,a0
	ret
	.size	sglib_iq_is_empty, .-sglib_iq_is_empty
	.align	2
	.globl	sglib_iq_is_full
	.type	sglib_iq_is_full, @function
sglib_iq_is_full:
	lw	a4,408(a0)
	li	a5,680390656
	addi	a5,a5,203
	addi	a4,a4,1
	mulh	a5,a4,a5
	srai	a1,a4,31
	li	a2,101
	lw	a3,404(a0)
	srai	a5,a5,4
	sub	a5,a5,a1
	mul	a5,a5,a2
	sub	a0,a4,a5
	sub	a0,a0,a3
	seqz	a0,a0
	ret
	.size	sglib_iq_is_full, .-sglib_iq_is_full
	.align	2
	.globl	sglib_iq_first_element
	.type	sglib_iq_first_element, @function
sglib_iq_first_element:
	lw	a5,404(a0)
	slli	a5,a5,2
	add	a0,a0,a5
	lw	a0,0(a0)
	ret
	.size	sglib_iq_first_element, .-sglib_iq_first_element
	.align	2
	.globl	sglib_iq_first_element_ptr
	.type	sglib_iq_first_element_ptr, @function
sglib_iq_first_element_ptr:
	lw	a5,404(a0)
	slli	a5,a5,2
	add	a0,a0,a5
	ret
	.size	sglib_iq_first_element_ptr, .-sglib_iq_first_element_ptr
	.align	2
	.globl	sglib_iq_add_next
	.type	sglib_iq_add_next, @function
sglib_iq_add_next:
	lw	a4,408(a0)
	li	a5,680390656
	addi	a5,a5,203
	addi	a4,a4,1
	mulh	a5,a4,a5
	srai	a2,a4,31
	li	a3,101
	srai	a5,a5,4
	sub	a5,a5,a2
	mul	a5,a5,a3
	sub	a4,a4,a5
	sw	a4,408(a0)
	ret
	.size	sglib_iq_add_next, .-sglib_iq_add_next
	.align	2
	.globl	sglib_iq_add
	.type	sglib_iq_add, @function
sglib_iq_add:
	lw	a4,408(a0)
	li	a5,680390656
	addi	a5,a5,203
	addi	a3,a4,1
	mulh	a5,a3,a5
	srai	a6,a3,31
	li	a2,101
	slli	a4,a4,2
	add	a4,a0,a4
	sw	a1,0(a4)
	srai	a5,a5,4
	sub	a5,a5,a6
	mul	a5,a5,a2
	sub	a3,a3,a5
	sw	a3,408(a0)
	ret
	.size	sglib_iq_add, .-sglib_iq_add
	.align	2
	.globl	sglib_iq_delete_first
	.type	sglib_iq_delete_first, @function
sglib_iq_delete_first:
	lw	a4,404(a0)
	li	a5,680390656
	addi	a5,a5,203
	addi	a4,a4,1
	mulh	a5,a4,a5
	srai	a2,a4,31
	li	a3,101
	srai	a5,a5,4
	sub	a5,a5,a2
	mul	a5,a5,a3
	sub	a4,a4,a5
	sw	a4,404(a0)
	ret
	.size	sglib_iq_delete_first, .-sglib_iq_delete_first
	.align	2
	.globl	sglib_iq_delete
	.type	sglib_iq_delete, @function
sglib_iq_delete:
	lw	a4,404(a0)
	li	a5,680390656
	addi	a5,a5,203
	addi	a4,a4,1
	mulh	a5,a4,a5
	srai	a2,a4,31
	li	a3,101
	srai	a5,a5,4
	sub	a5,a5,a2
	mul	a5,a5,a3
	sub	a4,a4,a5
	sw	a4,404(a0)
	ret
	.size	sglib_iq_delete, .-sglib_iq_delete
	.align	2
	.globl	sglib___rbtree_delete_recursive
	.type	sglib___rbtree_delete_recursive, @function
sglib___rbtree_delete_recursive:
	lw	a5,0(a0)
	beq	a5,zero,.L1341
	lw	a3,0(a1)
	lw	a4,0(a5)
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	ra,44(sp)
	sub	a4,a3,a4
	mv	s0,a0
	blt	a4,zero,.L1235
	bne	a4,zero,.L1281
	bleu	a5,a1,.L1236
.L1235:
	lw	a4,8(a5)
	beq	a4,zero,.L1234
	lw	a2,0(a4)
	sw	s1,36(sp)
	addi	s1,a5,8
	sub	a2,a3,a2
	blt	a2,zero,.L1238
	bne	a2,zero,.L1239
	bgeu	a1,a4,.L1239
.L1238:
	lw	a5,8(a4)
	beq	a5,zero,.L1355
	lw	a2,0(a5)
	sw	s2,32(sp)
	addi	s2,a4,8
	sub	a3,a3,a2
	blt	a3,zero,.L1242
	bne	a3,zero,.L1243
	bgeu	a1,a5,.L1243
.L1242:
	addi	a0,a5,8
	call	sglib___rbtree_delete_recursive
	bne	a0,zero,.L1356
.L1348:
	lw	s1,36(sp)
	lw	s2,32(sp)
.L1234:
	li	a0,0
.L1232:
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
.L1341:
	li	a0,0
	ret
.L1281:
	lw	a4,12(a5)
	beq	a4,zero,.L1234
	lw	a2,0(a4)
	sw	s1,36(sp)
	addi	s1,a5,12
	sub	a3,a3,a2
	blt	a3,zero,.L1265
	bne	a3,zero,.L1282
	bgeu	a1,a4,.L1266
.L1265:
	addi	a0,a4,8
	call	sglib___rbtree_delete_recursive
	bne	a0,zero,.L1357
.L1355:
	lw	s1,36(sp)
	j	.L1234
.L1239:
	bgtu	a1,a4,.L1280
	bne	a2,zero,.L1280
	lw	a3,8(a4)
	beq	a3,zero,.L1358
	addi	a1,sp,28
	addi	a0,a4,8
	sw	a5,12(sp)
	sw	a4,8(sp)
	call	sglib___rbtree_delete_rightmost_leaf
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
	beq	a0,zero,.L1355
	mv	a0,s1
	call	sglib___rbtree_fix_left_deletion_discrepancy
.L1253:
	beq	a0,zero,.L1355
.L1259:
	mv	a0,s0
	call	sglib___rbtree_fix_left_deletion_discrepancy
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
.L1280:
	addi	a0,a4,12
	call	sglib___rbtree_delete_recursive
	beq	a0,zero,.L1355
	mv	a0,s1
	call	sglib___rbtree_fix_right_deletion_discrepancy
	j	.L1253
.L1236:
	bne	a4,zero,.L1281
	bltu	a5,a1,.L1281
	lw	a4,8(a5)
	beq	a4,zero,.L1359
	addi	a0,a5,8
	addi	a1,sp,28
	sw	a5,8(sp)
	call	sglib___rbtree_delete_rightmost_leaf
	lw	a5,8(sp)
	lw	a4,28(sp)
	lw	a2,8(a5)
	lw	a3,12(a5)
	sw	a2,8(a4)
	sw	a3,12(a4)
	lbu	a5,4(a5)
	sb	a5,4(a4)
	sw	a4,0(s0)
	beq	a0,zero,.L1234
	mv	a0,s0
	call	sglib___rbtree_fix_left_deletion_discrepancy
	j	.L1232
.L1243:
	bgtu	a1,a5,.L1279
	bne	a3,zero,.L1279
	lw	a3,8(a5)
	beq	a3,zero,.L1360
	addi	a1,sp,28
	addi	a0,a5,8
	sw	a4,12(sp)
	sw	a5,8(sp)
	call	sglib___rbtree_delete_rightmost_leaf
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
	beq	a0,zero,.L1348
.L1356:
	mv	a0,s2
	call	sglib___rbtree_fix_left_deletion_discrepancy
.L1245:
	beq	a0,zero,.L1348
.L1252:
	mv	a0,s1
	call	sglib___rbtree_fix_left_deletion_discrepancy
	lw	s2,32(sp)
	j	.L1253
.L1359:
	lw	a4,12(a5)
	beq	a4,zero,.L1361
	lbu	a5,4(a5)
	li	a0,0
	bne	a5,zero,.L1277
	lbu	a0,4(a4)
	seqz	a0,a0
.L1277:
	sb	zero,4(a4)
	sw	a4,0(s0)
	j	.L1232
.L1266:
	bne	a3,zero,.L1282
	bgtu	a1,a4,.L1282
	lw	a3,8(a4)
	beq	a3,zero,.L1362
	addi	a1,sp,28
	addi	a0,a4,8
	sw	a5,12(sp)
	sw	a4,8(sp)
	call	sglib___rbtree_delete_rightmost_leaf
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
	beq	a0,zero,.L1355
.L1357:
	mv	a0,s1
	call	sglib___rbtree_fix_left_deletion_discrepancy
.L1268:
	beq	a0,zero,.L1355
.L1274:
	mv	a0,s0
	call	sglib___rbtree_fix_right_deletion_discrepancy
	lw	s1,36(sp)
	j	.L1232
.L1279:
	addi	a0,a5,12
	call	sglib___rbtree_delete_recursive
	beq	a0,zero,.L1348
	mv	a0,s2
	call	sglib___rbtree_fix_right_deletion_discrepancy
	j	.L1245
.L1282:
	addi	a0,a4,12
	call	sglib___rbtree_delete_recursive
	beq	a0,zero,.L1355
	mv	a0,s1
	call	sglib___rbtree_fix_right_deletion_discrepancy
	j	.L1268
.L1358:
	lw	a3,12(a4)
	beq	a3,zero,.L1363
	lbu	a4,4(a4)
	bne	a4,zero,.L1258
	lbu	a4,4(a3)
	bne	a4,zero,.L1258
	sw	a3,8(a5)
	j	.L1259
.L1361:
	sw	zero,0(a0)
	lbu	a0,4(a5)
	seqz	a0,a0
	j	.L1232
.L1258:
	sb	zero,4(a3)
	lw	s1,36(sp)
	sw	a3,8(a5)
	j	.L1234
.L1360:
	lw	a3,12(a5)
	beq	a3,zero,.L1364
	lbu	a5,4(a5)
	bne	a5,zero,.L1251
	lbu	a5,4(a3)
	bne	a5,zero,.L1251
	sw	a3,8(a4)
	j	.L1252
.L1362:
	lw	a3,12(a4)
	beq	a3,zero,.L1365
	lbu	a4,4(a4)
	bne	a4,zero,.L1273
	lbu	a4,4(a3)
	bne	a4,zero,.L1273
	sw	a3,12(a5)
	j	.L1274
.L1363:
	sw	zero,8(a5)
	lbu	a0,4(a4)
	seqz	a0,a0
	j	.L1253
.L1251:
	sb	zero,4(a3)
	lw	s1,36(sp)
	lw	s2,32(sp)
	sw	a3,8(a4)
	j	.L1234
.L1273:
	sb	zero,4(a3)
	lw	s1,36(sp)
	sw	a3,12(a5)
	j	.L1234
.L1364:
	sw	zero,8(a4)
	lbu	a0,4(a5)
	seqz	a0,a0
	j	.L1245
.L1365:
	sw	zero,12(a5)
	lbu	a0,4(a4)
	seqz	a0,a0
	j	.L1268
	.size	sglib___rbtree_delete_recursive, .-sglib___rbtree_delete_recursive
	.align	2
	.globl	sglib_rbtree_add
	.type	sglib_rbtree_add, @function
sglib_rbtree_add:
	sw	zero,12(a1)
	sw	zero,8(a1)
	lw	a5,0(a0)
	beq	a5,zero,.L1472
	lw	a3,0(a1)
	lw	a4,0(a5)
	addi	sp,sp,-32
	sw	ra,28(sp)
	sub	a4,a3,a4
	mv	a2,a0
	blt	a4,zero,.L1369
	bne	a4,zero,.L1370
	bgeu	a1,a5,.L1370
.L1369:
	lw	a4,8(a5)
	beq	a4,zero,.L1473
	lw	a0,0(a4)
	sub	a3,a3,a0
	blt	a3,zero,.L1373
	bne	a3,zero,.L1374
	bgeu	a1,a4,.L1374
.L1373:
	addi	a0,a4,8
	sw	a2,12(sp)
	sw	a5,8(sp)
	sw	a4,4(sp)
	call	sglib___rbtree_add_recursive.constprop.0
	lw	a4,4(sp)
	lw	a5,8(sp)
	lw	a2,12(sp)
	lbu	a4,4(a4)
	beq	a4,zero,.L1474
.L1372:
	lbu	a5,4(a5)
	lw	a1,0(a2)
	beq	a5,zero,.L1475
.L1368:
	sb	zero,4(a1)
	lw	ra,28(sp)
	addi	sp,sp,32
	jr	ra
.L1472:
	sw	a1,0(a0)
	sb	zero,4(a1)
	ret
.L1473:
	li	a4,1
	sb	a4,4(a1)
	sw	a1,8(a5)
	lbu	a5,4(a5)
	lw	a1,0(a2)
	bne	a5,zero,.L1368
.L1475:
	lw	a5,8(a1)
	lw	a4,12(a1)
	lbu	a3,4(a5)
	beq	a4,zero,.L1386
	lbu	a0,4(a4)
	li	a6,1
	beq	a0,a6,.L1476
.L1386:
	li	a4,1
	bne	a3,a4,.L1368
	lw	a0,8(a5)
	lw	a4,12(a5)
	beq	a0,zero,.L1389
	lbu	a6,4(a0)
	beq	a6,a3,.L1477
.L1389:
	beq	a4,zero,.L1368
	lbu	a3,4(a4)
	li	a0,1
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
	mv	a1,a4
	j	.L1368
.L1474:
	lw	a4,8(a5)
	lw	a3,8(a4)
	lw	a1,12(a4)
	lbu	a0,4(a3)
	beq	a1,zero,.L1376
	lbu	a6,4(a1)
	li	a7,1
	beq	a6,a7,.L1478
.L1376:
	li	a1,1
	bne	a0,a1,.L1372
	lw	a6,8(a3)
	lw	a1,12(a3)
	beq	a6,zero,.L1380
	lbu	a7,4(a6)
	beq	a7,a0,.L1479
.L1380:
	beq	a1,zero,.L1372
	lbu	a0,4(a1)
	li	a6,1
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
	j	.L1372
.L1370:
	addi	a0,a5,12
	sw	a2,8(sp)
	sw	a5,4(sp)
	call	sglib___rbtree_add_recursive.constprop.0
	lw	a5,4(sp)
	lw	a2,8(sp)
	lbu	a5,4(a5)
	lw	a1,0(a2)
	bne	a5,zero,.L1368
	lw	a5,12(a1)
	lw	a4,8(a1)
	lbu	a3,4(a5)
	beq	a4,zero,.L1391
	lbu	a0,4(a4)
	li	a6,1
	beq	a0,a6,.L1480
.L1391:
	li	a4,1
	bne	a3,a4,.L1368
	lw	a0,12(a5)
	lw	a4,8(a5)
	beq	a0,zero,.L1395
	lbu	a6,4(a0)
	beq	a6,a3,.L1481
.L1395:
	beq	a4,zero,.L1368
	lbu	a3,4(a4)
	li	a0,1
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
	mv	a1,a4
	j	.L1368
.L1374:
	addi	a0,a4,12
	sw	a2,12(sp)
	sw	a5,8(sp)
	sw	a4,4(sp)
	call	sglib___rbtree_add_recursive.constprop.0
	lw	a4,4(sp)
	lw	a5,8(sp)
	lw	a2,12(sp)
	lbu	a4,4(a4)
	bne	a4,zero,.L1372
	lw	a4,8(a5)
	lw	a3,12(a4)
	lw	a1,8(a4)
	lbu	a0,4(a3)
	beq	a1,zero,.L1381
	lbu	a6,4(a1)
	li	a7,1
	beq	a6,a7,.L1482
.L1381:
	li	a1,1
	bne	a0,a1,.L1372
	lw	a6,12(a3)
	lw	a1,8(a3)
	beq	a6,zero,.L1384
	lbu	a7,4(a6)
	beq	a7,a0,.L1483
.L1384:
	beq	a1,zero,.L1372
	lbu	a0,4(a1)
	li	a6,1
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
	j	.L1372
.L1478:
	bne	a0,a6,.L1372
	lw	a6,8(a3)
	beq	a6,zero,.L1378
	lbu	a6,4(a6)
	beq	a6,a0,.L1383
.L1378:
	lw	a0,12(a3)
	beq	a0,zero,.L1372
.L1469:
	lbu	a6,4(a0)
	li	a0,1
	bne	a6,a0,.L1372
.L1383:
	sb	zero,4(a3)
	sb	zero,4(a1)
	li	a3,1
	sb	a3,4(a4)
	j	.L1372
.L1477:
	sw	a4,8(a1)
	sw	a1,12(a5)
	sw	a0,8(a5)
	sb	a3,4(a1)
	sb	zero,4(a5)
	sw	a5,0(a2)
	mv	a1,a5
	j	.L1368
.L1479:
	sw	a1,8(a4)
	sw	a6,8(a3)
	sw	a4,12(a3)
	sb	a0,4(a4)
	sb	zero,4(a3)
	sw	a3,8(a5)
	j	.L1372
.L1481:
	sw	a4,12(a1)
	sw	a1,8(a5)
	sw	a0,12(a5)
	sb	a3,4(a1)
	sb	zero,4(a5)
	sw	a5,0(a2)
	mv	a1,a5
	j	.L1368
.L1483:
	sw	a1,12(a4)
	sw	a6,12(a3)
	sw	a4,8(a3)
	sb	a0,4(a4)
	sb	zero,4(a3)
	sw	a3,8(a5)
	j	.L1372
.L1476:
	bne	a3,a0,.L1368
	lw	a2,8(a5)
	beq	a2,zero,.L1387
	lbu	a2,4(a2)
	beq	a2,a3,.L1393
.L1387:
	lw	a3,12(a5)
	beq	a3,zero,.L1368
.L1471:
	lbu	a2,4(a3)
	li	a3,1
	bne	a2,a3,.L1368
.L1393:
	sb	zero,4(a5)
	sb	zero,4(a4)
	li	a5,1
	sb	a5,4(a1)
	j	.L1368
.L1480:
	bne	a3,a0,.L1368
	lw	a2,12(a5)
	beq	a2,zero,.L1392
	lbu	a2,4(a2)
	beq	a2,a3,.L1393
.L1392:
	lw	a3,8(a5)
	bne	a3,zero,.L1471
	j	.L1368
.L1482:
	bne	a0,a6,.L1372
	lw	a6,12(a3)
	beq	a6,zero,.L1382
	lbu	a6,4(a6)
	beq	a6,a0,.L1383
.L1382:
	lw	a0,8(a3)
	bne	a0,zero,.L1469
	j	.L1372
	.size	sglib_rbtree_add, .-sglib_rbtree_add
	.align	2
	.globl	sglib_rbtree_delete
	.type	sglib_rbtree_delete, @function
sglib_rbtree_delete:
	lw	a5,0(a0)
	beq	a5,zero,.L1528
	lw	a3,0(a1)
	lw	a4,0(a5)
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	ra,44(sp)
	sub	a4,a3,a4
	mv	s0,a0
	blt	a4,zero,.L1487
	bne	a4,zero,.L1511
	bgeu	a1,a5,.L1488
.L1487:
	lw	a4,8(a5)
	beq	a4,zero,.L1490
	lw	a2,0(a4)
	sw	s1,36(sp)
	addi	s1,a5,8
	sub	a3,a3,a2
	blt	a3,zero,.L1491
	bne	a3,zero,.L1510
	bgeu	a1,a4,.L1492
.L1491:
	addi	a0,a4,8
	call	sglib___rbtree_delete_recursive
	bne	a0,zero,.L1503
.L1532:
	lw	a5,0(s0)
	lw	s1,36(sp)
	beq	a5,zero,.L1484
.L1490:
	sb	zero,4(a5)
.L1484:
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
.L1528:
	ret
.L1511:
	addi	a0,a5,12
	call	sglib___rbtree_delete_recursive
	bne	a0,zero,.L1506
	lw	a5,0(s0)
.L1535:
	bne	a5,zero,.L1490
	j	.L1484
.L1492:
	bne	a3,zero,.L1510
	bleu	a1,a4,.L1496
.L1510:
	addi	a0,a4,12
	call	sglib___rbtree_delete_recursive
	beq	a0,zero,.L1532
	mv	a0,s1
	call	sglib___rbtree_fix_right_deletion_discrepancy
.L1495:
	beq	a0,zero,.L1532
.L1502:
	mv	a0,s0
	call	sglib___rbtree_fix_left_deletion_discrepancy
	j	.L1532
.L1506:
	mv	a0,s0
	call	sglib___rbtree_fix_right_deletion_discrepancy
	lw	a5,0(s0)
	bne	a5,zero,.L1490
	j	.L1484
.L1488:
	bne	a4,zero,.L1511
	bgtu	a1,a5,.L1511
	lw	a4,8(a5)
	beq	a4,zero,.L1534
	addi	a0,a5,8
	addi	a1,sp,28
	sw	a5,8(sp)
	call	sglib___rbtree_delete_rightmost_leaf
	lw	a5,8(sp)
	lw	a4,28(sp)
	lw	a2,8(a5)
	lw	a3,12(a5)
	sw	a2,8(a4)
	sw	a3,12(a4)
	lbu	a5,4(a5)
	sb	a5,4(a4)
	sw	a4,0(s0)
	mv	a5,a4
	beq	a0,zero,.L1490
	mv	a0,s0
	call	sglib___rbtree_fix_left_deletion_discrepancy
	lw	a5,0(s0)
	j	.L1535
.L1496:
	lw	a3,8(a4)
	beq	a3,zero,.L1536
	addi	a1,sp,28
	addi	a0,a4,8
	sw	a5,12(sp)
	sw	a4,8(sp)
	call	sglib___rbtree_delete_rightmost_leaf
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
	beq	a0,zero,.L1532
.L1503:
	mv	a0,s1
	call	sglib___rbtree_fix_left_deletion_discrepancy
	j	.L1495
.L1534:
	lw	a5,12(a5)
	beq	a5,zero,.L1537
	sb	zero,4(a5)
	sw	a5,0(a0)
	j	.L1490
.L1536:
	lw	a3,12(a4)
	beq	a3,zero,.L1538
	lbu	a4,4(a4)
	bne	a4,zero,.L1501
	lbu	a4,4(a3)
	bne	a4,zero,.L1501
	sw	a3,8(a5)
	j	.L1502
.L1537:
	sw	zero,0(a0)
	j	.L1484
.L1501:
	sb	zero,4(a3)
	sw	a3,8(a5)
	lw	a5,0(s0)
	lw	s1,36(sp)
	bne	a5,zero,.L1490
	j	.L1484
.L1538:
	sw	zero,8(a5)
	lbu	a0,4(a4)
	seqz	a0,a0
	j	.L1495
	.size	sglib_rbtree_delete, .-sglib_rbtree_delete
	.align	2
	.globl	sglib_rbtree_find_member
	.type	sglib_rbtree_find_member, @function
sglib_rbtree_find_member:
	beq	a0,zero,.L1539
	lw	a4,0(a1)
.L1543:
	lw	a5,0(a0)
	sub	a5,a4,a5
	blt	a5,zero,.L1549
	beq	a5,zero,.L1539
	lw	a0,12(a0)
	bne	a0,zero,.L1543
.L1539:
	ret
.L1549:
	lw	a0,8(a0)
	bne	a0,zero,.L1543
	ret
	.size	sglib_rbtree_find_member, .-sglib_rbtree_find_member
	.align	2
	.globl	sglib_rbtree_is_member
	.type	sglib_rbtree_is_member, @function
sglib_rbtree_is_member:
	beq	a0,zero,.L1550
	lw	a4,0(a1)
.L1556:
	lw	a5,0(a0)
	sub	a5,a4,a5
	blt	a5,zero,.L1552
	bne	a5,zero,.L1553
	bgeu	a1,a0,.L1553
.L1552:
	lw	a0,8(a0)
	bne	a0,zero,.L1556
	ret
.L1553:
	bgtu	a1,a0,.L1559
	beq	a5,zero,.L1558
.L1559:
	lw	a0,12(a0)
	bne	a0,zero,.L1556
	ret
.L1558:
	li	a0,1
.L1550:
	ret
	.size	sglib_rbtree_is_member, .-sglib_rbtree_is_member
	.align	2
	.globl	sglib_rbtree_delete_if_member
	.type	sglib_rbtree_delete_if_member, @function
sglib_rbtree_delete_if_member:
	lw	a4,0(a0)
	beq	a4,zero,.L1568
	lw	a3,0(a1)
.L1572:
	lw	a5,0(a4)
	sub	a5,a3,a5
	blt	a5,zero,.L1583
	beq	a5,zero,.L1571
	lw	a4,12(a4)
	bne	a4,zero,.L1572
.L1568:
	sw	zero,0(a2)
	li	a0,0
	ret
.L1583:
	lw	a4,8(a4)
	bne	a4,zero,.L1572
	j	.L1568
.L1571:
	addi	sp,sp,-32
	mv	a1,a4
	sw	a4,0(a2)
	sw	ra,28(sp)
	sw	a0,12(sp)
	call	sglib___rbtree_delete_recursive
	lw	a5,12(sp)
	lw	a5,0(a5)
	beq	a5,zero,.L1575
	sb	zero,4(a5)
.L1575:
	lw	ra,28(sp)
	li	a0,1
	addi	sp,sp,32
	jr	ra
	.size	sglib_rbtree_delete_if_member, .-sglib_rbtree_delete_if_member
	.align	2
	.globl	sglib_rbtree_add_if_not_member
	.type	sglib_rbtree_add_if_not_member, @function
sglib_rbtree_add_if_not_member:
	lw	a4,0(a0)
	beq	a4,zero,.L1585
	lw	a3,0(a1)
.L1589:
	lw	a5,0(a4)
	sub	a5,a3,a5
	blt	a5,zero,.L1598
	beq	a5,zero,.L1588
	lw	a4,12(a4)
	bne	a4,zero,.L1589
.L1585:
	addi	sp,sp,-32
	sw	zero,0(a2)
	sw	zero,12(a1)
	sw	zero,8(a1)
	sw	ra,28(sp)
	sw	a0,12(sp)
	call	sglib___rbtree_add_recursive.constprop.0
	lw	a0,12(sp)
	li	a5,1
	lw	a4,0(a0)
	mv	a0,a5
	sb	zero,4(a4)
	lw	ra,28(sp)
	addi	sp,sp,32
	jr	ra
.L1598:
	lw	a4,8(a4)
	bne	a4,zero,.L1589
	j	.L1585
.L1588:
	sw	a4,0(a2)
	mv	a0,a5
	ret
	.size	sglib_rbtree_add_if_not_member, .-sglib_rbtree_add_if_not_member
	.align	2
	.globl	sglib_rbtree_len
	.type	sglib_rbtree_len, @function
sglib_rbtree_len:
	beq	a0,zero,.L1617
	addi	sp,sp,-640
	li	t3,1
	mv	a4,a0
	mv	a7,sp
	sub	t3,t3,sp
	li	a5,0
	li	a0,0
	addi	t1,sp,128
	addi	t4,sp,124
.L1600:
	slli	a2,a5,2
	add	a2,t1,a2
	add	a5,a7,a5
.L1602:
	lw	a3,12(a4)
	lw	a4,8(a4)
	sb	zero,0(a5)
	sw	a3,0(a2)
	mv	a3,a5
	addi	a2,a2,4
	addi	a5,a5,1
	bne	a4,zero,.L1602
	add	a3,t3,a3
	slli	a1,a3,2
	add	a1,t4,a1
	add	a2,a7,a3
	j	.L1605
.L1619:
	addi	a2,a2,-1
	addi	a1,a1,-4
	bne	a4,zero,.L1618
.L1605:
	lbu	a4,-1(a2)
	mv	a5,a3
	addi	a3,a3,-1
	addi	a6,a4,1
	sb	a6,-1(a2)
	seqz	a4,a4
	add	a0,a0,a4
	lw	a4,0(a1)
	bgt	a3,zero,.L1619
	slli	a3,a3,2
	add	a3,t1,a3
	sw	zero,0(a3)
	bne	a4,zero,.L1600
	addi	sp,sp,640
	jr	ra
.L1618:
	slli	a3,a3,2
	add	a3,t1,a3
	sw	zero,0(a3)
	j	.L1600
.L1617:
	li	a0,0
	ret
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
	ble	a5,zero,.L1620
	sw	s1,36(sp)
	sw	s7,12(sp)
	sw	s0,40(sp)
	sw	s3,28(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	mv	s1,a0
	addi	a3,a5,-1
	li	s7,1
.L1621:
	add	s3,s1,a3
	lbu	a4,4(s3)
	mv	s5,a5
	bleu	a4,s7,.L1622
	slli	a5,a3,16
	srai	a5,a5,16
	sh	a5,644(s1)
.L1623:
	ble	a5,zero,.L1656
	addi	a3,a5,-1
	add	a4,s1,a3
	lbu	a4,4(a4)
	lh	a2,646(s1)
	bne	a2,a4,.L1641
	slli	a4,a5,2
	add	a4,s1,a4
	lw	a4,128(a4)
	sw	a4,0(s1)
.L1641:
	lw	a4,0(s1)
	beq	a4,zero,.L1621
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
	jr	ra
.L1622:
	slli	s6,a5,2
	add	s6,s1,s6
	lw	a5,128(s6)
	bne	a4,zero,.L1624
	lw	s0,8(a5)
.L1625:
	beq	s2,zero,.L1626
	beq	s4,zero,.L1627
	beq	s0,zero,.L1657
.L1628:
	mv	a1,s0
	mv	a0,s2
	jalr	s4
	blt	a0,zero,.L1660
	beq	a0,zero,.L1633
	lw	s0,12(s0)
	bne	s0,zero,.L1628
.L1635:
	lh	a5,644(s1)
.L1658:
	lbu	a4,4(s3)
.L1629:
	addi	a4,a4,1
	sb	a4,4(s3)
	j	.L1623
.L1660:
	lw	s0,8(s0)
	bne	s0,zero,.L1628
	j	.L1635
.L1626:
	lh	a5,644(s1)
	beq	s0,zero,.L1658
.L1639:
	addi	a5,a5,1
	sw	s0,132(s6)
	slli	a5,a5,16
	add	s5,s1,s5
	srai	a5,a5,16
	sb	zero,4(s5)
	sh	a5,644(s1)
	j	.L1658
.L1624:
	lw	s0,12(a5)
	j	.L1625
.L1633:
	lh	a5,644(s1)
	j	.L1639
.L1627:
	beq	s0,zero,.L1657
	lw	a4,0(s2)
	lw	a5,0(s0)
	sub	a5,a4,a5
	blt	a5,zero,.L1661
.L1631:
	beq	a5,zero,.L1633
	lw	s0,12(s0)
	beq	s0,zero,.L1635
.L1659:
	lw	a5,0(s0)
	sub	a5,a4,a5
	bge	a5,zero,.L1631
.L1661:
	lw	s0,8(s0)
	bne	s0,zero,.L1659
	j	.L1635
.L1657:
	lh	a5,644(s1)
	j	.L1629
	.size	sglib__rbtree_it_compute_current_elem, .-sglib__rbtree_it_compute_current_elem
	.align	2
	.type	benchmark_body, @function
benchmark_body:
	addi	sp,sp,-1152
	sw	ra,1148(sp)
	ble	a0,zero,.L1664
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
	li	s5,1
	addi	s0,sp,28
.L1663:
	mv	a2,s2
	mv	a4,s2
	mv	a5,s1
.L1665:
	lw	a3,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a5)
	bne	s10,a5,.L1665
	li	a5,100
	sw	zero,28(sp)
	sw	a5,432(sp)
	mv	a7,a5
	li	a6,0
	li	t1,0
	li	t3,2
	addi	t4,sp,432
.L1687:
	sub	a5,a7,a6
	mv	t5,t1
.L1820:
	ble	a5,t3,.L1666
.L1825:
	addi	a3,a7,-1
	slli	a1,a6,2
	addi	a5,a6,1
	slli	t1,a3,2
	add	t6,s1,a1
	bge	a5,a3,.L1823
.L1667:
	lw	a0,0(t6)
	blt	a3,a5,.L1669
	slli	a4,a5,2
	add	a4,s1,a4
	j	.L1681
.L1670:
	addi	a5,a5,1
	addi	a4,a4,4
	bgt	a5,a3,.L1669
.L1681:
	lw	t0,0(a4)
	ble	t0,a0,.L1670
	bgt	a5,a3,.L1669
	add	t1,s1,t1
.L1671:
	lw	a4,0(t1)
	blt	a4,a0,.L1824
	addi	a3,a3,-1
	addi	t1,t1,-4
	bge	a3,a5,.L1671
.L1673:
	slli	a5,a3,2
	add	a5,s1,a5
	lw	a4,0(a5)
	add	a1,s1,a1
	sw	a0,0(a5)
	sw	a4,0(a1)
	sub	a5,a3,a6
	mv	a1,a3
.L1680:
	ble	a5,s5,.L1668
	sub	a4,a7,a1
	ble	a4,s5,.L1753
	addi	a4,a4,-1
	addi	a1,a1,1
	ble	a4,a5,.L1683
	slli	a4,t5,2
	add	a0,t4,a4
	add	a4,s0,a4
	sw	a7,0(a0)
	sw	a1,0(a4)
	addi	t5,t5,1
	mv	a7,a3
	bgt	a5,t3,.L1825
.L1666:
	beq	a5,t3,.L1826
.L1685:
	ble	t5,zero,.L1686
.L1828:
	addi	t1,t5,-1
	slli	a5,t1,2
	add	a4,s0,a5
	add	a5,t4,a5
	lw	a6,0(a4)
	lw	a7,0(a5)
	j	.L1687
.L1669:
	add	a4,s1,t1
	lw	a5,0(a4)
	add	a1,s1,a1
	sw	a0,0(a4)
	sw	a5,0(a1)
	mv	a1,a3
	sub	a5,a3,a6
	j	.L1680
.L1824:
	bgt	a5,a3,.L1673
	bge	a5,a3,.L1751
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
	blt	a0,a3,.L1827
	bgt	a3,a4,.L1677
	mv	a4,a5
.L1677:
	mv	a5,a4
	j	.L1667
.L1827:
	addi	a3,a3,-1
	ble	a3,a4,.L1809
	slli	t1,a3,2
	mv	a5,a4
	j	.L1667
.L1751:
	mv	a1,a3
	mv	a3,a5
	sub	a5,a3,a6
	j	.L1680
.L1823:
	mv	a1,a3
.L1668:
	addi	a6,a1,1
	sub	a5,a7,a6
	j	.L1820
.L1753:
	mv	a7,a3
	j	.L1820
.L1683:
	slli	a5,t5,2
	add	a4,s0,a5
	add	a5,t4,a5
	sw	a6,0(a4)
	sw	a3,0(a5)
	addi	t5,t5,1
	sub	a5,a7,a1
	mv	a6,a1
	j	.L1820
.L1826:
	addi	a5,a7,-1
	slli	a5,a5,2
	slli	a4,a6,2
	add	a5,s1,a5
	add	a4,s1,a4
	lw	a1,0(a5)
	lw	a3,0(a4)
	ble	a3,a1,.L1685
	sw	a1,0(a4)
	sw	a3,0(a5)
	bgt	t5,zero,.L1828
.L1686:
	lw	a5,4(sp)
	lw	s11,4(sp)
	sw	zero,%lo(the_list)(s9)
	sw	a5,%lo(heap_ptr)(s4)
	lui	a5,%hi(heap_end)
	sw	s8,%lo(heap_end)(a5)
	mv	a4,s2
	li	s7,0
	li	a3,0
	j	.L1691
.L1689:
	lw	a1,8(a3)
	sw	a3,4(a5)
	sw	a1,8(a5)
	sw	a5,8(a3)
	lw	a3,8(a5)
	beq	a3,zero,.L1690
	sw	a5,4(a3)
.L1690:
	addi	a4,a4,4
	li	a3,1
	beq	s6,a4,.L1829
.L1691:
	mv	a5,s11
	addi	s11,s11,12
	addi	s7,s7,12
	bgtu	s11,s8,.L1688
	lw	a1,0(a4)
	lw	a3,%lo(the_list)(s9)
	sw	a1,0(a5)
	bne	a3,zero,.L1689
	sw	a5,%lo(the_list)(s9)
	sw	zero,8(a5)
	sw	zero,4(a5)
	addi	a4,a4,4
	li	a3,1
	bne	s6,a4,.L1691
.L1829:
	addi	a0,s9,%lo(the_list)
	sw	a2,12(sp)
	sw	s7,%lo(heap_requested)(s3)
	sw	s11,%lo(heap_ptr)(s4)
	call	sglib_dllist_sort
	lw	a5,%lo(the_list)(s9)
	sw	zero,20(sp)
	lw	a2,12(sp)
	beq	a5,zero,.L1695
.L1692:
	mv	a4,a5
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
	mv	a5,s10
.L1693:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L1693
	li	t1,-858992640
	addi	t1,t1,-819
	mv	a0,s2
	li	a7,0
.L1701:
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
	mv	a5,a6
	bne	a6,zero,.L1696
	j	.L1697
.L1698:
	lw	a5,4(a5)
	beq	a5,zero,.L1697
.L1696:
	lw	a4,0(a5)
	bne	a1,a4,.L1698
	addi	a0,a0,4
	bne	s6,a0,.L1701
.L1831:
	beq	a7,zero,.L1702
	sw	s7,%lo(heap_requested)(s3)
	sw	s11,%lo(heap_ptr)(s4)
.L1702:
	lw	a5,400(s1)
	beq	a5,zero,.L1703
	lui	a0,%hi(.LANCHOR0+404)
	lw	a4,4(a5)
	addi	a0,a0,%lo(.LANCHOR0+404)
	li	a5,0
.L1704:
	li	a1,19
.L1711:
	lw	a3,20(sp)
	addi	a3,a3,1
	sw	a3,20(sp)
	beq	a4,zero,.L1708
.L1830:
	lw	a3,20(sp)
	lw	a4,4(a4)
	addi	a3,a3,1
	sw	a3,20(sp)
	bne	a4,zero,.L1830
.L1708:
	slli	a4,a5,2
	add	a4,a0,a4
.L1710:
	addi	a5,a5,1
	bgt	a5,a1,.L1707
	lw	a3,0(a4)
	addi	a4,a4,4
	beq	a3,zero,.L1710
	lw	a4,4(a3)
	j	.L1711
.L1697:
	addi	a5,s11,8
	addi	s7,s7,8
	bgtu	a5,s8,.L1700
	sw	a1,0(s11)
	sw	a6,4(s11)
	sw	s11,0(a3)
	addi	a0,a0,4
	li	a7,1
	mv	s11,a5
	bne	s6,a0,.L1701
	j	.L1831
.L1707:
	li	a7,680390656
	addi	a7,a7,203
	mv	a4,s2
	li	a5,0
	li	t1,101
.L1712:
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
	bne	s6,a4,.L1712
	li	a3,680390656
	addi	a3,a3,203
	li	a4,0
	li	a6,101
	beq	a5,zero,.L1716
.L1714:
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
	bne	a4,a5,.L1714
.L1716:
	addi	t1,s2,4
	mv	a7,s0
	li	a6,0
	li	a1,14
	li	t3,99
.L1715:
	sw	a1,0(a7)
	mv	a5,a6
	bne	a6,zero,.L1717
	j	.L1719
.L1722:
	slli	a5,a5,2
	add	a5,s0,a5
	sw	a1,0(a4)
	sw	a0,0(a5)
	beq	a3,zero,.L1721
	lw	a1,0(a4)
	mv	a5,a3
.L1717:
	srai	a3,a5,1
	slli	a4,a3,2
	add	a4,s0,a4
	lw	a0,0(a4)
	blt	a0,a1,.L1722
.L1721:
	beq	a6,t3,.L1832
.L1719:
	lw	a1,0(t1)
	addi	a7,a7,4
	addi	a6,a6,1
	addi	t1,t1,4
	j	.L1715
.L1832:
	addi	a7,s0,396
	li	a0,100
	j	.L1728
.L1723:
	addi	a7,a7,-4
	beq	a0,zero,.L1833
.L1728:
	lw	a5,20(sp)
	lw	a4,28(sp)
	lw	a6,0(a7)
	addi	a0,a0,-1
	add	a5,a5,a4
	sw	a5,20(sp)
	sw	a6,28(sp)
	li	a5,0
.L1727:
	slli	a4,a5,1
	addi	a3,a4,1
	ble	a0,a3,.L1723
	slli	a1,a3,2
	add	a1,s0,a1
	lw	a1,0(a1)
	addi	a4,a4,2
	blt	a6,a1,.L1724
	ble	a0,a4,.L1723
	slli	a3,a4,2
	add	a3,s0,a3
	lw	a1,0(a3)
	bgt	a6,a1,.L1723
	bge	a6,a1,.L1723
	mv	a3,a4
.L1726:
	beq	a5,a3,.L1723
	slli	a5,a5,2
	add	a5,s0,a5
	slli	a4,a3,2
	sw	a1,0(a5)
	add	a5,s0,a4
	sw	a6,0(a5)
	mv	a5,a3
	j	.L1727
.L1724:
	ble	a0,a4,.L1726
	slli	t1,a4,2
	add	t1,s0,t1
	lw	t1,0(t1)
	bgt	a1,t1,.L1726
	bge	a1,t1,.L1726
	mv	a1,t1
	mv	a3,a4
	j	.L1726
.L1833:
	sw	zero,24(sp)
	li	a3,14
	li	s11,4
	mv	s7,a2
.L1729:
	lw	a1,%lo(heap_ptr)(s4)
	lw	a5,%lo(heap_requested)(s3)
	andi	a4,a1,3
	addi	a2,a1,16
	addi	a5,a5,16
	beq	a4,zero,.L1734
	sub	a4,s11,a4
	add	a2,a2,a4
	add	a5,a5,a4
.L1734:
	sw	a5,%lo(heap_requested)(s3)
	bgtu	a2,s8,.L1735
	sw	a3,0(a1)
	sw	zero,12(a1)
	sw	zero,8(a1)
	addi	a0,sp,24
	sw	a2,%lo(heap_ptr)(s4)
	call	sglib___rbtree_add_recursive.constprop.0
	lw	a1,24(sp)
	addi	s7,s7,4
	sb	zero,4(a1)
	beq	s6,s7,.L1736
.L1821:
	mv	a4,a1
	lw	a3,0(s7)
	lw	a5,0(a4)
	sub	a5,a3,a5
	blt	a5,zero,.L1834
.L1730:
	beq	a5,zero,.L1732
	lw	a4,12(a4)
	beq	a4,zero,.L1729
.L1822:
	lw	a5,0(a4)
	sub	a5,a3,a5
	bge	a5,zero,.L1730
.L1834:
	lw	a4,8(a4)
	bne	a4,zero,.L1822
	j	.L1729
.L1732:
	addi	s7,s7,4
	bne	s6,s7,.L1821
.L1736:
	li	a5,65536
	addi	a5,a5,1
	sw	a5,1076(sp)
	li	a5,1
	sw	zero,1080(sp)
	sw	zero,1084(sp)
	sb	zero,436(sp)
	sw	a1,564(sp)
	mv	a2,a5
	li	a7,0
	addi	a0,sp,1088
	addi	a6,sp,436
.L1738:
	lw	a3,8(a1)
	li	a4,0
.L1745:
	beq	a3,zero,.L1740
	slli	a4,a2,2
	add	a4,a4,a6
	sw	a3,128(a4)
	add	a2,a2,sp
	sb	zero,436(a2)
	addi	a5,a5,1
	lbu	a4,-652(a0)
	slli	a5,a5,16
	srai	a5,a5,16
	li	a7,1
.L1740:
	addi	a4,a4,1
	sb	a4,-652(a0)
	ble	a5,zero,.L1741
.L1836:
	addi	a3,a5,-1
	addi	a4,a3,1072
	addi	a2,sp,16
	add	a0,a4,a2
	lbu	a4,-652(a0)
	mv	a2,a5
	beq	a4,s5,.L1742
	bleu	a4,s5,.L1835
	slli	a5,a3,16
	srai	a5,a5,16
	li	a7,1
	bgt	a5,zero,.L1836
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
	jr	ra
.L1835:
	slli	a4,a5,2
	add	a4,a4,sp
	lw	a1,560(a4)
	j	.L1738
.L1742:
	slli	a3,a5,2
	add	a3,a3,a6
	lw	a3,124(a3)
	bne	a3,zero,.L1744
	lw	a3,12(zero)
	j	.L1745
.L1703:
	addi	a0,s10,4
	mv	a4,a0
	li	a1,20
.L1705:
	addi	a5,a5,1
	beq	a5,a1,.L1707
	lw	a3,0(a4)
	addi	a4,a4,4
	beq	a3,zero,.L1705
	lw	a4,4(a3)
	j	.L1704
.L1744:
	beq	a7,zero,.L1746
	sh	a5,1076(sp)
.L1746:
	sw	a3,432(sp)
.L1747:
	lw	a4,0(a3)
	lw	a5,20(sp)
	addi	a0,sp,432
	add	a5,a5,a4
	sw	a5,20(sp)
	call	sglib__rbtree_it_compute_current_elem
	lw	a3,432(sp)
	bne	a3,zero,.L1747
	lw	a5,0(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	lw	a4,0(sp)
	lw	a5,8(sp)
	bne	a5,a4,.L1663
	j	.L1837
.L1809:
	mv	a1,a3
	sub	a5,a4,a6
	mv	a3,a4
	j	.L1680
.L1700:
	sw	s7,%lo(heap_requested)(s3)
	beq	a7,zero,.L1735
	sw	s11,%lo(heap_ptr)(s4)
.L1735:
	sw	zero,0(zero)
	ebreak
.L1688:
	sw	s7,%lo(heap_requested)(s3)
	beq	a3,zero,.L1735
	sw	a5,%lo(heap_ptr)(s4)
	j	.L1735
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
	mv	s3,a0
	mv	s4,a2
	mv	s0,a1
	beq	a4,zero,.L1839
	sw	s1,20(sp)
	sw	s2,16(sp)
	mv	s1,a4
	mv	s2,a3
	beq	a3,zero,.L1840
.L1850:
	beq	s0,zero,.L1869
.L1841:
	mv	a1,s0
	mv	a0,s1
	jalr	s2
	blt	a0,zero,.L1873
	beq	a0,zero,.L1871
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
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L1873:
	lw	s0,8(s0)
	j	.L1850
.L1839:
	beq	a1,zero,.L1843
	li	a5,1
	sb	zero,4(s3)
	sw	s0,132(s3)
	sh	a5,644(s3)
	bne	s4,zero,.L1851
.L1875:
	sw	s0,0(s3)
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	addi	sp,sp,32
	jr	ra
.L1851:
	mv	a0,s3
	call	sglib__rbtree_it_compute_current_elem
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	a0,0(s3)
	lw	s4,8(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
.L1840:
	beq	a1,zero,.L1869
	lw	a4,0(a4)
	lw	a5,0(s0)
	sub	a5,a4,a5
	blt	a5,zero,.L1874
.L1844:
	beq	a5,zero,.L1871
	lw	s0,12(s0)
	beq	s0,zero,.L1869
.L1872:
	lw	a5,0(s0)
	sub	a5,a4,a5
	bge	a5,zero,.L1844
.L1874:
	lw	s0,8(s0)
	bne	s0,zero,.L1872
	j	.L1869
.L1871:
	li	a5,1
	lw	s1,20(sp)
	lw	s2,16(sp)
	sb	zero,4(s3)
	sw	s0,132(s3)
	sh	a5,644(s3)
	beq	s4,zero,.L1875
	j	.L1851
	.size	sglib__rbtree_it_init, .-sglib__rbtree_it_init
	.align	2
	.globl	sglib_rbtree_it_init
	.type	sglib_rbtree_it_init, @function
sglib_rbtree_it_init:
	li	a7,2
	sw	zero,648(a0)
	sw	zero,652(a0)
	sh	a7,646(a0)
	mv	a4,a0
	beq	a1,zero,.L1894
	li	a3,1
	mv	a5,a3
	sh	a3,644(a0)
	mv	a6,a3
	sw	a1,132(a0)
	sb	zero,4(a0)
	sw	zero,0(a0)
	li	a3,0
	li	a2,0
.L1879:
	bgtu	a3,a6,.L1886
	slli	a1,a5,2
	add	a1,a4,a1
	lw	a0,128(a1)
	bne	a3,zero,.L1881
	lw	a0,8(a0)
	beq	a0,zero,.L1895
.L1883:
	addi	t1,a5,1
	add	a3,a4,a5
	sw	a0,132(a1)
	slli	a5,t1,16
	sb	zero,4(a3)
	srai	a5,a5,16
	add	a2,a4,a2
	sh	a5,644(a4)
	lbu	a3,4(a2)
.L1884:
	addi	a3,a3,1
	sb	a3,4(a2)
	ble	a5,zero,.L1896
.L1885:
	addi	a2,a5,-1
	add	a3,a4,a2
	lbu	a3,4(a3)
	bne	a3,a7,.L1879
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,128(a5)
	sw	a0,0(a4)
	bne	a0,zero,.L1897
.L1886:
	slli	a5,a2,16
	srai	a5,a5,16
	sh	a5,644(a4)
	bgt	a5,zero,.L1885
.L1896:
	li	a0,0
	ret
.L1881:
	lw	a0,12(a0)
	bne	a0,zero,.L1883
.L1895:
	lh	a5,644(a4)
	add	a2,a4,a2
	j	.L1884
.L1894:
	sh	zero,644(a0)
	sw	zero,0(a0)
	li	a0,0
	ret
.L1897:
	ret
	.size	sglib_rbtree_it_init, .-sglib_rbtree_it_init
	.align	2
	.globl	sglib_rbtree_it_init_preorder
	.type	sglib_rbtree_it_init_preorder, @function
sglib_rbtree_it_init_preorder:
	sh	zero,646(a0)
	sw	zero,648(a0)
	sw	zero,652(a0)
	li	a4,0
	beq	a1,zero,.L1899
	sb	zero,4(a0)
	sw	a1,132(a0)
	li	a4,1
.L1899:
	sw	a1,0(a0)
	sh	a4,644(a0)
	mv	a0,a1
	ret
	.size	sglib_rbtree_it_init_preorder, .-sglib_rbtree_it_init_preorder
	.align	2
	.globl	sglib_rbtree_it_init_inorder
	.type	sglib_rbtree_it_init_inorder, @function
sglib_rbtree_it_init_inorder:
	li	a3,1
	sw	zero,648(a0)
	sw	zero,652(a0)
	sh	a3,646(a0)
	mv	a4,a0
	beq	a1,zero,.L1916
	mv	a5,a3
	sh	a3,644(a0)
	mv	a6,a3
	sw	a1,132(a0)
	sb	zero,4(a0)
	sw	zero,0(a0)
	li	a3,0
	li	a2,0
.L1905:
	bleu	a3,a6,.L1917
	slli	a5,a2,16
	srai	a5,a5,16
	sh	a5,644(a4)
	ble	a5,zero,.L1918
.L1909:
	addi	a2,a5,-1
	add	a3,a4,a2
	lbu	a3,4(a3)
	bne	a3,a6,.L1905
	slli	a1,a5,2
	add	a1,a4,a1
	lw	a0,128(a1)
	sw	a0,0(a4)
	bne	a0,zero,.L1919
	slli	a1,a5,2
	add	a1,a4,a1
	lw	a0,128(a1)
	lw	a0,12(a0)
	beq	a0,zero,.L1920
.L1907:
	addi	a7,a5,1
	add	a3,a4,a5
	sw	a0,132(a1)
	slli	a5,a7,16
	sb	zero,4(a3)
	srai	a5,a5,16
	add	a2,a4,a2
	sh	a5,644(a4)
	lbu	a3,4(a2)
.L1908:
	addi	a3,a3,1
	sb	a3,4(a2)
	bgt	a5,zero,.L1909
.L1918:
	li	a0,0
	ret
.L1917:
	slli	a1,a5,2
	add	a1,a4,a1
	lw	a0,128(a1)
	li	a3,0
	lw	a0,8(a0)
	bne	a0,zero,.L1907
.L1920:
	lh	a5,644(a4)
	add	a2,a4,a2
	j	.L1908
.L1916:
	sh	zero,644(a0)
	sw	zero,0(a0)
	li	a0,0
	ret
.L1919:
	ret
	.size	sglib_rbtree_it_init_inorder, .-sglib_rbtree_it_init_inorder
	.align	2
	.globl	sglib_rbtree_it_init_postorder
	.type	sglib_rbtree_it_init_postorder, @function
sglib_rbtree_it_init_postorder:
	li	a7,2
	sw	zero,648(a0)
	sw	zero,652(a0)
	sh	a7,646(a0)
	mv	a4,a0
	beq	a1,zero,.L1939
	li	a3,1
	mv	a5,a3
	sh	a3,644(a0)
	mv	a6,a3
	sw	a1,132(a0)
	sb	zero,4(a0)
	sw	zero,0(a0)
	li	a3,0
	li	a2,0
.L1924:
	bgtu	a3,a6,.L1931
	slli	a1,a5,2
	add	a1,a4,a1
	lw	a0,128(a1)
	bne	a3,zero,.L1926
	lw	a0,8(a0)
	beq	a0,zero,.L1940
.L1928:
	addi	t1,a5,1
	add	a3,a4,a5
	sw	a0,132(a1)
	slli	a5,t1,16
	sb	zero,4(a3)
	srai	a5,a5,16
	add	a2,a4,a2
	sh	a5,644(a4)
	lbu	a3,4(a2)
.L1929:
	addi	a3,a3,1
	sb	a3,4(a2)
	ble	a5,zero,.L1941
.L1930:
	addi	a2,a5,-1
	add	a3,a4,a2
	lbu	a3,4(a3)
	bne	a3,a7,.L1924
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,128(a5)
	sw	a0,0(a4)
	bne	a0,zero,.L1942
.L1931:
	slli	a5,a2,16
	srai	a5,a5,16
	sh	a5,644(a4)
	bgt	a5,zero,.L1930
.L1941:
	li	a0,0
	ret
.L1926:
	lw	a0,12(a0)
	bne	a0,zero,.L1928
.L1940:
	lh	a5,644(a4)
	add	a2,a4,a2
	j	.L1929
.L1939:
	sh	zero,644(a0)
	sw	zero,0(a0)
	li	a0,0
	ret
.L1942:
	ret
	.size	sglib_rbtree_it_init_postorder, .-sglib_rbtree_it_init_postorder
	.align	2
	.globl	sglib_rbtree_it_init_on_equal
	.type	sglib_rbtree_it_init_on_equal, @function
sglib_rbtree_it_init_on_equal:
	addi	sp,sp,-16
	mv	a4,a3
	mv	a3,a2
	li	a2,1
	sw	ra,12(sp)
	call	sglib__rbtree_it_init
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	sglib_rbtree_it_init_on_equal, .-sglib_rbtree_it_init_on_equal
	.align	2
	.globl	sglib_rbtree_it_current
	.type	sglib_rbtree_it_current, @function
sglib_rbtree_it_current:
	lw	a0,0(a0)
	ret
	.size	sglib_rbtree_it_current, .-sglib_rbtree_it_current
	.align	2
	.globl	sglib_rbtree_it_next
	.type	sglib_rbtree_it_next, @function
sglib_rbtree_it_next:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	a0,12(sp)
	call	sglib__rbtree_it_compute_current_elem
	lw	a0,12(sp)
	lw	ra,28(sp)
	lw	a0,0(a0)
	addi	sp,sp,32
	jr	ra
	.size	sglib_rbtree_it_next, .-sglib_rbtree_it_next
	.align	2
	.globl	sglib___rbtree_consistency_check
	.type	sglib___rbtree_consistency_check, @function
sglib___rbtree_consistency_check:
	addi	sp,sp,-48
	li	a5,-1
	sw	ra,44(sp)
	sw	a5,28(sp)
	beq	a0,zero,.L1948
	lbu	a2,4(a0)
	li	a3,1
	lw	a4,8(a0)
	mv	a5,a0
	beq	a2,a3,.L2007
	beq	a4,zero,.L1960
	sw	s0,40(sp)
	lbu	a1,4(a4)
	lw	a6,8(a4)
	beq	a1,a3,.L2008
	addi	s0,sp,28
	sw	a0,4(sp)
	mv	a1,s0
	mv	a0,a6
	sw	a4,0(sp)
	call	sglib___rbtree_consistency_check_recursive.constprop.2
	lw	a4,0(sp)
	lw	a5,4(sp)
	li	a3,1
	lw	a4,12(a4)
	beq	a4,zero,.L2009
	lbu	a2,4(a4)
	lw	a6,8(a4)
	beq	a2,a3,.L2010
	beq	a6,zero,.L2011
	lbu	a2,4(a6)
	sw	a5,8(sp)
	sw	a6,4(sp)
	sw	a4,0(sp)
	lw	a0,8(a6)
	beq	a2,a3,.L2012
	li	a2,4
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a6,4(sp)
	mv	a1,s0
	li	a2,4
	lw	a0,12(a6)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,8(sp)
	lw	a4,0(sp)
.L1968:
	lw	a4,12(a4)
	beq	a4,zero,.L2013
.L1969:
	lbu	a2,4(a4)
	li	a3,1
	sw	a5,4(sp)
	sw	a4,0(sp)
	lw	a0,8(a4)
	beq	a2,a3,.L2014
	li	a2,4
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,0(sp)
	mv	a1,s0
	li	a2,4
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	j	.L1962
.L2007:
	sw	a0,0(sp)
	addi	a1,sp,28
	mv	a0,a4
	call	sglib___rbtree_consistency_check_recursive.constprop.0
	lw	a5,0(sp)
	addi	a1,sp,28
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive.constprop.0
.L1948:
	lw	ra,44(sp)
	addi	sp,sp,48
	jr	ra
.L2009:
	lw	a4,28(sp)
	blt	a4,zero,.L2015
.L2002:
	lw	s0,40(sp)
.L1953:
	lw	a5,12(a5)
	beq	a5,zero,.L1948
	lbu	a3,4(a5)
	li	a2,1
	lw	a4,8(a5)
	beq	a3,a2,.L2016
.L1972:
	mv	a0,a4
	addi	a1,sp,28
	sw	a5,0(sp)
	call	sglib___rbtree_consistency_check_recursive.constprop.2
	lw	a5,0(sp)
	addi	a1,sp,28
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive.constprop.2
	lw	ra,44(sp)
	addi	sp,sp,48
	jr	ra
.L2008:
	beq	a6,zero,.L2017
	lbu	a2,4(a6)
	lw	a0,8(a6)
	beq	a2,a1,.L2018
	addi	s0,sp,28
	mv	a1,s0
	li	a2,2
	sw	a5,8(sp)
	sw	a4,0(sp)
	sw	a6,4(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a6,4(sp)
	mv	a1,s0
	li	a2,2
	lw	a0,12(a6)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,8(sp)
	lw	a4,0(sp)
.L1959:
	lw	a4,12(a4)
	beq	a4,zero,.L2019
.L1957:
	lbu	a2,4(a4)
	li	a3,1
	lw	a0,8(a4)
	beq	a2,a3,.L2020
	sw	a5,4(sp)
	sw	a4,0(sp)
.L2006:
	li	a2,2
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,0(sp)
	mv	a1,s0
	li	a2,2
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
.L1962:
	lw	a5,12(a5)
	lw	s0,40(sp)
	beq	a5,zero,.L1948
	lbu	a3,4(a5)
	li	a2,1
	lw	a4,8(a5)
	bne	a3,a2,.L1972
.L2016:
	sw	s0,40(sp)
	beq	a4,zero,.L2021
	lbu	a2,4(a4)
	lw	a0,8(a4)
	beq	a2,a3,.L2022
	addi	s0,sp,28
	mv	a1,s0
	li	a2,2
	sw	a5,0(sp)
	sw	a4,4(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	mv	a1,s0
	li	a2,2
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,0(sp)
.L1976:
	lw	a5,12(a5)
	beq	a5,zero,.L2005
.L1978:
	lbu	a2,4(a5)
	li	a4,1
	lw	a0,8(a5)
	beq	a2,a4,.L2023
	mv	a1,s0
	li	a2,2
	sw	a5,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,0(sp)
	mv	a1,s0
	li	a2,2
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive
	lw	s0,40(sp)
	j	.L1948
.L2019:
	lw	a4,28(sp)
	lw	s0,40(sp)
	bge	a4,zero,.L1953
.L1960:
	li	a4,1
	sw	a4,28(sp)
	j	.L1953
.L2010:
	sw	a5,4(sp)
	sw	a4,0(sp)
	mv	a0,a6
	j	.L2006
.L2015:
	li	a4,2
	lw	s0,40(sp)
	sw	a4,28(sp)
	j	.L1953
.L2012:
	li	a2,3
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a6,4(sp)
	mv	a1,s0
	li	a2,3
	lw	a0,12(a6)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,0(sp)
	lw	a5,8(sp)
	j	.L1968
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
	j	.L1948
.L2011:
	lw	a3,28(sp)
	bge	a3,zero,.L1966
	li	a3,3
	sw	a3,28(sp)
.L1966:
	lw	a4,12(a4)
	bne	a4,zero,.L1969
	j	.L2002
.L2018:
	addi	s0,sp,28
	mv	a1,s0
	sw	a5,12(sp)
	sw	a4,4(sp)
	sw	a6,8(sp)
	sw	a2,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a6,8(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a6)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	lw	a5,12(sp)
	j	.L1959
.L2020:
	mv	a1,s0
	sw	a5,8(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,4(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,8(sp)
	j	.L1962
.L2023:
	mv	a1,s0
	sw	a5,4(sp)
	sw	a2,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive
	lw	s0,40(sp)
	j	.L1948
.L2022:
	addi	s0,sp,28
	mv	a1,s0
	sw	a5,4(sp)
	sw	a4,8(sp)
	sw	a2,0(sp)
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,8(sp)
	lw	a2,0(sp)
	mv	a1,s0
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	j	.L1976
.L2014:
	li	a2,3
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,0(sp)
	mv	a1,s0
	li	a2,3
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	j	.L1962
.L2013:
	lw	a4,28(sp)
	bge	a4,zero,.L2002
	li	a4,3
	lw	s0,40(sp)
	sw	a4,28(sp)
	j	.L1953
.L2017:
	lw	a4,12(a4)
	sw	a1,28(sp)
	addi	s0,sp,28
	bne	a4,zero,.L1957
	j	.L2002
	.size	sglib___rbtree_consistency_check, .-sglib___rbtree_consistency_check
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a5,%hi(the_list)
	lw	a4,%lo(the_list)(a5)
	beq	a4,zero,.L2025
.L2026:
	mv	a5,a4
	lw	a4,8(a4)
	bne	a4,zero,.L2026
	lw	a3,0(a5)
	bne	a3,a4,.L2034
.L2047:
	lw	a5,4(a5)
	addi	a4,a4,1
	beq	a5,zero,.L2025
	lw	a3,0(a5)
	beq	a3,a4,.L2047
.L2034:
	li	a5,0
.L2024:
	mv	a0,a5
	ret
.L2025:
	lui	a5,%hi(.LANCHOR1)
	addi	t1,a5,%lo(.LANCHOR1)
	lui	a1,%hi(.LANCHOR0)
	li	a6,-858992640
	mv	a2,t1
	addi	a7,t1,400
	addi	a1,a1,%lo(.LANCHOR0)
	addi	a6,a6,-819
.L2031:
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
	bne	a5,zero,.L2029
	j	.L2024
.L2030:
	lw	a5,4(a5)
	beq	a5,zero,.L2024
.L2029:
	lw	a4,0(a5)
	bne	a3,a4,.L2030
	addi	a2,a2,4
	bne	a7,a2,.L2031
	li	a4,16384
	addi	a4,a4,-1334
	li	a5,0
	bne	a0,a4,.L2024
	lui	a4,%hi(heap_requested)
	lw	a4,%lo(heap_requested)(a4)
	lui	a2,%hi(heap_end)
	lui	a3,%hi(heap)
	lw	a2,%lo(heap_end)(a2)
	addi	a3,a3,%lo(heap)
	add	a4,a4,a3
	bltu	a2,a4,.L2024
	addi	a5,t1,401
	addi	a3,a1,400
	li	a4,0
	j	.L2033
.L2048:
	lbu	a4,0(a5)
	addi	a5,a5,1
.L2033:
	lbu	a2,0(a1)
	addi	a1,a1,1
	bne	a2,a4,.L2034
	bne	a3,a1,.L2048
	li	a5,1
	j	.L2024
	.size	verify_benchmark, .-verify_benchmark
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
	call	benchmark_body
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	addi	sp,sp,-16
	li	a0,29
	sw	ra,12(sp)
	call	benchmark_body
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
	call	benchmark_body
	call	benchmark
	sw	a0,12(sp)
	lw	a0,12(sp)
	call	verify_benchmark
	lw	ra,28(sp)
	xori	a0,a0,1
	addi	sp,sp,32
	jr	ra
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
