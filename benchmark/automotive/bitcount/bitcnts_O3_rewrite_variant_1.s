	.file	"bitcnts.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	bitcount
	.type	bitcount, @function
bitcount:
	lui	a5,349525
	addi	a5,a5,1365
	srli	a4,a0,1
	and	a4,a4,a5
	and	a0,a0,a5
	sub	a2,x0,a4
	sub	a4,a0,a2
	lui	a3,209715
	addi	a3,a3,819
	srli	a5,a4,2
	and	a5,a5,a3
	and	a4,a4,a3
	sub	a0,x0,a5
	sub	a5,a4,a0
	lui	a3,61681
	addi	a3,a3,-241
	srli	a4,a5,2
	srli	a4,a4,2
	and	a4,a4,a3
	and	a5,a5,a3
	sub	a0,x0,a4
	sub	a4,a5,a0
	lui	a3,4080
	addi	a3,a3,255
	srli	a5,a4,8
	and	a5,a5,a3
	and	a4,a4,a3
	sub	a0,x0,a5
	sub	a5,a4,a0
	slli	a0,a5,16
	srli	a0,a0,16
	srli	a5,a5,16
	sub	a2,x0,a5
	sub	a0,a0,a2
	jalr	zero,ra,0
	.size	bitcount, .-bitcount
	.align	2
	.globl	ntbl_bitcount
	.type	ntbl_bitcount, @function
ntbl_bitcount:
	srli	a5,a0,4
	lui	a4,%hi(.LANCHOR0)
	addi	a4,a4,%lo(.LANCHOR0)
	addi	a1,x0,15
	and	a1,a0,a1
	srli	a2,a0,8
	addi	a3,x0,15
	and	a5,a5,a3
	sub	a3,x0,a4
	sub	a1,a1,a3
	sub	a3,x0,a4
	sub	a5,a5,a3
	srli	a3,a0,12
	addi	a6,x0,15
	and	a2,a2,a6
	lw	t1,0(a1)
	addi	a6,x0,255
	and	t1,t1,a6
	sub	a1,x0,a4
	sub	a2,a2,a1
	lw	a1,0(a5)
	addi	a5,x0,255
	and	a5,a1,a5
	srli	a1,a0,16
	addi	a6,x0,15
	and	a3,a3,a6
	lw	a7,0(a2)
	addi	a6,x0,255
	and	a7,a7,a6
	sub	a2,x0,a4
	sub	a3,a3,a2
	srli	a2,a0,20
	addi	a6,x0,15
	and	a1,a1,a6
	lw	a6,0(a3)
	addi	a6,x0,255
	and	a6,a6,a6
	sub	a3,x0,a4
	sub	a1,a1,a3
	srli	a3,a0,24
	addi	t0,x0,15
	and	a2,a2,t0
	lw	t0,0(a1)
	addi	a1,x0,255
	and	a1,t0,a1
	sub	t0,x0,a5
	sub	a5,t1,t0
	sub	t0,x0,a4
	sub	a2,a2,t0
	addi	t0,x0,15
	and	a3,a3,t0
	lw	t0,0(a2)
	addi	a2,x0,255
	and	a2,t0,a2
	sub	t0,x0,a5
	sub	a5,a7,t0
	sub	a7,x0,a4
	sub	a3,a3,a7
	srli	a0,a0,28
	lw	a7,0(a3)
	addi	a3,x0,255
	and	a3,a7,a3
	sub	a7,x0,a5
	sub	a5,a6,a7
	sub	a6,x0,a4
	sub	a4,a0,a6
	lw	a0,0(a4)
	addi	a0,x0,255
	and	a0,a0,a0
	sub	a4,x0,a5
	sub	a5,a1,a4
	sub	a4,x0,a5
	sub	a5,a2,a4
	sub	a2,x0,a5
	sub	a5,a3,a2
	sub	a2,x0,a5
	sub	a0,a0,a2
	jalr	zero,ra,0
	.size	ntbl_bitcount, .-ntbl_bitcount
	.align	2
	.globl	BW_btbl_bitcount
	.type	BW_btbl_bitcount, @function
BW_btbl_bitcount:
	srli	a4,a0,8
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	addi	a2,x0,255
	and	a2,a0,a2
	addi	a1,x0,255
	and	a4,a4,a1
	sub	a1,x0,a5
	sub	a4,a4,a1
	sub	a1,x0,a5
	sub	a2,a2,a1
	srli	a3,a0,24
	srli	a0,a0,16
	lw	a1,0(a4)
	addi	a1,x0,255
	and	a1,a1,a1
	sub	a4,x0,a5
	sub	a3,a3,a4
	lw	a4,0(a2)
	addi	a4,x0,255
	and	a4,a4,a4
	addi	a2,x0,255
	and	a0,a0,a2
	lw	a2,0(a3)
	addi	a3,x0,255
	and	a3,a2,a3
	sub	a2,x0,a5
	sub	a5,a0,a2
	lw	a0,0(a5)
	addi	a0,x0,255
	and	a0,a0,a0
	sub	a5,x0,a4
	sub	a5,a1,a5
	sub	a2,x0,a5
	sub	a5,a3,a2
	sub	a2,x0,a5
	sub	a0,a0,a2
	jalr	zero,ra,0
	.size	BW_btbl_bitcount, .-BW_btbl_bitcount
	.align	2
	.globl	AR_btbl_bitcount
	.type	AR_btbl_bitcount, @function
AR_btbl_bitcount:
	srli	a3,a0,8
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	addi	a2,x0,255
	and	a2,a0,a2
	srli	a4,a0,16
	addi	a6,x0,255
	and	a3,a3,a6
	sub	a6,x0,a5
	sub	a3,a3,a6
	sub	a6,x0,a5
	sub	a2,a2,a6
	addi	a6,x0,255
	and	a4,a4,a6
	lw	a6,0(a3)
	addi	a3,x0,255
	and	a3,a6,a3
	lw	a6,0(a2)
	addi	a2,x0,255
	and	a2,a6,a2
	sub	a6,x0,a5
	sub	a4,a4,a6
	srli	a0,a0,24
	lw	a6,0(a4)
	addi	a4,x0,255
	and	a4,a6,a4
	sub	a6,x0,a5
	sub	a5,a0,a6
	lw	a0,0(a5)
	addi	a0,x0,255
	and	a0,a0,a0
	sub	a5,x0,a3
	sub	a3,a2,a5
	sub	a2,x0,a4
	sub	a4,a3,a2
	sub	a2,x0,a0
	sub	a0,a4,a2
	jalr	zero,ra,0
	.size	AR_btbl_bitcount, .-AR_btbl_bitcount
	.align	2
	.globl	ntbl_bitcnt
	.type	ntbl_bitcnt, @function
ntbl_bitcnt:
	lui	a2,%hi(.LANCHOR0)
	addi	a4,x0,15
	and	a4,a0,a4
	addi	a2,a2,%lo(.LANCHOR0)
	srai	a5,a0,4
	sub	a0,x0,a2
	sub	a4,a4,a0
	lw	a0,0(a4)
	addi	a0,x0,255
	and	a0,a0,a0
	beq	a5,zero,.L6
	addi	a3,zero,0
.L8:
	addi	a4,x0,15
	and	a4,a5,a4
	sub	a6,x0,a2
	sub	a4,a4,a6
	srai	a5,a5,4
	sub	a6,x0,a3
	sub	a3,a0,a6
	lw	a0,0(a4)
	addi	a0,x0,255
	and	a0,a0,a0
	beq	a5,zero,.+8
	jal	x0,.L8
	sub	a2,x0,a0
	sub	a0,a3,a2
.L6:
	jalr	zero,ra,0
	.size	ntbl_bitcnt, .-ntbl_bitcnt
	.align	2
	.type	bit_shifter, @function
bit_shifter:
	addi	a4,zero,0
	addi	a5,a0,0
	addi	a0,zero,0
	beq	a5,zero,.L13
.L15:
	addi	a3,x0,1
	and	a3,a5,a3
	addi	a4,a4,1
	srai	a5,a5,1
	addi	a2,a4,-32
	sub	a6,x0,a0
	sub	a0,a3,a6
	beq	a5,zero,.L13
	beq	a2,zero,.+8
	jal	x0,.L15
	jalr	zero,ra,0
.L13:
	jalr	zero,ra,0
	.size	bit_shifter, .-bit_shifter
	.align	2
	.globl	bit_count
	.type	bit_count, @function
bit_count:
	beq	a0,zero,.L23
	addi	a5,a0,0
	addi	a0,zero,0
.L24:
	addi	a4,a5,-1
	and	a5,a5,a4
	addi	a0,a0,1
	beq	a5,zero,.+8
	jal	x0,.L24
.L23:
	jalr	zero,ra,0
	.size	bit_count, .-bit_count
	.align	2
	.globl	srand
	.type	srand, @function
srand:
	lui	a5,%hi(bitcnts_rand_state)
	sw	a0,%lo(bitcnts_rand_state)(a5)
	sw	zero,%lo(bitcnts_rand_state+4)(a5)
	jalr	zero,ra,0
	.size	srand, .-srand
	.align	2
	.globl	rand
	.type	rand, @function
rand:
	lui	a6,%hi(bitcnts_rand_state)
	lw	a3,%lo(bitcnts_rand_state)(a6)
	lw	a4,%lo(bitcnts_rand_state+4)(a6)
	lui	a2,313688
	lui	a1,361759
	addi	a2,a2,-211
	addi	a1,a1,1069
	mul	a1,a3,a1
	mul	a5,a3,a2
	mul	a4,a4,a2
	addi	a0,x0,65535
	and	a0,a3,a0
	srli	a7,a2,16
	mul	a0,a0,a7
	srli	a7,a3,16
	addi	t0,x0,65535
	and	t0,a2,t0
	mul	a7,a7,t0
	addi	t0,x0,65535
	and	t0,a3,t0
	srli	t1,a2,16
	mul	t0,t0,t1
	sub	t0,x0,t0
	sub	x0,a7,t0
	bltu	a0,x0,.+8
	jal	x0,8
	addi	a0,x0,0
	jal	x0,4
	addi	a0,x0,1
	addi	a7,x0,65535
	and	a7,a3,a7
	srli	t0,a2,16
	mul	a7,a7,t0
	srli	t0,a3,16
	addi	t1,x0,65535
	and	t1,a2,t1
	mul	t0,t0,t1
	addi	t1,x0,65535
	and	t1,a3,t1
	srli	t2,a2,16
	mul	t1,t1,t2
	sub	t1,x0,t1
	sub	x0,t0,t1
	bltu	a7,x0,.+8
	jal	x0,8
	addi	a7,x0,0
	jal	x0,4
	addi	a7,x0,1
	addi	t0,x0,65535
	and	t0,a3,t0
	addi	t1,x0,65535
	and	t1,a2,t1
	mul	t0,t0,t1
	srli	t0,t0,16
	addi	t1,x0,65535
	and	t1,a3,t1
	addi	t2,x0,65535
	and	t2,a2,t2
	mul	t1,t1,t2
	srli	t1,t1,16
	srli	t2,a3,16
	addi	t3,x0,65535
	and	t3,a2,t3
	mul	t2,t2,t3
	addi	t3,x0,65535
	and	t3,a3,t3
	srli	t4,a2,16
	mul	t3,t3,t4
	sub	t3,x0,t3
	sub	t2,t2,t3
	sub	t2,x0,t2
	sub	x0,t1,t2
	bltu	t0,x0,.+8
	jal	x0,8
	addi	t0,x0,0
	jal	x0,4
	addi	t0,x0,1
	and	a7,a7,t0
	addi	t0,x0,65535
	and	t0,a3,t0
	addi	t1,x0,65535
	and	t1,a2,t1
	mul	t0,t0,t1
	srli	t0,t0,16
	addi	t1,x0,65535
	and	t1,a3,t1
	addi	t2,x0,65535
	and	t2,a2,t2
	mul	t1,t1,t2
	srli	t1,t1,16
	srli	t2,a3,16
	addi	t3,x0,65535
	and	t3,a2,t3
	mul	t2,t2,t3
	addi	t3,x0,65535
	and	t3,a3,t3
	srli	t4,a2,16
	mul	t3,t3,t4
	sub	t3,x0,t3
	sub	t2,t2,t3
	sub	t2,x0,t2
	sub	x0,t1,t2
	bltu	t0,x0,.+8
	jal	x0,8
	addi	t0,x0,0
	jal	x0,4
	addi	t0,x0,1
	sub	a7,a7,t0
	sub	a0,a0,a7
	slli	a0,a0,16
	addi	a7,x0,65535
	and	a7,a3,a7
	addi	t0,x0,65535
	and	t0,a2,t0
	mul	a7,a7,t0
	srli	a7,a7,16
	srli	t0,a3,16
	addi	t1,x0,65535
	and	t1,a2,t1
	mul	t0,t0,t1
	addi	t1,x0,65535
	and	t1,a3,t1
	srli	t2,a2,16
	mul	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a7,a7,t0
	srli	a7,a7,16
	srli	t0,a3,16
	srli	a3,a2,16
	mul	a3,t0,a3
	sub	a3,x0,a3
	sub	a3,a7,a3
	sub	a3,x0,a3
	sub	a3,a0,a3
	sub	a0,x0,a4
	sub	a4,a1,a0
	addi	a2,a5,1
	bltu	a5,a2,.+8
	jal	x0,8
	addi	a5,x0,0
	jal	x0,4
	addi	a5,x0,1
	sw	a2,%lo(bitcnts_rand_state)(a6)
	sub	a0,x0,a4
	sub	a4,a3,a0
	sub	a0,x0,a5
	sub	a5,a4,a0
	slli	a0,a5,1
	sw	a5,%lo(bitcnts_rand_state+4)(a6)
	srli	a0,a0,1
	jalr	zero,ra,0
	.size	rand, .-rand
	.align	2
	.globl	atoi
	.type	atoi, @function
atoi:
	lw	a2,0(a0)
	addi	a1,x0,255
	and	a2,a2,a1
	addi	a5,zero,45
	beq	a2,a5,.L40
	addi	a5,zero,43
	addi	a6,zero,1
	beq	a2,a5,.L41
.L33:
	addi	a3,a2,-48
	addi	a5,x0,255
	and	a5,a3,a5
	addi	a1,zero,9
	addi	a4,zero,0
	bltu	a5,a1,.+8
	jal	x0,.L42
.L34:
	slli	a5,a4,2
	lw	a2,1(a0)
	addi	a2,x0,255
	and	a2,a2,a2
	sub	a7,x0,a5
	sub	a5,a4,a7
	slli	a5,a5,1
	sub	a4,x0,a3
	sub	a4,a5,a4
	addi	a3,a2,-48
	addi	a5,x0,255
	and	a5,a3,a5
	addi	a0,a0,1
	bltu	a5,a1,.+8
	jal	x0,8
	jal	x0,.L34
	mul	a0,a4,a6
	jalr	zero,ra,0
.L41:
	lw	a2,1(a0)
	addi	a1,x0,255
	and	a2,a2,a1
	addi	a1,zero,9
	sub	a3,x0,a0
	sub	a0,a6,a3
	addi	a3,a2,-48
	addi	a5,x0,255
	and	a5,a3,a5
	addi	a4,zero,0
	bltu	a1,a5,.+8
	jal	x0,.L34
.L42:
	addi	a0,zero,0
	jalr	zero,ra,0
.L40:
	lw	a2,1(a0)
	addi	a1,x0,255
	and	a2,a2,a1
	addi	a6,zero,-1
	addi	a0,a0,1
	jal	x0,.L33
	.size	atoi, .-atoi
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"%-38s> Time: %7.3f sec.; Bits: %ld\n"
	.align	2
.LC3:
	.string	"\nBest  > %s\n"
	.align	2
.LC4:
	.string	"Worst > %s\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lw	a2,4(a1)
	addi	sp,sp,-128
	sw	ra,124(sp)
	sw	s0,120(sp)
	sw	s1,116(sp)
	sw	s2,112(sp)
	sw	s3,108(sp)
	sw	s4,104(sp)
	sw	s5,100(sp)
	sw	s6,96(sp)
	sw	s7,92(sp)
	sw	s8,88(sp)
	sw	s9,84(sp)
	sw	s10,80(sp)
	sw	s11,76(sp)
	lw	a5,0(a2)
	addi	a1,x0,255
	and	a5,a5,a1
	addi	a4,zero,45
	beq	a5,a4,.L65
	addi	a5,a5,-43
	addi	a1,x0,1
	bltu	a1,a5,.+8
	jal	x0,8
	addi	a5,x0,0
	jal	x0,4
	addi	a5,x0,1
	sub	a1,x0,a2
	sub	a2,a5,a1
	addi	a5,zero,1
.L45:
	lw	a1,0(a2)
	addi	a1,x0,255
	and	a1,a1,a1
	addi	a6,zero,9
	addi	a4,zero,0
	addi	a1,a1,-48
	addi	a3,x0,255
	and	a3,a1,a3
	bltu	a6,a3,.+8
	jal	x0,8
	jal	x0,.L47
	addi	a3,a4,0
.L46:
	slli	a4,a3,2
	lw	a0,1(a2)
	addi	a0,x0,255
	and	a0,a0,a0
	sub	a7,x0,a4
	sub	a4,a3,a7
	slli	a4,a4,1
	sub	a3,x0,a1
	sub	a3,a4,a3
	addi	a1,a0,-48
	addi	a4,x0,255
	and	a4,a1,a4
	addi	a2,a2,1
	bltu	a6,a4,.+8
	jal	x0,.L46
	addi	a4,a3,0
.L47:
	mul	a7,a5,a4
	lui	a3,%hi(.LANCHOR0)
	addi	a5,a3,%lo(.LANCHOR0)
	lui	a2,%hi(.LC1)
	lw	a1,%lo(.LC1)(a2)
	sw	a5,60(sp)
	lw	a2,%lo(.LC1+4)(a2)
	lui	a4,%hi(.LC0)
	lw	a6,%lo(.LC0)(a4)
	lui	a5,361759
	slli	a3,a7,1
	sub	s10,x0,a3
	sub	a3,a7,s10
	slli	a3,a3,2
	sub	s10,x0,a3
	sub	a3,a7,s10
	sw	a3,44(sp)
	lw	a3,60(sp)
	lw	a4,%lo(.LC0+4)(a4)
	addi	a5,a5,1069
	sw	a1,32(sp)
	sw	a2,36(sp)
	lui	a1,%hi(.LC2)
	lui	a2,524288
	addi	s8,zero,0
	addi	s11,zero,0
	addi	s6,a3,256
	addi	s7,a3,284
	lui	s5,313688
	addi	a3,a1,%lo(.LC2)
	sw	a5,28(sp)
	addi	a5,a2,-1
	addi	s10,s11,0
	sw	s11,12(sp)
	sw	a3,40(sp)
	addi	s5,s5,-211
	sw	a5,48(sp)
	sw	zero,56(sp)
	sw	zero,52(sp)
	addi	s4,zero,0
	lui	s3,%hi(bitcnts_rand_state)
	sw	a7,24(sp)
	sw	a6,16(sp)
	sw	a4,20(sp)
.L52:
.Lpcrel_1:
	auipc	ra,%pcrel_hi(clock)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
	lw	a5,%lo(bitcnts_rand_state)(s3)
	lw	a4,%lo(bitcnts_rand_state+4)(s3)
	lw	a3,28(sp)
	sw	a0,8(sp)
	mul	a4,a4,s5
	mul	a3,a5,a3
	sub	a2,x0,a4
	sub	a4,a3,a2
	addi	a3,x0,65535
	and	a3,a5,a3
	srli	a2,s5,16
	mul	a3,a3,a2
	srli	a2,a5,16
	addi	a3,x0,65535
	and	a3,s5,a3
	mul	a2,a2,a3
	addi	a3,x0,65535
	and	a3,a5,a3
	srli	a6,s5,16
	mul	a3,a3,a6
	sub	a3,x0,a3
	sub	x0,a2,a3
	bltu	a3,x0,.+8
	jal	x0,8
	addi	a3,x0,0
	jal	x0,4
	addi	a3,x0,1
	addi	a2,x0,65535
	and	a2,a5,a2
	srli	a3,s5,16
	mul	a2,a2,a3
	srli	a3,a5,16
	addi	a6,x0,65535
	and	a6,s5,a6
	mul	a3,a3,a6
	addi	a6,x0,65535
	and	a6,a5,a6
	srli	a7,s5,16
	mul	a6,a6,a7
	sub	a6,x0,a6
	sub	x0,a3,a6
	bltu	a2,x0,.+8
	jal	x0,8
	addi	a2,x0,0
	jal	x0,4
	addi	a2,x0,1
	addi	a3,x0,65535
	and	a3,a5,a3
	addi	a6,x0,65535
	and	a6,s5,a6
	mul	a3,a3,a6
	srli	a3,a3,16
	addi	a6,x0,65535
	and	a6,a5,a6
	addi	a7,x0,65535
	and	a7,s5,a7
	mul	a6,a6,a7
	srli	a6,a6,16
	srli	a7,a5,16
	addi	t0,x0,65535
	and	t0,s5,t0
	mul	a7,a7,t0
	addi	t0,x0,65535
	and	t0,a5,t0
	srli	t1,s5,16
	mul	t0,t0,t1
	sub	t0,x0,t0
	sub	a7,a7,t0
	sub	a7,x0,a7
	sub	x0,a6,a7
	bltu	a3,x0,.+8
	jal	x0,8
	addi	a3,x0,0
	jal	x0,4
	addi	a3,x0,1
	and	a2,a2,a3
	addi	a3,x0,65535
	and	a3,a5,a3
	addi	a6,x0,65535
	and	a6,s5,a6
	mul	a3,a3,a6
	srli	a3,a3,16
	addi	a6,x0,65535
	and	a6,a5,a6
	addi	a7,x0,65535
	and	a7,s5,a7
	mul	a6,a6,a7
	srli	a6,a6,16
	srli	a7,a5,16
	addi	t0,x0,65535
	and	t0,s5,t0
	mul	a7,a7,t0
	addi	t0,x0,65535
	and	t0,a5,t0
	srli	t1,s5,16
	mul	t0,t0,t1
	sub	t0,x0,t0
	sub	a7,a7,t0
	sub	a7,x0,a7
	sub	x0,a6,a7
	bltu	a3,x0,.+8
	jal	x0,8
	addi	a3,x0,0
	jal	x0,4
	addi	a3,x0,1
	sub	a2,a2,a3
	sub	a3,a3,a2
	slli	a3,a3,16
	addi	a2,x0,65535
	and	a2,a5,a2
	addi	a3,x0,65535
	and	a3,s5,a3
	mul	a2,a2,a3
	srli	a2,a2,16
	srli	a3,a5,16
	addi	a6,x0,65535
	and	a6,s5,a6
	mul	a3,a3,a6
	addi	a6,x0,65535
	and	a6,a5,a6
	srli	a7,s5,16
	mul	a6,a6,a7
	sub	a6,x0,a6
	sub	a3,a3,a6
	sub	a3,x0,a3
	sub	a2,a2,a3
	srli	a2,a2,16
	srli	a3,a5,16
	srli	a6,s5,16
	mul	a3,a3,a6
	sub	a3,x0,a3
	sub	a2,a2,a3
	sub	a2,x0,a2
	sub	a3,a3,a2
	mul	a5,a5,s5
	sub	a2,x0,a4
	sub	a4,a3,a2
	addi	a3,a5,1
	bltu	a5,a3,.+8
	jal	x0,8
	addi	a5,x0,0
	jal	x0,4
	addi	a5,x0,1
	sub	a2,x0,a5
	sub	a5,a4,a2
	lw	a4,24(sp)
	sw	a5,%lo(bitcnts_rand_state+4)(s3)
	sw	a3,%lo(bitcnts_rand_state)(s3)
	bge	zero,a4,.L56
	lw	a4,48(sp)
	lw	s2,0(s7)
	addi	s0,zero,0
	and	s9,a5,a4
	lw	a5,44(sp)
	sub	s1,x0,s9
	sub	s1,a5,s1
.L49:
.L48:
.L50:
.L51:
.L56:
.L65:
	.size	main, .-main
	.section	.rodata.str1.4
	.align	2
.LC5:
	.string	"Optimized 1 bit/loop counter"
	.align	2
.LC6:
	.string	"Ratko's mystery algorithm"
	.align	2
.LC7:
	.string	"Recursive bit count by nybbles"
	.align	2
.LC8:
	.string	"Non-recursive bit count by nybbles"
	.align	2
.LC9:
	.string	"Non-recursive bit count by bytes (BW)"
	.align	2
.LC10:
	.string	"Non-recursive bit count by bytes (AR)"
	.align	2
.LC11:
	.string	"Shift and count bits"
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	-2048145248
	.word	2145504499
	.align	3
.LC1:
	.word	0
	.word	1093567616
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	bit_count_table, @object
	.size	bit_count_table, 256
bit_count_table:
	.base64	"AAEBAgECAgMBAgIDAgMDBAECAgMCAwMEAgMDBAMEBAUBAgIDAgMDBAIDAwQDBAQFAgMDBAMEBAUDBAQFBAUFBgECAgMCAwMEAgMDBAMEBAUCAwMEAwQEBQMEBAUEBQUGAgMDBAMEBAUDBAQFBAUFBgMEBAUEBQUGBAUFBgUGBgcBAgIDAgMDBAIDAwQDBAQFAgMDBAMEBAUDBAQFBAUFBgIDAwQDBAQFAwQEBQQFBQYDBAQFBAUFBgQFBQYFBgYHAgMDBAMEBAUDBAQFBAUFBgMEBAUEBQUGBAUFBgUGBgcDBAQFBAUFBgQFBQYFBgYHBAUFBgUGBgcFBgYHBgcH"
	.ascii	"\b"
	.type	text.0, @object
	.size	text.0, 28
text.0:
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.type	pBitCntFunc.1, @object
	.size	pBitCntFunc.1, 28
pBitCntFunc.1:
	.word	bit_count
	.word	bitcount
	.word	ntbl_bitcnt
	.word	ntbl_bitcount
	.word	BW_btbl_bitcount
	.word	AR_btbl_bitcount
	.word	bit_shifter
	.section	.sbss,"aw",@nobits
	.align	3
	.type	bitcnts_checksum, @object
	.size	bitcnts_checksum, 8
bitcnts_checksum:
	.zero	8
	.section	.sdata,"aw"
	.align	3
	.type	bitcnts_rand_state, @object
	.size	bitcnts_rand_state, 8
bitcnts_rand_state:
	.word	1
	.word	0
	.globl	__floatsidf
	.globl	__adddf3
	.globl	__gtdf2
	.globl	__ltdf2
	.globl	__divdf3
	.globl	__floatunsidf
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
