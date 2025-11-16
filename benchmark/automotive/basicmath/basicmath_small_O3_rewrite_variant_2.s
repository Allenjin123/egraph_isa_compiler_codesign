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
.Lpcrel_callmul_683:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_683)
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
.Lpcrel_callmul_684:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_684)
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
.Lpcrel_callmul_685:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_685)
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
.Lpcrel_callmul_686:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_686)
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
.Lpcrel_callmul_687:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_687)
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
.Lpcrel_callmul_688:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_688)
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
.Lpcrel_callmul_689:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_689)
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
.Lpcrel_callmul_690:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_690)
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
	srl	t2,a5,t2
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
.Lpcrel_callmul_691:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_691)
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
	addi	t5,x0,16
	srl	t5,a1,t5
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
.Lpcrel_callmul_692:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_692)
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
	addi	t2,x0,16
	srl	t0,t0,t2
	addi	t2,x0,16
	srl	t2,a5,t2
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
.Lpcrel_callmul_693:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_693)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t4,x0,16
	srl	t2,t2,t4
	lui	t4,16
	addi	t4,t4,-1
	and	t4,a5,t4
	addi	t5,x0,16
	srl	t5,a1,t5
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
.Lpcrel_callmul_694:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_694)
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
	srl	t5,a5,t5
	lui	a5,16
	addi	a5,a5,-1
	and	a5,t5,a5
	addi	t5,x0,16
	srl	t5,a1,t5
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
.Lpcrel_callmul_695:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_695)
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
	addi	t0,x0,6
	srl	a5,a5,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_callmul_696:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_696)
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
.Lpcrel_callmul_697:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_697)
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
.Lpcrel_callmul_698:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_698)
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
	srl	t0,a6,t0
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
.Lpcrel_callmul_699:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_699)
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
	addi	t4,x0,16
	srl	t4,a1,t4
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
.Lpcrel_callmul_700:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_700)
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
	addi	t0,x0,16
	srl	a4,a4,t0
	addi	t0,x0,16
	srl	t0,a6,t0
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
.Lpcrel_callmul_701:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_701)
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
	addi	t4,x0,16
	srl	t4,a1,t4
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
.Lpcrel_callmul_702:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_702)
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
	srl	t4,a6,t4
	lui	t5,16
	addi	t5,t5,-1
	and	t4,t4,t5
	addi	t5,x0,16
	srl	t5,a1,t5
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
.Lpcrel_callmul_703:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_703)
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
	addi	t0,x0,6
	srl	a4,a4,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, a4, x0
.Lpcrel_callmul_704:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_704)
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
.Lpcrel_callmul_705:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_705)
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
.Lpcrel_callmul_706:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_706)
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
.Lpcrel_callmul_707:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_707)
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
.Lpcrel_callmul_708:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_708)
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
.Lpcrel_callmul_709:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_709)
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
.Lpcrel_callmul_710:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_710)
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
.Lpcrel_callmul_711:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_711)
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
.Lpcrel_callmul_712:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_712)
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
.Lpcrel_callmul_713:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_713)
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
.Lpcrel_callmul_714:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_714)
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
.Lpcrel_callmul_715:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_715)
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
.Lpcrel_callmul_716:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_716)
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
.Lpcrel_callmul_717:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_717)
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
.Lpcrel_callmul_718:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_718)
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
.Lpcrel_callmul_719:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_719)
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
.Lpcrel_callmul_720:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_720)
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
	srl	t1,a0,t1
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
.Lpcrel_callmul_721:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_721)
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
	addi	t3,x0,16
	srl	t3,a7,t3
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
.Lpcrel_callmul_722:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_722)
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
	srl	t1,a0,t1
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
.Lpcrel_callmul_723:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_723)
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
	and	t2,a0,t2
	addi	t3,x0,16
	srl	t3,a7,t3
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
.Lpcrel_callmul_724:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_724)
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
	lui	a0,16
	addi	a0,a0,-1
	and	a0,t3,a0
	addi	t3,x0,16
	srl	t3,a7,t3
	lui	t4,16
	addi	t4,t4,-1
	and	t3,t3,t4
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, t3, x0
.Lpcrel_callmul_725:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_725)
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
	addi	t0,x0,18
	srl	a0,a0,t0
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
.Lpcrel_callmul_726:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_726)
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
.Lpcrel_calldiv_727:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_727)
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
.Lpcrel_callmul_728:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_728)
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
.Lpcrel_calldiv_729:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_729)
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
.Lpcrel_callmul_730:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_730)
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
.Lpcrel_callmul_731:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_731)
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
.Lpcrel_calldiv_732:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_732)
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
.Lpcrel_callmul_733:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_733)
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
	srl	t2,a5,t2
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
.Lpcrel_callmul_734:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_734)
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
	addi	t4,x0,16
	srl	t4,t1,t4
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
.Lpcrel_callmul_735:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_735)
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
	srl	t2,a5,t2
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
.Lpcrel_callmul_736:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_736)
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
	and	t3,a5,t3
	addi	t4,x0,16
	srl	t4,t1,t4
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
.Lpcrel_callmul_737:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_737)
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
	srl	t4,a5,t4
	lui	a5,16
	addi	a5,a5,-1
	and	a5,t4,a5
	addi	t4,x0,16
	srl	t4,t1,t4
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
.Lpcrel_callmul_738:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_738)
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
	addi	t0,x0,6
	srl	a5,a5,t0
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
.Lpcrel_callmul_739:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_739)
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
.Lpcrel_callmul_740:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_740)
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
.Lpcrel_callmul_741:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_741)
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
.Lpcrel_callmul_742:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_742)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t6,x0,16
	srl	t2,t2,t6
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
.Lpcrel_callmul_743:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_743)
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
.Lpcrel_callmul_744:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_744)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	t6,x0,16
	srl	t2,t2,t6
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
.Lpcrel_callmul_745:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_745)
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
.Lpcrel_callmul_746:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_746)
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
.Lpcrel_callmul_747:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_747)
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
.Lpcrel_callmul_748:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_748)
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
.Lpcrel_callmul_749:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_749)
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
.Lpcrel_callmul_750:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_750)
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
.Lpcrel_callmul_751:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_751)
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
.Lpcrel_callmul_752:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_752)
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
.Lpcrel_callmul_753:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_753)
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
.Lpcrel_callmul_754:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_754)
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
.Lpcrel_callmul_755:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_755)
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
.Lpcrel_callmul_756:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_756)
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
.Lpcrel_callmul_757:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_757)
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
.Lpcrel_callmul_758:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_758)
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
.Lpcrel_callmul_759:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_759)
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
.Lpcrel_callmul_760:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_760)
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
.Lpcrel_callmul_761:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_761)
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
.Lpcrel_callmul_762:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_762)
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
.Lpcrel_callmul_763:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_763)
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
.Lpcrel_callmul_764:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_764)
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
.Lpcrel_callmul_765:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_765)
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
.Lpcrel_callmul_766:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_766)
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
	srl	t2,a3,t2
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
.Lpcrel_callmul_767:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_767)
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
	addi	t4,x0,16
	srl	t4,t1,t4
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
.Lpcrel_callmul_768:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_768)
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
	srl	t2,a3,t2
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
.Lpcrel_callmul_769:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_769)
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
	and	t3,a3,t3
	addi	t4,x0,16
	srl	t4,t1,t4
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
.Lpcrel_callmul_770:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_770)
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
	srl	t4,a3,t4
	lui	a3,16
	addi	a3,a3,-1
	and	a3,t4,a3
	addi	t4,x0,16
	srl	t4,t1,t4
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
.Lpcrel_callmul_771:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_771)
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
	addi	t0,x0,6
	srl	a3,a3,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, t5, x0
.Lpcrel_callmul_772:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_772)
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
.Lpcrel_callmul_773:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_773)
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
.Lpcrel_callmul_774:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_774)
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
.Lpcrel_callmul_775:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_775)
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
.Lpcrel_callmul_776:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_776)
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
.Lpcrel_callmul_777:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_777)
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
.Lpcrel_callmul_778:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_778)
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
.Lpcrel_callmul_779:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_779)
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
.Lpcrel_callmul_780:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_780)
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
	srl	t2,a5,t2
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
.Lpcrel_callmul_781:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_781)
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
	addi	t4,x0,16
	srl	t4,t1,t4
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
.Lpcrel_callmul_782:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_782)
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
	srl	t2,a5,t2
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
.Lpcrel_callmul_783:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_783)
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
	and	t3,a5,t3
	addi	t4,x0,16
	srl	t4,t1,t4
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
.Lpcrel_callmul_784:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_784)
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
	srl	t4,a5,t4
	lui	a5,16
	addi	a5,a5,-1
	and	a5,t4,a5
	addi	t4,x0,16
	srl	t4,t1,t4
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
.Lpcrel_callmul_785:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_785)
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
	addi	t0,x0,6
	srl	a5,a5,t0
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
.Lpcrel_callmul_786:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_786)
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
.Lpcrel_calldiv_787:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_787)
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
.Lpcrel_calldiv_788:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_788)
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
.Lpcrel_calldiv_789:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_789)
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
.Lpcrel_calldiv_790:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_790)
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
.Lpcrel_calldiv_791:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_791)
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
.Lpcrel_calldiv_792:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_792)
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
.Lpcrel_calldiv_793:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_793)
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
.Lpcrel_calldiv_794:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_794)
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
.Lpcrel_calldiv_795:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_795)
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
.Lpcrel_calldiv_796:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_796)
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
.Lpcrel_calldiv_797:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_797)
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
.Lpcrel_calldiv_798:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_798)
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
.Lpcrel_callmul_799:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_799)
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
.Lpcrel_callmul_800:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_800)
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
.Lpcrel_callmul_801:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_801)
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
	srl	t1,a5,t1
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
.Lpcrel_callmul_802:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_802)
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
	addi	t3,x0,16
	srl	t3,a6,t3
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
.Lpcrel_callmul_803:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_803)
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
	srl	t1,a5,t1
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
.Lpcrel_callmul_804:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_804)
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
	and	t2,a5,t2
	addi	t3,x0,16
	srl	t3,a6,t3
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
.Lpcrel_callmul_805:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_805)
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
	srl	t3,a5,t3
	lui	a5,16
	addi	a5,a5,-1
	and	a5,t3,a5
	addi	t3,x0,16
	srl	t3,a6,t3
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
.Lpcrel_callmul_806:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_806)
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
	addi	t0,x0,6
	srl	a5,a5,t0
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
.Lpcrel_calldiv_807:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_807)
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
.Lpcrel_callmul_808:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_808)
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
.Lpcrel_callmul_809:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_809)
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
.Lpcrel_callmul_810:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_810)
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
.Lpcrel_callmul_811:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_811)
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
.Lpcrel_callmul_812:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_812)
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
.Lpcrel_callmul_813:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_813)
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
.Lpcrel_callmul_814:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_814)
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
.Lpcrel_calldiv_815:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_815)
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
.Lpcrel_callmul_816:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_816)
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
.Lpcrel_callmul_817:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_817)
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
.Lpcrel_callmul_818:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_818)
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
.Lpcrel_callmul_819:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_819)
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
.Lpcrel_callmul_820:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_820)
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
.Lpcrel_callmul_821:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_821)
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
.Lpcrel_callmul_822:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_822)
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
.Lpcrel_callmul_823:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_823)
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
.Lpcrel_callmul_824:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_824)
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
.Lpcrel_callmul_825:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_825)
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
.Lpcrel_callmul_826:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_826)
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
.Lpcrel_callmul_827:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_827)
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
.Lpcrel_callmul_828:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_828)
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
.Lpcrel_callmul_829:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_829)
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
.Lpcrel_calldiv_830:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_830)
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
.Lpcrel_calldiv_831:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_831)
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
.Lpcrel_calldiv_832:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_832)
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
.Lpcrel_calldiv_833:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_833)
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
.Lpcrel_calldiv_834:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_834)
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
.Lpcrel_calldiv_835:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_835)
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
.Lpcrel_calldiv_836:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_836)
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
.Lpcrel_calldiv_837:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_837)
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
.Lpcrel_calldiv_838:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_838)
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
.Lpcrel_calldiv_839:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_839)
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
.Lpcrel_calldiv_840:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_840)
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
.Lpcrel_calldiv_841:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_841)
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
.Lpcrel_callmul_842:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_842)
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
.Lpcrel_calldiv_843:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_843)
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
	addi	a1,x0,31
	srl	a1,a3,a1
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
.Lpcrel_callmul_844:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_844)
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
.Lpcrel_callmul_845:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_845)
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
.Lpcrel_callmul_846:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_846)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s4,x0,16
	srl	s3,s3,s4
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
.Lpcrel_callmul_847:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_847)
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
.Lpcrel_callmul_848:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_848)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s4,x0,16
	srl	s3,s3,s4
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
.Lpcrel_callmul_849:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_849)
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
.Lpcrel_callmul_850:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_850)
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
.Lpcrel_callmul_851:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_851)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	s3,x0,16
	srl	a2,a2,s3
	addi	s3,x0,16
	srl	s3,a3,s3
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
.Lpcrel_callmul_852:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_852)
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
	addi	s5,x0,16
	srl	s5,a0,s5
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
.Lpcrel_callmul_853:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_853)
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
	addi	s3,x0,16
	srl	a2,a2,s3
	addi	s3,x0,16
	srl	s3,a3,s3
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
.Lpcrel_callmul_854:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_854)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s4,x0,16
	srl	s3,s3,s4
	lui	s4,16
	addi	s4,s4,-1
	and	s4,a3,s4
	addi	s5,x0,16
	srl	s5,a0,s5
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
.Lpcrel_callmul_855:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_855)
	add	s4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s5,x0,16
	srl	s4,s4,s5
	addi	s5,x0,16
	srl	s5,a3,s5
	lui	a3,16
	addi	a3,a3,-1
	and	a3,s5,a3
	addi	s5,x0,16
	srl	s5,a0,s5
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
.Lpcrel_callmul_856:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_856)
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
	addi	a2,x0,6
	srl	a3,a3,a2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a3, x0
	add	a1, t2, x0
.Lpcrel_callmul_857:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_857)
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
.Lpcrel_callmul_858:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_858)
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
.Lpcrel_callmul_859:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_859)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	s2,x0,16
	srl	a2,a2,s2
	addi	s2,x0,16
	srl	s2,s6,s2
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
.Lpcrel_callmul_860:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_860)
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
	addi	s4,x0,16
	srl	s4,a0,s4
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
.Lpcrel_callmul_861:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_861)
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
	addi	s2,x0,16
	srl	a2,a2,s2
	addi	s2,x0,16
	srl	s2,s6,s2
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
.Lpcrel_callmul_862:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_862)
	add	s2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s3,x0,16
	srl	s2,s2,s3
	lui	s3,16
	addi	s3,s3,-1
	and	s3,s6,s3
	addi	s4,x0,16
	srl	s4,a0,s4
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
.Lpcrel_callmul_863:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_863)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s4,x0,16
	srl	s3,s3,s4
	addi	s4,x0,16
	srl	s4,s6,s4
	lui	s5,16
	addi	s5,s5,-1
	and	s4,s4,s5
	addi	s5,x0,16
	srl	s5,a0,s5
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
.Lpcrel_callmul_864:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_864)
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
	addi	s4,x0,6
	srl	a2,a2,s4
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s3, x0
	add	a1, a2, x0
.Lpcrel_callmul_865:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_865)
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
.Lpcrel_callmul_866:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_866)
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
.Lpcrel_callmul_867:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_867)
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
.Lpcrel_callmul_868:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_868)
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
.Lpcrel_callmul_869:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_869)
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
.Lpcrel_callmul_870:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_870)
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
.Lpcrel_callmul_871:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_871)
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
.Lpcrel_callmul_872:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_872)
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
.Lpcrel_callmul_873:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_873)
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
.Lpcrel_callmul_874:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_874)
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
.Lpcrel_callmul_875:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_875)
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
.Lpcrel_callmul_876:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_876)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s4,x0,16
	srl	s3,s3,s4
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
.Lpcrel_callmul_877:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_877)
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
.Lpcrel_callmul_878:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_878)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s4,x0,16
	srl	s3,s3,s4
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
.Lpcrel_callmul_879:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_879)
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
.Lpcrel_callmul_880:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_880)
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
.Lpcrel_callmul_881:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_881)
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
	srl	s3,a2,s3
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
.Lpcrel_callmul_882:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_882)
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
	addi	s5,x0,16
	srl	s5,a7,s5
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
.Lpcrel_callmul_883:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_883)
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
	addi	s3,x0,16
	srl	s2,s2,s3
	addi	s3,x0,16
	srl	s3,a2,s3
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
.Lpcrel_callmul_884:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_884)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s4,x0,16
	srl	s3,s3,s4
	lui	s4,16
	addi	s4,s4,-1
	and	s4,a2,s4
	addi	s5,x0,16
	srl	s5,a7,s5
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
.Lpcrel_callmul_885:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_885)
	add	s4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	s5,x0,16
	srl	s4,s4,s5
	addi	s5,x0,16
	srl	s5,a2,s5
	lui	a2,16
	addi	a2,a2,-1
	and	a2,s5,a2
	addi	s5,x0,16
	srl	s5,a7,s5
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
.Lpcrel_callmul_886:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_886)
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
	addi	s4,x0,18
	srl	a2,a2,s4
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
	addi	s3,x0,31
	srl	s3,t1,s3
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
.Lpcrel_callmul_887:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_887)
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
.Lpcrel_callmul_888:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_888)
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
.Lpcrel_callmul_889:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_889)
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
.Lpcrel_callmul_890:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_890)
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
.Lpcrel_callmul_891:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_891)
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
.Lpcrel_callmul_892:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_892)
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
.Lpcrel_callmul_893:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_893)
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
.Lpcrel_callmul_894:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_894)
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
.Lpcrel_callmul_895:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_895)
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
.Lpcrel_callmul_896:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_896)
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
.Lpcrel_callmul_897:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_897)
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
.Lpcrel_callmul_898:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_898)
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
.Lpcrel_callmul_899:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_899)
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
.Lpcrel_callmul_900:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_900)
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
.Lpcrel_callmul_901:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_901)
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
.Lpcrel_callmul_902:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_902)
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
.Lpcrel_callmul_903:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_903)
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
.Lpcrel_callmul_904:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_904)
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
.Lpcrel_callmul_905:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_905)
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
.Lpcrel_calldiv_906:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_906)
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
.Lpcrel_calldiv_907:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_907)
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
.Lpcrel_calldiv_908:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_908)
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
.Lpcrel_calldiv_909:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_909)
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
.Lpcrel_calldiv_910:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_910)
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
.Lpcrel_calldiv_911:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_911)
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
.Lpcrel_calldiv_912:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_912)
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
.Lpcrel_calldiv_913:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_913)
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
.Lpcrel_calldiv_914:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_914)
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
.Lpcrel_calldiv_915:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_915)
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
.Lpcrel_calldiv_916:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_916)
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
.Lpcrel_calldiv_917:
	auipc	ra, %pcrel_hi(__riscv_div_lib_divsi3)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_calldiv_917)
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
	and	a5,a5,t0
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
.Lpcrel_callmul_918:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_918)
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
.Lpcrel_callmul_919:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_919)
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
.Lpcrel_callmul_920:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_920)
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
.Lpcrel_callmul_921:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_921)
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
.Lpcrel_callmul_922:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_922)
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
.Lpcrel_callmul_923:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_923)
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
.Lpcrel_callmul_924:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_924)
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
.Lpcrel_callmul_925:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_925)
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
.Lpcrel_callmul_926:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_926)
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
.Lpcrel_callmul_927:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_927)
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
.Lpcrel_callmul_928:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_928)
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
.Lpcrel_callmul_929:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_929)
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
.Lpcrel_callmul_930:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_930)
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
.Lpcrel_callmul_931:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_931)
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
.Lpcrel_callmul_932:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_932)
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
.Lpcrel_callmul_933:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_933)
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
.Lpcrel_callmul_934:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_934)
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
.Lpcrel_callmul_935:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_935)
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
.Lpcrel_callmul_936:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_936)
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
.Lpcrel_callmul_937:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_937)
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
.Lpcrel_callmul_938:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_938)
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
.Lpcrel_callmul_939:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_939)
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
.Lpcrel_callmul_940:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_940)
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
.Lpcrel_callmul_941:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_941)
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
.Lpcrel_callmul_942:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_942)
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
.Lpcrel_callmul_943:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_943)
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
.Lpcrel_callmul_944:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_944)
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
.Lpcrel_callmul_945:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_945)
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
.Lpcrel_callmul_946:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_946)
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
.Lpcrel_callmul_947:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_947)
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
.Lpcrel_callmul_948:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_948)
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
.Lpcrel_callmul_949:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_949)
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
.Lpcrel_callmul_950:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_950)
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
.Lpcrel_callmul_951:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_951)
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
.Lpcrel_callmul_952:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_952)
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
.Lpcrel_callmul_953:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_953)
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
.Lpcrel_callmul_954:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_954)
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
.Lpcrel_callmul_955:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_955)
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
.Lpcrel_callmul_956:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_956)
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
.Lpcrel_callmul_957:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_957)
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
.Lpcrel_callmul_958:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_958)
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
.Lpcrel_callmul_959:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_959)
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
.Lpcrel_callmul_960:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_960)
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
.Lpcrel_callmul_961:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_961)
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
.Lpcrel_callmul_962:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_962)
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
.Lpcrel_callmul_963:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_963)
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
.Lpcrel_callmul_964:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_964)
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
.Lpcrel_callmul_965:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_965)
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
.Lpcrel_callmul_966:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_966)
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
.Lpcrel_callmul_967:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_967)
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
.Lpcrel_callmul_968:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_968)
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
.Lpcrel_callmul_969:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_969)
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
.Lpcrel_callmul_970:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_970)
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
.Lpcrel_callmul_971:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_971)
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
.Lpcrel_callmul_972:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_972)
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
.Lpcrel_callmul_973:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_973)
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
.Lpcrel_callmul_974:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_974)
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
.Lpcrel_callmul_975:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_975)
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
.Lpcrel_callmul_976:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_976)
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
.Lpcrel_callmul_977:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_977)
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
.Lpcrel_callmul_978:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_978)
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
.Lpcrel_callmul_979:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_979)
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
	addi	a0,x0,30
	srl	a0,a3,a0
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
	addi	a3,x0,30
	srl	a3,a5,a3
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
	addi	a5,x0,2
	srl	a5,s3,a5
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
.Lpcrel_callmul_980:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_980)
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
	srl	t1,a5,t1
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
.Lpcrel_callmul_981:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_981)
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
.Lpcrel_callmul_982:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_982)
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
	srl	t1,a5,t1
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
.Lpcrel_callmul_983:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_983)
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
	and	t2,a5,t2
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
.Lpcrel_callmul_984:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_984)
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
	srl	t3,a5,t3
	lui	a5,16
	addi	a5,a5,-1
	and	a5,t3,a5
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
	add	a0, a5, x0
	add	a1, t3, x0
.Lpcrel_callmul_985:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_985)
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
	addi	a2,x0,5
	srl	a2,s3,a2
	addi	a0,s4,0
	sub	t0,x0,s3
	sub	s3,s7,t0
	addi	t0,x0,2
	srl	a5,a5,t0
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
.Lpcrel_callmul_986:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_986)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	t0,x0,16
	srl	a3,a3,t0
	addi	t0,x0,16
	srl	t0,a5,t0
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
.Lpcrel_callmul_987:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_987)
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
	srl	t2,s5,t2
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
.Lpcrel_callmul_988:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_988)
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
	srl	t0,a5,t0
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
.Lpcrel_callmul_989:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_989)
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
	srl	t2,s5,t2
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
.Lpcrel_callmul_990:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_990)
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
	srl	t3,s5,t3
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
.Lpcrel_callmul_991:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_991)
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
	addi	t0,x0,6
	srl	a3,a3,t0
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
.Lpcrel_callmul_992:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_992)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	t0,x0,16
	srl	a1,a1,t0
	addi	t0,x0,16
	srl	t0,s1,t0
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
.Lpcrel_callmul_993:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_993)
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
	addi	t2,x0,16
	srl	t2,s5,t2
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
.Lpcrel_callmul_994:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_994)
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
	addi	t0,x0,16
	srl	a1,a1,t0
	addi	t0,x0,16
	srl	t0,s1,t0
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
.Lpcrel_callmul_995:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_995)
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
	and	t1,s1,t1
	addi	t2,x0,16
	srl	t2,s5,t2
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
.Lpcrel_callmul_996:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_996)
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
	srl	t2,s1,t2
	lui	t3,16
	addi	t3,t3,-1
	and	t2,t2,t3
	addi	t3,x0,16
	srl	t3,s5,t3
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
.Lpcrel_callmul_997:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_997)
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
.Lpcrel_callmul_998:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_998)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	t0,x0,6
	srl	a1,a1,t0
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
.Lpcrel_callmul_999:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_999)
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
	and	t2,s8,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_1000:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1000)
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
.Lpcrel_callmul_1001:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1001)
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
	and	t2,s8,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t2, x0
.Lpcrel_callmul_1002:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1002)
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
.Lpcrel_callmul_1003:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1003)
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
	lui	a2,16
	addi	a2,a2,-1
	and	a2,t3,a2
	addi	t3,x0,16
	srl	t3,s8,t3
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
.Lpcrel_callmul_1004:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1004)
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
	addi	t0,x0,7
	srl	a2,a2,t0
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
.Lpcrel_callmul_1005:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1005)
	add	a1, a0, x0
	lw	a0, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	addi	t0,x0,16
	srl	a1,a1,t0
	addi	t0,x0,16
	srl	t0,s9,t0
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
.Lpcrel_callmul_1006:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1006)
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
	srl	t2,s5,t2
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
.Lpcrel_callmul_1007:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1007)
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
	addi	t0,x0,16
	srl	a1,a1,t0
	addi	t0,x0,16
	srl	t0,s9,t0
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
.Lpcrel_callmul_1008:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1008)
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
	srl	t2,s5,t2
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
.Lpcrel_callmul_1009:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1009)
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
	srl	t3,s5,t3
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
.Lpcrel_callmul_1010:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1010)
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
	addi	a5,x0,1
	srl	a5,s2,a5
	addi	a4,x0,4
	srl	a4,s2,a4
	addi	a0,s4,0
	sub	t0,x0,s2
	sub	s2,s3,t0
	addi	t0,x0,6
	srl	a1,a1,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, s8, x0
.Lpcrel_callmul_1011:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1011)
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
.Lpcrel_callmul_1012:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1012)
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
	srl	t1,a4,t1
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
.Lpcrel_callmul_1013:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1013)
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
	addi	t3,x0,16
	srl	t3,s6,t3
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
.Lpcrel_callmul_1014:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1014)
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
	srl	t1,a4,t1
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
.Lpcrel_callmul_1015:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1015)
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
	and	t2,a4,t2
	addi	t3,x0,16
	srl	t3,s6,t3
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
.Lpcrel_callmul_1016:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1016)
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
	srl	t3,a4,t3
	lui	a4,16
	addi	a4,a4,-1
	and	a4,t3,a4
	addi	t3,x0,16
	srl	t3,s6,t3
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
.Lpcrel_callmul_1017:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1017)
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
.Lpcrel_callmul_1018:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1018)
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
	srl	t1,a5,t1
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
.Lpcrel_callmul_1019:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1019)
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
	addi	t3,x0,16
	srl	t3,s7,t3
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
.Lpcrel_callmul_1020:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1020)
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
	srl	t1,a5,t1
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
.Lpcrel_callmul_1021:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1021)
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
	and	t2,a5,t2
	addi	t3,x0,16
	srl	t3,s7,t3
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
.Lpcrel_callmul_1022:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1022)
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
	srl	t3,a5,t3
	lui	a5,16
	addi	a5,a5,-1
	and	a5,t3,a5
	addi	t3,x0,16
	srl	t3,s7,t3
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
.Lpcrel_callmul_1023:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1023)
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
	addi	a3,x0,14
	srl	a3,a4,a3
	addi	t0,x0,10
	srl	a5,a5,t0
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
	addi	t0,x0,1
	srl	a1,a1,t0
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