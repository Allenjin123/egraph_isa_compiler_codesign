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
	addi	t0,x0,255
	and	a6,a6,t0
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
	addi	a6,x0,255
	and	a0,a0,a6
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
	addi	a6,x0,255
	and	a1,a1,a6
	sub	a4,x0,a5
	sub	a3,a3,a4
	lw	a4,0(a2)
	addi	a6,x0,255
	and	a4,a4,a6
	addi	a2,x0,255
	and	a0,a0,a2
	lw	a2,0(a3)
	addi	a3,x0,255
	and	a3,a2,a3
	sub	a2,x0,a5
	sub	a5,a0,a2
	lw	a0,0(a5)
	addi	a2,x0,255
	and	a0,a0,a2
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
	addi	a6,x0,255
	and	a0,a0,a6
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
	addi	a5,x0,4
	sra	a5,a0,a5
	sub	a0,x0,a2
	sub	a4,a4,a0
	lw	a0,0(a4)
	addi	a3,x0,255
	and	a0,a0,a3
	bne	a5,zero,.+8
	jal	x0,.L6
	addi	a3,zero,0
.L8:
	addi	a4,x0,15
	and	a4,a5,a4
	sub	a6,x0,a2
	sub	a4,a4,a6
	addi	a6,x0,4
	sra	a5,a5,a6
	sub	a6,x0,a3
	sub	a3,a0,a6
	lw	a0,0(a4)
	addi	a6,x0,255
	and	a0,a0,a6
	bne	a5,zero,.+8
	jal	x0,8
	jal	x0,.L8
	sub	a2,x0,a0
	sub	a0,a3,a2
.L6:
	jalr	zero,ra,0
	.size	ntbl_bitcnt, .-ntbl_bitcnt
	.align	2
	.type	bit_shifter, @function
bit_shifter:
	addi	a5,a0,0
	addi	a0,zero,0
	bne	a5,zero,.+8
	jal	x0,.L13
	addi	a4,zero,0
.L15:
	addi	a3,x0,1
	and	a3,a5,a3
	addi	a4,a4,1
	addi	a2,x0,1
	sra	a5,a5,a2
	addi	a2,a4,-32
	sub	a6,x0,a0
	sub	a0,a3,a6
	bne	a5,zero,.+8
	jal	x0,.L13
	bne	a2,zero,.L15
	jalr	zero,ra,0
.L13:
	jalr	zero,ra,0
	.size	bit_shifter, .-bit_shifter
	.align	2
	.globl	bit_count
	.type	bit_count, @function
bit_count:
	bne	a0,zero,.+8
	jal	x0,.L23
	addi	a5,a0,0
	addi	a0,zero,0
.L24:
	addi	a4,a5,-1
	and	a5,a5,a4
	addi	a0,a0,1
	bne	a5,zero,.L24
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
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
.Lpcrel_callmul_1:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a3, x0
	add	a1, a2, x0
.Lpcrel_callmul_2:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_2)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, a2, x0
.Lpcrel_callmul_3:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_3)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	a0,16
	addi	a0,a0,-1
	addi	a7,x0,-1
	addi	t0,x0,-1
	and	t0,t0,a3
	sub	t0,t0,a3
	sub	a7,a7,t0
	addi	t0,x0,-1
	and	t0,t0,a3
	sub	a7,a7,t0
	and	a0,a0,a7
	sub	a0,x0,a0
	sub	a0,a3,a0
	lui	a7,16
	addi	a7,a7,-1
	sub	a0,a0,a7
	sub	a0,a3,a0
	lui	a7,16
	addi	a7,a7,-1
	and	a7,a2,a7
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, a7, x0
.Lpcrel_callmul_4:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_4)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a0,a0,16
	srli	a7,a3,16
	lui	t0,16
	addi	t0,t0,-1
	and	a7,a7,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a2,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a7, x0
	add	a1, t0, x0
.Lpcrel_callmul_5:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_5)
	add	a7, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t0,16
	addi	t0,t0,-1
	and	a7,a7,t0
	lui	t0,16
	addi	t0,t0,-1
	addi	t1,x0,-1
	addi	t2,x0,-1
	and	t2,t2,a3
	sub	t2,t2,a3
	sub	t1,t1,t2
	addi	t2,x0,-1
	and	t2,t2,a3
	sub	t1,t1,t2
	and	t0,t0,t1
	sub	t0,x0,t0
	sub	t0,a3,t0
	lui	t1,16
	addi	t1,t1,-1
	sub	t0,t0,t1
	sub	t0,a3,t0
	srli	t1,a2,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_6:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_6)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	sub	t0,x0,t0
	sub	a7,a7,t0
	sub	a7,x0,a7
	sub	a0,a0,a7
	srli	a0,a0,16
	srli	a7,a3,16
	lui	t0,16
	addi	t0,t0,-1
	and	a7,a7,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a2,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a7, x0
	add	a1, t0, x0
.Lpcrel_callmul_7:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_7)
	add	a7, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	a7,a7,16
	lui	t0,16
	addi	t0,t0,-1
	addi	t1,x0,-1
	addi	t2,x0,-1
	and	t2,t2,a3
	sub	t2,t2,a3
	sub	t1,t1,t2
	addi	t2,x0,-1
	and	t2,t2,a3
	sub	t1,t1,t2
	and	t0,t0,t1
	sub	t0,x0,t0
	sub	t0,a3,t0
	lui	t1,16
	addi	t1,t1,-1
	sub	t0,t0,t1
	sub	t0,a3,t0
	srli	t1,a2,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_8:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_8)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t1,a3,16
	lui	a3,16
	addi	a3,a3,-1
	and	a3,t1,a3
	srli	t1,a2,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a3, x0
	add	a1, t1, x0
.Lpcrel_callmul_9:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_9)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,t0,a3
	sub	a3,x0,a3
	sub	a3,a7,a3
	sub	a3,x0,a3
	sub	a3,a0,a3
	sub	a0,x0,a4
	sub	a4,a1,a0
	addi	a2,a5,1
	bgeu	a2,a5,.+8
	jal	x0,12
	addi	a5,x0,0
	jal	x0,8
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
	bne	a2,a5,.+8
	jal	x0,.L40
	addi	a5,zero,43
	addi	a6,zero,1
	bne	a2,a5,.+8
	jal	x0,.L41
.L33:
	addi	a3,a2,-48
	addi	a5,x0,255
	and	a5,a3,a5
	addi	a1,zero,9
	addi	a4,zero,0
	bgeu	a1,a5,.+8
	jal	x0,.L42
.L34:
	slli	a5,a4,2
	lw	a2,0(a0)
	srli	a2,a2,8
	addi	a7,x0,255
	and	a2,a2,a7
	sub	a7,x0,a5
	sub	a5,a4,a7
	slli	a5,a5,1
	sub	a4,x0,a3
	sub	a4,a5,a4
	addi	a3,a2,-48
	addi	a5,x0,255
	addi	a2,x0,-1
	addi	a7,x0,-1
	and	a7,a7,a3
	sub	a7,a7,a3
	sub	a2,a2,a7
	addi	a7,x0,-1
	and	a7,a7,a3
	sub	a2,a2,a7
	and	a5,a5,a2
	sub	a5,x0,a5
	sub	a5,a3,a5
	addi	a2,x0,255
	sub	x0,a5,a2
	sub	a5,a3,x0
	addi	a0,a0,1
	bgeu	a1,a5,.+8
	jal	x0,8
	jal	x0,.L34
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a4, x0
	add	a1, a6, x0
.Lpcrel_callmul_10:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_10)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	jalr	zero,ra,0
.L41:
	lw	a2,0(a0)
	srli	a2,a2,8
	addi	a1,x0,255
	and	a2,a2,a1
	addi	a1,zero,9
	sub	a3,x0,a0
	sub	a0,a6,a3
	addi	a3,a2,-48
	addi	a5,x0,255
	addi	a2,x0,-1
	addi	a4,x0,-1
	and	a4,a4,a3
	sub	a4,a4,a3
	sub	a2,a2,a4
	addi	a4,x0,-1
	and	a4,a4,a3
	sub	a2,a2,a4
	and	a5,a5,a2
	sub	a5,x0,a5
	sub	a5,a3,a5
	addi	a2,x0,255
	sub	x0,a5,a2
	sub	a5,a3,x0
	addi	a4,zero,0
	bgeu	a1,a5,.+8
	jal	x0,8
	jal	x0,.L34
.L42:
	addi	a0,zero,0
	jalr	zero,ra,0
.L40:
	lw	a2,0(a0)
	srli	a2,a2,8
	addi	a1,x0,255
	and	a2,a2,a1
	addi	a6,zero,-1
	addi	a0,a0,1
	jal	x0,.L33
	.size	atoi, .-atoi
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%-38s> Time: %4ld.%03ld sec.; Bits: %ld\n"
	.align	2
.LC1:
	.string	"\nBest  > %s\n"
	.align	2
.LC2:
	.string	"Worst > %s\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lw	a4,4(a1)
	addi	sp,sp,-112
	sw	ra,108(sp)
	sw	s0,104(sp)
	sw	s1,100(sp)
	sw	s2,96(sp)
	sw	s3,92(sp)
	sw	s4,88(sp)
	sw	s5,84(sp)
	sw	s6,80(sp)
	sw	s7,76(sp)
	sw	s8,72(sp)
	sw	s9,68(sp)
	sw	s10,64(sp)
	sw	s11,60(sp)
	lw	a5,0(a4)
	addi	a0,x0,255
	and	a5,a5,a0
	addi	a3,zero,45
	bne	a5,a3,.+8
	jal	x0,.L63
	addi	a5,a5,-43
	addi	a0,x0,1
	bgeu	a5,a0,.+8
	jal	x0,12
	addi	a5,x0,0
	jal	x0,8
	addi	a5,x0,1
	sub	a0,x0,a4
	sub	a4,a5,a0
	addi	s8,zero,1
.L45:
	lw	a1,0(a4)
	addi	a0,x0,255
	and	a1,a1,a0
	addi	a0,zero,9
	addi	a3,zero,0
	addi	a2,a1,-48
	addi	a5,x0,255
	addi	a1,x0,-1
	addi	a6,x0,-1
	and	a6,a6,a2
	sub	a6,a6,a2
	sub	a1,a1,a6
	addi	a6,x0,-1
	and	a6,a6,a2
	sub	a1,a1,a6
	and	a5,a5,a1
	sub	a5,x0,a5
	sub	a5,a2,a5
	addi	a1,x0,255
	sub	x0,a5,a1
	sub	a5,a2,x0
	bgeu	a0,a5,.+8
	jal	x0,.L47
.L46:
	slli	a5,a3,2
	lw	a1,0(a4)
	srli	a1,a1,8
	addi	a6,x0,255
	and	a1,a1,a6
	sub	a6,x0,a5
	sub	a5,a3,a6
	slli	a5,a5,1
	sub	a3,x0,a2
	sub	a3,a5,a3
	addi	a2,a1,-48
	addi	a5,x0,255
	and	a5,a2,a5
	addi	a4,a4,1
	bgeu	a0,a5,.L46
.L47:
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s8, x0
	add	a1, a3, x0
.Lpcrel_callmul_11:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_11)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	s7,524288
	lui	s5,313688
	addi	s7,s7,-1
	addi	s5,s5,-211
	addi	s0,zero,0
	addi	s9,zero,0
	sw	zero,28(sp)
	sw	zero,24(sp)
	addi	s3,zero,0
	sw	a5,16(sp)
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	sw	a5,44(sp)
	addi	s6,a5,256
	lw	a5,16(sp)
	lw	a2,16(sp)
	sw	zero,20(sp)
	slli	a5,a2,1
	sub	a1,x0,a5
	sub	a5,a2,a1
	slli	a5,a5,2
	sub	a1,x0,a5
	sub	a5,a2,a1
	sw	a5,40(sp)
	lui	a5,361759
	addi	a5,a5,1069
	sw	a5,32(sp)
	lui	a5,274878
	addi	a5,a5,-381
	sw	a5,36(sp)
	lui	s4,%hi(bitcnts_rand_state)
	addi	s10,zero,1000
.L52:
.Lpcrel_1:
	auipc	ra,%pcrel_hi(clock)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
	lw	a3,%lo(bitcnts_rand_state)(s4)
	lw	a4,%lo(bitcnts_rand_state+4)(s4)
	lw	a5,32(sp)
	sw	a0,12(sp)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, s5, x0
.Lpcrel_callmul_12:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_12)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a3, x0
	add	a1, a5, x0
.Lpcrel_callmul_13:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_13)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a3, x0
	add	a1, s5, x0
.Lpcrel_callmul_14:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_14)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a1,x0,a4
	sub	a4,a2,a1
	lui	a1,16
	addi	a1,a1,-1
	and	a1,a3,a1
	lui	a2,16
	addi	a2,a2,-1
	and	a2,s5,a2
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
.Lpcrel_callmul_15:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_15)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a1,a1,16
	srli	a2,a3,16
	lui	a6,16
	addi	a6,a6,-1
	and	a2,a2,a6
	lui	a6,16
	addi	a6,a6,-1
	and	a6,s5,a6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a2, x0
	add	a1, a6, x0
.Lpcrel_callmul_16:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_16)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	a6,16
	addi	a6,a6,-1
	and	a2,a2,a6
	lui	a6,16
	addi	a6,a6,-1
	and	a6,a3,a6
	srli	a7,s5,16
	lui	t0,16
	addi	t0,t0,-1
	and	a7,a7,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a6, x0
	add	a1, a7, x0
.Lpcrel_callmul_17:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_17)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	a7,16
	addi	a7,a7,-1
	and	a6,a6,a7
	sub	a6,x0,a6
	sub	a2,a2,a6
	sub	a2,x0,a2
	sub	a1,a1,a2
	srli	a1,a1,16
	srli	a2,a3,16
	lui	a6,16
	addi	a6,a6,-1
	and	a2,a2,a6
	lui	a6,16
	addi	a6,a6,-1
	and	a6,s5,a6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a2, x0
	add	a1, a6, x0
.Lpcrel_callmul_18:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_18)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	a2,a2,16
	lui	a6,16
	addi	a6,a6,-1
	and	a6,a3,a6
	srli	a7,s5,16
	lui	t0,16
	addi	t0,t0,-1
	and	a7,a7,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a6, x0
	add	a1, a7, x0
.Lpcrel_callmul_19:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_19)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	a6,a6,16
	srli	a7,a3,16
	lui	a3,16
	addi	a3,a3,-1
	and	a3,a7,a3
	srli	a7,s5,16
	lui	t0,16
	addi	t0,t0,-1
	and	a7,a7,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a3, x0
	add	a1, a7, x0
.Lpcrel_callmul_20:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_20)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a6,a3
	sub	a3,x0,a3
	sub	a3,a2,a3
	sub	a3,x0,a3
	sub	a3,a1,a3
	addi	a2,a5,1
	bgeu	a2,a5,.+8
	jal	x0,12
	addi	a5,x0,0
	jal	x0,8
	addi	a5,x0,1
	sw	a2,%lo(bitcnts_rand_state)(s4)
	sub	a1,x0,a4
	sub	a4,a3,a1
	sub	a1,x0,a5
	sub	a5,a4,a1
	lw	a4,16(sp)
	sw	a5,%lo(bitcnts_rand_state+4)(s4)
	bge	zero,a4,.+8
	jal	x0,8
	jal	x0,.L55
	lui	a3,%hi(.LANCHOR0+284)
	slli	a4,s3,2
	addi	a3,a3,%lo(.LANCHOR0+284)
	sub	a0,x0,a3
	sub	a4,a4,a0
	lw	s2,0(a4)
	lui	a4,524288
	addi	a4,a4,-1
	and	s8,a5,a4
	lw	a5,40(sp)
	addi	s11,zero,0
	sub	s1,x0,s8
	sub	s1,a5,s1
.L49:
.L48:
.L50:
.L51:
.L55:
.L63:
	.size	main, .-main
	.section	.rodata.str1.4
	.align	2
.LC3:
	.string	"Optimized 1 bit/loop counter"
	.align	2
.LC4:
	.string	"Ratko's mystery algorithm"
	.align	2
.LC5:
	.string	"Recursive bit count by nybbles"
	.align	2
.LC6:
	.string	"Non-recursive bit count by nybbles"
	.align	2
.LC7:
	.string	"Non-recursive bit count by bytes (BW)"
	.align	2
.LC8:
	.string	"Non-recursive bit count by bytes (AR)"
	.align	2
.LC9:
	.string	"Shift and count bits"
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
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
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
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits


    .text
    .align 2
__mul:
.Mul_loop:
.Mul_skip:

.text
.align 2

# Signed 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_divsi3
__riscv_div_lib_divsi3:
    # Since the quotient is positive, fall into udivsi3

# Unsigned 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_udivsi3
__riscv_div_lib_udivsi3:
__riscv_div_lib_L1:
__riscv_div_lib_L2:
__riscv_div_lib_L3:
__riscv_div_lib_L4:
__riscv_div_lib_L5:

# Unsigned 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_umodsi3
__riscv_div_lib_umodsi3:

# Handle negative arguments to divsi3
__riscv_div_lib_L10:
__riscv_div_lib_L12:

# Signed 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_modsi3
__riscv_div_lib_modsi3:
__riscv_div_lib_L30:
__riscv_div_lib_L31:
__riscv_div_lib_L32:

# end of subrountine