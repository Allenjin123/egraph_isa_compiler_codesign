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
	add	a4,a4,a0
	lui	a3,209715
	addi	a3,a3,819
	srli	a5,a4,2
	and	a5,a5,a3
	and	a4,a4,a3
	add	a5,a5,a4
	lui	a3,61681
	addi	a3,a3,-241
	srli	a4,a5,4
	and	a4,a4,a3
	and	a5,a5,a3
	add	a4,a4,a5
	lui	a3,4080
	addi	a3,a3,255
	srli	a5,a4,8
	and	a5,a5,a3
	and	a4,a4,a3
	add	a5,a5,a4
	slli	a0,a5,16
	srli	a0,a0,16
	srli	a5,a5,16
	add	a0,a5,a0
	jalr	zero,ra,0
	.size	bitcount, .-bitcount
	.align	2
	.globl	ntbl_bitcount
	.type	ntbl_bitcount, @function
ntbl_bitcount:
	srli	a5,a0,4
	lui	a4,%hi(.LANCHOR0)
	addi	a4,a4,%lo(.LANCHOR0)
	andi	a1,a0,15
	srli	a2,a0,8
	andi	a5,a5,15
	add	a1,a4,a1
	add	a5,a4,a5
	srli	a3,a0,12
	andi	a2,a2,15
	lbu	t1,0(a1)
	add	a2,a4,a2
	lbu	a5,0(a5)
	srli	a1,a0,16
	andi	a3,a3,15
	lbu	a7,0(a2)
	add	a3,a4,a3
	srli	a2,a0,20
	andi	a1,a1,15
	lbu	a6,0(a3)
	add	a1,a4,a1
	srli	a3,a0,24
	andi	a2,a2,15
	lbu	a1,0(a1)
	add	a5,a5,t1
	add	a2,a4,a2
	andi	a3,a3,15
	lbu	a2,0(a2)
	add	a5,a5,a7
	add	a3,a4,a3
	srli	a0,a0,28
	lbu	a3,0(a3)
	add	a5,a5,a6
	add	a4,a4,a0
	lbu	a0,0(a4)
	add	a5,a5,a1
	add	a5,a5,a2
	add	a5,a5,a3
	add	a0,a5,a0
	jalr	zero,ra,0
	.size	ntbl_bitcount, .-ntbl_bitcount
	.align	2
	.globl	BW_btbl_bitcount
	.type	BW_btbl_bitcount, @function
BW_btbl_bitcount:
	srli	a4,a0,8
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	andi	a2,a0,255
	andi	a4,a4,255
	add	a4,a5,a4
	add	a2,a5,a2
	srli	a3,a0,24
	srli	a0,a0,16
	lbu	a1,0(a4)
	add	a3,a5,a3
	lbu	a4,0(a2)
	andi	a0,a0,255
	lbu	a3,0(a3)
	add	a5,a5,a0
	lbu	a0,0(a5)
	add	a5,a4,a1
	add	a5,a5,a3
	add	a0,a5,a0
	jalr	zero,ra,0
	.size	BW_btbl_bitcount, .-BW_btbl_bitcount
	.align	2
	.globl	AR_btbl_bitcount
	.type	AR_btbl_bitcount, @function
AR_btbl_bitcount:
	srli	a3,a0,8
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	andi	a2,a0,255
	srli	a4,a0,16
	andi	a3,a3,255
	add	a3,a5,a3
	add	a2,a5,a2
	andi	a4,a4,255
	lbu	a3,0(a3)
	lbu	a2,0(a2)
	add	a4,a5,a4
	srli	a0,a0,24
	lbu	a4,0(a4)
	add	a5,a5,a0
	lbu	a0,0(a5)
	add	a3,a3,a2
	add	a4,a4,a3
	add	a0,a0,a4
	jalr	zero,ra,0
	.size	AR_btbl_bitcount, .-AR_btbl_bitcount
	.align	2
	.globl	ntbl_bitcnt
	.type	ntbl_bitcnt, @function
ntbl_bitcnt:
	lui	a2,%hi(.LANCHOR0)
	andi	a4,a0,15
	addi	a2,a2,%lo(.LANCHOR0)
	srai	a5,a0,4
	add	a4,a2,a4
	lbu	a0,0(a4)
	beq	a5,zero,.L6
	addi	a3,zero,0
.L8:
	andi	a4,a5,15
	add	a4,a2,a4
	srai	a5,a5,4
	add	a3,a3,a0
	lbu	a0,0(a4)
	bne	a5,zero,.L8
	add	a0,a0,a3
.L6:
	jalr	zero,ra,0
	.size	ntbl_bitcnt, .-ntbl_bitcnt
	.align	2
	.type	bit_shifter, @function
bit_shifter:
	addi	a5,a0,0
	addi	a0,zero,0
	beq	a5,zero,.L13
	addi	a4,zero,0
.L15:
	andi	a3,a5,1
	addi	a4,a4,1
	srai	a5,a5,1
	addi	a2,a4,-32
	add	a0,a0,a3
	beq	a5,zero,.L13
	bne	a2,zero,.L15
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
.Lpcrel_callmul_443:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_443)
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
.Lpcrel_callmul_444:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_444)
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
.Lpcrel_callmul_445:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_445)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,a3,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
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
.Lpcrel_callmul_446:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_446)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a3,t1
	srli	t2,a2,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_447:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_447)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	add	t0,t0,t1
	srli	t1,a3,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a2,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_448:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_448)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	add	t0,t0,t1
	srli	t1,a3,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a2,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_449:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_449)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a3,t2
	srli	t3,a2,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_450:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_450)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	sub	t2,x0,t2
	sub	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a3,t2
	lui	a3,16
	addi	a3,a3,-1
	and	a3,a2,a3
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, t2, x0
	add	a1, a3, x0
.Lpcrel_callmul_451:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_451)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a3,a3,16
	add	a3,t1,a3
	srli	a3,a3,16
	add	a3,t0,a3
	add	a4,a4,a1
	addi	a2,a5,1
	bltu	a2,a5,.+8
	jal	x0,.+8
	jal	x0,.+12
	addi	a5,x0,0
	jal	x0,.+8
	addi	a5,x0,1
	sw	a2,%lo(bitcnts_rand_state)(a6)
	add	a4,a4,a3
	add	a5,a5,a4
	slli	a0,a5,1
	sw	a5,%lo(bitcnts_rand_state+4)(a6)
	srli	a0,a0,1
	jalr	zero,ra,0
	.size	rand, .-rand
	.align	2
	.globl	atoi
	.type	atoi, @function
atoi:
	lbu	a2,0(a0)
	addi	a5,zero,45
	beq	a2,a5,.L40
	addi	a5,zero,43
	addi	a6,zero,1
	beq	a2,a5,.L41
.L33:
	addi	a3,a2,-48
	andi	a5,a3,255
	addi	a1,zero,9
	addi	a4,zero,0
	bltu	a1,a5,.L42
.L34:
	slli	a5,a4,2
	lbu	a2,1(a0)
	add	a5,a5,a4
	slli	a5,a5,1
	add	a4,a3,a5
	addi	a3,a2,-48
	andi	a5,a3,255
	addi	a0,a0,1
	bltu	a1,a5,.+8
	jal	x0,.L34
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a4, x0
	add	a1, a6, x0
.Lpcrel_callmul_452:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_452)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	jalr	zero,ra,0
.L41:
	lbu	a2,1(a0)
	addi	a1,zero,9
	add	a0,a0,a6
	addi	a3,a2,-48
	andi	a5,a3,255
	addi	a4,zero,0
	bltu	a1,a5,.+8
	jal	x0,.L34
.L42:
	addi	a0,zero,0
	jalr	zero,ra,0
.L40:
	lbu	a2,1(a0)
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
	lbu	a5,0(a4)
	addi	a3,zero,45
	beq	a5,a3,.L63
	addi	a5,a5,-43
	addi	t0,x0,1
	bltu	a5,t0,.+12
	addi	a5,x0,0
	jal	x0,.+8
	addi	a5,x0,1
	add	a4,a4,a5
	addi	s8,zero,1
.L45:
	lbu	a1,0(a4)
	addi	a0,zero,9
	addi	a3,zero,0
	addi	a2,a1,-48
	andi	a5,a2,255
	bltu	a0,a5,.L47
.L46:
	slli	a5,a3,2
	lbu	a1,1(a4)
	add	a5,a5,a3
	slli	a5,a5,1
	add	a3,a2,a5
	addi	a2,a1,-48
	andi	a5,a2,255
	addi	a4,a4,1
	bltu	a0,a5,.+8
	jal	x0,.L46
.L47:
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s8, x0
	add	a1, a3, x0
.Lpcrel_callmul_453:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_453)
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
	add	a5,a5,a2
	slli	a5,a5,2
	add	a5,a5,a2
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
.Lpcrel_callmul_454:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_454)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, a5, x0
.Lpcrel_callmul_455:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_455)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
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
	add	a1, s5, x0
.Lpcrel_callmul_456:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_456)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	add	a4,a4,a2
	srli	t0,a3,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	srli	t1,s5,16
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
.Lpcrel_callmul_457:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_457)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a3,t1
	srli	t2,s5,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_458:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_458)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	add	t0,t0,t1
	srli	t1,a3,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s5,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_459:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_459)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	add	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a3,t1
	srli	t2,s5,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_460:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_460)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	srli	t2,a3,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,s5,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_461:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_461)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	add	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a3,t2
	lui	a3,16
	addi	a3,a3,-1
	and	a3,s5,a3
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, t2, x0
	add	a1, a3, x0
.Lpcrel_callmul_462:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_462)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a3,a3,16
	add	a3,t1,a3
	srli	a3,a3,16
	add	a3,t0,a3
	addi	a2,a5,1
	bltu	a2,a5,.+12
	addi	a5,x0,0
	jal	x0,.+8
	addi	a5,x0,1
	sw	a2,%lo(bitcnts_rand_state)(s4)
	add	a4,a4,a3
	add	a5,a5,a4
	lw	a4,16(sp)
	sw	a5,%lo(bitcnts_rand_state+4)(s4)
	bge	zero,a4,.L55
	lui	a3,%hi(.LANCHOR0+284)
	slli	a4,s3,2
	addi	a3,a3,%lo(.LANCHOR0+284)
	add	a4,a3,a4
	lw	s2,0(a4)
	lui	a4,524288
	addi	a4,a4,-1
	and	s8,a5,a4
	lw	a5,40(sp)
	addi	s11,zero,0
	add	s1,s8,a5
.L49:
	addi	a0,s8,0
	jalr	ra,s2,0
	addi	s8,s8,13
	add	s11,s11,a0
	bne	s8,s1,.L49
	addi	s1,s11,0
	srai	s2,s11,31
.L48:
.Lpcrel_2:
	auipc	ra,%pcrel_hi(clock)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_2)
	lw	a5,12(sp)
	lw	a4,36(sp)
	sub	a5,a0,a5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, s10, x0
.Lpcrel_callmul_463:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_463)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,a5,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	srli	t1,a4,16
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
.Lpcrel_callmul_464:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_464)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a5,t1
	srli	t2,a4,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_465:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_465)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	add	t0,t0,t1
	srli	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_466:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_466)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	add	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a5,t1
	srli	t2,a4,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_467:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_467)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	srli	t2,a5,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a4,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_468:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_468)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	add	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a5,t2
	lui	a5,16
	addi	a5,a5,-1
	and	a5,a4,a5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, a5, x0
.Lpcrel_callmul_469:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_469)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	a5,a5,16
	add	a5,t1,a5
	srli	a5,a5,16
	add	a5,t0,a5
	srli	a5,a5,18
	bge	a5,s7,.L50
	sw	s3,24(sp)
	addi	s7,a5,0
.L50:
	lw	a4,20(sp)
	bge	a4,a5,.L51
	sw	s3,28(sp)
	sw	a5,20(sp)
.L51:
	lui	a2,67109
	addi	a2,a2,-557
	srli	t0,a5,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
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
.Lpcrel_callmul_470:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_470)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a5,t1
	srli	t2,a2,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_471:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_471)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	add	t0,t0,t1
	srli	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a2,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_472:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_472)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	add	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a5,t1
	srli	t2,a2,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_473:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_473)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	srli	t2,a5,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a2,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_474:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_474)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	add	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a5,t2
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a2,t3
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_475:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_475)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a2,a2,16
	add	a2,t1,a2
	srli	a2,a2,16
	add	a2,t0,a2
	add	s0,a5,s0
	bltu	s0,a5,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	add	s1,s0,s1
	add	a3,a3,s9
	add	a3,a3,s2
	bltu	s1,s0,.+12
	addi	s0,x0,0
	jal	x0,.+8
	addi	s0,x0,1
	add	s9,s0,a3
	lw	a1,0(s6)
	lui	a0,%hi(.LC0)
	srli	a2,a2,6
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, s10, x0
.Lpcrel_callmul_476:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_476)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	a4,s11,0
	addi	a0,a0,%lo(.LC0)
	addi	s3,s3,1
	addi	s0,s1,0
	addi	s6,s6,4
	sub	a3,a5,a3
.Lpcrel_3:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_3)
	addi	a5,zero,7
	bne	s3,a5,.L52
	lw	a3,20(sp)
	add	a5,s7,s1
	bltu	a5,s7,.+12
	addi	a4,x0,0
	jal	x0,.+8
	addi	a4,x0,1
	add	a5,a3,a5
	bltu	a5,a3,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	add	a4,a4,s9
	add	a4,a3,a4
	lw	a3,24(sp)
	lw	a2,28(sp)
	lui	a0,%hi(.LC1)
	add	a5,a3,a5
	srai	a3,a3,31
	add	a4,a3,a4
	lw	a3,24(sp)
	srai	a2,a2,31
	addi	a0,a0,%lo(.LC1)
	bltu	a5,a3,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	add	a3,a3,a4
	lw	a4,28(sp)
	add	a2,a2,a3
	lw	a3,44(sp)
	add	a5,a4,a5
	lw	a4,24(sp)
	slli	a4,a4,2
	add	a4,a3,a4
	lw	a3,28(sp)
	lw	a1,256(a4)
	lw	a4,16(sp)
	bltu	a5,a3,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	add	a3,a3,a2
	lw	a2,16(sp)
	add	a5,a2,a5
	srai	a4,a2,31
	bltu	a5,a2,.+12
	addi	s8,x0,0
	jal	x0,.+8
	addi	s8,x0,1
	addi	s0,a5,0
	add	a5,a4,a3
	add	s1,s8,a5
	lui	a5,%hi(bitcnts_checksum)
	sw	s0,%lo(bitcnts_checksum)(a5)
	sw	s1,%lo(bitcnts_checksum+4)(a5)
.Lpcrel_4:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_4)
	lw	a5,28(sp)
	lw	a4,44(sp)
	lui	a0,%hi(.LC2)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a1,256(a5)
	addi	a0,a0,%lo(.LC2)
.Lpcrel_5:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_5)
	lw	ra,108(sp)
	addi	a0,x0,1
	bltu	s0,a0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	lw	s0,104(sp)
	sub	a0,s1,a0
	and	t0,s1,a0
	sub	a0,t0,a0
	sub	a0,s1,a0
	lw	s2,96(sp)
	lw	s1,100(sp)
	lw	s3,92(sp)
	lw	s4,88(sp)
	lw	s5,84(sp)
	lw	s6,80(sp)
	lw	s7,76(sp)
	lw	s8,72(sp)
	lw	s9,68(sp)
	lw	s10,64(sp)
	lw	s11,60(sp)
	srli	a0,a0,31
	addi	sp,sp,112
	jalr	zero,ra,0
.L55:
	addi	s1,zero,0
	addi	s2,zero,0
	addi	s11,zero,0
	jal	x0,.L48
.L63:
	addi	a4,a4,1
	addi	s8,zero,-1
	jal	x0,.L45
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
	add	a2,a0,x0
	addi	a0,x0,0
.Mul_loop:
	andi	a3,a1,1
	beq	a3,x0,.Mul_skip
	add	a0,a0,a2
.Mul_skip:
	srli	a1,a1,1
	slli	a2,a2,1
	bne	a1,x0,.Mul_loop
	jalr	x0,ra,0

.text
.align 2

# Signed 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_divsi3
__riscv_div_lib_divsi3:
	bge	a0,zero,.+8
	jal	x0,__riscv_div_lib_L10
	bge	a1,zero,.+8
	jal	x0,__riscv_div_lib_L11
    # Since the quotient is positive, fall into udivsi3

# Unsigned 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_udivsi3
__riscv_div_lib_udivsi3:
	addi	a2,a1,0
	addi	a1,a0,0
	addi	a0,zero,-1
	beq	a2,zero,__riscv_div_lib_L5
	addi	a3,zero,1
	bltu	a2,a1,.+8
	jal	x0,__riscv_div_lib_L2
__riscv_div_lib_L1:
	bge	zero,a2,__riscv_div_lib_L2
	slli	a2,a2,1
	slli	a3,a3,1
	bltu	a2,a1,.+8
	jal	x0,.+8
	jal	x0,__riscv_div_lib_L1
__riscv_div_lib_L2:
	addi	a0,zero,0
__riscv_div_lib_L3:
	bltu	a1,a2,__riscv_div_lib_L4
	sub	a1,a1,a2
	and	t0,a0,a3
	sub	t0,t0,a3
	sub	a0,a0,t0
__riscv_div_lib_L4:
	srli	a3,a3,1
	srli	a2,a2,1
	bne	a3,zero,__riscv_div_lib_L3
__riscv_div_lib_L5:
	jalr	zero,ra,0

# Unsigned 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_umodsi3
__riscv_div_lib_umodsi3:
	addi	t0,ra,0
.Lpcrel_div1:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div1)
	addi	a0,a1,0
	jalr	zero,t0,0

# Handle negative arguments to divsi3
__riscv_div_lib_L10:
	sub	a0,zero,a0
	bge	zero,a1,.+8
	jal	x0,__riscv_div_lib_L12
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
	bge	a1,zero,.+8
	jal	x0,__riscv_div_lib_L31
	bge	a0,zero,.+8
	jal	x0,__riscv_div_lib_L32
__riscv_div_lib_L30:
.Lpcrel_div3:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div3)
	addi	a0,a1,0
	jalr	zero,t0,0
__riscv_div_lib_L31:
	sub	a1,zero,a1
	bge	a0,zero,.+8
	jal	x0,.+8
	jal	x0,__riscv_div_lib_L30
__riscv_div_lib_L32:
	sub	a0,zero,a0
.Lpcrel_div4:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div4)
	sub	a0,zero,a1
	jalr	zero,t0,0

# end of subrountine