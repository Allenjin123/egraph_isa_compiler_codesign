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
.Lpcrel_callmul_401:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_401)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a0,t1
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
.Lpcrel_callmul_402:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_402)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t0,x0,16
	srl	t1,t1,t0
	addi	t0,x0,16
	srl	t0,a0,t0
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
.Lpcrel_callmul_403:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_403)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a0,t2
	addi	t3,x0,16
	srl	t3,a2,t3
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
.Lpcrel_callmul_404:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_404)
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
	addi	t0,x0,16
	srl	t1,t1,t0
	addi	t0,x0,16
	srl	t0,a0,t0
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
.Lpcrel_callmul_405:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_405)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a0,t2
	addi	t3,x0,16
	srl	t3,a2,t3
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
.Lpcrel_callmul_406:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_406)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t3,x0,16
	srl	t2,t2,t3
	addi	t3,x0,16
	srl	t3,a0,t3
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	addi	t4,x0,16
	srl	t4,a2,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_407:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_407)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
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
.Lpcrel_callmul_408:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_408)
	add	a7, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a6
	sub	t1,t1,t0
	bltu	t1,a6,.+12
	addi	a6,x0,0
	jal	x0,.+8
	addi	a6,x0,1
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a1,t4
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a2,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t4, x0
	add	a1, t0, x0
.Lpcrel_callmul_409:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_409)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t0,x0,16
	srl	t4,t4,t0
	addi	t0,x0,16
	srl	t0,a1,t0
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
.Lpcrel_callmul_410:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_410)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a1,t2
	addi	t3,x0,16
	srl	t3,a2,t3
	lui	t5,16
	addi	t5,t5,-1
	and	t3,t3,t5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_411:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_411)
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
	sub	t4,t4,t0
	addi	t0,x0,16
	srl	t4,t4,t0
	addi	t0,x0,16
	srl	t0,a1,t0
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
.Lpcrel_callmul_412:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_412)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a1,t2
	addi	t3,x0,16
	srl	t3,a2,t3
	lui	t5,16
	addi	t5,t5,-1
	and	t3,t3,t5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_413:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_413)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t3,x0,16
	srl	t2,t2,t3
	addi	t3,x0,16
	srl	t3,a1,t3
	lui	t5,16
	addi	t5,t5,-1
	and	t3,t3,t5
	addi	t5,x0,16
	srl	t5,a2,t5
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
.Lpcrel_callmul_414:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_414)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t3,x0,t3
	sub	t2,t2,t3
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	t4,t4,t0
	sub	t0,x0,a7
	sub	t1,t1,t0
	sw	t1,4(a5)
	bltu	t1,a7,.+12
	addi	a7,x0,0
	jal	x0,.+8
	addi	a7,x0,1
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a0,t3
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t0, x0
.Lpcrel_callmul_415:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_415)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t0,x0,16
	srl	t3,t3,t0
	addi	t0,x0,16
	srl	t0,a0,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a3,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_416:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_416)
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
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a0,t1
	addi	t2,x0,16
	srl	t2,a3,t2
	lui	t5,16
	addi	t5,t5,-1
	and	t2,t2,t5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_417:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_417)
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
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	t3,t3,t0
	addi	t0,x0,16
	srl	t3,t3,t0
	addi	t0,x0,16
	srl	t0,a0,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a3,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_418:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_418)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t1,x0,16
	srl	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a0,t1
	addi	t2,x0,16
	srl	t2,a3,t2
	lui	t5,16
	addi	t5,t5,-1
	and	t2,t2,t5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_419:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_419)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t1,t1,t2
	addi	t2,x0,16
	srl	t2,a0,t2
	lui	t5,16
	addi	t5,t5,-1
	and	t2,t2,t5
	addi	t5,x0,16
	srl	t5,a3,t5
	lui	t6,16
	addi	t6,t6,-1
	and	t5,t5,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t5, x0
.Lpcrel_callmul_420:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_420)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	t3,t3,t0
	sub	t0,x0,a6
	sub	a6,t4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a3, x0
.Lpcrel_callmul_421:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_421)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a7
	sub	a7,t3,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a1,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a3,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_422:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_422)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t0,t0,t2
	addi	t2,x0,16
	srl	t2,a1,t2
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a3,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_423:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_423)
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
	addi	t4,x0,16
	srl	t4,a3,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_424:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_424)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	sub	t3,x0,t3
	sub	t2,t2,t3
	sub	t2,x0,t2
	sub	t0,t0,t2
	addi	t2,x0,16
	srl	t0,t0,t2
	addi	t2,x0,16
	srl	t2,a1,t2
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a3,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_425:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_425)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t3,x0,16
	srl	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a1,t3
	addi	t4,x0,16
	srl	t4,a3,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_426:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_426)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t4,x0,16
	srl	t3,t3,t4
	addi	t4,x0,16
	srl	t4,a1,t4
	lui	a1,16
	addi	a1,a1,-1
	and	a1,t4,a1
	addi	t4,x0,16
	srl	t4,a3,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t4, x0
.Lpcrel_callmul_427:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_427)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a1,x0,a1
	sub	a1,t3,a1
	sub	a1,x0,a1
	sub	a1,t2,a1
	sub	a1,x0,a1
	sub	a1,t0,a1
	sub	t0,x0,t1
	sub	a6,a6,t0
	sub	t0,x0,a6
	sub	a7,a7,t0
	bltu	a6,t1,.+12
	addi	t1,x0,0
	jal	x0,.+8
	addi	t1,x0,1
	bltu	a7,a6,.+12
	addi	a6,x0,0
	jal	x0,.+8
	addi	a6,x0,1
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, a2, x0
.Lpcrel_callmul_428:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_428)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	t0,x0,t1
	sub	t1,a1,t0
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
	addi	a7,x0,31
	srl	a7,a0,a7
	addi	a6,x0,1
	sll	a6,a1,a6
	sub	t1,x0,a7
	sub	a6,a6,t1
	addi	t1,x0,31
	sra	t1,a1,t1
	addi	a7,x0,1
	sll	a7,a3,a7
	addi	a1,x0,31
	srl	a1,a3,a1
	addi	t2,x0,1
	sll	a0,a0,t2
	addi	a3,x0,31
	srl	a3,a2,a3
	and	t2,a1,a0
	sub	t2,t2,a0
	sub	a0,a1,t2
	sub	t2,x0,a3
	sub	a7,a7,t2
	and	t4,t1,a6
	sub	t4,t4,a6
	sub	t4,t1,t4
	addi	a1,a6,0
	addi	t3,t3,1
	addi	t2,x0,1
	sll	a2,a2,t2
	and	t2,t1,a0
	sub	t2,t2,a0
	sub	t1,t1,t2
	addi	a3,a7,0
	bltu	t4,a5,.L7
	sub	t6,a0,s0
	addi	t5,a2,1
	bltu	a0,t6,.+12
	addi	a4,x0,0
	jal	x0,.+8
	addi	a4,x0,1
	bltu	t5,a2,.+12
	addi	t2,x0,0
	jal	x0,.+8
	addi	t2,x0,1
	sub	a6,a6,a5
	bne	a5,t4,.L10
	bltu	t1,s0,.L7
.L10:
	addi	a0,t6,0
	sub	a1,a6,a4
	addi	a2,t5,0
	sub	a3,x0,t2
	sub	a3,a7,a3
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
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a2, x0
.Lpcrel_callmul_429:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_429)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a0,t3
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a2,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t0, x0
.Lpcrel_callmul_430:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_430)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t0,x0,16
	srl	t3,t3,t0
	addi	t0,x0,16
	srl	t0,a0,t0
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
.Lpcrel_callmul_431:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_431)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a0,t2
	addi	t4,x0,16
	srl	t4,a2,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t4, x0
.Lpcrel_callmul_432:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_432)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t4,16
	addi	t4,t4,-1
	and	t2,t2,t4
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	t3,t3,t0
	addi	t0,x0,16
	srl	t3,t3,t0
	addi	t0,x0,16
	srl	t0,a0,t0
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
.Lpcrel_callmul_433:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_433)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a0,t2
	addi	t4,x0,16
	srl	t4,a2,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t4, x0
.Lpcrel_callmul_434:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_434)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t4,x0,16
	srl	t2,t2,t4
	addi	t4,x0,16
	srl	t4,a0,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	t5,x0,16
	srl	t5,a2,t5
	lui	t6,16
	addi	t6,t6,-1
	and	t5,t5,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t4, x0
	add	a1, t5, x0
.Lpcrel_callmul_435:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_435)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t4,x0,t4
	sub	t2,t2,t4
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	t3,t3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, a3, x0
.Lpcrel_callmul_436:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_436)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,t1
	sub	t3,t3,t0
	bltu	t3,t1,.+12
	addi	t1,x0,0
	jal	x0,.+8
	addi	t1,x0,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, a2, x0
.Lpcrel_callmul_437:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_437)
	add	t5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,t4
	sub	t3,t3,t0
	bltu	t3,t4,.+12
	addi	t6,x0,0
	jal	x0,.+8
	addi	t6,x0,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a7, x0
	add	a1, t5, x0
.Lpcrel_callmul_438:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_438)
	add	a7, a0, x0
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
	add	a0, t3, x0
	add	a1, a6, x0
.Lpcrel_callmul_439:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_439)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	sw	s4,8(sp)
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
.Lpcrel_callmul_440:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_440)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t0,t0,t2
	addi	t2,x0,16
	srl	t2,a1,t2
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a2,s2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, s2, x0
.Lpcrel_callmul_441:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_441)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a1,s2
	addi	s3,x0,16
	srl	s3,a2,s3
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s2, x0
	add	a1, s3, x0
.Lpcrel_callmul_442:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_442)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	sub	s2,x0,s2
	sub	t2,t2,s2
	sub	t2,x0,t2
	sub	t0,t0,t2
	addi	t2,x0,16
	srl	t0,t0,t2
	addi	t2,x0,16
	srl	t2,a1,t2
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a2,s2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, s2, x0
.Lpcrel_callmul_443:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_443)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s2,x0,16
	srl	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a1,s2
	addi	s3,x0,16
	srl	s3,a2,s3
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s2, x0
	add	a1, s3, x0
.Lpcrel_callmul_444:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_444)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s3,x0,16
	srl	s2,s2,s3
	addi	s3,x0,16
	srl	s3,a1,s3
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	addi	s4,x0,16
	srl	s4,a2,s4
	lui	a2,16
	addi	a2,a2,-1
	and	a2,s4,a2
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, s3, x0
	add	a1, a2, x0
.Lpcrel_callmul_445:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_445)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a2,x0,a2
	sub	a2,s2,a2
	sub	a2,x0,a2
	sub	a2,t2,a2
	sub	a2,x0,a2
	sub	a2,t0,a2
	lw	s2,0(sp)
	lw	s3,4(sp)
	lw	s4,8(sp)
	addi	sp,sp,16
	sub	t0,x0,a7
	sub	a7,t4,t0
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	sw	s4,8(sp)
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a6,t4
	lui	t0,16
	addi	t0,t0,-1
	and	t0,t5,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t4, x0
	add	a1, t0, x0
.Lpcrel_callmul_446:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_446)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t0,x0,16
	srl	t4,t4,t0
	addi	t0,x0,16
	srl	t0,a6,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,t5,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_447:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_447)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a6,t2
	addi	s2,x0,16
	srl	s2,t5,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, s2, x0
.Lpcrel_callmul_448:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_448)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	t4,t4,t0
	addi	t0,x0,16
	srl	t4,t4,t0
	addi	t0,x0,16
	srl	t0,a6,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,t5,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_449:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_449)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a6,t2
	addi	s2,x0,16
	srl	s2,t5,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, s2, x0
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
	addi	s2,x0,16
	srl	t2,t2,s2
	addi	s2,x0,16
	srl	s2,a6,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	addi	s3,x0,16
	srl	s3,t5,s3
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s2, x0
	add	a1, s3, x0
.Lpcrel_callmul_451:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_451)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s2,x0,s2
	sub	t2,t2,s2
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	t4,t4,t0
	lw	s2,0(sp)
	lw	s3,4(sp)
	lw	s4,8(sp)
	addi	sp,sp,16
	sub	t0,x0,a7
	sub	a7,t4,t0
	sub	t4,x0,t1
	sub	t4,a2,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a3, x0
.Lpcrel_callmul_452:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_452)
	add	t1, a0, x0
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
	add	a0, a6, x0
	add	a1, t5, x0
.Lpcrel_callmul_453:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_453)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,t4
	sub	t1,t1,t0
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a0,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a3,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_454:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_454)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t0,t0,t2
	addi	t2,x0,16
	srl	t2,a0,t2
	lui	a2,16
	addi	a2,a2,-1
	and	t2,t2,a2
	lui	a2,16
	addi	a2,a2,-1
	and	a2,a3,a2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, a2, x0
.Lpcrel_callmul_455:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_455)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	a2,16
	addi	a2,a2,-1
	and	t2,t2,a2
	lui	a2,16
	addi	a2,a2,-1
	and	a2,a0,a2
	addi	s2,x0,16
	srl	s2,a3,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, s2, x0
.Lpcrel_callmul_456:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_456)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	s2,16
	addi	s2,s2,-1
	and	a2,a2,s2
	sub	a2,x0,a2
	sub	t2,t2,a2
	sub	t2,x0,t2
	sub	t0,t0,t2
	addi	t2,x0,16
	srl	t0,t0,t2
	addi	t2,x0,16
	srl	t2,a0,t2
	lui	a2,16
	addi	a2,a2,-1
	and	t2,t2,a2
	lui	a2,16
	addi	a2,a2,-1
	and	a2,a3,a2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, a2, x0
.Lpcrel_callmul_457:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_457)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	a2,x0,16
	srl	t2,t2,a2
	lui	a2,16
	addi	a2,a2,-1
	and	a2,a0,a2
	addi	s2,x0,16
	srl	s2,a3,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, s2, x0
.Lpcrel_callmul_458:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_458)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	s2,x0,16
	srl	a2,a2,s2
	addi	s2,x0,16
	srl	s2,a0,s2
	lui	a0,16
	addi	a0,a0,-1
	and	a0,s2,a0
	addi	s2,x0,16
	srl	s2,a3,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, s2, x0
.Lpcrel_callmul_459:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_459)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a0,x0,a0
	sub	a0,a2,a0
	sub	a0,x0,a0
	sub	a0,t2,a0
	sub	a0,x0,a0
	sub	a0,t0,a0
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a7, x0
	add	a1, a4, x0
.Lpcrel_callmul_460:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_460)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	t0,x0,t6
	sub	a0,a0,t0
	bltu	t1,t4,.+12
	addi	t6,x0,0
	jal	x0,.+8
	addi	t6,x0,1
	sub	t0,x0,t1
	sub	a0,a0,t0
	bltu	a0,t1,.+12
	addi	t1,x0,0
	jal	x0,.+8
	addi	t1,x0,1
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	sw	s4,8(sp)
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a6,t4
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t4, x0
	add	a1, t0, x0
.Lpcrel_callmul_461:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_461)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t0,x0,16
	srl	t4,t4,t0
	addi	t0,x0,16
	srl	t0,a6,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_462:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_462)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a6,t2
	addi	s2,x0,16
	srl	s2,a4,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, s2, x0
.Lpcrel_callmul_463:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_463)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	t4,t4,t0
	addi	t0,x0,16
	srl	t4,t4,t0
	addi	t0,x0,16
	srl	t0,a6,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
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
	addi	t2,x0,16
	srl	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a6,t2
	addi	s2,x0,16
	srl	s2,a4,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, s2, x0
.Lpcrel_callmul_465:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_465)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s2,x0,16
	srl	t2,t2,s2
	addi	s2,x0,16
	srl	s2,a6,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	addi	s3,x0,16
	srl	s3,a4,s3
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s2, x0
	add	a1, s3, x0
.Lpcrel_callmul_466:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_466)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s2,x0,s2
	sub	t2,t2,s2
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	t4,t4,t0
	lw	s2,0(sp)
	lw	s3,4(sp)
	lw	s4,8(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	sw	s4,8(sp)
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a1,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a3,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_467:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_467)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t0,t0,t2
	addi	t2,x0,16
	srl	t2,a1,t2
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a3,s2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, s2, x0
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
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a1,s2
	addi	s3,x0,16
	srl	s3,a3,s3
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s2, x0
	add	a1, s3, x0
.Lpcrel_callmul_469:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_469)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	sub	s2,x0,s2
	sub	t2,t2,s2
	sub	t2,x0,t2
	sub	t0,t0,t2
	addi	t2,x0,16
	srl	t0,t0,t2
	addi	t2,x0,16
	srl	t2,a1,t2
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a3,s2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, s2, x0
.Lpcrel_callmul_470:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_470)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s2,x0,16
	srl	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a1,s2
	addi	s3,x0,16
	srl	s3,a3,s3
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s2, x0
	add	a1, s3, x0
.Lpcrel_callmul_471:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_471)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s3,x0,16
	srl	s2,s2,s3
	addi	s3,x0,16
	srl	s3,a1,s3
	lui	a1,16
	addi	a1,a1,-1
	and	a1,s3,a1
	addi	s3,x0,16
	srl	s3,a3,s3
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, s3, x0
.Lpcrel_callmul_472:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_472)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a1,x0,a1
	sub	a1,s2,a1
	sub	a1,x0,a1
	sub	a1,t2,a1
	sub	a1,x0,a1
	sub	a1,t0,a1
	lw	s2,0(sp)
	lw	s3,4(sp)
	lw	s4,8(sp)
	addi	sp,sp,16
	sub	a3,x0,a2
	sub	a3,t4,a3
	bltu	a3,a2,.+12
	addi	a2,x0,0
	jal	x0,.+8
	addi	a2,x0,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a6, x0
	add	a1, a5, x0
.Lpcrel_callmul_473:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_473)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,t6
	sub	t6,a1,t0
	sub	t0,x0,t1
	sub	t1,t6,t0
	sub	t6,x0,t4
	sub	t6,a3,t6
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	lui	a1,16
	addi	a1,a1,-1
	and	a1,a7,a1
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a4,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t0, x0
.Lpcrel_callmul_474:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_474)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	t0,x0,16
	srl	a1,a1,t0
	addi	t0,x0,16
	srl	t0,a7,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_475:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_475)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a7,t2
	addi	a3,x0,16
	srl	a3,a4,a3
	lui	s2,16
	addi	s2,s2,-1
	and	a3,a3,s2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, a3, x0
.Lpcrel_callmul_476:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_476)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	a3,16
	addi	a3,a3,-1
	and	t2,t2,a3
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	a1,a1,t0
	addi	t0,x0,16
	srl	a1,a1,t0
	addi	t0,x0,16
	srl	t0,a7,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_477:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_477)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a7,t2
	addi	a3,x0,16
	srl	a3,a4,a3
	lui	s2,16
	addi	s2,s2,-1
	and	a3,a3,s2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, a3, x0
.Lpcrel_callmul_478:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_478)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	a3,x0,16
	srl	t2,t2,a3
	addi	a3,x0,16
	srl	a3,a7,a3
	lui	s2,16
	addi	s2,s2,-1
	and	a3,a3,s2
	addi	s2,x0,16
	srl	s2,a4,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, s2, x0
.Lpcrel_callmul_479:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_479)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a3,x0,a3
	sub	t2,t2,a3
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	a1,a1,t0
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	bltu	t6,t4,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a7, x0
	add	a1, a5, x0
.Lpcrel_callmul_480:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_480)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a2
	sub	a2,a1,t0
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a7,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a5,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_481:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_481)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t0,t0,t2
	addi	t2,x0,16
	srl	t2,a7,t2
	lui	a1,16
	addi	a1,a1,-1
	and	t2,t2,a1
	lui	a1,16
	addi	a1,a1,-1
	and	a1,a5,a1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
.Lpcrel_callmul_482:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_482)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	a1,16
	addi	a1,a1,-1
	and	t2,t2,a1
	lui	a1,16
	addi	a1,a1,-1
	and	a1,a7,a1
	addi	s2,x0,16
	srl	s2,a5,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, s2, x0
.Lpcrel_callmul_483:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_483)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	s2,16
	addi	s2,s2,-1
	and	a1,a1,s2
	sub	a1,x0,a1
	sub	t2,t2,a1
	sub	t2,x0,t2
	sub	t0,t0,t2
	addi	t2,x0,16
	srl	t0,t0,t2
	addi	t2,x0,16
	srl	t2,a7,t2
	lui	a1,16
	addi	a1,a1,-1
	and	t2,t2,a1
	lui	a1,16
	addi	a1,a1,-1
	and	a1,a5,a1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
.Lpcrel_callmul_484:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_484)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	a1,x0,16
	srl	t2,t2,a1
	lui	a1,16
	addi	a1,a1,-1
	and	a1,a7,a1
	addi	s2,x0,16
	srl	s2,a5,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, s2, x0
.Lpcrel_callmul_485:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_485)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	s2,x0,16
	srl	a1,a1,s2
	addi	s2,x0,16
	srl	s2,a7,s2
	lui	a7,16
	addi	a7,a7,-1
	and	a7,s2,a7
	addi	s2,x0,16
	srl	s2,a5,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a7, x0
	add	a1, s2, x0
.Lpcrel_callmul_486:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_486)
	add	a7, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a7,x0,a7
	sub	a7,a1,a7
	sub	a7,x0,a7
	sub	a7,t2,a7
	sub	a7,x0,a7
	sub	a7,t0,a7
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	sub	a1,x0,t4
	sub	a1,a0,a1
	sub	t0,x0,a1
	sub	a2,a2,t0
	bltu	a1,t4,.+12
	addi	t4,x0,0
	jal	x0,.+8
	addi	t4,x0,1
	bltu	a2,a1,.+12
	addi	a1,x0,0
	jal	x0,.+8
	addi	a1,x0,1
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	sw	s4,8(sp)
	sw	s5,12(sp)
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a6,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a5,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_487:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_487)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t0,t0,t2
	addi	t2,x0,16
	srl	t2,a6,t2
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a5,s2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, s2, x0
.Lpcrel_callmul_488:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_488)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a6,s2
	addi	s3,x0,16
	srl	s3,a5,s3
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s2, x0
	add	a1, s3, x0
.Lpcrel_callmul_489:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_489)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	sub	s2,x0,s2
	sub	t2,t2,s2
	sub	t2,x0,t2
	sub	t0,t0,t2
	addi	t2,x0,16
	srl	t0,t0,t2
	addi	t2,x0,16
	srl	t2,a6,t2
	lui	s2,16
	addi	s2,s2,-1
	and	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a5,s2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, s2, x0
.Lpcrel_callmul_490:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_490)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s2,x0,16
	srl	t2,t2,s2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a6,s2
	addi	s3,x0,16
	srl	s3,a5,s3
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s2, x0
	add	a1, s3, x0
.Lpcrel_callmul_491:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_491)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s3,x0,16
	srl	s2,s2,s3
	addi	s3,x0,16
	srl	s3,a6,s3
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	addi	s4,x0,16
	srl	s4,a5,s4
	lui	s5,16
	addi	s5,s5,-1
	and	s4,s4,s5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, s4, x0
.Lpcrel_callmul_492:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_492)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s3,x0,s3
	sub	s2,s2,s3
	sub	s2,x0,s2
	sub	t2,t2,s2
	sub	t2,x0,t2
	sub	t0,t0,t2
	lw	s2,0(sp)
	lw	s3,4(sp)
	lw	s4,8(sp)
	lw	s5,12(sp)
	addi	sp,sp,16
	sub	t2,x0,a7
	sub	a7,t1,t2
	sub	t2,x0,t4
	sub	t4,a7,t2
	sub	t2,x0,a1
	sub	a1,t4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a6, x0
	add	a1, a4, x0
.Lpcrel_callmul_493:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_493)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,a3
	sub	a3,t0,t2
	sub	t0,x0,a2
	sub	a3,a3,t0
	bltu	a3,a2,.+12
	addi	a2,x0,0
	jal	x0,.+8
	addi	a2,x0,1
	sub	t0,x0,a2
	sub	a2,a1,t0
	addi	a7,a2,0
	addi	a1,a3,0
	sub	t4,x0,a6
	sub	t4,t5,t4
	bltu	t4,a6,.+12
	addi	a6,x0,0
	jal	x0,.+8
	addi	a6,x0,1
	sub	t0,x0,a6
	sub	a6,t3,t0
	sub	t0,x0,a6
	sub	a6,t6,t0
	bltu	a6,t3,.L22
	bne	t3,a6,.+8
	jal	x0,.L23
.L14:
	and	a2,t1,a7
	sub	a2,a2,a7
	sub	a2,t1,a2
	and	t0,t1,a7
	sub	a2,a2,t0
	and	a3,a0,a1
	sub	a3,a3,a1
	sub	a3,a0,a3
	and	t0,a0,a1
	sub	a3,a3,t0
	and	t0,a3,a2
	sub	t0,t0,a2
	sub	a3,a3,t0
	addi	t0,x0,1
	bltu	a3,t0,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	addi	a2,zero,1
	bltu	a6,t3,.L16
	bne	t3,a6,.+8
	jal	x0,.L24
	addi	a2,zero,0
.L16:
	and	a3,a3,a2
	addi	a2,zero,1
	bltu	a7,t1,.L18
	bne	t1,a7,.+8
	jal	x0,.L25
	addi	a2,zero,0
.L18:
	addi	a0,zero,1
	bltu	a7,a5,.L21
	bne	a5,a7,.+8
	jal	x0,.L26
.L20:
	and	t0,a2,a0
	sub	t0,t0,a0
	sub	a2,a2,t0
	and	t0,a3,a2
	sub	t0,t0,a2
	sub	a3,a3,t0
	addi	a2,x0,31
	sll	a2,a3,a2
	addi	a0,x0,31
	sra	a0,a2,a0
	and	a0,a0,a4
	addi	a4,x0,31
	sll	a4,a3,a4
	addi	a3,x0,31
	sra	a3,a4,a3
	sub	a0,a1,a0
	and	a3,a3,a5
	bltu	a1,a0,.+12
	addi	a1,x0,0
	jal	x0,.+8
	addi	a1,x0,1
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
	bltu	a1,a3,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	sub	a7,x0,a3
	sub	a7,a2,a7
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
	lui	a3,16
	addi	a3,a3,-1
	and	a3,s9,a3
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s8,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, t0, x0
.Lpcrel_callmul_494:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_494)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	t0,x0,16
	srl	a3,a3,t0
	addi	t0,x0,16
	srl	t0,s9,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s8,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_495:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_495)
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
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s9,t1
	addi	t2,x0,16
	srl	t2,s8,t2
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
.Lpcrel_callmul_496:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_496)
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
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a3,a3,t0
	addi	t0,x0,16
	srl	a3,a3,t0
	addi	t0,x0,16
	srl	t0,s9,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s8,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_497:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_497)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t1,x0,16
	srl	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s9,t1
	addi	t2,x0,16
	srl	t2,s8,t2
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
.Lpcrel_callmul_498:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_498)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t1,t1,t2
	addi	t2,x0,16
	srl	t2,s9,t2
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	addi	t3,x0,16
	srl	t3,s8,t3
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
.Lpcrel_callmul_499:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_499)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a3,a3,t0
	sw	s0,104(sp)
	sw	s4,88(sp)
	lw	s0,%lo(in_m+4)(a5)
	lw	s4,%lo(in_m)(a5)
	sw	s3,92(sp)
	sw	s6,80(sp)
	sw	s7,76(sp)
	sw	ra,108(sp)
	sw	s1,100(sp)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s11, x0
	add	a1, s8, x0
.Lpcrel_callmul_500:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_500)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sw	s2,96(sp)
	sw	s5,84(sp)
	addi	s7,zero,423
	addi	s3,zero,64
	lui	s6,524288
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s9, x0
	add	a1, s10, x0
.Lpcrel_callmul_501:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_501)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a5
	sub	a3,a3,t0
	bltu	a3,a5,.+12
	addi	a5,x0,0
	jal	x0,.+8
	addi	a5,x0,1
	lui	a2,16
	addi	a2,a2,-1
	and	a2,s11,a2
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s8,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, t0, x0
.Lpcrel_callmul_502:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_502)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	t0,x0,16
	srl	a2,a2,t0
	addi	t0,x0,16
	srl	t0,s11,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s8,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_503:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_503)
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
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s11,t1
	addi	t2,x0,16
	srl	t2,s8,t2
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
.Lpcrel_callmul_504:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_504)
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
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a2,a2,t0
	addi	t0,x0,16
	srl	a2,a2,t0
	addi	t0,x0,16
	srl	t0,s11,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s8,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_505:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_505)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t1,x0,16
	srl	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s11,t1
	addi	t2,x0,16
	srl	t2,s8,t2
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
.Lpcrel_callmul_506:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_506)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t1,t1,t2
	addi	t2,x0,16
	srl	t2,s11,t2
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	addi	t3,x0,16
	srl	t3,s8,t3
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
.Lpcrel_callmul_507:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_507)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a2,a2,t0
	sub	t1,x0,a4
	sub	t1,a3,t1
	bltu	t1,a4,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	sw	t1,24(sp)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s11, x0
	add	a1, s10, x0
.Lpcrel_callmul_508:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_508)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a5
	sub	a5,a2,t0
	lui	a2,16
	addi	a2,a2,-1
	and	a2,s11,a2
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s10,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, t0, x0
.Lpcrel_callmul_509:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_509)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	t0,x0,16
	srl	a2,a2,t0
	addi	t0,x0,16
	srl	t0,s11,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s10,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_510:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_510)
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
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s11,t1
	addi	t2,x0,16
	srl	t2,s10,t2
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
.Lpcrel_callmul_511:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_511)
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
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a2,a2,t0
	addi	t0,x0,16
	srl	a2,a2,t0
	addi	t0,x0,16
	srl	t0,s11,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s10,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_512:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_512)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t1,x0,16
	srl	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s11,t1
	addi	t2,x0,16
	srl	t2,s10,t2
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
.Lpcrel_callmul_513:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_513)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t1,t1,t2
	addi	t2,x0,16
	srl	t2,s11,t2
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	addi	t3,x0,16
	srl	t3,s10,t3
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
.Lpcrel_callmul_514:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_514)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a2,a2,t0
	sub	t0,x0,a5
	sub	a4,a4,t0
	bltu	a4,a5,.+12
	addi	a5,x0,0
	jal	x0,.+8
	addi	a5,x0,1
	sub	t0,x0,a5
	sub	a5,a2,t0
	lui	a2,16
	addi	a2,a2,-1
	and	a2,s9,a2
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s10,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, t0, x0
.Lpcrel_callmul_515:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_515)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	t0,x0,16
	srl	a2,a2,t0
	addi	t0,x0,16
	srl	t0,s9,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s10,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_516:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_516)
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
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s9,t1
	addi	t2,x0,16
	srl	t2,s10,t2
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
.Lpcrel_callmul_517:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_517)
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
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a2,a2,t0
	addi	t0,x0,16
	srl	a2,a2,t0
	addi	t0,x0,16
	srl	t0,s9,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s10,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_518:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_518)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t1,x0,16
	srl	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s9,t1
	addi	t2,x0,16
	srl	t2,s10,t2
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
.Lpcrel_callmul_519:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_519)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t1,t1,t2
	addi	t2,x0,16
	srl	t2,s9,t2
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	addi	t3,x0,16
	srl	t3,s10,t3
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
.Lpcrel_callmul_520:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_520)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a2,a2,t0
	sub	t0,x0,a3
	sub	a3,a2,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, s9, x0
	add	a1, s8, x0
.Lpcrel_callmul_521:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_521)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	t3,x0,a4
	sub	t3,a3,t3
	bltu	t3,a4,.+12
	addi	a4,x0,0
	jal	x0,.+8
	addi	a4,x0,1
	sub	t0,x0,a4
	sub	a5,a5,t0
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
	addi	a1,x0,31
	srl	a1,a4,a1
	addi	a0,x0,31
	sra	a0,a3,a0
	addi	a5,x0,1
	sll	a5,a3,a5
	addi	t0,x0,1
	sll	a4,a4,t0
	addi	a3,x0,31
	srl	a3,a6,a3
	sub	t0,x0,a1
	sub	a5,a5,t0
	and	t0,a3,a4
	sub	t0,t0,a4
	sub	a4,a3,t0
	addi	a1,x0,1
	sll	a1,a6,a1
	addi	a3,x0,31
	srl	a3,a2,a3
	sub	t0,x0,a3
	sub	a1,a1,t0
	and	t1,a0,a5
	sub	t1,t1,a5
	sub	t1,a0,t1
	addi	a3,a5,0
	addi	a7,a7,1
	addi	t0,x0,1
	sll	a2,a2,t0
	and	t0,a0,a4
	sub	t0,t0,a4
	sub	a0,a0,t0
	addi	a6,a1,0
	bltu	t1,s0,.L28
	sub	t4,a4,s4
	addi	t3,a2,1
	bltu	a4,t4,.+12
	addi	t6,x0,0
	jal	x0,.+8
	addi	t6,x0,1
	bltu	t3,a2,.+12
	addi	t5,x0,0
	jal	x0,.+8
	addi	t5,x0,1
	sub	a5,a5,s0
	bne	s0,t1,.L50
	bltu	a0,s4,.L28
.L50:
	addi	a4,t4,0
	sub	a3,a5,t6
	addi	a2,t3,0
	sub	a6,x0,t5
	sub	a6,a1,a6
.L28:
	bne	a7,s3,.L30
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, a4, x0
.Lpcrel_callmul_522:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_522)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	a7,zero,0
	lui	a5,16
	addi	a5,a5,-1
	and	a5,a4,a5
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, t0, x0
.Lpcrel_callmul_523:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_523)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t0,x0,16
	srl	a5,a5,t0
	addi	t0,x0,16
	srl	t0,a4,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a4,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_524:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_524)
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
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a4,t1
	addi	t2,x0,16
	srl	t2,a4,t2
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
.Lpcrel_callmul_525:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_525)
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
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a5,a5,t0
	addi	t0,x0,16
	srl	a5,a5,t0
	addi	t0,x0,16
	srl	t0,a4,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a4,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_526:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_526)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t1,x0,16
	srl	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a4,t1
	addi	t2,x0,16
	srl	t2,a4,t2
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
.Lpcrel_callmul_527:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_527)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t1,t1,t2
	addi	t2,x0,16
	srl	t2,a4,t2
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	addi	t3,x0,16
	srl	t3,a4,t3
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
.Lpcrel_callmul_528:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_528)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a5,a5,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a3,t1
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t0, x0
.Lpcrel_callmul_529:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_529)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t0,x0,16
	srl	t1,t1,t0
	addi	t0,x0,16
	srl	t0,a3,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_530:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_530)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a3,t2
	addi	t3,x0,16
	srl	t3,a4,t3
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
.Lpcrel_callmul_531:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_531)
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
	addi	t0,x0,16
	srl	t1,t1,t0
	addi	t0,x0,16
	srl	t0,a3,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_532:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_532)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a3,t2
	addi	t3,x0,16
	srl	t3,a4,t3
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
.Lpcrel_callmul_533:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_533)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t3,x0,16
	srl	t2,t2,t3
	addi	t3,x0,16
	srl	t3,a3,t3
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	addi	t4,x0,16
	srl	t4,a4,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_534:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_534)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t3,x0,t3
	sub	t2,t2,t3
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	t1,t1,t0
	sub	a6,x0,a5
	sub	a6,a2,a6
	bltu	a6,a5,.+12
	addi	a5,x0,0
	jal	x0,.+8
	addi	a5,x0,1
	sub	t0,x0,a2
	sub	a6,a6,t0
	bltu	a6,a2,.+12
	addi	a1,x0,0
	jal	x0,.+8
	addi	a1,x0,1
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, a3, x0
.Lpcrel_callmul_535:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_535)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a2,x0,a5
	sub	a2,t1,a2
	sub	a5,x0,a1
	sub	a5,t1,a5
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a3,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a3,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_536:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_536)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t1,x0,16
	srl	t0,t0,t1
	addi	t1,x0,16
	srl	t1,a3,t1
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a3,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_537:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_537)
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
	addi	t3,x0,16
	srl	t3,a3,t3
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
.Lpcrel_callmul_538:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_538)
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
	sub	t1,x0,t1
	sub	t0,t0,t1
	addi	t1,x0,16
	srl	t0,t0,t1
	addi	t1,x0,16
	srl	t1,a3,t1
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a3,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_539:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_539)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a3,t2
	addi	t3,x0,16
	srl	t3,a3,t3
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
.Lpcrel_callmul_540:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_540)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t3,x0,16
	srl	t2,t2,t3
	addi	t3,x0,16
	srl	t3,a3,t3
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	addi	t4,x0,16
	srl	t4,a3,t4
	lui	a3,16
	addi	a3,a3,-1
	and	a3,t4,a3
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, t3, x0
	add	a1, a3, x0
.Lpcrel_callmul_541:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_541)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a3,x0,a3
	sub	a3,t2,a3
	sub	a3,x0,a3
	sub	a3,t1,a3
	sub	a3,x0,a3
	sub	a3,t0,a3
	sub	a1,x0,a2
	sub	a1,a0,a1
	bltu	a1,a2,.+12
	addi	a2,x0,0
	jal	x0,.+8
	addi	a2,x0,1
	sub	t0,x0,a1
	sub	a5,a5,t0
	bltu	a5,a1,.+12
	addi	a1,x0,0
	jal	x0,.+8
	addi	a1,x0,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, a4, x0
.Lpcrel_callmul_542:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_542)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a2
	sub	a3,a3,t0
	sub	a2,x0,a1
	sub	a2,a3,a2
.L33:
	addi	a1,x0,31
	srl	a1,a5,a1
	addi	a0,x0,31
	sra	a0,a2,a0
	addi	a3,x0,1
	sll	a3,a2,a3
	addi	t0,x0,1
	sll	a5,a5,t0
	addi	a2,x0,31
	srl	a2,a6,a2
	sub	t0,x0,a1
	sub	a3,a3,t0
	and	t0,a2,a5
	sub	t0,t0,a5
	sub	a5,a2,t0
	addi	a1,x0,1
	sll	a1,a6,a1
	addi	a2,x0,31
	srl	a2,a4,a2
	sub	t0,x0,a2
	sub	a1,a1,t0
	and	t1,a0,a3
	sub	t1,t1,a3
	sub	t1,a0,t1
	addi	a2,a3,0
	addi	a7,a7,1
	addi	t0,x0,1
	sll	a4,a4,t0
	and	t0,a0,a5
	sub	t0,t0,a5
	sub	a0,a0,t0
	addi	a6,a1,0
	bltu	t1,s0,.L31
	sub	t4,a5,s4
	addi	t3,a4,1
	bltu	a5,t4,.+12
	addi	t6,x0,0
	jal	x0,.+8
	addi	t6,x0,1
	bltu	t3,a4,.+12
	addi	t5,x0,0
	jal	x0,.+8
	addi	t5,x0,1
	sub	a3,a3,s0
	bne	s0,t1,.L51
	bltu	a0,s4,.L31
.L51:
	addi	a5,t4,0
	sub	a2,a3,t6
	addi	a4,t3,0
	sub	a6,x0,t5
	sub	a6,a1,a6
.L31:
	bne	a7,s3,.L33
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, a5, x0
.Lpcrel_callmul_543:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_543)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	s2,zero,0
	lui	a4,16
	addi	a4,a4,-1
	and	a4,a5,a4
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, t0, x0
.Lpcrel_callmul_544:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_544)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t0,x0,16
	srl	a4,a4,t0
	addi	t0,x0,16
	srl	t0,a5,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a5,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_545:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_545)
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
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a5,t1
	addi	t2,x0,16
	srl	t2,a5,t2
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
.Lpcrel_callmul_546:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_546)
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
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a4,a4,t0
	addi	t0,x0,16
	srl	a4,a4,t0
	addi	t0,x0,16
	srl	t0,a5,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a5,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_547:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_547)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t1,x0,16
	srl	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a5,t1
	addi	t2,x0,16
	srl	t2,a5,t2
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
.Lpcrel_callmul_548:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_548)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t1,t1,t2
	addi	t2,x0,16
	srl	t2,a5,t2
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	addi	t3,x0,16
	srl	t3,a5,t3
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
.Lpcrel_callmul_549:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_549)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a4,a4,t0
	sub	a1,x0,a4
	sub	a1,a3,a1
	lui	a0,16
	addi	a0,a0,-1
	and	a0,a2,a0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, t0, x0
.Lpcrel_callmul_550:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_550)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	t0,x0,16
	srl	a0,a0,t0
	addi	t0,x0,16
	srl	t0,a2,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a5,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_551:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_551)
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
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a2,t1
	addi	t2,x0,16
	srl	t2,a5,t2
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
.Lpcrel_callmul_552:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_552)
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
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a0,a0,t0
	addi	t0,x0,16
	srl	a0,a0,t0
	addi	t0,x0,16
	srl	t0,a2,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a5,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_553:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_553)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t1,x0,16
	srl	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a2,t1
	addi	t2,x0,16
	srl	t2,a5,t2
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
.Lpcrel_callmul_554:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_554)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t1,t1,t2
	addi	t2,x0,16
	srl	t2,a2,t2
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	addi	t3,x0,16
	srl	t3,a5,t3
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
.Lpcrel_callmul_555:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_555)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a0,a0,t0
	bltu	a1,a4,.+12
	addi	a4,x0,0
	jal	x0,.+8
	addi	a4,x0,1
	sub	t0,x0,a3
	sub	a1,a1,t0
	bltu	a1,a3,.+12
	addi	s1,x0,0
	jal	x0,.+8
	addi	s1,x0,1
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, a2, x0
.Lpcrel_callmul_556:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_556)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	t0,x0,a4
	sub	a4,a0,t0
	sub	t0,x0,s1
	sub	s1,a0,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a2,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a2,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_557:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_557)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t1,x0,16
	srl	t0,t0,t1
	addi	t1,x0,16
	srl	t1,a2,t1
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
.Lpcrel_callmul_558:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_558)
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
	and	t2,a2,t2
	addi	t3,x0,16
	srl	t3,a2,t3
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
.Lpcrel_callmul_559:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_559)
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
	sub	t1,x0,t1
	sub	t0,t0,t1
	addi	t1,x0,16
	srl	t0,t0,t1
	addi	t1,x0,16
	srl	t1,a2,t1
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
.Lpcrel_callmul_560:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_560)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a2,t2
	addi	t3,x0,16
	srl	t3,a2,t3
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
.Lpcrel_callmul_561:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_561)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t3,x0,16
	srl	t2,t2,t3
	addi	t3,x0,16
	srl	t3,a2,t3
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	addi	t4,x0,16
	srl	t4,a2,t4
	lui	a2,16
	addi	a2,a2,-1
	and	a2,t4,a2
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t3, x0
	add	a1, a2, x0
.Lpcrel_callmul_562:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_562)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a2,x0,a2
	sub	a2,t2,a2
	sub	a2,x0,a2
	sub	a2,t1,a2
	sub	a2,x0,a2
	sub	a2,t0,a2
	sub	t0,x0,a4
	sub	a3,a3,t0
	bltu	a3,a4,.+12
	addi	a4,x0,0
	jal	x0,.+8
	addi	a4,x0,1
	sub	t0,x0,a3
	sub	s1,s1,t0
	bltu	s1,a3,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a5, x0
.Lpcrel_callmul_563:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_563)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a4
	sub	a4,a2,t0
	sub	s5,x0,a3
	sub	s5,a4,s5
.L36:
	addi	a3,x0,31
	srl	a3,s1,a3
	addi	a4,x0,1
	sll	a4,s5,a4
	sub	t0,x0,a3
	sub	a4,a4,t0
	addi	t0,x0,1
	sll	s1,s1,t0
	addi	a3,x0,31
	srl	a3,a1,a3
	addi	a2,x0,31
	sra	a2,s5,a2
	and	t0,a3,s1
	sub	t0,t0,s1
	sub	s1,a3,t0
	addi	a3,x0,1
	sll	a3,a1,a3
	addi	a1,x0,31
	srl	a1,a5,a1
	sub	t0,x0,a1
	sub	a3,a3,t0
	and	a0,a2,a4
	sub	a0,a0,a4
	sub	a0,a2,a0
	addi	s5,a4,0
	addi	s2,s2,1
	addi	t0,x0,1
	sll	a5,a5,t0
	and	t0,a2,s1
	sub	t0,t0,s1
	sub	a2,a2,t0
	addi	a1,a3,0
	bltu	a0,s0,.L34
	sub	a7,s1,s4
	addi	a6,a5,1
	bltu	s1,a7,.+12
	addi	t3,x0,0
	jal	x0,.+8
	addi	t3,x0,1
	bltu	a6,a5,.+12
	addi	t1,x0,0
	jal	x0,.+8
	addi	t1,x0,1
	sub	a4,a4,s0
	bne	s0,a0,.L52
	bltu	a2,s4,.L34
.L52:
	addi	s1,a7,0
	sub	s5,a4,t3
	addi	a5,a6,0
	sub	a1,x0,t1
	sub	a1,a3,a1
.L34:
	bne	s2,s3,.L36
	addi	a2,zero,0
	addi	a3,zero,0
	addi	a4,zero,1
	addi	a5,zero,0
	jal	x0,.L39
.L66:
	addi	s2,s2,-1
	sub	a4,x0,t6
	sub	a4,t5,a4
	addi	a5,t4,0
	bne	s2,zero,.+8
	jal	x0,.L65
.L39:
	and	a6,a5,s0
	sub	a6,a6,s0
	sub	a6,a5,a6
	and	t0,a5,s0
	sub	a6,a6,t0
	and	a1,a4,s4
	sub	a1,a1,s4
	sub	a1,a4,a1
	and	t0,a4,s4
	sub	a1,a1,t0
	addi	a7,x0,31
	sll	a7,a6,a7
	addi	t0,x0,1
	srl	a1,a1,t0
	addi	t5,x0,31
	sll	t5,a3,t5
	sub	t0,x0,a7
	sub	a1,a1,t0
	addi	t4,x0,1
	srl	t4,a2,t4
	addi	t3,x0,1
	srl	t3,a3,t3
	and	a0,s4,a4
	addi	t1,x0,1
	and	t1,a4,t1
	sub	a2,x0,t5
	sub	a2,t4,a2
	addi	a3,t3,0
	and	a7,s0,a5
	sub	t0,x0,a0
	sub	a1,a1,t0
	addi	t0,x0,1
	srl	a6,a6,t0
	addi	t4,x0,1
	srl	t4,a5,t4
	addi	t6,x0,31
	sll	t6,a5,t6
	addi	t5,x0,1
	srl	t5,a4,t5
	sub	t0,x0,t3
	sub	t3,s6,t0
	bne	t1,zero,.+8
	jal	x0,.L66
	bltu	a1,a0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	sub	t0,x0,a7
	sub	a7,a6,t0
	addi	s2,s2,-1
	addi	a4,a1,0
	sub	a5,x0,a0
	sub	a5,a7,a5
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
	addi	a2,x0,31
	srl	a2,a0,a2
	addi	a5,x0,1
	sll	a5,a1,a5
	sub	t0,x0,a2
	sub	a5,a5,t0
	addi	t0,x0,1
	sll	a0,a0,t0
	addi	a2,x0,31
	srl	a2,a4,a2
	addi	a6,x0,31
	sra	a6,a1,a6
	and	t0,a2,a0
	sub	t0,t0,a0
	sub	a0,a2,t0
	addi	a2,x0,1
	sll	a2,a4,a2
	addi	a4,x0,31
	srl	a4,a3,a4
	sub	t0,x0,a4
	sub	a2,a2,t0
	and	t1,a6,a5
	sub	t1,t1,a5
	sub	t1,a6,t1
	addi	a1,a5,0
	addi	a7,a7,1
	addi	t0,x0,1
	sll	a3,a3,t0
	and	t0,a6,a0
	sub	t0,t0,a0
	sub	a6,a6,t0
	addi	a4,a2,0
	bltu	t1,s0,.L40
	sub	t3,a0,s4
	bne	s0,t1,.L53
	bltu	a6,s4,.L40
.L53:
	addi	a6,a3,1
	bltu	a0,t3,.+12
	addi	a1,x0,0
	jal	x0,.+8
	addi	a1,x0,1
	bltu	a6,a3,.+12
	addi	a4,x0,0
	jal	x0,.+8
	addi	a4,x0,1
	sub	a5,a5,s0
	addi	a0,t3,0
	sub	a1,a5,a1
	sub	t0,x0,a4
	sub	a4,a2,t0
	addi	a3,a6,0
.L40:
	bne	a7,s3,.L42
	addi	t3,zero,0
	addi	a2,s8,0
	addi	a3,s10,0
	addi	a6,zero,0
	addi	a4,zero,0
.L45:
	addi	a7,x0,31
	srl	a7,a2,a7
	addi	t1,x0,31
	sra	t1,a3,t1
	addi	a5,x0,1
	sll	a5,a3,a5
	addi	t0,x0,1
	sll	a2,a2,t0
	addi	a3,x0,31
	srl	a3,a4,a3
	sub	t0,x0,a7
	sub	a5,a5,t0
	and	t0,a3,a2
	sub	t0,t0,a2
	sub	a2,a3,t0
	addi	a7,x0,1
	sll	a7,a4,a7
	addi	a3,x0,31
	srl	a3,a6,a3
	sub	t0,x0,a3
	sub	a7,a7,t0
	and	t4,t1,a5
	sub	t4,t4,a5
	sub	t4,t1,t4
	addi	a3,a5,0
	addi	t3,t3,1
	addi	t0,x0,1
	sll	a6,a6,t0
	and	t0,t1,a2
	sub	t0,t0,a2
	sub	t1,t1,t0
	addi	a4,a7,0
	bltu	t4,s0,.L43
	sub	t5,a2,s4
	bne	s0,t4,.L54
	bltu	t1,s4,.L43
.L54:
	bltu	a2,t5,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	sub	a5,a5,s0
	sub	a3,a5,a3
	addi	a5,a6,1
	bltu	a5,a6,.+12
	addi	a4,x0,0
	jal	x0,.+8
	addi	a4,x0,1
	addi	a2,t5,0
	sub	t0,x0,a4
	sub	a4,a7,t0
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
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
.Lpcrel_callmul_564:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_564)
	add	a7, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	a2,16
	addi	a2,a2,-1
	and	a2,a0,a2
	lui	t0,16
	addi	t0,t0,-1
	and	t0,t1,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, t0, x0
.Lpcrel_callmul_565:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_565)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	t0,x0,16
	srl	a2,a2,t0
	addi	t0,x0,16
	srl	t0,a0,t0
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t1,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t3, x0
.Lpcrel_callmul_566:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_566)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a0,t3
	addi	t4,x0,16
	srl	t4,t1,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_567:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_567)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	sub	t3,x0,t3
	sub	t0,t0,t3
	sub	t0,x0,t0
	sub	a2,a2,t0
	addi	t0,x0,16
	srl	a2,a2,t0
	addi	t0,x0,16
	srl	t0,a0,t0
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t1,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t3, x0
.Lpcrel_callmul_568:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_568)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t3,x0,16
	srl	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a0,t3
	addi	t4,x0,16
	srl	t4,t1,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_569:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_569)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t4,x0,16
	srl	t3,t3,t4
	addi	t4,x0,16
	srl	t4,a0,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	t5,x0,16
	srl	t5,t1,t5
	lui	t6,16
	addi	t6,t6,-1
	and	t5,t5,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t4, x0
	add	a1, t5, x0
.Lpcrel_callmul_570:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_570)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t4,x0,t4
	sub	t3,t3,t4
	sub	t3,x0,t3
	sub	t0,t0,t3
	sub	t0,x0,t0
	sub	a2,a2,t0
	lui	a6,16
	addi	a6,a6,-1
	and	a6,a1,a6
	lui	t0,16
	addi	t0,t0,-1
	and	t0,t1,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a6, x0
	add	a1, t0, x0
.Lpcrel_callmul_571:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_571)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t0,x0,16
	srl	a6,a6,t0
	addi	t0,x0,16
	srl	t0,a1,t0
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t1,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t3, x0
.Lpcrel_callmul_572:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_572)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a1,t3
	addi	t4,x0,16
	srl	t4,t1,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_573:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_573)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	sub	t3,x0,t3
	sub	t0,t0,t3
	sub	t0,x0,t0
	sub	a6,a6,t0
	addi	t0,x0,16
	srl	a6,a6,t0
	addi	t0,x0,16
	srl	t0,a1,t0
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t1,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t3, x0
.Lpcrel_callmul_574:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_574)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t3,x0,16
	srl	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a1,t3
	addi	t4,x0,16
	srl	t4,t1,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_575:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_575)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t4,x0,16
	srl	t3,t3,t4
	addi	t4,x0,16
	srl	t4,a1,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	t5,x0,16
	srl	t5,t1,t5
	lui	t6,16
	addi	t6,t6,-1
	and	t5,t5,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t4, x0
	add	a1, t5, x0
.Lpcrel_callmul_576:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_576)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t4,x0,t4
	sub	t3,t3,t4
	sub	t3,x0,t3
	sub	t0,t0,t3
	sub	t0,x0,t0
	sub	a6,a6,t0
	sub	t0,x0,a7
	sub	a2,a2,t0
	bltu	a2,a7,.+8
	jal	x0,.+8
	jal	x0,.+12
	addi	a7,x0,0
	jal	x0,.+8
	addi	a7,x0,1
	sub	t0,x0,a7
	sub	a6,a6,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
.Lpcrel_callmul_577:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_577)
	add	a7, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a1,t0
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t2,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t3, x0
.Lpcrel_callmul_578:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_578)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t3,x0,16
	srl	t0,t0,t3
	addi	t3,x0,16
	srl	t3,a1,t3
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t4,t2,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_579:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_579)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a1,t4
	addi	t5,x0,16
	srl	t5,t2,t5
	lui	t6,16
	addi	t6,t6,-1
	and	t5,t5,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t4, x0
	add	a1, t5, x0
.Lpcrel_callmul_580:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_580)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	sub	t4,x0,t4
	sub	t3,t3,t4
	sub	t3,x0,t3
	sub	t0,t0,t3
	addi	t3,x0,16
	srl	t0,t0,t3
	addi	t3,x0,16
	srl	t3,a1,t3
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t4,t2,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_581:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_581)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t4,x0,16
	srl	t3,t3,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a1,t4
	addi	t5,x0,16
	srl	t5,t2,t5
	lui	t6,16
	addi	t6,t6,-1
	and	t5,t5,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t4, x0
	add	a1, t5, x0
.Lpcrel_callmul_582:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_582)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t5,x0,16
	srl	t4,t4,t5
	addi	t5,x0,16
	srl	t5,a1,t5
	lui	a1,16
	addi	a1,a1,-1
	and	a1,t5,a1
	addi	t5,x0,16
	srl	t5,t2,t5
	lui	t6,16
	addi	t6,t6,-1
	and	t5,t5,t6
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t5, x0
.Lpcrel_callmul_583:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_583)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a1,x0,a1
	sub	a1,t4,a1
	sub	a1,x0,a1
	sub	a1,t3,a1
	sub	a1,x0,a1
	sub	a1,t0,a1
	sub	t0,x0,a6
	sub	a7,a7,t0
	bltu	a7,a6,.+12
	addi	a6,x0,0
	jal	x0,.+8
	addi	a6,x0,1
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a1, t2, x0
.Lpcrel_callmul_584:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_584)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	t0,x0,a6
	sub	a6,a1,t0
	lui	a5,16
	addi	a5,a5,-1
	and	a5,a0,a5
	lui	t0,16
	addi	t0,t0,-1
	and	t0,t2,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, t0, x0
.Lpcrel_callmul_585:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_585)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t0,x0,16
	srl	a5,a5,t0
	addi	t0,x0,16
	srl	t0,a0,t0
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t2,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t3, x0
.Lpcrel_callmul_586:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_586)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a0,t3
	addi	t4,x0,16
	srl	t4,t2,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_587:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_587)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	sub	t3,x0,t3
	sub	t0,t0,t3
	sub	t0,x0,t0
	sub	a5,a5,t0
	addi	t0,x0,16
	srl	a5,a5,t0
	addi	t0,x0,16
	srl	t0,a0,t0
	lui	t3,16
	addi	t3,t3,-1
	and	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t2,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t3, x0
.Lpcrel_callmul_588:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_588)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t3,x0,16
	srl	t0,t0,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a0,t3
	addi	t4,x0,16
	srl	t4,t2,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_589:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_589)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t4,x0,16
	srl	t3,t3,t4
	addi	t4,x0,16
	srl	t4,a0,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	t5,x0,16
	srl	t5,t2,t5
	lui	t6,16
	addi	t6,t6,-1
	and	t5,t5,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t4, x0
	add	a1, t5, x0
.Lpcrel_callmul_590:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_590)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t4,x0,t4
	sub	t3,t3,t4
	sub	t3,x0,t3
	sub	t0,t0,t3
	sub	t0,x0,t0
	sub	a5,a5,t0
	sub	t0,x0,a3
	sub	a2,a2,t0
	bltu	a2,a3,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, t1, x0
.Lpcrel_callmul_591:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_591)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a4,x0,a3
	sub	a4,a5,a4
	sub	t0,x0,a7
	sub	a4,a4,t0
	bltu	a4,a7,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	sub	t0,x0,a3
	sub	a3,a6,t0
.L48:
	addi	a0,x0,31
	srl	a0,a4,a0
	addi	a6,x0,31
	sra	a6,a3,a6
	addi	a5,x0,1
	sll	a5,a3,a5
	addi	t0,x0,1
	sll	a4,a4,t0
	addi	a3,x0,31
	srl	a3,a2,a3
	sub	t0,x0,a0
	sub	a5,a5,t0
	and	t0,a3,a4
	sub	t0,t0,a4
	sub	a4,a3,t0
	addi	a0,x0,1
	sll	a0,a2,a0
	addi	a3,x0,31
	srl	a3,a1,a3
	sub	t0,x0,a3
	sub	a0,a0,t0
	and	a7,a6,a5
	sub	a7,a7,a5
	sub	a7,a6,a7
	addi	a3,a5,0
	addi	s2,s2,1
	addi	t0,x0,1
	sll	a1,a1,t0
	and	t0,a6,a4
	sub	t0,t0,a4
	sub	a6,a6,t0
	addi	a2,a0,0
	bltu	a7,s0,.L46
	sub	t1,a4,s4
	bne	s0,a7,.L55
	bltu	a6,s4,.L46
.L55:
	addi	a6,a1,1
	bltu	a4,t1,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	bltu	a6,a1,.+12
	addi	a2,x0,0
	jal	x0,.+8
	addi	a2,x0,1
	sub	a5,a5,s0
	addi	a4,t1,0
	sub	a3,a5,a3
	sub	t0,x0,a2
	sub	a2,a0,t0
	addi	a1,a6,0
.L46:
	bne	s2,s3,.L48
	addi	s7,s7,-1
	bne	s7,zero,.L49
	lw	a0,8(sp)
	lw	a1,12(sp)
	and	t0,a3,s5
	sub	t0,t0,s5
	sub	t0,a3,t0
	and	t1,a3,s5
	sub	s5,t0,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, s0, x0
.Lpcrel_callmul_592:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_592)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lw	ra,108(sp)
	lw	s0,104(sp)
	and	t0,a4,s1
	sub	t0,t0,s1
	sub	t0,a4,t0
	and	t1,a4,s1
	sub	a4,t0,t1
	and	t0,a4,s5
	sub	t0,t0,s5
	sub	a4,a4,t0
	bltu	zero,a4,.+12
	addi	a4,x0,0
	jal	x0,.+8
	addi	a4,x0,1
	lw	s1,100(sp)
	lw	s2,96(sp)
	lw	s3,92(sp)
	lw	s5,84(sp)
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, s4, x0
.Lpcrel_callmul_593:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_593)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lw	s6,80(sp)
	lw	s7,76(sp)
	lw	s8,72(sp)
	lw	s9,68(sp)
	lw	s10,64(sp)
	lw	s11,60(sp)
	lui	a3,16
	addi	a3,a3,-1
	and	a3,s4,a3
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a0,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, t0, x0
.Lpcrel_callmul_594:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_594)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	t0,x0,16
	srl	a3,a3,t0
	addi	t0,x0,16
	srl	t0,s4,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a0,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_595:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_595)
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
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s4,t1
	addi	t2,x0,16
	srl	t2,a0,t2
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
.Lpcrel_callmul_596:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_596)
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
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a3,a3,t0
	addi	t0,x0,16
	srl	a3,a3,t0
	addi	t0,x0,16
	srl	t0,s4,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a0,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_597:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_597)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t1,x0,16
	srl	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s4,t1
	addi	t2,x0,16
	srl	t2,a0,t2
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
.Lpcrel_callmul_598:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_598)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t2,x0,16
	srl	t1,t1,t2
	addi	t2,x0,16
	srl	t2,s4,t2
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	addi	t3,x0,16
	srl	t3,a0,t3
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
.Lpcrel_callmul_599:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_599)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a3,a3,t0
	sub	t0,x0,a5
	sub	a5,a2,t0
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, s4, x0
.Lpcrel_callmul_600:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_600)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	t0,x0,a5
	sub	a5,a3,t0
	lw	s4,88(sp)
	addi	sp,sp,112
	and	a0,a0,a5
	addi	a0,a0,1
	bltu	zero,a0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	and	t0,a0,a4
	sub	t0,t0,a4
	sub	a0,a0,t0
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
	sub	a5,x0,a1
	sub	a5,a6,a5
	addi	a3,t6,0
	bne	t1,zero,.+8
	jal	x0,.L81
.L72:
	and	a6,a5,t3
	sub	a6,a6,t3
	sub	a6,a5,a6
	and	t0,a5,t3
	sub	a6,a6,t0
	and	a1,a4,t4
	sub	a1,a1,t4
	sub	a1,a4,a1
	and	t0,a4,t4
	sub	a1,a1,t0
	addi	a7,x0,31
	sll	a7,a6,a7
	addi	t0,x0,1
	srl	a1,a1,t0
	sub	t0,x0,a7
	sub	a1,a1,t0
	and	a7,t4,a4
	addi	a0,x0,31
	sll	a0,a3,a0
	and	t0,t3,a5
	addi	t2,x0,1
	srl	t2,a2,t2
	addi	t6,x0,1
	srl	t6,a3,t6
	sub	t5,x0,a1
	sub	a7,a7,t5
	addi	t5,x0,1
	srl	a6,a6,t5
	addi	t5,x0,1
	and	t5,t5,a4
	sub	a2,x0,a0
	sub	a2,t2,a2
	sub	t2,x0,a6
	sub	a6,t0,t2
	addi	a3,t6,0
	bltu	a7,a1,.+12
	addi	a1,x0,0
	jal	x0,.+8
	addi	a1,x0,1
	addi	t0,x0,1
	srl	t0,a5,t0
	addi	a0,x0,31
	sll	a0,a5,a0
	addi	t2,x0,1
	srl	t2,a4,t2
	sub	a4,x0,t6
	sub	t6,s0,a4
	bne	t5,zero,.L82
	addi	t1,t1,-1
	sub	a4,x0,a0
	sub	a4,t2,a4
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
	and	t0,a0,a1
	sub	t0,t0,a1
	sub	a1,a0,t0
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
	and	t3,t4,t0
	sub	t3,t3,t0
	sub	t3,t4,t3
	sub	a6,x0,s8
	sub	a6,s7,a6
	addi	a7,s6,0
	bne	t3,zero,.+8
	jal	x0,.L92
.L88:
	and	t5,a7,s4
	sub	t5,t5,s4
	sub	t5,a7,t5
	and	t0,a7,s4
	sub	t5,t5,t0
	and	t3,a6,s3
	sub	t3,t3,s3
	sub	t3,a6,t3
	and	t0,a6,s3
	sub	t3,t3,t0
	addi	a5,x0,31
	sll	a5,t5,a5
	addi	t0,x0,1
	srl	t3,t3,t0
	sub	t0,x0,a5
	sub	t3,t3,t0
	addi	a1,x0,31
	sll	a1,t2,a1
	addi	a5,x0,31
	sll	a5,a2,a5
	addi	t4,x0,1
	srl	t4,a4,t4
	addi	t0,x0,1
	srl	t0,a2,t0
	addi	a2,x0,1
	srl	a2,t1,a2
	sub	t1,x0,a1
	sub	t1,a2,t1
	sub	t6,x0,a5
	sub	t4,t4,t6
	and	t6,s3,a6
	addi	a5,x0,1
	srl	a5,t2,a5
	and	a4,s4,a7
	addi	t2,a5,0
	sub	a1,x0,t3
	sub	t6,t6,a1
	addi	a1,x0,1
	srl	t5,t5,a1
	sub	a5,x0,a0
	sub	a5,t1,a5
	addi	a3,x0,1
	and	a3,a3,a6
	sub	a1,x0,t5
	sub	t5,a4,a1
	addi	s6,x0,1
	srl	s6,a7,s6
	addi	s8,x0,31
	sll	s8,a7,s8
	addi	s7,x0,1
	srl	s7,a6,s7
	bltu	a5,t1,.+12
	addi	s5,x0,0
	jal	x0,.+8
	addi	s5,x0,1
	sub	a1,x0,s0
	sub	a1,t2,a1
	bltu	t6,t3,.+12
	addi	t3,x0,0
	jal	x0,.+8
	addi	t3,x0,1
	addi	a4,t4,0
	addi	a2,t0,0
	bne	a3,zero,.+8
	jal	x0,.L93
	sub	a7,x0,t3
	sub	a7,t5,a7
	and	t3,t4,t0
	sub	t3,t3,t0
	sub	t3,t4,t3
	addi	a6,t6,0
	addi	t1,a5,0
	sub	t2,x0,s5
	sub	t2,a1,t2
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
	bltu	zero,a0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
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
	bltu	a0,t0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
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
	sub	a2,x0,a0
	sub	a2,x0,a2
	addi	a0,x0,0
.Mul_loop:
	addi	a3,x0,1
	and	a3,a1,a3
	bne	a3,x0,.+8
	jal	x0,.Mul_skip
	sub	t0,x0,a0
	sub	a0,a2,t0
.Mul_skip:
	addi	t0,x0,1
	srl	a1,a1,t0
	addi	t0,x0,1
	sll	a2,a2,t0
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
	addi	t0,x0,1
	sll	a2,a2,t0
	addi	t0,x0,1
	sll	a3,a3,t0
	bltu	a2,a1,__riscv_div_lib_L1
__riscv_div_lib_L2:
	addi	a0,zero,0
__riscv_div_lib_L3:
	bltu	a1,a2,__riscv_div_lib_L4
	sub	a1,a1,a2
	and	t0,a0,a3
	sub	t0,t0,a3
	sub	a0,a0,t0
__riscv_div_lib_L4:
	addi	t0,x0,1
	srl	a3,a3,t0
	addi	t0,x0,1
	srl	a2,a2,t0
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