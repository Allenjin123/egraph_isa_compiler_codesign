	.file	"nettle-aes.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	_nettle_aes_encrypt.constprop.0, @function
_nettle_aes_encrypt.constprop.0:
	addi	sp,sp,-48
	sw	s2,36(sp)
	lui	s2,%hi(.LANCHOR0)
	addi	s2,s2,%lo(.LANCHOR0)
	sw	s4,28(sp)
	sw	s5,24(sp)
	sw	s6,20(sp)
	sw	s7,16(sp)
	sw	s8,12(sp)
	sw	s9,8(sp)
	sw	s10,4(sp)
	sw	s11,0(sp)
	lw	s10,264(s2)
	lw	s11,260(s2)
	lw	s9,268(s2)
	lw	s8,272(s2)
	lw	s7,484(s2)
	lw	s6,488(s2)
	lw	s5,492(s2)
	lw	s4,496(s2)
	sw	s1,40(sp)
	sw	s3,32(sp)
	lui	s1,%hi(.LANCHOR1)
	lui	a4,%hi(_aes_encrypt_table)
	lui	s3,%hi(.LANCHOR0+256)
	sw	s0,44(sp)
	addi	t2, s2, 0
	addi	s0,s2,484
	addi	s1,s1,%lo(.LANCHOR1)
	addi	a4,a4,%lo(_aes_encrypt_table)
	addi	s3,s3,%lo(.LANCHOR0+256)
.L3:
	lw	t6,0(s1)
	lw	a5,4(s1)
	lw	a3,8(s1)
	lw	a2,12(s1)
	xor	t6,s11,t6
	xor	a5,s10,a5
	xor	a3,s9,a3
	xor	a2,s8,a2
	addi	t0,s2,276
.L2:
	addi	a1, t6, 0
	srli	t4,a1,24
	andi	t3,a5,255
	addi	t4,t4,832
	addi	t3,t3,64
	slli	t4,t4,2
	slli	t3,t3,2
	srli	t1,a5,24
	srli	a0,a5,16
	andi	a6,a3,255
	add	t4,a4,t4
	add	t3,a4,t3
	lw	t4,0(t4)
	lw	t3,0(t3)
	addi	t1,t1,832
	andi	a0,a0,255
	addi	a6,a6,64
	srli	t5,a2,24
	andi	t6,t6,255
	slli	t1,t1,2
	addi	a0,a0,576
	slli	a6,a6,2
	add	a6,a4,a6
	addi	t6,t6,64
	addi	t5,t5,832
	add	t1,a4,t1
	slli	a0,a0,2
	xor	t3,t3,t4
	lw	t1,0(t1)
	lw	t4,0(a6)
	add	a0,a4,a0
	slli	t6,t6,2
	slli	t5,t5,2
	lw	a6,0(a0)
	srli	a7,a3,24
	andi	a0,a2,255
	add	t6,a4,t6
	add	t5,a4,t5
	lw	t6,0(t6)
	lw	t5,0(t5)
	addi	a7,a7,832
	addi	a0,a0,64
	xor	t4,t4,t1
	slli	a7,a7,2
	srli	t1,a3,8
	slli	a0,a0,2
	srli	a3,a3,16
	add	a7,a4,a7
	add	a0,a4,a0
	andi	a3,a3,255
	xor	t5,t6,t5
	lw	a7,0(a7)
	lw	t6,0(t0)
	lw	a0,0(a0)
	srli	a5,a5,8
	addi	a3,a3,576
	andi	a5,a5,255
	slli	a3,a3,2
	add	a3,a4,a3
	addi	a5,a5,320
	xor	t6,t5,t6
	xor	a0,a0,a7
	lw	t5,0(a3)
	srli	a7,a2,8
	srli	a3,a2,16
	slli	a5,a5,2
	andi	a2,a7,255
	add	a5,a4,a5
	andi	a3,a3,255
	lw	a5,0(a5)
	addi	a2,a2,320
	addi	a3,a3,576
	slli	a2,a2,2
	slli	a3,a3,2
	add	a2,a4,a2
	add	a3,a4,a3
	lw	a7,0(a2)
	xor	t6,t6,a5
	lw	a2,0(a3)
	srli	a5,a1,16
	srli	a3,a1,8
	andi	a3,a3,255
	andi	a5,a5,255
	addi	a3,a3,320
	addi	a5,a5,576
	slli	a3,a3,2
	slli	a5,a5,2
	add	a3,a4,a3
	add	a5,a4,a5
	lw	a1,0(a3)
	andi	t1,t1,255
	lw	a3,0(a5)
	lw	a5,4(t0)
	addi	t1,t1,320
	slli	t1,t1,2
	xor	a5,t3,a5
	add	t1,a4,t1
	lw	t3,12(t0)
	xor	t6,t6,t5
	lw	t5,8(t0)
	lw	t1,0(t1)
	xor	a0,a0,t3
	xor	t4,t4,t5
	xor	a5,a5,t1
	xor	t4,t4,a7
	xor	a0,a0,a1
	addi	t0,t0,16
	xor	a5,a5,a2
	xor	a3,t4,a3
	xor	a2,a0,a6
	bne	s0,t0,.L2
	srli	a7,a5,8
	srli	t4,a5,24
	andi	a7,a7,255
	add	t4,a4,t4
	add	a7,a4,a7
	lbu	t5,0(t4)
	lbu	t4,0(a7)
	srli	a7,a2,8
	andi	t3,t6,255
	andi	a7,a7,255
	add	t3,a4,t3
	add	a7,a4,a7
	lbu	t0,0(t3)
	srli	a6,a3,8
	lbu	t3,0(a7)
	srli	a1,a3,24
	srli	a7,a3,16
	andi	a3,a3,255
	srli	a0,a2,24
	add	a3,a4,a3
	lbu	a3,0(a3)
	add	a0,a4,a0
	lbu	a0,0(a0)
	slli	t5,t5,24
	or	t5,t5,a3
	srli	t1,t6,24
	srli	a3,t6,8
	slli	t3,t3,8
	srli	t6,t6,16
	or	t3,t5,t3
	add	t1,a4,t1
	andi	t5,a5,255
	slli	a0,a0,24
	andi	a3,a3,255
	andi	t6,t6,255
	slli	t4,t4,8
	add	a3,a4,a3
	add	t6,a4,t6
	add	t5,a4,t5
	lbu	t1,0(t1)
	or	a0,a0,t0
	or	a0,a0,t4
	srli	a5,a5,16
	lbu	t4,0(a3)
	lbu	a3,0(t6)
	lbu	t6,0(t5)
	andi	a5,a5,255
	slli	t1,t1,24
	add	a5,a4,a5
	andi	a6,a6,255
	lbu	t5,0(a5)
	add	a1,a4,a1
	or	a5,t1,t6
	add	a6,a4,a6
	srli	t1,a2,16
	andi	a7,a7,255
	andi	a2,a2,255
	add	a2,a4,a2
	lbu	a1,0(a1)
	lbu	a6,0(a6)
	add	a7,a4,a7
	andi	t1,t1,255
	lbu	t6,0(a2)
	lbu	a7,0(a7)
	add	t1,a4,t1
	lbu	t1,0(t1)
	slli	a1,a1,24
	slli	a6,a6,8
	or	a2,a5,a6
	slli	a7,a7,16
	or	a5,a1,t6
	slli	t4,t4,8
	slli	a6,t1,16
	slli	a1,a3,16
	slli	t5,t5,16
	or	a5,a5,t4
	or	a0,a0,a7
	xor	a0,a0,s7
	or	a3,a2,a6
	or	t3,t3,a1
	or	a5,a5,t5
	xor	a3,a3,s6
	xor	t3,t3,s5
	xor	a5,a5,s4
	srli	a1,a0,16
	srli	a2,a0,8
	srli	t6,a0,24
	srli	t5,a3,24
	srli	t4,a3,16
	srli	t1,a3,8
	sb	a0,0(t2)
	sb	a1,2(t2)
	sb	a2,1(t2)
	sb	a3,4(t2)
	srli	a7,t3,24
	srli	a6,t3,16
	srli	a0,t3,8
	srli	a1,a5,24
	srli	a2,a5,16
	srli	a3,a5,8
	sb	t6,3(t2)
	sb	t5,7(t2)
	sb	t4,6(t2)
	sb	t1,5(t2)
	sb	t3,8(t2)
	sb	a5,12(t2)
	sb	a7,11(t2)
	sb	a6,10(t2)
	sb	a0,9(t2)
	sb	a1,15(t2)
	sb	a2,14(t2)
	sb	a3,13(t2)
	addi	t2,t2,16
	addi	s1,s1,16
	bne	t2,s3,.L3
	lw	s0,44(sp)
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
	addi	sp,sp,48
	jalr	zero, ra, 0
	.size	_nettle_aes_encrypt.constprop.0, .-_nettle_aes_encrypt.constprop.0
	.align	2
	.type	_aes_set_key.constprop.0, @function
_aes_set_key.constprop.0:
	addi	sp,sp,-16
	lui	a5,%hi(.LANCHOR1)
	addi	a5,a5,%lo(.LANCHOR1)
	sw	s0,12(sp)
	lbu	a4,270(a5)
	lbu	t3,271(a5)
	lbu	a0,275(a5)
	lbu	t1,274(a5)
	lbu	a6,258(a5)
	lbu	t0,259(a5)
	lbu	a2,262(a5)
	lbu	t6,263(a5)
	lbu	a3,266(a5)
	lbu	t5,267(a5)
	lbu	a1,279(a5)
	lbu	a7,278(a5)
	slli	t3,t3,24
	slli	t1,t1,16
	slli	a4,a4,16
	slli	a0,a0,24
	lbu	t4,256(a5)
	lbu	s0,260(a5)
	or	a4,a4,t3
	or	a0,a0,t1
	lbu	t3,264(a5)
	lbu	t1,272(a5)
	slli	t0,t0,24
	slli	t6,t6,24
	slli	t5,t5,24
	slli	a6,a6,16
	slli	a2,a2,16
	slli	a3,a3,16
	or	a2,a2,t6
	slli	a7,a7,16
	or	a6,a6,t0
	or	a3,a3,t5
	slli	a1,a1,24
	lbu	t0,257(a5)
	lbu	t6,261(a5)
	lbu	t5,265(a5)
	lbu	t2,268(a5)
	or	a1,a1,a7
	or	a6,a6,t4
	or	a7,a2,s0
	lbu	t4,269(a5)
	lbu	a2,276(a5)
	or	a3,a3,t3
	or	a0,a0,t1
	lbu	t3,273(a5)
	lbu	t1,277(a5)
	slli	t5,t5,8
	slli	t4,t4,8
	slli	t3,t3,8
	or	a1,a1,a2
	slli	t1,t1,8
	slli	t0,t0,8
	slli	t6,t6,8
	or	a4,a4,t2
	lui	a2,%hi(.LANCHOR0)
	addi	a2,a2,%lo(.LANCHOR0)
	or	a3,a3,t5
	or	a4,a4,t4
	or	a0,a0,t3
	or	a1,a1,t1
	or	a6,a6,t0
	or	a7,a7,t6
	sw	a6,260(a2)
	sw	a7,264(a2)
	sw	a3,268(a2)
	sw	a0,276(a2)
	sw	a1,280(a2)
	sw	a4,272(a2)
	lbu	a4,283(a5)
	lbu	a7,282(a5)
	lbu	a3,287(a5)
	lbu	a6,286(a5)
	lbu	t3,280(a5)
	lbu	a0,281(a5)
	slli	a4,a4,24
	slli	a7,a7,16
	lbu	a1,285(a5)
	lbu	t1,284(a5)
	or	a4,a4,a7
	slli	a5,a3,24
	slli	a3,a6,16
	or	a5,a5,a3
	or	a4,a4,t3
	slli	a3,a0,8
	or	a4,a4,a3
	sw	a4,284(a2)
	or	a5,a5,t1
	slli	a4,a1,8
	or	a5,a5,a4
	lui	t3,%hi(.LANCHOR2)
	lui	a1,%hi(_aes_encrypt_table)
	sw	a5,288(a2)
	addi	t3,t3,%lo(.LANCHOR2)
	addi	a2,a2,260
	addi	a1,a1,%lo(_aes_encrypt_table)
	addi	a0, zero, 8
	addi	t5, zero, 4
	addi	t4, zero, 60
.L13:
	srli	a3,a5,8
	slli	a4,a5,24
	add	a4,a4,a3
	srli	a6,a4,24
	srli	a3,a4,8
	add	a7,a1,a6
	andi	a6,a4,255
	srli	a4,a4,16
	andi	a3,a3,255
	andi	a4,a4,255
	andi	t1,a0,7
	add	a6,a1,a6
	add	a3,a1,a3
	add	a4,a1,a4
	bne	t1,zero,.L9
	lbu	a5,0(a7)
	lbu	a6,0(a6)
	lbu	a3,0(a3)
	lbu	a4,0(a4)
	slli	a5,a5,24
	or	a5,a5,a6
	slli	a3,a3,8
	lbu	a6,0(t3)
	or	a5,a5,a3
	slli	a4,a4,16
	lw	a3,0(a2)
	or	a5,a5,a4
	xor	a5,a5,a6
	xor	a5,a5,a3
	sw	a5,32(a2)
	addi	a0,a0,1
	addi	t3,t3,1
	addi	a2,a2,4
	jal	zero, .L13
.L9:
	addi	a0,a0,1
	bne	t1,t5,.L11
	srli	a4,a5,24
	srli	a3,a5,8
	andi	a6,a5,255
	add	a4,a1,a4
	andi	a3,a3,255
	srli	a5,a5,16
	lbu	a4,0(a4)
	add	a6,a1,a6
	add	a3,a1,a3
	andi	a5,a5,255
	lbu	a6,0(a6)
	lbu	a3,0(a3)
	add	a5,a1,a5
	lbu	a5,0(a5)
	slli	a4,a4,24
	or	a4,a4,a6
	slli	a3,a3,8
	or	a4,a4,a3
	slli	a5,a5,16
	or	a5,a4,a5
.L11:
	lw	a4,0(a2)
	xor	a5,a5,a4
	sw	a5,32(a2)
	beq	a0,t4,.L8
	addi	a2,a2,4
	jal	zero, .L13
.L8:
	lw	s0,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	_aes_set_key.constprop.0, .-_aes_set_key.constprop.0
	.align	2
	.globl	memset
	.type	memset, @function
memset:
	beq	a2,zero,.L28
	addi	a5,a2,-1
	addi	a4, zero, 5
	andi	a1,a1,0xff
	bgeu	a4, a5, .L24
	sub	a4, zero, a0
	andi	a5,a4,3
	addi	a6, zero, 0
	beq	a5,zero,.L18
	sb	a1,0(a0)
	andi	a4,a4,2
	addi	a6, zero, 1
	beq	a4,zero,.L18
	sb	a1,1(a0)
	addi	a4, zero, 3
	addi	a6, zero, 2
	bne	a5,a4,.L18
	sb	a1,2(a0)
	addi	a6, a5, 0
.L18:
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
.L20:
	sw	a4,0(a5)
	addi	a5,a5,4
	bne	a5,a3,.L20
	add	a5,a6,a7
	beq	t1,a7,.L28
.L17:
	add	a4,a0,a5
	sb	a1,0(a4)
	addi	a4,a5,1
	bgeu	a4, a2, .L28
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,2
	bgeu	a4, a2, .L28
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,3
	bgeu	a4, a2, .L28
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,4
	bgeu	a4, a2, .L28
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a5,a5,5
	bgeu	a5, a2, .L28
	add	a5,a0,a5
	sb	a1,0(a5)
.L28:
	jalr	zero, ra, 0
.L24:
	addi	a5, zero, 0
	jal	zero, .L17
	.size	memset, .-memset
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	beq	a2,zero,.L33
	addi	a5,a2,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L34
	or	a3,a0,a1
	andi	a3,a3,3
	addi	a4, a0, 0
	addi	a5, a1, 0
	bne	a3,zero,.L34
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L34
	andi	a7,a2,-4
	add	a6,a1,a7
.L35:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L35
	beq	a2,a7,.L33
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a2, .L33
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a2, .L33
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	jalr	zero, ra, 0
.L34:
	add	a2,a1,a2
	addi	a5, a0, 0
.L37:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L37
.L33:
	jalr	zero, ra, 0
	.size	memcpy, .-memcpy
	.align	2
	.globl	memcmp
	.type	memcmp, @function
memcmp:
	beq	a2,zero,.L54
	add	a2,a0,a2
	jal	zero, .L53
.L52:
	beq	a0,a2,.L54
.L53:
	lbu	a5,0(a0)
	lbu	a4,0(a1)
	addi	a0,a0,1
	addi	a1,a1,1
	beq	a5,a4,.L52
	sub	a0,a5,a4
	jalr	zero, ra, 0
.L54:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	memcmp, .-memcmp
	.align	2
	.globl	memmove
	.type	memmove, @function
memmove:
	bgeu	a0,a1,.L57
	beq	a2,zero,.L58
	addi	a5,a2,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L59
	or	a3,a1,a0
	andi	a3,a3,3
	addi	a4, a0, 0
	addi	a5, a1, 0
	bne	a3,zero,.L59
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L59
	andi	a7,a2,-4
	add	a6,a1,a7
.L60:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L60
	beq	a2,a7,.L58
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a2, .L58
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a2, .L58
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	jalr	zero, ra, 0
.L57:
	bltu	a1, a0, .L80
.L58:
	jalr	zero, ra, 0
.L80:
	beq	a2,zero,.L58
	addi	a2,a2,-1
	add	a5,a1,a2
	lbu	a4,0(a5)
	add	a5,a0,a2
	sb	a4,0(a5)
	jal	zero, .L80
.L59:
	add	a2,a1,a2
	addi	a5, a0, 0
.L62:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L62
	jalr	zero, ra, 0
	.size	memmove, .-memmove
	.align	2
	.globl	strlen
	.type	strlen, @function
strlen:
	lbu	a5,0(a0)
	beq	a5,zero,.L81
	addi	a5, zero, 0
.L83:
	addi	a5,a5,1
	add	a4,a0,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L83
.L81:
	addi	a0, a5, 0
	jalr	zero, ra, 0
	.size	strlen, .-strlen
	.align	2
	.globl	strchr
	.type	strchr, @function
strchr:
	lbu	a5,0(a0)
	beq	a5,zero,.L87
	andi	a4,a1,0xff
.L89:
	beq	a4,a5,.L86
	lbu	a5,1(a0)
	addi	a0,a0,1
	bne	a5,zero,.L89
.L87:
	sltiu	a1, a1, 1
	sub	a1, zero, a1
	and	a0,a0,a1
.L86:
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
	beq	a0,zero,.L102
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a1,%lo(heap_requested)(a3)
	add	a4,a0,a5
	andi	a6,a4,3
	add	a5,a5,a1
	bne	a6,zero,.L106
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a1,a4,.L102
.L107:
	sw	a4,%lo(heap_ptr)(a2)
	jalr	zero, ra, 0
.L106:
	addi	a1, zero, 4
	sub	a1,a1,a6
	add	a5,a5,a1
	add	a4,a4,a1
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a1,a4,.L107
.L102:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	malloc_beebs, .-malloc_beebs
	.align	2
	.globl	calloc_beebs
	.type	calloc_beebs, @function
calloc_beebs:
	mul	a1,a0,a1
	beq	a1,zero,.L109
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a0,a1
	andi	a6,a4,3
	add	a5,a1,a5
	bne	a6,zero,.L134
.L110:
	lui	a6,%hi(heap_end)
	lw	a6,%lo(heap_end)(a6)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a6,a4,.L109
	sw	a4,%lo(heap_ptr)(a2)
	beq	a0,zero,.L109
	addi	a5,a1,-1
	addi	a4, zero, 5
	bgeu	a4, a5, .L118
	sub	a4, zero, a0
	andi	a5,a4,3
	addi	a3, zero, 0
	beq	a5,zero,.L112
	sb	zero,0(a0)
	andi	a4,a4,2
	addi	a3, zero, 1
	beq	a4,zero,.L112
	sb	zero,1(a0)
	addi	a4, zero, 3
	addi	a3, zero, 2
	bne	a5,a4,.L112
	sb	zero,2(a0)
	addi	a3, a5, 0
.L112:
	sub	a6,a1,a5
	andi	a2,a6,-4
	add	a5,a0,a5
	add	a4,a5,a2
.L114:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L114
	add	a5,a3,a2
	beq	a6,a2,.L108
.L111:
	add	a4,a0,a5
	sb	zero,0(a4)
	addi	a4,a5,1
	bgeu	a4, a1, .L108
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,2
	bgeu	a4, a1, .L108
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,3
	bgeu	a4, a1, .L108
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,4
	bgeu	a4, a1, .L108
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a5,a5,5
	bgeu	a5, a1, .L108
	add	a5,a0,a5
	sb	zero,0(a5)
	jalr	zero, ra, 0
.L109:
	addi	a0, zero, 0
.L108:
	jalr	zero, ra, 0
.L134:
	addi	a7, zero, 4
	sub	a6,a7,a6
	add	a4,a4,a6
	add	a5,a5,a6
	jal	zero, .L110
.L118:
	addi	a5, zero, 0
	jal	zero, .L111
	.size	calloc_beebs, .-calloc_beebs
	.align	2
	.globl	realloc_beebs
	.type	realloc_beebs, @function
realloc_beebs:
	beq	a0,zero,.L136
	beq	a1,zero,.L136
	lui	a6,%hi(heap_ptr)
	lw	a2,%lo(heap_ptr)(a6)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a2,a1
	andi	a7,a4,3
	add	a5,a1,a5
	bne	a7,zero,.L161
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a7,a4,.L136
.L162:
	sw	a4,%lo(heap_ptr)(a6)
	beq	a2,zero,.L136
	addi	a5,a1,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L146
	or	a3,a0,a2
	andi	a3,a3,3
	addi	a4, a2, 0
	addi	a5, a0, 0
	bne	a3,zero,.L146
	addi	a3,a2,-1
	sub	a3,a3,a0
	sltiu	a3,a3,3
	bne	a3,zero,.L146
	andi	a7,a1,-4
	add	a6,a0,a7
.L139:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L139
	beq	a1,a7,.L135
	lbu	a3,0(a6)
	add	a4,a2,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a1, .L135
	add	a4,a0,a5
	lbu	a4,0(a4)
	add	a5,a2,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a1, .L135
	add	a0,a0,a7
	lbu	a5,0(a0)
	add	a7,a2,a7
	sb	a5,0(a7)
.L135:
	addi	a0, a2, 0
	jalr	zero, ra, 0
.L161:
	addi	t1, zero, 4
	sub	a7,t1,a7
	add	a5,a5,a7
	add	a4,a4,a7
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a7,a4,.L162
.L136:
	addi	a2, zero, 0
	addi	a0, a2, 0
	jalr	zero, ra, 0
.L146:
	addi	a5, zero, 0
.L143:
	add	a4,a0,a5
	lbu	a3,0(a4)
	add	a4,a2,a5
	addi	a5,a5,1
	sb	a3,0(a4)
	bltu	a5, a1, .L143
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
	.globl	_aes_set_key
	.type	_aes_set_key, @function
_aes_set_key:
	addi	a6,a0,1
	slli	a6,a6,2
	beq	a1,zero,.L168
	slli	t3,a1,2
	add	t3,a3,t3
	addi	a7, a2, 0
.L169:
	lbu	a5,3(a3)
	lbu	a0,2(a3)
	lbu	t1,0(a3)
	lbu	a4,1(a3)
	slli	a5,a5,24
	slli	a0,a0,16
	or	a5,a5,a0
	or	a5,a5,t1
	slli	a4,a4,8
	or	a5,a5,a4
	sw	a5,0(a7)
	addi	a3,a3,4
	addi	a7,a7,4
	bne	t3,a3,.L169
.L168:
	bgeu	a1, a6, .L167
	slli	a5,a1,2
	add	a5,a2,a5
	sltiu	t6,a1,7
	lui	t4,%hi(.LANCHOR2)
	lui	a7,%hi(_aes_encrypt_table)
	lw	a4,-4(a5)
	xori	t6,t6,1
	addi	t4,t4,%lo(.LANCHOR2)
	addi	a7,a7,%lo(_aes_encrypt_table)
	slli	t5,a1,2
	addi	t1, a1, 0
	jal	zero, .L173
.L185:
	lbu	a4,0(t0)
	lbu	a0,0(t3)
	lbu	a3,0(a3)
	lbu	a5,0(a5)
	slli	a4,a4,24
	or	a4,a4,a0
	slli	a3,a3,8
	lbu	a0,0(t4)
	or	a4,a4,a3
	slli	a5,a5,16
	or	a4,a4,a5
	xor	a4,a4,a0
	addi	t4,t4,1
.L172:
	lw	a3,0(a2)
	add	a5,a2,t5
	addi	t1,t1,1
	xor	a4,a4,a3
	sw	a4,0(a5)
	addi	a2,a2,4
	beq	a6,t1,.L167
.L173:
	remu	a0,t1,a1
	srli	a3,a4,8
	slli	a5,a4,24
	add	a5,a5,a3
	srli	t3,a5,24
	srli	a3,a5,8
	add	t0,a7,t3
	andi	t3,a5,255
	srli	a5,a5,16
	andi	a3,a3,255
	andi	a5,a5,255
	add	t3,a7,t3
	add	a3,a7,a3
	add	a5,a7,a5
	addi	t2,a0,-4
	beq	a0,zero,.L185
	bne	t2,zero,.L172
	beq	t6,zero,.L172
	lui	a5,%hi(_aes_encrypt_table)
	addi	a5,a5,%lo(_aes_encrypt_table)
	srli	a3,a4,24
	srli	a0,a4,8
	add	a3,a5,a3
	andi	t3,a4,255
	andi	a0,a0,255
	lbu	a3,0(a3)
	add	t3,a5,t3
	add	a0,a5,a0
	srli	a4,a4,16
	andi	a4,a4,255
	lbu	t3,0(t3)
	lbu	a0,0(a0)
	add	a5,a5,a4
	lbu	a4,0(a5)
	slli	a5,a3,24
	or	a5,a5,t3
	slli	a3,a0,8
	or	a5,a5,a3
	lw	a3,0(a2)
	slli	a4,a4,16
	or	a4,a5,a4
	xor	a4,a4,a3
	add	a5,a2,t5
	addi	t1,t1,1
	sw	a4,0(a5)
	addi	a2,a2,4
	bne	a6,t1,.L173
.L167:
	jalr	zero, ra, 0
	.size	_aes_set_key, .-_aes_set_key
	.align	2
	.globl	aes_set_encrypt_key
	.type	aes_set_encrypt_key, @function
aes_set_encrypt_key:
	addi	sp,sp,-16
	sw	ra,12(sp)
	addi	a5, zero, 32
	addi	a3, a2, 0
	beq	a1,a5,.L188
	addi	a5, zero, 23
	bltu	a5, a1, .L191
	addi	a5, zero, 10
	sw	a5,0(a0)
	addi	a2,a0,4
	addi	a1, zero, 4
	addi	a0, a5, 0
.Lpcrel_1:
	auipc	ra, %pcrel_hi(_aes_set_key)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_1)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
.L191:
	addi	a5, zero, 12
	sw	a5,0(a0)
	addi	a2,a0,4
	addi	a1, zero, 6
	addi	a0, a5, 0
.Lpcrel_2:
	auipc	ra, %pcrel_hi(_aes_set_key)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_2)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
.L188:
	addi	a5, zero, 14
	sw	a5,0(a0)
	addi	a2,a0,4
	addi	a1, zero, 8
	addi	a0, a5, 0
.Lpcrel_3:
	auipc	ra, %pcrel_hi(_aes_set_key)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_3)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	aes_set_encrypt_key, .-aes_set_encrypt_key
	.align	2
	.globl	_nettle_aes_invert
	.type	_nettle_aes_invert, @function
_nettle_aes_invert:
	slli	t1,a0,2
	beq	a2,a1,.L204
	slli	a3,a0,4
	addi	a3,a3,16
	slli	a6,a0,4
	add	a3,a1,a3
	add	a2,a2,a6
	addi	a5, a1, 0
.L198:
	lw	a4,0(a2)
	addi	a5,a5,16
	addi	a2,a2,-16
	sw	a4,-16(a5)
	lw	a4,20(a2)
	sw	a4,-12(a5)
	lw	a4,24(a2)
	sw	a4,-8(a5)
	lw	a4,28(a2)
	sw	a4,-4(a5)
	bne	a3,a5,.L198
.L199:
	addi	a5, zero, 4
	bgeu	a5, t1, .L205
	lui	a0,%hi(.LANCHOR2)
	add	a6,a1,a6
	addi	a0,a0,%lo(.LANCHOR2)
	addi	a1,a1,16
.L200:
	lw	a5,0(a1)
	addi	a1,a1,4
	srli	a2,a5,24
	srli	a3,a5,6
	slli	a2,a2,2
	add	a2,a0,a2
	andi	a4,a5,255
	andi	a3,a3,1020
	srli	a5,a5,14
	lw	a7,12(a2)
	add	a3,a0,a3
	slli	a4,a4,2
	andi	a5,a5,1020
	lw	a2,12(a3)
	add	a4,a0,a4
	add	a5,a0,a5
	lw	a3,12(a5)
	lw	t1,12(a4)
	srli	a5,a7,8
	slli	a7,a7,24
	srli	a4,a2,24
	add	a5,a5,a7
	slli	a2,a2,8
	add	a2,a4,a2
	xor	a5,a5,t1
	srli	a4,a3,16
	slli	a3,a3,16
	xor	a5,a5,a2
	add	a4,a4,a3
	xor	a5,a4,a5
	sw	a5,-4(a1)
	bne	a6,a1,.L200
.L192:
	jalr	zero, ra, 0
.L204:
	beq	t1,zero,.L192
	slli	a6,a0,4
	add	a4,a1,a6
	addi	a5, a1, 0
	addi	a3, zero, 0
.L195:
	lw	a0,0(a4)
	lw	a2,0(a5)
	addi	a3,a3,4
	sw	a0,0(a5)
	sw	a2,0(a4)
	lw	a7,4(a4)
	lw	a0,4(a5)
	sub	a2,t1,a3
	sw	a7,4(a5)
	lw	a7,8(a4)
	sw	a0,4(a4)
	lw	a0,8(a5)
	sw	a7,8(a5)
	lw	a7,12(a4)
	sw	a0,8(a4)
	lw	a0,12(a5)
	sw	a7,12(a5)
	addi	a4,a4,-16
	sw	a0,28(a4)
	addi	a5,a5,16
	bltu	a3,a2,.L195
	jal	zero, .L199
.L205:
	jalr	zero, ra, 0
	.size	_nettle_aes_invert, .-_nettle_aes_invert
	.align	2
	.globl	aes_invert_key
	.type	aes_invert_key, @function
aes_invert_key:
	addi	sp,sp,-16
	sw	s1,4(sp)
	lw	s1,0(a1)
	sw	s0,8(sp)
	addi	s0, a0, 0
	addi	a2,a1,4
	addi	a0, s1, 0
	addi	a1,s0,4
	sw	ra,12(sp)
.Lpcrel_4:
	auipc	ra, %pcrel_hi(_nettle_aes_invert)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_4)
	lw	ra,12(sp)
	sw	s1,0(s0)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	aes_invert_key, .-aes_invert_key
	.align	2
	.globl	aes_set_decrypt_key
	.type	aes_set_decrypt_key, @function
aes_set_decrypt_key:
	addi	sp,sp,-32
	sw	s1,20(sp)
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	a5, zero, 32
	addi	s1, a0, 0
	addi	a3, a2, 0
	beq	a1,a5,.L210
	addi	a5, zero, 23
	bltu	a5, a1, .L213
	addi	s0, zero, 10
	addi	a1, zero, 4
.L209:
	addi	a2,s1,4
	sw	s0,0(s1)
	addi	a0, s0, 0
	sw	a2,12(sp)
.Lpcrel_5:
	auipc	ra, %pcrel_hi(_aes_set_key)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_5)
	lw	a2,12(sp)
	addi	a0, s0, 0
	addi	a1, a2, 0
.Lpcrel_6:
	auipc	ra, %pcrel_hi(_nettle_aes_invert)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_6)
	lw	ra,28(sp)
	sw	s0,0(s1)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jalr	zero, ra, 0
.L213:
	addi	s0, zero, 12
	addi	a1, zero, 6
	jal	zero, .L209
.L210:
	addi	s0, zero, 14
	addi	a1, zero, 8
	jal	zero, .L209
	.size	aes_set_decrypt_key, .-aes_set_decrypt_key
	.align	2
	.globl	_nettle_aes_encrypt
	.type	_nettle_aes_encrypt, @function
_nettle_aes_encrypt:
	beq	a3,zero,.L224
	addi	sp,sp,-48
	sw	s3,32(sp)
	addi	s3, a0, 0
	sw	s4,28(sp)
	slli	s4,s3,4
	sw	s0,44(sp)
	sw	s1,40(sp)
	sw	s2,36(sp)
	sw	s5,24(sp)
	sw	s6,20(sp)
	sw	s7,16(sp)
	sw	s8,12(sp)
	sw	s9,8(sp)
	sw	s10,4(sp)
	sw	s11,0(sp)
	addi	s0, a4, 0
	addi	s1, a1, 0
	addi	a0, a5, 0
	add	s5,a5,a3
	add	s2,a1,s4
	addi	s6, zero, 1
.L218:
	lbu	a4,1(a0)
	lbu	a5,5(a0)
	lbu	s9,9(a0)
	lbu	s8,13(a0)
	lbu	t6,0(a0)
	lbu	t5,4(a0)
	lbu	s7,2(a0)
	lbu	t2,6(a0)
	lbu	s11,8(a0)
	lbu	t0,10(a0)
	lbu	s10,12(a0)
	lbu	a1,14(a0)
	lbu	t1,3(a0)
	lbu	a6,7(a0)
	lbu	a7,11(a0)
	lbu	a3,15(a0)
	slli	t4,a4,8
	slli	t3,a5,8
	slli	s9,s9,8
	slli	s8,s8,8
	or	a4,t4,t6
	or	a5,t3,t5
	lw	t6,0(s1)
	lw	t5,4(s1)
	lw	t4,8(s1)
	lw	t3,12(s1)
	slli	s7,s7,16
	slli	t2,t2,16
	or	s9,s9,s11
	slli	t0,t0,16
	or	s8,s8,s10
	slli	a1,a1,16
	or	s7,s7,a4
	or	t2,t2,a5
	slli	t1,t1,24
	slli	a6,a6,24
	or	a4,t0,s9
	slli	a7,a7,24
	or	a5,a1,s8
	slli	a3,a3,24
	or	t1,t1,s7
	or	a6,a6,t2
	or	a7,a7,a4
	or	a3,a3,a5
	xor	t1,t1,t6
	xor	a6,a6,t5
	xor	a7,a7,t4
	xor	a3,a3,t3
	bgeu	s6, s3, .L220
	addi	a1,s1,16
.L217:
	srli	s8,a3,24
	srli	s10,t1,24
	srli	t4,a7,24
	andi	s9,t1,255
	andi	s7,a6,255
	srli	a4,a6,24
	andi	t2,a3,255
	srli	t3,a6,16
	addi	s8,s8,832
	srli	a6,a6,8
	addi	s10,s10,832
	addi	t4,t4,832
	andi	a5,a7,255
	srli	t0,a7,8
	srli	t6,a3,8
	andi	a6,a6,255
	srli	a7,a7,16
	slli	s9,s9,2
	slli	s8,s8,2
	slli	s10,s10,2
	slli	s7,s7,2
	srli	a3,a3,16
	slli	t4,t4,2
	slli	t2,t2,2
	addi	s11, a6, 0
	add	s7,a2,s7
	andi	a6,a7,255
	addi	a4,a4,832
	add	s9,a2,s9
	add	s8,a2,s8
	add	s10,a2,s10
	andi	a3,a3,255
	andi	t3,t3,255
	add	t4,a2,t4
	add	t2,a2,t2
	lw	s9,256(s9)
	lw	s10,0(s10)
	lw	t4,0(t4)
	srli	t5,t1,8
	addi	a7,a6,576
	lw	s8,0(s8)
	lw	a6,256(s7)
	lw	t2,256(t2)
	slli	a4,a4,2
	slli	a5,a5,2
	srli	t1,t1,16
	addi	a3,a3,576
	addi	t3,t3,576
	andi	t0,t0,255
	andi	t6,t6,255
	andi	t5,t5,255
	add	a4,a2,a4
	add	a5,a2,a5
	andi	t1,t1,255
	slli	s11,s11,2
	slli	a7,a7,2
	slli	a3,a3,2
	slli	t3,t3,2
	lw	a4,0(a4)
	add	s11,a2,s11
	add	a7,a2,a7
	add	a3,a2,a3
	add	t3,a2,t3
	lw	a5,256(a5)
	slli	t0,t0,2
	slli	t6,t6,2
	addi	t1,t1,576
	slli	t5,t5,2
	lw	s7,1280(s11)
	xor	s8,s9,s8
	lw	s11,0(a7)
	lw	s9,0(a1)
	lw	a7,0(a3)
	xor	a6,a6,s10
	lw	a3,0(t3)
	lw	s10,4(a1)
	lw	t3,8(a1)
	xor	t2,t2,t4
	add	t0,a2,t0
	lw	t4,12(a1)
	add	t6,a2,t6
	slli	t1,t1,2
	add	t5,a2,t5
	add	t1,a2,t1
	lw	t0,1280(t0)
	lw	t6,1280(t6)
	lw	t5,1280(t5)
	xor	a5,a5,a4
	lw	a4,0(t1)
	xor	s9,s8,s9
	xor	a6,a6,s10
	xor	a5,a5,t3
	xor	t2,t2,t4
	xor	s9,s9,s7
	xor	a6,a6,t0
	xor	a5,a5,t6
	xor	t2,t2,t5
	addi	a1,a1,16
	xor	a6,a6,a7
	xor	t1,s9,s11
	xor	a7,a5,a4
	xor	a3,t2,a3
	bne	a1,s2,.L217
	addi	s7,s4,12
	addi	t5,s4,8
	addi	t6,s4,4
	addi	t0, s4, 0
.L216:
	srli	a1,a3,24
	andi	s8,t1,255
	add	a1,a2,a1
	lbu	a1,0(a1)
	add	s8,a2,s8
	lbu	s9,0(s8)
	srli	a5,a6,8
	srli	a4,t1,24
	slli	a1,a1,24
	or	a1,a1,s9
	andi	a5,a5,255
	andi	s9,a6,255
	add	a4,a2,a4
	lbu	a4,0(a4)
	add	a5,a2,a5
	add	s9,a2,s9
	lbu	s8,0(a5)
	lbu	s9,0(s9)
	slli	a4,a4,24
	srli	s10,a7,8
	or	a4,a4,s9
	srli	t4,a6,24
	srli	s9,a3,16
	slli	s8,s8,8
	or	s8,a1,s8
	andi	s10,s10,255
	andi	a1,a7,255
	add	t4,a2,t4
	andi	s9,s9,255
	lbu	t4,0(t4)
	add	s10,a2,s10
	add	s9,a2,s9
	add	a1,a2,a1
	lbu	a5,0(s10)
	lbu	s10,0(s9)
	lbu	s9,0(a1)
	srli	t3,a7,16
	srli	a7,a7,24
	srli	t2,a3,8
	slli	t4,t4,24
	add	a7,a2,a7
	lbu	a1,0(a7)
	andi	t2,t2,255
	or	a7,t4,s9
	srli	t4,t1,16
	srli	t1,t1,8
	andi	t3,t3,255
	add	t2,a2,t2
	srli	a6,a6,16
	andi	a3,a3,255
	andi	t4,t4,255
	andi	t1,t1,255
	lbu	t2,0(t2)
	add	t3,a2,t3
	andi	a6,a6,255
	add	a3,a2,a3
	add	t4,a2,t4
	add	t1,a2,t1
	lbu	a3,0(a3)
	lbu	t3,0(t3)
	lbu	t4,0(t4)
	lbu	t1,0(t1)
	add	a6,a2,a6
	lbu	a6,0(a6)
	add	t0,s1,t0
	add	t6,s1,t6
	add	t5,s1,t5
	lw	t0,0(t0)
	lw	t6,0(t6)
	lw	t5,0(t5)
	slli	a1,a1,24
	add	s7,s1,s7
	slli	a5,a5,8
	slli	t2,t2,8
	lw	s7,0(s7)
	slli	t3,t3,16
	or	a5,a4,a5
	slli	t4,t4,16
	or	a4,a1,a3
	slli	t1,t1,8
	slli	s10,s10,16
	or	a7,a7,t2
	or	s8,s8,t3
	slli	a6,a6,16
	or	a7,a7,t4
	or	a4,a4,t1
	or	a5,a5,s10
	xor	a5,a5,t6
	xor	a7,a7,t5
	xor	s8,s8,t0
	or	a4,a4,a6
	xor	a4,a4,s7
	srli	t4,a5,24
	srli	t3,a5,16
	srli	t1,a5,8
	srli	a1,a7,16
	srli	a3,a7,8
	srli	t0,s8,24
	srli	t6,s8,16
	srli	t5,s8,8
	srli	a6,a7,24
	sb	a5,4(s0)
	sb	a1,10(s0)
	sb	a3,9(s0)
	sb	s8,0(s0)
	sb	a7,8(s0)
	sb	t0,3(s0)
	sb	t6,2(s0)
	sb	t5,1(s0)
	sb	t4,7(s0)
	sb	t3,6(s0)
	sb	t1,5(s0)
	sb	a6,11(s0)
	srli	a1,a4,24
	srli	a3,a4,16
	srli	a5,a4,8
	sb	a1,15(s0)
	addi	a0,a0,16
	sb	a4,12(s0)
	sb	a3,14(s0)
	sb	a5,13(s0)
	addi	s0,s0,16
	bne	a0,s5,.L218
	lw	s0,44(sp)
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
	addi	sp,sp,48
	jalr	zero, ra, 0
.L220:
	addi	s7, zero, 28
	addi	t5, zero, 24
	addi	t6, zero, 20
	addi	t0, zero, 16
	jal	zero, .L216
.L224:
	jalr	zero, ra, 0
	.size	_nettle_aes_encrypt, .-_nettle_aes_encrypt
	.align	2
	.globl	_nettle_aes_decrypt
	.type	_nettle_aes_decrypt, @function
_nettle_aes_decrypt:
	beq	a3,zero,.L237
	addi	sp,sp,-48
	sw	s5,24(sp)
	slli	s5,a0,4
	sw	s0,44(sp)
	sw	s1,40(sp)
	sw	s2,36(sp)
	sw	s3,32(sp)
	sw	s4,28(sp)
	sw	s6,20(sp)
	sw	s7,16(sp)
	sw	s8,12(sp)
	sw	s9,8(sp)
	sw	s10,4(sp)
	sw	s11,0(sp)
	addi	s1, a4, 0
	addi	s4, a0, 0
	addi	s2, a1, 0
	addi	s0, a5, 0
	add	s6,a5,a3
	add	s3,a1,s5
	addi	s7, zero, 1
.L231:
	lbu	a4,1(s0)
	lbu	a5,5(s0)
	lbu	s9,9(s0)
	lbu	s8,13(s0)
	lbu	t5,0(s0)
	lbu	t4,4(s0)
	lbu	t2,2(s0)
	lbu	t0,6(s0)
	lbu	s11,8(s0)
	lbu	t6,10(s0)
	lbu	s10,12(s0)
	lbu	a1,14(s0)
	lbu	t1,3(s0)
	lbu	a3,7(s0)
	lbu	a6,11(s0)
	lbu	a7,15(s0)
	slli	t3,a4,8
	slli	a0,a5,8
	slli	s9,s9,8
	slli	s8,s8,8
	or	a4,t3,t5
	or	a5,a0,t4
	lw	t5,0(s2)
	lw	t4,4(s2)
	lw	t3,8(s2)
	lw	a0,12(s2)
	slli	t2,t2,16
	slli	t0,t0,16
	or	s9,s9,s11
	slli	t6,t6,16
	or	s8,s8,s10
	slli	a1,a1,16
	or	t2,t2,a4
	or	t0,t0,a5
	slli	t1,t1,24
	slli	a3,a3,24
	or	a4,t6,s9
	slli	a6,a6,24
	or	a5,a1,s8
	slli	a7,a7,24
	or	t1,t1,t2
	or	a3,a3,t0
	or	a6,a6,a4
	or	a7,a7,a5
	xor	t1,t1,t5
	xor	a3,a3,t4
	xor	a6,a6,t3
	xor	a7,a7,a0
	bgeu	s7, s4, .L233
	addi	a0,s2,16
.L230:
	srli	t0,a6,24
	andi	s9,t1,255
	andi	a5,a3,255
	addi	t0,t0,832
	srli	s8,a3,24
	srli	a1,t1,24
	andi	t2,a6,255
	srli	t3,a6,8
	srli	t5,a3,8
	srli	t4,t1,8
	srli	a3,a3,16
	srli	t1,t1,16
	slli	s9,s9,2
	srli	a6,a6,16
	slli	a5,a5,2
	slli	t0,t0,2
	andi	a4,a7,255
	srli	s10,a7,24
	add	s9,a2,s9
	andi	a6,a6,255
	andi	s11,a3,255
	add	t0,a2,t0
	andi	a3,t1,255
	addi	a1,a1,832
	add	a5,a2,a5
	lw	t1,256(s9)
	lw	a5,256(a5)
	addi	s9,a6,576
	addi	s10,s10,832
	lw	a6,0(t0)
	slli	a1,a1,2
	slli	a4,a4,2
	addi	a3,a3,576
	slli	s10,s10,2
	slli	t2,t2,2
	add	a1,a2,a1
	add	a4,a2,a4
	slli	a3,a3,2
	lw	a1,0(a1)
	add	a3,a2,a3
	lw	a4,256(a4)
	addi	s8,s8,832
	add	s10,a2,s10
	add	t2,a2,t2
	xor	a6,a5,a6
	lw	s10,0(s10)
	lw	a5,0(a3)
	srli	t6,a7,8
	lw	a3,12(a0)
	lw	t2,256(t2)
	slli	s8,s8,2
	srli	a7,a7,16
	andi	t6,t6,255
	andi	t3,t3,255
	andi	t5,t5,255
	andi	t4,t4,255
	add	s8,a2,s8
	andi	a7,a7,255
	xor	a4,a4,a1
	lw	s8,0(s8)
	slli	t6,t6,2
	slli	t3,t3,2
	addi	a7,a7,576
	addi	s11,s11,576
	slli	t5,t5,2
	slli	t4,t4,2
	lw	t0,0(a0)
	xor	t2,t2,s10
	xor	a4,a4,a3
	lw	s10,8(a0)
	lw	a3,4(a0)
	add	t6,a2,t6
	slli	s9,s9,2
	add	t3,a2,t3
	slli	a7,a7,2
	slli	s11,s11,2
	add	t5,a2,t5
	add	t4,a2,t4
	add	a7,a2,a7
	lw	t6,1280(t6)
	lw	t3,1280(t3)
	lw	t5,1280(t5)
	lw	t4,1280(t4)
	add	s9,a2,s9
	add	s11,a2,s11
	lw	a1,0(a7)
	xor	s8,t1,s8
	lw	s9,0(s9)
	lw	s11,0(s11)
	xor	a3,a6,a3
	xor	t0,s8,t0
	xor	t2,t2,s10
	xor	t1,t0,t6
	xor	a7,a4,t3
	xor	a6,t2,t5
	xor	a3,a3,t4
	addi	a0,a0,16
	xor	t1,t1,s9
	xor	a7,a7,s11
	xor	a6,a6,a5
	xor	a3,a3,a1
	bne	a0,s3,.L230
	addi	s8,s5,12
	addi	t2,s5,8
	addi	t5,s5,4
	addi	t6, s5, 0
.L229:
	srli	a1,a3,24
	srli	a5,a7,8
	andi	a4,t1,255
	add	a1,a2,a1
	andi	a5,a5,255
	lbu	a1,0(a1)
	add	a4,a2,a4
	add	a5,a2,a5
	lbu	s10,0(a4)
	srli	t0,t1,8
	lbu	a4,0(a5)
	srli	t3,a3,8
	srli	a0,a6,16
	andi	t0,t0,255
	andi	t3,t3,255
	andi	a0,a0,255
	add	t0,a2,t0
	add	t3,a2,t3
	add	a0,a2,a0
	slli	a1,a1,24
	lbu	a5,0(t0)
	or	a1,a1,s10
	lbu	t0,0(t3)
	srli	s9,a6,24
	lbu	t3,0(a0)
	srli	t4,a7,24
	add	a0,s2,t2
	add	t6,s2,t6
	add	t5,s2,t5
	slli	a4,a4,8
	lw	t2,0(t6)
	or	a4,a1,a4
	lw	t6,0(t5)
	andi	a1,a6,255
	lw	t5,0(a0)
	add	s9,a2,s9
	andi	a0,a3,255
	add	t4,a2,t4
	lbu	s9,0(s9)
	lbu	t4,0(t4)
	add	a0,a2,a0
	add	a1,a2,a1
	lbu	s10,0(a0)
	lbu	a1,0(a1)
	srli	a6,a6,8
	andi	a6,a6,255
	slli	s9,s9,24
	slli	t4,t4,24
	srli	a3,a3,16
	add	a6,a2,a6
	andi	a0,a3,255
	or	a3,s9,s10
	lbu	s10,0(a6)
	srli	s9,a7,16
	or	a6,t4,a1
	srli	t4,t1,16
	srli	t1,t1,24
	add	t1,a2,t1
	andi	s9,s9,255
	andi	a7,a7,255
	andi	t4,t4,255
	lbu	a1,0(t1)
	add	t4,a2,t4
	add	s9,a2,s9
	add	a7,a2,a7
	lbu	a7,0(a7)
	lbu	t1,0(t4)
	lbu	s9,0(s9)
	add	a0,a2,a0
	lbu	a0,0(a0)
	slli	t0,t0,8
	slli	a1,a1,24
	add	s8,s2,s8
	slli	a5,a5,8
	lw	s8,0(s8)
	or	a6,a6,t0
	slli	t3,t3,16
	or	a5,a3,a5
	slli	t1,t1,16
	or	a3,a1,a7
	slli	s9,s9,16
	slli	s10,s10,8
	or	a1,a6,t1
	or	a4,a4,t3
	slli	a0,a0,16
	or	a5,a5,s9
	or	a3,a3,s10
	xor	a5,a5,t6
	xor	a1,a1,t5
	xor	a4,a4,t2
	or	a3,a3,a0
	xor	a3,a3,s8
	srli	t0,a4,24
	srli	t6,a4,16
	srli	t5,a4,8
	srli	t4,a5,24
	srli	t3,a5,16
	srli	t1,a5,8
	srli	a7,a1,24
	srli	a6,a1,16
	srli	a0,a1,8
	sb	a4,0(s1)
	sb	a5,4(s1)
	sb	a1,8(s1)
	sb	t0,3(s1)
	sb	t6,2(s1)
	sb	t5,1(s1)
	sb	t4,7(s1)
	sb	t3,6(s1)
	sb	t1,5(s1)
	sb	a7,11(s1)
	sb	a6,10(s1)
	sb	a0,9(s1)
	srli	a1,a3,24
	srli	a4,a3,16
	srli	a5,a3,8
	sb	a1,15(s1)
	addi	s0,s0,16
	sb	a3,12(s1)
	sb	a4,14(s1)
	sb	a5,13(s1)
	addi	s1,s1,16
	bne	s0,s6,.L231
	lw	s0,44(sp)
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
	addi	sp,sp,48
	jalr	zero, ra, 0
.L233:
	addi	s8, zero, 28
	addi	t2, zero, 24
	addi	t5, zero, 20
	addi	t6, zero, 16
	jal	zero, .L229
.L237:
	jalr	zero, ra, 0
	.size	_nettle_aes_decrypt, .-_nettle_aes_decrypt
	.align	2
	.type	benchmark_body.constprop.0.isra.0, @function
benchmark_body.constprop.0.isra.0:
	addi	sp,sp,-32
	sw	s0,24(sp)
	lui	s0,%hi(.LANCHOR0)
	sw	s4,8(sp)
	sw	s5,4(sp)
	sw	s6,0(sp)
	addi	s0,s0,%lo(.LANCHOR0)
	lui	s6,%hi(.LANCHOR1+256)
	lui	s5,%hi(.LANCHOR0+744)
	lui	s4,%hi(_aes_decrypt_table)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	addi	s1,s0,504
	addi	s6,s6,%lo(.LANCHOR1+256)
	addi	s5,s5,%lo(.LANCHOR0+744)
	addi	s4,s4,%lo(_aes_decrypt_table)
	addi	s3, zero, 78
	addi	s2, zero, 14
.L241:
	sw	s2,256(s0)
.Lpcrel_7:
	auipc	ra, %pcrel_hi(_aes_set_key.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_7)
.Lpcrel_8:
	auipc	ra, %pcrel_hi(_nettle_aes_encrypt.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_8)
	addi	a3, s6, 0
	addi	a2, s1, 0
	addi	a1, zero, 8
	addi	a0, zero, 14
	sw	s2,500(s0)
.Lpcrel_9:
	auipc	ra, %pcrel_hi(_aes_set_key)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_9)
	addi	a2, s1, 0
	addi	a1, s1, 0
	addi	a0, zero, 14
.Lpcrel_10:
	auipc	ra, %pcrel_hi(_nettle_aes_invert)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_10)
	addi	a5, s0, 0
	addi	a4, s5, 0
	addi	a2, s4, 0
	addi	a1, s1, 0
	addi	a3, zero, 256
	addi	a0, zero, 14
	addi	s3,s3,-1
	sw	s2,500(s0)
.Lpcrel_11:
	auipc	ra, %pcrel_hi(_nettle_aes_decrypt)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_11)
	bne	s3,zero,.L241
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
	.size	benchmark_body.constprop.0.isra.0, .-benchmark_body.constprop.0.isra.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	bge	zero, a0, .L249
	addi	sp,sp,-48
	sw	s0,40(sp)
	lui	s0,%hi(.LANCHOR0)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	addi	s0,s0,%lo(.LANCHOR0)
	lui	s7,%hi(.LANCHOR1+256)
	lui	s6,%hi(.LANCHOR0+744)
	lui	s5,%hi(_aes_decrypt_table)
	sw	s1,36(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	ra,44(sp)
	addi	s4, a0, 0
	addi	s1,s0,504
	addi	s7,s7,%lo(.LANCHOR1+256)
	addi	s6,s6,%lo(.LANCHOR0+744)
	addi	s5,s5,%lo(_aes_decrypt_table)
	addi	s3, zero, 0
	addi	s2, zero, 14
.L246:
	sw	s2,256(s0)
.Lpcrel_12:
	auipc	ra, %pcrel_hi(_aes_set_key.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_12)
.Lpcrel_13:
	auipc	ra, %pcrel_hi(_nettle_aes_encrypt.constprop.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_13)
	addi	a3, s7, 0
	addi	a2, s1, 0
	addi	a1, zero, 8
	addi	a0, zero, 14
	sw	s2,500(s0)
.Lpcrel_14:
	auipc	ra, %pcrel_hi(_aes_set_key)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_14)
	addi	a2, s1, 0
	addi	a1, s1, 0
	addi	a0, zero, 14
.Lpcrel_15:
	auipc	ra, %pcrel_hi(_nettle_aes_invert)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_15)
	addi	a5, s0, 0
	addi	a4, s6, 0
	addi	a2, s5, 0
	addi	a1, s1, 0
	addi	a3, zero, 256
	addi	a0, zero, 14
	addi	s3,s3,1
	sw	s2,500(s0)
.Lpcrel_16:
	auipc	ra, %pcrel_hi(_nettle_aes_decrypt)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_16)
	bne	s3,s4,.L246
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
.L249:
	jalr	zero, ra, 0
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.globl	aes_encrypt
	.type	aes_encrypt, @function
aes_encrypt:
	addi	a6, a0, 0
	lw	a0,0(a0)
	addi	a4, a2, 0
	lui	a2,%hi(_aes_encrypt_table)
	addi	sp,sp,-16
	addi	a5, a3, 0
	addi	a2,a2,%lo(_aes_encrypt_table)
	addi	a3, a1, 0
	addi	a1,a6,4
	sw	ra,12(sp)
.Lpcrel_17:
	auipc	ra, %pcrel_hi(_nettle_aes_encrypt)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_17)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	aes_encrypt, .-aes_encrypt
	.align	2
	.globl	aes_decrypt
	.type	aes_decrypt, @function
aes_decrypt:
	addi	a6, a0, 0
	lw	a0,0(a0)
	addi	a4, a2, 0
	lui	a2,%hi(_aes_decrypt_table)
	addi	sp,sp,-16
	addi	a5, a3, 0
	addi	a2,a2,%lo(_aes_decrypt_table)
	addi	a3, a1, 0
	addi	a1,a6,4
	sw	ra,12(sp)
.Lpcrel_18:
	auipc	ra, %pcrel_hi(_nettle_aes_decrypt)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_18)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	aes_decrypt, .-aes_decrypt
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a3,%hi(.LANCHOR0)
	lui	a2,%hi(.LANCHOR1)
	addi	a3,a3,%lo(.LANCHOR0)
	addi	a2,a2,%lo(.LANCHOR1)
	addi	a6,a3,744
	addi	t3,a3,256
	addi	a1,a2,288
	addi	a0, zero, 1
.L257:
	lbu	a5,0(a2)
	lbu	t1,0(a6)
	lbu	a4,0(a3)
	lbu	a7,0(a1)
	sub	a5,a5,t1
	sltiu	a5, a5, 1
	sub	a4,a4,a7
	sltiu	a4, a4, 1
	and	a5,a5,a4
	addi	a3,a3,1
	addi	a2,a2,1
	addi	a6,a6,1
	and	a0,a0,a5
	addi	a1,a1,1
	bne	t3,a3,.L257
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
.Lpcrel_19:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_19)
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
.Lpcrel_20:
	auipc	ra, %pcrel_hi(benchmark_body.constprop.0.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_20)
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
	sw	ra,28(sp)
 #APP
# 15 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	addi	a0, zero, 0
# 0 "" 2
 #NO_APP
	addi	a0, zero, 1
.Lpcrel_21:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_21)
.Lpcrel_22:
	auipc	ra, %pcrel_hi(start_trigger)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_22)
.Lpcrel_23:
	auipc	ra, %pcrel_hi(benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_23)
	sw	zero,12(sp)
.Lpcrel_24:
	auipc	ra, %pcrel_hi(stop_trigger)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_24)
	lui	a3,%hi(.LANCHOR0)
	lui	a2,%hi(.LANCHOR1)
	lw	a5,12(sp)
	addi	a3,a3,%lo(.LANCHOR0)
	addi	a2,a2,%lo(.LANCHOR1)
	addi	a6,a3,744
	addi	t3,a3,256
	addi	a1,a2,288
	addi	a0, zero, 1
.L265:
	lbu	a5,0(a2)
	lbu	t1,0(a6)
	lbu	a4,0(a3)
	lbu	a7,0(a1)
	sub	a5,a5,t1
	sltiu	a5, a5, 1
	sub	a4,a4,a7
	sltiu	a4, a4, 1
	and	a5,a5,a4
	addi	a3,a3,1
	addi	a2,a2,1
	addi	a6,a6,1
	and	a0,a0,a5
	addi	a1,a1,1
	bne	t3,a3,.L265
	lw	ra,28(sp)
	xori	a0,a0,1
	addi	sp,sp,32
	jalr	zero, ra, 0
	.size	main, .-main
	.globl	decctx
	.globl	encctx
	.globl	decrypted
	.globl	encrypted
	.globl	expected
	.globl	plaintext
	.globl	key
	.globl	_aes_encrypt_table
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	rcon.0, @object
	.size	rcon.0, 10
rcon.0:
	.base64	"AQIECBAgQIAbNg=="
	.zero	2
	.type	mtable, @object
	.size	mtable, 1024
mtable:
	.word	0
	.word	185403662
	.word	370807324
	.word	488053522
	.word	741614648
	.word	658058550
	.word	976107044
	.word	824393514
	.word	1483229296
	.word	1399144830
	.word	1316117100
	.word	1165972322
	.word	1952214088
	.word	2136040774
	.word	1648787028
	.word	1766553434
	.word	-1328508704
	.word	-1143105042
	.word	-1496677636
	.word	-1379431438
	.word	-1662733096
	.word	-1746289194
	.word	-1963022652
	.word	-2114736182
	.word	-390539120
	.word	-474623586
	.word	-22885748
	.word	-173030526
	.word	-997393240
	.word	-813566554
	.word	-761860428
	.word	-644094022
	.word	2075868123
	.word	1890988757
	.word	1839278535
	.word	1722556617
	.word	1468997603
	.word	1552029421
	.word	1100287487
	.word	1251476721
	.word	601060267
	.word	685669029
	.word	902390199
	.word	1053059257
	.word	266819475
	.word	82468509
	.word	436028815
	.word	317738113
	.word	-882136261
	.word	-1067015627
	.word	-579749593
	.word	-696471511
	.word	-413167869
	.word	-330136051
	.word	-247096033
	.word	-95906799
	.word	-1828461749
	.word	-1743852987
	.word	-2061897385
	.word	-1911228327
	.word	-1086863501
	.word	-1271214467
	.word	-1456614033
	.word	-1574904735
	.word	-160598355
	.word	-44007517
	.word	-529046351
	.word	-344298049
	.word	-631680363
	.word	-783000677
	.word	-868007799
	.word	-951170681
	.word	-1375387939
	.word	-1526188077
	.word	-1205916479
	.word	-1290656305
	.word	-2110711067
	.word	-1992551445
	.word	-1809118983
	.word	-1624899081
	.word	1186850381
	.word	1303441219
	.word	1353184337
	.word	1537932639
	.word	1787413109
	.word	1636092795
	.word	2090061929
	.word	2006899047
	.word	517320253
	.word	366520115
	.word	147831841
	.word	63092015
	.word	853641733
	.word	971801355
	.word	620468249
	.word	804688151
	.word	-1915335306
	.word	-2032450440
	.word	-1681105046
	.word	-1866377628
	.word	-1578997426
	.word	-1427152832
	.word	-1208452270
	.word	-1124765092
	.word	-708967162
	.word	-558691320
	.word	-1012656358
	.word	-928440812
	.word	-108388034
	.word	-226023376
	.word	-275762398
	.word	-459458004
	.word	1023860118
	.word	906744984
	.word	723308426
	.word	538035844
	.word	288553390
	.word	440397984
	.word	120122290
	.word	203809468
	.word	1701746150
	.word	1852021992
	.word	1937016826
	.word	2021232372
	.word	1230680542
	.word	1113045200
	.word	1598071746
	.word	1414376140
	.word	-136647615
	.word	-52959921
	.word	-507445667
	.word	-355600557
	.word	-605108103
	.word	-790380169
	.word	-839591323
	.word	-956705941
	.word	-1347247055
	.word	-1530942145
	.word	-1180125651
	.word	-1297760477
	.word	-2088337399
	.word	-2004121337
	.word	-1784901099
	.word	-1634624741
	.word	1191869601
	.word	1275557295
	.word	1360031421
	.word	1511876531
	.word	1799248025
	.word	1613975959
	.word	2099530373
	.word	1982415755
	.word	526529745
	.word	342834655
	.word	158869197
	.word	41234371
	.word	861278441
	.word	945494503
	.word	625738485
	.word	776014843
	.word	-1939744870
	.word	-2022908268
	.word	-1703164538
	.word	-1854485368
	.word	-1604979806
	.word	-1420232020
	.word	-1236278850
	.word	-1119688528
	.word	-737566742
	.word	-553347356
	.word	-1038905866
	.word	-920746760
	.word	-130171950
	.word	-214912292
	.word	-299390514
	.word	-450191168
	.word	1018251130
	.word	935087732
	.word	715871590
	.word	564550760
	.word	277177154
	.word	461924940
	.word	111112542
	.word	227702864
	.word	1691946762
	.word	1876166148
	.word	1925389590
	.word	2043548696
	.word	1223502642
	.word	1138762300
	.word	1593260334
	.word	1442459680
	.word	28809964
	.word	179999714
	.word	397248752
	.word	480281086
	.word	763608788
	.word	646887386
	.word	999926984
	.word	815048134
	.word	1507840668
	.word	1389550482
	.word	1338359936
	.word	1154009486
	.word	1978398372
	.word	2129067946
	.word	1676797112
	.word	1761406390
	.word	-1318647284
	.word	-1167457534
	.word	-1484974064
	.word	-1401941730
	.word	-1655493068
	.word	-1772214470
	.word	-1958134744
	.word	-2143013594
	.word	-384875908
	.word	-503166094
	.word	-15380384
	.word	-199730834
	.word	-985962940
	.word	-835293366
	.word	-752782248
	.word	-668172970
	.word	2047648055
	.word	1895934009
	.word	1813426987
	.word	1729870373
	.word	1446544655
	.word	1563790337
	.word	1076008723
	.word	1261411869
	.word	577038663
	.word	694804553
	.word	880737115
	.word	1064563285
	.word	240176511
	.word	90031217
	.word	407560035
	.word	323475053
	.word	-891538985
	.word	-1043253031
	.word	-590994485
	.word	-674551099
	.word	-420997649
	.word	-303751967
	.word	-252573709
	.word	-67170563
	.word	-1833666137
	.word	-1715900247
	.word	-2068943941
	.word	-1885117771
	.word	-1098883681
	.word	-1249028975
	.word	-1466282109
	.word	-1550367091
	.type	_aes_decrypt_table, @object
	.size	_aes_decrypt_table, 4352
_aes_decrypt_table:
	.base64	"Uglq1TA2pTi/QKOegfPX+3zjOYKbL/+HNI5DRMTe6ctUe5QypsIjPe5MlQtC+sNOCC6hZijZJLJ2W6JJbYvRJXL49mSGaJgW1KRczF1ltpJscEhQ/e252l4VRlenjZ2EkNirAIy80wr35FgFuLNFBtAsHo/KPw8Cwa+9AwETims6kRFBT2fc6pfyz87wtOZzlqx0IuetNYXi+TfoHHXfbkfxGnEdKcWJb7diDqoYvhv8Vj5LxtJ5IJrbwP54zVr0H92oM4gHxzGxEhBZJ4DsX2BRf6kZtUoNLeV6n5PJnO+g4DtNrir1sMjruzyDU5lhFysEfrp31ibhaRRjVSEM"
	.ascii	"}"
	.word	1353184337
	.word	1399144830
	.word	-1012656358
	.word	-1772214470
	.word	-882136261
	.word	-247096033
	.word	-1420232020
	.word	-1828461749
	.word	1442459680
	.word	-160598355
	.word	-1854485368
	.word	625738485
	.word	-52959921
	.word	-674551099
	.word	-2143013594
	.word	-1885117771
	.word	1230680542
	.word	1729870373
	.word	-1743852987
	.word	-507445667
	.word	41234371
	.word	317738113
	.word	-1550367091
	.word	-956705941
	.word	-413167869
	.word	-1784901099
	.word	-344298049
	.word	-631680363
	.word	763608788
	.word	-752782248
	.word	694804553
	.word	1154009486
	.word	1787413109
	.word	2021232372
	.word	1799248025
	.word	-579749593
	.word	-1236278850
	.word	397248752
	.word	1722556617
	.word	-1271214467
	.word	407560035
	.word	-2110711067
	.word	1613975959
	.word	1165972322
	.word	-529046351
	.word	-2068943941
	.word	480281086
	.word	-1809118983
	.word	1483229296
	.word	436028815
	.word	-2022908268
	.word	-1208452270
	.word	601060267
	.word	-503166094
	.word	1468997603
	.word	715871590
	.word	120122290
	.word	63092015
	.word	-1703164538
	.word	-1526188077
	.word	-226023376
	.word	-1297760477
	.word	-1167457534
	.word	1552029421
	.word	723308426
	.word	-1833666137
	.word	-252573709
	.word	-1578997426
	.word	-839591323
	.word	-708967162
	.word	526529745
	.word	-1963022652
	.word	-1655493068
	.word	-1604979806
	.word	853641733
	.word	1978398372
	.word	971801355
	.word	-1427152832
	.word	111112542
	.word	1360031421
	.word	-108388034
	.word	1023860118
	.word	-1375387939
	.word	1186850381
	.word	-1249028975
	.word	90031217
	.word	1876166148
	.word	-15380384
	.word	620468249
	.word	-1746289194
	.word	-868007799
	.word	2006899047
	.word	-1119688528
	.word	-2004121337
	.word	945494503
	.word	-605108103
	.word	1191869601
	.word	-384875908
	.word	-920746760
	.word	0
	.word	-2088337399
	.word	1223502642
	.word	-1401941730
	.word	1316117100
	.word	-67170563
	.word	1446544655
	.word	517320253
	.word	658058550
	.word	1691946762
	.word	564550760
	.word	-783000677
	.word	976107044
	.word	-1318647284
	.word	266819475
	.word	-761860428
	.word	-1634624741
	.word	1338359936
	.word	-1574904735
	.word	1766553434
	.word	370807324
	.word	179999714
	.word	-450191168
	.word	1138762300
	.word	488053522
	.word	185403662
	.word	-1379431438
	.word	-1180125651
	.word	-928440812
	.word	-2061897385
	.word	1275557295
	.word	-1143105042
	.word	-44007517
	.word	-1624899081
	.word	-1124765092
	.word	-985962940
	.word	880737115
	.word	1982415755
	.word	-590994485
	.word	1761406390
	.word	1676797112
	.word	-891538985
	.word	277177154
	.word	1076008723
	.word	538035844
	.word	2099530373
	.word	-130171950
	.word	288553390
	.word	1839278535
	.word	1261411869
	.word	-214912292
	.word	-330136051
	.word	-790380169
	.word	1813426987
	.word	-1715900247
	.word	-95906799
	.word	577038663
	.word	-997393240
	.word	440397984
	.word	-668172970
	.word	-275762398
	.word	-951170681
	.word	-1043253031
	.word	-22885748
	.word	906744984
	.word	-813566554
	.word	685669029
	.word	646887386
	.word	-1530942145
	.word	-459458004
	.word	227702864
	.word	-1681105046
	.word	1648787028
	.word	-1038905866
	.word	-390539120
	.word	1593260334
	.word	-173030526
	.word	-1098883681
	.word	2090061929
	.word	-1456614033
	.word	-1290656305
	.word	999926984
	.word	-1484974064
	.word	1852021992
	.word	2075868123
	.word	158869197
	.word	-199730834
	.word	28809964
	.word	-1466282109
	.word	1701746150
	.word	2129067946
	.word	147831841
	.word	-420997649
	.word	-644094022
	.word	-835293366
	.word	-737566742
	.word	-696471511
	.word	-1347247055
	.word	824393514
	.word	815048134
	.word	-1067015627
	.word	935087732
	.word	-1496677636
	.word	-1328508704
	.word	366520115
	.word	1251476721
	.word	-136647615
	.word	240176511
	.word	804688151
	.word	-1915335306
	.word	1303441219
	.word	1414376140
	.word	-553347356
	.word	-474623586
	.word	461924940
	.word	-1205916479
	.word	2136040774
	.word	82468509
	.word	1563790337
	.word	1937016826
	.word	776014843
	.word	1511876531
	.word	1389550482
	.word	861278441
	.word	323475053
	.word	-1939744870
	.word	2047648055
	.word	-1911228327
	.word	-1992551445
	.word	-299390514
	.word	902390199
	.word	-303751967
	.word	1018251130
	.word	1507840668
	.word	1064563285
	.word	2043548696
	.word	-1086863501
	.word	-355600557
	.word	1537932639
	.word	342834655
	.word	-2032450440
	.word	-2114736182
	.word	1053059257
	.word	741614648
	.word	1598071746
	.word	1925389590
	.word	203809468
	.word	-1958134744
	.word	1100287487
	.word	1895934009
	.word	-558691320
	.word	-1662733096
	.word	-1866377628
	.word	1636092795
	.word	1890988757
	.word	1952214088
	.word	1113045200
	.word	-1477160624
	.word	1698790995
	.word	-1541989693
	.word	1579629206
	.word	1806384075
	.word	1167925233
	.word	1492823211
	.word	65227667
	.word	-97509291
	.word	1836494326
	.word	1993115793
	.word	1275262245
	.word	-672837636
	.word	-886389289
	.word	1144333952
	.word	-1553812081
	.word	1521606217
	.word	465184103
	.word	250234264
	.word	-1057071647
	.word	1966064386
	.word	-263421678
	.word	-1756983901
	.word	-103584826
	.word	1603208167
	.word	-1668147819
	.word	2054012907
	.word	1498584538
	.word	-2084645843
	.word	561273043
	.word	1776306473
	.word	-926314940
	.word	-1983744662
	.word	2039411832
	.word	1045993835
	.word	1907959773
	.word	1340194486
	.word	-1383534569
	.word	-1407137434
	.word	986611124
	.word	1256153880
	.word	823846274
	.word	860985184
	.word	2136171077
	.word	2003087840
	.word	-1368671356
	.word	-1602093540
	.word	722008468
	.word	1749577816
	.word	-45773031
	.word	1826526343
	.word	-126135625
	.word	-747394269
	.word	38499042
	.word	-1893735593
	.word	-1420466646
	.word	686535175
	.word	-1028313341
	.word	2076542618
	.word	137876389
	.word	-2027409166
	.word	-1514200142
	.word	1778582202
	.word	-2112426660
	.word	483363371
	.word	-1267095662
	.word	-234359824
	.word	-496415071
	.word	-187013683
	.word	-1106966827
	.word	1647628575
	.word	-22625142
	.word	1395537053
	.word	1442030240
	.word	-511048398
	.word	-336157579
	.word	-326956231
	.word	-278904662
	.word	-1619960314
	.word	275692881
	.word	-1977532679
	.word	115185213
	.word	88006062
	.word	-1108980410
	.word	-1923837515
	.word	1573155077
	.word	-737803153
	.word	357589247
	.word	-73918172
	.word	-373434729
	.word	1128303052
	.word	-1629919369
	.word	1122545853
	.word	-1953953912
	.word	1528424248
	.word	-288851493
	.word	175939911
	.word	256015593
	.word	512030921
	.word	0
	.word	-2038429309
	.word	-315936184
	.word	1880170156
	.word	1918528590
	.word	-15794693
	.word	948244310
	.word	-710001378
	.word	959264295
	.word	-653325724
	.word	-1503893471
	.word	1415289809
	.word	775300154
	.word	1728711857
	.word	-413691121
	.word	-1762741038
	.word	-1852105826
	.word	-977239985
	.word	551313826
	.word	1266113129
	.word	437394454
	.word	-1164713462
	.word	715178213
	.word	-534627261
	.word	387650077
	.word	218697227
	.word	-947129683
	.word	-1464455751
	.word	-1457646392
	.word	435246981
	.word	125153100
	.word	-577114437
	.word	1618977789
	.word	637663135
	.word	-177054532
	.word	996558021
	.word	2130402100
	.word	692292470
	.word	-970732580
	.word	-51530136
	.word	-236668829
	.word	-600713270
	.word	-2057092592
	.word	580326208
	.word	298222624
	.word	608863613
	.word	1035719416
	.word	855223825
	.word	-1591097491
	.word	798891339
	.word	817028339
	.word	1384517100
	.word	-473860144
	.word	380840812
	.word	-1183798887
	.word	1217663482
	.word	1693009698
	.word	-1929598780
	.word	1072734234
	.word	746411736
	.word	-1875696913
	.word	1313441735
	.word	-784803391
	.word	-1563783938
	.word	198481974
	.word	-2114607409
	.word	-562387672
	.word	-1900553690
	.word	-1079165020
	.word	-1657131804
	.word	-1837608947
	.word	-866162021
	.word	1182684258
	.word	328070850
	.word	-1193766680
	.word	-147247522
	.word	-1346141451
	.word	-2141347906
	.word	-1815058052
	.word	768962473
	.word	304467891
	.word	-1716729797
	.word	2098729127
	.word	1671227502
	.word	-1153705093
	.word	2015808777
	.word	408514292
	.word	-1214583807
	.word	-1706064984
	.word	1855317605
	.word	-419452290
	.word	-809754360
	.word	-401215514
	.word	-1679312167
	.word	913263310
	.word	161475284
	.word	2091919830
	.word	-1297862225
	.word	591342129
	.word	-1801075152
	.word	1721906624
	.word	-1135709129
	.word	-897385306
	.word	-795811664
	.word	-660131051
	.word	-1744506550
	.word	-622050825
	.word	1355644686
	.word	-158263505
	.word	-699566451
	.word	-1326496947
	.word	1303039060
	.word	76997855
	.word	-1244553501
	.word	-2006299621
	.word	523026872
	.word	1365591679
	.word	-362898172
	.word	898367837
	.word	1955068531
	.word	1091304238
	.word	493335386
	.word	-757362094
	.word	1443948851
	.word	1205234963
	.word	1641519756
	.word	211892090
	.word	351820174
	.word	1007938441
	.word	665439982
	.word	-916342987
	.word	-451091987
	.word	-1320715716
	.word	-539845543
	.word	1945261375
	.word	-837543815
	.word	935818175
	.word	-839429142
	.word	-1426235557
	.word	1866325780
	.word	-616269690
	.word	-206583167
	.word	-999769794
	.word	874788908
	.word	1084473951
	.word	-1021503886
	.word	635616268
	.word	1228679307
	.word	-1794244799
	.word	27801969
	.word	-1291056930
	.word	-457910116
	.word	-1051302768
	.word	-2067039391
	.word	-1238182544
	.word	1550600308
	.word	1471729730
	.word	-195997529
	.word	1098797925
	.word	387629988
	.word	658151006
	.word	-1422144661
	.word	-1658851003
	.word	-89347240
	.word	-481586429
	.word	807425530
	.word	1991112301
	.word	-863465098
	.word	49620300
	.word	-447742761
	.word	717608907
	.word	891715652
	.word	1656065955
	.word	-1310832294
	.word	-1171953893
	.word	-364537842
	.word	-27401792
	.word	801309301
	.word	1283527408
	.word	1183687575
	.word	-747911431
	.word	-1895569569
	.word	-1844079204
	.word	1841294202
	.word	1385552473
	.word	-1093390973
	.word	1951978273
	.word	-532076183
	.word	-913423160
	.word	-1032492407
	.word	-1896580999
	.word	1486449470
	.word	-1188569743
	.word	-507595185
	.word	-1997531219
	.word	550069932
	.word	-830622662
	.word	-547153846
	.word	451248689
	.word	1368875059
	.word	1398949247
	.word	1689378935
	.word	1807451310
	.word	-2114052960
	.word	150574123
	.word	1215322216
	.word	1167006205
	.word	-560691348
	.word	2069018616
	.word	1940595667
	.word	1265820162
	.word	534992783
	.word	1432758955
	.word	-340654296
	.word	-1255210046
	.word	-981034373
	.word	936617224
	.word	674296455
	.word	-1088179547
	.word	50510442
	.word	384654466
	.word	-813028580
	.word	2041025204
	.word	133427442
	.word	1766760930
	.word	-630862348
	.word	84334014
	.word	886120290
	.word	-1497068802
	.word	775200083
	.word	-207445931
	.word	-1979370783
	.word	-156994069
	.word	-2096416276
	.word	1614850799
	.word	1901987487
	.word	1857900816
	.word	557775242
	.word	-577356538
	.word	1054715397
	.word	-431143235
	.word	1418835341
	.word	-999226019
	.word	100954068
	.word	1348534037
	.word	-1743182597
	.word	-1110009879
	.word	1082772547
	.word	-647530594
	.word	-391070398
	.word	-1995994997
	.word	434583643
	.word	-931537938
	.word	2090944266
	.word	1115482383
	.word	-2064070370
	.word	0
	.word	-2146860154
	.word	724715757
	.word	287222896
	.word	1517047410
	.word	251526143
	.word	-2062592456
	.word	-1371726123
	.word	758523705
	.word	252339417
	.word	1550328230
	.word	1536938324
	.word	908343854
	.word	168604007
	.word	1469255655
	.word	-290139498
	.word	-1692688751
	.word	-1065332795
	.word	-597581280
	.word	2002413899
	.word	303830554
	.word	-1813902662
	.word	-1597971158
	.word	574374880
	.word	454171927
	.word	151915277
	.word	-1947030073
	.word	-1238517336
	.word	504678569
	.word	-245922535
	.word	1974422535
	.word	-1712407587
	.word	2141453664
	.word	33005350
	.word	1918680309
	.word	1715782971
	.word	-77908866
	.word	1133213225
	.word	600562886
	.word	-306812676
	.word	-457677839
	.word	836225756
	.word	1665273989
	.word	-1760346078
	.word	-964419567
	.word	1250262308
	.word	-1143801795
	.word	-106032846
	.word	700935585
	.word	-1642247377
	.word	-1294142672
	.word	-2045907886
	.word	-1049112349
	.word	-1288999914
	.word	1890163129
	.word	-1810761144
	.word	-381214108
	.word	-56048500
	.word	-257942977
	.word	2102843436
	.word	857927568
	.word	1233635150
	.word	953795025
	.word	-896729438
	.word	-728222197
	.word	-173617279
	.word	2057644254
	.word	-1210440050
	.word	-1388337985
	.word	976020637
	.word	2018512274
	.word	1600822220
	.word	2119459398
	.word	-1913208301
	.word	-661591880
	.word	959340279
	.word	-1014827601
	.word	1570750080
	.word	-798393197
	.word	-714102483
	.word	634368786
	.word	-1396163687
	.word	403744637
	.word	-1662488989
	.word	1004239803
	.word	650971512
	.word	1500443672
	.word	-1695809097
	.word	1334028442
	.word	-1780062866
	.word	-5603610
	.word	-1138685745
	.word	368043752
	.word	-407184997
	.word	1867173430
	.word	-1612000247
	.word	-1339435396
	.word	-1540247630
	.word	1059729699
	.word	-1513738092
	.word	-1573535642
	.word	1316239292
	.word	-2097371446
	.word	-1864322864
	.word	-1489824296
	.word	82922136
	.word	-331221030
	.word	-847311280
	.word	-1860751370
	.word	1299615190
	.word	-280801872
	.word	-1429449651
	.word	-1763385596
	.word	-778116171
	.word	1783372680
	.word	750893087
	.word	1699118929
	.word	1587348714
	.word	-1946067659
	.word	-2013629580
	.word	201010753
	.word	1739807261
	.word	-611167534
	.word	283718486
	.word	-697494713
	.word	-677737375
	.word	-1590199796
	.word	-128348652
	.word	334203196
	.word	-1446056409
	.word	1639396809
	.word	484568549
	.word	1199193265
	.word	-761505313
	.word	-229294221
	.word	337148366
	.word	-948715721
	.word	-145495347
	.word	-44082262
	.word	1038029935
	.word	1148749531
	.word	-1345682957
	.word	1756970692
	.word	607661108
	.word	-1547542720
	.word	488010435
	.word	-490992603
	.word	1009290057
	.word	234832277
	.word	-1472630527
	.word	201907891
	.word	-1260872476
	.word	1449431233
	.word	-881106556
	.word	852848822
	.word	1816687708
	.word	-1194311081
	.word	1364240372
	.word	2119394625
	.word	449029143
	.word	982933031
	.word	1003187115
	.word	535905693
	.word	-1398056710
	.word	1267925987
	.word	542505520
	.word	-1376359050
	.word	-2003732788
	.word	-182105086
	.word	1341970405
	.word	-975713494
	.word	645940277
	.word	-1248877726
	.word	-565617999
	.word	627514298
	.word	1167593194
	.word	1575076094
	.word	-1023249105
	.word	-2129465268
	.word	-1918658746
	.word	1808202195
	.word	65494927
	.word	362126482
	.word	-1075086739
	.word	-1780852398
	.word	-735214658
	.word	1490231668
	.word	1227450848
	.word	-1908094775
	.word	1969916354
	.word	-193431154
	.word	-1721024936
	.word	668823993
	.word	-1095348255
	.word	-266883704
	.word	-916018144
	.word	2108963534
	.word	1662536415
	.word	-444452582
	.word	-1755303087
	.word	1648721747
	.word	-1310689436
	.word	-1148932501
	.word	-31678335
	.word	-107730168
	.word	1884842056
	.word	-1894122171
	.word	-1803064098
	.word	1387788411
	.word	-1423715469
	.word	1927414347
	.word	-480800993
	.word	1714072405
	.word	-1308153621
	.word	788775605
	.word	-2036696123
	.word	-744159177
	.word	821200680
	.word	598910399
	.word	45771267
	.word	-312704490
	.word	-1976886065
	.word	-1483557767
	.word	-202313209
	.word	1319232105
	.word	1707996378
	.word	114671109
	.word	-786472396
	.word	-997523802
	.word	882725678
	.word	-1566550541
	.word	87220618
	.word	-1535775754
	.word	188345475
	.word	1084944224
	.word	1577492337
	.word	-1118760850
	.word	1056541217
	.word	-1774385443
	.word	-575797954
	.word	1296481766
	.word	-1850372780
	.word	1896177092
	.word	74437638
	.word	1627329872
	.word	421854104
	.word	-694687299
	.word	-1983102144
	.word	1735892697
	.word	-1329773848
	.word	126389129
	.word	-415737063
	.word	2044456648
	.word	-1589179780
	.word	2095648578
	.word	-121037180
	.word	0
	.word	159614592
	.word	843640107
	.word	514617361
	.word	1817080410
	.word	-33816818
	.word	257308805
	.word	1025430958
	.word	908540205
	.word	174381327
	.word	1747035740
	.word	-1680780197
	.word	607792694
	.word	212952842
	.word	-1827674281
	.word	-1261267218
	.word	463376795
	.word	-2142255680
	.word	1638015196
	.word	1516850039
	.word	471210514
	.word	-502613357
	.word	-1058723168
	.word	1011081250
	.word	303896347
	.word	235605257
	.word	-223492213
	.word	767142070
	.word	348694814
	.word	1468340721
	.word	-1353971851
	.word	-289677927
	.word	-1543675777
	.word	-140564991
	.word	1555887474
	.word	1153776486
	.word	1530167035
	.word	-1955190461
	.word	-874723805
	.word	-1234633491
	.word	-1201409564
	.word	-674571215
	.word	1108378979
	.word	322970263
	.word	-2078273082
	.word	-2055396278
	.word	-755483205
	.word	-1374604551
	.word	-949116631
	.word	491466654
	.word	-588042062
	.word	233591430
	.word	2010178497
	.word	728503987
	.word	-1449543312
	.word	301615252
	.word	1193436393
	.word	-1463513860
	.word	-1608892432
	.word	1457007741
	.word	586125363
	.word	-2016981431
	.word	-641609416
	.word	-1929469238
	.word	-1741288492
	.word	-1496350219
	.word	-1524048262
	.word	-635007305
	.word	1067761581
	.word	753179962
	.word	1343066744
	.word	1788595295
	.word	1415726718
	.word	-155053171
	.word	-1863796520
	.word	777975609
	.word	-2097827901
	.word	-1614905251
	.word	1769771984
	.word	1873358293
	.word	-810347995
	.word	-935618132
	.word	279411992
	.word	-395418724
	.word	-612648133
	.word	-855017434
	.word	1861490777
	.word	-335431782
	.word	-2086102449
	.word	-429560171
	.word	-1434523905
	.word	554225596
	.word	-270079979
	.word	-1160143897
	.word	1255028335
	.word	-355202657
	.word	701922480
	.word	833598116
	.word	707863359
	.word	-969894747
	.word	901801634
	.word	1949809742
	.word	-56178046
	.word	-525283184
	.word	857069735
	.word	-246769660
	.word	1106762476
	.word	2131644621
	.word	389019281
	.word	1989006925
	.word	1129165039
	.word	-866890326
	.word	-455146346
	.word	-1629243951
	.word	1276872810
	.word	-1044898004
	.word	1182749029
	.word	-1660622242
	.word	22885772
	.word	-93096825
	.word	-80854773
	.word	-1285939865
	.word	-1840065829
	.word	-382511600
	.word	1829980118
	.word	-1702075945
	.word	930745505
	.word	1502483704
	.word	-343327725
	.word	-823253079
	.word	-1221211807
	.word	-504503012
	.word	2050797895
	.word	-1671831598
	.word	1430221810
	.word	410635796
	.word	1941911495
	.word	1407897079
	.word	1599843069
	.word	-552308931
	.word	2022103876
	.word	-897453137
	.word	-1187068824
	.word	942421028
	.word	-1033944925
	.word	376619805
	.word	-1140054558
	.word	680216892
	.word	-12479219
	.word	963707304
	.word	148812556
	.word	-660806476
	.word	1687208278
	.word	2069988555
	.word	-714033614
	.word	1215585388
	.word	-800958536
	.type	_aes_encrypt_table, @object
	.size	_aes_encrypt_table, 4352
_aes_encrypt_table:
	.base64	"Y3x3e/Jrb8UwAWcr/terdsqCyX36WUfwrdSir5ykcsC3/ZMmNj/3zDSl5fFx2DEVBMcjwxiWBZoHEoDi6yeydQmDLBobblqgUjvWsynjL4RT0QDtIPyxW2rLvjlKTFjP0O+q+0NNM4VF+QJ/UDyfqFGjQI+SnTj1vLbaIRD/89LNDBPsX5dEF8Snfj1kXRlzYIFP3CIqkIhG7rgU3l4L2+AyOgpJBiRcwtOsYpGV5HnnyDdtjdVOqWxW9Opleq4IunglLhymtMbo3XQfS72LinA+tWZIA/YOYTVXuYbBHZ7h+JgRadmOlJseh+nOVSjfjKGJDb/mQmhBmS0PsFS7"
	.ascii	"\026"
	.word	-1520213050
	.word	-2072216328
	.word	-1720223762
	.word	-1921287178
	.word	234025727
	.word	-1117033514
	.word	-1318096930
	.word	1422247313
	.word	1345335392
	.word	50397442
	.word	-1452841010
	.word	2099981142
	.word	436141799
	.word	1658312629
	.word	-424957107
	.word	-1703512340
	.word	1170918031
	.word	-1652391393
	.word	1086966153
	.word	-2021818886
	.word	368769775
	.word	-346465870
	.word	-918075506
	.word	200339707
	.word	-324162239
	.word	1742001331
	.word	-39673249
	.word	-357585083
	.word	-1080255453
	.word	-140204973
	.word	-1770884380
	.word	1539358875
	.word	-1028147339
	.word	486407649
	.word	-1366060227
	.word	1780885068
	.word	1513502316
	.word	1094664062
	.word	49805301
	.word	1338821763
	.word	1546925160
	.word	-190470831
	.word	887481809
	.word	150073849
	.word	-1821281822
	.word	1943591083
	.word	1395732834
	.word	1058346282
	.word	201589768
	.word	1388824469
	.word	1696801606
	.word	1589887901
	.word	672667696
	.word	-1583966665
	.word	251987210
	.word	-1248159185
	.word	151455502
	.word	907153956
	.word	-1686077413
	.word	1038279391
	.word	652995533
	.word	1764173646
	.word	-843926913
	.word	-1619692054
	.word	453576978
	.word	-1635548387
	.word	1949051992
	.word	773462580
	.word	756751158
	.word	-1301385508
	.word	-296068428
	.word	-73359269
	.word	-162377052
	.word	1295727478
	.word	1641469623
	.word	-827083907
	.word	2066295122
	.word	1055122397
	.word	1898917726
	.word	-1752923117
	.word	-179088474
	.word	1758581177
	.word	0
	.word	753790401
	.word	1612718144
	.word	536673507
	.word	-927878791
	.word	-312779850
	.word	-1100322092
	.word	1187761037
	.word	-641810841
	.word	1262041458
	.word	-565556588
	.word	-733197160
	.word	-396863312
	.word	1255133061
	.word	1808847035
	.word	720367557
	.word	-441800113
	.word	385612781
	.word	-985447546
	.word	-682799718
	.word	1429418854
	.word	-1803188975
	.word	-817543798
	.word	284817897
	.word	100794884
	.word	-2122350594
	.word	-263171936
	.word	1144798328
	.word	-1163944155
	.word	-475486133
	.word	-212774494
	.word	-22830243
	.word	-1069531008
	.word	-1970303227
	.word	-1382903233
	.word	-1130521311
	.word	1211644016
	.word	83228145
	.word	-541279133
	.word	-1044990345
	.word	1977277103
	.word	1663115586
	.word	806359072
	.word	452984805
	.word	250868733
	.word	1842533055
	.word	1288555905
	.word	336333848
	.word	890442534
	.word	804056259
	.word	-513843266
	.word	-1567123659
	.word	-867941240
	.word	957814574
	.word	1472513171
	.word	-223893675
	.word	-2105639172
	.word	1195195770
	.word	-1402706744
	.word	-413311558
	.word	723065138
	.word	-1787595802
	.word	-1604296512
	.word	-1736343271
	.word	-783331426
	.word	2145180835
	.word	1713513028
	.word	2116692564
	.word	-1416589253
	.word	-2088204277
	.word	-901364084
	.word	703524551
	.word	-742868885
	.word	1007948840
	.word	2044649127
	.word	-497131844
	.word	487262998
	.word	1994120109
	.word	1004593371
	.word	1446130276
	.word	1312438900
	.word	503974420
	.word	-615954030
	.word	168166924
	.word	1814307912
	.word	-463709000
	.word	1573044895
	.word	1859376061
	.word	-273896381
	.word	-1503501628
	.word	-1466855111
	.word	-1533700815
	.word	937747667
	.word	-1954973198
	.word	854058965
	.word	1137232011
	.word	1496790894
	.word	-1217565222
	.word	-1936880383
	.word	1691735473
	.word	-766620004
	.word	-525751991
	.word	-1267962664
	.word	-95005012
	.word	133494003
	.word	636152527
	.word	-1352309302
	.word	-1904575756
	.word	-374428089
	.word	403179536
	.word	-709182865
	.word	-2005370640
	.word	1864705354
	.word	1915629148
	.word	605822008
	.word	-240736681
	.word	-944458637
	.word	1371981463
	.word	602466507
	.word	2094914977
	.word	-1670089496
	.word	555687742
	.word	-582268010
	.word	-591544991
	.word	-2037675251
	.word	-2054518257
	.word	-1871679264
	.word	1111375484
	.word	-994724495
	.word	-1436129588
	.word	-666351472
	.word	84083462
	.word	32962295
	.word	302911004
	.word	-1553899070
	.word	1597322602
	.word	-111716434
	.word	-793134743
	.word	-1853454825
	.word	1489093017
	.word	656219450
	.word	-1180787161
	.word	954327513
	.word	335083755
	.word	-1281845205
	.word	856756514
	.word	-1150719534
	.word	1893325225
	.word	-1987146233
	.word	-1483434957
	.word	-1231316179
	.word	572399164
	.word	-1836611819
	.word	552200649
	.word	1238290055
	.word	-11184726
	.word	2015897680
	.word	2061492133
	.word	-1886614525
	.word	-123625127
	.word	-2138470135
	.word	386731290
	.word	-624967835
	.word	837215959
	.word	-968736124
	.word	-1201116976
	.word	-1019133566
	.word	-1332111063
	.word	1999449434
	.word	286199582
	.word	-877612933
	.word	-61582168
	.word	-692339859
	.word	974525996
	.word	1667483301
	.word	2088564868
	.word	2004348569
	.word	2071721613
	.word	-218956019
	.word	1802229437
	.word	1869602481
	.word	-976907948
	.word	808476752
	.word	16843267
	.word	1734856361
	.word	724260477
	.word	-16849127
	.word	-673729182
	.word	-1414836762
	.word	1987505306
	.word	-892694715
	.word	-2105401443
	.word	-909539008
	.word	2105408135
	.word	-84218091
	.word	1499050731
	.word	1195871945
	.word	-252642549
	.word	-1381154324
	.word	-724257945
	.word	-1566416899
	.word	-1347467798
	.word	-1667488833
	.word	-1532734473
	.word	1920132246
	.word	-1061119141
	.word	-1212713534
	.word	-33693412
	.word	-1819066962
	.word	640044138
	.word	909536346
	.word	1061125697
	.word	-134744830
	.word	-859012273
	.word	875849820
	.word	-1515892236
	.word	-437923532
	.word	-235800312
	.word	1903288979
	.word	-656888973
	.word	825320019
	.word	353708607
	.word	67373068
	.word	-943221422
	.word	589514341
	.word	-1010590370
	.word	404238376
	.word	-1768540255
	.word	84216335
	.word	-1701171275
	.word	117902857
	.word	303178806
	.word	-2139087973
	.word	-488448195
	.word	-336868058
	.word	656887401
	.word	-1296924723
	.word	1970662047
	.word	151589403
	.word	-2088559202
	.word	741103732
	.word	437924910
	.word	454768173
	.word	1852759218
	.word	1515893998
	.word	-1600103429
	.word	1381147894
	.word	993752653
	.word	-690571423
	.word	-1280082482
	.word	690573947
	.word	-471605954
	.word	791633521
	.word	-2071719017
	.word	1397991157
	.word	-774784664
	.word	0
	.word	-303185620
	.word	538984544
	.word	-50535649
	.word	-1313769016
	.word	1532737261
	.word	1785386174
	.word	-875852474
	.word	-1094817831
	.word	960066123
	.word	1246401758
	.word	1280088276
	.word	1482207464
	.word	-808483510
	.word	-791626901
	.word	-269499094
	.word	-1431679003
	.word	-67375850
	.word	1128498885
	.word	1296931543
	.word	859006549
	.word	-2054876780
	.word	1162185423
	.word	-101062384
	.word	33686534
	.word	2139094657
	.word	1347461360
	.word	1010595908
	.word	-1616960070
	.word	-1465365533
	.word	1364304627
	.word	-1549574658
	.word	1077969088
	.word	-1886452342
	.word	-1835909203
	.word	-1650646596
	.word	943222856
	.word	-168431356
	.word	-1128504353
	.word	-1229555775
	.word	-623202443
	.word	555827811
	.word	269492272
	.word	-6886
	.word	-202113778
	.word	-757940371
	.word	-842170036
	.word	202119188
	.word	320022069
	.word	-320027857
	.word	1600110305
	.word	-1751698014
	.word	1145342156
	.word	387395129
	.word	-993750185
	.word	-1482205710
	.word	2122251394
	.word	1027439175
	.word	1684326572
	.word	1566423783
	.word	421081643
	.word	1936975509
	.word	1616953504
	.word	-2122245736
	.word	1330618065
	.word	-589520001
	.word	572671078
	.word	707417214
	.word	-1869595733
	.word	-2004350077
	.word	1179028682
	.word	-286341335
	.word	-1195873325
	.word	336865340
	.word	-555833479
	.word	1583267042
	.word	185275933
	.word	-606360202
	.word	-522134725
	.word	842163286
	.word	976909390
	.word	168432670
	.word	1229558491
	.word	101059594
	.word	606357612
	.word	1549580516
	.word	-1027432611
	.word	-741098130
	.word	-1397996561
	.word	1650640038
	.word	-1852753496
	.word	-1785384540
	.word	-454765769
	.word	2038035083
	.word	-404237006
	.word	-926381245
	.word	926379609
	.word	1835915959
	.word	-1920138868
	.word	-707415708
	.word	1313774802
	.word	-1448523296
	.word	1819072692
	.word	1448520954
	.word	-185273593
	.word	-353710299
	.word	1701169839
	.word	2054878350
	.word	-1364310039
	.word	134746136
	.word	-1162186795
	.word	2021191816
	.word	623200879
	.word	774790258
	.word	471611428
	.word	-1499047951
	.word	-1263242297
	.word	-960063663
	.word	-387396829
	.word	-572677764
	.word	1953818780
	.word	522141217
	.word	1263245021
	.word	-1111662116
	.word	-1953821306
	.word	-1970663547
	.word	1886445712
	.word	1044282434
	.word	-1246400060
	.word	1718013098
	.word	1212715224
	.word	50529797
	.word	-151587071
	.word	235805714
	.word	1633796771
	.word	892693087
	.word	1465364217
	.word	-1179031088
	.word	-2038032495
	.word	-1044276904
	.word	488454695
	.word	-1633802311
	.word	-505292488
	.word	-117904621
	.word	-1734857805
	.word	286335539
	.word	1768542907
	.word	-640046736
	.word	-1903294583
	.word	-1802226777
	.word	-1684329034
	.word	505297954
	.word	-2021190254
	.word	-370554592
	.word	-825325751
	.word	1431677695
	.word	673730680
	.word	-538991238
	.word	-1936981105
	.word	-1583261192
	.word	-1987507840
	.word	218962455
	.word	-1077975590
	.word	-421079247
	.word	1111655622
	.word	1751699640
	.word	1094812355
	.word	-1718015568
	.word	757946999
	.word	252648977
	.word	-1330611253
	.word	1414834428
	.word	-1145344554
	.word	370551866
	.word	1673962851
	.word	2096661628
	.word	2012125559
	.word	2079755643
	.word	-218165774
	.word	1809235307
	.word	1876865391
	.word	-980331323
	.word	811618352
	.word	16909057
	.word	1741597031
	.word	727088427
	.word	-18408962
	.word	-675978537
	.word	-1420958037
	.word	1995217526
	.word	-896580150
	.word	-2111857278
	.word	-913751863
	.word	2113570685
	.word	-84994566
	.word	1504897881
	.word	1200539975
	.word	-251982864
	.word	-1388188499
	.word	-726439980
	.word	-1570767454
	.word	-1354372433
	.word	-1675378788
	.word	-1538000988
	.word	1927583346
	.word	-1063560256
	.word	-1217019209
	.word	-35578627
	.word	-1824674157
	.word	642542118
	.word	913070646
	.word	1065238847
	.word	-134937865
	.word	-863809588
	.word	879254580
	.word	-1521355611
	.word	-439274267
	.word	-235337487
	.word	1910674289
	.word	-659852328
	.word	828527409
	.word	355090197
	.word	67636228
	.word	-946515257
	.word	591815971
	.word	-1013096765
	.word	405809176
	.word	-1774739050
	.word	84545285
	.word	-1708149350
	.word	118360327
	.word	304363026
	.word	-2145674368
	.word	-488686110
	.word	-338876693
	.word	659450151
	.word	-1300247118
	.word	1978310517
	.word	152181513
	.word	-2095210877
	.word	743994412
	.word	439627290
	.word	456535323
	.word	1859957358
	.word	1521806938
	.word	-1604584544
	.word	1386542674
	.word	997608763
	.word	-692624938
	.word	-1283600717
	.word	693271337
	.word	-472039709
	.word	794718511
	.word	-2079090812
	.word	1403450707
	.word	-776378159
	.word	0
	.word	-306107155
	.word	541089824
	.word	-52224004
	.word	-1317418831
	.word	1538714971
	.word	1792327274
	.word	-879933749
	.word	-1100490306
	.word	963791673
	.word	1251270218
	.word	1285084236
	.word	1487988824
	.word	-813348145
	.word	-793023536
	.word	-272291089
	.word	-1437604438
	.word	-68348165
	.word	1132905795
	.word	1301993293
	.word	862344499
	.word	-2062445435
	.word	1166724933
	.word	-102166279
	.word	33818114
	.word	2147385727
	.word	1352724560
	.word	1014514748
	.word	-1624917345
	.word	-1471421528
	.word	1369633617
	.word	-1554121053
	.word	1082179648
	.word	-1895462257
	.word	-1841320558
	.word	-1658733411
	.word	946882616
	.word	-168753931
	.word	-1134305348
	.word	-1233665610
	.word	-626035238
	.word	557998881
	.word	270544912
	.word	-1762561
	.word	-201519373
	.word	-759206446
	.word	-847164211
	.word	202904588
	.word	321271059
	.word	-322752532
	.word	1606345055
	.word	-1758092649
	.word	1149815876
	.word	388905239
	.word	-996976700
	.word	-1487539545
	.word	2130477694
	.word	1031423805
	.word	1690872932
	.word	1572530013
	.word	422718233
	.word	1944491379
	.word	1623236704
	.word	-2129028991
	.word	1335808335
	.word	-593264676
	.word	574907938
	.word	710180394
	.word	-1875137648
	.word	-2012511352
	.word	1183631942
	.word	-288937490
	.word	-1200893000
	.word	338181140
	.word	-559449634
	.word	1589437022
	.word	185998603
	.word	-609388837
	.word	-522503200
	.word	845436466
	.word	980700730
	.word	169090570
	.word	1234361161
	.word	101452294
	.word	608726052
	.word	1555620956
	.word	-1029743166
	.word	-742560045
	.word	-1404833876
	.word	1657054818
	.word	-1858492271
	.word	-1791908715
	.word	-455919644
	.word	2045938553
	.word	-405458201
	.word	-930397240
	.word	929978679
	.word	1843050349
	.word	-1929278323
	.word	-709794603
	.word	1318900302
	.word	-1454776151
	.word	1826141292
	.word	1454176854
	.word	-185399308
	.word	-355523094
	.word	1707781989
	.word	2062847610
	.word	-1371018834
	.word	135272456
	.word	-1167075910
	.word	2029029496
	.word	625635109
	.word	777810478
	.word	473441308
	.word	-1504185946
	.word	-1267480652
	.word	-963161658
	.word	-389340184
	.word	-576619299
	.word	1961401460
	.word	524165407
	.word	1268178251
	.word	-1117659971
	.word	-1962047861
	.word	-1978694262
	.word	1893765232
	.word	1048330814
	.word	-1250835275
	.word	1724688998
	.word	1217452104
	.word	50726147
	.word	-151584266
	.word	236720654
	.word	1640145761
	.word	896163637
	.word	1471084887
	.word	-1184247623
	.word	-2045275770
	.word	-1046914879
	.word	490350365
	.word	-1641563746
	.word	-505857823
	.word	-118811656
	.word	-1741966440
	.word	287453969
	.word	1775418217
	.word	-643206951
	.word	-1912108658
	.word	-1808554092
	.word	-1691502949
	.word	507257374
	.word	-2028629369
	.word	-372694807
	.word	-829994546
	.word	1437269845
	.word	676362280
	.word	-542803233
	.word	-1945923700
	.word	-1587939167
	.word	-1995865975
	.word	219813645
	.word	-1083843905
	.word	-422104602
	.word	1115997762
	.word	1758509160
	.word	1099088705
	.word	-1725321063
	.word	760903469
	.word	253628687
	.word	-1334064208
	.word	1420360788
	.word	-1150429509
	.word	371997206
	.word	-962239645
	.word	-125535108
	.word	-291932297
	.word	-158499973
	.word	-15863054
	.word	-692229269
	.word	-558796945
	.word	-1856715323
	.word	1615867952
	.word	33751297
	.word	-827758745
	.word	1451043627
	.word	-417726722
	.word	-1251813417
	.word	1306962859
	.word	-325421450
	.word	-1891251510
	.word	530416258
	.word	-1992242743
	.word	-91783811
	.word	-283772166
	.word	-1293199015
	.word	-1899411641
	.word	-83103504
	.word	1106029997
	.word	-1285040940
	.word	1610457762
	.word	1173008303
	.word	599760028
	.word	1408738468
	.word	-459902350
	.word	-1688485696
	.word	1975695287
	.word	-518193667
	.word	1034851219
	.word	1282024998
	.word	1817851446
	.word	2118205247
	.word	-184354825
	.word	-2091922228
	.word	1750873140
	.word	1374987685
	.word	-785062427
	.word	-116854287
	.word	-493653647
	.word	-1418471208
	.word	1649619249
	.word	708777237
	.word	135005188
	.word	-1789737017
	.word	1181033251
	.word	-1654733885
	.word	807933976
	.word	933336726
	.word	168756485
	.word	800430746
	.word	235472647
	.word	607523346
	.word	463175808
	.word	-549592350
	.word	-853087253
	.word	1315514151
	.word	2144187058
	.word	-358648459
	.word	303761673
	.word	496927619
	.word	1484008492
	.word	875436570
	.word	908925723
	.word	-592286098
	.word	-1259447718
	.word	1543217312
	.word	-1527360942
	.word	1984772923
	.word	-1218324778
	.word	2110698419
	.word	1383803177
	.word	-583080989
	.word	1584475951
	.word	328696964
	.word	-1493871789
	.word	-1184312879
	.word	0
	.word	-1054020115
	.word	1080041504
	.word	-484442884
	.word	2043195825
	.word	-1225958565
	.word	-725718422
	.word	-1924740149
	.word	1742323390
	.word	1917532473
	.word	-1797371318
	.word	-1730917300
	.word	-1326950312
	.word	-2058694705
	.word	-1150562096
	.word	-987041809
	.word	1340451498
	.word	-317260805
	.word	-2033892541
	.word	-1697166003
	.word	1716859699
	.word	294946181
	.word	-1966127803
	.word	-384763399
	.word	67502594
	.word	-25067649
	.word	-1594863536
	.word	2017737788
	.word	632987551
	.word	1273211048
	.word	-1561112239
	.word	1576969123
	.word	-2134884288
	.word	92966799
	.word	1068339858
	.word	566009245
	.word	1883781176
	.word	-251333131
	.word	1675607228
	.word	2009183926
	.word	-1351230758
	.word	1113792801
	.word	540020752
	.word	-451215361
	.word	-49351693
	.word	-1083321646
	.word	-2125673011
	.word	403966988
	.word	641012499
	.word	-1020269332
	.word	-1092526241
	.word	899848087
	.word	-1999879100
	.word	775493399
	.word	-1822964540
	.word	1441965991
	.word	-58556802
	.word	2051489085
	.word	-928226204
	.word	-1159242403
	.word	841685273
	.word	-426413197
	.word	-1063231392
	.word	429425025
	.word	-1630449841
	.word	-1551901476
	.word	1147544098
	.word	1417554474
	.word	1001099408
	.word	193169544
	.word	-1932900794
	.word	-953553170
	.word	1809037496
	.word	675025940
	.word	-1485185314
	.word	-1126015394
	.word	371002123
	.word	-1384719397
	.word	-616832800
	.word	1683370546
	.word	1951283770
	.word	337512970
	.word	-1831122615
	.word	201983494
	.word	1215046692
	.word	-1192993700
	.word	-1621245246
	.word	-1116810285
	.word	1139780780
	.word	-995728798
	.word	967348625
	.word	832869781
	.word	-751311644
	.word	-225740423
	.word	-718084121
	.word	-1958491960
	.word	1851340599
	.word	-625513107
	.word	25988493
	.word	-1318791723
	.word	-1663938994
	.word	1239460265
	.word	-659264404
	.word	-1392880042
	.word	-217582348
	.word	-819598614
	.word	-894474907
	.word	-191989126
	.word	1206496942
	.word	270010376
	.word	1876277946
	.word	-259491720
	.word	1248797989
	.word	1550986798
	.word	941890588
	.word	1475454630
	.word	1942467764
	.word	-1756248378
	.word	-886839064
	.word	-1585652259
	.word	-392399756
	.word	1042358047
	.word	-1763882165
	.word	1641856445
	.word	226921355
	.word	260409994
	.word	-527404944
	.word	2084716094
	.word	1908716981
	.word	-861247898
	.word	-1864873912
	.word	100991747
	.word	-150866186
	.word	470945294
	.word	-1029480095
	.word	1784624437
	.word	-1359390889
	.word	1775286713
	.word	395413126
	.word	-1722236479
	.word	975641885
	.word	666476190
	.word	-650583583
	.word	-351012616
	.word	733190296
	.word	573772049
	.word	-759469719
	.word	-1452221991
	.word	126455438
	.word	866620564
	.word	766942107
	.word	1008868894
	.word	361924487
	.word	-920589847
	.word	-2025206066
	.word	-1426107051
	.word	1350051880
	.word	-1518673953
	.word	59739276
	.word	1509466529
	.word	159418761
	.word	437718285
	.word	1708834751
	.word	-684595482
	.word	-2067381694
	.word	-793221016
	.word	-2101132991
	.word	699439513
	.word	1517759789
	.word	504434447
	.word	2076946608
	.word	-1459858348
	.word	1842789307
	.word	742004246
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	plaintext, @object
	.size	plaintext, 256
plaintext:
	.base64	"13+zjCIlxG+51ckYwJLQCIUq82i9hK/yDIv1HlFwRnCei97hhqH4zXECn6F7RLCCQH/OtL5dvI4ZQws6RmmgzO1PYa+mqVtHaVHVAHd+3i5+pjzgM9/tQD8ax+DHRuM7kE5kVS6NNjuSm4dvrpQ9CsiiTn9ag+wY/YJUyNjtHlJ9ys9LujFouXijyk5yhrIzecvNpkOjnPruKq47csZGMqWZRZJGedzjPqmKETdJheRYGh9u16rmCsQn/UZcbLAoLmuENZAabTjyaUq8luzXVmUn7qawX5xwcaUr7JNnFsHEs0NwtW2tlUHwAvyNWI6hRjI0aBGMszrbVL46szgu"
	.ascii	"|"
	.type	key, @object
	.size	key, 32
key:
	.base64	"yZVVMaZQ0VR72MWqpKS9rFzqEsf4g9a4XdbPLWDIpfA="
	.type	expected, @object
	.size	expected, 256
expected:
	.base64	"DxcAEAeCf/lF2hUOVJSPInSfA81YGrJrmmgF58sfda1RhVah9ti37J4Nw0h9qveZwh3qP1PbqITtYcDnOK3ct5v6wLaIfPCHJSC8CwNtuJsQ06iHOLrbQ0ACD4luEWl+FUrF47F6nTt0vgVYHkBzHYOgRYn8z8NOolLvfl4smDgmV7QSTiQQrHyJQg2dr0kvwGB1Q8XRzP1Grk44qfODmJ/6ChUFRioOvqisLVknLlQFd1JkOWDEfKcwuRM7H/43sOr9PYPtfvKw8gqGeLkIH//AUK24kmgZMJx+5UxXXqZYOodwgBrPHug7Q8bpJ0e6nlhSFMC38Xd3jyNDSQ4k"
	.ascii	"\316"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	encrypted, @object
	.size	encrypted, 256
encrypted:
	.zero	256
	.type	encctx, @object
	.size	encctx, 244
encctx:
	.zero	244
	.type	decctx, @object
	.size	decctx, 244
decctx:
	.zero	244
	.type	decrypted, @object
	.size	decrypted, 256
decrypted:
	.zero	256
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
