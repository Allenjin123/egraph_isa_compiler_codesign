	.file	"mont64.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
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
	.globl	mulul64
	.type	mulul64, @function
mulul64:
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a2, x0
.Lpcrel_callmul_656:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_656)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t1,16
	addi	t1,t1,-1
	or	t1,a0,t1
	lui	t0,16
	addi	t0,t0,-1
	sub	t1,t1,t0
	sub	t1,a0,t1
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a2,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t0, x0
.Lpcrel_callmul_657:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_657)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srli	t0,a0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a2,t2
	mul	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	or	t2,a0,t2
	lui	t3,16
	addi	t3,t3,-1
	sub	t2,t2,t3
	sub	t2,a0,t2
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
.Lpcrel_callmul_658:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_658)
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
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	t1,t1,t0
	srli	t1,t1,16
	srli	t0,a0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a2,t2
	mul	t0,t0,t2
	srli	t0,t0,16
	lui	t2,16
	addi	t2,t2,-1
	or	t2,a0,t2
	lui	t3,16
	addi	t3,t3,-1
	sub	t2,t2,t3
	sub	t2,a0,t2
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
.Lpcrel_callmul_659:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_659)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srli	t3,a0,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	srli	t4,a2,16
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	mul	t3,t3,t4
	sub	t3,x0,t3
	sub	t2,t2,t3
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	t1,t1,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, a3, x0
.Lpcrel_callmul_660:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_660)
	add	a7, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	add	t1,a6,t1
	sltu	a6,t1,a6
	srli	t4,a1,16
	lui	t0,16
	addi	t0,t0,-1
	and	t4,t4,t0
	srli	t0,a2,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	mul	t4,t4,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a1,t0
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
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_661:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_661)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	add	t4,t4,t0
	srli	t0,a1,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a2,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_662:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_662)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	add	t4,t4,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a1,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a2,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_663:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_663)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t2,a1,16
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
.Lpcrel_callmul_664:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_664)
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
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a1,t3
	srli	t5,a2,16
	lui	t6,16
	addi	t6,t6,-1
	and	t5,t5,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t5, x0
.Lpcrel_callmul_665:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_665)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t5,16
	addi	t5,t5,-1
	and	t3,t3,t5
	sub	t3,x0,t3
	sub	t2,t2,t3
	sub	t2,x0,t2
	sub	t0,t0,t2
	srli	t0,t0,16
	add	t4,t4,t0
	add	t1,a7,t1
	sw	t1,4(a5)
	sltu	a7,t1,a7
	srli	t3,a0,16
	lui	t0,16
	addi	t0,t0,-1
	and	t3,t3,t0
	lui	t0,16
	addi	t0,t0,-1
	or	t0,a3,t0
	lui	t1,16
	addi	t1,t1,-1
	sub	t0,t0,t1
	sub	t0,a3,t0
	mul	t3,t3,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t3,t3,t0
	lui	t0,16
	addi	t0,t0,-1
	or	t0,a0,t0
	lui	t1,16
	addi	t1,t1,-1
	sub	t0,t0,t1
	sub	t0,a0,t0
	srli	t1,a3,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	sub	t0,x0,t0
	sub	t3,t3,t0
	lui	t0,16
	addi	t0,t0,-1
	or	t0,a0,t0
	lui	t1,16
	addi	t1,t1,-1
	sub	t0,t0,t1
	sub	t0,a0,t0
	lui	t1,16
	addi	t1,t1,-1
	or	t1,a3,t1
	lui	t2,16
	addi	t2,t2,-1
	sub	t1,t1,t2
	sub	t1,a3,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_666:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_666)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	add	t3,t3,t0
	srli	t3,t3,16
	srli	t0,a0,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	or	t1,a3,t1
	lui	t2,16
	addi	t2,t2,-1
	sub	t1,t1,t2
	sub	t1,a3,t1
	mul	t0,t0,t1
	srli	t0,t0,16
	lui	t1,16
	addi	t1,t1,-1
	or	t1,a0,t1
	lui	t2,16
	addi	t2,t2,-1
	sub	t1,t1,t2
	sub	t1,a0,t1
	srli	t2,a3,16
	lui	t5,16
	addi	t5,t5,-1
	and	t2,t2,t5
	mul	t1,t1,t2
	srli	t1,t1,16
	srli	t2,a0,16
	lui	t5,16
	addi	t5,t5,-1
	and	t2,t2,t5
	srli	t5,a3,16
	lui	t6,16
	addi	t6,t6,-1
	and	t5,t5,t6
	mul	t2,t2,t5
	sub	t2,x0,t2
	sub	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	t3,t3,t0
	add	a6,a6,t4
	mul	t1,a1,a3
	add	a7,a7,t3
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a1,t0
	lui	t2,16
	addi	t2,t2,-1
	or	t2,a3,t2
	lui	t3,16
	addi	t3,t3,-1
	sub	t2,t2,t3
	sub	t2,a3,t2
	mul	t0,t0,t2
	srli	t0,t0,16
	srli	t2,a1,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	or	t3,a3,t3
	lui	t4,16
	addi	t4,t4,-1
	sub	t3,t3,t4
	sub	t3,a3,t3
	mul	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a1,t3
	srli	t4,a3,16
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	mul	t3,t3,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	sub	t3,x0,t3
	sub	t2,t2,t3
	sub	t2,x0,t2
	sub	t0,t0,t2
	srli	t0,t0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a1,t2
	srli	t3,a3,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	mul	t2,t2,t3
	srli	t2,t2,16
	srli	t3,a1,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	srli	t4,a3,16
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	mul	t3,t3,t4
	sub	t3,x0,t3
	sub	t2,t2,t3
	srli	t3,a1,16
	lui	a1,16
	addi	a1,a1,-1
	and	a1,t3,a1
	lui	t3,16
	addi	t3,t3,-1
	or	t3,a3,t3
	lui	t4,16
	addi	t4,t4,-1
	sub	t3,t3,t4
	sub	t3,a3,t3
	mul	a1,a1,t3
	srli	a1,a1,16
	add	a1,t2,a1
	sub	a1,x0,a1
	sub	a1,t0,a1
	add	a6,t1,a6
	add	a7,a6,a7
	sltu	t1,a6,t1
	sltu	a6,a7,a6
	mul	a0,a0,a2
	add	t1,t1,a1
	sub	t0,x0,a6
	sub	a6,t1,t0
	sw	a0,0(a5)
	sw	a6,4(a4)
	sw	a7,0(a4)
	jalr	zero,ra,0
	.size	mulul64, .-mulul64
	.align	2
	.globl	modul64
	.type	modul64, @function
modul64:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	t3,zero,0
	addi	s0,a4,0
	addi	t0,zero,64
.L9:
	srli	a7,a0,31
	slli	a6,a1,1
	add	a6,a7,a6
	srai	t1,a1,31
	slli	a7,a3,1
	srli	a1,a3,31
	slli	a0,a0,1
	srli	a3,a2,31
	or	a0,a1,a0
	sub	t2,x0,a3
	sub	a7,a7,t2
	or	t4,t1,a6
	addi	a1,a6,0
	addi	t3,t3,1
	slli	a2,a2,1
	or	t1,t1,a0
	addi	a3,a7,0
	bltu	t4,a5,.L7
	sub	t6,a0,s0
	addi	t5,a2,1
	sltu	a4,a0,t6
	sltu	t2,t5,a2
	sub	a6,a6,a5
	bne	a5,t4,.L10
	bltu	t1,s0,.L7
.L10:
	addi	a0,t6,0
	sub	a1,a6,a4
	addi	a2,t5,0
	add	a3,t2,a7
.L7:
	bne	t3,t0,.L9
	lw	s0,12(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
	.size	modul64, .-modul64
	.align	2
	.globl	montmul
	.type	montmul, @function
montmul:
	mul	t1,a1,a2
	srli	t3,a0,16
	lui	t0,16
	addi	t0,t0,-1
	and	t3,t3,t0
	srli	t0,a2,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	mul	t3,t3,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a0,t0
	srli	t2,a2,16
	lui	t4,16
	addi	t4,t4,-1
	and	t2,t2,t4
	mul	t0,t0,t2
	srli	t0,t0,16
	add	t3,t3,t0
	srli	t0,a0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a2,t2
	mul	t0,t0,t2
	srli	t0,t0,16
	add	t3,t3,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a0,t0
	srli	t2,a2,16
	lui	t4,16
	addi	t4,t4,-1
	and	t2,t2,t4
	mul	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	srli	t2,a0,16
	lui	t4,16
	addi	t4,t4,-1
	and	t2,t2,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a2,t4
	mul	t2,t2,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t2,t2,t4
	add	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a0,t2
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a2,t4
	mul	t2,t2,t4
	srli	t2,t2,16
	add	t0,t0,t2
	srli	t0,t0,16
	add	t3,t3,t0
	mul	t4,a0,a3
	add	t3,t1,t3
	sltu	t1,t3,t1
	mul	t5,a0,a2
	add	t3,t4,t3
	sltu	t6,t3,t4
	mul	a7,a7,t5
	mul	t4,t3,a6
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	srli	t0,a1,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	srli	t2,a2,16
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	mul	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a1,t2
	srli	s2,a2,16
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	mul	t2,t2,s2
	srli	t2,t2,16
	add	t0,t0,t2
	srli	t2,a1,16
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a2,s2
	mul	t2,t2,s2
	srli	t2,t2,16
	add	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a1,t2
	srli	s2,a2,16
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	mul	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	srli	s2,a1,16
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	lui	s3,16
	addi	s3,s3,-1
	and	s3,a2,s3
	mul	s2,s2,s3
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	add	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a1,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s3,a2,s3
	mul	a2,s2,s3
	srli	a2,a2,16
	add	a2,t2,a2
	srli	a2,a2,16
	add	a2,t0,a2
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	add	a7,a7,t4
	addi	sp,sp,-16
	sw	s2,0(sp)
	srli	t4,a6,16
	lui	t0,16
	addi	t0,t0,-1
	and	t4,t4,t0
	srli	t0,t5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	mul	t4,t4,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a6,t0
	srli	t2,t5,16
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	mul	t0,t0,t2
	srli	t0,t0,16
	add	t4,t4,t0
	srli	t0,a6,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,t5,t2
	mul	t0,t0,t2
	srli	t0,t0,16
	add	t4,t4,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a6,t0
	srli	t2,t5,16
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	mul	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	srli	t2,a6,16
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,t5,s2
	mul	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	add	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a6,t2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,t5,s2
	mul	t2,t2,s2
	srli	t2,t2,16
	add	t0,t0,t2
	srli	t0,t0,16
	add	t4,t4,t0
	lw	s2,0(sp)
	addi	sp,sp,16
	add	a7,a7,t4
	add	t4,t1,a2
	mul	t1,a1,a3
	mul	a6,a6,t5
	add	t1,t4,t1
	addi	sp,sp,-16
	sw	s2,0(sp)
	srli	t0,a0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	srli	t2,a3,16
	lui	a2,16
	addi	a2,a2,-1
	and	t2,t2,a2
	mul	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a0,t2
	srli	a2,a3,16
	lui	s2,16
	addi	s2,s2,-1
	and	a2,a2,s2
	mul	t2,t2,a2
	srli	t2,t2,16
	add	t0,t0,t2
	srli	t2,a0,16
	lui	a2,16
	addi	a2,a2,-1
	and	t2,t2,a2
	lui	a2,16
	addi	a2,a2,-1
	and	a2,a3,a2
	mul	t2,t2,a2
	srli	t2,t2,16
	add	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a0,t2
	srli	a2,a3,16
	lui	s2,16
	addi	s2,s2,-1
	and	a2,a2,s2
	mul	t2,t2,a2
	lui	a2,16
	addi	a2,a2,-1
	and	t2,t2,a2
	srli	a2,a0,16
	lui	s2,16
	addi	s2,s2,-1
	and	a2,a2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a3,s2
	mul	a2,a2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	a2,a2,s2
	add	t2,t2,a2
	lui	a2,16
	addi	a2,a2,-1
	and	a2,a0,a2
	lui	a0,16
	addi	a0,a0,-1
	and	a0,a3,a0
	mul	a0,a2,a0
	srli	a0,a0,16
	add	a0,t2,a0
	srli	a0,a0,16
	add	a0,t0,a0
	lw	s2,0(sp)
	addi	sp,sp,16
	mul	a2,a7,a4
	add	a0,t6,a0
	sltu	t6,t1,t4
	add	a0,t1,a0
	sltu	t1,a0,t1
	addi	sp,sp,-16
	sw	s2,0(sp)
	srli	t4,a6,16
	lui	t0,16
	addi	t0,t0,-1
	and	t4,t4,t0
	srli	t0,a4,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	mul	t4,t4,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a6,t0
	srli	t2,a4,16
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	mul	t0,t0,t2
	srli	t0,t0,16
	add	t4,t4,t0
	srli	t0,a6,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a4,t2
	mul	t0,t0,t2
	srli	t0,t0,16
	add	t4,t4,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a6,t0
	srli	t2,a4,16
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	mul	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	srli	t2,a6,16
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a4,s2
	mul	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	add	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a6,t2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a4,s2
	mul	t2,t2,s2
	srli	t2,t2,16
	add	t0,t0,t2
	srli	t0,t0,16
	add	t4,t4,t0
	lw	s2,0(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	srli	t0,a1,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	srli	t2,a3,16
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	mul	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a1,t2
	srli	s2,a3,16
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	mul	t2,t2,s2
	srli	t2,t2,16
	add	t0,t0,t2
	srli	t2,a1,16
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a3,s2
	mul	t2,t2,s2
	srli	t2,t2,16
	add	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a1,t2
	srli	s2,a3,16
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	mul	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	srli	s2,a1,16
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	lui	s3,16
	addi	s3,s3,-1
	and	s3,a3,s3
	mul	s2,s2,s3
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	add	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a1,s2
	lui	a1,16
	addi	a1,a1,-1
	and	a1,a3,a1
	mul	a1,s2,a1
	srli	a1,a1,16
	add	a1,t2,a1
	srli	a1,a1,16
	add	a1,t0,a1
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	add	a3,a2,t4
	sltu	a2,a3,a2
	mul	t4,a6,a5
	add	t6,t6,a1
	add	t1,t1,t6
	add	t6,t4,a3
	srli	a1,a7,16
	lui	t0,16
	addi	t0,t0,-1
	and	a1,a1,t0
	srli	t0,a4,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	mul	a1,a1,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a7,t0
	srli	t2,a4,16
	lui	a3,16
	addi	a3,a3,-1
	and	t2,t2,a3
	mul	t0,t0,t2
	srli	t0,t0,16
	add	a1,a1,t0
	srli	t0,a7,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a4,t2
	mul	t0,t0,t2
	srli	t0,t0,16
	add	a1,a1,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a7,t0
	srli	t2,a4,16
	lui	a3,16
	addi	a3,a3,-1
	and	t2,t2,a3
	mul	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	srli	t2,a7,16
	lui	a3,16
	addi	a3,a3,-1
	and	t2,t2,a3
	lui	a3,16
	addi	a3,a3,-1
	and	a3,a4,a3
	mul	t2,t2,a3
	lui	a3,16
	addi	a3,a3,-1
	and	t2,t2,a3
	add	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a7,t2
	lui	a3,16
	addi	a3,a3,-1
	and	a3,a4,a3
	mul	t2,t2,a3
	srli	t2,t2,16
	add	t0,t0,t2
	srli	t0,t0,16
	add	a1,a1,t0
	sltu	a3,t6,t4
	mul	t4,a7,a5
	add	a2,a2,a1
	addi	sp,sp,-16
	sw	s2,0(sp)
	srli	t0,a7,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	srli	t2,a5,16
	lui	a1,16
	addi	a1,a1,-1
	and	t2,t2,a1
	mul	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a7,t2
	srli	a1,a5,16
	lui	s2,16
	addi	s2,s2,-1
	and	a1,a1,s2
	mul	t2,t2,a1
	srli	t2,t2,16
	add	t0,t0,t2
	srli	t2,a7,16
	lui	a1,16
	addi	a1,a1,-1
	and	t2,t2,a1
	lui	a1,16
	addi	a1,a1,-1
	and	a1,a5,a1
	mul	t2,t2,a1
	srli	t2,t2,16
	add	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a7,t2
	srli	a1,a5,16
	lui	s2,16
	addi	s2,s2,-1
	and	a1,a1,s2
	mul	t2,t2,a1
	lui	a1,16
	addi	a1,a1,-1
	and	t2,t2,a1
	srli	a1,a7,16
	lui	s2,16
	addi	s2,s2,-1
	and	a1,a1,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a5,s2
	mul	a1,a1,s2
	lui	s2,16
	addi	s2,s2,-1
	and	a1,a1,s2
	add	t2,t2,a1
	lui	a1,16
	addi	a1,a1,-1
	and	a1,a7,a1
	lui	a7,16
	addi	a7,a7,-1
	and	a7,a5,a7
	mul	a7,a1,a7
	srli	a7,a7,16
	add	a7,t2,a7
	srli	a7,a7,16
	add	a7,t0,a7
	lw	s2,0(sp)
	addi	sp,sp,16
	add	a1,t4,a0
	add	a2,a1,a2
	sltu	t4,a1,t4
	sltu	a1,a2,a1
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	srli	t0,a6,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	srli	t2,a5,16
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	mul	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a6,t2
	srli	s2,a5,16
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	mul	t2,t2,s2
	srli	t2,t2,16
	add	t0,t0,t2
	srli	t2,a6,16
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a5,s2
	mul	t2,t2,s2
	srli	t2,t2,16
	add	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a6,t2
	srli	s2,a5,16
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	mul	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	srli	s2,a6,16
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	lui	s3,16
	addi	s3,s3,-1
	and	s3,a5,s3
	mul	s2,s2,s3
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	add	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a6,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s3,a5,s3
	mul	s2,s2,s3
	srli	s2,s2,16
	add	t2,t2,s2
	srli	t2,t2,16
	add	t0,t0,t2
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	add	a7,a7,t1
	add	t4,t4,a7
	add	a1,a1,t4
	mul	a6,a6,a4
	add	a3,a3,t0
	add	a3,a2,a3
	sltu	a2,a3,a2
	add	a2,a2,a1
	addi	a7,a2,0
	addi	a1,a3,0
	add	t4,a6,t5
	sltu	a6,t4,a6
	add	a6,a6,t3
	add	a6,a6,t6
	bltu	a6,t3,.L22
	bne	t3,a6,.+8
	jal	x0,.L23
.L14:
	xor	a2,a7,t1
	xor	a3,a1,a0
	or	a3,a3,a2
	addi	t0,x0,1
	sltu	a3,a3,t0
	addi	a2,zero,1
	bltu	a6,t3,.L16
	bne	t3,a6,.+8
	jal	x0,.L24
	addi	a2,zero,0
.L16:
	and	a3,a3,a2
	addi	a2,zero,1
	bltu	a7,t1,.L18
	beq	t1,a7,.L25
	addi	a2,zero,0
.L18:
	addi	a0,zero,1
	bltu	a7,a5,.L21
	beq	a5,a7,.L26
.L20:
	or	a2,a2,a0
	or	a3,a3,a2
	slli	a2,a3,31
	srai	a0,a2,31
	and	a0,a0,a4
	slli	a4,a3,31
	srai	a3,a4,31
	sub	a0,a1,a0
	and	a3,a3,a5
	sltu	a1,a1,a0
	sub	a7,a7,a3
	sub	a1,a7,a1
	jalr	zero,ra,0
.L26:
	bltu	a1,a4,.+8
	jal	x0,.L20
.L21:
	addi	a0,zero,0
	jal	x0,.L20
.L23:
	bltu	t4,t5,.+8
	jal	x0,.L14
.L22:
	addi	a1,a3,1
	sltu	a3,a1,a3
	add	a7,a3,a2
	jal	x0,.L14
.L24:
	bltu	t4,t5,.L16
	addi	a2,zero,0
	jal	x0,.L16
.L25:
	bltu	a1,a0,.L18
	addi	a2,zero,0
	jal	x0,.L18
	.size	montmul, .-montmul
	.align	2
	.type	benchmark_body.constprop.0, @function
benchmark_body.constprop.0:
	addi	sp,sp,-112
	lui	a5,%hi(in_b)
	lui	a4,%hi(in_a)
	sw	s8,72(sp)
	sw	s9,68(sp)
	lw	s8,%lo(in_b)(a5)
	lw	s9,%lo(in_a)(a4)
	sw	s11,60(sp)
	lw	s11,%lo(in_a+4)(a4)
	sw	s10,64(sp)
	lw	s10,%lo(in_b+4)(a5)
	lui	a5,%hi(in_m)
	srli	a3,s9,16
	lui	t0,16
	addi	t0,t0,-1
	and	a3,a3,t0
	srli	t0,s8,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	mul	a3,a3,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s9,t0
	srli	t1,s8,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	srli	t0,t0,16
	add	a3,a3,t0
	srli	t0,s9,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s8,t1
	mul	t0,t0,t1
	srli	t0,t0,16
	add	a3,a3,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s9,t0
	srli	t1,s8,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	srli	t1,s9,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s8,t2
	mul	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	add	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s9,t1
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s8,t2
	mul	t1,t1,t2
	srli	t1,t1,16
	add	t0,t0,t1
	srli	t0,t0,16
	add	a3,a3,t0
	sw	s0,104(sp)
	sw	s4,88(sp)
	lw	s0,%lo(in_m+4)(a5)
	lw	s4,%lo(in_m)(a5)
	sw	s3,92(sp)
	sw	s6,80(sp)
	sw	s7,76(sp)
	sw	ra,108(sp)
	sw	s1,100(sp)
	mul	a5,s11,s8
	sw	s2,96(sp)
	sw	s5,84(sp)
	addi	s7,zero,423
	addi	s3,zero,64
	lui	s6,524288
	mul	a4,s9,s10
	add	a3,a5,a3
	sltu	a5,a3,a5
	srli	a2,s11,16
	lui	t0,16
	addi	t0,t0,-1
	and	a2,a2,t0
	srli	t0,s8,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	mul	a2,a2,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s11,t0
	srli	t1,s8,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	srli	t0,t0,16
	add	a2,a2,t0
	srli	t0,s11,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s8,t1
	mul	t0,t0,t1
	srli	t0,t0,16
	add	a2,a2,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s11,t0
	srli	t1,s8,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	srli	t1,s11,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s8,t2
	mul	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	add	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s11,t1
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s8,t2
	mul	t1,t1,t2
	srli	t1,t1,16
	add	t0,t0,t1
	srli	t0,t0,16
	add	a2,a2,t0
	add	t1,a4,a3
	sltu	a3,t1,a4
	sw	t1,24(sp)
	mul	a4,s11,s10
	add	a5,a5,a2
	srli	a2,s11,16
	lui	t0,16
	addi	t0,t0,-1
	and	a2,a2,t0
	srli	t0,s10,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	mul	a2,a2,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s11,t0
	srli	t1,s10,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	srli	t0,t0,16
	add	a2,a2,t0
	srli	t0,s11,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s10,t1
	mul	t0,t0,t1
	srli	t0,t0,16
	add	a2,a2,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s11,t0
	srli	t1,s10,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	srli	t1,s11,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s10,t2
	mul	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	add	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s11,t1
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s10,t2
	mul	t1,t1,t2
	srli	t1,t1,16
	add	t0,t0,t1
	srli	t0,t0,16
	add	a2,a2,t0
	add	a4,a5,a4
	sltu	a5,a4,a5
	add	a5,a5,a2
	srli	a2,s9,16
	lui	t0,16
	addi	t0,t0,-1
	and	a2,a2,t0
	srli	t0,s10,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	mul	a2,a2,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s9,t0
	srli	t1,s10,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	srli	t0,t0,16
	add	a2,a2,t0
	srli	t0,s9,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s10,t1
	mul	t0,t0,t1
	srli	t0,t0,16
	add	a2,a2,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s9,t0
	srli	t1,s10,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	srli	t1,s9,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s10,t2
	mul	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	add	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s9,t1
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s10,t2
	mul	t1,t1,t2
	srli	t1,t1,16
	add	t0,t0,t1
	srli	t0,t0,16
	add	a2,a2,t0
	add	a3,a3,a2
	mul	a2,s9,s8
	add	t3,a4,a3
	sltu	a4,t3,a4
	add	a5,a4,a5
	sw	a5,20(sp)
	sw	t3,28(sp)
	sw	a2,16(sp)
.L49:
	lw	a2,16(sp)
	lw	a6,24(sp)
	lw	a4,28(sp)
	lw	a3,20(sp)
	addi	a7,zero,0
.L30:
	srli	a1,a4,31
	srai	a0,a3,31
	slli	a5,a3,1
	slli	a4,a4,1
	srli	a3,a6,31
	add	a5,a1,a5
	or	a4,a3,a4
	slli	a1,a6,1
	srli	a3,a2,31
	add	a1,a3,a1
	or	t1,a0,a5
	addi	a3,a5,0
	addi	a7,a7,1
	slli	a2,a2,1
	or	a0,a0,a4
	addi	a6,a1,0
	bltu	t1,s0,.L28
	sub	t4,a4,s4
	addi	t3,a2,1
	sltu	t6,a4,t4
	sltu	t5,t3,a2
	sub	a5,a5,s0
	bne	s0,t1,.L50
	bltu	a0,s4,.L28
.L50:
	addi	a4,t4,0
	sub	a3,a5,t6
	addi	a2,t3,0
	add	a6,t5,a1
.L28:
	bne	a7,s3,.L30
	mul	a2,a3,a4
	addi	a7,zero,0
	srli	a5,a4,16
	lui	t0,16
	addi	t0,t0,-1
	and	a5,a5,t0
	srli	t0,a4,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	mul	a5,a5,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a4,t0
	srli	t1,a4,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	srli	t0,t0,16
	add	a5,a5,t0
	srli	t0,a4,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a4,t1
	mul	t0,t0,t1
	srli	t0,t0,16
	add	a5,a5,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a4,t0
	srli	t1,a4,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	srli	t1,a4,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a4,t2
	mul	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	add	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a4,t1
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a4,t2
	mul	t1,t1,t2
	srli	t1,t1,16
	add	t0,t0,t1
	srli	t0,t0,16
	add	a5,a5,t0
	srli	t1,a3,16
	lui	t0,16
	addi	t0,t0,-1
	and	t1,t1,t0
	srli	t0,a4,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	mul	t1,t1,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a3,t0
	srli	t2,a4,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	mul	t0,t0,t2
	srli	t0,t0,16
	add	t1,t1,t0
	srli	t0,a3,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a4,t2
	mul	t0,t0,t2
	srli	t0,t0,16
	add	t1,t1,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a3,t0
	srli	t2,a4,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	mul	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	srli	t2,a3,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a4,t3
	mul	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	add	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a3,t2
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a4,t3
	mul	t2,t2,t3
	srli	t2,t2,16
	add	t0,t0,t2
	srli	t0,t0,16
	add	t1,t1,t0
	add	a6,a5,a2
	sltu	a5,a6,a5
	add	a6,a2,a6
	sltu	a1,a6,a2
	mul	a0,a3,a3
	add	a2,a5,t1
	add	a5,a1,t1
	srli	t0,a3,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	srli	t1,a3,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a3,t1
	srli	t2,a3,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	mul	t1,t1,t2
	srli	t1,t1,16
	add	t0,t0,t1
	srli	t1,a3,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a3,t2
	mul	t1,t1,t2
	srli	t1,t1,16
	add	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a3,t1
	srli	t2,a3,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	mul	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	srli	t2,a3,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a3,t3
	mul	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	add	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a3,t2
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a3,t3
	mul	a3,t2,t3
	srli	a3,a3,16
	add	a3,t1,a3
	srli	a3,a3,16
	add	a3,t0,a3
	add	a1,a2,a0
	sltu	a2,a1,a2
	add	a5,a1,a5
	sltu	a1,a5,a1
	mul	a4,a4,a4
	add	a3,a2,a3
	add	a2,a1,a3
.L33:
	srli	a1,a5,31
	srai	a0,a2,31
	slli	a3,a2,1
	slli	a5,a5,1
	srli	a2,a6,31
	add	a3,a1,a3
	or	a5,a2,a5
	slli	a1,a6,1
	srli	a2,a4,31
	add	a1,a2,a1
	or	t1,a0,a3
	addi	a2,a3,0
	addi	a7,a7,1
	slli	a4,a4,1
	or	a0,a0,a5
	addi	a6,a1,0
	bltu	t1,s0,.L31
	sub	t4,a5,s4
	addi	t3,a4,1
	sltu	t6,a5,t4
	sltu	t5,t3,a4
	sub	a3,a3,s0
	bne	s0,t1,.L51
	bltu	a0,s4,.L31
.L51:
	addi	a5,t4,0
	sub	a2,a3,t6
	addi	a4,t3,0
	add	a6,t5,a1
.L31:
	bne	a7,s3,.L33
	mul	a3,a2,a5
	addi	s2,zero,0
	srli	a4,a5,16
	lui	t0,16
	addi	t0,t0,-1
	and	a4,a4,t0
	srli	t0,a5,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	mul	a4,a4,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	srli	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	srli	t0,t0,16
	add	a4,a4,t0
	srli	t0,a5,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a5,t1
	mul	t0,t0,t1
	srli	t0,t0,16
	add	a4,a4,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	srli	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	srli	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a5,t2
	mul	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	add	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a5,t1
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a5,t2
	mul	t1,t1,t2
	srli	t1,t1,16
	add	t0,t0,t1
	srli	t0,t0,16
	add	a4,a4,t0
	add	a1,a4,a3
	srli	a0,a2,16
	lui	t0,16
	addi	t0,t0,-1
	and	a0,a0,t0
	srli	t0,a5,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	mul	a0,a0,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a2,t0
	srli	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	srli	t0,t0,16
	add	a0,a0,t0
	srli	t0,a2,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a5,t1
	mul	t0,t0,t1
	srli	t0,t0,16
	add	a0,a0,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a2,t0
	srli	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	srli	t1,a2,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a5,t2
	mul	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	add	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a2,t1
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a5,t2
	mul	t1,t1,t2
	srli	t1,t1,16
	add	t0,t0,t1
	srli	t0,t0,16
	add	a0,a0,t0
	sltu	a4,a1,a4
	add	a1,a3,a1
	sltu	s1,a1,a3
	mul	a3,a2,a2
	add	a4,a4,a0
	add	s1,s1,a0
	srli	t0,a2,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	srli	t1,a2,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a2,t1
	srli	t2,a2,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	mul	t1,t1,t2
	srli	t1,t1,16
	add	t0,t0,t1
	srli	t1,a2,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a2,t2
	mul	t1,t1,t2
	srli	t1,t1,16
	add	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a2,t1
	srli	t2,a2,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	mul	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	srli	t2,a2,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a2,t3
	mul	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	add	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a2,t2
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a2,t3
	mul	a2,t2,t3
	srli	a2,a2,16
	add	a2,t1,a2
	srli	a2,a2,16
	add	a2,t0,a2
	add	a3,a4,a3
	sltu	a4,a3,a4
	add	s1,a3,s1
	sltu	a3,s1,a3
	mul	a5,a5,a5
	add	a4,a4,a2
	add	s5,a3,a4
.L36:
	srli	a3,s1,31
	slli	a4,s5,1
	add	a4,a3,a4
	slli	s1,s1,1
	srli	a3,a1,31
	srai	a2,s5,31
	or	s1,a3,s1
	slli	a3,a1,1
	srli	a1,a5,31
	add	a3,a1,a3
	or	a0,a2,a4
	addi	s5,a4,0
	addi	s2,s2,1
	slli	a5,a5,1
	or	a2,a2,s1
	addi	a1,a3,0
	bltu	a0,s0,.L34
	sub	a7,s1,s4
	addi	a6,a5,1
	sltu	t3,s1,a7
	sltu	t1,a6,a5
	sub	a4,a4,s0
	bne	s0,a0,.L52
	bltu	a2,s4,.L34
.L52:
	addi	s1,a7,0
	sub	s5,a4,t3
	addi	a5,a6,0
	add	a1,t1,a3
.L34:
	bne	s2,s3,.L36
	addi	a2,zero,0
	addi	a3,zero,0
	addi	a4,zero,1
	addi	a5,zero,0
	jal	x0,.L39
.L66:
	addi	s2,s2,-1
	add	a4,t6,t5
	addi	a5,t4,0
	beq	s2,zero,.L65
.L39:
	xor	a6,s0,a5
	xor	a1,s4,a4
	slli	a7,a6,31
	srli	a1,a1,1
	slli	t5,a3,31
	add	a1,a7,a1
	srli	t4,a2,1
	srli	t3,a3,1
	and	a0,s4,a4
	addi	t1,x0,1
	and	t1,a4,t1
	add	a2,t5,t4
	addi	a3,t3,0
	and	a7,s0,a5
	add	a1,a0,a1
	srli	a6,a6,1
	srli	t4,a5,1
	slli	t6,a5,31
	srli	t5,a4,1
	add	t3,t3,s6
	beq	t1,zero,.L66
	sltu	a0,a1,a0
	add	a7,a7,a6
	addi	s2,s2,-1
	addi	a4,a1,0
	add	a5,a0,a7
	addi	a3,t3,0
	bne	s2,zero,.L39
.L65:
	sw	a4,32(sp)
	sw	a5,36(sp)
	sw	a2,40(sp)
	sw	a3,44(sp)
	lw	a4,32(sp)
	lw	a5,36(sp)
	lw	a5,40(sp)
	lw	a6,44(sp)
	addi	a7,zero,0
	sw	a5,8(sp)
	sw	a6,12(sp)
	addi	a0,s9,0
	addi	a1,s11,0
	addi	a3,zero,0
	addi	a4,zero,0
.L42:
	srli	a2,a0,31
	slli	a5,a1,1
	add	a5,a2,a5
	slli	a0,a0,1
	srli	a2,a4,31
	srai	a6,a1,31
	or	a0,a2,a0
	slli	a2,a4,1
	srli	a4,a3,31
	add	a2,a4,a2
	or	t1,a6,a5
	addi	a1,a5,0
	addi	a7,a7,1
	slli	a3,a3,1
	or	a6,a6,a0
	addi	a4,a2,0
	bltu	t1,s0,.L40
	sub	t3,a0,s4
	bne	s0,t1,.L53
	bltu	a6,s4,.L40
.L53:
	addi	a6,a3,1
	sltu	a1,a0,t3
	sltu	a4,a6,a3
	sub	a5,a5,s0
	addi	a0,t3,0
	sub	a1,a5,a1
	add	a4,a4,a2
	addi	a3,a6,0
.L40:
	bne	a7,s3,.L42
	addi	t3,zero,0
	addi	a2,s8,0
	addi	a3,s10,0
	addi	a6,zero,0
	addi	a4,zero,0
.L45:
	srli	a7,a2,31
	srai	t1,a3,31
	slli	a5,a3,1
	slli	a2,a2,1
	srli	a3,a4,31
	add	a5,a7,a5
	or	a2,a3,a2
	slli	a7,a4,1
	srli	a3,a6,31
	add	a7,a3,a7
	or	t4,t1,a5
	addi	a3,a5,0
	addi	t3,t3,1
	slli	a6,a6,1
	or	t1,t1,a2
	addi	a4,a7,0
	bltu	t4,s0,.L43
	sub	t5,a2,s4
	bne	s0,t4,.L54
	bltu	t1,s4,.L43
.L54:
	sltu	a3,a2,t5
	sub	a5,a5,s0
	sub	a3,a5,a3
	addi	a5,a6,1
	sltu	a4,a5,a6
	addi	a2,t5,0
	add	a4,a4,a7
	addi	a6,a5,0
.L43:
	bne	t3,s3,.L45
	lw	a6,40(sp)
	lw	a7,44(sp)
	addi	a4,s4,0
	addi	a5,s0,0
.Lpcrel_1:
	auipc	ra,%pcrel_hi(montmul)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
	lw	a6,40(sp)
	lw	a7,44(sp)
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a4,s4,0
	addi	a5,s0,0
.Lpcrel_2:
	auipc	ra,%pcrel_hi(montmul)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_2)
	lw	a6,40(sp)
	lw	a7,44(sp)
	addi	a2,a0,0
	addi	a3,a1,0
	addi	a4,s4,0
	addi	a5,s0,0
.Lpcrel_3:
	auipc	ra,%pcrel_hi(montmul)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_3)
	lw	t1,32(sp)
	lw	t2,36(sp)
	mul	a7,a1,t1
	srli	a2,a0,16
	lui	t0,16
	addi	t0,t0,-1
	and	a2,a2,t0
	srli	t0,t1,16
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	mul	a2,a2,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a0,t0
	srli	t3,t1,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	mul	t0,t0,t3
	srli	t0,t0,16
	add	a2,a2,t0
	srli	t0,a0,16
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t1,t3
	mul	t0,t0,t3
	srli	t0,t0,16
	add	a2,a2,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a0,t0
	srli	t3,t1,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	mul	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	srli	t3,a0,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t4,t1,t4
	mul	t3,t3,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	add	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a0,t3
	lui	t4,16
	addi	t4,t4,-1
	and	t4,t1,t4
	mul	t3,t3,t4
	srli	t3,t3,16
	add	t0,t0,t3
	srli	t0,t0,16
	add	a2,a2,t0
	srli	a6,a1,16
	lui	t0,16
	addi	t0,t0,-1
	and	a6,a6,t0
	srli	t0,t1,16
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	mul	a6,a6,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a1,t0
	srli	t3,t1,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	mul	t0,t0,t3
	srli	t0,t0,16
	add	a6,a6,t0
	srli	t0,a1,16
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t1,t3
	mul	t0,t0,t3
	srli	t0,t0,16
	add	a6,a6,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a1,t0
	srli	t3,t1,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	mul	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	srli	t3,a1,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t4,t1,t4
	mul	t3,t3,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	add	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a1,t3
	lui	t4,16
	addi	t4,t4,-1
	and	t4,t1,t4
	mul	t3,t3,t4
	srli	t3,t3,16
	add	t0,t0,t3
	srli	t0,t0,16
	add	a6,a6,t0
	add	a2,a7,a2
	sltu	a7,a2,a7
	add	a6,a7,a6
	mul	a7,a1,t2
	srli	t0,a1,16
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	srli	t3,t2,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	mul	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a1,t3
	srli	t4,t2,16
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	mul	t3,t3,t4
	srli	t3,t3,16
	add	t0,t0,t3
	srli	t3,a1,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t4,t2,t4
	mul	t3,t3,t4
	srli	t3,t3,16
	add	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a1,t3
	srli	t4,t2,16
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	mul	t3,t3,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	srli	t4,a1,16
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	lui	t5,16
	addi	t5,t5,-1
	and	t5,t2,t5
	mul	t4,t4,t5
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	add	t3,t3,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a1,t4
	lui	a1,16
	addi	a1,a1,-1
	and	a1,t2,a1
	mul	a1,t4,a1
	srli	a1,a1,16
	add	a1,t3,a1
	srli	a1,a1,16
	add	a1,t0,a1
	add	a7,a6,a7
	sltu	a6,a7,a6
	mul	a3,a0,t2
	add	a6,a6,a1
	srli	a5,a0,16
	lui	t0,16
	addi	t0,t0,-1
	and	a5,a5,t0
	srli	t0,t2,16
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	mul	a5,a5,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a0,t0
	srli	t3,t2,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	mul	t0,t0,t3
	srli	t0,t0,16
	add	a5,a5,t0
	srli	t0,a0,16
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t2,t3
	mul	t0,t0,t3
	srli	t0,t0,16
	add	a5,a5,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a0,t0
	srli	t3,t2,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	mul	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	srli	t3,a0,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t4,t2,t4
	mul	t3,t3,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	add	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a0,t3
	lui	t4,16
	addi	t4,t4,-1
	and	t4,t2,t4
	mul	t3,t3,t4
	srli	t3,t3,16
	add	t0,t0,t3
	srli	t0,t0,16
	add	a5,a5,t0
	add	a2,a3,a2
	sltu	a3,a2,a3
	mul	a1,a0,t1
	add	a4,a3,a5
	add	a4,a7,a4
	sltu	a3,a4,a7
	add	a3,a3,a6
.L48:
	srli	a0,a4,31
	srai	a6,a3,31
	slli	a5,a3,1
	slli	a4,a4,1
	srli	a3,a2,31
	add	a5,a0,a5
	or	a4,a3,a4
	slli	a0,a2,1
	srli	a3,a1,31
	add	a0,a3,a0
	or	a7,a6,a5
	addi	a3,a5,0
	addi	s2,s2,1
	slli	a1,a1,1
	or	a6,a6,a4
	addi	a2,a0,0
	bltu	a7,s0,.L46
	sub	t1,a4,s4
	bne	s0,a7,.L55
	bltu	a6,s4,.L46
.L55:
	addi	a6,a1,1
	sltu	a3,a4,t1
	sltu	a2,a6,a1
	sub	a5,a5,s0
	addi	a4,t1,0
	sub	a3,a5,a3
	add	a2,a2,a0
	addi	a1,a6,0
.L46:
	bne	s2,s3,.L48
	addi	s7,s7,-1
	bne	s7,zero,.L49
	lw	a0,8(sp)
	lw	a1,12(sp)
	xor	s5,s5,a3
	mul	a5,s0,a0
	lw	ra,108(sp)
	lw	s0,104(sp)
	xor	a4,s1,a4
	or	a4,a4,s5
	sltu	a4,zero,a4
	lw	s1,100(sp)
	lw	s2,96(sp)
	lw	s3,92(sp)
	lw	s5,84(sp)
	mul	a2,a1,s4
	lw	s6,80(sp)
	lw	s7,76(sp)
	lw	s8,72(sp)
	lw	s9,68(sp)
	lw	s10,64(sp)
	lw	s11,60(sp)
	srli	a3,s4,16
	lui	t0,16
	addi	t0,t0,-1
	and	a3,a3,t0
	srli	t0,a0,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	mul	a3,a3,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s4,t0
	srli	t1,a0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	srli	t0,t0,16
	add	a3,a3,t0
	srli	t0,s4,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a0,t1
	mul	t0,t0,t1
	srli	t0,t0,16
	add	a3,a3,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s4,t0
	srli	t1,a0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	mul	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	srli	t1,s4,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a0,t2
	mul	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	add	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s4,t1
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a0,t2
	mul	t1,t1,t2
	srli	t1,t1,16
	add	t0,t0,t1
	srli	t0,t0,16
	add	a3,a3,t0
	add	a5,a5,a2
	mul	a0,s4,a0
	add	a5,a5,a3
	lw	s4,88(sp)
	addi	sp,sp,112
	and	a0,a0,a5
	addi	a0,a0,1
	sltu	a0,zero,a0
	or	a0,a0,a4
	jalr	zero,ra,0
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	bge	zero,a0,.L78
	lui	a5,%hi(in_m)
	lw	t4,%lo(in_m)(a5)
	lw	t3,%lo(in_m+4)(a5)
	addi	sp,sp,-32
	sw	s0,28(sp)
	sw	s1,24(sp)
	sw	s2,20(sp)
	sw	s3,16(sp)
	addi	s2,a0,0
	addi	s1,zero,0
	lui	s0,524288
.L73:
	addi	t1,zero,64
	addi	a2,zero,0
	addi	a3,zero,0
	addi	a4,zero,1
	addi	a5,zero,0
	jal	x0,.L72
.L82:
	addi	t1,t1,-1
	addi	a4,a7,0
	add	a5,a1,a6
	addi	a3,t6,0
	beq	t1,zero,.L81
.L72:
	xor	a6,t3,a5
	xor	a1,t4,a4
	slli	a7,a6,31
	srli	a1,a1,1
	add	a1,a7,a1
	and	a7,t4,a4
	slli	a0,a3,31
	and	t0,t3,a5
	srli	t2,a2,1
	srli	t6,a3,1
	add	a7,a1,a7
	srli	a6,a6,1
	addi	t5,x0,1
	and	t5,a4,t5
	add	a2,a0,t2
	add	a6,a6,t0
	addi	a3,t6,0
	sltu	a1,a7,a1
	srli	t0,a5,1
	slli	a0,a5,31
	srli	t2,a4,1
	add	t6,t6,s0
	bne	t5,zero,.L82
	addi	t1,t1,-1
	add	a4,a0,t2
	addi	a5,t0,0
	bne	t1,zero,.L72
.L81:
	sw	a4,0(sp)
	sw	a5,4(sp)
	sw	a2,8(sp)
	sw	a3,12(sp)
	lw	a4,0(sp)
	lw	a5,4(sp)
	lw	a4,8(sp)
	lw	a5,12(sp)
	lw	a4,8(sp)
	lw	a5,12(sp)
	lw	a4,8(sp)
	lw	a5,12(sp)
	lw	a4,8(sp)
	lw	a5,12(sp)
	lw	a4,0(sp)
	lw	a5,4(sp)
	addi	s1,s1,1
	bne	s2,s1,.L73
	lw	s0,28(sp)
	lw	s1,24(sp)
	lw	s2,20(sp)
	lw	s3,16(sp)
	addi	sp,sp,32
	jalr	zero,ra,0
.L78:
	jalr	zero,ra,0
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.globl	xbinGCD
	.type	xbinGCD, @function
xbinGCD:
	addi	sp,sp,-48
	sw	s0,44(sp)
	sw	s1,40(sp)
	sw	s2,36(sp)
	addi	s0,a1,0
	or	a1,a0,a1
	addi	s2,a4,0
	addi	s1,a5,0
	bne	a1,zero,.+8
	jal	x0,.L89
	sw	s3,32(sp)
	sw	s4,28(sp)
	addi	s3,a2,0
	sw	s5,24(sp)
	sw	s6,20(sp)
	sw	s7,16(sp)
	sw	s8,12(sp)
	addi	s4,a3,0
	addi	a4,a0,0
	addi	a2,s0,0
	addi	t1,zero,0
	addi	t2,zero,0
	addi	a6,zero,1
	addi	a7,zero,0
	jal	x0,.L88
.L93:
	or	t3,t4,t0
	add	a6,s8,s7
	addi	a7,s6,0
	beq	t3,zero,.L92
.L88:
	xor	t5,s4,a7
	xor	t3,s3,a6
	slli	a5,t5,31
	srli	t3,t3,1
	sub	t0,x0,a5
	sub	t3,t3,t0
	slli	a1,t2,31
	slli	a5,a2,31
	srli	t4,a4,1
	srli	t0,a2,1
	srli	a2,t1,1
	add	t1,a1,a2
	add	t4,a5,t4
	or	t6,s3,a6
	xor	t6,t6,t3
	srli	a5,t2,1
	or	a4,s4,a7
	xor	a4,a4,t5
	addi	t2,x0,0
	or	t2,x0,t2
	add	t2,a5,t2
	add	t6,t3,t6
	srli	t5,t5,1
	add	a5,a0,t1
	addi	a3,x0,1
	and	a3,a6,a3
	add	t5,t5,a4
	srli	s6,a7,1
	slli	s8,a7,31
	srli	s7,a6,1
	sltu	s5,a5,t1
	add	a1,s0,t2
	sltu	t3,t6,t3
	addi	a4,x0,0
	or	a4,x0,a4
	add	a4,t4,a4
	addi	a2,x0,0
	or	a2,x0,a2
	add	a2,t0,a2
	beq	a3,zero,.+8
	jal	x0,.+8
	jal	x0,.L93
	add	a7,t3,t5
	or	t3,t4,t0
	addi	a6,t6,0
	addi	t1,a5,0
	add	t2,s5,a1
	bne	t3,zero,.L88
.L92:
	lw	s3,32(sp)
	lw	s4,28(sp)
	lw	s5,24(sp)
	lw	s6,20(sp)
	lw	s7,16(sp)
	lw	s8,12(sp)
.L84:
	sw	a6,0(s2)
	sw	a7,4(s2)
	lw	s0,44(sp)
	sw	t1,0(s1)
	sw	t2,4(s1)
	lw	s2,36(sp)
	lw	s1,40(sp)
	addi	sp,sp,48
	jalr	zero,ra,0
.L89:
	addi	t1,a0,0
	addi	t2,s0,0
	addi	a6,zero,1
	addi	a7,zero,0
	jal	x0,.L84
	.size	xbinGCD, .-xbinGCD
	.align	2
	.globl	warm_caches
	.type	warm_caches, @function
warm_caches:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_4:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_4)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_5:
	auipc	ra,%pcrel_hi(benchmark_body.constprop.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_5)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
	.size	benchmark, .-benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lui	a3,%hi(.LC0)
	lui	a4,%hi(.LC1)
	lui	a5,%hi(.LC2)
	lw	t1,%lo(.LC0)(a3)
	lw	t2,%lo(.LC0+4)(a3)
	lw	a6,%lo(.LC1)(a4)
	lw	a7,%lo(.LC1+4)(a4)
	lw	a2,%lo(.LC2)(a5)
	lw	a3,%lo(.LC2+4)(a5)
	addi	sp,sp,-32
	lui	a1,%hi(in_m)
	lui	a4,%hi(in_b)
	lui	a5,%hi(in_a)
	addi	a0,zero,1
	sw	ra,28(sp)
	sw	t1,%lo(in_m)(a1)
	sw	t2,%lo(in_m+4)(a1)
	sw	a6,%lo(in_b)(a4)
	sw	a7,%lo(in_b+4)(a4)
	sw	a2,%lo(in_a)(a5)
	sw	a3,%lo(in_a+4)(a5)
.Lpcrel_6:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_6)
.Lpcrel_7:
	auipc	ra,%pcrel_hi(benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_7)
	sw	a0,12(sp)
	lw	a0,12(sp)
	lw	ra,28(sp)
	sltu	a0,zero,a0
	addi	sp,sp,32
	jalr	zero,ra,0
	.size	main, .-main
	.text
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	lui	a3,%hi(.LC0)
	lui	a4,%hi(.LC1)
	lui	a5,%hi(.LC2)
	lw	t1,%lo(.LC0)(a3)
	lw	t2,%lo(.LC0+4)(a3)
	lw	a0,%lo(.LC1)(a4)
	lw	a1,%lo(.LC1+4)(a4)
	lw	a2,%lo(.LC2)(a5)
	lw	a3,%lo(.LC2+4)(a5)
	lui	a6,%hi(in_m)
	lui	a4,%hi(in_b)
	lui	a5,%hi(in_a)
	sw	t1,%lo(in_m)(a6)
	sw	t2,%lo(in_m+4)(a6)
	sw	a0,%lo(in_b)(a4)
	sw	a1,%lo(in_b+4)(a4)
	sw	a2,%lo(in_a)(a5)
	sw	a3,%lo(in_a+4)(a5)
	jalr	zero,ra,0
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	addi	t0,x0,1
	sltu	a0,a0,t0
	jalr	zero,ra,0
	.size	verify_benchmark, .-verify_benchmark
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	958986399
	.word	-85440217
	.align	3
.LC1:
	.word	-1187838605
	.word	343109103
	.align	3
.LC2:
	.word	-2027716625
	.word	88684321
	.section	.sbss,"aw",@nobits
	.align	3
	.type	in_m, @object
	.size	in_m, 8
in_m:
	.zero	8
	.type	in_b, @object
	.size	in_b, 8
in_b:
	.zero	8
	.type	in_a, @object
	.size	in_a, 8
in_a:
	.zero	8
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits


    .text
    .align 2
__mul:
	add	a2,a0,x0
	addi	a0,x0,0
.Mul_loop:
	addi	a3,x0,1
	and	a3,a3,a1
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
	bne	a2,zero,.+8
	jal	x0,__riscv_div_lib_L5
	addi	a3,zero,1
	bltu	a2,a1,.+8
	jal	x0,__riscv_div_lib_L2
__riscv_div_lib_L1:
	bge	zero,a2,__riscv_div_lib_L2
	slli	a2,a2,1
	slli	a3,a3,1
	bltu	a2,a1,__riscv_div_lib_L1
__riscv_div_lib_L2:
	addi	a0,zero,0
__riscv_div_lib_L3:
	bltu	a1,a2,__riscv_div_lib_L4
	sub	a1,a1,a2
	or	a0,a0,a3
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
	bge	a0,zero,__riscv_div_lib_L30
__riscv_div_lib_L32:
	sub	a0,zero,a0
.Lpcrel_div4:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div4)
	sub	a0,zero,a1
	jalr	zero,t0,0

# end of subrountine