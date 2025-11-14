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
	.globl	rand_beebs
	.type	rand_beebs, @function
rand_beebs:
	lui	a4,%hi(seed)
	lw	a0,%lo(seed)(a4)
	li	a5,1103515648
	addi	a5,a5,-403
	mul	a0,a0,a5
	li	a5,12288
	addi	a5,a5,57
	add	a0,a0,a5
	slli	a0,a0,1
	srli	a0,a0,1
	sw	a0,%lo(seed)(a4)
	srli	a0,a0,16
	ret
	.size	rand_beebs, .-rand_beebs
	.align	2
	.globl	srand_beebs
	.type	srand_beebs, @function
srand_beebs:
	lui	a5,%hi(seed)
	sw	a0,%lo(seed)(a5)
	ret
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
	ret
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
	ret
	.size	check_heap_beebs, .-check_heap_beebs
	.align	2
	.globl	malloc_beebs
	.type	malloc_beebs, @function
malloc_beebs:
	mv	a5,a0
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
	ret
.L607:
	li	a1,4
	sub	a1,a1,a6
	add	a5,a5,a1
	add	a4,a4,a1
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a1,a4,.L608
.L603:
	li	a0,0
	ret
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
	li	a4,5
	bleu	a5,a4,.L619
	neg	a4,a0
	andi	a5,a4,3
	li	a3,0
	beq	a5,zero,.L613
	sb	zero,0(a0)
	andi	a4,a4,2
	li	a3,1
	beq	a4,zero,.L613
	sb	zero,1(a0)
	li	a4,3
	li	a3,2
	bne	a5,a4,.L613
	sb	zero,2(a0)
	mv	a3,a5
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
	bleu	a1,a4,.L609
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,2
	bleu	a1,a4,.L609
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,3
	bleu	a1,a4,.L609
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,4
	bleu	a1,a4,.L609
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a5,a5,5
	bleu	a1,a5,.L609
	add	a5,a0,a5
	sb	zero,0(a5)
	ret
.L610:
	li	a0,0
.L609:
	ret
.L635:
	li	a7,4
	sub	a6,a7,a6
	add	a4,a4,a6
	add	a5,a5,a6
	j	.L611
.L619:
	li	a5,0
	j	.L612
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
	li	a4,6
	bleu	a5,a4,.L647
	or	a3,a0,a2
	andi	a3,a3,3
	mv	a4,a2
	mv	a5,a0
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
	bleu	a1,a5,.L636
	add	a4,a0,a5
	lbu	a4,0(a4)
	add	a5,a2,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bleu	a1,a7,.L636
	add	a0,a0,a7
	lbu	a5,0(a0)
	add	a7,a2,a7
	sb	a5,0(a7)
.L636:
	mv	a0,a2
	ret
.L662:
	li	t1,4
	sub	a7,t1,a7
	add	a5,a5,a7
	add	a4,a4,a7
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a7,a4,.L663
.L637:
	li	a2,0
	mv	a0,a2
	ret
.L647:
	li	a5,0
.L644:
	add	a4,a0,a5
	lbu	a3,0(a4)
	add	a4,a2,a5
	addi	a5,a5,1
	sb	a3,0(a4)
	bgtu	a1,a5,.L644
	mv	a0,a2
	ret
	.size	realloc_beebs, .-realloc_beebs
	.align	2
	.globl	free_beebs
	.type	free_beebs, @function
free_beebs:
	ret
	.size	free_beebs, .-free_beebs
	.align	2
	.globl	memset
	.type	memset, @function
memset:
	beq	a2,zero,.L678
	addi	a5,a2,-1
	li	a4,5
	andi	a1,a1,0xff
	bleu	a5,a4,.L674
	neg	a4,a0
	andi	a5,a4,3
	li	a6,0
	beq	a5,zero,.L668
	sb	a1,0(a0)
	andi	a4,a4,2
	li	a6,1
	beq	a4,zero,.L668
	sb	a1,1(a0)
	li	a4,3
	li	a6,2
	bne	a5,a4,.L668
	sb	a1,2(a0)
	mv	a6,a5
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
	bleu	a2,a4,.L678
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,2
	bleu	a2,a4,.L678
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,3
	bleu	a2,a4,.L678
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,4
	bleu	a2,a4,.L678
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a5,a5,5
	bleu	a2,a5,.L678
	add	a5,a0,a5
	sb	a1,0(a5)
.L678:
	ret
.L674:
	li	a5,0
	j	.L667
	.size	memset, .-memset
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	beq	a2,zero,.L683
	addi	a5,a2,-1
	li	a4,6
	bleu	a5,a4,.L684
	or	a3,a0,a1
	andi	a3,a3,3
	mv	a4,a0
	mv	a5,a1
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
	bleu	a2,a5,.L683
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bleu	a2,a7,.L683
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	ret
.L684:
	add	a2,a1,a2
	mv	a5,a0
.L687:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L687
.L683:
	ret
	.size	memcpy, .-memcpy
	.align	2
	.globl	memcmp
	.type	memcmp, @function
memcmp:
	beq	a2,zero,.L704
	add	a2,a0,a2
	j	.L703
.L702:
	beq	a0,a2,.L704
.L703:
	lbu	a5,0(a0)
	lbu	a4,0(a1)
	addi	a0,a0,1
	addi	a1,a1,1
	beq	a5,a4,.L702
	sub	a0,a5,a4
	ret
.L704:
	li	a0,0
	ret
	.size	memcmp, .-memcmp
	.align	2
	.globl	memmove
	.type	memmove, @function
memmove:
	bgeu	a0,a1,.L707
	beq	a2,zero,.L708
	addi	a5,a2,-1
	li	a4,6
	bleu	a5,a4,.L709
	or	a3,a1,a0
	andi	a3,a3,3
	mv	a4,a0
	mv	a5,a1
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
	bleu	a2,a5,.L708
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bleu	a2,a7,.L708
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	ret
.L707:
	bgtu	a0,a1,.L730
.L708:
	ret
.L730:
	beq	a2,zero,.L708
	addi	a2,a2,-1
	add	a5,a1,a2
	lbu	a4,0(a5)
	add	a5,a0,a2
	sb	a4,0(a5)
	j	.L730
.L709:
	add	a2,a1,a2
	mv	a5,a0
.L712:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L712
	ret
	.size	memmove, .-memmove
	.align	2
	.globl	strlen
	.type	strlen, @function
strlen:
	lbu	a5,0(a0)
	beq	a5,zero,.L731
	li	a5,0
.L733:
	addi	a5,a5,1
	add	a4,a0,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L733
.L731:
	mv	a0,a5
	ret
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
	seqz	a1,a1
	neg	a1,a1
	and	a0,a0,a1
.L736:
	ret
	.size	strchr, .-strchr
	.align	2
	.globl	initialise_board
	.type	initialise_board, @function
initialise_board:
 #APP
# 15 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	li a0, 0
# 0 "" 2
 #NO_APP
	ret
	.size	initialise_board, .-initialise_board
	.align	2
	.globl	start_trigger
	.type	start_trigger, @function
start_trigger:
 #APP
# 21 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	li a0, 0
# 0 "" 2
 #NO_APP
	ret
	.size	start_trigger, .-start_trigger
	.align	2
	.globl	stop_trigger
	.type	stop_trigger, @function
stop_trigger:
 #APP
# 27 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	li a0, 0
# 0 "" 2
 #NO_APP
	ret
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
	ret
.L753:
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
	ret
.L760:
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
	ret
.L767:
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
	beq	a6,zero,.L769
	lw	a3,0(a1)
	mv	a5,a6
	j	.L770
.L772:
	lw	a5,8(a5)
	beq	a5,zero,.L771
.L770:
	lw	a4,0(a5)
	bne	a4,a3,.L772
	sw	a5,0(a2)
	li	a0,0
	ret
.L771:
	lw	a5,4(a6)
	bne	a5,zero,.L780
	j	.L769
.L774:
	lw	a5,4(a5)
	beq	a5,zero,.L769
.L780:
	lw	a4,0(a5)
	bne	a3,a4,.L774
	sw	a5,0(a2)
	li	a0,0
	ret
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
	seqz	a0,a0
	ret
.L791:
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
	beq	a6,zero,.L793
	lw	a3,0(a1)
	mv	a5,a6
	j	.L794
.L796:
	lw	a5,8(a5)
	beq	a5,zero,.L795
.L794:
	lw	a4,0(a5)
	bne	a4,a3,.L796
	sw	a5,0(a2)
	li	a0,0
	ret
.L795:
	lw	a5,4(a6)
	bne	a5,zero,.L804
	j	.L793
.L798:
	lw	a5,4(a5)
	beq	a5,zero,.L793
.L804:
	lw	a4,0(a5)
	bne	a3,a4,.L798
	sw	a5,0(a2)
	li	a0,0
	ret
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
	seqz	a0,a0
	ret
.L815:
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
	beq	a6,zero,.L817
	lw	a3,0(a1)
	mv	a5,a6
	j	.L818
.L820:
	lw	a5,8(a5)
	beq	a5,zero,.L819
.L818:
	lw	a4,0(a5)
	bne	a4,a3,.L820
	sw	a5,0(a2)
	li	a0,0
	ret
.L819:
	lw	a5,4(a6)
	bne	a5,zero,.L828
	j	.L817
.L822:
	lw	a5,4(a5)
	beq	a5,zero,.L817
.L828:
	lw	a4,0(a5)
	bne	a3,a4,.L822
	sw	a5,0(a2)
	li	a0,0
	ret
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
	seqz	a0,a0
	ret
.L839:
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
	beq	a5,zero,.L850
	beq	a1,zero,.L840
.L843:
	mv	a4,a5
	lw	a5,4(a5)
	bne	a5,zero,.L843
	sw	zero,4(a1)
	sw	a4,8(a1)
	sw	a1,4(a4)
	lw	a5,4(a1)
	beq	a5,zero,.L840
	sw	a1,8(a5)
.L840:
	ret
.L850:
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
	ret
.L868:
	beq	a5,zero,.L869
	mv	a3,a5
	beq	a4,zero,.L857
	sw	a5,8(a4)
	lw	a5,8(a1)
	j	.L856
.L869:
	mv	a3,a4
	bne	a4,zero,.L854
	j	.L855
	.size	sglib_dllist_delete, .-sglib_dllist_delete
	.align	2
	.globl	sglib_dllist_delete_if_member
	.type	sglib_dllist_delete_if_member, @function
sglib_dllist_delete_if_member:
	lw	a6,0(a0)
	beq	a6,zero,.L877
	lw	a3,0(a1)
	mv	a5,a6
	j	.L872
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
	snez	a0,a0
	ret
.L900:
	beq	a4,zero,.L901
	mv	a1,a4
	beq	a3,zero,.L884
	sw	a4,8(a3)
	lw	a4,8(a5)
	j	.L883
.L874:
	lw	a5,4(a6)
	bne	a5,zero,.L886
	j	.L877
.L878:
	lw	a5,4(a5)
	beq	a5,zero,.L877
.L886:
	lw	a4,0(a5)
	bne	a3,a4,.L878
	j	.L876
.L901:
	mv	a1,a3
	bne	a3,zero,.L881
	j	.L882
.L877:
	sw	zero,0(a2)
	li	a0,0
	ret
	.size	sglib_dllist_delete_if_member, .-sglib_dllist_delete_if_member
	.align	2
	.globl	sglib_dllist_is_member
	.type	sglib_dllist_is_member, @function
sglib_dllist_is_member:
	mv	a5,a0
	beq	a0,a1,.L912
	beq	a0,zero,.L912
.L904:
	lw	a5,8(a5)
	snez	a4,a5
	beq	a1,a5,.L903
	bne	a4,zero,.L904
.L903:
	bne	a5,zero,.L913
	beq	a0,zero,.L913
	lw	a5,4(a0)
	snez	a0,a5
	beq	a1,a5,.L902
.L937:
	beq	a0,zero,.L902
	lw	a5,4(a5)
	snez	a0,a5
	bne	a1,a5,.L937
.L902:
	ret
.L913:
	mv	a0,a4
	ret
.L912:
	snez	a4,a0
	j	.L903
	.size	sglib_dllist_is_member, .-sglib_dllist_is_member
	.align	2
	.globl	sglib_dllist_find_member
	.type	sglib_dllist_find_member, @function
sglib_dllist_find_member:
	beq	a0,zero,.L945
	lw	a3,0(a1)
	mv	a5,a0
	j	.L940
.L942:
	lw	a5,8(a5)
	beq	a5,zero,.L941
.L940:
	lw	a4,0(a5)
	bne	a4,a3,.L942
.L938:
	mv	a0,a5
	ret
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
	mv	a0,a5
	ret
.L945:
	li	a5,0
	j	.L938
	.size	sglib_dllist_find_member, .-sglib_dllist_find_member
	.align	2
	.globl	sglib_dllist_get_first
	.type	sglib_dllist_get_first, @function
sglib_dllist_get_first:
	mv	a5,a0
	beq	a0,zero,.L954
.L953:
	mv	a0,a5
	lw	a5,8(a5)
	bne	a5,zero,.L953
	ret
.L954:
	li	a0,0
	ret
	.size	sglib_dllist_get_first, .-sglib_dllist_get_first
	.align	2
	.globl	sglib_dllist_get_last
	.type	sglib_dllist_get_last, @function
sglib_dllist_get_last:
	mv	a5,a0
	beq	a0,zero,.L959
.L958:
	mv	a0,a5
	lw	a5,4(a5)
	bne	a5,zero,.L958
	ret
.L959:
	li	a0,0
	ret
	.size	sglib_dllist_get_last, .-sglib_dllist_get_last
	.align	2
	.globl	sglib_dllist_sort
	.type	sglib_dllist_sort, @function
sglib_dllist_sort:
	lw	a5,0(a0)
	beq	a5,zero,.L1021
	addi	sp,sp,-16
.L963:
	mv	a1,a5
	lw	a5,8(a5)
	bne	a5,zero,.L963
	li	a6,1
	mv	t3,a6
.L985:
	sw	zero,12(sp)
	li	t1,0
	addi	a3,sp,12
.L964:
	mv	a4,a1
	li	a2,1
	ble	a6,t3,.L1024
.L965:
	lw	a4,4(a4)
	addi	a2,a2,1
	slt	a5,a2,a6
	snez	a7,a4
	and	a5,a5,a7
	bne	a5,zero,.L965
	beq	a4,zero,.L1025
	lw	a5,4(a4)
	sw	zero,4(a4)
	beq	a5,zero,.L992
	mv	a4,a5
	li	a2,1
.L970:
	addi	a2,a2,1
	lw	a4,4(a4)
	bge	a2,a6,.L972
	bne	a4,zero,.L970
.L972:
	li	a7,0
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
	mv	a5,a1
	mv	a1,a7
.L981:
	mv	a3,a5
	lw	a5,4(a5)
	bne	a5,zero,.L981
	addi	a3,a3,4
	li	t1,1
	bne	a7,zero,.L964
	lw	a1,12(sp)
	slli	a6,a6,1
	bne	a1,zero,.L985
.L984:
	sw	a1,0(a0)
	addi	sp,sp,16
	jr	ra
.L1026:
	sw	a1,0(a3)
	lw	a2,4(a1)
	addi	a3,a1,4
	beq	a2,zero,.L1027
	mv	a1,a2
	lw	a2,0(a2)
	j	.L980
.L1027:
	sw	a5,4(a1)
	mv	a1,a7
	j	.L981
.L1024:
	lw	a4,4(a1)
	sw	zero,4(a1)
	mv	a5,a4
	beq	a4,zero,.L1028
	lw	a7,4(a4)
	sw	zero,4(a4)
	beq	a4,zero,.L975
	lw	a2,0(a1)
	j	.L1023
.L1025:
	sw	a1,0(a3)
	lw	a1,12(sp)
	beq	t1,zero,.L1029
	slli	a6,a6,1
	bne	a1,zero,.L985
	j	.L984
.L1028:
	bne	a4,zero,.L1030
.L992:
	li	a7,0
	j	.L975
.L1029:
	beq	a1,zero,.L984
	mv	a5,a1
.L988:
	sw	a4,8(a5)
	mv	a4,a5
	lw	a5,4(a5)
	bne	a5,zero,.L988
	sw	a1,0(a0)
	addi	sp,sp,16
	jr	ra
.L1021:
	ret
.L1030:
	lw	a2,0(a1)
	li	a7,0
	j	.L1023
	.size	sglib_dllist_sort, .-sglib_dllist_sort
	.align	2
	.globl	sglib_dllist_len
	.type	sglib_dllist_len, @function
sglib_dllist_len:
	li	a4,0
	beq	a0,zero,.L1031
	mv	a5,a0
	li	a4,0
.L1033:
	lw	a5,8(a5)
	addi	a4,a4,1
	bne	a5,zero,.L1033
	lw	a5,4(a0)
	beq	a5,zero,.L1031
	li	a3,0
.L1035:
	lw	a5,4(a5)
	addi	a3,a3,1
	bne	a5,zero,.L1035
	add	a4,a4,a3
.L1031:
	mv	a0,a4
	ret
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
	mv	a3,a5
	lw	a5,8(a5)
	sw	a2,8(a3)
	sw	a5,4(a3)
	bne	a5,zero,.L1045
.L1056:
	beq	a4,zero,.L1042
.L1047:
	lw	a3,8(a4)
	mv	a5,a4
	lw	a4,4(a4)
	sw	a3,4(a5)
	sw	a4,8(a5)
	bne	a4,zero,.L1047
.L1042:
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
	beq	s1,zero,.L1059
	sw	s3,12(sp)
	beq	s0,zero,.L1085
	lw	s3,16(a0)
	j	.L1062
.L1064:
	lw	s0,8(s0)
	beq	s0,zero,.L1063
.L1062:
	mv	a1,s0
	mv	a0,s3
	jalr	s1
	bne	a0,zero,.L1064
	lw	s3,12(sp)
.L1072:
	lw	a5,8(s0)
	sw	a5,4(s2)
.L1065:
	sw	s0,0(s2)
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	jr	ra
.L1059:
	bne	s0,zero,.L1072
	lw	s0,8(s2)
	sw	zero,8(s2)
	bne	s0,zero,.L1069
	j	.L1065
.L1063:
	lw	s1,12(s2)
	lw	s0,8(s2)
	sw	zero,8(s2)
	beq	s1,zero,.L1086
	beq	s0,zero,.L1084
.L1087:
	lw	s3,16(s2)
	j	.L1066
.L1068:
	lw	s0,4(s0)
	beq	s0,zero,.L1084
.L1066:
	mv	a1,s3
	mv	a0,s0
	jalr	s1
	bne	a0,zero,.L1068
	lw	s3,12(sp)
.L1069:
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
.L1086:
	lw	s3,12(sp)
	bne	s0,zero,.L1069
	j	.L1065
.L1084:
	lw	s3,12(sp)
	lw	ra,28(sp)
	sw	s0,0(s2)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	jr	ra
.L1085:
	lw	s0,8(a0)
	sw	zero,8(a0)
	bne	s0,zero,.L1087
	j	.L1084
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
	beq	a1,zero,.L1095
	lw	a5,4(a1)
	sw	a5,8(a0)
.L1095:
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
	beq	a5,a1,.L1102
.L1115:
	beq	a0,zero,.L1102
	lw	a5,4(a5)
	snez	a0,a5
	bne	a1,a5,.L1115
.L1102:
	ret
	.size	sglib_ilist_is_member, .-sglib_ilist_is_member
	.align	2
	.globl	sglib_ilist_find_member
	.type	sglib_ilist_find_member, @function
sglib_ilist_find_member:
	beq	a0,zero,.L1116
	lw	a4,0(a1)
	j	.L1118
.L1119:
	lw	a0,4(a0)
	beq	a0,zero,.L1116
.L1118:
	lw	a5,0(a0)
	bne	a5,a4,.L1119
.L1116:
	ret
	.size	sglib_ilist_find_member, .-sglib_ilist_find_member
	.align	2
	.globl	sglib_ilist_add_if_not_member
	.type	sglib_ilist_add_if_not_member, @function
sglib_ilist_add_if_not_member:
	lw	a5,0(a0)
	beq	a5,zero,.L1125
	lw	a3,0(a1)
	j	.L1126
.L1127:
	lw	a5,4(a5)
	beq	a5,zero,.L1125
.L1126:
	lw	a4,0(a5)
	bne	a4,a3,.L1127
	sw	a5,0(a2)
	li	a0,0
	ret
.L1125:
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
	beq	a5,zero,.L1143
.L1139:
	mv	a4,a5
	lw	a5,4(a5)
	bne	a5,zero,.L1139
	sw	a1,4(a4)
	ret
.L1143:
	sw	a1,0(a0)
	ret
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
	ret
	.size	sglib_ilist_delete, .-sglib_ilist_delete
	.align	2
	.globl	sglib_ilist_delete_if_member
	.type	sglib_ilist_delete_if_member, @function
sglib_ilist_delete_if_member:
	lw	a5,0(a0)
	beq	a5,zero,.L1158
	lw	a3,0(a1)
	j	.L1156
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
	snez	a0,a0
	ret
.L1158:
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
.L1184:
	sw	zero,12(sp)
	beq	a1,zero,.L1165
.L1187:
	li	t1,0
	addi	a3,sp,12
.L1164:
	mv	a4,a1
	li	a2,1
	ble	a6,t3,.L1210
.L1166:
	lw	a4,4(a4)
	addi	a2,a2,1
	slt	a5,a2,a6
	snez	a7,a4
	and	a5,a5,a7
	bne	a5,zero,.L1166
	beq	a4,zero,.L1211
	lw	a5,4(a4)
	sw	zero,4(a4)
	beq	a5,zero,.L1189
	mv	a4,a5
	li	a2,1
.L1170:
	addi	a2,a2,1
	lw	a4,4(a4)
	bge	a2,a6,.L1172
	bne	a4,zero,.L1170
.L1172:
	li	a7,0
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
	mv	a5,a1
	mv	a1,a7
.L1181:
	mv	a3,a5
	lw	a5,4(a5)
	bne	a5,zero,.L1181
	addi	a3,a3,4
	li	t1,1
	bne	a7,zero,.L1164
	lw	a1,12(sp)
	sw	zero,12(sp)
	slli	a6,a6,1
	bne	a1,zero,.L1187
.L1165:
	sw	a1,0(a0)
	addi	sp,sp,16
	jr	ra
.L1212:
	sw	a1,0(a3)
	lw	a2,4(a1)
	addi	a3,a1,4
	beq	a2,zero,.L1213
	mv	a1,a2
	lw	a2,0(a2)
	j	.L1180
.L1213:
	sw	a5,4(a1)
	mv	a1,a7
	j	.L1181
.L1210:
	lw	a4,4(a1)
	sw	zero,4(a1)
	mv	a5,a4
	beq	a4,zero,.L1214
	lw	a7,4(a4)
	sw	zero,4(a4)
	beq	a4,zero,.L1175
	lw	a2,0(a1)
	j	.L1209
.L1211:
	sw	a1,0(a3)
	lw	a1,12(sp)
	beq	t1,zero,.L1165
	slli	a6,a6,1
	j	.L1184
.L1214:
	bne	a4,zero,.L1215
.L1189:
	li	a7,0
	j	.L1175
.L1215:
	lw	a2,0(a1)
	li	a7,0
	j	.L1209
	.size	sglib_ilist_sort, .-sglib_ilist_sort
	.align	2
	.globl	sglib_ilist_len
	.type	sglib_ilist_len, @function
sglib_ilist_len:
	mv	a5,a0
	li	a0,0
	beq	a5,zero,.L1219
.L1218:
	lw	a5,4(a5)
	addi	a0,a0,1
	bne	a5,zero,.L1218
	ret
.L1219:
	ret
	.size	sglib_ilist_len, .-sglib_ilist_len
	.align	2
	.globl	sglib_ilist_reverse
	.type	sglib_ilist_reverse, @function
sglib_ilist_reverse:
	lw	a5,0(a0)
	beq	a5,zero,.L1222
	li	a3,0
	j	.L1223
.L1224:
	mv	a5,a4
.L1223:
	lw	a4,4(a5)
	sw	a3,4(a5)
	mv	a3,a5
	bne	a4,zero,.L1224
.L1222:
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
	beq	a2,zero,.L1229
	sw	s1,20(sp)
	sw	s2,16(sp)
	mv	s1,a2
	mv	s2,a3
	bne	a1,zero,.L1230
	j	.L1241
.L1233:
	lw	s0,4(s0)
	beq	s0,zero,.L1232
.L1230:
	mv	a1,s2
	mv	a0,s0
	jalr	s1
	bne	a0,zero,.L1233
	lw	s1,20(sp)
	lw	s2,16(sp)
	sw	s0,0(s3)
.L1235:
	lw	a5,4(s0)
	sw	a5,4(s3)
.L1236:
	mv	a0,s0
.L1228:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
.L1229:
	sw	a1,0(a0)
	bne	a1,zero,.L1235
	li	s0,0
	j	.L1236
.L1232:
	lw	s1,20(sp)
	lw	s2,16(sp)
	sw	zero,0(s3)
	li	s0,0
	j	.L1236
.L1241:
	sw	zero,0(a0)
	lw	s1,20(sp)
	lw	s2,16(sp)
	li	a0,0
	j	.L1228
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
	beq	s1,zero,.L1249
	beq	s0,zero,.L1250
	sw	s2,16(sp)
	lw	s2,12(a0)
	j	.L1251
.L1254:
	lw	s0,4(s0)
	beq	s0,zero,.L1253
.L1251:
	mv	a1,s2
	mv	a0,s0
	jalr	s1
	bne	a0,zero,.L1254
	lw	s2,16(sp)
	sw	s0,0(s3)
.L1256:
	lw	a5,4(s0)
	sw	a5,4(s3)
.L1248:
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
.L1249:
	sw	s0,0(a0)
	bne	s0,zero,.L1256
	li	s0,0
.L1261:
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
.L1253:
	lw	s2,16(sp)
	sw	zero,0(s3)
	li	s0,0
	j	.L1261
.L1250:
	sw	zero,0(a0)
	j	.L1248
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
	bne	a5,zero,.L1267
	j	.L1268
.L1269:
	lw	a5,4(a5)
	beq	a5,zero,.L1268
.L1267:
	lw	a4,0(a5)
	bne	a4,a3,.L1269
	sw	a5,0(a2)
	li	a0,0
	ret
.L1268:
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
	bne	a5,zero,.L1288
	j	.L1290
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
	snez	a0,a0
	ret
.L1290:
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
	beq	a5,a1,.L1297
.L1310:
	beq	a0,zero,.L1297
	lw	a5,4(a5)
	snez	a0,a5
	bne	a1,a5,.L1310
.L1297:
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
	bne	a0,zero,.L1312
	ret
.L1314:
	lw	a0,4(a0)
	beq	a0,zero,.L1311
.L1312:
	lw	a5,0(a0)
	bne	a5,a4,.L1314
.L1311:
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
	beq	s2,zero,.L1321
	beq	s0,zero,.L1325
	lw	s3,12(a0)
	j	.L1323
.L1326:
	lw	s0,4(s0)
	beq	s0,zero,.L1325
.L1323:
	mv	a1,s3
	mv	a0,s0
	jalr	s2
	bne	a0,zero,.L1326
	sw	s0,0(s1)
.L1338:
	lw	a5,4(s0)
	sw	a5,4(s1)
.L1320:
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
.L1321:
	sw	s0,0(a0)
	bne	s0,zero,.L1338
	sw	s4,8(sp)
	j	.L1324
.L1325:
	sw	s4,8(sp)
	sw	zero,0(s1)
.L1324:
	lw	a5,20(s1)
	li	s4,19
.L1329:
	addi	a5,a5,1
	sw	a5,20(s1)
	bgt	a5,s4,.L1350
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
	j	.L1351
.L1334:
	lw	s0,4(s0)
	beq	s0,zero,.L1333
.L1331:
	mv	a1,s3
	mv	a0,s0
	jalr	s2
	bne	a0,zero,.L1334
	sw	s0,0(s1)
.L1337:
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
.L1330:
	sw	s0,0(s1)
	bne	s0,zero,.L1337
	j	.L1329
.L1333:
	lw	a5,20(s1)
	sw	zero,0(s1)
	addi	a5,a5,1
	sw	a5,20(s1)
	ble	a5,s4,.L1336
.L1350:
	lw	s4,8(sp)
	li	s0,0
	j	.L1320
.L1351:
	sw	zero,0(s1)
	j	.L1329
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
	beq	a2,zero,.L1353
	sw	s1,20(sp)
	sw	s3,12(sp)
	mv	s1,a2
	mv	s3,a3
	bne	s0,zero,.L1354
	j	.L1356
.L1357:
	lw	s0,4(s0)
	beq	s0,zero,.L1356
.L1354:
	mv	a1,s3
	mv	a0,s0
	jalr	s1
	bne	a0,zero,.L1357
	lw	s1,20(sp)
	lw	s3,12(sp)
	sw	s0,0(s2)
.L1359:
	lw	a5,4(s0)
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	sw	a5,4(s2)
	lw	s2,16(sp)
	addi	sp,sp,32
	jr	ra
.L1353:
	sw	s0,0(a0)
	bne	s0,zero,.L1359
	j	.L1355
.L1356:
	lw	s1,20(sp)
	lw	s3,12(sp)
	sw	zero,0(s2)
.L1355:
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
	beq	a5,zero,.L1371
	lw	a4,4(a5)
	sw	a4,4(a0)
	mv	a0,a5
	ret
.L1371:
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
	beq	a5,zero,.L1490
	lw	a3,0(a1)
	lw	a4,0(a5)
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	ra,44(sp)
	sub	a4,a3,a4
	mv	s0,a0
	blt	a4,zero,.L1384
	bne	a4,zero,.L1430
	bleu	a5,a1,.L1385
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
	call	sglib___rbtree_delete_recursive
	bne	a0,zero,.L1505
.L1497:
	lw	s1,36(sp)
	lw	s2,32(sp)
.L1383:
	li	a0,0
.L1381:
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
.L1490:
	li	a0,0
	ret
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
	call	sglib___rbtree_delete_recursive
	bne	a0,zero,.L1506
.L1504:
	lw	s1,36(sp)
	j	.L1383
.L1388:
	bgtu	a1,a4,.L1429
	bne	a2,zero,.L1429
	lw	a3,8(a4)
	beq	a3,zero,.L1507
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
	beq	a0,zero,.L1504
	mv	a0,s1
	call	sglib___rbtree_fix_left_deletion_discrepancy
.L1402:
	beq	a0,zero,.L1504
.L1408:
	mv	a0,s0
	call	sglib___rbtree_fix_left_deletion_discrepancy
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
.L1429:
	addi	a0,a4,12
	call	sglib___rbtree_delete_recursive
	beq	a0,zero,.L1504
	mv	a0,s1
	call	sglib___rbtree_fix_right_deletion_discrepancy
	j	.L1402
.L1385:
	bne	a4,zero,.L1430
	bltu	a5,a1,.L1430
	lw	a4,8(a5)
	beq	a4,zero,.L1508
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
	beq	a0,zero,.L1383
	mv	a0,s0
	call	sglib___rbtree_fix_left_deletion_discrepancy
	j	.L1381
.L1392:
	bgtu	a1,a5,.L1428
	bne	a3,zero,.L1428
	lw	a3,8(a5)
	beq	a3,zero,.L1509
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
	beq	a0,zero,.L1497
.L1505:
	mv	a0,s2
	call	sglib___rbtree_fix_left_deletion_discrepancy
.L1394:
	beq	a0,zero,.L1497
.L1401:
	mv	a0,s1
	call	sglib___rbtree_fix_left_deletion_discrepancy
	lw	s2,32(sp)
	j	.L1402
.L1508:
	lw	a4,12(a5)
	beq	a4,zero,.L1510
	lbu	a5,4(a5)
	li	a0,0
	bne	a5,zero,.L1426
	lbu	a0,4(a4)
	seqz	a0,a0
.L1426:
	sb	zero,4(a4)
	sw	a4,0(s0)
	j	.L1381
.L1415:
	bne	a3,zero,.L1431
	bgtu	a1,a4,.L1431
	lw	a3,8(a4)
	beq	a3,zero,.L1511
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
	beq	a0,zero,.L1504
.L1506:
	mv	a0,s1
	call	sglib___rbtree_fix_left_deletion_discrepancy
.L1417:
	beq	a0,zero,.L1504
.L1423:
	mv	a0,s0
	call	sglib___rbtree_fix_right_deletion_discrepancy
	lw	s1,36(sp)
	j	.L1381
.L1428:
	addi	a0,a5,12
	call	sglib___rbtree_delete_recursive
	beq	a0,zero,.L1497
	mv	a0,s2
	call	sglib___rbtree_fix_right_deletion_discrepancy
	j	.L1394
.L1431:
	addi	a0,a4,12
	call	sglib___rbtree_delete_recursive
	beq	a0,zero,.L1504
	mv	a0,s1
	call	sglib___rbtree_fix_right_deletion_discrepancy
	j	.L1417
.L1507:
	lw	a3,12(a4)
	beq	a3,zero,.L1512
	lbu	a4,4(a4)
	bne	a4,zero,.L1407
	lbu	a4,4(a3)
	bne	a4,zero,.L1407
	sw	a3,8(a5)
	j	.L1408
.L1510:
	sw	zero,0(a0)
	lbu	a0,4(a5)
	seqz	a0,a0
	j	.L1381
.L1407:
	sb	zero,4(a3)
	lw	s1,36(sp)
	sw	a3,8(a5)
	j	.L1383
.L1509:
	lw	a3,12(a5)
	beq	a3,zero,.L1513
	lbu	a5,4(a5)
	bne	a5,zero,.L1400
	lbu	a5,4(a3)
	bne	a5,zero,.L1400
	sw	a3,8(a4)
	j	.L1401
.L1511:
	lw	a3,12(a4)
	beq	a3,zero,.L1514
	lbu	a4,4(a4)
	bne	a4,zero,.L1422
	lbu	a4,4(a3)
	bne	a4,zero,.L1422
	sw	a3,12(a5)
	j	.L1423
.L1512:
	sw	zero,8(a5)
	lbu	a0,4(a4)
	seqz	a0,a0
	j	.L1402
.L1400:
	sb	zero,4(a3)
	lw	s1,36(sp)
	lw	s2,32(sp)
	sw	a3,8(a4)
	j	.L1383
.L1422:
	sb	zero,4(a3)
	lw	s1,36(sp)
	sw	a3,12(a5)
	j	.L1383
.L1513:
	sw	zero,8(a4)
	lbu	a0,4(a5)
	seqz	a0,a0
	j	.L1394
.L1514:
	sw	zero,12(a5)
	lbu	a0,4(a4)
	seqz	a0,a0
	j	.L1417
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
	mv	a2,a0
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
	call	sglib___rbtree_add_recursive.constprop.0
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
	jr	ra
.L1621:
	sw	a1,0(a0)
	sb	zero,4(a1)
	ret
.L1622:
	li	a4,1
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
	li	a6,1
	beq	a0,a6,.L1625
.L1535:
	li	a4,1
	bne	a3,a4,.L1517
	lw	a0,8(a5)
	lw	a4,12(a5)
	beq	a0,zero,.L1538
	lbu	a6,4(a0)
	beq	a6,a3,.L1626
.L1538:
	beq	a4,zero,.L1517
	lbu	a3,4(a4)
	li	a0,1
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
	mv	a1,a4
	j	.L1517
.L1623:
	lw	a4,8(a5)
	lw	a3,8(a4)
	lw	a1,12(a4)
	lbu	a0,4(a3)
	beq	a1,zero,.L1525
	lbu	a6,4(a1)
	li	a7,1
	beq	a6,a7,.L1627
.L1525:
	li	a1,1
	bne	a0,a1,.L1521
	lw	a6,8(a3)
	lw	a1,12(a3)
	beq	a6,zero,.L1529
	lbu	a7,4(a6)
	beq	a7,a0,.L1628
.L1529:
	beq	a1,zero,.L1521
	lbu	a0,4(a1)
	li	a6,1
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
	j	.L1521
.L1519:
	addi	a0,a5,12
	sw	a2,8(sp)
	sw	a5,4(sp)
	call	sglib___rbtree_add_recursive.constprop.0
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
	li	a6,1
	beq	a0,a6,.L1629
.L1540:
	li	a4,1
	bne	a3,a4,.L1517
	lw	a0,12(a5)
	lw	a4,8(a5)
	beq	a0,zero,.L1544
	lbu	a6,4(a0)
	beq	a6,a3,.L1630
.L1544:
	beq	a4,zero,.L1517
	lbu	a3,4(a4)
	li	a0,1
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
	mv	a1,a4
	j	.L1517
.L1523:
	addi	a0,a4,12
	sw	a2,12(sp)
	sw	a5,8(sp)
	sw	a4,4(sp)
	call	sglib___rbtree_add_recursive.constprop.0
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
	li	a7,1
	beq	a6,a7,.L1631
.L1530:
	li	a1,1
	bne	a0,a1,.L1521
	lw	a6,12(a3)
	lw	a1,8(a3)
	beq	a6,zero,.L1533
	lbu	a7,4(a6)
	beq	a7,a0,.L1632
.L1533:
	beq	a1,zero,.L1521
	lbu	a0,4(a1)
	li	a6,1
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
	j	.L1521
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
	li	a0,1
	bne	a6,a0,.L1521
.L1532:
	sb	zero,4(a3)
	sb	zero,4(a1)
	li	a3,1
	sb	a3,4(a4)
	j	.L1521
.L1626:
	sw	a4,8(a1)
	sw	a1,12(a5)
	sw	a0,8(a5)
	sb	a3,4(a1)
	sb	zero,4(a5)
	sw	a5,0(a2)
	mv	a1,a5
	j	.L1517
.L1628:
	sw	a1,8(a4)
	sw	a6,8(a3)
	sw	a4,12(a3)
	sb	a0,4(a4)
	sb	zero,4(a3)
	sw	a3,8(a5)
	j	.L1521
.L1630:
	sw	a4,12(a1)
	sw	a1,8(a5)
	sw	a0,12(a5)
	sb	a3,4(a1)
	sb	zero,4(a5)
	sw	a5,0(a2)
	mv	a1,a5
	j	.L1517
.L1632:
	sw	a1,12(a4)
	sw	a6,12(a3)
	sw	a4,8(a3)
	sb	a0,4(a4)
	sb	zero,4(a3)
	sw	a3,8(a5)
	j	.L1521
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
	li	a3,1
	bne	a2,a3,.L1517
.L1542:
	sb	zero,4(a5)
	sb	zero,4(a4)
	li	a5,1
	sb	a5,4(a1)
	j	.L1517
.L1629:
	bne	a3,a0,.L1517
	lw	a2,12(a5)
	beq	a2,zero,.L1541
	lbu	a2,4(a2)
	beq	a2,a3,.L1542
.L1541:
	lw	a3,8(a5)
	bne	a3,zero,.L1620
	j	.L1517
.L1631:
	bne	a0,a6,.L1521
	lw	a6,12(a3)
	beq	a6,zero,.L1531
	lbu	a6,4(a6)
	beq	a6,a0,.L1532
.L1531:
	lw	a0,8(a3)
	bne	a0,zero,.L1618
	j	.L1521
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
	mv	s0,a0
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
	call	sglib___rbtree_delete_recursive
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
	jr	ra
.L1677:
	ret
.L1660:
	addi	a0,a5,12
	call	sglib___rbtree_delete_recursive
	bne	a0,zero,.L1655
	lw	a5,0(s0)
.L1684:
	bne	a5,zero,.L1639
	j	.L1633
.L1641:
	bne	a3,zero,.L1659
	bleu	a1,a4,.L1645
.L1659:
	addi	a0,a4,12
	call	sglib___rbtree_delete_recursive
	beq	a0,zero,.L1681
	mv	a0,s1
	call	sglib___rbtree_fix_right_deletion_discrepancy
.L1644:
	beq	a0,zero,.L1681
.L1651:
	mv	a0,s0
	call	sglib___rbtree_fix_left_deletion_discrepancy
	j	.L1681
.L1655:
	mv	a0,s0
	call	sglib___rbtree_fix_right_deletion_discrepancy
	lw	a5,0(s0)
	bne	a5,zero,.L1639
	j	.L1633
.L1637:
	bne	a4,zero,.L1660
	bgtu	a1,a5,.L1660
	lw	a4,8(a5)
	beq	a4,zero,.L1683
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
	beq	a0,zero,.L1639
	mv	a0,s0
	call	sglib___rbtree_fix_left_deletion_discrepancy
	lw	a5,0(s0)
	j	.L1684
.L1645:
	lw	a3,8(a4)
	beq	a3,zero,.L1685
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
	beq	a0,zero,.L1681
.L1652:
	mv	a0,s1
	call	sglib___rbtree_fix_left_deletion_discrepancy
	j	.L1644
.L1683:
	lw	a5,12(a5)
	beq	a5,zero,.L1686
	sb	zero,4(a5)
	sw	a5,0(a0)
	j	.L1639
.L1685:
	lw	a3,12(a4)
	beq	a3,zero,.L1687
	lbu	a4,4(a4)
	bne	a4,zero,.L1650
	lbu	a4,4(a3)
	bne	a4,zero,.L1650
	sw	a3,8(a5)
	j	.L1651
.L1686:
	sw	zero,0(a0)
	j	.L1633
.L1650:
	sb	zero,4(a3)
	sw	a3,8(a5)
	lw	a5,0(s0)
	lw	s1,36(sp)
	bne	a5,zero,.L1639
	j	.L1633
.L1687:
	sw	zero,8(a5)
	lbu	a0,4(a4)
	seqz	a0,a0
	j	.L1644
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
	ret
.L1698:
	lw	a0,8(a0)
	bne	a0,zero,.L1692
	ret
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
	ret
.L1702:
	bgtu	a1,a0,.L1708
	beq	a5,zero,.L1707
.L1708:
	lw	a0,12(a0)
	bne	a0,zero,.L1705
	ret
.L1707:
	li	a0,1
.L1699:
	ret
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
	li	a0,0
	ret
.L1732:
	lw	a4,8(a4)
	bne	a4,zero,.L1721
	j	.L1717
.L1720:
	addi	sp,sp,-32
	mv	a1,a4
	sw	a4,0(a2)
	sw	ra,28(sp)
	sw	a0,12(sp)
	call	sglib___rbtree_delete_recursive
	lw	a5,12(sp)
	lw	a5,0(a5)
	beq	a5,zero,.L1724
	sb	zero,4(a5)
.L1724:
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
	call	sglib___rbtree_add_recursive.constprop.0
	lw	a0,12(sp)
	li	a5,1
	lw	a4,0(a0)
	mv	a0,a5
	sb	zero,4(a4)
	lw	ra,28(sp)
	addi	sp,sp,32
	jr	ra
.L1747:
	lw	a4,8(a4)
	bne	a4,zero,.L1738
	j	.L1734
.L1737:
	sw	a4,0(a2)
	mv	a0,a5
	ret
	.size	sglib_rbtree_add_if_not_member, .-sglib_rbtree_add_if_not_member
	.align	2
	.globl	sglib_rbtree_len
	.type	sglib_rbtree_len, @function
sglib_rbtree_len:
	beq	a0,zero,.L1766
	addi	sp,sp,-640
	li	t3,1
	mv	a4,a0
	mv	a7,sp
	sub	t3,t3,sp
	li	a5,0
	li	a0,0
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
	mv	a3,a5
	addi	a2,a2,4
	addi	a5,a5,1
	bne	a4,zero,.L1751
	add	a3,t3,a3
	slli	a1,a3,2
	add	a1,t4,a1
	add	a2,a7,a3
	j	.L1754
.L1768:
	addi	a2,a2,-1
	addi	a1,a1,-4
	bne	a4,zero,.L1767
.L1754:
	lbu	a4,-1(a2)
	mv	a5,a3
	addi	a3,a3,-1
	addi	a6,a4,1
	sb	a6,-1(a2)
	seqz	a4,a4
	add	a0,a0,a4
	lw	a4,0(a1)
	bgt	a3,zero,.L1768
	slli	a3,a3,2
	add	a3,t1,a3
	sw	zero,0(a3)
	bne	a4,zero,.L1749
	addi	sp,sp,640
	jr	ra
.L1767:
	slli	a3,a3,2
	add	a3,t1,a3
	sw	zero,0(a3)
	j	.L1749
.L1766:
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
	ble	a5,zero,.L1769
	sw	s1,36(sp)
	sw	s7,12(sp)
	sw	s0,40(sp)
	sw	s3,28(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	mv	s1,a0
	addi	a3,a5,-1
	li	s7,1
.L1770:
	add	s3,s1,a3
	lbu	a4,4(s3)
	mv	s5,a5
	bleu	a4,s7,.L1771
	slli	a5,a3,16
	srai	a5,a5,16
	sh	a5,644(s1)
.L1772:
	ble	a5,zero,.L1805
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
	jr	ra
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
	mv	a1,s0
	mv	a0,s2
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
	j	.L1772
.L1809:
	lw	s0,8(s0)
	bne	s0,zero,.L1777
	j	.L1784
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
	j	.L1807
.L1773:
	lw	s0,12(a5)
	j	.L1774
.L1782:
	lh	a5,644(s1)
	j	.L1788
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
	j	.L1784
.L1806:
	lh	a5,644(s1)
	j	.L1778
	.size	sglib__rbtree_it_compute_current_elem, .-sglib__rbtree_it_compute_current_elem
	.align	2
	.type	benchmark_body, @function
benchmark_body:
	addi	sp,sp,-1152
	sw	ra,1148(sp)
	ble	a0,zero,.L1813
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
.L1812:
	mv	a2,s2
	mv	a4,s2
	mv	a5,s1
.L1814:
	lw	a3,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a5)
	bne	s10,a5,.L1814
	li	a5,100
	sw	zero,28(sp)
	sw	a5,432(sp)
	mv	a7,a5
	li	a6,0
	li	t1,0
	li	t3,2
	addi	t4,sp,432
.L1836:
	sub	a5,a7,a6
	mv	t5,t1
.L1969:
	ble	a5,t3,.L1815
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
	j	.L1830
.L1819:
	addi	a5,a5,1
	addi	a4,a4,4
	bgt	a5,a3,.L1818
.L1830:
	lw	t0,0(a4)
	ble	t0,a0,.L1819
	bgt	a5,a3,.L1818
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
	mv	a1,a3
.L1829:
	ble	a5,s5,.L1817
	sub	a4,a7,a1
	ble	a4,s5,.L1902
	addi	a4,a4,-1
	addi	a1,a1,1
	ble	a4,a5,.L1832
	slli	a4,t5,2
	add	a0,t4,a4
	add	a4,s0,a4
	sw	a7,0(a0)
	sw	a1,0(a4)
	addi	t5,t5,1
	mv	a7,a3
	bgt	a5,t3,.L1974
.L1815:
	beq	a5,t3,.L1975
.L1834:
	ble	t5,zero,.L1835
.L1977:
	addi	t1,t5,-1
	slli	a5,t1,2
	add	a4,s0,a5
	add	a5,t4,a5
	lw	a6,0(a4)
	lw	a7,0(a5)
	j	.L1836
.L1818:
	add	a4,s1,t1
	lw	a5,0(a4)
	add	a1,s1,a1
	sw	a0,0(a4)
	sw	a5,0(a1)
	mv	a1,a3
	sub	a5,a3,a6
	j	.L1829
.L1973:
	bgt	a5,a3,.L1822
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
	bgt	a3,a4,.L1826
	mv	a4,a5
.L1826:
	mv	a5,a4
	j	.L1816
.L1976:
	addi	a3,a3,-1
	ble	a3,a4,.L1958
	slli	t1,a3,2
	mv	a5,a4
	j	.L1816
.L1900:
	mv	a1,a3
	mv	a3,a5
	sub	a5,a3,a6
	j	.L1829
.L1972:
	mv	a1,a3
.L1817:
	addi	a6,a1,1
	sub	a5,a7,a6
	j	.L1969
.L1902:
	mv	a7,a3
	j	.L1969
.L1832:
	slli	a5,t5,2
	add	a4,s0,a5
	add	a5,t4,a5
	sw	a6,0(a4)
	sw	a3,0(a5)
	addi	t5,t5,1
	sub	a5,a7,a1
	mv	a6,a1
	j	.L1969
.L1975:
	addi	a5,a7,-1
	slli	a5,a5,2
	slli	a4,a6,2
	add	a5,s1,a5
	add	a4,s1,a4
	lw	a1,0(a5)
	lw	a3,0(a4)
	ble	a3,a1,.L1834
	sw	a1,0(a4)
	sw	a3,0(a5)
	bgt	t5,zero,.L1977
.L1835:
	lw	a5,4(sp)
	lw	s11,4(sp)
	sw	zero,%lo(the_list)(s9)
	sw	a5,%lo(heap_ptr)(s4)
	lui	a5,%hi(heap_end)
	sw	s8,%lo(heap_end)(a5)
	mv	a4,s2
	li	s7,0
	li	a3,0
	j	.L1840
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
	li	a3,1
	beq	s6,a4,.L1978
.L1840:
	mv	a5,s11
	addi	s11,s11,12
	addi	s7,s7,12
	bgtu	s11,s8,.L1837
	lw	a1,0(a4)
	lw	a3,%lo(the_list)(s9)
	sw	a1,0(a5)
	bne	a3,zero,.L1838
	sw	a5,%lo(the_list)(s9)
	sw	zero,8(a5)
	sw	zero,4(a5)
	addi	a4,a4,4
	li	a3,1
	bne	s6,a4,.L1840
.L1978:
	addi	a0,s9,%lo(the_list)
	sw	a2,12(sp)
	sw	s7,%lo(heap_requested)(s3)
	sw	s11,%lo(heap_ptr)(s4)
	call	sglib_dllist_sort
	lw	a5,%lo(the_list)(s9)
	sw	zero,20(sp)
	lw	a2,12(sp)
	beq	a5,zero,.L1844
.L1841:
	mv	a4,a5
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
	mv	a5,s10
.L1842:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L1842
	li	t1,-858992640
	addi	t1,t1,-819
	mv	a0,s2
	li	a7,0
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
	mv	a5,a6
	bne	a6,zero,.L1845
	j	.L1846
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
	li	a5,0
.L1853:
	li	a1,19
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
	bgt	a5,a1,.L1856
	lw	a3,0(a4)
	addi	a4,a4,4
	beq	a3,zero,.L1859
	lw	a4,4(a3)
	j	.L1860
.L1846:
	addi	a5,s11,8
	addi	s7,s7,8
	bgtu	a5,s8,.L1849
	sw	a1,0(s11)
	sw	a6,4(s11)
	sw	s11,0(a3)
	addi	a0,a0,4
	li	a7,1
	mv	s11,a5
	bne	s6,a0,.L1850
	j	.L1980
.L1856:
	li	a7,680390656
	addi	a7,a7,203
	mv	a4,s2
	li	a5,0
	li	t1,101
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
	li	a3,680390656
	addi	a3,a3,203
	li	a4,0
	li	a6,101
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
	mv	a7,s0
	li	a6,0
	li	a1,14
	li	t3,99
.L1864:
	sw	a1,0(a7)
	mv	a5,a6
	bne	a6,zero,.L1866
	j	.L1868
.L1871:
	slli	a5,a5,2
	add	a5,s0,a5
	sw	a1,0(a4)
	sw	a0,0(a5)
	beq	a3,zero,.L1870
	lw	a1,0(a4)
	mv	a5,a3
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
	j	.L1864
.L1981:
	addi	a7,s0,396
	li	a0,100
	j	.L1877
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
	li	a5,0
.L1876:
	slli	a4,a5,1
	addi	a3,a4,1
	ble	a0,a3,.L1872
	slli	a1,a3,2
	add	a1,s0,a1
	lw	a1,0(a1)
	addi	a4,a4,2
	blt	a6,a1,.L1873
	ble	a0,a4,.L1872
	slli	a3,a4,2
	add	a3,s0,a3
	lw	a1,0(a3)
	bgt	a6,a1,.L1872
	bge	a6,a1,.L1872
	mv	a3,a4
.L1875:
	beq	a5,a3,.L1872
	slli	a5,a5,2
	add	a5,s0,a5
	slli	a4,a3,2
	sw	a1,0(a5)
	add	a5,s0,a4
	sw	a6,0(a5)
	mv	a5,a3
	j	.L1876
.L1873:
	ble	a0,a4,.L1875
	slli	t1,a4,2
	add	t1,s0,t1
	lw	t1,0(t1)
	bgt	a1,t1,.L1875
	bge	a1,t1,.L1875
	mv	a1,t1
	mv	a3,a4
	j	.L1875
.L1982:
	sw	zero,24(sp)
	li	a3,14
	li	s11,4
	mv	s7,a2
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
	bgtu	a2,s8,.L1884
	sw	a3,0(a1)
	sw	zero,12(a1)
	sw	zero,8(a1)
	addi	a0,sp,24
	sw	a2,%lo(heap_ptr)(s4)
	call	sglib___rbtree_add_recursive.constprop.0
	lw	a1,24(sp)
	addi	s7,s7,4
	sb	zero,4(a1)
	beq	s6,s7,.L1885
.L1970:
	mv	a4,a1
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
	j	.L1878
.L1881:
	addi	s7,s7,4
	bne	s6,s7,.L1970
.L1885:
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
.L1887:
	lw	a3,8(a1)
	li	a4,0
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
	li	a7,1
.L1889:
	addi	a4,a4,1
	sb	a4,-652(a0)
	ble	a5,zero,.L1890
.L1985:
	addi	a3,a5,-1
	addi	a4,a3,1072
	addi	a2,sp,16
	add	a0,a4,a2
	lbu	a4,-652(a0)
	mv	a2,a5
	beq	a4,s5,.L1891
	bleu	a4,s5,.L1984
	slli	a5,a3,16
	srai	a5,a5,16
	li	a7,1
	bgt	a5,zero,.L1985
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
	jr	ra
.L1984:
	slli	a4,a5,2
	add	a4,a4,sp
	lw	a1,560(a4)
	j	.L1887
.L1891:
	slli	a3,a5,2
	add	a3,a3,a6
	lw	a3,124(a3)
	bne	a3,zero,.L1893
	lw	a3,12(zero)
	j	.L1894
.L1852:
	addi	a0,s10,4
	mv	a4,a0
	li	a1,20
.L1854:
	addi	a5,a5,1
	beq	a5,a1,.L1856
	lw	a3,0(a4)
	addi	a4,a4,4
	beq	a3,zero,.L1854
	lw	a4,4(a3)
	j	.L1853
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
	call	sglib__rbtree_it_compute_current_elem
	lw	a3,432(sp)
	bne	a3,zero,.L1896
	lw	a5,0(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	lw	a4,0(sp)
	lw	a5,8(sp)
	bne	a5,a4,.L1812
	j	.L1986
.L1958:
	mv	a1,a3
	sub	a5,a4,a6
	mv	a3,a4
	j	.L1829
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
	j	.L1884
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
	beq	a4,zero,.L1988
	sw	s1,20(sp)
	sw	s2,16(sp)
	mv	s1,a4
	mv	s2,a3
	beq	a3,zero,.L1989
.L1999:
	beq	s0,zero,.L2018
.L1990:
	mv	a1,s0
	mv	a0,s1
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
	li	a0,0
	addi	sp,sp,32
	jr	ra
.L2022:
	lw	s0,8(s0)
	j	.L1999
.L1988:
	beq	a1,zero,.L1992
	li	a5,1
	sb	zero,4(s3)
	sw	s0,132(s3)
	sh	a5,644(s3)
	bne	s4,zero,.L2000
.L2024:
	sw	s0,0(s3)
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	addi	sp,sp,32
	jr	ra
.L2000:
	mv	a0,s3
	call	sglib__rbtree_it_compute_current_elem
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	a0,0(s3)
	lw	s4,8(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
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
	j	.L2018
.L2020:
	li	a5,1
	lw	s1,20(sp)
	lw	s2,16(sp)
	sb	zero,4(s3)
	sw	s0,132(s3)
	sh	a5,644(s3)
	beq	s4,zero,.L2024
	j	.L2000
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
	beq	a1,zero,.L2043
	li	a3,1
	mv	a5,a3
	sh	a3,644(a0)
	mv	a6,a3
	sw	a1,132(a0)
	sb	zero,4(a0)
	sw	zero,0(a0)
	li	a3,0
	li	a2,0
.L2028:
	bgtu	a3,a6,.L2035
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
	ble	a5,zero,.L2045
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
	bgt	a5,zero,.L2034
.L2045:
	li	a0,0
	ret
.L2030:
	lw	a0,12(a0)
	bne	a0,zero,.L2032
.L2044:
	lh	a5,644(a4)
	add	a2,a4,a2
	j	.L2033
.L2043:
	sh	zero,644(a0)
	sw	zero,0(a0)
	li	a0,0
	ret
.L2046:
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
	beq	a1,zero,.L2048
	sb	zero,4(a0)
	sw	a1,132(a0)
	li	a4,1
.L2048:
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
	beq	a1,zero,.L2065
	mv	a5,a3
	sh	a3,644(a0)
	mv	a6,a3
	sw	a1,132(a0)
	sb	zero,4(a0)
	sw	zero,0(a0)
	li	a3,0
	li	a2,0
.L2054:
	bleu	a3,a6,.L2066
	slli	a5,a2,16
	srai	a5,a5,16
	sh	a5,644(a4)
	ble	a5,zero,.L2067
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
	bgt	a5,zero,.L2058
.L2067:
	li	a0,0
	ret
.L2066:
	slli	a1,a5,2
	add	a1,a4,a1
	lw	a0,128(a1)
	li	a3,0
	lw	a0,8(a0)
	bne	a0,zero,.L2056
.L2069:
	lh	a5,644(a4)
	add	a2,a4,a2
	j	.L2057
.L2065:
	sh	zero,644(a0)
	sw	zero,0(a0)
	li	a0,0
	ret
.L2068:
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
	beq	a1,zero,.L2088
	li	a3,1
	mv	a5,a3
	sh	a3,644(a0)
	mv	a6,a3
	sw	a1,132(a0)
	sb	zero,4(a0)
	sw	zero,0(a0)
	li	a3,0
	li	a2,0
.L2073:
	bgtu	a3,a6,.L2080
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
	ble	a5,zero,.L2090
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
	bgt	a5,zero,.L2079
.L2090:
	li	a0,0
	ret
.L2075:
	lw	a0,12(a0)
	bne	a0,zero,.L2077
.L2089:
	lh	a5,644(a4)
	add	a2,a4,a2
	j	.L2078
.L2088:
	sh	zero,644(a0)
	sw	zero,0(a0)
	li	a0,0
	ret
.L2091:
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
	beq	a0,zero,.L2097
	lbu	a2,4(a0)
	li	a3,1
	lw	a4,8(a0)
	mv	a5,a0
	beq	a2,a3,.L2156
	beq	a4,zero,.L2109
	sw	s0,40(sp)
	lbu	a1,4(a4)
	lw	a6,8(a4)
	beq	a1,a3,.L2157
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
.L2117:
	lw	a4,12(a4)
	beq	a4,zero,.L2162
.L2118:
	lbu	a2,4(a4)
	li	a3,1
	sw	a5,4(sp)
	sw	a4,0(sp)
	lw	a0,8(a4)
	beq	a2,a3,.L2163
	li	a2,4
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,0(sp)
	mv	a1,s0
	li	a2,4
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	j	.L2111
.L2156:
	sw	a0,0(sp)
	addi	a1,sp,28
	mv	a0,a4
	call	sglib___rbtree_consistency_check_recursive.constprop.0
	lw	a5,0(sp)
	addi	a1,sp,28
	lw	a0,12(a5)
	call	sglib___rbtree_consistency_check_recursive.constprop.0
.L2097:
	lw	ra,44(sp)
	addi	sp,sp,48
	jr	ra
.L2158:
	lw	a4,28(sp)
	blt	a4,zero,.L2164
.L2151:
	lw	s0,40(sp)
.L2102:
	lw	a5,12(a5)
	beq	a5,zero,.L2097
	lbu	a3,4(a5)
	li	a2,1
	lw	a4,8(a5)
	beq	a3,a2,.L2165
.L2121:
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
.L2157:
	beq	a6,zero,.L2166
	lbu	a2,4(a6)
	lw	a0,8(a6)
	beq	a2,a1,.L2167
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
.L2108:
	lw	a4,12(a4)
	beq	a4,zero,.L2168
.L2106:
	lbu	a2,4(a4)
	li	a3,1
	lw	a0,8(a4)
	beq	a2,a3,.L2169
	sw	a5,4(sp)
	sw	a4,0(sp)
.L2155:
	li	a2,2
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,0(sp)
	mv	a1,s0
	li	a2,2
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
.L2111:
	lw	a5,12(a5)
	lw	s0,40(sp)
	beq	a5,zero,.L2097
	lbu	a3,4(a5)
	li	a2,1
	lw	a4,8(a5)
	bne	a3,a2,.L2121
.L2165:
	sw	s0,40(sp)
	beq	a4,zero,.L2170
	lbu	a2,4(a4)
	lw	a0,8(a4)
	beq	a2,a3,.L2171
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
.L2125:
	lw	a5,12(a5)
	beq	a5,zero,.L2154
.L2127:
	lbu	a2,4(a5)
	li	a4,1
	lw	a0,8(a5)
	beq	a2,a4,.L2172
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
	j	.L2097
.L2168:
	lw	a4,28(sp)
	lw	s0,40(sp)
	bge	a4,zero,.L2102
.L2109:
	li	a4,1
	sw	a4,28(sp)
	j	.L2102
.L2159:
	sw	a5,4(sp)
	sw	a4,0(sp)
	mv	a0,a6
	j	.L2155
.L2164:
	li	a4,2
	lw	s0,40(sp)
	sw	a4,28(sp)
	j	.L2102
.L2161:
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
	j	.L2117
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
	j	.L2097
.L2160:
	lw	a3,28(sp)
	bge	a3,zero,.L2115
	li	a3,3
	sw	a3,28(sp)
.L2115:
	lw	a4,12(a4)
	bne	a4,zero,.L2118
	j	.L2151
.L2167:
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
	j	.L2108
.L2169:
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
	j	.L2111
.L2172:
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
	j	.L2097
.L2171:
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
	j	.L2125
.L2163:
	li	a2,3
	mv	a1,s0
	call	sglib___rbtree_consistency_check_recursive
	lw	a4,0(sp)
	mv	a1,s0
	li	a2,3
	lw	a0,12(a4)
	call	sglib___rbtree_consistency_check_recursive
	lw	a5,4(sp)
	j	.L2111
.L2162:
	lw	a4,28(sp)
	bge	a4,zero,.L2151
	li	a4,3
	lw	s0,40(sp)
	sw	a4,28(sp)
	j	.L2102
.L2166:
	lw	a4,12(a4)
	sw	a1,28(sp)
	addi	s0,sp,28
	bne	a4,zero,.L2106
	j	.L2151
	.size	sglib___rbtree_consistency_check, .-sglib___rbtree_consistency_check
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a5,%hi(the_list)
	lw	a4,%lo(the_list)(a5)
	beq	a4,zero,.L2174
.L2175:
	mv	a5,a4
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
	li	a5,0
.L2173:
	mv	a0,a5
	ret
.L2174:
	lui	a5,%hi(.LANCHOR1)
	addi	t1,a5,%lo(.LANCHOR1)
	lui	a1,%hi(.LANCHOR0)
	li	a6,-858992640
	mv	a2,t1
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
	j	.L2173
.L2179:
	lw	a5,4(a5)
	beq	a5,zero,.L2173
.L2178:
	lw	a4,0(a5)
	bne	a3,a4,.L2179
	addi	a2,a2,4
	bne	a7,a2,.L2180
	li	a4,16384
	addi	a4,a4,-1334
	li	a5,0
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
	li	a4,0
	j	.L2182
.L2197:
	lbu	a4,0(a5)
	addi	a5,a5,1
.L2182:
	lbu	a2,0(a1)
	addi	a1,a1,1
	bne	a2,a4,.L2183
	bne	a3,a1,.L2197
	li	a5,1
	j	.L2173
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
	sw	ra,28(sp)
 #APP
# 15 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	li a0, 0
# 0 "" 2
 #NO_APP
	li	a0,1
	call	benchmark_body
	call	start_trigger
	call	benchmark
	sw	a0,12(sp)
	call	stop_trigger
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
	.type	seed, @object
	.size	seed, 4
seed:
	.zero	4
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
