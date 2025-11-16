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
.Lpcrel_callmul_1:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1)
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
.Lpcrel_callmul_2:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_2)
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
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_3:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_3)
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
.Lpcrel_callmul_4:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_4)
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
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_5:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_5)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a0,t2
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
.Lpcrel_callmul_6:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_6)
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
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_7:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_7)
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
.Lpcrel_callmul_8:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_8)
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
.Lpcrel_callmul_9:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_9)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t4,t4,16
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
.Lpcrel_callmul_10:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_10)
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
	srli	t3,a2,16
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
.Lpcrel_callmul_11:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_11)
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
	srli	t4,t4,16
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
.Lpcrel_callmul_12:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_12)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a1,t2
	srli	t3,a2,16
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
.Lpcrel_callmul_13:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_13)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srli	t3,a1,16
	lui	t5,16
	addi	t5,t5,-1
	and	t3,t3,t5
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
.Lpcrel_callmul_14:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_14)
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
.Lpcrel_callmul_15:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_15)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t3,t3,16
	srli	t0,a0,16
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
.Lpcrel_callmul_16:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_16)
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
	srli	t2,a3,16
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
.Lpcrel_callmul_17:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_17)
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
	srli	t3,t3,16
	srli	t0,a0,16
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
.Lpcrel_callmul_18:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_18)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a0,t1
	srli	t2,a3,16
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
.Lpcrel_callmul_19:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_19)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srli	t2,a0,16
	lui	t5,16
	addi	t5,t5,-1
	and	t2,t2,t5
	srli	t5,a3,16
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
.Lpcrel_callmul_20:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_20)
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
.Lpcrel_callmul_21:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_21)
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
.Lpcrel_callmul_22:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_22)
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
	and	t3,a3,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_23:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_23)
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
	srli	t4,a3,16
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
.Lpcrel_callmul_24:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_24)
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
	srli	t0,t0,16
	srli	t2,a1,16
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
.Lpcrel_callmul_25:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_25)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a1,t3
	srli	t4,a3,16
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
.Lpcrel_callmul_26:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_26)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t3,t3,16
	srli	t4,a1,16
	lui	a1,16
	addi	a1,a1,-1
	and	a1,t4,a1
	srli	t4,a3,16
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t4, x0
.Lpcrel_callmul_27:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_27)
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
.Lpcrel_callmul_28:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_28)
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
	srli	a7,a0,31
	slli	a6,a1,1
	sub	t1,x0,a7
	sub	a6,a6,t1
	srai	t1,a1,31
	slli	a7,a3,1
	srli	a1,a3,31
	slli	a0,a0,1
	srli	a3,a2,31
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
	slli	a2,a2,1
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
	beq	a5,t4,.+8
	jal	x0,.L10
	bltu	t1,s0,.L7
.L10:
	addi	a0,t6,0
	sub	a1,a6,a4
	addi	a2,t5,0
	sub	a3,x0,t2
	sub	a3,a7,a3
.L7:
	beq	t3,t0,.+8
	jal	x0,.L9
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
.Lpcrel_callmul_29:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_29)
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
.Lpcrel_callmul_30:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_30)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t3,t3,16
	srli	t0,a0,16
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
.Lpcrel_callmul_31:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_31)
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
	srli	t4,a2,16
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
.Lpcrel_callmul_32:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_32)
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
	srli	t3,t3,16
	srli	t0,a0,16
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
.Lpcrel_callmul_33:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_33)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a0,t2
	srli	t4,a2,16
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
.Lpcrel_callmul_34:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_34)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srli	t4,a0,16
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
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
	add	a0, t4, x0
	add	a1, t5, x0
.Lpcrel_callmul_35:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_35)
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
.Lpcrel_callmul_36:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_36)
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
.Lpcrel_callmul_37:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_37)
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
.Lpcrel_callmul_38:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_38)
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
.Lpcrel_callmul_39:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_39)
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
.Lpcrel_callmul_40:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_40)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t2,a1,16
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
.Lpcrel_callmul_41:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_41)
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
	srli	s3,a2,16
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
.Lpcrel_callmul_42:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_42)
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
	srli	t0,t0,16
	srli	t2,a1,16
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
.Lpcrel_callmul_43:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_43)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a1,s2
	srli	s3,a2,16
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
.Lpcrel_callmul_44:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_44)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s2,s2,16
	srli	s3,a1,16
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	srli	s4,a2,16
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
.Lpcrel_callmul_45:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_45)
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
.Lpcrel_callmul_46:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_46)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t4,t4,16
	srli	t0,a6,16
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
.Lpcrel_callmul_47:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_47)
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
	srli	s2,t5,16
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
.Lpcrel_callmul_48:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_48)
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
	srli	t4,t4,16
	srli	t0,a6,16
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
.Lpcrel_callmul_49:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_49)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a6,t2
	srli	s2,t5,16
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
.Lpcrel_callmul_50:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_50)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srli	s2,a6,16
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	srli	s3,t5,16
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
.Lpcrel_callmul_51:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_51)
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
.Lpcrel_callmul_52:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_52)
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
.Lpcrel_callmul_53:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_53)
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
.Lpcrel_callmul_54:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_54)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t2,a0,16
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
.Lpcrel_callmul_55:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_55)
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
	srli	s2,a3,16
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
.Lpcrel_callmul_56:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_56)
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
	srli	t0,t0,16
	srli	t2,a0,16
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
.Lpcrel_callmul_57:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_57)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	lui	a2,16
	addi	a2,a2,-1
	and	a2,a0,a2
	srli	s2,a3,16
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
.Lpcrel_callmul_58:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_58)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a2,a2,16
	srli	s2,a0,16
	lui	a0,16
	addi	a0,a0,-1
	and	a0,s2,a0
	srli	s2,a3,16
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, s2, x0
.Lpcrel_callmul_59:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_59)
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
.Lpcrel_callmul_60:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_60)
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
.Lpcrel_callmul_61:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_61)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t4,t4,16
	srli	t0,a6,16
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
.Lpcrel_callmul_62:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_62)
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
	srli	s2,a4,16
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
.Lpcrel_callmul_63:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_63)
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
	srli	t4,t4,16
	srli	t0,a6,16
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
.Lpcrel_callmul_64:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_64)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a6,t2
	srli	s2,a4,16
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
.Lpcrel_callmul_65:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_65)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srli	s2,a6,16
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	srli	s3,a4,16
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
.Lpcrel_callmul_66:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_66)
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
.Lpcrel_callmul_67:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_67)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t2,a1,16
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
.Lpcrel_callmul_68:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_68)
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
	srli	s3,a3,16
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
.Lpcrel_callmul_69:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_69)
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
	srli	t0,t0,16
	srli	t2,a1,16
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
.Lpcrel_callmul_70:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_70)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a1,s2
	srli	s3,a3,16
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
.Lpcrel_callmul_71:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_71)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s2,s2,16
	srli	s3,a1,16
	lui	a1,16
	addi	a1,a1,-1
	and	a1,s3,a1
	srli	s3,a3,16
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, s3, x0
.Lpcrel_callmul_72:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_72)
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
.Lpcrel_callmul_73:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_73)
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
.Lpcrel_callmul_74:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_74)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a1,a1,16
	srli	t0,a7,16
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
.Lpcrel_callmul_75:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_75)
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
	srli	a3,a4,16
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
.Lpcrel_callmul_76:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_76)
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
	srli	a1,a1,16
	srli	t0,a7,16
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
.Lpcrel_callmul_77:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_77)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a7,t2
	srli	a3,a4,16
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
.Lpcrel_callmul_78:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_78)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srli	a3,a7,16
	lui	s2,16
	addi	s2,s2,-1
	and	a3,a3,s2
	srli	s2,a4,16
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
.Lpcrel_callmul_79:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_79)
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
.Lpcrel_callmul_80:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_80)
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
.Lpcrel_callmul_81:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_81)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t2,a7,16
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
.Lpcrel_callmul_82:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_82)
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
	srli	s2,a5,16
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, s2, x0
.Lpcrel_callmul_83:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_83)
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
	srli	t0,t0,16
	srli	t2,a7,16
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
.Lpcrel_callmul_84:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_84)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	lui	a1,16
	addi	a1,a1,-1
	and	a1,a7,a1
	srli	s2,a5,16
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, s2, x0
.Lpcrel_callmul_85:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_85)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a1,a1,16
	srli	s2,a7,16
	lui	a7,16
	addi	a7,a7,-1
	and	a7,s2,a7
	srli	s2,a5,16
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
.Lpcrel_callmul_86:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_86)
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
.Lpcrel_callmul_87:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_87)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t2,a6,16
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
.Lpcrel_callmul_88:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_88)
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
	srli	s3,a5,16
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
.Lpcrel_callmul_89:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_89)
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
	srli	t0,t0,16
	srli	t2,a6,16
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
.Lpcrel_callmul_90:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_90)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a6,s2
	srli	s3,a5,16
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
.Lpcrel_callmul_91:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_91)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s2,s2,16
	srli	s3,a6,16
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	srli	s4,a5,16
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
.Lpcrel_callmul_92:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_92)
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
.Lpcrel_callmul_93:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_93)
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
	beq	t3,a6,.+8
	jal	x0,.+8
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
	beq	t3,a6,.L24
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
	beq	a5,a7,.+8
	jal	x0,.+8
	jal	x0,.L26
.L20:
	and	t0,a2,a0
	sub	t0,t0,a0
	sub	a2,a2,t0
	and	t0,a3,a2
	sub	t0,t0,a2
	sub	a3,a3,t0
	slli	a2,a3,31
	srai	a0,a2,31
	and	a0,a0,a4
	slli	a4,a3,31
	srai	a3,a4,31
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
.Lpcrel_callmul_94:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_94)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a3,a3,16
	srli	t0,s9,16
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
.Lpcrel_callmul_95:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_95)
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
	srli	t2,s8,16
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
.Lpcrel_callmul_96:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_96)
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
	srli	a3,a3,16
	srli	t0,s9,16
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
.Lpcrel_callmul_97:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_97)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s9,t1
	srli	t2,s8,16
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
.Lpcrel_callmul_98:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_98)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srli	t2,s9,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	srli	t3,s8,16
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
.Lpcrel_callmul_99:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_99)
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
.Lpcrel_callmul_100:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_100)
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
.Lpcrel_callmul_101:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_101)
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
.Lpcrel_callmul_102:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_102)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a2,a2,16
	srli	t0,s11,16
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
.Lpcrel_callmul_103:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_103)
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
	srli	t2,s8,16
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
.Lpcrel_callmul_104:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_104)
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
	srli	a2,a2,16
	srli	t0,s11,16
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
.Lpcrel_callmul_105:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_105)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s11,t1
	srli	t2,s8,16
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
.Lpcrel_callmul_106:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_106)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srli	t2,s11,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	srli	t3,s8,16
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
.Lpcrel_callmul_107:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_107)
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
.Lpcrel_callmul_108:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_108)
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
.Lpcrel_callmul_109:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_109)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a2,a2,16
	srli	t0,s11,16
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
.Lpcrel_callmul_110:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_110)
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
	srli	t2,s10,16
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
.Lpcrel_callmul_111:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_111)
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
	srli	a2,a2,16
	srli	t0,s11,16
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
.Lpcrel_callmul_112:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_112)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s11,t1
	srli	t2,s10,16
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
.Lpcrel_callmul_113:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_113)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srli	t2,s11,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	srli	t3,s10,16
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
.Lpcrel_callmul_114:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_114)
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
.Lpcrel_callmul_115:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_115)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a2,a2,16
	srli	t0,s9,16
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
.Lpcrel_callmul_116:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_116)
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
	srli	t2,s10,16
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
.Lpcrel_callmul_117:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_117)
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
	srli	a2,a2,16
	srli	t0,s9,16
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
.Lpcrel_callmul_118:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_118)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s9,t1
	srli	t2,s10,16
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
.Lpcrel_callmul_119:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_119)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srli	t2,s9,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	srli	t3,s10,16
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
.Lpcrel_callmul_120:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_120)
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
.Lpcrel_callmul_121:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_121)
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
	srli	a1,a4,31
	srai	a0,a3,31
	slli	a5,a3,1
	slli	a4,a4,1
	srli	a3,a6,31
	sub	t0,x0,a1
	sub	a5,a5,t0
	and	t0,a3,a4
	sub	t0,t0,a4
	sub	a4,a3,t0
	slli	a1,a6,1
	srli	a3,a2,31
	sub	t0,x0,a3
	sub	a1,a1,t0
	and	t1,a0,a5
	sub	t1,t1,a5
	sub	t1,a0,t1
	addi	a3,a5,0
	addi	a7,a7,1
	slli	a2,a2,1
	and	t0,a0,a4
	sub	t0,t0,a4
	sub	a0,a0,t0
	addi	a6,a1,0
	bltu	t1,s0,.+8
	jal	x0,.+8
	jal	x0,.L28
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
	beq	s0,t1,.+8
	jal	x0,.L50
	bltu	a0,s4,.L28
.L50:
	addi	a4,t4,0
	sub	a3,a5,t6
	addi	a2,t3,0
	sub	a6,x0,t5
	sub	a6,a1,a6
.L28:
	beq	a7,s3,.+8
	jal	x0,.L30
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, a4, x0
.Lpcrel_callmul_122:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_122)
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
.Lpcrel_callmul_123:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_123)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	a5,a5,16
	srli	t0,a4,16
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
.Lpcrel_callmul_124:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_124)
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
.Lpcrel_callmul_125:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_125)
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
	srli	a5,a5,16
	srli	t0,a4,16
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
.Lpcrel_callmul_126:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_126)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a4,t1
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
.Lpcrel_callmul_127:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_127)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srli	t2,a4,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	srli	t3,a4,16
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
.Lpcrel_callmul_128:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_128)
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
.Lpcrel_callmul_129:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_129)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srli	t0,a3,16
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
.Lpcrel_callmul_130:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_130)
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
	srli	t3,a4,16
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
.Lpcrel_callmul_131:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_131)
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
	srli	t0,a3,16
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
.Lpcrel_callmul_132:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_132)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a3,t2
	srli	t3,a4,16
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
.Lpcrel_callmul_133:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_133)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srli	t3,a3,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	srli	t4,a4,16
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
.Lpcrel_callmul_134:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_134)
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
.Lpcrel_callmul_135:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_135)
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
.Lpcrel_callmul_136:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_136)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t1,a3,16
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
.Lpcrel_callmul_137:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_137)
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
	srli	t3,a3,16
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
.Lpcrel_callmul_138:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_138)
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
	srli	t0,t0,16
	srli	t1,a3,16
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
.Lpcrel_callmul_139:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_139)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a3,t2
	srli	t3,a3,16
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
.Lpcrel_callmul_140:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_140)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srli	t3,a3,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	srli	t4,a3,16
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
.Lpcrel_callmul_141:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_141)
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
.Lpcrel_callmul_142:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_142)
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
	srli	a1,a5,31
	srai	a0,a2,31
	slli	a3,a2,1
	slli	a5,a5,1
	srli	a2,a6,31
	sub	t0,x0,a1
	sub	a3,a3,t0
	and	t0,a2,a5
	sub	t0,t0,a5
	sub	a5,a2,t0
	slli	a1,a6,1
	srli	a2,a4,31
	sub	t0,x0,a2
	sub	a1,a1,t0
	and	t1,a0,a3
	sub	t1,t1,a3
	sub	t1,a0,t1
	addi	a2,a3,0
	addi	a7,a7,1
	slli	a4,a4,1
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
	beq	s0,t1,.+8
	jal	x0,.L51
	bltu	a0,s4,.L31
.L51:
	addi	a5,t4,0
	sub	a2,a3,t6
	addi	a4,t3,0
	sub	a6,x0,t5
	sub	a6,a1,a6
.L31:
	beq	a7,s3,.+8
	jal	x0,.L33
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, a5, x0
.Lpcrel_callmul_143:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_143)
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
.Lpcrel_callmul_144:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_144)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	a4,a4,16
	srli	t0,a5,16
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
.Lpcrel_callmul_145:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_145)
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
	srli	t2,a5,16
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
.Lpcrel_callmul_146:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_146)
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
	srli	a4,a4,16
	srli	t0,a5,16
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
.Lpcrel_callmul_147:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_147)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a5,t1
	srli	t2,a5,16
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
.Lpcrel_callmul_148:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_148)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srli	t2,a5,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	srli	t3,a5,16
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
.Lpcrel_callmul_149:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_149)
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
.Lpcrel_callmul_150:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_150)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a0,a0,16
	srli	t0,a2,16
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
.Lpcrel_callmul_151:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_151)
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
	srli	t2,a5,16
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
.Lpcrel_callmul_152:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_152)
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
	srli	a0,a0,16
	srli	t0,a2,16
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
.Lpcrel_callmul_153:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_153)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a2,t1
	srli	t2,a5,16
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
.Lpcrel_callmul_154:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_154)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srli	t2,a2,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	srli	t3,a5,16
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
.Lpcrel_callmul_155:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_155)
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
.Lpcrel_callmul_156:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_156)
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
.Lpcrel_callmul_157:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_157)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t1,a2,16
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
.Lpcrel_callmul_158:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_158)
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
.Lpcrel_callmul_159:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_159)
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
	srli	t0,t0,16
	srli	t1,a2,16
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
.Lpcrel_callmul_160:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_160)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a2,t2
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
.Lpcrel_callmul_161:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_161)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srli	t3,a2,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	srli	t4,a2,16
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
.Lpcrel_callmul_162:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_162)
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
.Lpcrel_callmul_163:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_163)
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
	srli	a3,s1,31
	slli	a4,s5,1
	sub	t0,x0,a3
	sub	a4,a4,t0
	slli	s1,s1,1
	srli	a3,a1,31
	srai	a2,s5,31
	and	t0,a3,s1
	sub	t0,t0,s1
	sub	s1,a3,t0
	slli	a3,a1,1
	srli	a1,a5,31
	sub	t0,x0,a1
	sub	a3,a3,t0
	and	a0,a2,a4
	sub	a0,a0,a4
	sub	a0,a2,a0
	addi	s5,a4,0
	addi	s2,s2,1
	slli	a5,a5,1
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
	beq	s0,a0,.+8
	jal	x0,.L52
	bltu	a2,s4,.L34
.L52:
	addi	s1,a7,0
	sub	s5,a4,t3
	addi	a5,a6,0
	sub	a1,x0,t1
	sub	a1,a3,a1
.L34:
	beq	s2,s3,.+8
	jal	x0,.L36
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
	beq	s2,zero,.L65
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
	slli	a7,a6,31
	srli	a1,a1,1
	slli	t5,a3,31
	sub	t0,x0,a7
	sub	a1,a1,t0
	srli	t4,a2,1
	srli	t3,a3,1
	and	a0,s4,a4
	addi	t1,x0,1
	and	t1,a4,t1
	sub	a2,x0,t5
	sub	a2,t4,a2
	addi	a3,t3,0
	and	a7,s0,a5
	sub	t0,x0,a0
	sub	a1,a1,t0
	srli	a6,a6,1
	srli	t4,a5,1
	slli	t6,a5,31
	srli	t5,a4,1
	sub	t0,x0,t3
	sub	t3,s6,t0
	beq	t1,zero,.+8
	jal	x0,.+8
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
	beq	s2,zero,.+8
	jal	x0,.L39
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
	sub	t0,x0,a2
	sub	a5,a5,t0
	slli	a0,a0,1
	srli	a2,a4,31
	srai	a6,a1,31
	and	t0,a2,a0
	sub	t0,t0,a0
	sub	a0,a2,t0
	slli	a2,a4,1
	srli	a4,a3,31
	sub	t0,x0,a4
	sub	a2,a2,t0
	and	t1,a6,a5
	sub	t1,t1,a5
	sub	t1,a6,t1
	addi	a1,a5,0
	addi	a7,a7,1
	slli	a3,a3,1
	and	t0,a6,a0
	sub	t0,t0,a0
	sub	a6,a6,t0
	addi	a4,a2,0
	bltu	t1,s0,.L40
	sub	t3,a0,s4
	beq	s0,t1,.+8
	jal	x0,.L53
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
	beq	a7,s3,.+8
	jal	x0,.L42
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
	sub	t0,x0,a7
	sub	a5,a5,t0
	and	t0,a3,a2
	sub	t0,t0,a2
	sub	a2,a3,t0
	slli	a7,a4,1
	srli	a3,a6,31
	sub	t0,x0,a3
	sub	a7,a7,t0
	and	t4,t1,a5
	sub	t4,t4,a5
	sub	t4,t1,t4
	addi	a3,a5,0
	addi	t3,t3,1
	slli	a6,a6,1
	and	t0,t1,a2
	sub	t0,t0,a2
	sub	t1,t1,t0
	addi	a4,a7,0
	bltu	t4,s0,.L43
	sub	t5,a2,s4
	beq	s0,t4,.+8
	jal	x0,.L54
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
	beq	t3,s3,.+8
	jal	x0,.L45
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
.Lpcrel_callmul_164:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_164)
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
.Lpcrel_callmul_165:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_165)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a2,a2,16
	srli	t0,a0,16
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
.Lpcrel_callmul_166:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_166)
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
	srli	t4,t1,16
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
.Lpcrel_callmul_167:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_167)
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
	srli	a2,a2,16
	srli	t0,a0,16
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
.Lpcrel_callmul_168:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_168)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a0,t3
	srli	t4,t1,16
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
.Lpcrel_callmul_169:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_169)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t3,t3,16
	srli	t4,a0,16
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	srli	t5,t1,16
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
.Lpcrel_callmul_170:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_170)
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
.Lpcrel_callmul_171:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_171)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	a6,a6,16
	srli	t0,a1,16
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
.Lpcrel_callmul_172:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_172)
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
	srli	t4,t1,16
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
.Lpcrel_callmul_173:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_173)
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
	srli	a6,a6,16
	srli	t0,a1,16
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
.Lpcrel_callmul_174:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_174)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a1,t3
	srli	t4,t1,16
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
.Lpcrel_callmul_175:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_175)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t3,t3,16
	srli	t4,a1,16
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	srli	t5,t1,16
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
.Lpcrel_callmul_176:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_176)
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
	bltu	a2,a7,.+12
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
.Lpcrel_callmul_177:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_177)
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
.Lpcrel_callmul_178:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_178)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t3,a1,16
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
.Lpcrel_callmul_179:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_179)
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
	srli	t5,t2,16
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
.Lpcrel_callmul_180:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_180)
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
	srli	t0,t0,16
	srli	t3,a1,16
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
.Lpcrel_callmul_181:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_181)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t3,t3,16
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a1,t4
	srli	t5,t2,16
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
.Lpcrel_callmul_182:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_182)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t4,t4,16
	srli	t5,a1,16
	lui	a1,16
	addi	a1,a1,-1
	and	a1,t5,a1
	srli	t5,t2,16
	lui	t6,16
	addi	t6,t6,-1
	and	t5,t5,t6
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t5, x0
.Lpcrel_callmul_183:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_183)
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
.Lpcrel_callmul_184:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_184)
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
.Lpcrel_callmul_185:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_185)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	a5,a5,16
	srli	t0,a0,16
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
.Lpcrel_callmul_186:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_186)
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
	srli	t4,t2,16
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
.Lpcrel_callmul_187:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_187)
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
	srli	a5,a5,16
	srli	t0,a0,16
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
.Lpcrel_callmul_188:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_188)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a0,t3
	srli	t4,t2,16
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
.Lpcrel_callmul_189:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_189)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t3,t3,16
	srli	t4,a0,16
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	srli	t5,t2,16
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
.Lpcrel_callmul_190:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_190)
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
.Lpcrel_callmul_191:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_191)
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
	bltu	a4,a7,.+8
	jal	x0,.+8
	jal	x0,.+12
	addi	a3,x0,0
	jal	x0,.+8
	addi	a3,x0,1
	sub	t0,x0,a3
	sub	a3,a6,t0
.L48:
	srli	a0,a4,31
	srai	a6,a3,31
	slli	a5,a3,1
	slli	a4,a4,1
	srli	a3,a2,31
	sub	t0,x0,a0
	sub	a5,a5,t0
	and	t0,a3,a4
	sub	t0,t0,a4
	sub	a4,a3,t0
	slli	a0,a2,1
	srli	a3,a1,31
	sub	t0,x0,a3
	sub	a0,a0,t0
	and	a7,a6,a5
	sub	a7,a7,a5
	sub	a7,a6,a7
	addi	a3,a5,0
	addi	s2,s2,1
	slli	a1,a1,1
	and	t0,a6,a4
	sub	t0,t0,a4
	sub	a6,a6,t0
	addi	a2,a0,0
	bltu	a7,s0,.L46
	sub	t1,a4,s4
	beq	s0,a7,.+8
	jal	x0,.L55
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
	beq	s2,s3,.+8
	jal	x0,.L48
	addi	s7,s7,-1
	beq	s7,zero,.+8
	jal	x0,.L49
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
.Lpcrel_callmul_192:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_192)
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
	bltu	zero,a4,.+8
	jal	x0,.+8
	jal	x0,.+12
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
.Lpcrel_callmul_193:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_193)
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
.Lpcrel_callmul_194:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_194)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a3,a3,16
	srli	t0,s4,16
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
.Lpcrel_callmul_195:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_195)
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
	srli	t2,a0,16
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
.Lpcrel_callmul_196:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_196)
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
	srli	a3,a3,16
	srli	t0,s4,16
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
.Lpcrel_callmul_197:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_197)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s4,t1
	srli	t2,a0,16
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
.Lpcrel_callmul_198:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_198)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srli	t2,s4,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	srli	t3,a0,16
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
.Lpcrel_callmul_199:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_199)
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
.Lpcrel_callmul_200:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_200)
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
	bltu	zero,a0,.+8
	jal	x0,.+8
	jal	x0,.+12
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
	blt	zero,a0,.+8
	jal	x0,.L78
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
	beq	t1,zero,.L81
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
	slli	a7,a6,31
	srli	a1,a1,1
	sub	t0,x0,a7
	sub	a1,a1,t0
	and	a7,t4,a4
	slli	a0,a3,31
	and	t0,t3,a5
	srli	t2,a2,1
	srli	t6,a3,1
	sub	t5,x0,a1
	sub	a7,a7,t5
	srli	a6,a6,1
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
	srli	t0,a5,1
	slli	a0,a5,31
	srli	t2,a4,1
	sub	a4,x0,t6
	sub	t6,s0,a4
	beq	t5,zero,.+8
	jal	x0,.L82
	addi	t1,t1,-1
	sub	a4,x0,a0
	sub	a4,t2,a4
	addi	a5,t0,0
	beq	t1,zero,.+8
	jal	x0,.L72
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
	beq	s2,s1,.+8
	jal	x0,.L73
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
	beq	a1,zero,.L89
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
	beq	t3,zero,.L92
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
	slli	a5,t5,31
	srli	t3,t3,1
	sub	t0,x0,a5
	sub	t3,t3,t0
	slli	a1,t2,31
	slli	a5,a2,31
	srli	t4,a4,1
	srli	t0,a2,1
	srli	a2,t1,1
	sub	t1,x0,a1
	sub	t1,a2,t1
	sub	t6,x0,a5
	sub	t4,t4,t6
	and	t6,s3,a6
	srli	a5,t2,1
	and	a4,s4,a7
	addi	t2,a5,0
	sub	a1,x0,t3
	sub	t6,t6,a1
	srli	t5,t5,1
	sub	a5,x0,a0
	sub	a5,t1,a5
	addi	a3,x0,1
	and	a3,a6,a3
	sub	a1,x0,t5
	sub	t5,a4,a1
	srli	s6,a7,1
	slli	s8,a7,31
	srli	s7,a6,1
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
	beq	a3,zero,.+8
	jal	x0,.+8
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
	beq	t3,zero,.+8
	jal	x0,.L88
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
	beq	a3,x0,.Mul_skip
	sub	t0,x0,a0
	sub	a0,a2,t0
.Mul_skip:
	srli	a1,a1,1
	slli	a2,a2,1
	beq	a1,x0,.+8
	jal	x0,.Mul_loop
	jalr	x0,ra,0

.text
.align 2

# Signed 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_divsi3
__riscv_div_lib_divsi3:
	blt	a0,zero,__riscv_div_lib_L10
	blt	a1,zero,.+8
	jal	x0,.+8
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
	blt	zero,a2,.+8
	jal	x0,__riscv_div_lib_L2
	slli	a2,a2,1
	slli	a3,a3,1
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
	srli	a3,a3,1
	srli	a2,a2,1
	beq	a3,zero,.+8
	jal	x0,__riscv_div_lib_L3
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
	blt	zero,a1,__riscv_div_lib_L12
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
	blt	a1,zero,__riscv_div_lib_L31
	blt	a0,zero,__riscv_div_lib_L32
__riscv_div_lib_L30:
.Lpcrel_div3:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div3)
	addi	a0,a1,0
	jalr	zero,t0,0
__riscv_div_lib_L31:
	sub	a1,zero,a1
	blt	a0,zero,.+8
	jal	x0,__riscv_div_lib_L30
__riscv_div_lib_L32:
	sub	a0,zero,a0
.Lpcrel_div4:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div4)
	sub	a0,zero,a1
	jalr	zero,t0,0

# end of subrountine