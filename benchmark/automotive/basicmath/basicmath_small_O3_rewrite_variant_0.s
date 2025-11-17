	.file	"basicmath_small.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	my_cos, @function
my_cos:
	addi	a3,zero,637
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a1, a3, x0
.Lpcrel_callmul_1:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	a1,67109
	addi	a1,a1,-557
	addi	a4,zero,-1571
	addi	t3,zero,-167
	lui	a7,274878
	addi	a7,a7,-381
	addi	t1,zero,1
	lui	a5,16
	addi	a5,a5,-1
	and	a5,a3,a5
	srai	t0,a1,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, t0, x0
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
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a3,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a1,t2
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
	srli	t0,t0,16
	srai	t2,a3,16
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a1,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t4, x0
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
	sub	t2,x0,t2
	sub	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	sub	t0,x0,t0
	sub	a5,a5,t0
	srai	a5,a5,16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a3,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a1,t2
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
	srai	t2,a3,16
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a1,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t4, x0
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
	sub	t2,x0,t2
	sub	t0,t0,t2
	srai	t0,t0,16
	srai	t2,a3,16
	srai	t4,a1,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t4, x0
.Lpcrel_callmul_7:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_7)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	a5,a5,t0
	srai	a3,a3,31
	srai	a5,a5,6
	sub	a5,a5,a3
	addi	a5,a5,500
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a1,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
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
	srli	t2,a5,16
	lui	t4,16
	addi	t4,t4,-1
	and	t2,t2,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a1,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t4, x0
.Lpcrel_callmul_9:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_9)
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
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a5,t4
	srli	t5,a1,16
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
.Lpcrel_callmul_10:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_10)
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
	sub	t2,t2,t4
	sub	t2,x0,t2
	sub	t0,t0,t2
	srli	t0,t0,16
	srli	t2,a5,16
	lui	t4,16
	addi	t4,t4,-1
	and	t2,t2,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a1,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t4, x0
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
	srli	t2,t2,16
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a5,t4
	srli	t5,a1,16
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
.Lpcrel_callmul_12:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_12)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t4,t4,16
	srli	t5,a5,16
	lui	a5,16
	addi	a5,a5,-1
	and	a5,t5,a5
	srli	t5,a1,16
	lui	t6,16
	addi	t6,t6,-1
	and	t5,t5,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, t5, x0
.Lpcrel_callmul_13:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_13)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a5,x0,a5
	sub	a5,t4,a5
	sub	a5,x0,a5
	sub	a5,t2,a5
	sub	a5,x0,a5
	sub	a5,t0,a5
	srli	a5,a5,6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_callmul_14:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_14)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t0,x0,3
	and	a5,t0,a5
	sub	t0,x0,a4
	sub	a0,a0,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, a0, x0
.Lpcrel_callmul_15:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_15)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	a4,16
	addi	a4,a4,-1
	and	a4,a6,a4
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a1,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, t0, x0
.Lpcrel_callmul_16:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_16)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	a4,a4,16
	srli	t0,a6,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a1,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_17:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_17)
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
	srli	t4,a1,16
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
.Lpcrel_callmul_18:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_18)
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
	sub	a4,a4,t0
	srli	a4,a4,16
	srli	t0,a6,16
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a1,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_19:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_19)
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
	srli	t4,a1,16
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
	srli	t2,t2,16
	srli	t4,a6,16
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	srli	t5,a1,16
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
.Lpcrel_callmul_21:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_21)
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
	sub	a4,a4,t0
	srli	a4,a4,6
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, a4, x0
.Lpcrel_callmul_22:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_22)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, t3, x0
.Lpcrel_callmul_23:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_23)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	a3,16
	addi	a3,a3,-1
	and	a3,a2,a3
	srai	t0,a7,16
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, t0, x0
.Lpcrel_callmul_24:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_24)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a2,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a7,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_25:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_25)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t2,a2,16
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a7,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_26:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_26)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	sub	t0,x0,t0
	sub	a3,a3,t0
	srai	a3,a3,16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a2,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a7,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_27:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_27)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t2,a2,16
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a7,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_28:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_28)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	srai	t0,t0,16
	srai	t2,a2,16
	srai	t3,a7,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_29:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_29)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	a3,a3,t0
	srai	a2,a2,31
	srai	a3,a3,18
	sub	a3,a3,a2
	sub	a3,x0,a3
	sub	a3,a0,a3
	bne	a5,t1,.+8
	jal	x0,.L2
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a4, x0
	add	a1, a4, x0
.Lpcrel_callmul_30:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_30)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	t1,zero,42
	srai	a4,a6,31
	addi	a2,zero,2
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, t1, x0
.Lpcrel_callmul_31:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_31)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a6,t0
	srai	t1,a1,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_32:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_32)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a6,t1
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a1,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_33:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_33)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srai	t2,a6,16
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a1,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
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
	sub	t2,x0,t2
	sub	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	srai	t0,t0,16
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a6,t1
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a1,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_35:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_35)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srai	t2,a6,16
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a1,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_36:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_36)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	srai	t1,t1,16
	srai	t2,a6,16
	srai	a6,a1,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, a6, x0
.Lpcrel_callmul_37:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_37)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a6,x0,a6
	sub	a6,t1,a6
	sub	a6,x0,a6
	sub	a6,t0,a6
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a0,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a7,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_38:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_38)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t1,a0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a7,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_39:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_39)
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
	and	t2,a0,t2
	srli	t3,a7,16
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
.Lpcrel_callmul_40:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_40)
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
	srli	t1,a0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a7,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_41:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_41)
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
	and	t2,a0,t2
	srli	t3,a7,16
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
.Lpcrel_callmul_42:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_42)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srli	t3,a0,16
	lui	a0,16
	addi	a0,a0,-1
	and	a0,t3,a0
	srli	t3,a7,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, t3, x0
.Lpcrel_callmul_43:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_43)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a0,x0,a0
	sub	a0,t2,a0
	sub	a0,x0,a0
	sub	a0,t1,a0
	sub	a0,x0,a0
	sub	a0,t0,a0
	srai	a6,a6,7
	sub	a4,a4,a6
	addi	a4,a4,1000
	srli	a0,a0,18
	sub	a0,x0,a0
	sub	a0,a4,a0
	bne	a5,a2,.+8
	jal	x0,.L3
	bne	a5,zero,.+8
	jal	x0,.L1
	addi	a0,a3,0
	jalr	zero,ra,0
.L3:
	sub	a0,zero,a0
.L1:
	jalr	zero,ra,0
.L2:
	sub	a0,zero,a3
	jalr	zero,ra,0
	.size	my_cos, .-my_cos
	.align	2
	.type	SolveCubic, @function
SolveCubic:
	addi	sp,sp,-48
	addi	a7,zero,1000
	sw	s0,40(sp)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a7, x0
.Lpcrel_callmul_44:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_44)
	add	s0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sw	s9,4(sp)
	addi	s9,a5,0
	lui	t1,67109
	addi	t1,t1,-557
	sw	s2,32(sp)
	lui	t5,233017
	addi	t5,t5,-455
	sw	s8,8(sp)
	addi	s8,a4,0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a1, a0, x0
	add	a0, s0, x0
.Lpcrel_calldiv_45:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_45)
	add	s0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	lui	a6,310689
	addi	a6,a6,759
	sw	ra,44(sp)
	addi	a1,zero,999
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, a7, x0
.Lpcrel_callmul_46:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_46)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a1, a0, x0
	add	a0, a2, x0
.Lpcrel_calldiv_47:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_47)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, a7, x0
.Lpcrel_callmul_48:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_48)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	slli	s2,a2,2
	sub	s2,a2,s2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s0, x0
	add	a1, s0, x0
.Lpcrel_callmul_49:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_49)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	sp, sp, -32
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a1, a0, x0
	add	a0, a3, x0
.Lpcrel_calldiv_50:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_50)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,t1,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_51:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_51)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t2,a5,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t1,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_52:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_52)
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
	and	t3,a5,t3
	srli	t4,t1,16
	lui	t6,16
	addi	t6,t6,-1
	and	t4,t4,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_53:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_53)
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
	srli	t2,a5,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t1,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_54:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_54)
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
	and	t3,a5,t3
	srli	t4,t1,16
	lui	t6,16
	addi	t6,t6,-1
	and	t4,t4,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_55:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_55)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t3,t3,16
	srli	t4,a5,16
	lui	a5,16
	addi	a5,a5,-1
	and	a5,t4,a5
	srli	t4,t1,16
	lui	t6,16
	addi	t6,t6,-1
	and	t4,t4,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, t4, x0
.Lpcrel_callmul_56:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_56)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a5,x0,a5
	sub	a5,t3,a5
	sub	a5,x0,a5
	sub	a5,t2,a5
	sub	a5,x0,a5
	sub	a5,t0,a5
	slli	t3,a0,3
	sub	t3,t3,a0
	slli	t3,t3,2
	sub	t3,t3,a0
	srli	a5,a5,6
	sub	s2,x0,s2
	sub	s2,a5,s2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, s0, x0
.Lpcrel_callmul_57:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_57)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srai	t4,s2,31
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, s0, x0
	add	a1, a2, x0
.Lpcrel_callmul_58:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_58)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s2,t0
	srai	t2,t5,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_59:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_59)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s2,t2
	lui	t6,16
	addi	t6,t6,-1
	and	t6,t5,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t6, x0
.Lpcrel_callmul_60:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_60)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srai	t6,s2,16
	lui	a0,16
	addi	a0,a0,-1
	and	a0,t5,a0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, t6, x0
.Lpcrel_callmul_61:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_61)
	add	t6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t6,x0,t6
	sub	t2,t2,t6
	lui	t6,16
	addi	t6,t6,-1
	and	t2,t2,t6
	sub	t2,x0,t2
	sub	t0,t0,t2
	srai	t0,t0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s2,t2
	lui	t6,16
	addi	t6,t6,-1
	and	t6,t5,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t6, x0
.Lpcrel_callmul_62:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_62)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srai	t6,s2,16
	lui	a0,16
	addi	a0,a0,-1
	and	a0,t5,a0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, t6, x0
.Lpcrel_callmul_63:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_63)
	add	t6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t6,x0,t6
	sub	t2,t2,t6
	srai	t2,t2,16
	srai	t6,s2,16
	srai	a0,t5,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, t6, x0
.Lpcrel_callmul_64:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_64)
	add	t5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t5,x0,t5
	sub	t5,t2,t5
	sub	t5,x0,t5
	sub	t5,t0,t5
	slli	a4,a2,3
	sub	a4,x0,a4
	sub	a4,a2,a4
	srai	a0,a4,31
	lui	a3,16
	addi	a3,a3,-1
	and	a3,a5,a3
	srai	t0,t1,16
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, t0, x0
.Lpcrel_callmul_65:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_65)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,t1,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_66:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_66)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t2,a5,16
	lui	t6,16
	addi	t6,t6,-1
	and	t6,t1,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t6, x0
.Lpcrel_callmul_67:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_67)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	sub	t0,x0,t0
	sub	a3,a3,t0
	srai	a3,a3,16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,t1,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_68:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_68)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t2,a5,16
	lui	t6,16
	addi	t6,t6,-1
	and	t6,t1,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t6, x0
.Lpcrel_callmul_69:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_69)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	srai	t0,t0,16
	srai	t2,a5,16
	srai	t6,t1,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t6, x0
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
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	a3,a3,t0
	srai	t5,t5,1
	sub	t5,t5,t4
	srai	a5,a5,31
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a4,t0
	srai	t2,t1,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_71:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_71)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a4,t2
	lui	t4,16
	addi	t4,t4,-1
	and	t4,t1,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t4, x0
.Lpcrel_callmul_72:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_72)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srai	t4,a4,16
	lui	t6,16
	addi	t6,t6,-1
	and	t6,t1,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t4, x0
	add	a1, t6, x0
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
	sub	t4,x0,t4
	sub	t2,t2,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t2,t2,t4
	sub	t2,x0,t2
	sub	t0,t0,t2
	srai	t0,t0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a4,t2
	lui	t4,16
	addi	t4,t4,-1
	and	t4,t1,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t4, x0
.Lpcrel_callmul_74:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_74)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srai	t4,a4,16
	lui	t6,16
	addi	t6,t6,-1
	and	t6,t1,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t4, x0
	add	a1, t6, x0
.Lpcrel_callmul_75:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_75)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t4,x0,t4
	sub	t2,t2,t4
	srai	t2,t2,16
	srai	t4,a4,16
	srai	a4,t1,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t4, x0
	add	a1, a4, x0
.Lpcrel_callmul_76:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_76)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a4,x0,a4
	sub	a4,t2,a4
	sub	a4,x0,a4
	sub	a4,t0,a4
	srai	a3,a3,5
	sub	a5,a3,a5
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, t5, x0
	add	a1, t5, x0
.Lpcrel_callmul_77:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_77)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srai	a4,a4,6
	sub	a0,a0,a4
	sub	a0,x0,a0
	sub	a0,a5,a0
	sub	a0,x0,a0
	sub	a0,t3,a0
	srai	a5,a0,31
	lui	a4,16
	addi	a4,a4,-1
	and	a4,a0,a4
	srai	t0,a6,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, t0, x0
.Lpcrel_callmul_78:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_78)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a0,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a6,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_79:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_79)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t2,a0,16
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a6,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_80:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_80)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	sub	t0,x0,t0
	sub	a4,a4,t0
	srai	a4,a4,16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a0,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a6,t2
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
	srai	t2,a0,16
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a6,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
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
	sub	t2,x0,t2
	sub	t0,t0,t2
	srai	t0,t0,16
	srai	t2,a0,16
	srai	t3,a6,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_83:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_83)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	a4,a4,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a3,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,t1,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_84:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_84)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t2,a3,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t1,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_85:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_85)
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
	and	t3,a3,t3
	srli	t4,t1,16
	lui	t6,16
	addi	t6,t6,-1
	and	t4,t4,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_86:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_86)
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
	srli	t2,a3,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t1,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_87:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_87)
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
	and	t3,a3,t3
	srli	t4,t1,16
	lui	t6,16
	addi	t6,t6,-1
	and	t4,t4,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_88:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_88)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t3,t3,16
	srli	t4,a3,16
	lui	a3,16
	addi	a3,a3,-1
	and	a3,t4,a3
	srli	t4,t1,16
	lui	t6,16
	addi	t6,t6,-1
	and	t4,t4,t6
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, t4, x0
.Lpcrel_callmul_89:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_89)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a3,x0,a3
	sub	a3,t3,a3
	sub	a3,x0,a3
	sub	a3,t2,a3
	sub	a3,x0,a3
	sub	a3,t0,a3
	srai	a4,a4,4
	sub	a4,a4,a5
	srli	a3,a3,6
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, t5, x0
.Lpcrel_callmul_90:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_90)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, a4, x0
.Lpcrel_callmul_91:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_91)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srai	a2,a3,31
	lui	a6,16
	addi	a6,a6,-1
	and	a6,a3,a6
	srai	t0,t1,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a6, x0
	add	a1, t0, x0
.Lpcrel_callmul_92:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_92)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a3,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,t1,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_93:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_93)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t2,a3,16
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t1,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_94:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_94)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	sub	t0,x0,t0
	sub	a6,a6,t0
	srai	a6,a6,16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a3,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,t1,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
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
	srli	t0,t0,16
	srai	t2,a3,16
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t1,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_96:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_96)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	srai	t0,t0,16
	srai	t2,a3,16
	srai	t3,t1,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_97:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_97)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	a6,a6,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t2,16
	addi	t2,t2,-1
	and	t2,t1,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_98:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_98)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t2,a5,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t1,t3
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
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a5,t3
	srli	t4,t1,16
	lui	t6,16
	addi	t6,t6,-1
	and	t4,t4,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_100:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_100)
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
	srli	t2,a5,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t3,t1,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_101:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_101)
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
	and	t3,a5,t3
	srli	t4,t1,16
	lui	t6,16
	addi	t6,t6,-1
	and	t4,t4,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_102:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_102)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t3,t3,16
	srli	t4,a5,16
	lui	a5,16
	addi	a5,a5,-1
	and	a5,t4,a5
	srli	t4,t1,16
	lui	t6,16
	addi	t6,t6,-1
	and	t4,t4,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, t4, x0
.Lpcrel_callmul_103:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_103)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a5,x0,a5
	sub	a5,t3,a5
	sub	a5,x0,a5
	sub	a5,t2,a5
	sub	a5,x0,a5
	sub	a5,t0,a5
	srai	a6,a6,6
	sub	a2,a2,a6
	srli	a5,a5,6
	sub	a5,x0,a5
	sub	a5,a2,a5
	blt	a1,a3,.L10
	blt	zero,a5,.+8
	jal	x0,.L52
.L12:
	addi	a3,zero,1
	sw	a3,0(s8)
	addi	a2,zero,1000
	addi	a3,a5,0
	blt	a5,a2,.L53
.L24:
	addi	a1,zero,1000
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
.Lpcrel_callmul_104:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_104)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srai	a6,a4,31
	and	a2,a4,a6
	sub	a2,a2,a6
	sub	a2,a4,a2
	and	t0,a4,a6
	sub	a2,a2,t0
	sub	a2,a2,a6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_105:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_105)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	a4,x0,a4
	sub	a4,a3,a4
	srai	a4,a4,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_106:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_106)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a4,a3
	srai	a3,a3,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_107:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_107)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	a4,x0,a4
	sub	a4,a3,a4
	srai	a4,a4,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_108:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_108)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a4,a3
	srai	a3,a3,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_109:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_109)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	a4,x0,a4
	sub	a4,a3,a4
	srai	a4,a4,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_110:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_110)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a4,a3
	srai	a3,a3,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_111:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_111)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	a4,x0,a4
	sub	a4,a3,a4
	srai	a4,a4,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_112:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_112)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a4,a3
	srai	a3,a3,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_113:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_113)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	a4,x0,a4
	sub	a4,a3,a4
	srai	a4,a4,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_114:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_114)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a4,a3
	srai	a3,a3,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_115:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_115)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	a4,x0,a4
	sub	a4,a3,a4
	srai	a4,a4,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_116:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_116)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	a5,x0,a5
	sub	a5,a4,a5
	srai	a5,a5,1
	sub	a2,x0,a2
	sub	a2,a5,a2
	bne	a2,zero,.+8
	jal	x0,.L25
	addi	a3,a2,0
	blt	a2,a1,.L54
.L26:
	addi	a5,zero,1000
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, a5, x0
.Lpcrel_callmul_117:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_117)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	a6,67109
	lui	a7,349525
	addi	a6,a6,-557
	addi	a7,a7,1366
	addi	a1,zero,18
.L28:
	slli	a4,a3,1
	addi	a1,a1,-1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a3, x0
	add	a1, a3, x0
.Lpcrel_callmul_118:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_118)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a6,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_119:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_119)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a6,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_120:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_120)
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
	and	t2,a5,t2
	srli	t3,a6,16
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
.Lpcrel_callmul_121:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_121)
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
	srli	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a6,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_122:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_122)
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
	and	t2,a5,t2
	srli	t3,a6,16
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
.Lpcrel_callmul_123:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_123)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srli	t3,a5,16
	lui	a5,16
	addi	a5,a5,-1
	and	a5,t3,a5
	srli	t3,a6,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, t3, x0
.Lpcrel_callmul_124:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_124)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a5,x0,a5
	sub	a5,t2,a5
	sub	a5,x0,a5
	sub	a5,t1,a5
	sub	a5,x0,a5
	sub	a5,t0,a5
	srli	a5,a5,6
	bne	a5,zero,.+8
	jal	x0,.L27
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a2, x0
	add	a1, a5, x0
.Lpcrel_calldiv_125:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_125)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	t0,x0,a4
	sub	a5,a5,t0
	lui	a3,16
	addi	a3,a3,-1
	and	a3,a5,a3
	srai	t0,a7,16
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, t0, x0
.Lpcrel_callmul_126:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_126)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a7,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_127:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_127)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a7,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_128:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_128)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	sub	t0,x0,t0
	sub	a3,a3,t0
	srai	a3,a3,16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a7,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_129:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_129)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a7,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_130:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_130)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	srai	t0,t0,16
	srai	t1,a5,16
	srai	t2,a7,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_131:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_131)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a3,a3,t0
	srai	a5,a5,31
	sub	a3,a3,a5
	bne	a1,zero,.L28
.L27:
	addi	a2,zero,0
	bne	a3,zero,.+8
	jal	x0,.L25
	addi	a5,zero,1000
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t5, x0
	add	a1, a5, x0
.Lpcrel_callmul_132:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_132)
	add	t5, a0, x0
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
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, t5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_133:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_133)
	add	t5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	a2,x0,t5
	sub	a2,a3,a2
.L25:
	addi	a4,zero,-53
	addi	a5,zero,-1000
	blt	a0,a4,.L55
.L29:
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, a5, x0
.Lpcrel_callmul_134:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_134)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	a5,67109
	addi	a5,a5,-557
	lui	a3,349525
	addi	a3,a3,1366
	srai	a4,s0,31
	lw	ra,44(sp)
	lw	s2,32(sp)
	lw	s8,8(sp)
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a2,t0
	srai	t1,a5,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_135:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_135)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a2,t1
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a5,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_136:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_136)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srai	t2,a2,16
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a5,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_137:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_137)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	srai	t0,t0,16
	lui	t1,16
	addi	t1,t1,-1
	and	t1,a2,t1
	lui	t2,16
	addi	t2,t2,-1
	and	t2,a5,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_138:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_138)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srai	t2,a2,16
	lui	t3,16
	addi	t3,t3,-1
	and	t3,a5,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_139:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_139)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	srai	t1,t1,16
	srai	t2,a2,16
	srai	t3,a5,16
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
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a5,x0,a5
	sub	a5,t1,a5
	sub	a5,x0,a5
	sub	a5,t0,a5
	srai	a2,a2,31
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s0,t0
	srai	t1,a3,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_141:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_141)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s0,t1
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
.Lpcrel_callmul_142:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_142)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srai	t2,s0,16
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
.Lpcrel_callmul_143:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_143)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	srai	t0,t0,16
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s0,t1
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
.Lpcrel_callmul_144:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_144)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srai	t2,s0,16
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
.Lpcrel_callmul_145:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_145)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	srai	t1,t1,16
	srai	t2,s0,16
	srai	s0,a3,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, s0, x0
.Lpcrel_callmul_146:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_146)
	add	s0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s0,x0,s0
	sub	s0,t1,s0
	sub	s0,x0,s0
	sub	s0,t0,s0
	srai	a5,a5,6
	sub	a5,a5,a2
	sub	a4,a4,s0
	lw	s0,40(sp)
	sub	t0,x0,a4
	sub	a5,a5,t0
	sw	a5,0(s9)
	lw	s9,4(sp)
	addi	sp,sp,48
	jalr	zero,ra,0
.L10:
	blt	zero,a5,.L12
	sw	s1,36(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sub	a1,zero,a2
	blt	a1,a7,.L56
.L13:
	addi	a5,zero,-1000
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a2, x0
	add	a1, a5, x0
.Lpcrel_callmul_147:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_147)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t6,zero,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
.Lpcrel_calldiv_148:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_148)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a1,a3
	srai	a3,a3,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_149:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_149)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a2,x0,a2
	sub	a2,a3,a2
	srai	a2,a2,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a2, x0
.Lpcrel_calldiv_150:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_150)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a2,a3
	srai	a3,a3,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_151:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_151)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a2,x0,a2
	sub	a2,a3,a2
	srai	a2,a2,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a2, x0
.Lpcrel_calldiv_152:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_152)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a2,a3
	srai	a3,a3,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_153:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_153)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a2,x0,a2
	sub	a2,a3,a2
	srai	a2,a2,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a2, x0
.Lpcrel_calldiv_154:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_154)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a2,a3
	srai	a3,a3,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_155:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_155)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a2,x0,a2
	sub	a2,a3,a2
	srai	a2,a2,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a2, x0
.Lpcrel_calldiv_156:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_156)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a2,a3
	srai	a3,a3,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_157:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_157)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a2,x0,a2
	sub	a2,a3,a2
	srai	a2,a2,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a2, x0
.Lpcrel_calldiv_158:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_158)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a2,a3
	srai	a3,a3,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_159:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_159)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	a5,x0,a5
	sub	a5,a3,a5
	blt	t6,a5,.+8
	jal	x0,.L11
	addi	t4,zero,1000
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, t4, x0
.Lpcrel_callmul_160:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_160)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srai	a5,a5,1
	addi	a4,zero,999
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, t4, x0
	add	a1, a5, x0
.Lpcrel_calldiv_161:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_161)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	blt	a4,t4,.L30
	sw	s6,16(sp)
	sw	s7,12(sp)
	addi	a5,zero,-999
	blt	t4,a5,.L32
	lui	t3,1
	lui	a0,67109
	lui	a7,274878
	addi	t3,t3,-954
	addi	a0,a0,-557
	addi	a7,a7,-381
	addi	a6,zero,60
	addi	t1,zero,0
	addi	a4,zero,637
	addi	t2,zero,-1571
	addi	t0,zero,-167
	addi	s1,zero,42
	addi	a5,zero,2
.L20:
	sub	a3,x0,t1
	sub	a3,t3,a3
	srli	a1,a3,31
	sub	a1,x0,a1
	sub	a1,a3,a1
	srai	a1,a1,1
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a4, x0
.Lpcrel_callmul_162:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_162)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	a3,16
	addi	a3,a3,-1
	and	a3,a2,a3
	srai	s3,a0,16
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, s3, x0
.Lpcrel_callmul_163:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_163)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	s3,16
	addi	s3,s3,-1
	and	s3,a2,s3
	lui	s4,16
	addi	s4,s4,-1
	and	s4,a0,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, s4, x0
.Lpcrel_callmul_164:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_164)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s3,s3,16
	srai	s4,a2,16
	lui	s5,16
	addi	s5,s5,-1
	and	s5,a0,s5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s4, x0
	add	a1, s5, x0
.Lpcrel_callmul_165:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_165)
	add	s4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s4,x0,s4
	sub	s3,s3,s4
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	sub	s3,x0,s3
	sub	a3,a3,s3
	srai	a3,a3,16
	lui	s3,16
	addi	s3,s3,-1
	and	s3,a2,s3
	lui	s4,16
	addi	s4,s4,-1
	and	s4,a0,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, s4, x0
.Lpcrel_callmul_166:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_166)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s3,s3,16
	srai	s4,a2,16
	lui	s5,16
	addi	s5,s5,-1
	and	s5,a0,s5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s4, x0
	add	a1, s5, x0
.Lpcrel_callmul_167:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_167)
	add	s4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s4,x0,s4
	sub	s3,s3,s4
	srai	s3,s3,16
	srai	s4,a2,16
	srai	s5,a0,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s4, x0
	add	a1, s5, x0
.Lpcrel_callmul_168:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_168)
	add	s4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s4,x0,s4
	sub	s3,s3,s4
	sub	s3,x0,s3
	sub	a3,a3,s3
	srai	a2,a2,31
	srai	a3,a3,6
	sub	a3,a3,a2
	addi	a3,a3,500
	lui	a2,16
	addi	a2,a2,-1
	and	a2,a3,a2
	lui	s3,16
	addi	s3,s3,-1
	and	s3,a0,s3
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, s3, x0
.Lpcrel_callmul_169:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_169)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a2,a2,16
	srli	s3,a3,16
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	lui	s4,16
	addi	s4,s4,-1
	and	s4,a0,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, s4, x0
.Lpcrel_callmul_170:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_170)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	lui	s4,16
	addi	s4,s4,-1
	and	s4,a3,s4
	srli	s5,a0,16
	lui	s6,16
	addi	s6,s6,-1
	and	s5,s5,s6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s4, x0
	add	a1, s5, x0
.Lpcrel_callmul_171:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_171)
	add	s4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	s5,16
	addi	s5,s5,-1
	and	s4,s4,s5
	sub	s4,x0,s4
	sub	s3,s3,s4
	sub	s3,x0,s3
	sub	a2,a2,s3
	srli	a2,a2,16
	srli	s3,a3,16
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	lui	s4,16
	addi	s4,s4,-1
	and	s4,a0,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, s4, x0
.Lpcrel_callmul_172:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_172)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s3,s3,16
	lui	s4,16
	addi	s4,s4,-1
	and	s4,a3,s4
	srli	s5,a0,16
	lui	s6,16
	addi	s6,s6,-1
	and	s5,s5,s6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s4, x0
	add	a1, s5, x0
.Lpcrel_callmul_173:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_173)
	add	s4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s4,s4,16
	srli	s5,a3,16
	lui	a3,16
	addi	a3,a3,-1
	and	a3,s5,a3
	srli	s5,a0,16
	lui	s6,16
	addi	s6,s6,-1
	and	s5,s5,s6
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, s5, x0
.Lpcrel_callmul_174:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_174)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a3,x0,a3
	sub	a3,s4,a3
	sub	a3,x0,a3
	sub	a3,s3,a3
	sub	a3,x0,a3
	sub	a3,a2,a3
	srli	a3,a3,6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a3, x0
	add	a1, t2, x0
.Lpcrel_callmul_175:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_175)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	a2,x0,3
	and	a3,a3,a2
	sub	s3,x0,s3
	sub	s3,a1,s3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, s3, x0
.Lpcrel_callmul_176:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_176)
	add	s6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	lui	a2,16
	addi	a2,a2,-1
	and	a2,s6,a2
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a0,s2
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, s2, x0
.Lpcrel_callmul_177:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_177)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a2,a2,16
	srli	s2,s6,16
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	lui	s3,16
	addi	s3,s3,-1
	and	s3,a0,s3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s2, x0
	add	a1, s3, x0
.Lpcrel_callmul_178:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_178)
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
	lui	s3,16
	addi	s3,s3,-1
	and	s3,s6,s3
	srli	s4,a0,16
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
.Lpcrel_callmul_179:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_179)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	sub	s3,x0,s3
	sub	s2,s2,s3
	sub	s2,x0,s2
	sub	a2,a2,s2
	srli	a2,a2,16
	srli	s2,s6,16
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	lui	s3,16
	addi	s3,s3,-1
	and	s3,a0,s3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s2, x0
	add	a1, s3, x0
.Lpcrel_callmul_180:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_180)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s2,s2,16
	lui	s3,16
	addi	s3,s3,-1
	and	s3,s6,s3
	srli	s4,a0,16
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
.Lpcrel_callmul_181:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_181)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s3,s3,16
	srli	s4,s6,16
	lui	s5,16
	addi	s5,s5,-1
	and	s4,s4,s5
	srli	s5,a0,16
	lui	s7,16
	addi	s7,s7,-1
	and	s5,s5,s7
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s4, x0
	add	a1, s5, x0
.Lpcrel_callmul_182:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_182)
	add	s4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s4,x0,s4
	sub	s3,s3,s4
	sub	s3,x0,s3
	sub	s2,s2,s3
	sub	s2,x0,s2
	sub	a2,a2,s2
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	srai	s5,s6,31
	srli	a2,a2,6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, a2, x0
.Lpcrel_callmul_183:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_183)
	add	s4, a0, x0
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
	add	a0, s4, x0
	add	a1, t0, x0
.Lpcrel_callmul_184:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_184)
	add	s4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	sw	s5,8(sp)
	lui	s7,16
	addi	s7,s7,-1
	and	s7,s4,s7
	srai	s2,a7,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s7, x0
	add	a1, s2, x0
.Lpcrel_callmul_185:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_185)
	add	s7, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	s2,16
	addi	s2,s2,-1
	and	s2,s4,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s3,a7,s3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s2, x0
	add	a1, s3, x0
.Lpcrel_callmul_186:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_186)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s2,s2,16
	srai	s3,s4,16
	lui	s5,16
	addi	s5,s5,-1
	and	s5,a7,s5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, s5, x0
.Lpcrel_callmul_187:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_187)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s3,x0,s3
	sub	s2,s2,s3
	lui	s3,16
	addi	s3,s3,-1
	and	s2,s2,s3
	sub	s2,x0,s2
	sub	s7,s7,s2
	srai	s7,s7,16
	lui	s2,16
	addi	s2,s2,-1
	and	s2,s4,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s3,a7,s3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s2, x0
	add	a1, s3, x0
.Lpcrel_callmul_188:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_188)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s2,s2,16
	srai	s3,s4,16
	lui	s5,16
	addi	s5,s5,-1
	and	s5,a7,s5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, s5, x0
.Lpcrel_callmul_189:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_189)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s3,x0,s3
	sub	s2,s2,s3
	srai	s2,s2,16
	srai	s3,s4,16
	srai	s5,a7,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, s5, x0
.Lpcrel_callmul_190:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_190)
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
	sub	s7,s7,s2
	lw	s2,0(sp)
	lw	s3,4(sp)
	lw	s5,8(sp)
	addi	sp,sp,16
	srai	s4,s4,31
	srai	s7,s7,18
	sub	s4,s7,s4
	addi	sp,sp,-16
	sw	s2,0(sp)
	sub	s2,x0,s4
	sub	s3,s3,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	sub	s4,zero,s3
	bne	a3,t6,.+8
	jal	x0,.L18
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, a2, x0
.Lpcrel_callmul_191:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_191)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, s1, x0
.Lpcrel_callmul_192:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_192)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	sw	s5,8(sp)
	lui	s2,16
	addi	s2,s2,-1
	and	s2,s6,s2
	srai	s3,a0,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s2, x0
	add	a1, s3, x0
.Lpcrel_callmul_193:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_193)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	s3,16
	addi	s3,s3,-1
	and	s3,s6,s3
	lui	s4,16
	addi	s4,s4,-1
	and	s4,a0,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, s4, x0
.Lpcrel_callmul_194:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_194)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s3,s3,16
	srai	s4,s6,16
	lui	s5,16
	addi	s5,s5,-1
	and	s5,a0,s5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s4, x0
	add	a1, s5, x0
.Lpcrel_callmul_195:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_195)
	add	s4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s4,x0,s4
	sub	s3,s3,s4
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	sub	s3,x0,s3
	sub	s2,s2,s3
	srai	s2,s2,16
	lui	s3,16
	addi	s3,s3,-1
	and	s3,s6,s3
	lui	s4,16
	addi	s4,s4,-1
	and	s4,a0,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, s4, x0
.Lpcrel_callmul_196:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_196)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s3,s3,16
	srai	s4,s6,16
	lui	s5,16
	addi	s5,s5,-1
	and	s5,a0,s5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s4, x0
	add	a1, s5, x0
.Lpcrel_callmul_197:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_197)
	add	s4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s4,x0,s4
	sub	s3,s3,s4
	srai	s3,s3,16
	srai	s4,s6,16
	srai	s6,a0,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s4, x0
	add	a1, s6, x0
.Lpcrel_callmul_198:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_198)
	add	s6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s6,x0,s6
	sub	s6,s3,s6
	sub	s6,x0,s6
	sub	s6,s2,s6
	lw	s2,0(sp)
	lw	s3,4(sp)
	lw	s5,8(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	sw	s5,8(sp)
	sw	s6,12(sp)
	lui	s2,16
	addi	s2,s2,-1
	and	s2,a2,s2
	lui	s3,16
	addi	s3,s3,-1
	and	s3,a7,s3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s2, x0
	add	a1, s3, x0
.Lpcrel_callmul_199:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_199)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s2,s2,16
	srli	s3,a2,16
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	lui	s4,16
	addi	s4,s4,-1
	and	s4,a7,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, s4, x0
.Lpcrel_callmul_200:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_200)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	lui	s4,16
	addi	s4,s4,-1
	and	s4,a2,s4
	srli	s5,a7,16
	lui	s6,16
	addi	s6,s6,-1
	and	s5,s5,s6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s4, x0
	add	a1, s5, x0
.Lpcrel_callmul_201:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_201)
	add	s4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	s5,16
	addi	s5,s5,-1
	and	s4,s4,s5
	sub	s4,x0,s4
	sub	s3,s3,s4
	sub	s3,x0,s3
	sub	s2,s2,s3
	srli	s2,s2,16
	srli	s3,a2,16
	lui	s4,16
	addi	s4,s4,-1
	and	s3,s3,s4
	lui	s4,16
	addi	s4,s4,-1
	and	s4,a7,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, s4, x0
.Lpcrel_callmul_202:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_202)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s3,s3,16
	lui	s4,16
	addi	s4,s4,-1
	and	s4,a2,s4
	srli	s5,a7,16
	lui	s6,16
	addi	s6,s6,-1
	and	s5,s5,s6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s4, x0
	add	a1, s5, x0
.Lpcrel_callmul_203:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_203)
	add	s4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s4,s4,16
	srli	s5,a2,16
	lui	a2,16
	addi	a2,a2,-1
	and	a2,s5,a2
	srli	s5,a7,16
	lui	s6,16
	addi	s6,s6,-1
	and	s5,s5,s6
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, s5, x0
.Lpcrel_callmul_204:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_204)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a2,x0,a2
	sub	a2,s4,a2
	sub	a2,x0,a2
	sub	a2,s3,a2
	sub	a2,x0,a2
	sub	a2,s2,a2
	lw	s2,0(sp)
	lw	s3,4(sp)
	lw	s5,8(sp)
	lw	s6,12(sp)
	addi	sp,sp,16
	srai	s6,s6,7
	sub	s5,s5,s6
	addi	s5,s5,1000
	srli	a2,a2,18
	sub	s4,x0,a2
	sub	s4,s5,s4
	bne	a3,a5,.+8
	jal	x0,.L17
	bne	a3,zero,.+8
	jal	x0,.L18
	addi	s4,s3,0
.L18:
	blt	t4,s4,.+8
	jal	x0,.L33
	addi	t1,a1,0
.L19:
	addi	a6,a6,-1
	bne	a6,zero,.L20
	sub	t1,x0,t1
	sub	t1,t3,t1
	srli	s3,t1,31
	sub	s3,x0,s3
	sub	s3,t1,s3
	lui	a5,2
	lui	a2,3
	srai	s3,s3,1
	addi	a2,a2,280
	addi	a5,a5,-1908
	lui	a4,349525
	lui	a3,174763
	sub	t0,x0,s3
	sub	a5,a5,t0
	addi	a4,a4,1366
	sub	s3,x0,s3
	sub	s3,a2,s3
	addi	a3,a3,-1365
	lui	s1,16
	addi	s1,s1,-1
	and	s1,a5,s1
	srai	t0,a4,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s1, x0
	add	a1, t0, x0
.Lpcrel_callmul_205:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_205)
	add	s1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
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
.Lpcrel_callmul_206:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_206)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t2,a5,16
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
.Lpcrel_callmul_207:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_207)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t0,t0,t2
	sub	t0,x0,t0
	sub	s1,s1,t0
	srai	s1,s1,16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
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
.Lpcrel_callmul_208:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_208)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t2,a5,16
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
.Lpcrel_callmul_209:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_209)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	srai	t0,t0,16
	srai	t2,a5,16
	srai	t3,a4,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_210:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_210)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	s1,s1,t0
	srai	a1,s3,31
	srai	a2,t1,31
	lw	s6,16(sp)
	lw	s7,12(sp)
	srai	a5,a5,31
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s3,t0
	srai	t2,a4,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_211:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_211)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s3,t2
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
.Lpcrel_callmul_212:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_212)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srai	t3,s3,16
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a4,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_213:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_213)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t3,x0,t3
	sub	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	sub	t2,x0,t2
	sub	t0,t0,t2
	srai	t0,t0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s3,t2
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
.Lpcrel_callmul_214:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_214)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srai	t3,s3,16
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a4,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_215:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_215)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t3,x0,t3
	sub	t2,t2,t3
	srai	t2,t2,16
	srai	t3,s3,16
	srai	s3,a4,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, s3, x0
.Lpcrel_callmul_216:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_216)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s3,x0,s3
	sub	s3,t2,s3
	sub	s3,x0,s3
	sub	s3,t0,s3
	sub	s1,s1,a5
	lui	t0,16
	addi	t0,t0,-1
	and	t0,t1,t0
	srai	t2,a3,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_217:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_217)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t2,16
	addi	t2,t2,-1
	and	t2,t1,t2
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
.Lpcrel_callmul_218:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_218)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srai	t3,t1,16
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a3,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_219:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_219)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t3,x0,t3
	sub	t2,t2,t3
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	sub	t2,x0,t2
	sub	t0,t0,t2
	srai	t0,t0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,t1,t2
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
.Lpcrel_callmul_220:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_220)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srai	t3,t1,16
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a3,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t4, x0
.Lpcrel_callmul_221:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_221)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t3,x0,t3
	sub	t2,t2,t3
	srai	t2,t2,16
	srai	t3,t1,16
	srai	t1,a3,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t1, x0
.Lpcrel_callmul_222:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_222)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t1,t2,t1
	sub	t1,x0,t1
	sub	t1,t0,t1
	sub	s3,s3,a1
	sub	a0,t1,a2
.L14:
	addi	a5,zero,3
	sw	a5,0(s8)
	addi	a5,zero,8
	addi	s4,zero,0
	blt	a5,s2,.+8
	jal	x0,.L21
	addi	a5,zero,1000
	addi	a3,t5,0
	blt	t5,a5,.+8
	jal	x0,.L22
	addi	a3,a5,0
.L22:
	addi	a5,zero,1000
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t5, x0
	add	a1, a5, x0
.Lpcrel_callmul_223:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_223)
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
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_224:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_224)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	a4,x0,a4
	sub	a4,a3,a4
	srai	a4,a4,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_225:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_225)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a4,a3
	srai	a3,a3,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_226:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_226)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	a4,x0,a4
	sub	a4,a3,a4
	srai	a4,a4,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_227:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_227)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a4,a3
	srai	a3,a3,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_228:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_228)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	a4,x0,a4
	sub	a4,a3,a4
	srai	a4,a4,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_229:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_229)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a4,a3
	srai	a3,a3,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_230:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_230)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	a4,x0,a4
	sub	a4,a3,a4
	srai	a4,a4,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_231:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_231)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a4,a3
	srai	a3,a3,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_232:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_232)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	a4,x0,a4
	sub	a4,a3,a4
	srai	a4,a4,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_233:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_233)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a3
	sub	a3,a4,a3
	srai	a3,a3,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_234:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_234)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	a4,x0,a4
	sub	a4,a3,a4
	srai	a4,a4,1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_235:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_235)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	a5,x0,a5
	sub	a5,a4,a5
	addi	t0,x0,-2
	and	a5,a5,t0
	sub	s4,zero,a5
.L21:
	lui	s5,349525
	addi	s5,s5,1366
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s0,t0
	srai	t1,s5,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_236:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_236)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s0,t1
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
.Lpcrel_callmul_237:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_237)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srai	t2,s0,16
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
.Lpcrel_callmul_238:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_238)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	srai	t0,t0,16
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s0,t1
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
.Lpcrel_callmul_239:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_239)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srai	t2,s0,16
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
.Lpcrel_callmul_240:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_240)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	srai	t1,t1,16
	srai	t2,s0,16
	srai	t3,s5,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_241:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_241)
	add	s5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s5,x0,s5
	sub	s5,t1,s5
	sub	s5,x0,s5
	sub	s5,t0,s5
.Lpcrel_1:
	auipc	ra,%pcrel_hi(my_cos)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
	srai	s0,s0,31
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, s4, x0
.Lpcrel_callmul_242:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_242)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s5,s5,s0
	lui	s0,67109
	addi	s0,s0,-557
	addi	a0,s1,0
	lui	a5,16
	addi	a5,a5,-1
	and	a5,a4,a5
	srai	t0,s0,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, t0, x0
.Lpcrel_callmul_243:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_243)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a4,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s0,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_244:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_244)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a4,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s0,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_245:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_245)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	sub	t0,x0,t0
	sub	a5,a5,t0
	srai	a5,a5,16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a4,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s0,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_246:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_246)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a4,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s0,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_247:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_247)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	srai	t0,t0,16
	srai	t1,a4,16
	srai	t2,s0,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_248:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_248)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a5,a5,t0
	srai	a4,a4,31
	srai	a5,a5,6
	sub	a5,a5,a4
	sub	a5,a5,s5
	sw	a5,0(s9)
.Lpcrel_2:
	auipc	ra,%pcrel_hi(my_cos)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_2)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, s4, x0
.Lpcrel_callmul_249:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_249)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	a0,s3,0
	lui	a5,16
	addi	a5,a5,-1
	and	a5,a4,a5
	srai	t0,s0,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, t0, x0
.Lpcrel_callmul_250:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_250)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a4,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s0,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_251:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_251)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a4,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s0,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_252:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_252)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	sub	t0,x0,t0
	sub	a5,a5,t0
	srai	a5,a5,16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a4,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s0,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_253:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_253)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a4,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s0,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_254:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_254)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	srai	t0,t0,16
	srai	t1,a4,16
	srai	t2,s0,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_255:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_255)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a5,a5,t0
	srai	a4,a4,31
	srai	a5,a5,6
	sub	a5,a5,a4
	sub	a5,a5,s5
	sw	a5,4(s9)
.Lpcrel_3:
	auipc	ra,%pcrel_hi(my_cos)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_3)
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, s4, x0
.Lpcrel_callmul_256:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_256)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lw	ra,44(sp)
	lw	s1,36(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s2,32(sp)
	lw	s8,8(sp)
	lui	a5,16
	addi	a5,a5,-1
	and	a5,a0,a5
	srai	t0,s0,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, t0, x0
.Lpcrel_callmul_257:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_257)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a0,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s0,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_258:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_258)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s0,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_259:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_259)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	sub	t0,x0,t0
	sub	a5,a5,t0
	srai	a5,a5,16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a0,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s0,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_260:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_260)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a0,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s0,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_261:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_261)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	srai	t0,t0,16
	srai	t1,a0,16
	srai	t2,s0,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_262:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_262)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a5,a5,t0
	srai	a0,a0,31
	lw	s0,40(sp)
	srai	a5,a5,6
	sub	a5,a5,a0
	sub	a5,a5,s5
	sw	a5,8(s9)
	lw	s5,20(sp)
	lw	s9,4(sp)
	addi	sp,sp,48
	jalr	zero,ra,0
.L53:
	addi	a3,a2,0
	jal	x0,.L24
.L55:
	addi	a5,zero,1000
	jal	x0,.L29
.L52:
	sw	s1,36(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
.L11:
	addi	a5,zero,-53
	lui	s3,1
	blt	a0,a5,.L57
	lui	s1,1
	addi	s3,s3,93
	addi	s1,s1,-2002
	addi	a0,zero,0
	jal	x0,.L14
.L54:
	addi	a3,a1,0
	jal	x0,.L26
.L30:
	lui	s3,1
	lui	s1,1
	addi	s3,s1,93
	addi	s1,s1,-2002
	addi	a0,zero,0
	jal	x0,.L14
.L56:
	addi	a1,a7,0
	jal	x0,.L13
.L57:
	lui	s1,1
	addi	s3,s3,1140
	addi	s1,s1,-954
	addi	a0,zero,1047
	jal	x0,.L14
.L33:
	addi	t3,a1,0
	jal	x0,.L19
.L17:
	sub	s4,zero,s4
	jal	x0,.L18
.L32:
	lui	s3,1
	lui	s1,1
	lw	s6,16(sp)
	lw	s7,12(sp)
	addi	s3,s1,1140
	addi	s1,s1,-954
	addi	a0,zero,1047
	jal	x0,.L14
	.size	SolveCubic, .-SolveCubic
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"********* CUBIC FUNCTIONS ***********"
	.align	2
.LC1:
	.string	"Solutions:"
	.align	2
.LC2:
	.string	" %ld.%03ld"
	.align	2
.LC3:
	.string	"********* INTEGER SQR ROOTS ***********"
	.align	2
.LC4:
	.string	"sqrt(%3d) = %2d\n"
	.align	2
.LC5:
	.string	"\nsqrt(%lX) = %X\n"
	.align	2
.LC6:
	.string	"********* ANGLE CONVERSION ***********"
	.align	2
.LC7:
	.string	"%3ld degrees = %ld.%03ld radians\n"
	.align	2
.LC8:
	.string	"%ld.%03ld radians = %3ld degrees\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lui	a0,%hi(.LC0)
	addi	sp,sp,-96
	addi	a0,a0,%lo(.LC0)
	sw	ra,92(sp)
	sw	s0,88(sp)
	sw	s5,68(sp)
	sw	s1,84(sp)
	sw	s2,80(sp)
	sw	s3,76(sp)
	sw	s4,72(sp)
	sw	s6,64(sp)
	sw	s7,60(sp)
	sw	s8,56(sp)
	sw	s9,52(sp)
	sw	s10,48(sp)
	sw	s11,44(sp)
.Lpcrel_4:
	auipc	ra,%pcrel_hi(puts)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_4)
	lui	a3,1048569
	lui	a2,8
	lui	a1,1048573
	addi	a5,sp,20
	addi	a4,sp,16
	addi	a3,a3,-1328
	addi	a2,a2,-768
	addi	a1,a1,1788
	addi	a0,zero,1000
.Lpcrel_5:
	auipc	ra,%pcrel_hi(SolveCubic)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_5)
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
.Lpcrel_6:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_6)
	lw	s5,16(sp)
	addi	s0,zero,0
	blt	zero,s5,.+8
	jal	x0,.L59
	lui	a5,%hi(.LC2)
	lui	s4,67109
	addi	s1,a5,%lo(.LC2)
	addi	s4,s4,-557
	addi	s3,sp,20
	addi	s2,zero,0
	addi	s6,zero,1000
.L60:
	lw	a5,0(s3)
	addi	a0,s1,0
	addi	s2,s2,1
	lui	a1,16
	addi	a1,a1,-1
	and	a1,a5,a1
	srai	t0,s4,16
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t0, x0
.Lpcrel_callmul_263:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_263)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s4,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_264:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_264)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_265:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_265)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	sub	t0,x0,t0
	sub	a1,a1,t0
	srai	a1,a1,16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s4,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_266:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_266)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_267:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_267)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	srai	t0,t0,16
	srai	t1,a5,16
	srai	t2,s4,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_268:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_268)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a1,a1,t0
	srai	a4,a5,31
	sub	s0,x0,s0
	sub	s0,a5,s0
	addi	s3,s3,4
	srai	a1,a1,6
	sub	a1,a1,a4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s6, x0
.Lpcrel_callmul_269:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_269)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a5,a5,a4
	srai	a2,a5,31
	and	t0,a5,a2
	sub	t0,t0,a2
	sub	t0,a5,t0
	and	a5,a5,a2
	sub	a5,t0,a5
	sub	a2,a5,a2
.Lpcrel_7:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_7)
	bne	s2,s5,.L60
.L59:
	addi	a0,zero,10
.Lpcrel_8:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_8)
	lui	a3,1048569
	lui	a2,4
	lui	a1,1048575
	addi	a5,sp,20
	addi	a4,sp,16
	addi	a3,a3,-1328
	addi	a2,a2,616
	addi	a1,a1,-404
	addi	a0,zero,1000
.Lpcrel_9:
	auipc	ra,%pcrel_hi(SolveCubic)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_9)
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
.Lpcrel_10:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_10)
	lw	s5,16(sp)
	blt	zero,s5,.+8
	jal	x0,.L61
	lui	a5,%hi(.LC2)
	lui	s4,67109
	addi	s1,a5,%lo(.LC2)
	addi	s4,s4,-557
	addi	s3,sp,20
	addi	s2,zero,0
	addi	s6,zero,1000
.L62:
	lw	a5,0(s3)
	addi	a0,s1,0
	addi	s2,s2,1
	lui	a1,16
	addi	a1,a1,-1
	and	a1,a5,a1
	srai	t0,s4,16
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t0, x0
.Lpcrel_callmul_270:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_270)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s4,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_271:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_271)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_272:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_272)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	sub	t0,x0,t0
	sub	a1,a1,t0
	srai	a1,a1,16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s4,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_273:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_273)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_274:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_274)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	srai	t0,t0,16
	srai	t1,a5,16
	srai	t2,s4,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_275:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_275)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a1,a1,t0
	srai	a4,a5,31
	sub	s0,x0,s0
	sub	s0,a5,s0
	addi	s3,s3,4
	srai	a1,a1,6
	sub	a1,a1,a4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s6, x0
.Lpcrel_callmul_276:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_276)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a5,a5,a4
	srai	a2,a5,31
	and	t0,a5,a2
	sub	t0,t0,a2
	sub	t0,a5,t0
	and	a5,a5,a2
	sub	a5,t0,a5
	sub	a2,a5,a2
.Lpcrel_11:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_11)
	bne	s2,s5,.L62
.L61:
	addi	a0,zero,10
.Lpcrel_12:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_12)
	lui	a3,1048568
	lui	a2,5
	lui	a1,1048575
	addi	a5,sp,20
	addi	a4,sp,16
	addi	a3,a3,1768
	addi	a2,a2,1520
	addi	a1,a1,596
	addi	a0,zero,1000
.Lpcrel_13:
	auipc	ra,%pcrel_hi(SolveCubic)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_13)
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
.Lpcrel_14:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_14)
	lw	s5,16(sp)
	blt	zero,s5,.+8
	jal	x0,.L63
	lui	a5,%hi(.LC2)
	lui	s4,67109
	addi	s1,a5,%lo(.LC2)
	addi	s4,s4,-557
	addi	s3,sp,20
	addi	s2,zero,0
	addi	s6,zero,1000
.L64:
	lw	a5,0(s3)
	addi	a0,s1,0
	addi	s2,s2,1
	lui	a1,16
	addi	a1,a1,-1
	and	a1,a5,a1
	srai	t0,s4,16
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t0, x0
.Lpcrel_callmul_277:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_277)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s4,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_278:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_278)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_279:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_279)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	sub	t0,x0,t0
	sub	a1,a1,t0
	srai	a1,a1,16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s4,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_280:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_280)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_281:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_281)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	srai	t0,t0,16
	srai	t1,a5,16
	srai	t2,s4,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_282:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_282)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a1,a1,t0
	srai	a4,a5,31
	sub	s0,x0,s0
	sub	s0,a5,s0
	addi	s3,s3,4
	srai	a1,a1,6
	sub	a1,a1,a4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s6, x0
.Lpcrel_callmul_283:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_283)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a5,a5,a4
	srai	a2,a5,31
	and	t0,a5,a2
	sub	t0,t0,a2
	sub	t0,a5,t0
	and	a5,a5,a2
	sub	a5,t0,a5
	sub	a2,a5,a2
.Lpcrel_15:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_15)
	bne	s2,s5,.L64
.L63:
	addi	a0,zero,10
.Lpcrel_16:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_16)
	addi	a2,zero,1000
	lui	a3,1048567
	lui	a1,1048573
	addi	a0,a2,0
	addi	a5,sp,20
	addi	a4,sp,16
	addi	a3,a3,1864
	addi	a1,a1,-1412
.Lpcrel_17:
	auipc	ra,%pcrel_hi(SolveCubic)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_17)
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
.Lpcrel_18:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_18)
	lw	s5,16(sp)
	blt	zero,s5,.+8
	jal	x0,.L65
	lui	a5,%hi(.LC2)
	lui	s4,67109
	addi	s1,a5,%lo(.LC2)
	addi	s4,s4,-557
	addi	s3,sp,20
	addi	s2,zero,0
	addi	s6,zero,1000
.L66:
	lw	a5,0(s3)
	addi	a0,s1,0
	addi	s2,s2,1
	lui	a1,16
	addi	a1,a1,-1
	and	a1,a5,a1
	srai	t0,s4,16
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t0, x0
.Lpcrel_callmul_284:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_284)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s4,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_285:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_285)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_286:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_286)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	sub	t0,x0,t0
	sub	a1,a1,t0
	srai	a1,a1,16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s4,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_287:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_287)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_288:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_288)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	srai	t0,t0,16
	srai	t1,a5,16
	srai	t2,s4,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_289:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_289)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a1,a1,t0
	srai	a4,a5,31
	sub	s0,x0,s0
	sub	s0,a5,s0
	addi	s3,s3,4
	srai	a1,a1,6
	sub	a1,a1,a4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s6, x0
.Lpcrel_callmul_290:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_290)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a5,a5,a4
	srai	a2,a5,31
	and	t0,a5,a2
	sub	t0,t0,a2
	sub	t0,a5,t0
	and	a5,a5,a2
	sub	a5,t0,a5
	sub	a2,a5,a2
.Lpcrel_19:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_19)
	bne	s2,s5,.L66
.L65:
	addi	a0,zero,10
.Lpcrel_20:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_20)
	addi	a5,zero,1000
	lui	s4,%hi(.LC2)
	lui	s3,67109
	sw	a5,12(sp)
	addi	s5,a5,0
	addi	s4,s4,%lo(.LC2)
	addi	s3,s3,-557
.L67:
	lui	s9,2
	addi	s9,s9,1808
.L75:
	lui	s6,1
	addi	s6,s6,904
.L73:
	lui	s7,1048573
	lui	a5,%hi(.LC1)
	addi	s7,s7,1288
	addi	s2,zero,-1000
	addi	s8,a5,%lo(.LC1)
.L70:
	lw	a0,12(sp)
	addi	a5,sp,20
	addi	a4,sp,16
	addi	a3,s2,0
	addi	a2,s6,0
	addi	a1,s9,0
.Lpcrel_21:
	auipc	ra,%pcrel_hi(SolveCubic)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_21)
	addi	a0,s8,0
.Lpcrel_22:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_22)
	lw	s1,16(sp)
	blt	zero,s1,.+8
	jal	x0,.L68
	addi	s10,sp,20
	addi	s11,zero,0
.L69:
	lw	a2,0(s10)
	addi	a0,s4,0
	addi	s11,s11,1
	lui	a1,16
	addi	a1,a1,-1
	and	a1,a2,a1
	srai	t0,s3,16
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t0, x0
.Lpcrel_callmul_291:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_291)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a2,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s3,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_292:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_292)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a2,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s3,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_293:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_293)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	sub	t0,x0,t0
	sub	a1,a1,t0
	srai	a1,a1,16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a2,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s3,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_294:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_294)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srai	t1,a2,16
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s3,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_295:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_295)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	srai	t0,t0,16
	srai	t1,a2,16
	srai	t2,s3,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_296:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_296)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a1,a1,t0
	srai	a3,a2,31
	sub	s0,x0,s0
	sub	s0,a2,s0
	addi	s10,s10,4
	srai	a1,a1,6
	sub	a1,a1,a3
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, s5, x0
.Lpcrel_callmul_297:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_297)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a2,a2,a3
	srai	a3,a2,31
	and	t0,a2,a3
	sub	t0,t0,a3
	sub	t0,a2,t0
	and	a2,a2,a3
	sub	a2,t0,a2
	sub	a2,a2,a3
.Lpcrel_23:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_23)
	bne	s11,s1,.L69
.L68:
	addi	a0,zero,10
	addi	s2,s2,-1000
.Lpcrel_24:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_24)
	bne	s2,s7,.L70
	lui	a5,4
	addi	s6,s6,500
	addi	a5,a5,-1384
	bne	s6,a5,.L73
	addi	s9,s9,-1000
	bne	s9,zero,.L75
	lw	a4,12(sp)
	lui	a5,2
	addi	a5,a5,1808
	addi	a4,a4,1000
	sw	a4,12(sp)
	bne	a4,a5,.L67
	lui	a0,%hi(.LC3)
	addi	a0,a0,%lo(.LC3)
	lui	s3,%hi(.LC4)
.Lpcrel_25:
	auipc	ra,%pcrel_hi(puts)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_25)
	addi	s3,s3,%lo(.LC4)
	addi	s2,zero,0
	addi	s4,zero,1001
.L78:
	addi	a3,s2,0
	addi	s1,zero,32
	addi	a2,zero,0
	addi	a5,zero,0
.L77:
	srli	a0,a3,30
	slli	a4,a2,2
	slli	a5,a5,2
	sub	t0,x0,a0
	sub	a5,a5,t0
	addi	a4,a4,1
	addi	s1,s1,-1
	slli	a3,a3,2
	slli	a2,a2,1
	bltu	a5,a4,.L76
	sub	a5,a5,a4
	addi	a2,a2,1
.L76:
	bne	s1,zero,.L77
	addi	a1,s2,0
	addi	a0,s3,0
	addi	s2,s2,1
	sub	s0,x0,s0
	sub	s0,a2,s0
.Lpcrel_26:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_26)
	bne	s2,s4,.L78
	lui	a5,261840
	addi	a5,a5,361
	addi	a2,zero,0
	addi	s2,zero,32
.L80:
	srli	a3,a5,30
	slli	a4,a2,2
	slli	s1,s1,2
	sub	t0,x0,a3
	sub	s1,s1,t0
	addi	a4,a4,1
	addi	s2,s2,-1
	slli	a5,a5,2
	slli	a2,a2,1
	bltu	s1,a4,.L79
	sub	s1,s1,a4
	addi	a2,a2,1
.L79:
	bne	s2,zero,.L80
	lui	a0,%hi(.LC5)
	lui	a1,261840
	addi	a1,a1,361
	addi	a0,a0,%lo(.LC5)
	sub	t0,x0,a2
	sub	s0,s0,t0
.Lpcrel_27:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_27)
	lui	a0,%hi(.LC6)
	addi	a0,a0,%lo(.LC6)
	lui	s4,%hi(.LC7)
	lui	s10,93207
	lui	s5,67109
	lui	s8,23861
	lui	s7,767
	lui	s6,88
.Lpcrel_28:
	auipc	ra,%pcrel_hi(puts)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_28)
	addi	s4,s4,%lo(.LC7)
	addi	s10,s10,-1001
	addi	s5,s5,-557
	addi	s8,s8,-289
	addi	s7,s7,368
	addi	s6,s6,552
	addi	s3,zero,0
	addi	s1,zero,0
	addi	s11,zero,1000
.L81:
	srli	a5,s3,2
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
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
.Lpcrel_callmul_298:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_298)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s10,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_299:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_299)
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
	and	t2,a5,t2
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
.Lpcrel_callmul_300:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_300)
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
	srli	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s10,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_301:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_301)
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
	and	t2,a5,t2
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
.Lpcrel_callmul_302:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_302)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srli	t3,a5,16
	lui	a5,16
	addi	a5,a5,-1
	and	a5,t3,a5
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
	add	a0, a5, x0
	add	a1, t3, x0
.Lpcrel_callmul_303:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_303)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a5,x0,a5
	sub	a5,t2,a5
	sub	a5,x0,a5
	sub	a5,t1,a5
	sub	a5,x0,a5
	sub	a5,t0,a5
	srli	a2,s3,5
	addi	a0,s4,0
	sub	s3,x0,s3
	sub	s3,s7,s3
	srli	a5,a5,2
	lui	a3,16
	addi	a3,a3,-1
	and	a3,a5,a3
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s5,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, t0, x0
.Lpcrel_callmul_304:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_304)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a3,a3,16
	srli	t0,a5,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s5,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_305:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_305)
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
.Lpcrel_callmul_306:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_306)
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
	srli	t0,a5,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s5,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_307:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_307)
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
.Lpcrel_callmul_308:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_308)
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
	srli	t3,s5,16
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
.Lpcrel_callmul_309:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_309)
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
	sub	s0,x0,s0
	sub	s0,a5,s0
	srli	a3,a3,6
	lui	a1,16
	addi	a1,a1,-1
	and	a1,s1,a1
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s5,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t0, x0
.Lpcrel_callmul_310:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_310)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a1,a1,16
	srli	t0,s1,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s5,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_311:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_311)
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
	and	t1,s1,t1
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
.Lpcrel_callmul_312:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_312)
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
	sub	a1,a1,t0
	srli	a1,a1,16
	srli	t0,s1,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s5,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_313:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_313)
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
	and	t1,s1,t1
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
.Lpcrel_callmul_314:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_314)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	srli	t2,s1,16
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	srli	t3,s5,16
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
.Lpcrel_callmul_315:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_315)
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
	sub	a1,a1,t0
	addi	s1,s1,1000
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, s11, x0
.Lpcrel_callmul_316:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_316)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a1,a1,6
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a2,t0
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
.Lpcrel_callmul_317:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_317)
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
	and	t2,s8,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_318:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_318)
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
.Lpcrel_callmul_319:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_319)
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
	and	t2,s8,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_320:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_320)
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
.Lpcrel_callmul_321:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_321)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srli	t3,a2,16
	lui	a2,16
	addi	a2,a2,-1
	and	a2,t3,a2
	srli	t3,s8,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, t3, x0
.Lpcrel_callmul_322:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_322)
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
	sub	a3,a5,a3
	srli	a2,a2,7
.Lpcrel_29:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_29)
	bne	s1,s6,.L81
	addi	a0,zero,10
	lui	s4,%hi(.LC8)
	lui	s7,683477
	lui	s6,87485
	lui	s5,67109
	lui	s3,747
	lui	s1,2
.Lpcrel_30:
	auipc	ra,%pcrel_hi(putchar)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_30)
	addi	s4,s4,%lo(.LC8)
	addi	s7,s7,-1415
	addi	s6,s6,49
	addi	s5,s5,-557
	addi	s3,s3,288
	addi	s1,s1,-1902
	addi	s8,zero,1000
.L82:
	lui	a1,16
	addi	a1,a1,-1
	and	a1,s9,a1
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s5,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t0, x0
.Lpcrel_callmul_323:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_323)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	srli	a1,a1,16
	srli	t0,s9,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s5,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_324:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_324)
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
.Lpcrel_callmul_325:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_325)
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
	sub	a1,a1,t0
	srli	a1,a1,16
	srli	t0,s9,16
	lui	t1,16
	addi	t1,t1,-1
	and	t0,t0,t1
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s5,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_326:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_326)
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
.Lpcrel_callmul_327:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_327)
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
	srli	t3,s5,16
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
.Lpcrel_callmul_328:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_328)
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
	sub	a1,a1,t0
	srli	a5,s2,1
	srli	a4,s2,4
	addi	a0,s4,0
	sub	s2,x0,s2
	sub	s2,s3,s2
	srli	a1,a1,6
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, s8, x0
.Lpcrel_callmul_329:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_329)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a4,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s6,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_330:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_330)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t1,a4,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s6,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_331:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_331)
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
	and	t2,a4,t2
	srli	t3,s6,16
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
.Lpcrel_callmul_332:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_332)
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
	srli	t1,a4,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s6,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_333:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_333)
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
	and	t2,a4,t2
	srli	t3,s6,16
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
.Lpcrel_callmul_334:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_334)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srli	t3,a4,16
	lui	a4,16
	addi	a4,a4,-1
	and	a4,t3,a4
	srli	t3,s6,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, t3, x0
.Lpcrel_callmul_335:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_335)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a4,x0,a4
	sub	a4,t2,a4
	sub	a4,x0,a4
	sub	a4,t1,a4
	sub	a4,x0,a4
	sub	a4,t0,a4
	sub	a2,s9,a2
	addi	s9,s9,17
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a5,t0
	lui	t1,16
	addi	t1,t1,-1
	and	t1,s7,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_336:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_336)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	srli	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s7,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_337:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_337)
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
	and	t2,a5,t2
	srli	t3,s7,16
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
.Lpcrel_callmul_338:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_338)
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
	srli	t1,a5,16
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t2,s7,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_339:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_339)
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
	and	t2,a5,t2
	srli	t3,s7,16
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
.Lpcrel_callmul_340:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_340)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	srli	t3,a5,16
	lui	a5,16
	addi	a5,a5,-1
	and	a5,t3,a5
	srli	t3,s7,16
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, t3, x0
.Lpcrel_callmul_341:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_341)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a5,x0,a5
	sub	a5,t2,a5
	sub	a5,x0,a5
	sub	a5,t1,a5
	sub	a5,x0,a5
	sub	a5,t0,a5
	srli	a3,a4,14
	srli	a5,a5,10
	sub	s0,x0,s0
	sub	s0,a5,s0
.Lpcrel_31:
	auipc	ra,%pcrel_hi(printf)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_31)
	bne	s9,s1,.L82
	lw	ra,92(sp)
	addi	a0,x0,1
	bltu	s0,a0,.+12
	addi	a0,x0,0
	jal	x0,.+8
	addi	a0,x0,1
	lw	s0,88(sp)
	lw	s1,84(sp)
	lw	s2,80(sp)
	lw	s3,76(sp)
	lw	s4,72(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	lw	s7,60(sp)
	lw	s8,56(sp)
	lw	s9,52(sp)
	lw	s10,48(sp)
	lw	s11,44(sp)
	addi	sp,sp,96
	jalr	zero,ra,0
	.size	main, .-main
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
	and	a3,a3,a1
	bne	a3,x0,.+8
	jal	x0,.Mul_skip
	sub	a0,x0,a0
	sub	a0,a2,a0
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
	blt	a0,zero,__riscv_div_lib_L10
	blt	a1,zero,__riscv_div_lib_L11
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
	and	t2,a0,a3
	sub	t2,t2,a3
	sub	a0,a0,t2
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