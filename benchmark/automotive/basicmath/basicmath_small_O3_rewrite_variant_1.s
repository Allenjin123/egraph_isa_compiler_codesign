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
.Lpcrel_callmul_342:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_342)
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
	addi	t0,x0,16
	sra	t0,a1,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, t0, x0
.Lpcrel_callmul_343:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_343)
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
.Lpcrel_callmul_344:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_344)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t2,x0,16
	sra	t2,a3,t2
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
.Lpcrel_callmul_345:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_345)
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
	addi	t0,x0,16
	sra	a5,a5,t0
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
.Lpcrel_callmul_346:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_346)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t2,x0,16
	sra	t2,a3,t2
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
.Lpcrel_callmul_347:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_347)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	addi	t2,x0,16
	sra	t0,t0,t2
	addi	t2,x0,16
	sra	t2,a3,t2
	addi	t4,x0,16
	sra	t4,a1,t4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t4, x0
.Lpcrel_callmul_348:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_348)
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
	addi	t0,x0,31
	sra	a3,a3,t0
	addi	t0,x0,6
	sra	a5,a5,t0
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
.Lpcrel_callmul_349:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_349)
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
.Lpcrel_callmul_350:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_350)
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
.Lpcrel_callmul_351:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_351)
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
.Lpcrel_callmul_352:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_352)
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
.Lpcrel_callmul_353:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_353)
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
.Lpcrel_callmul_354:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_354)
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
.Lpcrel_callmul_355:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_355)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t0,x0,3
	and	a5,a5,t0
	sub	t0,x0,a4
	sub	a0,a0,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, a0, x0
.Lpcrel_callmul_356:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_356)
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
.Lpcrel_callmul_357:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_357)
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
.Lpcrel_callmul_358:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_358)
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
.Lpcrel_callmul_359:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_359)
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
.Lpcrel_callmul_360:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_360)
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
.Lpcrel_callmul_361:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_361)
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
.Lpcrel_callmul_362:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_362)
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
.Lpcrel_callmul_363:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_363)
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
.Lpcrel_callmul_364:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_364)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	a3,16
	addi	a3,a3,-1
	and	a3,a2,a3
	addi	t0,x0,16
	sra	t0,a7,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, t0, x0
.Lpcrel_callmul_365:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_365)
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
.Lpcrel_callmul_366:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_366)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t2,x0,16
	sra	t2,a2,t2
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
.Lpcrel_callmul_367:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_367)
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
	addi	t0,x0,16
	sra	a3,a3,t0
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
.Lpcrel_callmul_368:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_368)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t2,x0,16
	sra	t2,a2,t2
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
.Lpcrel_callmul_369:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_369)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	addi	t2,x0,16
	sra	t0,t0,t2
	addi	t2,x0,16
	sra	t2,a2,t2
	addi	t3,x0,16
	sra	t3,a7,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_370:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_370)
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
	addi	t0,x0,31
	sra	a2,a2,t0
	addi	t0,x0,18
	sra	a3,a3,t0
	sub	a3,a3,a2
	sub	t0,x0,a3
	sub	a3,a0,t0
	bne	a5,t1,.+8
	jal	x0,.L2
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a4, x0
	add	a1, a4, x0
.Lpcrel_callmul_371:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_371)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	t1,zero,42
	addi	a4,x0,31
	sra	a4,a6,a4
	addi	a2,zero,2
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, t1, x0
.Lpcrel_callmul_372:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_372)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a6,t0
	addi	t1,x0,16
	sra	t1,a1,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_373:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_373)
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
.Lpcrel_callmul_374:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_374)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	addi	t2,x0,16
	sra	t2,a6,t2
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
.Lpcrel_callmul_375:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_375)
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
	addi	t1,x0,16
	sra	t0,t0,t1
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
.Lpcrel_callmul_376:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_376)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	addi	t2,x0,16
	sra	t2,a6,t2
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
.Lpcrel_callmul_377:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_377)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	addi	t2,x0,16
	sra	t1,t1,t2
	addi	t2,x0,16
	sra	t2,a6,t2
	addi	a6,x0,16
	sra	a6,a1,a6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, a6, x0
.Lpcrel_callmul_378:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_378)
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
.Lpcrel_callmul_379:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_379)
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
.Lpcrel_callmul_380:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_380)
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
.Lpcrel_callmul_381:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_381)
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
.Lpcrel_callmul_382:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_382)
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
.Lpcrel_callmul_383:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_383)
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
.Lpcrel_callmul_384:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_384)
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
	addi	t0,x0,7
	sra	a6,a6,t0
	sub	a4,a4,a6
	addi	a4,a4,1000
	srli	a0,a0,18
	sub	t0,x0,a0
	sub	a0,a4,t0
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
.Lpcrel_callmul_385:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_385)
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
	add	a1, s0, x0
.Lpcrel_calldiv_386:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_386)
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
.Lpcrel_callmul_387:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_387)
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
	add	a1, a2, x0
.Lpcrel_calldiv_388:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_388)
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
.Lpcrel_callmul_389:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_389)
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
.Lpcrel_callmul_390:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_390)
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
	add	a1, a3, x0
.Lpcrel_calldiv_391:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_391)
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
.Lpcrel_callmul_392:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_392)
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
.Lpcrel_callmul_393:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_393)
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
.Lpcrel_callmul_394:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_394)
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
.Lpcrel_callmul_395:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_395)
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
.Lpcrel_callmul_396:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_396)
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
.Lpcrel_callmul_397:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_397)
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
	sub	t0,x0,s2
	sub	s2,a5,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, s0, x0
.Lpcrel_callmul_398:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_398)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t4,x0,31
	sra	t4,s2,t4
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, s0, x0
	add	a1, a2, x0
.Lpcrel_callmul_399:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_399)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s2,t0
	addi	t2,x0,16
	sra	t2,t5,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_400:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_400)
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
.Lpcrel_callmul_401:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_401)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	addi	t6,x0,16
	sra	t6,s2,t6
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
.Lpcrel_callmul_402:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_402)
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
	addi	t2,x0,16
	sra	t0,t0,t2
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
.Lpcrel_callmul_403:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_403)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	addi	t6,x0,16
	sra	t6,s2,t6
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
.Lpcrel_callmul_404:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_404)
	add	t6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t6,x0,t6
	sub	t2,t2,t6
	addi	t6,x0,16
	sra	t2,t2,t6
	addi	t6,x0,16
	sra	t6,s2,t6
	addi	a0,x0,16
	sra	a0,t5,a0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, t6, x0
.Lpcrel_callmul_405:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_405)
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
	sub	t0,x0,a4
	sub	a4,a2,t0
	addi	a0,x0,31
	sra	a0,a4,a0
	lui	a3,16
	addi	a3,a3,-1
	and	a3,a5,a3
	addi	t0,x0,16
	sra	t0,t1,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, t0, x0
.Lpcrel_callmul_406:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_406)
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
.Lpcrel_callmul_407:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_407)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t2,x0,16
	sra	t2,a5,t2
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
.Lpcrel_callmul_408:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_408)
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
	addi	t0,x0,16
	sra	a3,a3,t0
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
.Lpcrel_callmul_409:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_409)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t2,x0,16
	sra	t2,a5,t2
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
.Lpcrel_callmul_410:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_410)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	addi	t2,x0,16
	sra	t0,t0,t2
	addi	t2,x0,16
	sra	t2,a5,t2
	addi	t6,x0,16
	sra	t6,t1,t6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t6, x0
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
	sub	t2,x0,t2
	sub	t0,t0,t2
	sub	t0,x0,t0
	sub	a3,a3,t0
	addi	t0,x0,1
	sra	t5,t5,t0
	sub	t5,t5,t4
	addi	t0,x0,31
	sra	a5,a5,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a4,t0
	addi	t2,x0,16
	sra	t2,t1,t2
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
	srli	t2,t2,16
	addi	t4,x0,16
	sra	t4,a4,t4
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
.Lpcrel_callmul_414:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_414)
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
	addi	t2,x0,16
	sra	t0,t0,t2
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
.Lpcrel_callmul_415:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_415)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	addi	t4,x0,16
	sra	t4,a4,t4
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
.Lpcrel_callmul_416:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_416)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t4,x0,t4
	sub	t2,t2,t4
	addi	t4,x0,16
	sra	t2,t2,t4
	addi	t4,x0,16
	sra	t4,a4,t4
	addi	a4,x0,16
	sra	a4,t1,a4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t4, x0
	add	a1, a4, x0
.Lpcrel_callmul_417:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_417)
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
	addi	t0,x0,5
	sra	a3,a3,t0
	sub	a5,a3,a5
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, t5, x0
	add	a1, t5, x0
.Lpcrel_callmul_418:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_418)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	t0,x0,6
	sra	a4,a4,t0
	sub	a0,a0,a4
	sub	t0,x0,a0
	sub	a0,a5,t0
	sub	t0,x0,a0
	sub	a0,t3,t0
	addi	a5,x0,31
	sra	a5,a0,a5
	lui	a4,16
	addi	a4,a4,-1
	and	a4,a0,a4
	addi	t0,x0,16
	sra	t0,a6,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, t0, x0
.Lpcrel_callmul_419:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_419)
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
.Lpcrel_callmul_420:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_420)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t2,x0,16
	sra	t2,a0,t2
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
.Lpcrel_callmul_421:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_421)
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
	addi	t0,x0,16
	sra	a4,a4,t0
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
	srli	t0,t0,16
	addi	t2,x0,16
	sra	t2,a0,t2
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
	sub	t2,x0,t2
	sub	t0,t0,t2
	addi	t2,x0,16
	sra	t0,t0,t2
	addi	t2,x0,16
	sra	t2,a0,t2
	addi	t3,x0,16
	sra	t3,a6,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_424:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_424)
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
.Lpcrel_callmul_425:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_425)
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
.Lpcrel_callmul_426:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_426)
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
.Lpcrel_callmul_427:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_427)
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
.Lpcrel_callmul_428:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_428)
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
.Lpcrel_callmul_429:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_429)
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
.Lpcrel_callmul_430:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_430)
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
	addi	t0,x0,4
	sra	a4,a4,t0
	sub	a4,a4,a5
	srli	a3,a3,6
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, t5, x0
.Lpcrel_callmul_431:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_431)
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
.Lpcrel_callmul_432:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_432)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	a2,x0,31
	sra	a2,a3,a2
	lui	a6,16
	addi	a6,a6,-1
	and	a6,a3,a6
	addi	t0,x0,16
	sra	t0,t1,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a6, x0
	add	a1, t0, x0
.Lpcrel_callmul_433:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_433)
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
.Lpcrel_callmul_434:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_434)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t2,x0,16
	sra	t2,a3,t2
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
.Lpcrel_callmul_435:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_435)
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
	addi	t0,x0,16
	sra	a6,a6,t0
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
.Lpcrel_callmul_436:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_436)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t2,x0,16
	sra	t2,a3,t2
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
.Lpcrel_callmul_437:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_437)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	addi	t2,x0,16
	sra	t0,t0,t2
	addi	t2,x0,16
	sra	t2,a3,t2
	addi	t3,x0,16
	sra	t3,t1,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_438:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_438)
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
.Lpcrel_callmul_439:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_439)
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
.Lpcrel_callmul_440:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_440)
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
.Lpcrel_callmul_441:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_441)
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
.Lpcrel_callmul_442:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_442)
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
.Lpcrel_callmul_443:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_443)
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
	sub	a5,x0,a5
	sub	a5,t3,a5
	sub	a5,x0,a5
	sub	a5,t2,a5
	sub	a5,x0,a5
	sub	a5,t0,a5
	addi	t0,x0,6
	sra	a6,a6,t0
	sub	a2,a2,a6
	srli	a5,a5,6
	sub	t0,x0,a5
	sub	a5,a2,t0
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
.Lpcrel_callmul_445:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_445)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	a6,x0,31
	sra	a6,a4,a6
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
.Lpcrel_calldiv_446:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_446)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	t0,x0,a4
	sub	a4,a3,t0
	addi	t0,x0,1
	sra	a4,a4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_447:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_447)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a3
	sub	a3,a4,t0
	addi	t0,x0,1
	sra	a3,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_448:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_448)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	t0,x0,a4
	sub	a4,a3,t0
	addi	t0,x0,1
	sra	a4,a4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_449:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_449)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a3
	sub	a3,a4,t0
	addi	t0,x0,1
	sra	a3,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_450:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_450)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	t0,x0,a4
	sub	a4,a3,t0
	addi	t0,x0,1
	sra	a4,a4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_451:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_451)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a3
	sub	a3,a4,t0
	addi	t0,x0,1
	sra	a3,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_452:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_452)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	t0,x0,a4
	sub	a4,a3,t0
	addi	t0,x0,1
	sra	a4,a4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_453:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_453)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a3
	sub	a3,a4,t0
	addi	t0,x0,1
	sra	a3,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_454:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_454)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	t0,x0,a4
	sub	a4,a3,t0
	addi	t0,x0,1
	sra	a4,a4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_455:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_455)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a3
	sub	a3,a4,t0
	addi	t0,x0,1
	sra	a3,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_456:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_456)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	t0,x0,a4
	sub	a4,a3,t0
	addi	t0,x0,1
	sra	a4,a4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_457:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_457)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	t0,x0,a5
	sub	a5,a4,t0
	addi	t0,x0,1
	sra	a5,a5,t0
	sub	t0,x0,a2
	sub	a2,a5,t0
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
.Lpcrel_callmul_458:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_458)
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
.Lpcrel_callmul_459:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_459)
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
.Lpcrel_callmul_460:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_460)
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
.Lpcrel_callmul_461:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_461)
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
.Lpcrel_callmul_462:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_462)
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
.Lpcrel_callmul_463:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_463)
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
.Lpcrel_callmul_464:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_464)
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
.Lpcrel_callmul_465:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_465)
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
.Lpcrel_calldiv_466:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_466)
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
	addi	t0,x0,16
	sra	t0,a7,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, t0, x0
.Lpcrel_callmul_467:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_467)
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
.Lpcrel_callmul_468:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_468)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a5,t1
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
.Lpcrel_callmul_469:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_469)
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
	addi	t0,x0,16
	sra	a3,a3,t0
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
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a5,t1
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
	sub	t1,x0,t1
	sub	t0,t0,t1
	addi	t1,x0,16
	sra	t0,t0,t1
	addi	t1,x0,16
	sra	t1,a5,t1
	addi	t2,x0,16
	sra	t2,a7,t2
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
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a3,a3,t0
	addi	t0,x0,31
	sra	a5,a5,t0
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
.Lpcrel_callmul_473:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_473)
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
.Lpcrel_calldiv_474:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_474)
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
.Lpcrel_callmul_475:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_475)
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
	addi	a4,x0,31
	sra	a4,s0,a4
	lw	ra,44(sp)
	lw	s2,32(sp)
	lw	s8,8(sp)
	lui	t0,16
	addi	t0,t0,-1
	and	t0,a2,t0
	addi	t1,x0,16
	sra	t1,a5,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_476:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_476)
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
.Lpcrel_callmul_477:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_477)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	addi	t2,x0,16
	sra	t2,a2,t2
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
	sub	t2,x0,t2
	sub	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	addi	t1,x0,16
	sra	t0,t0,t1
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
.Lpcrel_callmul_479:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_479)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	addi	t2,x0,16
	sra	t2,a2,t2
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
.Lpcrel_callmul_480:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_480)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	addi	t2,x0,16
	sra	t1,t1,t2
	addi	t2,x0,16
	sra	t2,a2,t2
	addi	t3,x0,16
	sra	t3,a5,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_481:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_481)
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
	addi	t0,x0,31
	sra	a2,a2,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s0,t0
	addi	t1,x0,16
	sra	t1,a3,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_482:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_482)
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
.Lpcrel_callmul_483:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_483)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	addi	t2,x0,16
	sra	t2,s0,t2
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
	sub	t2,x0,t2
	sub	t1,t1,t2
	lui	t2,16
	addi	t2,t2,-1
	and	t1,t1,t2
	sub	t1,x0,t1
	sub	t0,t0,t1
	addi	t1,x0,16
	sra	t0,t0,t1
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
.Lpcrel_callmul_485:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_485)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	addi	t2,x0,16
	sra	t2,s0,t2
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
.Lpcrel_callmul_486:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_486)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	addi	t2,x0,16
	sra	t1,t1,t2
	addi	t2,x0,16
	sra	t2,s0,t2
	addi	s0,x0,16
	sra	s0,a3,s0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, s0, x0
.Lpcrel_callmul_487:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_487)
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
	addi	t0,x0,6
	sra	a5,a5,t0
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
.Lpcrel_callmul_488:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_488)
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
.Lpcrel_calldiv_489:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_489)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a3
	sub	a3,a1,t0
	addi	t0,x0,1
	sra	a3,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_490:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_490)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a2
	sub	a2,a3,t0
	addi	t0,x0,1
	sra	a2,a2,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a2, x0
.Lpcrel_calldiv_491:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_491)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a3
	sub	a3,a2,t0
	addi	t0,x0,1
	sra	a3,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_492:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_492)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a2
	sub	a2,a3,t0
	addi	t0,x0,1
	sra	a2,a2,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a2, x0
.Lpcrel_calldiv_493:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_493)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a3
	sub	a3,a2,t0
	addi	t0,x0,1
	sra	a3,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_494:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_494)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a2
	sub	a2,a3,t0
	addi	t0,x0,1
	sra	a2,a2,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a2, x0
.Lpcrel_calldiv_495:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_495)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a3
	sub	a3,a2,t0
	addi	t0,x0,1
	sra	a3,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_496:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_496)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a2
	sub	a2,a3,t0
	addi	t0,x0,1
	sra	a2,a2,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a2, x0
.Lpcrel_calldiv_497:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_497)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a3
	sub	a3,a2,t0
	addi	t0,x0,1
	sra	a3,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_498:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_498)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a2
	sub	a2,a3,t0
	addi	t0,x0,1
	sra	a2,a2,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a2, x0
.Lpcrel_calldiv_499:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_499)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a3
	sub	a3,a2,t0
	addi	t0,x0,1
	sra	a3,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_500:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_500)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	t0,x0,a5
	sub	a5,a3,t0
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
.Lpcrel_callmul_501:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_501)
	add	t4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t0,x0,1
	sra	a5,a5,t0
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
.Lpcrel_calldiv_502:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_502)
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
	sub	a2,x0,a1
	sub	a1,a3,a2
	addi	a2,x0,1
	sra	a1,a1,a2
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a4, x0
.Lpcrel_callmul_503:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_503)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lui	a3,16
	addi	a3,a3,-1
	and	a3,a2,a3
	addi	s3,x0,16
	sra	s3,a0,s3
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, s3, x0
.Lpcrel_callmul_504:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_504)
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
.Lpcrel_callmul_505:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_505)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s3,s3,16
	addi	s4,x0,16
	sra	s4,a2,s4
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
.Lpcrel_callmul_506:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_506)
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
	addi	s3,x0,16
	sra	a3,a3,s3
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
.Lpcrel_callmul_507:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_507)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s3,s3,16
	addi	s4,x0,16
	sra	s4,a2,s4
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
.Lpcrel_callmul_508:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_508)
	add	s4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s4,x0,s4
	sub	s3,s3,s4
	addi	s4,x0,16
	sra	s3,s3,s4
	addi	s4,x0,16
	sra	s4,a2,s4
	addi	s5,x0,16
	sra	s5,a0,s5
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s4, x0
	add	a1, s5, x0
.Lpcrel_callmul_509:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_509)
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
	addi	s3,x0,31
	sra	a2,a2,s3
	addi	s3,x0,6
	sra	a3,a3,s3
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
.Lpcrel_callmul_510:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_510)
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
.Lpcrel_callmul_511:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_511)
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
.Lpcrel_callmul_512:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_512)
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
.Lpcrel_callmul_513:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_513)
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
.Lpcrel_callmul_514:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_514)
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
.Lpcrel_callmul_515:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_515)
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
.Lpcrel_callmul_516:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_516)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	a2,x0,3
	and	a3,a2,a3
	sub	a2,x0,s3
	sub	s3,a1,a2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, s3, x0
.Lpcrel_callmul_517:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_517)
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
.Lpcrel_callmul_518:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_518)
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
.Lpcrel_callmul_519:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_519)
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
.Lpcrel_callmul_520:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_520)
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
.Lpcrel_callmul_521:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_521)
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
.Lpcrel_callmul_522:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_522)
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
.Lpcrel_callmul_523:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_523)
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
	addi	s5,x0,31
	sra	s5,s6,s5
	srli	a2,a2,6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, a2, x0
.Lpcrel_callmul_524:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_524)
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
.Lpcrel_callmul_525:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_525)
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
	sw	s4,8(sp)
	lui	s7,16
	addi	s7,s7,-1
	and	s7,s4,s7
	addi	s2,x0,16
	sra	s2,a7,s2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s7, x0
	add	a1, s2, x0
.Lpcrel_callmul_526:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_526)
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
.Lpcrel_callmul_527:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_527)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s2,s2,16
	addi	s3,x0,16
	sra	s3,s4,s3
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
.Lpcrel_callmul_528:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_528)
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
	addi	s2,x0,16
	sra	s7,s7,s2
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
.Lpcrel_callmul_529:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_529)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s2,s2,16
	addi	s3,x0,16
	sra	s3,s4,s3
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
.Lpcrel_callmul_530:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_530)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s3,x0,s3
	sub	s2,s2,s3
	addi	s3,x0,16
	sra	s2,s2,s3
	addi	s3,x0,16
	sra	s3,s4,s3
	addi	s4,x0,16
	sra	s4,a7,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, s4, x0
.Lpcrel_callmul_531:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_531)
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
	lw	s4,8(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	addi	s2,x0,31
	sra	s4,s4,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	addi	s2,x0,18
	sra	s7,s7,s2
	lw	s2,0(sp)
	addi	sp,sp,16
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
.Lpcrel_callmul_532:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_532)
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
.Lpcrel_callmul_533:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_533)
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
	addi	s3,x0,16
	sra	s3,a0,s3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s2, x0
	add	a1, s3, x0
.Lpcrel_callmul_534:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_534)
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
.Lpcrel_callmul_535:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_535)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s3,s3,16
	addi	s4,x0,16
	sra	s4,s6,s4
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
.Lpcrel_callmul_536:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_536)
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
	addi	s3,x0,16
	sra	s2,s2,s3
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
.Lpcrel_callmul_537:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_537)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	s3,s3,16
	addi	s4,x0,16
	sra	s4,s6,s4
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
.Lpcrel_callmul_538:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_538)
	add	s4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s4,x0,s4
	sub	s3,s3,s4
	addi	s4,x0,16
	sra	s3,s3,s4
	addi	s4,x0,16
	sra	s4,s6,s4
	addi	s6,x0,16
	sra	s6,a0,s6
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s4, x0
	add	a1, s6, x0
.Lpcrel_callmul_539:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_539)
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
.Lpcrel_callmul_540:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_540)
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
.Lpcrel_callmul_541:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_541)
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
.Lpcrel_callmul_542:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_542)
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
.Lpcrel_callmul_543:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_543)
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
.Lpcrel_callmul_544:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_544)
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
.Lpcrel_callmul_545:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_545)
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
	addi	s4,x0,7
	sra	s6,s6,s4
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
	sub	t0,x0,t1
	sub	t1,t3,t0
	srli	s3,t1,31
	sub	t0,x0,s3
	sub	s3,t1,t0
	lui	a5,2
	lui	a2,3
	addi	t0,x0,1
	sra	s3,s3,t0
	addi	a2,a2,280
	addi	a5,a5,-1908
	lui	a4,349525
	lui	a3,174763
	sub	t0,x0,s3
	sub	a5,a5,t0
	addi	a4,a4,1366
	sub	t0,x0,s3
	sub	s3,a2,t0
	addi	a3,a3,-1365
	lui	s1,16
	addi	s1,s1,-1
	and	s1,a5,s1
	addi	t0,x0,16
	sra	t0,a4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s1, x0
	add	a1, t0, x0
.Lpcrel_callmul_546:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_546)
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
	srli	t0,t0,16
	addi	t2,x0,16
	sra	t2,a5,t2
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
.Lpcrel_callmul_548:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_548)
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
	addi	t0,x0,16
	sra	s1,s1,t0
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
.Lpcrel_callmul_549:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_549)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t2,x0,16
	sra	t2,a5,t2
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
.Lpcrel_callmul_550:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_550)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t0,t0,t2
	addi	t2,x0,16
	sra	t0,t0,t2
	addi	t2,x0,16
	sra	t2,a5,t2
	addi	t3,x0,16
	sra	t3,a4,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_551:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_551)
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
	addi	a1,x0,31
	sra	a1,s3,a1
	addi	a2,x0,31
	sra	a2,t1,a2
	lw	s6,16(sp)
	lw	s7,12(sp)
	addi	t0,x0,31
	sra	a5,a5,t0
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s3,t0
	addi	t2,x0,16
	sra	t2,a4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_552:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_552)
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
.Lpcrel_callmul_553:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_553)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t2,t2,16
	addi	t3,x0,16
	sra	t3,s3,t3
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
.Lpcrel_callmul_554:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_554)
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
	addi	t2,x0,16
	sra	t0,t0,t2
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
	srli	t2,t2,16
	addi	t3,x0,16
	sra	t3,s3,t3
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
.Lpcrel_callmul_556:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_556)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t3,x0,t3
	sub	t2,t2,t3
	addi	t3,x0,16
	sra	t2,t2,t3
	addi	t3,x0,16
	sra	t3,s3,t3
	addi	s3,x0,16
	sra	s3,a4,s3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, s3, x0
.Lpcrel_callmul_557:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_557)
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
	addi	t2,x0,16
	sra	t2,a3,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t2, x0
.Lpcrel_callmul_558:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_558)
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
	srli	t2,t2,16
	addi	t3,x0,16
	sra	t3,t1,t3
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
.Lpcrel_callmul_560:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_560)
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
	addi	t2,x0,16
	sra	t0,t0,t2
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
	srli	t2,t2,16
	addi	t3,x0,16
	sra	t3,t1,t3
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
.Lpcrel_callmul_562:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_562)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t3,x0,t3
	sub	t2,t2,t3
	addi	t3,x0,16
	sra	t2,t2,t3
	addi	t3,x0,16
	sra	t3,t1,t3
	addi	t1,x0,16
	sra	t1,a3,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t3, x0
	add	a1, t1, x0
.Lpcrel_callmul_563:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_563)
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
.Lpcrel_callmul_564:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_564)
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
.Lpcrel_calldiv_565:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_565)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	t0,x0,a4
	sub	a4,a3,t0
	addi	t0,x0,1
	sra	a4,a4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_566:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_566)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a3
	sub	a3,a4,t0
	addi	t0,x0,1
	sra	a3,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_567:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_567)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	t0,x0,a4
	sub	a4,a3,t0
	addi	t0,x0,1
	sra	a4,a4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_568:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_568)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a3
	sub	a3,a4,t0
	addi	t0,x0,1
	sra	a3,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_569:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_569)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	t0,x0,a4
	sub	a4,a3,t0
	addi	t0,x0,1
	sra	a4,a4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_570:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_570)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a3
	sub	a3,a4,t0
	addi	t0,x0,1
	sra	a3,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_571:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_571)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	t0,x0,a4
	sub	a4,a3,t0
	addi	t0,x0,1
	sra	a4,a4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_572:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_572)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a3
	sub	a3,a4,t0
	addi	t0,x0,1
	sra	a3,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_573:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_573)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	t0,x0,a4
	sub	a4,a3,t0
	addi	t0,x0,1
	sra	a4,a4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	t0, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_574:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_574)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	t0, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a3
	sub	a3,a4,t0
	addi	t0,x0,1
	sra	a3,a3,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a3, x0
.Lpcrel_calldiv_575:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_575)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	t0,x0,a4
	sub	a4,a3,t0
	addi	t0,x0,1
	sra	a4,a4,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	t0, 16(sp)
	sw	ra, 20(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_calldiv_576:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_576)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	t0, 16(sp)
	lw	ra, 20(sp)
	addi	sp, sp, 32
	sub	t0,x0,a5
	sub	a5,a4,t0
	addi	t0,x0,-2
	and	a5,t0,a5
	sub	s4,zero,a5
.L21:
	lui	s5,349525
	addi	s5,s5,1366
	lui	t0,16
	addi	t0,t0,-1
	and	t0,s0,t0
	addi	t1,x0,16
	sra	t1,s5,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, t1, x0
.Lpcrel_callmul_577:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_577)
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
.Lpcrel_callmul_578:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_578)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	addi	t2,x0,16
	sra	t2,s0,t2
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
.Lpcrel_callmul_579:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_579)
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
	addi	t1,x0,16
	sra	t0,t0,t1
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
.Lpcrel_callmul_580:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_580)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t1,t1,16
	addi	t2,x0,16
	sra	t2,s0,t2
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
.Lpcrel_callmul_581:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_581)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t2,x0,t2
	sub	t1,t1,t2
	addi	t2,x0,16
	sra	t1,t1,t2
	addi	t2,x0,16
	sra	t2,s0,t2
	addi	t3,x0,16
	sra	t3,s5,t3
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, t3, x0
.Lpcrel_callmul_582:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_582)
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
	addi	t0,x0,31
	sra	s0,s0,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, s4, x0
.Lpcrel_callmul_583:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_583)
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
	addi	t0,x0,16
	sra	t0,s0,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, t0, x0
.Lpcrel_callmul_584:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_584)
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
.Lpcrel_callmul_585:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_585)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a4,t1
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
.Lpcrel_callmul_586:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_586)
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
	addi	t0,x0,16
	sra	a5,a5,t0
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
.Lpcrel_callmul_587:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_587)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a4,t1
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
.Lpcrel_callmul_588:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_588)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	addi	t1,x0,16
	sra	t0,t0,t1
	addi	t1,x0,16
	sra	t1,a4,t1
	addi	t2,x0,16
	sra	t2,s0,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_589:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_589)
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
	addi	t0,x0,31
	sra	a4,a4,t0
	addi	t0,x0,6
	sra	a5,a5,t0
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
.Lpcrel_callmul_590:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_590)
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
	addi	t0,x0,16
	sra	t0,s0,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, t0, x0
.Lpcrel_callmul_591:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_591)
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
.Lpcrel_callmul_592:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_592)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a4,t1
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
.Lpcrel_callmul_593:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_593)
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
	addi	t0,x0,16
	sra	a5,a5,t0
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
.Lpcrel_callmul_594:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_594)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a4,t1
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
.Lpcrel_callmul_595:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_595)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	addi	t1,x0,16
	sra	t0,t0,t1
	addi	t1,x0,16
	sra	t1,a4,t1
	addi	t2,x0,16
	sra	t2,s0,t2
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
	sub	t1,x0,t1
	sub	t0,t0,t1
	sub	t0,x0,t0
	sub	a5,a5,t0
	addi	t0,x0,31
	sra	a4,a4,t0
	addi	t0,x0,6
	sra	a5,a5,t0
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
.Lpcrel_callmul_597:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_597)
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
	addi	t0,x0,16
	sra	t0,s0,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, t0, x0
.Lpcrel_callmul_598:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_598)
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
.Lpcrel_callmul_599:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_599)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a0,t1
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
.Lpcrel_callmul_600:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_600)
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
	addi	t0,x0,16
	sra	a5,a5,t0
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
.Lpcrel_callmul_601:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_601)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a0,t1
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
.Lpcrel_callmul_602:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_602)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	addi	t1,x0,16
	sra	t0,t0,t1
	addi	t1,x0,16
	sra	t1,a0,t1
	addi	t2,x0,16
	sra	t2,s0,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_603:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_603)
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
	addi	t0,x0,31
	sra	a0,a0,t0
	lw	s0,40(sp)
	addi	t0,x0,6
	sra	a5,a5,t0
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
	addi	t0,x0,16
	sra	t0,s4,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t0, x0
.Lpcrel_callmul_604:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_604)
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
.Lpcrel_callmul_605:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_605)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a5,t1
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
.Lpcrel_callmul_606:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_606)
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
	addi	t0,x0,16
	sra	a1,a1,t0
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
.Lpcrel_callmul_607:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_607)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a5,t1
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
.Lpcrel_callmul_608:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_608)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	addi	t1,x0,16
	sra	t0,t0,t1
	addi	t1,x0,16
	sra	t1,a5,t1
	addi	t2,x0,16
	sra	t2,s4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_609:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_609)
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
	addi	a4,x0,31
	sra	a4,a5,a4
	sub	t0,x0,s0
	sub	s0,a5,t0
	addi	s3,s3,4
	addi	t0,x0,6
	sra	a1,a1,t0
	sub	a1,a1,a4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s6, x0
.Lpcrel_callmul_610:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_610)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a5,a5,a4
	addi	a2,x0,31
	sra	a2,a5,a2
	and	t0,a5,a2
	sub	t0,t0,a2
	sub	t0,a5,t0
	and	t1,a5,a2
	sub	a5,t0,t1
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
	addi	t0,x0,16
	sra	t0,s4,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t0, x0
.Lpcrel_callmul_611:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_611)
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
.Lpcrel_callmul_612:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_612)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a5,t1
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
.Lpcrel_callmul_613:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_613)
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
	addi	t0,x0,16
	sra	a1,a1,t0
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
.Lpcrel_callmul_614:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_614)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a5,t1
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
.Lpcrel_callmul_615:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_615)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	addi	t1,x0,16
	sra	t0,t0,t1
	addi	t1,x0,16
	sra	t1,a5,t1
	addi	t2,x0,16
	sra	t2,s4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_616:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_616)
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
	addi	a4,x0,31
	sra	a4,a5,a4
	sub	t0,x0,s0
	sub	s0,a5,t0
	addi	s3,s3,4
	addi	t0,x0,6
	sra	a1,a1,t0
	sub	a1,a1,a4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s6, x0
.Lpcrel_callmul_617:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_617)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a5,a5,a4
	addi	a2,x0,31
	sra	a2,a5,a2
	and	t0,a5,a2
	sub	t0,t0,a2
	sub	t0,a5,t0
	and	t1,a5,a2
	sub	a5,t0,t1
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
	addi	t0,x0,16
	sra	t0,s4,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t0, x0
.Lpcrel_callmul_618:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_618)
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
.Lpcrel_callmul_619:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_619)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a5,t1
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
.Lpcrel_callmul_620:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_620)
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
	addi	t0,x0,16
	sra	a1,a1,t0
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
.Lpcrel_callmul_621:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_621)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a5,t1
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
.Lpcrel_callmul_622:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_622)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	addi	t1,x0,16
	sra	t0,t0,t1
	addi	t1,x0,16
	sra	t1,a5,t1
	addi	t2,x0,16
	sra	t2,s4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_623:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_623)
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
	addi	a4,x0,31
	sra	a4,a5,a4
	sub	t0,x0,s0
	sub	s0,a5,t0
	addi	s3,s3,4
	addi	t0,x0,6
	sra	a1,a1,t0
	sub	a1,a1,a4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s6, x0
.Lpcrel_callmul_624:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_624)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a5,a5,a4
	addi	a2,x0,31
	sra	a2,a5,a2
	and	t0,a5,a2
	sub	t0,t0,a2
	sub	t0,a5,t0
	and	t1,a5,a2
	sub	a5,t0,t1
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
	addi	t0,x0,16
	sra	t0,s4,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t0, x0
.Lpcrel_callmul_625:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_625)
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
.Lpcrel_callmul_626:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_626)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a5,t1
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
.Lpcrel_callmul_627:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_627)
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
	addi	t0,x0,16
	sra	a1,a1,t0
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
.Lpcrel_callmul_628:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_628)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a5,t1
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
.Lpcrel_callmul_629:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_629)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	addi	t1,x0,16
	sra	t0,t0,t1
	addi	t1,x0,16
	sra	t1,a5,t1
	addi	t2,x0,16
	sra	t2,s4,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_630:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_630)
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
	addi	a4,x0,31
	sra	a4,a5,a4
	sub	t0,x0,s0
	sub	s0,a5,t0
	addi	s3,s3,4
	addi	t0,x0,6
	sra	a1,a1,t0
	sub	a1,a1,a4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s6, x0
.Lpcrel_callmul_631:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_631)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a5,a5,a4
	addi	a2,x0,31
	sra	a2,a5,a2
	and	t0,a5,a2
	sub	t0,t0,a2
	sub	t0,a5,t0
	and	t1,a5,a2
	sub	a5,t0,t1
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
	addi	t0,x0,16
	sra	t0,s3,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, t0, x0
.Lpcrel_callmul_632:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_632)
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
.Lpcrel_callmul_633:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_633)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a2,t1
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
.Lpcrel_callmul_634:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_634)
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
	addi	t0,x0,16
	sra	a1,a1,t0
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
.Lpcrel_callmul_635:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_635)
	add	t0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	srli	t0,t0,16
	addi	t1,x0,16
	sra	t1,a2,t1
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
.Lpcrel_callmul_636:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_636)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t1,x0,t1
	sub	t0,t0,t1
	addi	t1,x0,16
	sra	t0,t0,t1
	addi	t1,x0,16
	sra	t1,a2,t1
	addi	t2,x0,16
	sra	t2,s3,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_637:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_637)
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
	addi	a3,x0,31
	sra	a3,a2,a3
	sub	t0,x0,s0
	sub	s0,a2,t0
	addi	s10,s10,4
	addi	t0,x0,6
	sra	a1,a1,t0
	sub	a1,a1,a3
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, s5, x0
.Lpcrel_callmul_638:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_638)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a2,a2,a3
	addi	a3,x0,31
	sra	a3,a2,a3
	and	t0,a2,a3
	sub	t0,t0,a3
	sub	t0,a2,t0
	and	t1,a2,a3
	sub	a2,t0,t1
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
	sub	t0,x0,s0
	sub	s0,a2,t0
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
.Lpcrel_callmul_639:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_639)
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
.Lpcrel_callmul_640:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_640)
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
.Lpcrel_callmul_641:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_641)
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
.Lpcrel_callmul_642:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_642)
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
.Lpcrel_callmul_643:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_643)
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
.Lpcrel_callmul_644:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_644)
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
	sub	t0,x0,s3
	sub	s3,s7,t0
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
.Lpcrel_callmul_645:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_645)
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
.Lpcrel_callmul_646:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_646)
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
.Lpcrel_callmul_647:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_647)
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
.Lpcrel_callmul_648:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_648)
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
.Lpcrel_callmul_649:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_649)
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
.Lpcrel_callmul_650:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_650)
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
	sub	t0,x0,s0
	sub	s0,a5,t0
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
.Lpcrel_callmul_651:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_651)
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
.Lpcrel_callmul_652:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_652)
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
.Lpcrel_callmul_653:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_653)
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
.Lpcrel_callmul_654:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_654)
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
.Lpcrel_callmul_655:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_655)
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
.Lpcrel_callmul_656:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_656)
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
.Lpcrel_callmul_657:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_657)
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
.Lpcrel_callmul_658:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_658)
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
.Lpcrel_callmul_659:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_659)
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
.Lpcrel_callmul_660:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_660)
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
.Lpcrel_callmul_661:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_661)
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
.Lpcrel_callmul_662:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_662)
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
.Lpcrel_callmul_663:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_663)
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
.Lpcrel_callmul_664:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_664)
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
.Lpcrel_callmul_665:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_665)
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
.Lpcrel_callmul_666:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_666)
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
.Lpcrel_callmul_667:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_667)
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
.Lpcrel_callmul_668:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_668)
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
.Lpcrel_callmul_669:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_669)
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
	sub	t0,x0,s2
	sub	s2,s3,t0
	srli	a1,a1,6
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, s8, x0
.Lpcrel_callmul_670:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_670)
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
.Lpcrel_callmul_671:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_671)
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
.Lpcrel_callmul_672:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_672)
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
.Lpcrel_callmul_673:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_673)
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
.Lpcrel_callmul_674:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_674)
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
.Lpcrel_callmul_675:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_675)
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
.Lpcrel_callmul_676:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_676)
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
.Lpcrel_callmul_677:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_677)
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
.Lpcrel_callmul_678:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_678)
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
.Lpcrel_callmul_679:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_679)
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
.Lpcrel_callmul_680:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_680)
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
.Lpcrel_callmul_681:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_681)
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
.Lpcrel_callmul_682:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_682)
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
	sub	t0,x0,s0
	sub	s0,a5,t0
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
	and	a3,a1,a3
	bne	a3,x0,.+8
	jal	x0,.Mul_skip
	sub	t0,x0,a0
	sub	a0,a2,t0
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