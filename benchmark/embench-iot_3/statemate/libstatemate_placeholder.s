	.file	"libstatemate.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	generic_FH_TUERMODUL_CTRL.part.0, @function
generic_FH_TUERMODUL_CTRL.part.0:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lbu	a4,10(a5)
	beq	a4,zero,.+8
	jal	x0,.L2
	lui	a4,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	addi	a3,zero,3
	sb	a3,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
.L2:
	lbu	a4,19(a5)
	beq	a4,zero,.+8
	jal	x0,.L3
	lui	a4,%hi(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)
	addi	a3,zero,1
	sb	zero,0(a5)
	sb	a3,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a4)
.L3:
	lui	a2,%hi(B_FH_TUERMODUL_CTRL_next_state)
	lbu	a3,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	addi	a4,zero,1
	sb	a4,11(a5)
	sb	a4,20(a5)
	addi	a1,zero,2
	beq	a3,a1,.L4
	addi	a0,zero,3
	beq	a3,a0,.L5
	beq	a3,a4,.+8
	jal	x0,.L6
	lui	a4,%hi(FH_TUERMODUL_CTRL__N)
	lw	a4,%lo(FH_TUERMODUL_CTRL__N)(a4)
	addi	a3,zero,59
	beq	a4,a3,.L120
.L8:
	lui	a3,%hi(A_FH_TUERMODUL_CTRL_next_state)
	lbu	a2,%lo(A_FH_TUERMODUL_CTRL_next_state)(a3)
	addi	a4,zero,1
	beq	a2,a4,.L121
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL_CTRL__N)
	lui	a2,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	sb	a4,%lo(A_FH_TUERMODUL_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a0)
	sw	zero,%lo(FH_TUERMODUL_CTRL__N)(a1)
	sb	a4,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a2)
.L47:
	lbu	a3,4(a5)
	lbu	a4,6(a5)
	sb	a3,5(a5)
	sb	a4,7(a5)
	jalr	zero,ra,0
.L5:
	lui	a3,%hi(FH_TUERMODUL_CTRL__N)
	lw	a1,%lo(FH_TUERMODUL_CTRL__N)(a3)
	addi	a3,zero,60
	bge	a3,a1,.L15
	lui	a1,%hi(FH_TUERMODUL_CTRL__N_old)
	lw	a1,%lo(FH_TUERMODUL_CTRL__N_old)(a1)
	bge	a3,a1,.+8
	jal	x0,.L15
	lui	a3,%hi(FH_TUERMODUL_CTRL__INREVERS1)
	lui	a1,%hi(FH_TUERMODUL_CTRL__INREVERS2)
	lbu	a3,%lo(FH_TUERMODUL_CTRL__INREVERS1)(a3)
	lbu	a1,%lo(FH_TUERMODUL_CTRL__INREVERS2)(a1)
	or	a3,a3,a1
	beq	a3,zero,.+8
	jal	x0,.L15
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL__MFHZ_copy)
	lui	a3,%hi(FH_TUERMODUL__MFHA_copy)
	sb	a4,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(stable)(a0)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a1)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a3)
	jal	x0,.L8
.L15:
	lui	a4,%hi(FH_TUERMODUL__BLOCK)
	lbu	a4,%lo(FH_TUERMODUL__BLOCK)(a4)
	beq	a4,zero,.+8
	jal	x0,.L122
.L16:
	lui	a3,%hi(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)
	lbu	a4,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	addi	a2,zero,2
	beq	a4,a2,.L18
	addi	a1,zero,3
	beq	a4,a1,.L19
	addi	a0,zero,1
	beq	a4,a0,.+8
	jal	x0,.L20
	lui	a0,%hi(FH_TUERMODUL__POSITION)
	lw	a6,%lo(FH_TUERMODUL__POSITION)(a0)
	addi	a0,zero,404
	bge	a0,a6,.L21
	lui	a2,%hi(stable)
	lui	a4,%hi(FH_TUERMODUL__MFHA_copy)
	sb	a1,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a4)
	jal	x0,.L8
.L121:
	lui	a4,%hi(step)
	lbu	a4,%lo(step)(a4)
	beq	a4,a2,.L123
	lui	a4,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	lbu	a3,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a4)
	beq	a3,a2,.L47
.L49:
	addi	a3,zero,1
	sb	a3,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a4)
	lbu	a3,4(a5)
	lbu	a4,6(a5)
	lui	a2,%hi(stable)
	sb	zero,%lo(stable)(a2)
	sb	a3,5(a5)
	sb	a4,7(a5)
	jalr	zero,ra,0
.L4:
	lui	a4,%hi(FH_TUERMODUL__BLOCK)
	lbu	a4,%lo(FH_TUERMODUL__BLOCK)(a4)
	beq	a4,zero,.L10
	lui	a4,%hi(FH_TUERMODUL__BLOCK_old)
	lbu	a4,%lo(FH_TUERMODUL__BLOCK_old)(a4)
	beq	a4,zero,.+8
	jal	x0,.L10
	lui	a4,%hi(FH_TUERMODUL__MFHZ)
	lbu	a4,%lo(FH_TUERMODUL__MFHZ)(a4)
	beq	a4,zero,.L10
	lui	a4,%hi(time)
	lw	a7,%lo(time)(a4)
	lui	a6,%hi(sc_FH_TUERMODUL_CTRL_2329_1)
	addi	a4,zero,3
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL__MFHZ_copy)
	lui	a3,%hi(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)
	sw	a7,%lo(sc_FH_TUERMODUL_CTRL_2329_1)(a6)
	sb	zero,%lo(stable)(a0)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a1)
	sb	a4,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a4,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	jal	x0,.L8
.L10:
	lui	a3,%hi(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)
	lbu	a4,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	addi	a2,zero,2
	beq	a4,a2,.L11
	addi	a1,zero,3
	beq	a4,a1,.L12
	addi	a2,zero,1
	beq	a4,a2,.+8
	jal	x0,.L13
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	beq	a4,zero,.+8
	jal	x0,.L8
	lui	a2,%hi(stable)
	lui	a4,%hi(FH_TUERMODUL__MFHZ_copy)
	sb	a1,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a4)
	jal	x0,.L8
.L6:
	lui	a4,%hi(stable)
	sb	a1,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(stable)(a4)
	jal	x0,.L8
.L122:
	lui	a4,%hi(FH_TUERMODUL__BLOCK_old)
	lbu	a4,%lo(FH_TUERMODUL__BLOCK_old)(a4)
	beq	a4,zero,.+8
	jal	x0,.L16
	lui	a4,%hi(FH_TUERMODUL__MFHA)
	lbu	a4,%lo(FH_TUERMODUL__MFHA)(a4)
	beq	a4,zero,.L17
	lui	a4,%hi(time)
	lw	t1,%lo(time)(a4)
	lui	a7,%hi(sc_FH_TUERMODUL_CTRL_2375_2)
	lui	a6,%hi(stable)
	lui	a0,%hi(FH_TUERMODUL__MFHA_copy)
	addi	a1,zero,2
	lui	a4,%hi(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)
	addi	a3,zero,3
	sw	t1,%lo(sc_FH_TUERMODUL_CTRL_2375_2)(a7)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a0)
	sb	a1,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a3,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a4)
	jal	x0,.L8
.L120:
	lui	a3,%hi(FH_TUERMODUL_CTRL__N_old)
	lw	a3,%lo(FH_TUERMODUL_CTRL__N_old)(a3)
	beq	a3,a4,.L8
	lui	a3,%hi(stable)
	lui	a4,%hi(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)
	sb	a0,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(stable)(a3)
	sb	a0,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a4)
	jal	x0,.L8
.L11:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	beq	a4,zero,.+8
	jal	x0,.L8
	lui	a1,%hi(stable)
	lui	a2,%hi(FH_TUERMODUL__MFHA_copy)
	addi	a4,zero,3
	sb	zero,%lo(stable)(a1)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a2)
	sb	a4,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	jal	x0,.L8
.L17:
	lui	a4,%hi(FH_TUERMODUL__MFHZ)
	lbu	a4,%lo(FH_TUERMODUL__MFHZ)(a4)
	beq	a4,zero,.L16
	lui	a4,%hi(time)
	lw	t1,%lo(time)(a4)
	lui	a7,%hi(sc_FH_TUERMODUL_CTRL_2352_1)
	lui	a6,%hi(stable)
	lui	a0,%hi(FH_TUERMODUL__MFHZ_copy)
	addi	a1,zero,2
	lui	a4,%hi(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)
	addi	a3,zero,3
	sw	t1,%lo(sc_FH_TUERMODUL_CTRL_2352_1)(a7)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a0)
	sb	a1,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a3,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a4)
	jal	x0,.L8
.L123:
	lui	a2,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)
	lw	a2,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)(a2)
	beq	a2,zero,.L46
	lui	a1,%hi(time)
	lw	a1,%lo(time)(a1)
	sub	a2,a1,a2
	beq	a2,a4,.L124
.L46:
	lui	a4,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	lbu	a3,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a4)
	addi	a2,zero,1
	beq	a3,a2,.+8
	jal	x0,.L49
	lui	a2,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)
	lw	a2,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)(a2)
	beq	a2,zero,.L47
	lui	a1,%hi(time)
	lw	a1,%lo(time)(a1)
	addi	a1,a1,-3
	beq	a1,a2,.+8
	jal	x0,.L47
	lui	a2,%hi(FH_TUERMODUL__MFHZ)
	lui	a1,%hi(FH_TUERMODUL__MFHA)
	lbu	a2,%lo(FH_TUERMODUL__MFHZ)(a2)
	lbu	a1,%lo(FH_TUERMODUL__MFHA)(a1)
	or	a2,a2,a1
	beq	a2,zero,.+8
	jal	x0,.L47
	lui	a1,%hi(FH_TUERMODUL_CTRL__N)
	lw	a2,%lo(FH_TUERMODUL_CTRL__N)(a1)
	bge	zero,a2,.L47
	addi	a2,a2,-1
	lui	a0,%hi(stable)
	sw	a2,%lo(FH_TUERMODUL_CTRL__N)(a1)
	sb	a3,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a0)
	jal	x0,.L47
.L13:
	lui	a4,%hi(stable)
	sb	a1,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	sb	zero,%lo(stable)(a4)
	jal	x0,.L8
.L12:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	beq	a4,zero,.+8
	jal	x0,.L125
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	beq	a4,zero,.L8
	lui	a4,%hi(stable)
	sb	zero,%lo(stable)(a4)
	lui	a2,%hi(FH_TUERMODUL__MFHZ_copy)
	addi	a4,zero,1
	sb	a4,%lo(FH_TUERMODUL__MFHZ_copy)(a2)
	sb	a4,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	jal	x0,.L8
.L20:
	lui	a4,%hi(stable)
	sb	a1,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a4)
	jal	x0,.L8
.L125:
	lui	a0,%hi(stable)
	lui	a4,%hi(FH_TUERMODUL__MFHA_copy)
	addi	a1,zero,1
	sb	a2,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	sb	zero,%lo(stable)(a0)
	sb	a1,%lo(FH_TUERMODUL__MFHA_copy)(a4)
	jal	x0,.L8
.L124:
	lui	a4,%hi(FH_TUERMODUL__MFHZ)
	lui	a1,%hi(FH_TUERMODUL__MFHA)
	lbu	a4,%lo(FH_TUERMODUL__MFHZ)(a4)
	lbu	a1,%lo(FH_TUERMODUL__MFHA)(a1)
	or	a4,a4,a1
	beq	a4,zero,.L46
	sb	a2,%lo(A_FH_TUERMODUL_CTRL_next_state)(a3)
	lui	a3,%hi(FH_TUERMODUL_CTRL__N)
	lw	a4,%lo(FH_TUERMODUL_CTRL__N)(a3)
	lui	a0,%hi(stable)
	lui	a1,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	sub	op_0,x0,a4
	sub	a4,a2,op_0
	sw	a4,%lo(FH_TUERMODUL_CTRL__N)(a3)
	sb	zero,%lo(stable)(a0)
	sb	a2,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a1)
	jal	x0,.L47
.L19:
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	beq	a4,zero,.L43
	lui	a4,%hi(FH_TUERMODUL__SFHZ_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ_old)(a4)
	beq	a4,zero,.+8
	jal	x0,.L43
	lui	a4,%hi(FH_TUERMODUL__POSITION)
	lw	a4,%lo(FH_TUERMODUL__POSITION)(a4)
	bge	zero,a4,.L43
	addi	a4,zero,1
	lui	a7,%hi(stable)
	lui	a6,%hi(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lui	a0,%hi(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lui	a1,%hi(FH_TUERMODUL__MFHZ_copy)
	sb	a2,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a7)
	sb	a2,%lo(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a6)
	sb	a2,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	a4,17(a5)
	sb	a4,%lo(FH_TUERMODUL__MFHZ_copy)(a1)
	jal	x0,.L8
.L18:
	lui	a2,%hi(FH_TUERMODUL__POSITION)
	lw	a2,%lo(FH_TUERMODUL__POSITION)(a2)
	bge	zero,a2,.L33
	lui	a0,%hi(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lbu	a2,%lo(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a0)
	addi	a1,zero,1
	beq	a2,a1,.L29
	beq	a2,a4,.L30
	lui	a6,%hi(stable)
	lui	a2,%hi(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lui	a3,%hi(FH_TUERMODUL__MFHZ_copy)
	sb	a4,%lo(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	a1,17(a5)
	sb	zero,%lo(stable)(a6)
	sb	a4,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a1,%lo(FH_TUERMODUL__MFHZ_copy)(a3)
	jal	x0,.L8
.L43:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	beq	a4,zero,.L8
	lui	a4,%hi(FH_TUERMODUL__SFHA_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHA_old)(a4)
	beq	a4,zero,.+8
	jal	x0,.L8
	lui	a4,%hi(FH_TUERMODUL__POSITION)
	lw	a2,%lo(FH_TUERMODUL__POSITION)(a4)
	addi	a4,zero,404
	bge	a4,a2,.+8
	jal	x0,.L8
	lui	a4,%hi(stable)
	sb	zero,%lo(stable)(a4)
	lui	a0,%hi(FH_TUERMODUL__MFHA_copy)
	addi	a4,zero,1
	lui	a2,%hi(OEFFNEN_FH_TUERMODUL_CTRL_next_state)
	addi	a1,zero,2
	sb	a4,%lo(FH_TUERMODUL__MFHA_copy)(a0)
	sb	a4,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	sb	a1,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a2)
	jal	x0,.L8
.L33:
	lui	a1,%hi(stable)
	lui	a2,%hi(FH_TUERMODUL__MFHZ_copy)
	addi	a4,zero,3
	sb	zero,%lo(stable)(a1)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a2)
	sb	a4,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	jal	x0,.L8
.L21:
	lui	a0,%hi(OEFFNEN_FH_TUERMODUL_CTRL_next_state)
	lbu	a1,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a0)
	beq	a1,a4,.L22
	beq	a1,a2,.L23
	lui	a4,%hi(stable)
	sb	a2,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	zero,%lo(stable)(a4)
	jal	x0,.L8
.L29:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	beq	a4,zero,.L32
	lui	a4,%hi(FH_TUERMODUL__SFHA_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHA_old)(a4)
	beq	a4,zero,.L33
.L32:
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	beq	a4,zero,.L34
	lui	a4,%hi(FH_TUERMODUL__SFHZ_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ_old)(a4)
	beq	a4,zero,.L33
.L34:
	lui	a2,%hi(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lbu	a3,%lo(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	addi	a4,zero,1
	beq	a3,a4,.L35
	addi	a1,zero,2
	beq	a3,a1,.L36
	lui	a3,%hi(stable)
	sb	a1,%lo(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a4,17(a5)
	sb	zero,%lo(stable)(a3)
	jal	x0,.L8
.L30:
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	beq	a4,zero,.+8
	jal	x0,.L38
	lui	a4,%hi(FH_TUERMODUL__SFHZ_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ_old)(a4)
	beq	a4,zero,.+8
	jal	x0,.L33
.L38:
	lui	a2,%hi(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lbu	a3,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	addi	a4,zero,1
	beq	a3,a4,.L39
	addi	a1,zero,2
	beq	a3,a1,.L40
	lui	a0,%hi(stable)
	lui	a3,%hi(FH_TUERMODUL__MFHZ_copy)
	sb	a1,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a4,17(a5)
	sb	zero,%lo(stable)(a0)
	sb	a4,%lo(FH_TUERMODUL__MFHZ_copy)(a3)
	jal	x0,.L8
.L23:
	lui	a2,%hi(FH_TUERMODUL__SFHZ)
	lbu	a2,%lo(FH_TUERMODUL__SFHZ)(a2)
	beq	a2,zero,.L27
	lui	a2,%hi(FH_TUERMODUL__SFHZ_old)
	lbu	a2,%lo(FH_TUERMODUL__SFHZ_old)(a2)
	beq	a2,zero,.+8
	jal	x0,.L27
	lui	a3,%hi(stable)
	sb	a4,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	zero,%lo(stable)(a3)
	jal	x0,.L8
.L22:
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	beq	a4,zero,.L25
	lui	a4,%hi(FH_TUERMODUL__SFHZ_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ_old)(a4)
	beq	a4,zero,.+8
	jal	x0,.L25
.L26:
	lui	a1,%hi(stable)
	lui	a2,%hi(FH_TUERMODUL__MFHA_copy)
	addi	a4,zero,3
	sb	zero,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	zero,%lo(stable)(a1)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a2)
	sb	a4,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	jal	x0,.L8
.L27:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	beq	a4,zero,.+8
	jal	x0,.L8
	lui	a4,%hi(FH_TUERMODUL__SFHA_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHA_old)(a4)
	beq	a4,zero,.+8
	jal	x0,.L26
	jal	x0,.L8
.L25:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	beq	a4,zero,.L8
	lui	a4,%hi(FH_TUERMODUL__SFHA_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHA_old)(a4)
	beq	a4,zero,.+8
	jal	x0,.L8
	jal	x0,.L26
.L40:
	lbu	a3,24(a5)
	beq	a3,zero,.L42
	lui	a3,%hi(time)
	lw	a7,%lo(time)(a3)
	sb	a4,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	lui	a6,%hi(sc_FH_TUERMODUL_CTRL_1739_10)
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL__MFHZ_copy)
	lui	a2,%hi(FH_TUERMODUL_CTRL__INREVERS1_copy)
	lui	a3,%hi(FH_TUERMODUL__MFHA_copy)
	sb	a4,23(a5)
	sb	zero,17(a5)
	sw	a7,%lo(sc_FH_TUERMODUL_CTRL_1739_10)(a6)
	sb	zero,%lo(stable)(a0)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a1)
	sb	a4,%lo(FH_TUERMODUL_CTRL__INREVERS1_copy)(a2)
	sb	a4,%lo(FH_TUERMODUL__MFHA_copy)(a3)
	jal	x0,.L8
.L39:
	lbu	a4,22(a5)
	sb	zero,23(a5)
	beq	a4,zero,.L8
	lui	a7,%hi(stable)
	lui	a6,%hi(FH_TUERMODUL_CTRL__INREVERS1_copy)
	addi	a0,zero,2
	lui	a1,%hi(FH_TUERMODUL__MFHA_copy)
	lui	a4,%hi(FH_TUERMODUL__MFHZ_copy)
	sb	a3,17(a5)
	sb	zero,%lo(stable)(a7)
	sb	zero,%lo(FH_TUERMODUL_CTRL__INREVERS1_copy)(a6)
	sb	a0,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a1)
	sb	a3,%lo(FH_TUERMODUL__MFHZ_copy)(a4)
	jal	x0,.L8
.L36:
	lbu	a3,24(a5)
	beq	a3,zero,.L8
	lui	a3,%hi(time)
	lw	a7,%lo(time)(a3)
	sb	a4,%lo(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	lui	a6,%hi(sc_FH_TUERMODUL_CTRL_1781_10)
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL_CTRL__INREVERS2_copy)
	lui	a2,%hi(FH_TUERMODUL__MFHZ_copy)
	lui	a3,%hi(FH_TUERMODUL__MFHA_copy)
	sb	a4,23(a5)
	sb	zero,17(a5)
	sw	a7,%lo(sc_FH_TUERMODUL_CTRL_1781_10)(a6)
	sb	zero,%lo(stable)(a0)
	sb	a4,%lo(FH_TUERMODUL_CTRL__INREVERS2_copy)(a1)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a2)
	sb	a4,%lo(FH_TUERMODUL__MFHA_copy)(a3)
	jal	x0,.L8
.L35:
	lbu	a4,22(a5)
	sb	zero,23(a5)
	beq	a4,zero,.L8
	lui	a7,%hi(stable)
	lui	a6,%hi(FH_TUERMODUL__MFHZ_copy)
	lui	a0,%hi(FH_TUERMODUL_CTRL__INREVERS2_copy)
	addi	a1,zero,2
	lui	a4,%hi(FH_TUERMODUL__MFHA_copy)
	sb	a3,17(a5)
	sb	zero,%lo(stable)(a7)
	sb	a3,%lo(FH_TUERMODUL__MFHZ_copy)(a6)
	sb	zero,%lo(FH_TUERMODUL_CTRL__INREVERS2_copy)(a0)
	sb	a1,%lo(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a4)
	jal	x0,.L8
.L42:
	lui	a3,%hi(FH_TUERMODUL__SFHA)
	lbu	a3,%lo(FH_TUERMODUL__SFHA)(a3)
	beq	a3,zero,.L8
	lui	a3,%hi(FH_TUERMODUL__SFHA_old)
	lbu	a3,%lo(FH_TUERMODUL__SFHA_old)(a3)
	beq	a3,zero,.+8
	jal	x0,.L8
	lui	a3,%hi(stable)
	sb	a4,%lo(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	zero,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(stable)(a3)
	jal	x0,.L8
	.size	generic_FH_TUERMODUL_CTRL.part.0, .-generic_FH_TUERMODUL_CTRL.part.0
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
	.globl	interface
	.type	interface, @function
interface:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lbu	a4,4(a5)
	beq	a4,zero,.+8
	jal	x0,.L130
	lbu	a4,6(a5)
	beq	a4,zero,.+8
	jal	x0,.L158
.L131:
	lui	a3,%hi(sc_FH_TUERMODUL_CTRL_2375_2)
	lw	a4,%lo(sc_FH_TUERMODUL_CTRL_2375_2)(a3)
	beq	a4,zero,.L133
	lui	a2,%hi(time)
	lw	a2,%lo(time)(a2)
	beq	a4,a2,.L133
	lui	a4,%hi(FH_TUERMODUL__MFHA_copy)
	sw	zero,%lo(sc_FH_TUERMODUL_CTRL_2375_2)(a3)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a4)
.L133:
	lui	a3,%hi(sc_FH_TUERMODUL_CTRL_2352_1)
	lw	a4,%lo(sc_FH_TUERMODUL_CTRL_2352_1)(a3)
	beq	a4,zero,.L134
	lui	a2,%hi(time)
	lw	a2,%lo(time)(a2)
	beq	a4,a2,.L134
	lui	a4,%hi(FH_TUERMODUL__MFHZ_copy)
	sw	zero,%lo(sc_FH_TUERMODUL_CTRL_2352_1)(a3)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a4)
.L134:
	lui	a3,%hi(sc_FH_TUERMODUL_CTRL_2329_1)
	lw	a4,%lo(sc_FH_TUERMODUL_CTRL_2329_1)(a3)
	beq	a4,zero,.L135
	lui	a2,%hi(time)
	lw	a2,%lo(time)(a2)
	beq	a4,a2,.L135
	lui	a4,%hi(FH_TUERMODUL__MFHZ_copy)
	sw	zero,%lo(sc_FH_TUERMODUL_CTRL_2329_1)(a3)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a4)
.L135:
	lui	a3,%hi(sc_FH_TUERMODUL_CTRL_1781_10)
	lw	a4,%lo(sc_FH_TUERMODUL_CTRL_1781_10)(a3)
	beq	a4,zero,.L136
	lui	a2,%hi(time)
	lw	a2,%lo(time)(a2)
	beq	a4,a2,.L136
	sw	zero,%lo(sc_FH_TUERMODUL_CTRL_1781_10)(a3)
.L136:
	lui	a3,%hi(sc_FH_TUERMODUL_CTRL_1739_10)
	lw	a4,%lo(sc_FH_TUERMODUL_CTRL_1739_10)(a3)
	beq	a4,zero,.L137
	lui	a2,%hi(time)
	lw	a2,%lo(time)(a2)
	beq	a4,a2,.L137
	sw	zero,%lo(sc_FH_TUERMODUL_CTRL_1739_10)(a3)
.L137:
	lbu	a5,0(a5)
	beq	a5,zero,.+8
	jal	x0,.L138
	lui	a4,%hi(BLOCK_ERKENNUNG_CTRL__N)
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL__N_old)
	lw	a4,%lo(BLOCK_ERKENNUNG_CTRL__N)(a4)
	lw	a5,%lo(BLOCK_ERKENNUNG_CTRL__N_old)(a5)
	beq	a4,a5,.L129
.L138:
	lui	a5,%hi(time)
	lw	a4,%lo(time)(a5)
	lui	a5,%hi(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)
	sw	a4,%lo(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)(a5)
.L129:
	jalr	zero,ra,0
.L130:
	lui	a4,%hi(time)
	lw	a4,%lo(time)(a4)
	lui	a3,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)
	sw	a4,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)(a3)
.L132:
	lui	a3,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)
	sw	a4,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)(a3)
	jal	x0,.L131
.L158:
	lui	a4,%hi(time)
	lw	a4,%lo(time)(a4)
	jal	x0,.L132
	.size	interface, .-interface
	.align	2
	.globl	init
	.type	init, @function
init:
	lui	a1,%hi(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)
	lui	a2,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)
	lui	a3,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)
	lui	a4,%hi(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)
	lui	a5,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	lui	t0,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	lui	t6,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	lui	t5,%hi(B_FH_TUERMODUL_CTRL_next_state)
	lui	t4,%hi(A_FH_TUERMODUL_CTRL_next_state)
	lui	t3,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	lui	t1,%hi(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)
	lui	a7,%hi(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lui	a6,%hi(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lui	a0,%hi(OEFFNEN_FH_TUERMODUL_CTRL_next_state)
	sw	zero,%lo(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)(a1)
	sw	zero,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)(a2)
	lui	a1,%hi(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lui	a2,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	sw	zero,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)(a3)
	sb	zero,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a4)
	lui	a3,%hi(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)
	lui	a4,%hi(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)
	sb	zero,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a5)
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)
	sb	zero,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(t0)
	sb	zero,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(t6)
	sb	zero,%lo(B_FH_TUERMODUL_CTRL_next_state)(t5)
	sb	zero,%lo(A_FH_TUERMODUL_CTRL_next_state)(t4)
	sb	zero,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(t3)
	sb	zero,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(t1)
	sb	zero,%lo(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a7)
	sb	zero,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a6)
	sb	zero,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	zero,%lo(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a1)
	sb	zero,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(a2)
	sb	zero,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a3)
	sb	zero,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a4)
	sb	zero,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a5)
	jalr	zero,ra,0
	.size	init, .-init
	.align	2
	.globl	generic_KINDERSICHERUNG_CTRL
	.type	generic_KINDERSICHERUNG_CTRL, @function
generic_KINDERSICHERUNG_CTRL:
	lui	a5,%hi(.LANCHOR0+10)
	lbu	a5,%lo(.LANCHOR0+10)(a5)
	beq	a5,zero,.L160
	lui	a4,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	lbu	a5,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	addi	a3,zero,2
	beq	a5,a3,.L162
	addi	a2,zero,3
	beq	a5,a2,.L163
	addi	a3,zero,1
	beq	a5,a3,.+8
	jal	x0,.L164
	lui	a3,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lbu	a3,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(a3)
	beq	a3,zero,.+8
	jal	x0,.L165
	lui	a3,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lbu	a3,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(a3)
	beq	a3,zero,.L231
	lui	a4,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	lbu	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	beq	a3,a5,.+8
	jal	x0,.L168
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL_old)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL_old)(a5)
	beq	a5,zero,.+8
	jal	x0,.L232
.L189:
	lui	a5,%hi(stable)
	sb	zero,%lo(stable)(a5)
	lui	a3,%hi(FH_TUERMODUL__SFHZ_copy)
	addi	a5,zero,1
	sb	a5,%lo(FH_TUERMODUL__SFHZ_copy)(a3)
	sb	a5,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	jalr	zero,ra,0
.L163:
	lui	a5,%hi(FH_TUERMODUL__KL_50)
	lbu	a5,%lo(FH_TUERMODUL__KL_50)(a5)
	beq	a5,zero,.L233
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(a5)
	beq	a5,zero,.+8
	jal	x0,.L234
.L160:
	jalr	zero,ra,0
.L164:
	lui	a5,%hi(stable)
	sb	a2,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a5)
	jalr	zero,ra,0
.L162:
	lui	a5,%hi(FH_TUERMODUL__SFHA_MEC)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_MEC)(a5)
	beq	a5,zero,.+8
	jal	x0,.L171
	lui	a5,%hi(FH_TUERMODUL__SFHZ_MEC)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_MEC)(a5)
	beq	a5,zero,.L235
	lui	a5,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	lbu	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	addi	a3,zero,1
	beq	a4,a3,.+8
	jal	x0,.L168
	lui	a3,%hi(FH_TUERMODUL__SFHZ_MEC_old)
	lbu	a3,%lo(FH_TUERMODUL__SFHZ_MEC_old)(a3)
	beq	a3,zero,.+8
	jal	x0,.L236
.L191:
	lui	a4,%hi(stable)
	sb	zero,%lo(stable)(a4)
	lui	a3,%hi(FH_TUERMODUL__SFHZ_copy)
	addi	a4,zero,1
	sb	a4,%lo(FH_TUERMODUL__SFHZ_copy)(a3)
	sb	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	jalr	zero,ra,0
.L165:
	lui	a4,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	lbu	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	beq	a3,a5,.L237
.L168:
	lui	a5,%hi(stable)
	sb	zero,%lo(stable)(a5)
	jalr	zero,ra,0
.L171:
	lui	a5,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	lbu	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	addi	a3,zero,1
	beq	a4,a3,.+8
	jal	x0,.L168
	lui	a3,%hi(FH_TUERMODUL__SFHA_MEC_old)
	lbu	a3,%lo(FH_TUERMODUL__SFHA_MEC_old)(a3)
	beq	a3,zero,.+8
	jal	x0,.L174
	lui	a2,%hi(stable)
	lui	a3,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	sb	zero,%lo(stable)(a2)
	sb	a4,%lo(FH_TUERMODUL__SFHA_copy)(a3)
	jalr	zero,ra,0
.L233:
	lui	a5,%hi(FH_TUERMODUL__SFHZ_MEC)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_MEC)(a5)
	lui	a2,%hi(FH_TUERMODUL__SFHA_MEC)
	lbu	a2,%lo(FH_TUERMODUL__SFHA_MEC)(a2)
	beq	a5,zero,.L176
	beq	a2,zero,.+8
	jal	x0,.L238
	lui	a1,%hi(stable)
	lui	a5,%hi(FH_TUERMODUL__SFHZ_copy)
	addi	a2,zero,1
	sb	a3,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a1)
	sb	a2,%lo(FH_TUERMODUL__SFHZ_copy)(a5)
	jalr	zero,ra,0
.L235:
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL__SFHZ_copy)
	lui	a2,%hi(FH_TUERMODUL__SFHA_copy)
	addi	a3,zero,3
	lui	a5,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	sb	zero,%lo(stable)(a0)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(a1)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(a2)
	sb	a3,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	jalr	zero,ra,0
.L231:
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL__SFHZ_copy)
	lui	a3,%hi(FH_TUERMODUL__SFHA_copy)
	lui	a5,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	sb	a2,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a0)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(a1)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(a3)
	sb	zero,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a5)
	jalr	zero,ra,0
.L176:
	beq	a2,zero,.L239
	lui	a1,%hi(stable)
	lui	a5,%hi(FH_TUERMODUL__SFHA_copy)
	addi	a2,zero,1
	sb	a3,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a1)
	sb	a2,%lo(FH_TUERMODUL__SFHA_copy)(a5)
	jalr	zero,ra,0
.L234:
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(a5)
	beq	a5,zero,.+8
	jal	x0,.L186
	jalr	zero,ra,0
.L237:
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL_old)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL_old)(a5)
	beq	a5,zero,.+8
	jal	x0,.L170
	lui	a2,%hi(stable)
	lui	a5,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a2)
	sb	a3,%lo(FH_TUERMODUL__SFHA_copy)(a5)
	jalr	zero,ra,0
.L186:
	lui	a5,%hi(stable)
	sb	zero,%lo(stable)(a5)
	lui	a2,%hi(FH_TUERMODUL__SFHA_copy)
	addi	a5,zero,1
	lui	a3,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	a5,%lo(FH_TUERMODUL__SFHA_copy)(a2)
	sb	a5,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	a5,%lo(FH_TUERMODUL__SFHZ_copy)(a3)
	jalr	zero,ra,0
.L238:
	addi	a5,zero,1
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL__SFHZ_copy)
	lui	a2,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a3,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a0)
	sb	a5,%lo(FH_TUERMODUL__SFHZ_copy)(a1)
	sb	a5,%lo(FH_TUERMODUL__SFHA_copy)(a2)
	jalr	zero,ra,0
.L239:
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(a5)
	beq	a5,zero,.+8
	jal	x0,.L178
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(a5)
	beq	a5,zero,.+8
	jal	x0,.L179
	jalr	zero,ra,0
.L178:
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(a5)
	beq	a5,zero,.+8
	jal	x0,.L186
	lui	a5,%hi(stable)
	sb	zero,%lo(stable)(a5)
	lui	a3,%hi(FH_TUERMODUL__SFHZ_copy)
	addi	a5,zero,1
	sb	a5,%lo(FH_TUERMODUL__SFHZ_copy)(a3)
	sb	a5,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	jalr	zero,ra,0
.L179:
	lui	a5,%hi(stable)
	sb	zero,%lo(stable)(a5)
	lui	a3,%hi(FH_TUERMODUL__SFHA_copy)
	addi	a5,zero,1
	sb	a5,%lo(FH_TUERMODUL__SFHA_copy)(a3)
	sb	a5,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	jalr	zero,ra,0
.L174:
	lui	a3,%hi(FH_TUERMODUL__SFHZ_MEC)
	lbu	a3,%lo(FH_TUERMODUL__SFHZ_MEC)(a3)
	beq	a3,zero,.+8
	jal	x0,.L240
	lui	a3,%hi(FH_TUERMODUL__SFHZ_MEC_old)
	lbu	a3,%lo(FH_TUERMODUL__SFHZ_MEC_old)(a3)
	beq	a3,zero,.L160
	lui	a2,%hi(stable)
	lui	a3,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(a3)
	jalr	zero,ra,0
.L170:
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(a5)
	beq	a5,zero,.+8
	jal	x0,.L241
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL_old)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL_old)(a5)
	beq	a5,zero,.L160
	lui	a2,%hi(stable)
	lui	a5,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(a5)
	jalr	zero,ra,0
.L236:
	lui	a3,%hi(FH_TUERMODUL__SFHA_MEC_old)
	lbu	a3,%lo(FH_TUERMODUL__SFHA_MEC_old)(a3)
	beq	a3,zero,.L160
	lui	a2,%hi(stable)
	lui	a3,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(a3)
	jalr	zero,ra,0
.L232:
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL_old)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL_old)(a5)
	beq	a5,zero,.L160
	lui	a2,%hi(stable)
	lui	a5,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(a5)
	jalr	zero,ra,0
.L240:
	lui	a4,%hi(FH_TUERMODUL__SFHZ_MEC_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ_MEC_old)(a4)
	beq	a4,zero,.L191
	jalr	zero,ra,0
.L241:
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL_old)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL_old)(a5)
	beq	a5,zero,.L189
	jalr	zero,ra,0
	.size	generic_KINDERSICHERUNG_CTRL, .-generic_KINDERSICHERUNG_CTRL
	.align	2
	.globl	generic_FH_TUERMODUL_CTRL
	.type	generic_FH_TUERMODUL_CTRL, @function
generic_FH_TUERMODUL_CTRL:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lbu	a4,13(a5)
	beq	a4,zero,.L243
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_1:
	auipc	ra,%pcrel_hi(generic_FH_TUERMODUL_CTRL.part.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_1)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero,ra,0
.L243:
	lbu	a4,15(a5)
	beq	a4,zero,.L249
	lbu	a4,14(a5)
	beq	a4,zero,.+8
	jal	x0,.L249
	sb	zero,4(a5)
	sb	zero,6(a5)
	jalr	zero,ra,0
.L249:
	jalr	zero,ra,0
	.size	generic_FH_TUERMODUL_CTRL, .-generic_FH_TUERMODUL_CTRL
	.align	2
	.globl	generic_EINKLEMMSCHUTZ_CTRL
	.type	generic_EINKLEMMSCHUTZ_CTRL, @function
generic_EINKLEMMSCHUTZ_CTRL:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lbu	a4,16(a5)
	beq	a4,zero,.L252
	lui	a3,%hi(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)
	lbu	a4,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a3)
	addi	a2,zero,1
	beq	a4,a2,.L255
	addi	a1,zero,2
	beq	a4,a1,.+8
	jal	x0,.L269
	lui	a4,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV)
	lbu	a4,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV)(a4)
	sb	zero,24(a5)
	beq	a4,zero,.+8
	jal	x0,.L252
	lui	a5,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV_old)
	lbu	a5,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV_old)(a5)
	beq	a5,zero,.L252
.L269:
	lui	a5,%hi(stable)
	sb	a2,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a5)
.L252:
	jalr	zero,ra,0
.L255:
	lui	a4,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV)
	lbu	a4,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV)(a4)
	beq	a4,zero,.L252
	lui	a4,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV_old)
	lbu	a4,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV_old)(a4)
	beq	a4,zero,.+8
	jal	x0,.L252
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	beq	a4,zero,.L259
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	beq	a4,zero,.+8
	jal	x0,.L252
.L259:
	lui	a1,%hi(stable)
	addi	a2,zero,1
	addi	a4,zero,2
	sb	zero,%lo(stable)(a1)
	sb	a2,24(a5)
	sb	a4,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a3)
	jalr	zero,ra,0
	.size	generic_EINKLEMMSCHUTZ_CTRL, .-generic_EINKLEMMSCHUTZ_CTRL
	.align	2
	.globl	generic_BLOCK_ERKENNUNG_CTRL
	.type	generic_BLOCK_ERKENNUNG_CTRL, @function
generic_BLOCK_ERKENNUNG_CTRL:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lbu	a4,19(a5)
	beq	a4,zero,.L271
	lui	a3,%hi(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)
	lbu	a4,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	addi	a2,zero,1
	beq	a4,a2,.L272
	addi	a1,zero,2
	beq	a4,a1,.+8
	jal	x0,.L295
	lui	a4,%hi(FH_TUERMODUL__MFHA)
	lbu	a4,%lo(FH_TUERMODUL__MFHA)(a4)
	beq	a4,zero,.+8
	jal	x0,.L278
	lui	a4,%hi(FH_TUERMODUL__MFHA_old)
	lbu	a4,%lo(FH_TUERMODUL__MFHA_old)(a4)
	beq	a4,zero,.+8
	jal	x0,.L279
.L278:
	lui	a4,%hi(FH_TUERMODUL__MFHZ)
	lbu	a4,%lo(FH_TUERMODUL__MFHZ)(a4)
	beq	a4,zero,.+8
	jal	x0,.L280
	lui	a4,%hi(FH_TUERMODUL__MFHZ_old)
	lbu	a4,%lo(FH_TUERMODUL__MFHZ_old)(a4)
	beq	a4,zero,.+8
	jal	x0,.L279
.L280:
	lui	a3,%hi(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)
	lbu	a4,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	addi	a2,zero,2
	beq	a4,a2,.L281
	addi	a1,zero,3
	beq	a4,a1,.L282
	addi	a0,zero,1
	beq	a4,a0,.L270
	lui	a7,%hi(stable)
	lui	a6,%hi(BLOCK_ERKENNUNG_CTRL__N)
	lui	a4,%hi(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)
	sb	a1,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	sb	a0,0(a5)
	sb	zero,%lo(stable)(a7)
	sw	zero,%lo(BLOCK_ERKENNUNG_CTRL__N)(a6)
	sw	a2,%lo(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)(a4)
	jalr	zero,ra,0
.L271:
	lbu	a4,21(a5)
	beq	a4,zero,.L270
	lbu	a4,20(a5)
	beq	a4,zero,.+8
	jal	x0,.L270
	sb	zero,0(a5)
	jalr	zero,ra,0
.L295:
	lui	a5,%hi(stable)
	sb	a2,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a5)
.L270:
	jalr	zero,ra,0
.L272:
	lui	a2,%hi(FH_TUERMODUL__I_EIN)
	lui	a1,%hi(FH_TUERMODUL__I_EIN_old)
	lw	a2,%lo(FH_TUERMODUL__I_EIN)(a2)
	lw	a1,%lo(FH_TUERMODUL__I_EIN_old)(a1)
	beq	a1,a2,.L270
	bge	zero,a2,.L270
	addi	a2,zero,2
	lui	t3,%hi(stable)
	lui	t1,%hi(FH_TUERMODUL__BLOCK_copy)
	lui	a7,%hi(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)
	lui	a6,%hi(BLOCK_ERKENNUNG_CTRL__N)
	lui	a1,%hi(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)
	addi	a0,zero,3
	sb	a4,0(a5)
	sb	zero,%lo(stable)(t3)
	sb	zero,%lo(FH_TUERMODUL__BLOCK_copy)(t1)
	sb	a2,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	sw	a2,%lo(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)(a7)
	sw	zero,%lo(BLOCK_ERKENNUNG_CTRL__N)(a6)
	sb	a0,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a1)
	jalr	zero,ra,0
.L279:
	lui	a2,%hi(stable)
	addi	a4,zero,1
	lui	a5,%hi(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)
	sb	zero,%lo(stable)(a2)
	sb	a4,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	sb	zero,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a5)
	jalr	zero,ra,0
.L282:
	sb	zero,0(a5)
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL__N)
	lw	a5,%lo(BLOCK_ERKENNUNG_CTRL__N)(a5)
	addi	a4,zero,11
	beq	a5,a4,.+8
	jal	x0,.L270
	lui	a4,%hi(BLOCK_ERKENNUNG_CTRL__N_old)
	lw	a4,%lo(BLOCK_ERKENNUNG_CTRL__N_old)(a4)
	beq	a4,a5,.L270
	lui	a5,%hi(stable)
	sb	a2,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a5)
	jalr	zero,ra,0
.L281:
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)
	lw	a5,%lo(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)(a5)
	lui	a4,%hi(FH_TUERMODUL__I_EIN)
	lw	a4,%lo(FH_TUERMODUL__I_EIN)(a4)
	addi	a5,a5,-1
	bge	a4,a5,.+8
	jal	x0,.L270
	lui	a5,%hi(stable)
	sb	zero,%lo(stable)(a5)
	lui	a4,%hi(FH_TUERMODUL__BLOCK_copy)
	addi	a5,zero,1
	sb	a5,%lo(FH_TUERMODUL__BLOCK_copy)(a4)
	sb	a5,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	jalr	zero,ra,0
	.size	generic_BLOCK_ERKENNUNG_CTRL, .-generic_BLOCK_ERKENNUNG_CTRL
	.align	2
	.globl	FH_DU
	.type	FH_DU, @function
FH_DU:
	lui	a4,%hi(FH_DU__S_FH_TMBFZUCAN_old)
	lbu	t0,%lo(FH_DU__S_FH_TMBFZUCAN_old)(a4)
	lui	a4,%hi(FH_DU__S_FH_TMBFAUFDISC)
	lbu	a0,%lo(FH_DU__S_FH_TMBFAUFDISC)(a4)
	lui	a4,%hi(FH_DU__S_FH_TMBFAUFDISC_old)
	lbu	t2,%lo(FH_DU__S_FH_TMBFAUFDISC_old)(a4)
	lui	a4,%hi(FH_DU__S_FH_TMBFAUFCAN_old)
	addi	sp,sp,-64
	lbu	a1,%lo(FH_DU__S_FH_TMBFAUFCAN_old)(a4)
	lui	a4,%hi(FH_DU__S_FH_TMBFZUDISC_old)
	sw	s0,56(sp)
	lbu	a2,%lo(FH_DU__S_FH_TMBFZUDISC_old)(a4)
	lui	s0,%hi(.LANCHOR0)
	lui	a4,%hi(FH_DU__S_FH_TMBFZUDISC)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	sw	s8,24(sp)
	sw	s9,20(sp)
	sw	s10,16(sp)
	sw	s11,12(sp)
	sw	ra,60(sp)
	addi	s0,s0,%lo(.LANCHOR0)
	lbu	t6,%lo(FH_DU__S_FH_TMBFZUDISC)(a4)
	lui	a5,%hi(FH_DU__S_FH_TMBFZUCAN)
	lui	a4,%hi(FH_DU__S_FH_TMBFAUFCAN)
	lbu	t5,10(s0)
	lbu	t4,16(s0)
	lbu	t3,19(s0)
	lbu	t1,13(s0)
	lbu	a5,%lo(FH_DU__S_FH_TMBFZUCAN)(a5)
	lbu	a4,%lo(FH_DU__S_FH_TMBFAUFCAN)(a4)
	lui	a3,%hi(time)
	addi	s1,zero,1
	sw	s1,%lo(time)(a3)
	lui	a6,%hi(stable)
	addi	a3,zero,0
	lui	s2,%hi(FH_DU__MFHZ)
	lui	s3,%hi(FH_DU__MFHA)
	lui	s4,%hi(FH_DU__S_FH_FTAUF)
	lui	s11,%hi(FH_DU__S_FH_AUFDISC)
	lui	s6,%hi(FH_TUERMODUL__I_EIN)
	lui	s10,%hi(FH_DU__I_EIN)
	lui	s9,%hi(FH_DU__EKS_LEISTE_AKTIV)
	lui	s5,%hi(FH_TUERMODUL__POSITION)
	lui	s8,%hi(FH_DU__POSITION)
	lui	s7,%hi(FH_DU__FT)
.L345:
	addi	a3,a3,1
	lui	a7,%hi(step)
	sb	a3,%lo(step)(a7)
	lui	a3,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	lbu	a3,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(a3)
	sb	s1,%lo(stable)(a6)
	addi	a7,zero,2
	beq	a3,a7,.L297
	addi	a7,zero,3
	beq	a3,a7,.L298
	beq	a3,s1,.+8
	jal	x0,.L299
	lbu	a3,%lo(FH_DU__MFHZ)(s2)
	beq	a3,zero,.+8
	jal	x0,.L300
	lui	a3,%hi(FH_DU__MFHZ_old)
	lbu	a3,%lo(FH_DU__MFHZ_old)(a3)
	beq	a3,zero,.L300
.L299:
	lui	a3,%hi(FH_DU__MFH)
	sw	zero,%lo(FH_DU__MFH)(a3)
	addi	a7,zero,2
	lui	a3,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	sb	zero,%lo(stable)(a6)
	sb	a7,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(a3)
.L300:
	beq	t5,zero,.+8
	jal	x0,.L303
	lui	a3,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	addi	a7,zero,3
	sb	a7,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a3)
.L303:
	beq	t4,zero,.+8
	jal	x0,.L304
	lui	a3,%hi(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)
	sb	s1,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a3)
.L304:
	beq	t3,zero,.+8
	jal	x0,.L305
	lui	a3,%hi(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)
	sb	zero,0(s0)
	sb	s1,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
.L305:
	beq	t1,zero,.+8
	jal	x0,.L306
	lui	a7,%hi(FH_TUERMODUL_CTRL__N)
	lui	a3,%hi(B_FH_TUERMODUL_CTRL_next_state)
	sw	zero,%lo(FH_TUERMODUL_CTRL__N)(a7)
	addi	a7,zero,2
	sb	a7,%lo(B_FH_TUERMODUL_CTRL_next_state)(a3)
	lui	a3,%hi(A_FH_TUERMODUL_CTRL_next_state)
	sb	s1,%lo(A_FH_TUERMODUL_CTRL_next_state)(a3)
	addi	a3,zero,256
	sh	a3,4(s0)
	lui	a3,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	sb	zero,6(s0)
	sb	s1,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a3)
.L306:
	sb	s1,11(s0)
	sb	s1,17(s0)
	sb	s1,20(s0)
	sb	s1,14(s0)
	beq	t0,a5,.L412
	lui	a3,%hi(FH_DU__DOOR_ID)
	lbu	a3,%lo(FH_DU__DOOR_ID)(a3)
	beq	a3,zero,.+8
	jal	x0,.L310
	lui	a3,%hi(FH_DU__S_FH_FTZU)
	sb	a5,%lo(FH_DU__S_FH_FTZU)(a3)
	beq	a2,t6,.L309
.L311:
	beq	a1,a4,.L410
.L351:
	sb	a4,%lo(FH_DU__S_FH_FTAUF)(s4)
.L314:
	lbu	a2,21(s0)
	lbu	a1,18(s0)
	lui	a7,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	sb	a2,19(s0)
	lui	a2,%hi(FH_DU__S_FH_ZUDISC)
	lbu	a0,12(s0)
	lbu	t0,15(s0)
	lbu	a3,%lo(FH_DU__S_FH_AUFDISC)(s11)
	lbu	a2,%lo(FH_DU__S_FH_ZUDISC)(a2)
	sb	a4,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(a7)
	lui	a7,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	sb	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(a7)
	sb	a1,16(s0)
	lui	a7,%hi(FH_TUERMODUL__SFHZ_MEC)
	lui	a1,%hi(FH_TUERMODUL__SFHA_MEC)
	sb	a3,%lo(FH_TUERMODUL__SFHA_MEC)(a1)
	sb	a0,10(s0)
	lui	a1,%hi(FH_TUERMODUL__KL_50)
	sb	t0,13(s0)
	sb	a2,%lo(FH_TUERMODUL__SFHZ_MEC)(a7)
	lbu	a1,%lo(FH_TUERMODUL__KL_50)(a1)
	beq	a0,zero,.L317
	lui	a7,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	lbu	a0,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a7)
	addi	t1,zero,2
	beq	a0,t1,.L318
	addi	t1,zero,3
	beq	a0,t1,.L319
	beq	a0,s1,.+8
	jal	x0,.L320
	lui	a0,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	beq	a4,zero,.+8
	jal	x0,.L321
	beq	a5,zero,.+8
	jal	x0,.L322
	lui	t1,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(t1)
	lui	t1,%hi(FH_TUERMODUL__SFHA_copy)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(t1)
	addi	t1,zero,3
	sb	zero,%lo(stable)(a6)
	sb	t1,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a7)
	sb	zero,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a0)
.L317:
	lui	a0,%hi(FH_TUERMODUL__MFHA)
	lbu	t6,%lo(FH_TUERMODUL__MFHA)(a0)
	lui	a7,%hi(FH_TUERMODUL__MFHZ)
	lui	t1,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV)
	lui	t2,%hi(FH_TUERMODUL__FT)
	lui	a0,%hi(FH_TUERMODUL__BLOCK)
	lbu	t5,%lo(FH_TUERMODUL__MFHZ)(a7)
	lbu	t3,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV)(t1)
	lbu	a7,%lo(FH_TUERMODUL__FT)(t2)
	lw	t4,%lo(FH_TUERMODUL__I_EIN)(s6)
	lw	t1,%lo(FH_TUERMODUL__POSITION)(s5)
	lbu	a0,%lo(FH_TUERMODUL__BLOCK)(a0)
	lui	t2,%hi(FH_DU__KL_50)
	sb	a1,%lo(FH_DU__KL_50)(t2)
	lui	t2,%hi(FH_DU__BLOCK)
	sb	t6,%lo(FH_DU__MFHA)(s3)
	sb	t5,%lo(FH_DU__MFHZ)(s2)
	sw	t4,%lo(FH_DU__I_EIN)(s10)
	sb	t3,%lo(FH_DU__EKS_LEISTE_AKTIV)(s9)
	sw	t1,%lo(FH_DU__POSITION)(s8)
	sb	a7,%lo(FH_DU__FT)(s7)
	sb	a0,%lo(FH_DU__BLOCK)(t2)
	beq	t0,zero,.L343
.Lpcrel_2:
	auipc	ra,%pcrel_hi(generic_FH_TUERMODUL_CTRL.part.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_2)
	lui	a5,%hi(FH_TUERMODUL__SFHA_MEC)
	lbu	a3,%lo(FH_TUERMODUL__SFHA_MEC)(a5)
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lui	a0,%hi(FH_TUERMODUL__MFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(a5)
	lui	a5,%hi(FH_TUERMODUL__SFHZ_MEC)
	lui	a7,%hi(FH_TUERMODUL__MFHZ)
	lui	t1,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV)
	lbu	t6,%lo(FH_TUERMODUL__MFHA)(a0)
	lbu	a2,%lo(FH_TUERMODUL__SFHZ_MEC)(a5)
	lui	t2,%hi(FH_TUERMODUL__FT)
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lui	a1,%hi(FH_TUERMODUL__KL_50)
	lui	a0,%hi(FH_TUERMODUL__BLOCK)
	lbu	t5,%lo(FH_TUERMODUL__MFHZ)(a7)
	lbu	t3,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV)(t1)
	lw	t4,%lo(FH_TUERMODUL__I_EIN)(s6)
	lw	t1,%lo(FH_TUERMODUL__POSITION)(s5)
	lbu	a7,%lo(FH_TUERMODUL__FT)(t2)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(a5)
	lbu	a1,%lo(FH_TUERMODUL__KL_50)(a1)
	lbu	a0,%lo(FH_TUERMODUL__BLOCK)(a0)
.L343:
	sb	a3,%lo(FH_DU__S_FH_AUFDISC)(s11)
	lui	a3,%hi(FH_DU__S_FH_FTZU)
	sb	a5,%lo(FH_DU__S_FH_FTZU)(a3)
	lui	a5,%hi(FH_DU__KL_50)
	sb	a1,%lo(FH_DU__KL_50)(a5)
	sb	a4,%lo(FH_DU__S_FH_FTAUF)(s4)
	lui	a1,%hi(FH_DU__BLOCK)
	lui	a4,%hi(FH_DU__S_FH_ZUDISC)
	sb	a2,%lo(FH_DU__S_FH_ZUDISC)(a4)
	sb	a0,%lo(FH_DU__BLOCK)(a1)
	sb	t6,%lo(FH_DU__MFHA)(s3)
	sb	t5,%lo(FH_DU__MFHZ)(s2)
	sw	t4,%lo(FH_DU__I_EIN)(s10)
	sb	t3,%lo(FH_DU__EKS_LEISTE_AKTIV)(s9)
	sw	t1,%lo(FH_DU__POSITION)(s8)
	sb	a7,%lo(FH_DU__FT)(s7)
.Lpcrel_3:
	auipc	ra,%pcrel_hi(generic_EINKLEMMSCHUTZ_CTRL)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_3)
	lui	a7,%hi(FH_TUERMODUL__MFHZ)
	lui	a0,%hi(FH_TUERMODUL__MFHA)
	lbu	a3,%lo(FH_TUERMODUL__MFHA)(a0)
	lbu	a4,%lo(FH_TUERMODUL__MFHZ)(a7)
	lw	a5,%lo(FH_TUERMODUL__I_EIN)(s6)
	lui	t1,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV)
	lui	t3,%hi(FH_TUERMODUL__FT)
	sb	a3,%lo(FH_DU__MFHA)(s3)
	sb	a4,%lo(FH_DU__MFHZ)(s2)
	lbu	a3,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV)(t1)
	lw	a4,%lo(FH_TUERMODUL__POSITION)(s5)
	sw	a5,%lo(FH_DU__I_EIN)(s10)
	lbu	a5,%lo(FH_TUERMODUL__FT)(t3)
	lui	t4,%hi(FH_TUERMODUL__SFHA_MEC)
	lui	t5,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lui	t6,%hi(FH_TUERMODUL__SFHZ_MEC)
	sb	a3,%lo(FH_DU__EKS_LEISTE_AKTIV)(s9)
	sw	a4,%lo(FH_DU__POSITION)(s8)
	lbu	a3,%lo(FH_TUERMODUL__SFHA_MEC)(t4)
	lbu	a4,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(t5)
	sb	a5,%lo(FH_DU__FT)(s7)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_MEC)(t6)
	lui	t2,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lui	a0,%hi(FH_TUERMODUL__BLOCK)
	sb	a3,%lo(FH_DU__S_FH_AUFDISC)(s11)
	sb	a4,%lo(FH_DU__S_FH_FTAUF)(s4)
	lbu	a3,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(t2)
	lui	a4,%hi(FH_DU__S_FH_ZUDISC)
	lui	a2,%hi(FH_TUERMODUL__KL_50)
	sb	a5,%lo(FH_DU__S_FH_ZUDISC)(a4)
	lbu	a4,%lo(FH_TUERMODUL__KL_50)(a2)
	lbu	a5,%lo(FH_TUERMODUL__BLOCK)(a0)
	lui	a2,%hi(FH_DU__S_FH_FTZU)
	sb	a3,%lo(FH_DU__S_FH_FTZU)(a2)
	lui	a1,%hi(FH_DU__BLOCK)
	lui	a3,%hi(FH_DU__KL_50)
	sb	a4,%lo(FH_DU__KL_50)(a3)
	sb	a5,%lo(FH_DU__BLOCK)(a1)
.Lpcrel_4:
	auipc	ra,%pcrel_hi(generic_BLOCK_ERKENNUNG_CTRL)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_4)
	lui	t3,%hi(FH_TUERMODUL__FT)
	lbu	a4,%lo(FH_TUERMODUL__FT)(t3)
	lw	a3,%lo(FH_TUERMODUL__POSITION)(s5)
	lui	t3,%hi(FH_TUERMODUL__KL_50)
	lbu	a5,%lo(FH_TUERMODUL__KL_50)(t3)
	sw	a3,%lo(FH_DU__POSITION)(s8)
	lui	a3,%hi(FH_DU__KL_50)
	sb	a5,%lo(FH_DU__KL_50)(a3)
	lui	a3,%hi(FH_TUERMODUL_CTRL__N)
	lw	a3,%lo(FH_TUERMODUL_CTRL__N)(a3)
	lui	t3,%hi(FH_DU__MFH_copy)
	sb	a4,%lo(FH_DU__FT)(s7)
	lw	a4,%lo(FH_DU__MFH_copy)(t3)
	lw	a5,%lo(FH_TUERMODUL__I_EIN)(s6)
	lui	t3,%hi(FH_TUERMODUL_CTRL__N_old)
	sw	a3,%lo(FH_TUERMODUL_CTRL__N_old)(t3)
	lui	t6,%hi(FH_TUERMODUL__SFHZ_MEC)
	lui	a3,%hi(FH_DU__MFH)
	sw	a4,%lo(FH_DU__MFH)(a3)
	lui	t2,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lbu	a3,%lo(FH_TUERMODUL__SFHZ_MEC)(t6)
	lui	a6,%hi(FH_TUERMODUL__I_EIN_old)
	lbu	t6,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(t2)
	sw	a5,%lo(FH_TUERMODUL__I_EIN_old)(a6)
	lui	t1,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV)
	lui	t4,%hi(FH_TUERMODUL__SFHA_MEC)
	lui	t5,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lui	a6,%hi(FH_DU__I_EIN_old)
	lbu	a4,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV)(t1)
	lbu	a2,%lo(FH_TUERMODUL__SFHA_MEC)(t4)
	lbu	a1,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(t5)
	sw	a5,%lo(FH_DU__I_EIN_old)(a6)
	lbu	t5,10(s0)
	lbu	t1,13(s0)
	lbu	t4,16(s0)
	lbu	t3,19(s0)
	sw	a5,%lo(FH_DU__I_EIN)(s10)
	lui	a5,%hi(FH_DU__S_FH_ZUDISC)
	sb	a3,%lo(FH_DU__S_FH_ZUDISC)(a5)
	lui	a5,%hi(FH_DU__S_FH_FTZU)
	sb	t6,%lo(FH_DU__S_FH_FTZU)(a5)
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL__N)
	sb	a4,%lo(FH_DU__EKS_LEISTE_AKTIV)(s9)
	sb	a2,%lo(FH_DU__S_FH_AUFDISC)(s11)
	sb	a1,%lo(FH_DU__S_FH_FTAUF)(s4)
	lui	a6,%hi(FH_TUERMODUL__BLOCK_copy)
	sb	t5,11(s0)
	sb	t1,14(s0)
	sb	t4,17(s0)
	sb	t3,20(s0)
	lw	a5,%lo(BLOCK_ERKENNUNG_CTRL__N)(a5)
	lbu	a0,%lo(FH_TUERMODUL__BLOCK_copy)(a6)
	lui	a6,%hi(FH_TUERMODUL__SFHZ_copy)
	lbu	a7,%lo(FH_TUERMODUL__SFHZ_copy)(a6)
	lui	a6,%hi(BLOCK_ERKENNUNG_CTRL__N_old)
	sw	a5,%lo(BLOCK_ERKENNUNG_CTRL__N_old)(a6)
	lui	a5,%hi(FH_TUERMODUL__SFHA_copy)
	lbu	t0,%lo(FH_TUERMODUL__SFHA_copy)(a5)
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL_old)
	sb	t6,%lo(FH_TUERMODUL__SFHZ_ZENTRAL_old)(a5)
	lui	a5,%hi(FH_TUERMODUL__MFHZ_copy)
	lbu	t6,%lo(FH_TUERMODUL__MFHZ_copy)(a5)
	lui	a5,%hi(FH_TUERMODUL__SFHZ_MEC_old)
	sb	a3,%lo(FH_TUERMODUL__SFHZ_MEC_old)(a5)
	lui	a5,%hi(FH_TUERMODUL__MFHA_copy)
	lbu	a3,%lo(FH_TUERMODUL__MFHA_copy)(a5)
	lui	t2,%hi(FH_TUERMODUL__BLOCK)
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL_old)
	sb	a1,%lo(FH_TUERMODUL__SFHA_ZENTRAL_old)(a5)
	sb	a0,%lo(FH_TUERMODUL__BLOCK)(t2)
	lui	a5,%hi(FH_DU__S_FH_TMBFAUFCAN)
	lui	t2,%hi(FH_TUERMODUL__BLOCK_old)
	lbu	a1,%lo(FH_DU__S_FH_TMBFAUFCAN)(a5)
	sb	a0,%lo(FH_TUERMODUL__BLOCK_old)(t2)
	lui	a5,%hi(FH_TUERMODUL__SFHA_MEC_old)
	lui	t2,%hi(FH_DU__S_FH_TMBFAUFDISC)
	lbu	a0,%lo(FH_DU__S_FH_TMBFAUFDISC)(t2)
	sb	a2,%lo(FH_TUERMODUL__SFHA_MEC_old)(a5)
	lui	t2,%hi(FH_TUERMODUL__SFHZ)
	lui	a2,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV_old)
	sb	a4,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV_old)(a2)
	sb	a7,%lo(FH_TUERMODUL__SFHZ)(t2)
	lui	a2,%hi(FH_DU__EKS_LEISTE_AKTIV_old)
	lui	t2,%hi(FH_TUERMODUL__SFHZ_old)
	lui	a6,%hi(FH_TUERMODUL__MFHA)
	lui	a5,%hi(FH_DU__S_FH_TMBFZUCAN)
	sb	a4,%lo(FH_DU__EKS_LEISTE_AKTIV_old)(a2)
	sb	a7,%lo(FH_TUERMODUL__SFHZ_old)(t2)
	sb	a3,%lo(FH_TUERMODUL__MFHA)(a6)
	lbu	a5,%lo(FH_DU__S_FH_TMBFZUCAN)(a5)
	lui	t2,%hi(FH_DU__BLOCK_copy)
	lui	a6,%hi(FH_TUERMODUL__MFHA_old)
	lui	a2,%hi(FH_DU__S_FH_TMBFZUDISC)
	lbu	a7,%lo(FH_DU__BLOCK_copy)(t2)
	sb	a3,%lo(FH_TUERMODUL__MFHA_old)(a6)
	lbu	a2,%lo(FH_DU__S_FH_TMBFZUDISC)(a2)
	lui	t2,%hi(FH_TUERMODUL__SFHA)
	lui	a3,%hi(FH_DU__S_FH_TMBFAUFCAN_old)
	sb	t0,%lo(FH_TUERMODUL__SFHA)(t2)
	sb	a1,%lo(FH_DU__S_FH_TMBFAUFCAN_old)(a3)
	lui	t2,%hi(FH_TUERMODUL__SFHA_old)
	lui	a3,%hi(FH_DU__S_FH_TMBFZUCAN_old)
	sb	t0,%lo(FH_TUERMODUL__SFHA_old)(t2)
	sb	a5,%lo(FH_DU__S_FH_TMBFZUCAN_old)(a3)
	lui	t0,%hi(FH_TUERMODUL__MFHZ)
	lui	a3,%hi(FH_DU__S_FH_TMBFZUDISC_old)
	sb	t6,%lo(FH_TUERMODUL__MFHZ)(t0)
	sb	a2,%lo(FH_DU__S_FH_TMBFZUDISC_old)(a3)
	lui	t0,%hi(FH_TUERMODUL__MFHZ_old)
	lui	a3,%hi(FH_DU__S_FH_TMBFAUFDISC_old)
	sb	t6,%lo(FH_TUERMODUL__MFHZ_old)(t0)
	sb	a0,%lo(FH_DU__S_FH_TMBFAUFDISC_old)(a3)
	lui	a4,%hi(FH_DU__BLOCK)
	sb	a7,%lo(FH_DU__BLOCK)(a4)
	lui	a4,%hi(FH_DU__MFHZ_copy)
	lbu	a3,%lo(FH_DU__MFHZ_copy)(a4)
	lui	a4,%hi(FH_DU__MFHA_copy)
	lbu	a4,%lo(FH_DU__MFHA_copy)(a4)
	lui	a6,%hi(stable)
	lui	t0,%hi(FH_DU__BLOCK_old)
	sb	a7,%lo(FH_DU__BLOCK_old)(t0)
	lbu	t6,%lo(stable)(a6)
	lui	a7,%hi(FH_DU__MFHZ_old)
	sb	a3,%lo(FH_DU__MFHZ)(s2)
	sb	a3,%lo(FH_DU__MFHZ_old)(a7)
	lui	a3,%hi(FH_DU__MFHA_old)
	sb	a4,%lo(FH_DU__MFHA)(s3)
	sb	a4,%lo(FH_DU__MFHA_old)(a3)
	beq	t6,zero,.+8
	jal	x0,.L296
	lui	a4,%hi(step)
	lbu	a3,%lo(step)(a4)
	addi	t6,a2,0
	addi	a4,a1,0
	addi	t2,a0,0
	addi	t0,a5,0
	jal	x0,.L345
.L412:
	lui	a5,%hi(FH_DU__S_FH_FTZU)
	lbu	a5,%lo(FH_DU__S_FH_FTZU)(a5)
	beq	a2,t6,.L309
	lui	a3,%hi(FH_DU__DOOR_ID)
	lbu	a3,%lo(FH_DU__DOOR_ID)(a3)
	beq	a3,zero,.L311
.L353:
	lui	a3,%hi(FH_DU__S_FH_TMBFZUCAN)
	sb	t6,%lo(FH_DU__S_FH_TMBFZUCAN)(a3)
.L309:
	beq	a1,a4,.L312
	lui	a3,%hi(FH_DU__DOOR_ID)
	lbu	a3,%lo(FH_DU__DOOR_ID)(a3)
	beq	a3,zero,.L351
.L313:
	beq	a0,t2,.L410
.L350:
	lui	a4,%hi(FH_DU__S_FH_TMBFAUFCAN)
	sb	a0,%lo(FH_DU__S_FH_TMBFAUFCAN)(a4)
.L410:
	lbu	a4,%lo(FH_DU__S_FH_FTAUF)(s4)
	jal	x0,.L314
.L310:
	lui	a5,%hi(FH_DU__S_FH_FTZU)
	lbu	a5,%lo(FH_DU__S_FH_FTZU)(a5)
	beq	a2,t6,.+8
	jal	x0,.L353
	beq	a1,a4,.+8
	jal	x0,.L313
.L312:
	lbu	a4,%lo(FH_DU__S_FH_FTAUF)(s4)
	beq	a0,t2,.L314
	lui	a3,%hi(FH_DU__DOOR_ID)
	lbu	a3,%lo(FH_DU__DOOR_ID)(a3)
	beq	a3,zero,.+8
	jal	x0,.L350
	jal	x0,.L314
.L298:
	lbu	a3,%lo(FH_DU__MFHA)(s3)
	beq	a3,zero,.+8
	jal	x0,.L300
	lui	a3,%hi(FH_DU__MFHA_old)
	lbu	a3,%lo(FH_DU__MFHA_old)(a3)
	beq	a3,zero,.+8
	jal	x0,.L299
	jal	x0,.L300
.L297:
	lbu	a3,%lo(FH_DU__MFHZ)(s2)
	beq	a3,zero,.L301
	lui	a3,%hi(FH_DU__MFHZ_old)
	lbu	a3,%lo(FH_DU__MFHZ_old)(a3)
	beq	a3,zero,.+8
	jal	x0,.L301
	lui	a7,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	addi	a3,zero,-100
	sb	s1,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(a7)
	lui	a7,%hi(FH_DU__MFH)
	sb	zero,%lo(stable)(a6)
	sw	a3,%lo(FH_DU__MFH)(a7)
	jal	x0,.L300
.L301:
	lbu	a3,%lo(FH_DU__MFHA)(s3)
	beq	a3,zero,.L300
	lui	a3,%hi(FH_DU__MFHA_old)
	lbu	a3,%lo(FH_DU__MFHA_old)(a3)
	beq	a3,zero,.+8
	jal	x0,.L300
	addi	a3,zero,100
	lui	a7,%hi(FH_DU__MFH)
	sw	a3,%lo(FH_DU__MFH)(a7)
	addi	a3,zero,3
	lui	a7,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	sb	zero,%lo(stable)(a6)
	sb	a3,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(a7)
	jal	x0,.L300
.L319:
	beq	a1,zero,.L413
	beq	a5,zero,.L317
	beq	a4,zero,.L317
.L341:
	addi	a0,zero,1
	lui	a7,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a0,%lo(FH_TUERMODUL__SFHA_copy)(a7)
	lui	a7,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	a0,%lo(FH_TUERMODUL__SFHZ_copy)(a7)
	lui	a7,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	sb	zero,%lo(stable)(a6)
	sb	a0,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a7)
	jal	x0,.L317
.L318:
	beq	a3,zero,.+8
	jal	x0,.L329
	beq	a2,zero,.+8
	jal	x0,.L330
	lui	a7,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(a7)
	lui	a7,%hi(FH_TUERMODUL__SFHA_copy)
	addi	a0,zero,3
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(a7)
	lui	a7,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	sb	a0,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a7)
	lui	a0,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	x0,.L317
.L320:
	lui	a0,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	addi	a7,zero,3
	sb	zero,%lo(stable)(a6)
	sb	a7,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	x0,.L317
.L296:
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	lw	s2,48(sp)
	lw	s3,44(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	lw	s6,32(sp)
	lw	s7,28(sp)
	lw	s8,24(sp)
	lw	s9,20(sp)
	lw	s10,16(sp)
	lw	s11,12(sp)
	addi	sp,sp,64
	jalr	zero,ra,0
.L413:
	beq	a2,zero,.+8
	jal	x0,.L414
	beq	a3,zero,.+8
	jal	x0,.L415
	beq	a5,zero,.+8
	jal	x0,.L339
	beq	a4,zero,.L317
	addi	a0,zero,1
	lui	a7,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a0,%lo(FH_TUERMODUL__SFHA_copy)(a7)
	lui	a7,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	sb	zero,%lo(stable)(a6)
	sb	a0,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a7)
	jal	x0,.L317
.L321:
	lbu	a7,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a0)
	beq	a7,s1,.L416
.L324:
	sb	zero,%lo(stable)(a6)
	jal	x0,.L317
.L329:
	lui	a0,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	lbu	a7,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a0)
	addi	t1,zero,1
	beq	a7,t1,.+8
	jal	x0,.L324
	lui	t1,%hi(FH_TUERMODUL__SFHA_MEC_old)
	lbu	t1,%lo(FH_TUERMODUL__SFHA_MEC_old)(t1)
	beq	t1,zero,.+8
	jal	x0,.L332
	lui	t1,%hi(FH_TUERMODUL__SFHA_copy)
	sb	zero,%lo(stable)(a6)
	sb	a7,%lo(FH_TUERMODUL__SFHA_copy)(t1)
	sb	a7,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	x0,.L317
.L322:
	lbu	a7,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a0)
	beq	a7,s1,.+8
	jal	x0,.L324
	lui	a7,%hi(FH_TUERMODUL__SFHZ_ZENTRAL_old)
	lbu	a7,%lo(FH_TUERMODUL__SFHZ_ZENTRAL_old)(a7)
	beq	a7,zero,.+8
	jal	x0,.L417
.L346:
	addi	a7,zero,1
	lui	t1,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(stable)(a6)
	sb	a7,%lo(FH_TUERMODUL__SFHZ_copy)(t1)
	sb	a7,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	x0,.L317
.L414:
	lui	a7,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	addi	t1,zero,2
	addi	a0,zero,1
	sb	t1,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a7)
	lui	a7,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(stable)(a6)
	sb	a0,%lo(FH_TUERMODUL__SFHZ_copy)(a7)
	beq	a3,zero,.L317
.L411:
	lui	a7,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a0,%lo(FH_TUERMODUL__SFHA_copy)(a7)
	jal	x0,.L317
.L330:
	lui	a0,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	lbu	a7,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a0)
	addi	t1,zero,1
	beq	a7,t1,.+8
	jal	x0,.L324
	lui	t1,%hi(FH_TUERMODUL__SFHZ_MEC_old)
	lbu	t1,%lo(FH_TUERMODUL__SFHZ_MEC_old)(t1)
	beq	t1,zero,.+8
	jal	x0,.L418
.L348:
	addi	a7,zero,1
	lui	t1,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(stable)(a6)
	sb	a7,%lo(FH_TUERMODUL__SFHZ_copy)(t1)
	sb	a7,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	x0,.L317
.L416:
	lui	a7,%hi(FH_TUERMODUL__SFHA_ZENTRAL_old)
	lbu	a7,%lo(FH_TUERMODUL__SFHA_ZENTRAL_old)(a7)
	beq	a7,zero,.+8
	jal	x0,.L326
	lui	a7,%hi(FH_TUERMODUL__SFHA_copy)
	sb	zero,%lo(stable)(a6)
	sb	s1,%lo(FH_TUERMODUL__SFHA_copy)(a7)
	sb	s1,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	x0,.L317
.L332:
	lui	t1,%hi(FH_TUERMODUL__SFHZ_MEC_old)
	lbu	t1,%lo(FH_TUERMODUL__SFHZ_MEC_old)(t1)
	beq	a2,zero,.+8
	jal	x0,.L419
	beq	t1,zero,.L317
	lui	t1,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(t1)
	sb	a7,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	x0,.L317
.L326:
	lui	a7,%hi(FH_TUERMODUL__SFHZ_ZENTRAL_old)
	lbu	a7,%lo(FH_TUERMODUL__SFHZ_ZENTRAL_old)(a7)
	beq	a5,zero,.+8
	jal	x0,.L420
	beq	a7,zero,.L317
	lui	a7,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(a7)
	sb	s1,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	x0,.L317
.L415:
	lui	a7,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	addi	t1,zero,2
	addi	a0,zero,1
	sb	zero,%lo(stable)(a6)
	sb	t1,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a7)
	jal	x0,.L411
.L339:
	beq	a4,zero,.+8
	jal	x0,.L341
	addi	a0,zero,1
	lui	a7,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	a0,%lo(FH_TUERMODUL__SFHZ_copy)(a7)
	lui	a7,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	sb	zero,%lo(stable)(a6)
	sb	a0,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a7)
	jal	x0,.L317
.L417:
	lui	a7,%hi(FH_TUERMODUL__SFHA_ZENTRAL_old)
	lbu	a7,%lo(FH_TUERMODUL__SFHA_ZENTRAL_old)(a7)
	beq	a7,zero,.L317
	lui	a7,%hi(FH_TUERMODUL__SFHA_copy)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(a7)
	sb	s1,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	x0,.L317
.L418:
	lui	t1,%hi(FH_TUERMODUL__SFHA_MEC_old)
	lbu	t1,%lo(FH_TUERMODUL__SFHA_MEC_old)(t1)
	beq	t1,zero,.L317
	lui	t1,%hi(FH_TUERMODUL__SFHA_copy)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(t1)
	sb	a7,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	x0,.L317
.L420:
	beq	a7,zero,.+8
	jal	x0,.L317
	jal	x0,.L346
.L419:
	beq	t1,zero,.+8
	jal	x0,.L317
	jal	x0,.L348
	.size	FH_DU, .-FH_DU
	.align	2
	.type	benchmark_body.constprop.0.isra.0, @function
benchmark_body.constprop.0.isra.0:
	addi	sp,sp,-64
	lui	a5,%hi(.LANCHOR0)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	sw	s8,24(sp)
	sw	s9,20(sp)
	sw	s10,16(sp)
	sw	s11,12(sp)
	sw	ra,60(sp)
	addi	s1,a5,%lo(.LANCHOR0)
	addi	s0,zero,1964
	lui	s11,%hi(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)
	lui	s10,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)
	lui	s9,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)
	lui	s8,%hi(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)
	lui	s7,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	lui	s6,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	lui	s5,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	lui	s4,%hi(B_FH_TUERMODUL_CTRL_next_state)
	lui	s3,%hi(A_FH_TUERMODUL_CTRL_next_state)
	lui	s2,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
.L422:
	lui	a5,%hi(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)
	sb	zero,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a5)
	lui	a5,%hi(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	sb	zero,%lo(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a5)
	lui	a5,%hi(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	sb	zero,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a5)
	lui	a5,%hi(OEFFNEN_FH_TUERMODUL_CTRL_next_state)
	sb	zero,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a5)
	lui	a5,%hi(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	sb	zero,%lo(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a5)
	lui	a5,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	sb	zero,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(a5)
	sw	zero,0(s1)
	lui	a5,%hi(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)
	sw	zero,4(s1)
	sw	zero,8(s1)
	sw	zero,12(s1)
	sw	zero,16(s1)
	sw	zero,20(s1)
	sw	zero,24(s1)
	sw	zero,28(s1)
	sw	zero,32(s1)
	sw	zero,36(s1)
	sw	zero,40(s1)
	sw	zero,44(s1)
	sw	zero,48(s1)
	sw	zero,52(s1)
	sw	zero,56(s1)
	sw	zero,60(s1)
	sw	zero,%lo(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)(s11)
	sw	zero,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)(s10)
	sw	zero,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)(s9)
	sb	zero,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(s8)
	sb	zero,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(s7)
	sb	zero,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(s6)
	sb	zero,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(s5)
	sb	zero,%lo(B_FH_TUERMODUL_CTRL_next_state)(s4)
	sb	zero,%lo(A_FH_TUERMODUL_CTRL_next_state)(s3)
	sb	zero,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(s2)
	sb	zero,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a5)
	lui	a5,%hi(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)
	sb	zero,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a5)
	addi	s0,s0,-1
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)
	sb	zero,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a5)
.Lpcrel_5:
	auipc	ra,%pcrel_hi(interface)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_5)
.Lpcrel_6:
	auipc	ra,%pcrel_hi(FH_DU)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_6)
	beq	s0,zero,.+8
	jal	x0,.L422
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	lw	s2,48(sp)
	lw	s3,44(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	lw	s6,32(sp)
	lw	s7,28(sp)
	lw	s8,24(sp)
	lw	s9,20(sp)
	lw	s10,16(sp)
	lw	s11,12(sp)
	addi	sp,sp,64
	jalr	zero,ra,0
	.size	benchmark_body.constprop.0.isra.0, .-benchmark_body.constprop.0.isra.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	bge	zero,a0,.L430
	addi	sp,sp,-80
	lui	a5,%hi(.LANCHOR0)
	sw	s0,72(sp)
	sw	s1,68(sp)
	sw	s2,64(sp)
	sw	s3,60(sp)
	sw	s4,56(sp)
	sw	s5,52(sp)
	sw	s6,48(sp)
	sw	s7,44(sp)
	sw	s8,40(sp)
	sw	s9,36(sp)
	sw	s10,32(sp)
	sw	s11,28(sp)
	sw	ra,76(sp)
	sw	a0,12(sp)
	addi	s1,a5,%lo(.LANCHOR0)
	addi	s0,zero,0
	lui	s11,%hi(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)
	lui	s10,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)
	lui	s9,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)
	lui	s8,%hi(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)
	lui	s7,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	lui	s6,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	lui	s5,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	lui	s4,%hi(B_FH_TUERMODUL_CTRL_next_state)
	lui	s3,%hi(A_FH_TUERMODUL_CTRL_next_state)
	lui	s2,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
.L427:
	lui	a5,%hi(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)
	sb	zero,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a5)
	lui	a5,%hi(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	sb	zero,%lo(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a5)
	lui	a5,%hi(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	sb	zero,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a5)
	lui	a5,%hi(OEFFNEN_FH_TUERMODUL_CTRL_next_state)
	sb	zero,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a5)
	lui	a5,%hi(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	sb	zero,%lo(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a5)
	lui	a5,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	sb	zero,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(a5)
	sw	zero,0(s1)
	lui	a5,%hi(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)
	sw	zero,4(s1)
	sw	zero,8(s1)
	sw	zero,12(s1)
	sw	zero,16(s1)
	sw	zero,20(s1)
	sw	zero,24(s1)
	sw	zero,28(s1)
	sw	zero,32(s1)
	sw	zero,36(s1)
	sw	zero,40(s1)
	sw	zero,44(s1)
	sw	zero,48(s1)
	sw	zero,52(s1)
	sw	zero,56(s1)
	sw	zero,60(s1)
	sw	zero,%lo(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)(s11)
	sw	zero,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)(s10)
	sw	zero,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)(s9)
	sb	zero,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(s8)
	sb	zero,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(s7)
	sb	zero,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(s6)
	sb	zero,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(s5)
	sb	zero,%lo(B_FH_TUERMODUL_CTRL_next_state)(s4)
	sb	zero,%lo(A_FH_TUERMODUL_CTRL_next_state)(s3)
	sb	zero,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(s2)
	sb	zero,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a5)
	lui	a5,%hi(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)
	sb	zero,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a5)
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)
	sb	zero,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a5)
.Lpcrel_7:
	auipc	ra,%pcrel_hi(interface)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_7)
.Lpcrel_8:
	auipc	ra,%pcrel_hi(FH_DU)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_8)
	lw	a5,12(sp)
	addi	s0,s0,1
	beq	s0,a5,.+8
	jal	x0,.L427
	lw	ra,76(sp)
	lw	s0,72(sp)
	lw	s1,68(sp)
	lw	s2,64(sp)
	lw	s3,60(sp)
	lw	s4,56(sp)
	lw	s5,52(sp)
	lw	s6,48(sp)
	lw	s7,44(sp)
	lw	s8,40(sp)
	lw	s9,36(sp)
	lw	s10,32(sp)
	lw	s11,28(sp)
	addi	sp,sp,80
	jalr	zero,ra,0
.L430:
	jalr	zero,ra,0
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.globl	warm_caches
	.type	warm_caches, @function
warm_caches:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_9:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_9)
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
.Lpcrel_10:
	auipc	ra,%pcrel_hi(benchmark_body.constprop.0.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_10)
	lw	ra,12(sp)
	addi	a0,zero,0
	addi	sp,sp,16
	jalr	zero,ra,0
	.size	benchmark, .-benchmark
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	jalr	zero,ra,0
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a5,%hi(.LANCHOR0)
	addi	sp,sp,-64
	addi	a4,zero,256
	addi	a5,a5,%lo(.LANCHOR0)
	sw	a4,4(sp)
	sw	zero,0(sp)
	sw	zero,8(sp)
	sw	zero,12(sp)
	sw	zero,16(sp)
	sw	zero,20(sp)
	sw	zero,24(sp)
	sw	zero,28(sp)
	sw	zero,32(sp)
	sw	zero,36(sp)
	sw	zero,40(sp)
	sw	zero,44(sp)
	sw	zero,48(sp)
	sw	zero,52(sp)
	sw	zero,56(sp)
	sw	zero,60(sp)
	addi	a1,a5,64
	addi	a4,sp,0
	jal	x0,.L440
.L453:
	beq	a5,a1,.L452
.L440:
	lbu	a2,0(a5)
	lbu	a3,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	beq	a2,a3,.L453
.L449:
	addi	a0,zero,0
.L438:
	addi	sp,sp,64
	jalr	zero,ra,0
.L452:
	lui	a4,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)
	lui	a5,%hi(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)
	lw	a3,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)(a4)
	lw	a5,%lo(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)(a5)
	lui	a4,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)
	lw	a4,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)(a4)
	or	a5,a5,a3
	addi	a0,zero,0
	or	a5,a5,a4
	beq	a5,zero,.+8
	jal	x0,.L438
	lui	a5,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	lbu	a4,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a5)
	addi	a5,zero,3
	beq	a4,a5,.+8
	jal	x0,.L438
	lui	a5,%hi(B_FH_TUERMODUL_CTRL_next_state)
	lbu	a4,%lo(B_FH_TUERMODUL_CTRL_next_state)(a5)
	addi	a5,zero,2
	beq	a4,a5,.+8
	jal	x0,.L438
	lui	a5,%hi(A_FH_TUERMODUL_CTRL_next_state)
	lbu	a3,%lo(A_FH_TUERMODUL_CTRL_next_state)(a5)
	addi	a5,zero,1
	beq	a3,a5,.+8
	jal	x0,.L438
	lui	a5,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	lbu	a5,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a5)
	beq	a5,a3,.+8
	jal	x0,.L438
	lui	a3,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	lbu	a3,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(a3)
	beq	a3,a4,.+8
	jal	x0,.L438
	lui	a4,%hi(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)
	lbu	a4,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a4)
	beq	a4,a5,.+8
	jal	x0,.L438
	lui	a4,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	lui	a5,%hi(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)
	lbu	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	lbu	a5,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a5)
	lui	a4,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	lbu	a1,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a4)
	lui	a4,%hi(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)
	lbu	a2,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a4)
	lui	a4,%hi(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	or	a5,a5,a3
	lbu	a3,%lo(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a4)
	lui	a4,%hi(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	or	a5,a5,a1
	lbu	a1,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a4)
	lui	a4,%hi(OEFFNEN_FH_TUERMODUL_CTRL_next_state)
	or	a5,a5,a2
	lbu	a2,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a4)
	lui	a4,%hi(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	or	a5,a5,a3
	lbu	a3,%lo(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a4)
	lui	a4,%hi(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)
	lbu	a4,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a4)
	or	a5,a5,a1
	or	a5,a5,a2
	or	a5,a5,a3
	or	a5,a5,a4
	beq	a5,zero,.+8
	jal	x0,.L449
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)
	lbu	a0,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a5)
	addi	a0,a0,-1
	sltiu	a0,a0,1
	jal	x0,.L438
	.size	verify_benchmark, .-verify_benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	addi	a0,zero,1
	sw	ra,28(sp)
.Lpcrel_11:
	auipc	ra,%pcrel_hi(benchmark_body.isra.0)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_11)
.Lpcrel_12:
	auipc	ra,%pcrel_hi(benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_12)
	sw	zero,12(sp)
	lw	a0,12(sp)
.Lpcrel_13:
	auipc	ra,%pcrel_hi(verify_benchmark)
	jalr	ra,ra,%pcrel_lo(.Lpcrel_13)
	lw	ra,28(sp)
	addi	op_1,x0,1
	or	op_0,op_1,a0
	addi	op_3,x0,1
	addi	op_6,x0,1
	or	op_5,op_6,a0
	sub	op_4,op_5,a0
	sub	op_2,op_3,op_4
	sub	a0,op_0,op_2
	addi	sp,sp,32
	jalr	zero,ra,0
	.size	main, .-main
	.globl	BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state
	.globl	BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state
	.globl	EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state
	.globl	FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state
	.globl	SCHLIESSEN_FH_TUERMODUL_CTRL_next_state
	.globl	OEFFNEN_FH_TUERMODUL_CTRL_next_state
	.globl	MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state
	.globl	TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state
	.globl	INITIALISIERT_FH_TUERMODUL_CTRL_next_state
	.globl	WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state
	.globl	A_FH_TUERMODUL_CTRL_next_state
	.globl	B_FH_TUERMODUL_CTRL_next_state
	.globl	KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state
	.globl	MEC_KINDERSICHERUNG_CTRL_next_state
	.globl	ZENTRAL_KINDERSICHERUNG_CTRL_next_state
	.globl	NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state
	.globl	step
	.globl	stable
	.globl	time
	.globl	FH_DU__MFHA_old
	.globl	FH_DU__MFHA_copy
	.globl	FH_DU__MFHA
	.globl	FH_DU__MFHZ_old
	.globl	FH_DU__MFHZ_copy
	.globl	FH_DU__MFHZ
	.globl	FH_DU__BLOCK_old
	.globl	FH_DU__BLOCK_copy
	.globl	FH_DU__BLOCK
	.globl	FH_DU__DOOR_ID
	.globl	FH_DU__S_FH_AUFDISC
	.globl	FH_DU__S_FH_ZUDISC
	.globl	FH_DU__S_FH_TMBFAUFDISC_old
	.globl	FH_DU__S_FH_TMBFAUFDISC
	.globl	FH_DU__S_FH_TMBFZUDISC_old
	.globl	FH_DU__S_FH_TMBFZUDISC
	.globl	FH_DU__S_FH_TMBFZUCAN_old
	.globl	FH_DU__S_FH_TMBFZUCAN_copy
	.globl	FH_DU__S_FH_TMBFZUCAN
	.globl	FH_DU__S_FH_TMBFAUFCAN_old
	.globl	FH_DU__S_FH_TMBFAUFCAN_copy
	.globl	FH_DU__S_FH_TMBFAUFCAN
	.globl	FH_DU__EKS_LEISTE_AKTIV_old
	.globl	FH_DU__EKS_LEISTE_AKTIV
	.globl	FH_DU__FT
	.globl	FH_DU__S_FH_FTAUF
	.globl	FH_DU__S_FH_FTZU
	.globl	FH_DU__KL_50
	.globl	FH_TUERMODUL__COM_CLOSE
	.globl	FH_TUERMODUL__COM_OPEN
	.globl	FH_TUERMODUL__EKS_LEISTE_AKTIV_old
	.globl	FH_TUERMODUL__EKS_LEISTE_AKTIV
	.globl	FH_TUERMODUL__MFHA_old
	.globl	FH_TUERMODUL__MFHA_copy
	.globl	FH_TUERMODUL__MFHA
	.globl	FH_TUERMODUL__MFHZ_old
	.globl	FH_TUERMODUL__MFHZ_copy
	.globl	FH_TUERMODUL__MFHZ
	.globl	FH_TUERMODUL__SFHA_old
	.globl	FH_TUERMODUL__SFHA_copy
	.globl	FH_TUERMODUL__SFHA
	.globl	FH_TUERMODUL__SFHZ_old
	.globl	FH_TUERMODUL__SFHZ_copy
	.globl	FH_TUERMODUL__SFHZ
	.globl	FH_TUERMODUL__FT
	.globl	FH_TUERMODUL__BLOCK_old
	.globl	FH_TUERMODUL__BLOCK_copy
	.globl	FH_TUERMODUL__BLOCK
	.globl	FH_TUERMODUL__KL_50
	.globl	FH_TUERMODUL__SFHA_MEC_old
	.globl	FH_TUERMODUL__SFHA_MEC
	.globl	FH_TUERMODUL__SFHA_ZENTRAL_old
	.globl	FH_TUERMODUL__SFHA_ZENTRAL
	.globl	FH_TUERMODUL__SFHZ_MEC_old
	.globl	FH_TUERMODUL__SFHZ_MEC
	.globl	FH_TUERMODUL__SFHZ_ZENTRAL_old
	.globl	FH_TUERMODUL__SFHZ_ZENTRAL
	.globl	FH_TUERMODUL_CTRL__FT
	.globl	FH_TUERMODUL_CTRL__INREVERS1_copy
	.globl	FH_TUERMODUL_CTRL__INREVERS1
	.globl	FH_TUERMODUL_CTRL__INREVERS2_copy
	.globl	FH_TUERMODUL_CTRL__INREVERS2
	.globl	BLOCK_ERKENNUNG_CTRL__N_old
	.globl	BLOCK_ERKENNUNG_CTRL__N_copy
	.globl	BLOCK_ERKENNUNG_CTRL__N
	.globl	BLOCK_ERKENNUNG_CTRL__I_EIN_MAX_copy
	.globl	BLOCK_ERKENNUNG_CTRL__I_EIN_MAX
	.globl	FH_DU__I_EIN_old
	.globl	FH_DU__I_EIN
	.globl	FH_DU__POSITION
	.globl	FH_DU__MFH_copy
	.globl	FH_DU__MFH
	.globl	FH_TUERMODUL__I_EIN_old
	.globl	FH_TUERMODUL__I_EIN
	.globl	FH_TUERMODUL__POSITION
	.globl	sc_FH_TUERMODUL_CTRL_1739_10
	.globl	sc_FH_TUERMODUL_CTRL_1781_10
	.globl	FH_TUERMODUL_CTRL__N_old
	.globl	FH_TUERMODUL_CTRL__N_copy
	.globl	FH_TUERMODUL_CTRL__N
	.globl	sc_FH_TUERMODUL_CTRL_2329_1
	.globl	sc_FH_TUERMODUL_CTRL_2352_1
	.globl	sc_FH_TUERMODUL_CTRL_2375_2
	.globl	tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL
	.globl	tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL
	.globl	tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	Bitlist, @object
	.size	Bitlist, 64
Bitlist:
	.zero	64
	.section	.sbss,"aw",@nobits
	.align	2
	.type	BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state, @object
	.size	BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state, 1
BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state:
	.zero	1
	.type	BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state, @object
	.size	BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state, 1
BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state:
	.zero	1
	.type	EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state, @object
	.size	EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state, 1
EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state:
	.zero	1
	.type	FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state, @object
	.size	FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state, 1
FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state:
	.zero	1
	.type	SCHLIESSEN_FH_TUERMODUL_CTRL_next_state, @object
	.size	SCHLIESSEN_FH_TUERMODUL_CTRL_next_state, 1
SCHLIESSEN_FH_TUERMODUL_CTRL_next_state:
	.zero	1
	.type	OEFFNEN_FH_TUERMODUL_CTRL_next_state, @object
	.size	OEFFNEN_FH_TUERMODUL_CTRL_next_state, 1
OEFFNEN_FH_TUERMODUL_CTRL_next_state:
	.zero	1
	.type	MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state, @object
	.size	MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state, 1
MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state:
	.zero	1
	.type	TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state, @object
	.size	TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state, 1
TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state:
	.zero	1
	.type	INITIALISIERT_FH_TUERMODUL_CTRL_next_state, @object
	.size	INITIALISIERT_FH_TUERMODUL_CTRL_next_state, 1
INITIALISIERT_FH_TUERMODUL_CTRL_next_state:
	.zero	1
	.type	WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state, @object
	.size	WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state, 1
WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state:
	.zero	1
	.type	A_FH_TUERMODUL_CTRL_next_state, @object
	.size	A_FH_TUERMODUL_CTRL_next_state, 1
A_FH_TUERMODUL_CTRL_next_state:
	.zero	1
	.type	B_FH_TUERMODUL_CTRL_next_state, @object
	.size	B_FH_TUERMODUL_CTRL_next_state, 1
B_FH_TUERMODUL_CTRL_next_state:
	.zero	1
	.type	KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state, @object
	.size	KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state, 1
KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state:
	.zero	1
	.type	MEC_KINDERSICHERUNG_CTRL_next_state, @object
	.size	MEC_KINDERSICHERUNG_CTRL_next_state, 1
MEC_KINDERSICHERUNG_CTRL_next_state:
	.zero	1
	.type	ZENTRAL_KINDERSICHERUNG_CTRL_next_state, @object
	.size	ZENTRAL_KINDERSICHERUNG_CTRL_next_state, 1
ZENTRAL_KINDERSICHERUNG_CTRL_next_state:
	.zero	1
	.type	NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state, @object
	.size	NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state, 1
NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state:
	.zero	1
	.type	step, @object
	.size	step, 1
step:
	.zero	1
	.type	stable, @object
	.size	stable, 1
stable:
	.zero	1
	.zero	2
	.type	time, @object
	.size	time, 4
time:
	.zero	4
	.type	FH_DU__MFHA_old, @object
	.size	FH_DU__MFHA_old, 1
FH_DU__MFHA_old:
	.zero	1
	.type	FH_DU__MFHA_copy, @object
	.size	FH_DU__MFHA_copy, 1
FH_DU__MFHA_copy:
	.zero	1
	.type	FH_DU__MFHA, @object
	.size	FH_DU__MFHA, 1
FH_DU__MFHA:
	.zero	1
	.type	FH_DU__MFHZ_old, @object
	.size	FH_DU__MFHZ_old, 1
FH_DU__MFHZ_old:
	.zero	1
	.type	FH_DU__MFHZ_copy, @object
	.size	FH_DU__MFHZ_copy, 1
FH_DU__MFHZ_copy:
	.zero	1
	.type	FH_DU__MFHZ, @object
	.size	FH_DU__MFHZ, 1
FH_DU__MFHZ:
	.zero	1
	.type	FH_DU__BLOCK_old, @object
	.size	FH_DU__BLOCK_old, 1
FH_DU__BLOCK_old:
	.zero	1
	.type	FH_DU__BLOCK_copy, @object
	.size	FH_DU__BLOCK_copy, 1
FH_DU__BLOCK_copy:
	.zero	1
	.type	FH_DU__BLOCK, @object
	.size	FH_DU__BLOCK, 1
FH_DU__BLOCK:
	.zero	1
	.type	FH_DU__DOOR_ID, @object
	.size	FH_DU__DOOR_ID, 1
FH_DU__DOOR_ID:
	.zero	1
	.type	FH_DU__S_FH_AUFDISC, @object
	.size	FH_DU__S_FH_AUFDISC, 1
FH_DU__S_FH_AUFDISC:
	.zero	1
	.type	FH_DU__S_FH_ZUDISC, @object
	.size	FH_DU__S_FH_ZUDISC, 1
FH_DU__S_FH_ZUDISC:
	.zero	1
	.type	FH_DU__S_FH_TMBFAUFDISC_old, @object
	.size	FH_DU__S_FH_TMBFAUFDISC_old, 1
FH_DU__S_FH_TMBFAUFDISC_old:
	.zero	1
	.type	FH_DU__S_FH_TMBFAUFDISC, @object
	.size	FH_DU__S_FH_TMBFAUFDISC, 1
FH_DU__S_FH_TMBFAUFDISC:
	.zero	1
	.type	FH_DU__S_FH_TMBFZUDISC_old, @object
	.size	FH_DU__S_FH_TMBFZUDISC_old, 1
FH_DU__S_FH_TMBFZUDISC_old:
	.zero	1
	.type	FH_DU__S_FH_TMBFZUDISC, @object
	.size	FH_DU__S_FH_TMBFZUDISC, 1
FH_DU__S_FH_TMBFZUDISC:
	.zero	1
	.type	FH_DU__S_FH_TMBFZUCAN_old, @object
	.size	FH_DU__S_FH_TMBFZUCAN_old, 1
FH_DU__S_FH_TMBFZUCAN_old:
	.zero	1
	.type	FH_DU__S_FH_TMBFZUCAN_copy, @object
	.size	FH_DU__S_FH_TMBFZUCAN_copy, 1
FH_DU__S_FH_TMBFZUCAN_copy:
	.zero	1
	.type	FH_DU__S_FH_TMBFZUCAN, @object
	.size	FH_DU__S_FH_TMBFZUCAN, 1
FH_DU__S_FH_TMBFZUCAN:
	.zero	1
	.type	FH_DU__S_FH_TMBFAUFCAN_old, @object
	.size	FH_DU__S_FH_TMBFAUFCAN_old, 1
FH_DU__S_FH_TMBFAUFCAN_old:
	.zero	1
	.type	FH_DU__S_FH_TMBFAUFCAN_copy, @object
	.size	FH_DU__S_FH_TMBFAUFCAN_copy, 1
FH_DU__S_FH_TMBFAUFCAN_copy:
	.zero	1
	.type	FH_DU__S_FH_TMBFAUFCAN, @object
	.size	FH_DU__S_FH_TMBFAUFCAN, 1
FH_DU__S_FH_TMBFAUFCAN:
	.zero	1
	.type	FH_DU__EKS_LEISTE_AKTIV_old, @object
	.size	FH_DU__EKS_LEISTE_AKTIV_old, 1
FH_DU__EKS_LEISTE_AKTIV_old:
	.zero	1
	.type	FH_DU__EKS_LEISTE_AKTIV, @object
	.size	FH_DU__EKS_LEISTE_AKTIV, 1
FH_DU__EKS_LEISTE_AKTIV:
	.zero	1
	.type	FH_DU__FT, @object
	.size	FH_DU__FT, 1
FH_DU__FT:
	.zero	1
	.type	FH_DU__S_FH_FTAUF, @object
	.size	FH_DU__S_FH_FTAUF, 1
FH_DU__S_FH_FTAUF:
	.zero	1
	.type	FH_DU__S_FH_FTZU, @object
	.size	FH_DU__S_FH_FTZU, 1
FH_DU__S_FH_FTZU:
	.zero	1
	.type	FH_DU__KL_50, @object
	.size	FH_DU__KL_50, 1
FH_DU__KL_50:
	.zero	1
	.type	FH_TUERMODUL__COM_CLOSE, @object
	.size	FH_TUERMODUL__COM_CLOSE, 1
FH_TUERMODUL__COM_CLOSE:
	.zero	1
	.type	FH_TUERMODUL__COM_OPEN, @object
	.size	FH_TUERMODUL__COM_OPEN, 1
FH_TUERMODUL__COM_OPEN:
	.zero	1
	.type	FH_TUERMODUL__EKS_LEISTE_AKTIV_old, @object
	.size	FH_TUERMODUL__EKS_LEISTE_AKTIV_old, 1
FH_TUERMODUL__EKS_LEISTE_AKTIV_old:
	.zero	1
	.type	FH_TUERMODUL__EKS_LEISTE_AKTIV, @object
	.size	FH_TUERMODUL__EKS_LEISTE_AKTIV, 1
FH_TUERMODUL__EKS_LEISTE_AKTIV:
	.zero	1
	.type	FH_TUERMODUL__MFHA_old, @object
	.size	FH_TUERMODUL__MFHA_old, 1
FH_TUERMODUL__MFHA_old:
	.zero	1
	.type	FH_TUERMODUL__MFHA_copy, @object
	.size	FH_TUERMODUL__MFHA_copy, 1
FH_TUERMODUL__MFHA_copy:
	.zero	1
	.type	FH_TUERMODUL__MFHA, @object
	.size	FH_TUERMODUL__MFHA, 1
FH_TUERMODUL__MFHA:
	.zero	1
	.type	FH_TUERMODUL__MFHZ_old, @object
	.size	FH_TUERMODUL__MFHZ_old, 1
FH_TUERMODUL__MFHZ_old:
	.zero	1
	.type	FH_TUERMODUL__MFHZ_copy, @object
	.size	FH_TUERMODUL__MFHZ_copy, 1
FH_TUERMODUL__MFHZ_copy:
	.zero	1
	.type	FH_TUERMODUL__MFHZ, @object
	.size	FH_TUERMODUL__MFHZ, 1
FH_TUERMODUL__MFHZ:
	.zero	1
	.type	FH_TUERMODUL__SFHA_old, @object
	.size	FH_TUERMODUL__SFHA_old, 1
FH_TUERMODUL__SFHA_old:
	.zero	1
	.type	FH_TUERMODUL__SFHA_copy, @object
	.size	FH_TUERMODUL__SFHA_copy, 1
FH_TUERMODUL__SFHA_copy:
	.zero	1
	.type	FH_TUERMODUL__SFHA, @object
	.size	FH_TUERMODUL__SFHA, 1
FH_TUERMODUL__SFHA:
	.zero	1
	.type	FH_TUERMODUL__SFHZ_old, @object
	.size	FH_TUERMODUL__SFHZ_old, 1
FH_TUERMODUL__SFHZ_old:
	.zero	1
	.type	FH_TUERMODUL__SFHZ_copy, @object
	.size	FH_TUERMODUL__SFHZ_copy, 1
FH_TUERMODUL__SFHZ_copy:
	.zero	1
	.type	FH_TUERMODUL__SFHZ, @object
	.size	FH_TUERMODUL__SFHZ, 1
FH_TUERMODUL__SFHZ:
	.zero	1
	.type	FH_TUERMODUL__FT, @object
	.size	FH_TUERMODUL__FT, 1
FH_TUERMODUL__FT:
	.zero	1
	.type	FH_TUERMODUL__BLOCK_old, @object
	.size	FH_TUERMODUL__BLOCK_old, 1
FH_TUERMODUL__BLOCK_old:
	.zero	1
	.type	FH_TUERMODUL__BLOCK_copy, @object
	.size	FH_TUERMODUL__BLOCK_copy, 1
FH_TUERMODUL__BLOCK_copy:
	.zero	1
	.type	FH_TUERMODUL__BLOCK, @object
	.size	FH_TUERMODUL__BLOCK, 1
FH_TUERMODUL__BLOCK:
	.zero	1
	.type	FH_TUERMODUL__KL_50, @object
	.size	FH_TUERMODUL__KL_50, 1
FH_TUERMODUL__KL_50:
	.zero	1
	.type	FH_TUERMODUL__SFHA_MEC_old, @object
	.size	FH_TUERMODUL__SFHA_MEC_old, 1
FH_TUERMODUL__SFHA_MEC_old:
	.zero	1
	.type	FH_TUERMODUL__SFHA_MEC, @object
	.size	FH_TUERMODUL__SFHA_MEC, 1
FH_TUERMODUL__SFHA_MEC:
	.zero	1
	.type	FH_TUERMODUL__SFHA_ZENTRAL_old, @object
	.size	FH_TUERMODUL__SFHA_ZENTRAL_old, 1
FH_TUERMODUL__SFHA_ZENTRAL_old:
	.zero	1
	.type	FH_TUERMODUL__SFHA_ZENTRAL, @object
	.size	FH_TUERMODUL__SFHA_ZENTRAL, 1
FH_TUERMODUL__SFHA_ZENTRAL:
	.zero	1
	.type	FH_TUERMODUL__SFHZ_MEC_old, @object
	.size	FH_TUERMODUL__SFHZ_MEC_old, 1
FH_TUERMODUL__SFHZ_MEC_old:
	.zero	1
	.type	FH_TUERMODUL__SFHZ_MEC, @object
	.size	FH_TUERMODUL__SFHZ_MEC, 1
FH_TUERMODUL__SFHZ_MEC:
	.zero	1
	.type	FH_TUERMODUL__SFHZ_ZENTRAL_old, @object
	.size	FH_TUERMODUL__SFHZ_ZENTRAL_old, 1
FH_TUERMODUL__SFHZ_ZENTRAL_old:
	.zero	1
	.type	FH_TUERMODUL__SFHZ_ZENTRAL, @object
	.size	FH_TUERMODUL__SFHZ_ZENTRAL, 1
FH_TUERMODUL__SFHZ_ZENTRAL:
	.zero	1
	.type	FH_TUERMODUL_CTRL__FT, @object
	.size	FH_TUERMODUL_CTRL__FT, 1
FH_TUERMODUL_CTRL__FT:
	.zero	1
	.type	FH_TUERMODUL_CTRL__INREVERS1_copy, @object
	.size	FH_TUERMODUL_CTRL__INREVERS1_copy, 1
FH_TUERMODUL_CTRL__INREVERS1_copy:
	.zero	1
	.type	FH_TUERMODUL_CTRL__INREVERS1, @object
	.size	FH_TUERMODUL_CTRL__INREVERS1, 1
FH_TUERMODUL_CTRL__INREVERS1:
	.zero	1
	.type	FH_TUERMODUL_CTRL__INREVERS2_copy, @object
	.size	FH_TUERMODUL_CTRL__INREVERS2_copy, 1
FH_TUERMODUL_CTRL__INREVERS2_copy:
	.zero	1
	.type	FH_TUERMODUL_CTRL__INREVERS2, @object
	.size	FH_TUERMODUL_CTRL__INREVERS2, 1
FH_TUERMODUL_CTRL__INREVERS2:
	.zero	1
	.zero	2
	.type	BLOCK_ERKENNUNG_CTRL__N_old, @object
	.size	BLOCK_ERKENNUNG_CTRL__N_old, 4
BLOCK_ERKENNUNG_CTRL__N_old:
	.zero	4
	.type	BLOCK_ERKENNUNG_CTRL__N_copy, @object
	.size	BLOCK_ERKENNUNG_CTRL__N_copy, 4
BLOCK_ERKENNUNG_CTRL__N_copy:
	.zero	4
	.type	BLOCK_ERKENNUNG_CTRL__N, @object
	.size	BLOCK_ERKENNUNG_CTRL__N, 4
BLOCK_ERKENNUNG_CTRL__N:
	.zero	4
	.type	BLOCK_ERKENNUNG_CTRL__I_EIN_MAX_copy, @object
	.size	BLOCK_ERKENNUNG_CTRL__I_EIN_MAX_copy, 4
BLOCK_ERKENNUNG_CTRL__I_EIN_MAX_copy:
	.zero	4
	.type	BLOCK_ERKENNUNG_CTRL__I_EIN_MAX, @object
	.size	BLOCK_ERKENNUNG_CTRL__I_EIN_MAX, 4
BLOCK_ERKENNUNG_CTRL__I_EIN_MAX:
	.zero	4
	.type	FH_DU__I_EIN_old, @object
	.size	FH_DU__I_EIN_old, 4
FH_DU__I_EIN_old:
	.zero	4
	.type	FH_DU__I_EIN, @object
	.size	FH_DU__I_EIN, 4
FH_DU__I_EIN:
	.zero	4
	.type	FH_DU__POSITION, @object
	.size	FH_DU__POSITION, 4
FH_DU__POSITION:
	.zero	4
	.type	FH_DU__MFH_copy, @object
	.size	FH_DU__MFH_copy, 4
FH_DU__MFH_copy:
	.zero	4
	.type	FH_DU__MFH, @object
	.size	FH_DU__MFH, 4
FH_DU__MFH:
	.zero	4
	.type	FH_TUERMODUL__I_EIN_old, @object
	.size	FH_TUERMODUL__I_EIN_old, 4
FH_TUERMODUL__I_EIN_old:
	.zero	4
	.type	FH_TUERMODUL__I_EIN, @object
	.size	FH_TUERMODUL__I_EIN, 4
FH_TUERMODUL__I_EIN:
	.zero	4
	.type	FH_TUERMODUL__POSITION, @object
	.size	FH_TUERMODUL__POSITION, 4
FH_TUERMODUL__POSITION:
	.zero	4
	.type	sc_FH_TUERMODUL_CTRL_1739_10, @object
	.size	sc_FH_TUERMODUL_CTRL_1739_10, 4
sc_FH_TUERMODUL_CTRL_1739_10:
	.zero	4
	.type	sc_FH_TUERMODUL_CTRL_1781_10, @object
	.size	sc_FH_TUERMODUL_CTRL_1781_10, 4
sc_FH_TUERMODUL_CTRL_1781_10:
	.zero	4
	.type	FH_TUERMODUL_CTRL__N_old, @object
	.size	FH_TUERMODUL_CTRL__N_old, 4
FH_TUERMODUL_CTRL__N_old:
	.zero	4
	.type	FH_TUERMODUL_CTRL__N_copy, @object
	.size	FH_TUERMODUL_CTRL__N_copy, 4
FH_TUERMODUL_CTRL__N_copy:
	.zero	4
	.type	FH_TUERMODUL_CTRL__N, @object
	.size	FH_TUERMODUL_CTRL__N, 4
FH_TUERMODUL_CTRL__N:
	.zero	4
	.type	sc_FH_TUERMODUL_CTRL_2329_1, @object
	.size	sc_FH_TUERMODUL_CTRL_2329_1, 4
sc_FH_TUERMODUL_CTRL_2329_1:
	.zero	4
	.type	sc_FH_TUERMODUL_CTRL_2352_1, @object
	.size	sc_FH_TUERMODUL_CTRL_2352_1, 4
sc_FH_TUERMODUL_CTRL_2352_1:
	.zero	4
	.type	sc_FH_TUERMODUL_CTRL_2375_2, @object
	.size	sc_FH_TUERMODUL_CTRL_2375_2, 4
sc_FH_TUERMODUL_CTRL_2375_2:
	.zero	4
	.type	tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL, @object
	.size	tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL, 4
tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL:
	.zero	4
	.type	tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL, @object
	.size	tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL, 4
tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL:
	.zero	4
	.type	tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy, @object
	.size	tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy, 4
tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy:
	.zero	4
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
