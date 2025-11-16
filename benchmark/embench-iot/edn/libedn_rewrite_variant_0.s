	.file	"libedn.c"
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
	.globl	vec_mpy1
	.type	vec_mpy1, @function
vec_mpy1:
	ori	a3,x0,300
	sub	a4,x0,a0
	sub	a3,a3,a4
.L6:
	lh	a5,0(a1)
	lhu	a4,0(a0)
	ori	a6,x0,2
	sub	a7,x0,a0
	sub	a0,a6,a7
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a2, x0
.Lpcrel_callmul_1:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_1)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	ori	a6,x0,2
	sub	a7,x0,a1
	sub	a1,a6,a7
	ori	a6,x0,15
	sub	a7,x0,x0
	sub	x0,a6,a7
	sra	a5,a5,x0
	sub	a6,x0,a5
	sub	a5,a4,a6
	sh	a5,-2(a0)
	beq	a3,a0,.+8
	jal	x0,.L6
	jalr	zero,ra,0
	.size	vec_mpy1, .-vec_mpy1
	.align	2
	.globl	mac
	.type	mac, @function
mac:
	lw	a7,0(a3)
	ori	a6,x0,0
	sub	a4,x0,a0
	sub	a6,a6,a4
	ori	t1,x0,300
	sub	a0,x0,a1
	sub	t1,t1,a0
	ori	a0,x0,0
	sub	a4,x0,a2
	sub	a0,a0,a4
.L9:
	lh	a4,0(a1)
	lh	a5,0(a6)
	ori	a2,x0,2
	sub	t0,x0,a1
	sub	a1,a2,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a4, x0
	add	a1, a4, x0
.Lpcrel_callmul_2:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_2)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ori	t0,x0,2
	sub	t2,x0,a6
	sub	a6,t0,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_callmul_3:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_3)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a4,x0,a0
	sub	a0,a2,a4
	sub	a2,x0,a7
	sub	a7,a5,a2
	beq	t1,a1,.+8
	jal	x0,.L9
	sw	a7,0(a3)
	jalr	zero,ra,0
	.size	mac, .-mac
	.align	2
	.globl	fir
	.type	fir, @function
fir:
	ori	a6,x0,100
	sub	a3,x0,a0
	sub	a6,a6,a3
	ori	a7,x0,0
	sub	a0,x0,a2
	sub	a7,a7,a0
	ori	t1,x0,0
	sub	a0,x0,zero
	sub	t1,t1,a0
	ori	t3,x0,50
	sub	a0,x0,zero
	sub	t3,t3,a0
.L12:
	ori	a5,x0,-100
	sub	a0,x0,a6
	sub	a5,a5,a0
	ori	a3,x0,0
	sub	a0,x0,a1
	sub	a3,a3,a0
	ori	a2,x0,0
	sub	a0,x0,zero
	sub	a2,a2,a0
.L13:
	lh	a4,0(a5)
	lh	a0,0(a3)
	ori	t0,x0,2
	sub	t2,x0,a5
	sub	a5,t0,t2
	ori	t0,x0,2
	sub	t2,x0,a3
	sub	a3,t0,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, a4, x0
.Lpcrel_callmul_4:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_4)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a2
	sub	a2,a4,t0
	beq	a6,a5,.+8
	jal	x0,.L13
	ori	a3,x0,15
	sub	a4,x0,x0
	sub	x0,a3,a4
	sra	a2,a2,x0
	sw	a2,0(a7)
	ori	a2,x0,1
	sub	a3,x0,t1
	sub	t1,a2,a3
	ori	a2,x0,4
	sub	a3,x0,a7
	sub	a7,a2,a3
	ori	a2,x0,2
	sub	a3,x0,a6
	sub	a6,a2,a3
	beq	t1,t3,.+8
	jal	x0,.L12
	jalr	zero,ra,0
	.size	fir, .-fir
	.align	2
	.globl	fir_no_red_ld
	.type	fir_no_red_ld, @function
fir_no_red_ld:
	ori	t4,x0,66
	sub	a3,x0,a0
	sub	t4,t4,a3
	ori	t5,x0,0
	sub	a0,x0,a2
	sub	t5,t5,a0
	ori	t6,x0,0
	sub	a0,x0,zero
	sub	t6,t6,a0
	ori	t0,x0,100
	sub	a0,x0,zero
	sub	t0,t0,a0
.L18:
	lh	t1,-66(t4)
	ori	a5,x0,-64
	sub	a0,x0,t4
	sub	a5,a5,a0
	ori	a7,x0,0
	sub	a0,x0,a1
	sub	a7,a7,a0
	ori	a0,x0,0
	sub	a2,x0,zero
	sub	a0,a0,a2
	ori	a6,x0,0
	sub	a2,x0,zero
	sub	a6,a6,a2
.L17:
	lh	a2,0(a7)
	lh	a3,0(a5)
	lh	a4,2(a7)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, a2, x0
.Lpcrel_callmul_5:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_5)
	add	t3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lh	t1,2(a5)
	addi	sp,sp,-16
	sw	s2,0(sp)
	ori	t2,x0,4
	sub	s2,x0,a5
	sub	a5,t2,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	ori	t2,x0,4
	sub	s2,x0,a7
	sub	a7,t2,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, a3, x0
.Lpcrel_callmul_6:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_6)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	t2,x0,t3
	sub	a6,a6,t2
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, a4, x0
.Lpcrel_callmul_7:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_7)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	t2,x0,a2
	sub	a0,a0,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, a4, x0
.Lpcrel_callmul_8:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_8)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a2,x0,a3
	sub	a6,a6,a2
	sub	a2,x0,a4
	sub	a0,a0,a2
	beq	t4,a5,.+8
	jal	x0,.L17
	ori	a2,x0,15
	sub	a3,x0,x0
	sub	x0,a2,a3
	sra	a6,a6,x0
	ori	a2,x0,15
	sub	a3,x0,x0
	sub	x0,a2,a3
	sra	a0,a0,x0
	sw	a6,0(t5)
	sw	a0,4(t5)
	ori	a2,x0,2
	sub	a3,x0,t6
	sub	t6,a2,a3
	ori	a2,x0,8
	sub	a3,x0,t5
	sub	t5,a2,a3
	ori	a2,x0,4
	sub	a3,x0,t4
	sub	t4,a2,a3
	beq	t6,t0,.+8
	jal	x0,.L18
	jalr	zero,ra,0
	.size	fir_no_red_ld, .-fir_no_red_ld
	.align	2
	.globl	latsynth
	.type	latsynth, @function
latsynth:
	slli	a4,a2,1
	ori	a5,x0,-2
	sub	a6,x0,a4
	sub	a4,a5,a6
	sub	a6,x0,a1
	sub	a6,a4,a6
	sub	a5,x0,a0
	sub	a5,a4,a5
	lh	a7,0(a6)
	lh	a5,0(a5)
	ori	a6,x0,1
	sub	t0,x0,zero
	sub	a6,a6,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a7, x0
.Lpcrel_callmul_9:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_9)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,a3,a5
	bge	a6,a2,.L22
	ori	a2,x0,2
	sub	a5,x0,a4
	sub	a4,a2,a5
	sub	a2,x0,a1
	sub	a1,a4,a2
	ori	a7,x0,2
	sub	a2,x0,a0
	sub	a7,a7,a2
	sub	a2,x0,a0
	sub	a4,a4,a2
.L23:
	lh	a5,-4(a1)
	lh	a2,-4(a4)
	ori	a6,x0,-2
	sub	t0,x0,a4
	sub	a4,a6,t0
	ori	a6,x0,-2
	sub	t0,x0,a1
	sub	a1,a6,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a2, x0
	add	a1, a5, x0
.Lpcrel_callmul_10:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_10)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,a3,a6
	ori	a6,x0,16
	sub	t0,x0,x0
	sub	x0,a6,t0
	sra	a6,a3,x0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a6, x0
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
	ori	t0,x0,16
	sub	t1,x0,x0
	sub	x0,t0,t1
	sra	a5,a5,x0
	sub	t0,x0,a5
	sub	a5,a2,t0
	sh	a5,0(a4)
	beq	a7,a4,.+8
	jal	x0,.L23
	sh	a6,0(a0)
	ori	a0,x0,0
	sub	a2,x0,a3
	sub	a0,a0,a2
	jalr	zero,ra,0
.L22:
	ori	a6,x0,16
	sub	a2,x0,x0
	sub	x0,a6,a2
	sra	a6,a3,x0
	sh	a6,0(a0)
	ori	a0,x0,0
	sub	a2,x0,a3
	sub	a0,a0,a2
	jalr	zero,ra,0
	.size	latsynth, .-latsynth
	.align	2
	.globl	iir1
	.type	iir1, @function
iir1:
	lh	a1,0(a1)
	ori	t4,x0,400
	sub	a4,x0,a0
	sub	t4,t4,a4
.L27:
	lw	a7,0(a3)
	lh	a4,4(a0)
	lw	t3,4(a3)
	lh	t1,6(a0)
	lh	a6,2(a0)
	lh	a5,0(a0)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, a7, x0
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
	sw	a7,4(a3)
	ori	t0,x0,8
	sub	t2,x0,a0
	sub	a0,t0,t2
	ori	t0,x0,8
	sub	t2,x0,a3
	sub	a3,t0,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, t3, x0
.Lpcrel_callmul_13:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_13)
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
	add	a1, t3, x0
.Lpcrel_callmul_14:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_14)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a4
	sub	a4,t1,t0
	ori	t0,x0,15
	sub	t1,x0,x0
	sub	x0,t0,t1
	sra	a4,a4,x0
	sub	t0,x0,a4
	sub	a4,a1,t0
	sw	a4,-8(a3)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a7, x0
.Lpcrel_callmul_15:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_15)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a1,x0,a5
	sub	a5,a6,a1
	ori	a1,x0,15
	sub	a6,x0,x0
	sub	x0,a1,a6
	sra	a5,a5,x0
	sub	a1,x0,a5
	sub	a1,a4,a1
	beq	a0,t4,.+8
	jal	x0,.L27
	sw	a1,0(a2)
	jalr	zero,ra,0
	.size	iir1, .-iir1
	.align	2
	.globl	codebook
	.type	codebook, @function
codebook:
	ori	a0,x0,0
	sub	a2,x0,a4
	sub	a0,a0,a2
	jalr	zero,ra,0
	.size	codebook, .-codebook
	.align	2
	.globl	jpegdct
	.type	jpegdct, @function
jpegdct:
	ori	a2,x0,-64
	sub	a3,x0,sp
	sub	sp,a2,a3
	sw	s5,40(sp)
	sw	s0,60(sp)
	sw	s1,56(sp)
	sw	s2,52(sp)
	sw	s3,48(sp)
	sw	s4,44(sp)
	sw	s6,36(sp)
	sw	s7,32(sp)
	sw	s8,28(sp)
	sw	s9,24(sp)
	sw	s10,20(sp)
	sw	s11,16(sp)
	ori	s5,x0,0
	sub	a2,x0,a0
	sub	s5,s5,a2
	ori	t6,x0,14
	sub	a2,x0,a0
	sub	t6,t6,a2
	ori	t5,x0,2
	sub	a2,x0,a0
	sub	t5,t5,a2
	ori	t4,x0,12
	sub	a2,x0,a0
	sub	t4,t4,a2
	ori	t3,x0,4
	sub	a2,x0,a0
	sub	t3,t3,a2
	ori	t1,x0,10
	sub	a2,x0,a0
	sub	t1,t1,a2
	ori	a7,x0,6
	sub	a2,x0,a0
	sub	a7,a7,a2
	ori	a6,x0,8
	sub	a2,x0,a0
	sub	a6,a6,a2
	ori	a2,x0,8
	sub	a3,x0,zero
	sub	a2,a2,a3
.L31:
	lh	a3,0(t6)
	lh	s3,0(a6)
	lh	s2,0(t4)
	lh	s1,0(t1)
	lh	t0,0(a0)
	lh	a4,0(a7)
	lh	s0,0(t5)
	lh	a5,0(t3)
	sub	s4,x0,a4
	sub	s4,s3,s4
	sub	s7,x0,s0
	sub	s7,s2,s7
	sub	s6,x0,a5
	sub	s6,s1,s6
	sub	t2,x0,t0
	sub	t2,a3,t2
	sub	t0,t0,a3
	sub	a3,x0,t2
	sub	a3,s4,a3
	sub	t2,t2,s4
	sub	s4,x0,s7
	sub	s4,s6,s4
	sub	s7,s7,s6
	sub	s6,x0,a3
	sub	s6,s4,s6
	sh	s6,0(a0)
	sub	a3,a3,s4
	sh	a3,0(a6)
	lh	a3,18(a1)
	lh	s8,20(a1)
	sub	s6,x0,s7
	sub	s6,t2,s6
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, t2, x0
.Lpcrel_callmul_16:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_16)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a4,a4,s3
	sub	s0,s0,s2
	sub	a5,a5,s1
	sub	s3,x0,s0
	sub	s3,a4,s3
	sub	s1,x0,t0
	sub	s1,a5,s1
	sub	s4,x0,s3
	sub	s4,s1,s4
	sub	t2,x0,a4
	sub	t2,t0,t2
	sub	s2,x0,a5
	sub	s2,s0,s2
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	ori	s2,x0,-1
	sub	s3,x0,a2
	sub	a2,s2,s3
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s6, x0
	add	a1, s8, x0
.Lpcrel_callmul_17:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_17)
	add	s6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	sp,sp,-16
	sw	s2,0(sp)
	ori	s8,x0,13
	sub	s2,x0,x0
	sub	x0,s8,s2
	sra	a3,a3,x0
	lw	s2,0(sp)
	addi	sp,sp,16
	slli	a2,a2,16
	srli	a2,a2,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	ori	s8,x0,16
	sub	s2,x0,a0
	sub	a0,s8,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	ori	s8,x0,16
	sub	s2,x0,a6
	sub	a6,s8,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	ori	s8,x0,16
	sub	s2,x0,t3
	sub	t3,s8,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	ori	s8,x0,16
	sub	s2,x0,t4
	sub	t4,s8,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	ori	s8,x0,16
	sub	s2,x0,t6
	sub	t6,s8,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	ori	s8,x0,16
	sub	s2,x0,t1
	sub	t1,s8,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	sub	s8,x0,s6
	sub	a3,a3,s8
	sh	a3,-16(t3)
	lh	a3,22(a1)
	addi	sp,sp,-16
	sw	s2,0(sp)
	ori	s8,x0,16
	sub	s2,x0,a7
	sub	a7,s8,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	ori	s8,x0,16
	sub	s2,x0,t5
	sub	t5,s8,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, s7, x0
.Lpcrel_callmul_18:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_18)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ori	s7,x0,13
	sub	s8,x0,x0
	sub	x0,s7,s8
	sra	a3,a3,x0
	sub	s7,x0,s6
	sub	s6,a3,s7
	sh	s6,-16(t4)
	lh	s6,16(a1)
	lhu	s7,8(a1)
	lh	a3,2(a1)
	lh	s8,4(a1)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s4, x0
	add	a1, s6, x0
.Lpcrel_callmul_19:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_19)
	add	s4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lh	s6,6(a1)
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, s3, x0
.Lpcrel_callmul_20:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_20)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lh	s3,0(a1)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t2, x0
	add	a1, s8, x0
.Lpcrel_callmul_21:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_21)
	add	t2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	sp,sp,-16
	sw	s2,0(sp)
	sub	s2,x0,a3
	sub	a3,s4,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, s7, x0
.Lpcrel_callmul_22:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_22)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s7,x0,t2
	sub	a4,a4,s7
	sub	s7,x0,a3
	sub	a4,a4,s7
	slli	s7,a4,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	ori	a4,x0,29
	sub	s2,x0,x0
	sub	x0,a4,s2
	sra	a4,s7,x0
	lw	s2,0(sp)
	addi	sp,sp,16
	sh	a4,-16(t6)
	lhu	s7,12(a1)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s6, x0
	add	a1, s1, x0
.Lpcrel_callmul_23:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_23)
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
	add	a0, a5, x0
	add	a1, s7, x0
.Lpcrel_callmul_24:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_24)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s1,x0,a4
	sub	a4,s4,s1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s2, x0
	add	a1, s3, x0
.Lpcrel_callmul_25:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_25)
	add	s1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	s2,x0,s1
	sub	a5,a5,s2
	sub	s2,x0,a4
	sub	a5,a5,s2
	slli	s2,a5,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	ori	a5,x0,29
	sub	s2,x0,x0
	sub	x0,a5,s2
	sra	a5,s2,x0
	lw	s2,0(sp)
	addi	sp,sp,16
	sh	a5,-16(t1)
	lhu	a5,10(a1)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, s0, x0
	add	a1, a5, x0
.Lpcrel_callmul_26:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_26)
	add	s0, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a5,x0,s1
	sub	s1,s0,a5
	sub	a5,x0,a3
	sub	a3,s1,a5
	slli	a5,a3,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	ori	a3,x0,29
	sub	s2,x0,x0
	sub	x0,a3,s2
	sra	a3,a5,x0
	lw	s2,0(sp)
	addi	sp,sp,16
	sh	a3,-16(a7)
	lhu	a5,14(a1)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t0, x0
	add	a1, a5, x0
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
	sub	a3,x0,t2
	sub	t2,t0,a3
	sub	a3,x0,a4
	sub	a4,t2,a3
	slli	a5,a4,16
	ori	a4,x0,29
	sub	a3,x0,x0
	sub	x0,a4,a3
	sra	a4,a5,x0
	sh	a4,-16(t5)
	beq	a2,zero,.+8
	jal	x0,.L31
	ori	s7,x0,16
	sub	a2,x0,zero
	sub	s7,s7,a2
	ori	t1,x0,0
	sub	a2,x0,zero
	sub	t1,t1,a2
	ori	s10,x0,1
	sub	a2,x0,zero
	sub	s10,s10,a2
	ori	s11,x0,126
	sub	a2,x0,zero
	sub	s11,s11,a2
	ori	s8,x0,14
	sub	a2,x0,zero
	sub	s8,s8,a2
	ori	s3,x0,8
	sub	a2,x0,zero
	sub	s3,s3,a2
.L33:
	beq	s3,s10,.+8
	jal	x0,.L38
	lw	s0,60(sp)
	lw	s1,56(sp)
	lw	s2,52(sp)
	lw	s3,48(sp)
	lw	s4,44(sp)
	lw	s5,40(sp)
	lw	s6,36(sp)
	lw	s7,32(sp)
	lw	s8,28(sp)
	lw	s9,24(sp)
	lw	s10,20(sp)
	lw	s11,16(sp)
	ori	a2,x0,64
	sub	a3,x0,sp
	sub	sp,a2,a3
	jalr	zero,ra,0
.L38:
	sub	a0,x0,s5
	sub	s5,s7,a0
	sub	t3,s11,s8
	sub	a0,x0,t3
	sub	t3,s5,a0
	ori	s5,x0,-128
	sub	a0,x0,t3
	sub	s5,s5,a0
	ori	s7,x0,2
	sub	a0,x0,zero
	sub	s7,s7,a0
	ori	s8,x0,112
	sub	a0,x0,zero
	sub	s8,s8,a0
	ori	s3,x0,1
	sub	a0,x0,zero
	sub	s3,s3,a0
	ori	s1,x0,-16
	sub	a0,x0,t3
	sub	s1,s1,a0
	ori	s0,x0,-112
	sub	a0,x0,t3
	sub	s0,s0,a0
	ori	t2,x0,-32
	sub	a0,x0,t3
	sub	t2,t2,a0
	ori	t0,x0,-96
	sub	a0,x0,t3
	sub	t0,t0,a0
	ori	t6,x0,-48
	sub	a0,x0,t3
	sub	t6,t6,a0
	ori	t5,x0,-80
	sub	a0,x0,t3
	sub	t5,t5,a0
	ori	s2,x0,0
	sub	a0,x0,s5
	sub	s2,s2,a0
	ori	a0,x0,-64
	sub	a2,x0,t3
	sub	t3,a0,a2
	ori	s6,x0,3
	sub	a0,x0,t1
	sub	s6,s6,a0
	ori	a7,x0,16
	sub	a0,x0,t1
	sub	a7,a7,a0
	ori	t4,x0,8
	sub	a0,x0,zero
	sub	t4,t4,a0
	sw	s8,4(sp)
	sw	s7,8(sp)
	sw	s3,12(sp)
.L32:
	lh	t1,0(s1)
	lh	a0,0(t3)
	lh	a3,0(s2)
	lh	a4,0(t5)
	lh	a6,0(t2)
	lh	s4,0(t6)
	lh	a2,0(s0)
	lh	a5,0(t0)
	sub	s3,x0,t1
	sub	s3,a3,s3
	sub	a3,a3,t1
	sub	t1,x0,a0
	sub	t1,a4,t1
	sub	a4,a4,a0
	sub	a0,x0,t1
	sub	a0,s3,a0
	sub	s3,s3,t1
	sub	t1,x0,a6
	sub	t1,a2,t1
	sub	a2,a2,a6
	sub	a6,x0,s4
	sub	a6,a5,a6
	sub	a5,a5,s4
	sub	s4,x0,a6
	sub	s4,t1,s4
	sub	t1,t1,a6
	sub	a6,x0,s4
	sub	a6,a0,a6
	sra	a6,a6,s6
	sub	a0,a0,s4
	sh	a6,0(s2)
	sra	a0,a0,s6
	sh	a0,0(t3)
	lh	a0,18(a1)
	lh	a6,20(a1)
	sub	s7,x0,s3
	sub	s7,t1,s7
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, s3, x0
.Lpcrel_callmul_28:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_28)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	s4,x0,a4
	sub	s4,a2,s4
	sub	s3,x0,a5
	sub	s3,a3,s3
	sub	s9,x0,s3
	sub	s9,s4,s9
	sub	s8,x0,a3
	sub	s8,a4,s8
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	ori	s2,x0,-1
	sub	s3,x0,t4
	sub	t4,s2,s3
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	slli	t4,t4,16
	srli	t4,t4,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	ori	s2,x0,2
	sub	s3,x0,s2
	sub	s2,s2,s3
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	ori	s2,x0,2
	sub	s3,x0,t3
	sub	t3,s2,s3
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a6, x0
	add	a1, s7, x0
.Lpcrel_callmul_29:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_29)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sra	a0,a0,a7
	sub	s7,x0,a2
	sub	s7,a5,s7
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	ori	s2,x0,2
	sub	s3,x0,t0
	sub	t0,s2,s3
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	ori	s2,x0,2
	sub	s3,x0,t2
	sub	t2,s2,s3
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	ori	s2,x0,2
	sub	s3,x0,s1
	sub	s1,s2,s3
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	ori	s2,x0,2
	sub	s3,x0,t6
	sub	t6,s2,s3
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	ori	s2,x0,2
	sub	s3,x0,t5
	sub	t5,s2,s3
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	ori	s2,x0,2
	sub	s3,x0,s0
	sub	s0,s2,s3
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	sub	s2,x0,a6
	sub	a0,a0,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	sh	a0,-2(t0)
	lh	a0,22(a1)
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, t1, x0
.Lpcrel_callmul_30:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_30)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sra	a0,a0,a7
	sub	t1,x0,a6
	sub	a6,a0,t1
	sh	a6,-2(t2)
	lh	t1,2(a1)
	lh	a0,6(a1)
	lh	a6,16(a1)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, t1, x0
	add	a1, s4, x0
.Lpcrel_callmul_31:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_31)
	add	t1, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lhu	s4,8(a1)
	addi	sp, sp, -16
	sw	a1, 0(sp)
	sw	a2, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a1, s3, x0
.Lpcrel_callmul_32:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_32)
	add	a0, a0, x0
	lw	a1, 0(sp)
	lw	a2, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	lh	s3,4(a1)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a6, x0
	add	a1, s9, x0
.Lpcrel_callmul_33:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_33)
	add	a6, a0, x0
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
	add	a0, s3, x0
	add	a1, s8, x0
.Lpcrel_callmul_34:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_34)
	add	s3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	sp,sp,-16
	sw	s2,0(sp)
	sub	s2,x0,t1
	sub	t1,a6,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	sub	s2,x0,a0
	sub	a0,a6,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	lh	a6,0(a1)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, s4, x0
.Lpcrel_callmul_35:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_35)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	addi	sp,sp,-16
	sw	s2,0(sp)
	sub	s2,x0,s3
	sub	a4,a4,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	sub	s2,x0,t1
	sub	a4,a4,s2
	lw	s2,0(sp)
	addi	sp,sp,16
	slli	a4,a4,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	sw	s3,4(sp)
	ori	s2,x0,16
	sub	s3,x0,x0
	sub	x0,s2,s3
	sra	a4,a4,x0
	lw	s2,0(sp)
	lw	s3,4(sp)
	addi	sp,sp,16
	sra	a4,a4,a7
	sh	a4,-2(s1)
	lhu	a4,12(a1)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a6, x0
	add	a1, s7, x0
.Lpcrel_callmul_36:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_36)
	add	a6, a0, x0
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
	add	a0, a5, x0
	add	a1, a4, x0
.Lpcrel_callmul_37:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_37)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a4,x0,a6
	sub	a5,a5,a4
	sub	a4,x0,a0
	sub	a5,a5,a4
	slli	a5,a5,16
	addi	sp,sp,-16
	sw	s2,0(sp)
	ori	a4,x0,16
	sub	s2,x0,x0
	sub	x0,a4,s2
	sra	a5,a5,x0
	lw	s2,0(sp)
	addi	sp,sp,16
	sra	a5,a5,a7
	sh	a5,-2(t6)
	lhu	a5,10(a1)
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a3, 8(sp)
	sw	ra, 12(sp)
	add	a0, a2, x0
	add	a1, a5, x0
.Lpcrel_callmul_38:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_38)
	add	a2, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a3, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a4,x0,a6
	sub	a6,a2,a4
	sub	a2,x0,t1
	sub	t1,a6,a2
	slli	t1,t1,16
	ori	a2,x0,16
	sub	a4,x0,x0
	sub	x0,a2,a4
	sra	t1,t1,x0
	sra	t1,t1,a7
	sh	t1,-2(t5)
	lhu	a5,14(a1)
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, a5, x0
.Lpcrel_callmul_39:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_39)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	sub	a2,x0,s3
	sub	s3,a3,a2
	sub	a2,x0,a0
	sub	a0,s3,a2
	slli	a0,a0,16
	ori	a2,x0,16
	sub	a3,x0,x0
	sub	x0,a2,a3
	sra	a0,a0,x0
	sra	a0,a0,a7
	sh	a0,-2(s0)
	beq	t4,zero,.+8
	jal	x0,.L32
	lw	s8,4(sp)
	lw	s7,8(sp)
	lw	s3,12(sp)
	ori	t1,x0,0
	sub	a2,x0,s6
	sub	t1,t1,a2
	jal	x0,.L33
	.size	jpegdct, .-jpegdct
	.align	2
	.type	benchmark_body.constprop.0.isra.0, @function
benchmark_body.constprop.0.isra.0:
	ori	a0,x0,-864
	sub	a1,x0,sp
	sub	sp,a0,a1
	lui	a2,%hi(.LANCHOR0)
	sw	s0,856(sp)
	sw	s1,852(sp)
	sw	s2,848(sp)
	sw	s3,844(sp)
	sw	s9,820(sp)
	sw	s10,816(sp)
	sw	s11,812(sp)
	lui	s2,%hi(.LANCHOR1)
	ori	a0,x0,%lo(.LANCHOR0)
	sub	a1,x0,a2
	sub	a2,a0,a1
	lui	s1,%hi(.LANCHOR1+400)
	lui	s9,%hi(.LANCHOR0+1200)
	lui	a0,%hi(.LANCHOR0+800)
	lui	s11,%hi(.LANCHOR0+1100)
	lui	s10,%hi(.LANCHOR0+1500)
	lui	s0,%hi(.LANCHOR0+1300)
	lui	t5,%hi(.LANCHOR0+798)
	lui	s3,11
	sw	s4,840(sp)
	sw	s5,836(sp)
	sw	s6,832(sp)
	sw	s7,828(sp)
	sw	s8,824(sp)
	sw	ra,860(sp)
	ori	a1,x0,%lo(.LANCHOR1)
	sub	a3,x0,s2
	sub	s2,a1,a3
	ori	s8,x0,1600
	sub	a1,x0,a2
	sub	s8,s8,a1
	ori	a1,x0,%lo(.LANCHOR1+400)
	sub	a3,x0,s1
	sub	s1,a1,a3
	ori	a1,x0,%lo(.LANCHOR0+1200)
	sub	a3,x0,s9
	sub	s9,a1,a3
	ori	s7,x0,%lo(.LANCHOR0+800)
	sub	a1,x0,a0
	sub	s7,s7,a1
	ori	a0,x0,%lo(.LANCHOR0+1100)
	sub	a1,x0,s11
	sub	s11,a0,a1
	ori	a0,x0,%lo(.LANCHOR0+1500)
	sub	a1,x0,s10
	sub	s10,a0,a1
	ori	a0,x0,%lo(.LANCHOR0+1300)
	sub	a1,x0,s0
	sub	s0,a0,a1
	ori	s6,x0,%lo(.LANCHOR0+798)
	sub	a0,x0,t5
	sub	s6,s6,a0
	ori	a0,x0,-1366
	sub	a1,x0,s3
	sub	s3,a0,a1
	ori	s5,x0,87
	sub	a0,x0,zero
	sub	s5,s5,a0
	ori	s4,x0,50
	sub	a0,x0,zero
	sub	s4,s4,a0
.L50:
	ori	a5,x0,0
	sub	a0,x0,s2
	sub	a5,a5,a0
	ori	a4,x0,0
	sub	a0,x0,sp
	sub	a4,a4,a0
.L40:
	lw	a6,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	lw	a3,12(a5)
	sw	a6,0(a4)
	sw	a0,4(a4)
	sw	a1,8(a4)
	sw	a3,12(a4)
	ori	a0,x0,16
	sub	a1,x0,a5
	sub	a5,a0,a1
	ori	a0,x0,16
	sub	a1,x0,a4
	sub	a4,a0,a1
	beq	a5,s1,.+8
	jal	x0,.L40
	ori	a4,x0,400
	sub	a0,x0,sp
	sub	a4,a4,a0
.L41:
	lw	a3,12(a5)
	lw	a6,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	sw	a3,12(a4)
	lui	a3,%hi(.LANCHOR1+800)
	sw	a6,0(a4)
	sw	a0,4(a4)
	sw	a1,8(a4)
	ori	a0,x0,16
	sub	a1,x0,a5
	sub	a5,a0,a1
	ori	a0,x0,%lo(.LANCHOR1+800)
	sub	a1,x0,a3
	sub	a3,a0,a1
	ori	a0,x0,16
	sub	a1,x0,a4
	sub	a4,a0,a1
	beq	a5,a3,.+8
	jal	x0,.L41
	ori	a1,x0,400
	sub	a0,x0,sp
	sub	a1,a1,a0
	ori	a3,x0,0
	sub	a0,x0,sp
	sub	a3,a3,a0
	ori	a4,x0,0
	sub	a0,x0,s7
	sub	a4,a4,a0
	ori	a5,x0,0
	sub	a0,x0,s9
	sub	a5,a5,a0
.L42:
	lw	a6,0(a3)
	lw	a0,0(a1)
	ori	a7,x0,4
	sub	t0,x0,a5
	sub	a5,a7,t0
	sw	a6,0(a4)
	sw	a0,-4(a5)
	ori	a0,x0,4
	sub	a6,x0,a3
	sub	a3,a0,a6
	ori	a0,x0,4
	sub	a6,x0,a4
	sub	a4,a0,a6
	ori	a0,x0,4
	sub	a6,x0,a1
	sub	a1,a0,a6
	beq	s8,a5,.+8
	jal	x0,.L42
	ori	a3,x0,0
	sub	a0,x0,s9
	sub	a3,a3,a0
	ori	a4,x0,0
	sub	a0,x0,s7
	sub	a4,a4,a0
.L43:
	lh	a1,0(a3)
	lhu	a0,0(a4)
	ori	a5,x0,2
	sub	a6,x0,a4
	sub	a4,a5,a6
	slli	a5,a1,1
	sub	a6,x0,a5
	sub	a5,a1,a6
	ori	a1,x0,15
	sub	a6,x0,x0
	sub	x0,a1,a6
	sra	a5,a5,x0
	sub	a1,x0,a5
	sub	a5,a0,a1
	sh	a5,-2(a4)
	ori	a0,x0,2
	sub	a1,x0,a3
	sub	a3,a0,a1
	beq	s11,a4,.+8
	jal	x0,.L43
	lw	a6,0(a2)
	ori	a1,x0,0
	sub	a0,x0,s7
	sub	a1,a1,a0
	ori	a5,x0,0
	sub	a0,x0,s9
	sub	a5,a5,a0
	ori	a0,x0,3
	sub	a3,x0,zero
	sub	a0,a0,a3
.L44:
	lh	a3,0(a5)
	lh	a4,0(a1)
	ori	a7,x0,2
	sub	t0,x0,a5
	sub	a5,a7,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a3, x0
	add	a1, a3, x0
.Lpcrel_callmul_40:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_40)
	add	a7, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	ori	t0,x0,2
	sub	t1,x0,a1
	sub	a1,t0,t1
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, a3, x0
.Lpcrel_callmul_41:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_41)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,x0,a0
	sub	a0,a7,a3
	sub	a3,x0,a6
	sub	a6,a4,a3
	beq	s10,a5,.+8
	jal	x0,.L44
	lui	a5,%hi(c)
	sw	a6,0(a2)
	sh	a0,%lo(c)(a5)
	ori	t1,x0,0
	sub	a0,x0,a2
	sub	t1,t1,a0
	ori	a7,x0,0
	sub	a0,x0,s7
	sub	a7,a7,a0
	ori	a6,x0,0
	sub	a0,x0,zero
	sub	a6,a6,a0
.L45:
	ori	a5,x0,0
	sub	a0,x0,s9
	sub	a5,a5,a0
	ori	a3,x0,0
	sub	a0,x0,a7
	sub	a3,a3,a0
	ori	a1,x0,0
	sub	a0,x0,zero
	sub	a1,a1,a0
.L46:
	lh	a4,0(a3)
	lh	a0,0(a5)
	ori	a2,x0,2
	sub	t0,x0,a5
	sub	a5,a2,t0
	ori	a2,x0,2
	sub	t0,x0,a3
	sub	a3,a2,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, a4, x0
.Lpcrel_callmul_42:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_42)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a0,x0,a1
	sub	a1,a4,a0
	beq	s0,a5,.+8
	jal	x0,.L46
	ori	a0,x0,15
	sub	a2,x0,x0
	sub	x0,a0,a2
	sra	a1,a1,x0
	sw	a1,0(t1)
	ori	a0,x0,1
	sub	a1,x0,a6
	sub	a6,a0,a1
	ori	a0,x0,4
	sub	a1,x0,t1
	sub	t1,a0,a1
	ori	a0,x0,2
	sub	a1,x0,a7
	sub	a7,a0,a1
	beq	a6,s4,.+8
	jal	x0,.L45
	ori	a1,x0,0
	sub	a0,x0,s9
	sub	a1,a1,a0
	ori	a0,x0,0
	sub	a1,x0,s7
	sub	a0,a0,a1
.Lpcrel_1:
	auipc	ra,%pcrel_hi(fir_no_red_ld)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
	lui	a5,%hi(.LANCHOR0)
	ori	a2,x0,%lo(.LANCHOR0)
	sub	a0,x0,a5
	sub	a2,a2,a0
	lh	a3,998(a2)
	lh	a5,1398(a2)
	lui	a4,%hi(.LANCHOR0+996)
	lui	a1,%hi(.LANCHOR0+1396)
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, a5, x0
.Lpcrel_callmul_43:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_43)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ori	a0,x0,%lo(.LANCHOR0+996)
	sub	a5,x0,a4
	sub	a4,a0,a5
	ori	a0,x0,%lo(.LANCHOR0+1396)
	sub	a5,x0,a1
	sub	a1,a0,a5
	sub	a3,s3,a3
.L48:
	lh	a0,0(a4)
	lh	a5,0(a1)
	ori	a6,x0,-2
	sub	a7,x0,a4
	sub	a4,a6,a7
	ori	a6,x0,-2
	sub	a7,x0,a1
	sub	a1,a6,a7
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, a5, x0
.Lpcrel_callmul_44:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_44)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,a3,a6
	ori	a6,x0,16
	sub	a7,x0,x0
	sub	x0,a6,a7
	sra	a6,a3,x0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a6, x0
.Lpcrel_callmul_45:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_45)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	ori	a7,x0,16
	sub	t0,x0,x0
	sub	x0,a7,t0
	sra	a5,a5,x0
	sub	a7,x0,a5
	sub	a5,a0,a7
	sh	a5,4(a4)
	beq	s6,a4,.+8
	jal	x0,.L48
	lh	t1,1200(a2)
	lui	a4,%hi(d)
	sh	a6,800(a2)
	sw	a3,%lo(d)(a4)
	ori	a0,x0,0
	sub	a1,x0,a2
	sub	a0,a0,a1
	ori	a1,x0,0
	sub	a4,x0,s7
	sub	a1,a1,a4
.L49:
	lw	a6,0(a0)
	lh	a5,4(a1)
	lh	a4,0(a1)
	lw	t3,4(a0)
	lh	a7,6(a1)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a6, x0
.Lpcrel_callmul_46:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_46)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sw	a6,4(a0)
	ori	t0,x0,8
	sub	t2,x0,a1
	sub	a1,t0,t2
	ori	t0,x0,8
	sub	t2,x0,a0
	sub	a0,t0,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, a6, x0
.Lpcrel_callmul_47:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_47)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lh	a6,-6(a1)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a7, x0
	add	a1, t3, x0
.Lpcrel_callmul_48:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_48)
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
	add	a0, a6, x0
	add	a1, t3, x0
.Lpcrel_callmul_49:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_49)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a5
	sub	a5,a7,t0
	ori	a7,x0,15
	sub	t0,x0,x0
	sub	x0,a7,t0
	sra	a5,a5,x0
	sub	a7,x0,a5
	sub	a5,t1,a7
	sw	a5,-8(a0)
	sub	a7,x0,a4
	sub	a4,a6,a7
	ori	a6,x0,15
	sub	a7,x0,x0
	sub	x0,a6,a7
	sra	a4,a4,x0
	sub	t1,x0,a4
	sub	t1,a5,t1
	beq	a1,s9,.+8
	jal	x0,.L49
	lui	a5,%hi(e)
	ori	a0,x0,0
	sub	a4,x0,s7
	sub	a0,a0,a4
	sw	t1,400(a2)
	sw	a3,%lo(e)(a5)
.Lpcrel_2:
	auipc	ra,%pcrel_hi(jpegdct)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_2)
	lui	a5,%hi(.LANCHOR0)
	ori	a2,x0,-1
	sub	a3,x0,s5
	sub	s5,a2,a3
	ori	a2,x0,%lo(.LANCHOR0)
	sub	a3,x0,a5
	sub	a2,a2,a3
	beq	s5,zero,.+8
	jal	x0,.L50
	lw	ra,860(sp)
	lw	s0,856(sp)
	lw	s1,852(sp)
	lw	s2,848(sp)
	lw	s3,844(sp)
	lw	s4,840(sp)
	lw	s5,836(sp)
	lw	s6,832(sp)
	lw	s7,828(sp)
	lw	s8,824(sp)
	lw	s9,820(sp)
	lw	s10,816(sp)
	lw	s11,812(sp)
	ori	a2,x0,864
	sub	a3,x0,sp
	sub	sp,a2,a3
	jalr	zero,ra,0
	.size	benchmark_body.constprop.0.isra.0, .-benchmark_body.constprop.0.isra.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	bge	zero,a0,.L84
	ori	a1,x0,-880
	sub	a2,x0,sp
	sub	sp,a1,a2
	lui	a2,%hi(.LANCHOR0)
	sw	s0,872(sp)
	sw	s1,868(sp)
	sw	s2,864(sp)
	sw	s4,856(sp)
	sw	s9,836(sp)
	sw	s10,832(sp)
	sw	s11,828(sp)
	sw	a0,12(sp)
	lui	s2,%hi(.LANCHOR1)
	ori	a0,x0,%lo(.LANCHOR0)
	sub	a1,x0,a2
	sub	a2,a0,a1
	lui	s1,%hi(.LANCHOR1+400)
	lui	s9,%hi(.LANCHOR0+1200)
	lui	a0,%hi(.LANCHOR0+800)
	lui	s11,%hi(.LANCHOR0+1100)
	lui	s10,%hi(.LANCHOR0+1500)
	lui	s0,%hi(.LANCHOR0+1300)
	lui	t6,%hi(.LANCHOR0+798)
	lui	s4,11
	sw	s3,860(sp)
	sw	s5,852(sp)
	sw	s6,848(sp)
	sw	s7,844(sp)
	sw	s8,840(sp)
	sw	ra,876(sp)
	ori	a1,x0,%lo(.LANCHOR1)
	sub	a3,x0,s2
	sub	s2,a1,a3
	ori	s8,x0,1600
	sub	a1,x0,a2
	sub	s8,s8,a1
	ori	a1,x0,%lo(.LANCHOR1+400)
	sub	a3,x0,s1
	sub	s1,a1,a3
	ori	a1,x0,%lo(.LANCHOR0+1200)
	sub	a3,x0,s9
	sub	s9,a1,a3
	ori	s7,x0,%lo(.LANCHOR0+800)
	sub	a1,x0,a0
	sub	s7,s7,a1
	ori	a0,x0,%lo(.LANCHOR0+1100)
	sub	a1,x0,s11
	sub	s11,a0,a1
	ori	a0,x0,%lo(.LANCHOR0+1500)
	sub	a1,x0,s10
	sub	s10,a0,a1
	ori	a0,x0,%lo(.LANCHOR0+1300)
	sub	a1,x0,s0
	sub	s0,a0,a1
	ori	s6,x0,%lo(.LANCHOR0+798)
	sub	a0,x0,t6
	sub	s6,s6,a0
	ori	a0,x0,-1366
	sub	a1,x0,s4
	sub	s4,a0,a1
	ori	s5,x0,0
	sub	a0,x0,zero
	sub	s5,s5,a0
	ori	s3,x0,50
	sub	a0,x0,zero
	sub	s3,s3,a0
.L73:
	ori	a5,x0,0
	sub	a0,x0,s2
	sub	a5,a5,a0
	ori	a4,x0,16
	sub	a0,x0,sp
	sub	a4,a4,a0
.L63:
	lw	a6,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	lw	a3,12(a5)
	sw	a6,0(a4)
	sw	a0,4(a4)
	sw	a1,8(a4)
	sw	a3,12(a4)
	ori	a0,x0,16
	sub	a1,x0,a5
	sub	a5,a0,a1
	ori	a0,x0,16
	sub	a1,x0,a4
	sub	a4,a0,a1
	beq	a5,s1,.+8
	jal	x0,.L63
	ori	a4,x0,416
	sub	a0,x0,sp
	sub	a4,a4,a0
.L64:
	lw	a3,12(a5)
	lw	a6,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	sw	a3,12(a4)
	lui	a3,%hi(.LANCHOR1+800)
	sw	a6,0(a4)
	sw	a0,4(a4)
	sw	a1,8(a4)
	ori	a0,x0,16
	sub	a1,x0,a5
	sub	a5,a0,a1
	ori	a0,x0,%lo(.LANCHOR1+800)
	sub	a1,x0,a3
	sub	a3,a0,a1
	ori	a0,x0,16
	sub	a1,x0,a4
	sub	a4,a0,a1
	beq	a5,a3,.+8
	jal	x0,.L64
	ori	a1,x0,416
	sub	a0,x0,sp
	sub	a1,a1,a0
	ori	a3,x0,16
	sub	a0,x0,sp
	sub	a3,a3,a0
	ori	a4,x0,0
	sub	a0,x0,s7
	sub	a4,a4,a0
	ori	a5,x0,0
	sub	a0,x0,s9
	sub	a5,a5,a0
.L65:
	lw	a6,0(a3)
	lw	a0,0(a1)
	ori	a7,x0,4
	sub	t0,x0,a5
	sub	a5,a7,t0
	sw	a6,0(a4)
	sw	a0,-4(a5)
	ori	a0,x0,4
	sub	a6,x0,a3
	sub	a3,a0,a6
	ori	a0,x0,4
	sub	a6,x0,a4
	sub	a4,a0,a6
	ori	a0,x0,4
	sub	a6,x0,a1
	sub	a1,a0,a6
	beq	s8,a5,.+8
	jal	x0,.L65
	ori	a3,x0,0
	sub	a0,x0,s9
	sub	a3,a3,a0
	ori	a4,x0,0
	sub	a0,x0,s7
	sub	a4,a4,a0
.L66:
	lh	a1,0(a3)
	lhu	a0,0(a4)
	ori	a5,x0,2
	sub	a6,x0,a4
	sub	a4,a5,a6
	slli	a5,a1,1
	sub	a6,x0,a5
	sub	a5,a1,a6
	ori	a1,x0,15
	sub	a6,x0,x0
	sub	x0,a1,a6
	sra	a5,a5,x0
	sub	a1,x0,a5
	sub	a5,a0,a1
	sh	a5,-2(a4)
	ori	a0,x0,2
	sub	a1,x0,a3
	sub	a3,a0,a1
	beq	s11,a4,.+8
	jal	x0,.L66
	lw	a6,0(a2)
	ori	a1,x0,0
	sub	a0,x0,s7
	sub	a1,a1,a0
	ori	a4,x0,0
	sub	a0,x0,s9
	sub	a4,a4,a0
	ori	a0,x0,3
	sub	a3,x0,zero
	sub	a0,a0,a3
.L67:
	lh	a5,0(a4)
	lh	a3,0(a1)
	ori	a7,x0,2
	sub	t0,x0,a4
	sub	a4,a7,t0
	ori	a7,x0,2
	sub	t0,x0,a1
	sub	a1,a7,t0
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, a5, x0
.Lpcrel_callmul_50:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_50)
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
	add	a0, a5, x0
	add	a1, a5, x0
.Lpcrel_callmul_51:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_51)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a7,x0,a6
	sub	a6,a3,a7
	sub	a3,x0,a0
	sub	a0,a5,a3
	beq	s10,a4,.+8
	jal	x0,.L67
	lui	a5,%hi(c)
	sw	a6,0(a2)
	sh	a0,%lo(c)(a5)
	ori	a7,x0,0
	sub	a0,x0,a2
	sub	a7,a7,a0
	ori	a6,x0,0
	sub	a0,x0,s7
	sub	a6,a6,a0
	ori	a0,x0,0
	sub	a1,x0,zero
	sub	a0,a0,a1
.L68:
	ori	a5,x0,0
	sub	a1,x0,s9
	sub	a5,a5,a1
	ori	a3,x0,0
	sub	a1,x0,a6
	sub	a3,a3,a1
	ori	a1,x0,0
	sub	a2,x0,zero
	sub	a1,a1,a2
.L69:
	lh	a4,0(a3)
	lh	t1,0(a5)
	ori	a2,x0,2
	sub	t0,x0,a5
	sub	a5,a2,t0
	ori	a2,x0,2
	sub	t0,x0,a3
	sub	a3,a2,t0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, t1, x0
.Lpcrel_callmul_52:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_52)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a2,x0,a1
	sub	a1,a4,a2
	beq	s0,a5,.+8
	jal	x0,.L69
	ori	a2,x0,15
	sub	a3,x0,x0
	sub	x0,a2,a3
	sra	a1,a1,x0
	sw	a1,0(a7)
	ori	a1,x0,1
	sub	a2,x0,a0
	sub	a0,a1,a2
	ori	a1,x0,4
	sub	a2,x0,a7
	sub	a7,a1,a2
	ori	a1,x0,2
	sub	a2,x0,a6
	sub	a6,a1,a2
	beq	a0,s3,.+8
	jal	x0,.L68
	ori	a1,x0,0
	sub	a0,x0,s9
	sub	a1,a1,a0
	ori	a0,x0,0
	sub	a1,x0,s7
	sub	a0,a0,a1
.Lpcrel_3:
	auipc	ra,%pcrel_hi(fir_no_red_ld)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_3)
	lui	a5,%hi(.LANCHOR0)
	ori	a2,x0,%lo(.LANCHOR0)
	sub	a0,x0,a5
	sub	a2,a2,a0
	lh	a3,998(a2)
	lh	a5,1398(a2)
	lui	a4,%hi(.LANCHOR0+996)
	lui	a1,%hi(.LANCHOR0+1396)
	addi	sp, sp, -16
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	ra, 12(sp)
	add	a0, a3, x0
	add	a1, a5, x0
.Lpcrel_callmul_53:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_53)
	add	a3, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ori	a0,x0,%lo(.LANCHOR0+996)
	sub	a5,x0,a4
	sub	a4,a0,a5
	ori	a0,x0,%lo(.LANCHOR0+1396)
	sub	a5,x0,a1
	sub	a1,a0,a5
	sub	a3,s4,a3
.L71:
	lh	a0,0(a4)
	lh	a5,0(a1)
	ori	a6,x0,-2
	sub	a7,x0,a4
	sub	a4,a6,a7
	ori	a6,x0,-2
	sub	a7,x0,a1
	sub	a1,a6,a7
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a1, a5, x0
.Lpcrel_callmul_54:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_54)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	a3,a3,a6
	ori	a6,x0,16
	sub	a7,x0,x0
	sub	x0,a6,a7
	sra	a6,a3,x0
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a6, x0
.Lpcrel_callmul_55:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_55)
	add	a5, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	ori	a7,x0,16
	sub	t0,x0,x0
	sub	x0,a7,t0
	sra	a5,a5,x0
	sub	a7,x0,a5
	sub	a5,a0,a7
	sh	a5,4(a4)
	beq	s6,a4,.+8
	jal	x0,.L71
	lh	t1,1200(a2)
	lui	a4,%hi(d)
	sh	a6,800(a2)
	sw	a3,%lo(d)(a4)
	ori	a0,x0,0
	sub	a1,x0,a2
	sub	a0,a0,a1
	ori	a1,x0,0
	sub	a4,x0,s7
	sub	a1,a1,a4
.L72:
	lw	a6,0(a0)
	lh	a5,4(a1)
	lh	a4,0(a1)
	lw	t3,4(a0)
	lh	a7,6(a1)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a5, x0
	add	a1, a6, x0
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
	sw	a6,4(a0)
	ori	t0,x0,8
	sub	t2,x0,a1
	sub	a1,t0,t2
	ori	t0,x0,8
	sub	t2,x0,a0
	sub	a0,t0,t2
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a4, x0
	add	a1, a6, x0
.Lpcrel_callmul_57:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_57)
	add	a4, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	lh	a6,-6(a1)
	addi	sp, sp, -32
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	sw	ra, 16(sp)
	add	a0, a7, x0
	add	a1, t3, x0
.Lpcrel_callmul_58:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_58)
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
	add	a0, a6, x0
	add	a1, t3, x0
.Lpcrel_callmul_59:
	auipc	ra, %pcrel_hi(__mul)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_callmul_59)
	add	a6, a0, x0
	lw	a0, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	lw	ra, 16(sp)
	addi	sp, sp, 32
	sub	t0,x0,a5
	sub	a5,a7,t0
	ori	a7,x0,15
	sub	t0,x0,x0
	sub	x0,a7,t0
	sra	a5,a5,x0
	sub	a7,x0,a5
	sub	a5,t1,a7
	sw	a5,-8(a0)
	sub	a7,x0,a4
	sub	a4,a6,a7
	ori	a6,x0,15
	sub	a7,x0,x0
	sub	x0,a6,a7
	sra	a4,a4,x0
	sub	t1,x0,a4
	sub	t1,a5,t1
	beq	a1,s9,.+8
	jal	x0,.L72
	lui	a5,%hi(e)
	ori	a0,x0,0
	sub	a4,x0,s7
	sub	a0,a0,a4
	sw	t1,400(a2)
	sw	a3,%lo(e)(a5)
.Lpcrel_4:
	auipc	ra,%pcrel_hi(jpegdct)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_4)
	lw	a5,12(sp)
	lui	a4,%hi(.LANCHOR0)
	ori	a2,x0,1
	sub	a3,x0,s5
	sub	s5,a2,a3
	ori	a2,x0,%lo(.LANCHOR0)
	sub	a3,x0,a4
	sub	a2,a2,a3
	beq	s5,a5,.+8
	jal	x0,.L73
	lw	ra,876(sp)
	lw	s0,872(sp)
	lw	s1,868(sp)
	lw	s2,864(sp)
	lw	s3,860(sp)
	lw	s4,856(sp)
	lw	s5,852(sp)
	lw	s6,848(sp)
	lw	s7,844(sp)
	lw	s8,840(sp)
	lw	s9,836(sp)
	lw	s10,832(sp)
	lw	s11,828(sp)
	ori	a2,x0,880
	sub	a3,x0,sp
	sub	sp,a2,a3
	jalr	zero,ra,0
.L84:
	jalr	zero,ra,0
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	jalr	zero,ra,0
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	warm_caches
	.type	warm_caches, @function
warm_caches:
	ori	a2,x0,-16
	sub	a3,x0,sp
	sub	sp,a2,a3
	sw	ra,12(sp)
.Lpcrel_5:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_5)
	lw	ra,12(sp)
	ori	a2,x0,16
	sub	a3,x0,sp
	sub	sp,a2,a3
	jalr	zero,ra,0
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	ori	a0,x0,-16
	sub	a2,x0,sp
	sub	sp,a0,a2
	sw	ra,12(sp)
.Lpcrel_6:
	auipc	ra,%pcrel_hi(benchmark_body.constprop.0.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_6)
	lw	ra,12(sp)
	ori	a0,x0,0
	sub	a2,x0,zero
	sub	a0,a0,a2
	ori	a2,x0,16
	sub	a3,x0,sp
	sub	sp,a2,a3
	jalr	zero,ra,0
	.size	benchmark, .-benchmark
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a4,%hi(.LANCHOR1)
	ori	a0,x0,%lo(.LANCHOR1)
	sub	a1,x0,a4
	sub	a4,a0,a1
	ori	a0,x0,-800
	sub	a1,x0,sp
	sub	sp,a0,a1
	ori	a5,x0,800
	sub	a0,x0,a4
	sub	a5,a5,a0
	ori	a3,x0,1600
	sub	a0,x0,a4
	sub	a3,a3,a0
	ori	a4,x0,0
	sub	a0,x0,sp
	sub	a4,a4,a0
.L93:
	lw	a6,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	sw	a6,0(a4)
	sw	a0,4(a4)
	sw	a1,8(a4)
	sw	a2,12(a4)
	ori	a0,x0,16
	sub	a1,x0,a5
	sub	a5,a0,a1
	ori	a0,x0,16
	sub	a1,x0,a4
	sub	a4,a0,a1
	beq	a5,a3,.+8
	jal	x0,.L93
	lui	a5,%hi(.LANCHOR0)
	ori	a0,x0,%lo(.LANCHOR0)
	sub	a1,x0,a5
	sub	a5,a0,a1
	ori	a1,x0,800
	sub	a0,x0,a5
	sub	a1,a1,a0
	ori	a4,x0,0
	sub	a0,x0,sp
	sub	a4,a4,a0
.L97:
	lbu	a2,0(a5)
	lbu	a3,0(a4)
	ori	a0,x0,1
	sub	a6,x0,a5
	sub	a5,a0,a6
	ori	a0,x0,1
	sub	a6,x0,a4
	sub	a4,a0,a6
	beq	a2,a3,.+8
	jal	x0,.L103
	beq	a5,a1,.+8
	jal	x0,.L97
	lui	a5,%hi(c)
	lh	a4,%lo(c)(a5)
	lui	a5,3
	ori	a0,x0,-2045
	sub	a2,x0,a5
	sub	a5,a0,a2
	ori	a0,x0,0
	sub	a2,x0,zero
	sub	a0,a0,a2
	beq	a4,a5,.L104
.L92:
	ori	a2,x0,800
	sub	a3,x0,sp
	sub	sp,a2,a3
	jalr	zero,ra,0
.L103:
	ori	a0,x0,0
	sub	a2,x0,zero
	sub	a0,a0,a2
	ori	a2,x0,800
	sub	a3,x0,sp
	sub	sp,a2,a3
	jalr	zero,ra,0
.L104:
	lui	a5,%hi(d)
	lw	a4,%lo(d)(a5)
	lui	a5,940694
	ori	a2,x0,-1558
	sub	a3,x0,a5
	sub	a5,a2,a3
	beq	a4,a5,.+8
	jal	x0,.L92
	lui	a5,%hi(e)
	lw	a0,%lo(e)(a5)
	lui	a5,107882
	ori	a2,x0,1558
	sub	a3,x0,a5
	sub	a5,a2,a3
	sub	a2,x0,a0
	sub	a0,a5,a2
	ori	a2,x0,1
	sub	a3,x0,x0
	sub	a2,a2,a3
	bltu	a0,a2,.+12
	ori	a0,x0,0
	sub	a2,x0,x0
	sub	a0,a0,a2
	jal	x0,.+8
	ori	a0,x0,1
	sub	a2,x0,x0
	sub	a0,a0,a2
	jal	x0,.L92
	.size	verify_benchmark, .-verify_benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	ori	a0,x0,-32
	sub	a2,x0,sp
	sub	sp,a0,a2
	ori	a0,x0,1
	sub	a2,x0,zero
	sub	a0,a0,a2
	sw	ra,28(sp)
.Lpcrel_7:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_7)
.Lpcrel_8:
	auipc	ra,%pcrel_hi(benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_8)
	sw	zero,12(sp)
	lw	a0,12(sp)
.Lpcrel_9:
	auipc	ra,%pcrel_hi(verify_benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_9)
	lw	ra,28(sp)
	ori	a2,x0,1
	sub	a3,x0,x0
	sub	a2,a2,a3
	or	a2,a2,a0
	ori	a3,x0,1
	sub	a4,x0,x0
	sub	a3,a3,a4
	ori	a4,x0,1
	sub	a5,x0,x0
	sub	x0,a4,a5
	or	x0,x0,a0
	sub	x0,x0,a0
	sub	x0,a3,x0
	sub	a0,a2,x0
	ori	a2,x0,32
	sub	a3,x0,sp
	sub	sp,a2,a3
	jalr	zero,ra,0
	.size	main, .-main
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
.LC0:
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
	.half	0
	.half	2047
	.half	3072
	.half	2048
	.half	512
	.half	-2048
	.half	-3328
	.half	1024
.LC1:
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
	.half	3168
	.half	3136
	.half	3104
	.half	3072
	.half	-2560
	.half	-3072
	.half	-3584
	.half	-4096
.LC2:
	.word	3760
	.word	4269
	.word	3126
	.word	1030
	.word	2453
	.word	-4601
	.word	1981
	.word	-1056
	.word	2621
	.word	4269
	.word	3058
	.word	1030
	.word	2378
	.word	-4601
	.word	1902
	.word	-1056
	.word	2548
	.word	4269
	.word	2988
	.word	1030
	.word	2300
	.word	-4601
	.word	1822
	.word	-1056
	.word	2474
	.word	4269
	.word	2917
	.word	1030
	.word	2220
	.word	-4601
	.word	1738
	.word	-1056
	.word	2398
	.word	4269
	.word	2844
	.word	1030
	.word	2140
	.word	-4601
	.word	1655
	.word	-1056
	.word	2321
	.word	4269
	.word	2770
	.word	1030
	.word	2058
	.word	-4601
	.word	1569
	.word	-1056
	.word	2242
	.word	4269
	.word	2152
	.word	1030
	.word	1683
	.word	-4601
	.word	1627
	.word	-1056
	.word	2030
	.word	4269
	.word	2080
	.word	1030
	.word	1611
	.word	-4601
	.word	1555
	.word	-1056
	.word	1958
	.word	4269
	.word	2008
	.word	1030
	.word	1539
	.word	-4601
	.word	1483
	.word	-1056
	.word	1886
	.word	4269
	.word	1935
	.word	1030
	.word	1466
	.word	-4601
	.word	1410
	.word	-1056
	.word	1813
	.word	4269
	.word	1862
	.word	1030
	.word	1393
	.word	-4601
	.word	1337
	.word	-1056
	.word	1740
	.word	4269
	.word	1789
	.word	1030
	.word	1320
	.word	-4601
	.word	1264
	.word	-1056
	.word	1667
	.word	4269
	.word	1716
	.word	1030
	.word	1968
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	output, @object
	.size	output, 800
output:
	.zero	800
	.type	a, @object
	.size	a, 400
a:
	.zero	400
	.type	b, @object
	.size	b, 400
b:
	.zero	400
	.section	.sbss,"aw",@nobits
	.align	2
	.type	e, @object
	.size	e, 4
e:
	.zero	4
	.type	d, @object
	.size	d, 4
d:
	.zero	4
	.type	c, @object
	.size	c, 2
c:
	.zero	2
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits


    .text
    .align 2
__mul:
	sub	a2,x0,a0
	sub	a2,x0,a2
	ori	a0,x0,0
	sub	a3,x0,x0
	sub	a0,a0,a3
.Mul_loop:
	ori	a3,x0,1
	sub	a4,x0,x0
	sub	a3,a3,a4
	or	a3,a1,a3
	ori	a4,x0,1
	sub	a5,x0,x0
	sub	x0,a4,a5
	sub	x0,a3,x0
	sub	a3,a1,x0
	beq	a3,x0,.Mul_skip
	sub	a3,x0,a0
	sub	a0,a2,a3
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
	bge	a0,zero,.+8
	jal	x0,__riscv_div_lib_L10
	bge	a1,zero,.+8
	jal	x0,__riscv_div_lib_L11
    # Since the quotient is positive, fall into udivsi3

# Unsigned 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_udivsi3
__riscv_div_lib_udivsi3:
	ori	a2,x0,0
	sub	a3,x0,a1
	sub	a2,a2,a3
	ori	a1,x0,0
	sub	a3,x0,a0
	sub	a1,a1,a3
	ori	a0,x0,-1
	sub	a3,x0,zero
	sub	a0,a0,a3
	beq	a2,zero,__riscv_div_lib_L5
	ori	a3,x0,1
	sub	a0,x0,zero
	sub	a3,a3,a0
	bltu	a2,a1,.+8
	jal	x0,__riscv_div_lib_L2
__riscv_div_lib_L1:
	bge	zero,a2,__riscv_div_lib_L2
	slli	a2,a2,1
	slli	a3,a3,1
	bltu	a2,a1,__riscv_div_lib_L1
__riscv_div_lib_L2:
	ori	a0,x0,0
	sub	a4,x0,zero
	sub	a0,a0,a4
__riscv_div_lib_L3:
	bltu	a1,a2,__riscv_div_lib_L4
	sub	a1,a1,a2
	or	a0,a0,a3
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
	ori	t0,x0,0
	sub	a0,x0,ra
	sub	t0,t0,a0
.Lpcrel_div1:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div1)
	ori	a0,x0,0
	sub	a2,x0,a1
	sub	a0,a0,a2
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
	ori	t0,x0,0
	sub	a2,x0,ra
	sub	t0,t0,a2
.Lpcrel_div2:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div2)
	sub	a0,zero,a0
	jalr	zero,t0,0

# Signed 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_modsi3
__riscv_div_lib_modsi3:
	ori	t0,x0,0
	sub	a2,x0,ra
	sub	t0,t0,a2
	bge	a1,zero,.+8
	jal	x0,__riscv_div_lib_L31
	bge	a0,zero,.+8
	jal	x0,__riscv_div_lib_L32
__riscv_div_lib_L30:
.Lpcrel_div3:
	auipc	ra,%pcrel_hi(__riscv_div_lib_udivsi3)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_div3)
	ori	a0,x0,0
	sub	a2,x0,a1
	sub	a0,a0,a2
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