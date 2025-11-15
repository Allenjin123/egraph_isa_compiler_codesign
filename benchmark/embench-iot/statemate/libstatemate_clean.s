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
	bne	a4,zero,.L2
	lui	a4,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	addi	a3, zero, 3
	sb	a3,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
.L2:
	lbu	a4,19(a5)
	bne	a4,zero,.L3
	lui	a4,%hi(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)
	addi	a3, zero, 1
	sb	zero,0(a5)
	sb	a3,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a4)
.L3:
	lui	a2,%hi(B_FH_TUERMODUL_CTRL_next_state)
	lbu	a3,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	addi	a4, zero, 1
	sb	a4,11(a5)
	sb	a4,20(a5)
	addi	a1, zero, 2
	beq	a3,a1,.L4
	addi	a0, zero, 3
	beq	a3,a0,.L5
	bne	a3,a4,.L6
	lui	a4,%hi(FH_TUERMODUL_CTRL__N)
	lw	a4,%lo(FH_TUERMODUL_CTRL__N)(a4)
	addi	a3, zero, 59
	beq	a4,a3,.L120
.L8:
	lui	a3,%hi(A_FH_TUERMODUL_CTRL_next_state)
	lbu	a2,%lo(A_FH_TUERMODUL_CTRL_next_state)(a3)
	addi	a4, zero, 1
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
	jalr	zero, ra, 0
.L5:
	lui	a3,%hi(FH_TUERMODUL_CTRL__N)
	lw	a1,%lo(FH_TUERMODUL_CTRL__N)(a3)
	addi	a3, zero, 60
	bge	a3, a1, .L15
	lui	a1,%hi(FH_TUERMODUL_CTRL__N_old)
	lw	a1,%lo(FH_TUERMODUL_CTRL__N_old)(a1)
	blt	a3, a1, .L15
	lui	a3,%hi(FH_TUERMODUL_CTRL__INREVERS1)
	lui	a1,%hi(FH_TUERMODUL_CTRL__INREVERS2)
	lbu	a3,%lo(FH_TUERMODUL_CTRL__INREVERS1)(a3)
	lbu	a1,%lo(FH_TUERMODUL_CTRL__INREVERS2)(a1)
	or	a3,a3,a1
	bne	a3,zero,.L15
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL__MFHZ_copy)
	lui	a3,%hi(FH_TUERMODUL__MFHA_copy)
	sb	a4,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(stable)(a0)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a1)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a3)
	jal	zero, .L8
.L15:
	lui	a4,%hi(FH_TUERMODUL__BLOCK)
	lbu	a4,%lo(FH_TUERMODUL__BLOCK)(a4)
	bne	a4,zero,.L122
.L16:
	lui	a3,%hi(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)
	lbu	a4,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	addi	a2, zero, 2
	beq	a4,a2,.L18
	addi	a1, zero, 3
	beq	a4,a1,.L19
	addi	a0, zero, 1
	bne	a4,a0,.L20
	lui	a0,%hi(FH_TUERMODUL__POSITION)
	lw	a6,%lo(FH_TUERMODUL__POSITION)(a0)
	addi	a0, zero, 404
	bge	a0, a6, .L21
	lui	a2,%hi(stable)
	lui	a4,%hi(FH_TUERMODUL__MFHA_copy)
	sb	a1,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a4)
	jal	zero, .L8
.L121:
	lui	a4,%hi(step)
	lbu	a4,%lo(step)(a4)
	beq	a4,a2,.L123
	lui	a4,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	lbu	a3,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a4)
	beq	a3,a2,.L47
.L49:
	addi	a3, zero, 1
	sb	a3,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a4)
	lbu	a3,4(a5)
	lbu	a4,6(a5)
	lui	a2,%hi(stable)
	sb	zero,%lo(stable)(a2)
	sb	a3,5(a5)
	sb	a4,7(a5)
	jalr	zero, ra, 0
.L4:
	lui	a4,%hi(FH_TUERMODUL__BLOCK)
	lbu	a4,%lo(FH_TUERMODUL__BLOCK)(a4)
	beq	a4,zero,.L10
	lui	a4,%hi(FH_TUERMODUL__BLOCK_old)
	lbu	a4,%lo(FH_TUERMODUL__BLOCK_old)(a4)
	bne	a4,zero,.L10
	lui	a4,%hi(FH_TUERMODUL__MFHZ)
	lbu	a4,%lo(FH_TUERMODUL__MFHZ)(a4)
	beq	a4,zero,.L10
	lui	a4,%hi(time)
	lw	a7,%lo(time)(a4)
	lui	a6,%hi(sc_FH_TUERMODUL_CTRL_2329_1)
	addi	a4, zero, 3
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL__MFHZ_copy)
	lui	a3,%hi(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)
	sw	a7,%lo(sc_FH_TUERMODUL_CTRL_2329_1)(a6)
	sb	zero,%lo(stable)(a0)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a1)
	sb	a4,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a4,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	jal	zero, .L8
.L10:
	lui	a3,%hi(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)
	lbu	a4,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	addi	a2, zero, 2
	beq	a4,a2,.L11
	addi	a1, zero, 3
	beq	a4,a1,.L12
	addi	a2, zero, 1
	bne	a4,a2,.L13
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	bne	a4,zero,.L8
	lui	a2,%hi(stable)
	lui	a4,%hi(FH_TUERMODUL__MFHZ_copy)
	sb	a1,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a4)
	jal	zero, .L8
.L6:
	lui	a4,%hi(stable)
	sb	a1,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(stable)(a4)
	jal	zero, .L8
.L122:
	lui	a4,%hi(FH_TUERMODUL__BLOCK_old)
	lbu	a4,%lo(FH_TUERMODUL__BLOCK_old)(a4)
	bne	a4,zero,.L16
	lui	a4,%hi(FH_TUERMODUL__MFHA)
	lbu	a4,%lo(FH_TUERMODUL__MFHA)(a4)
	beq	a4,zero,.L17
	lui	a4,%hi(time)
	lw	t1,%lo(time)(a4)
	lui	a7,%hi(sc_FH_TUERMODUL_CTRL_2375_2)
	lui	a6,%hi(stable)
	lui	a0,%hi(FH_TUERMODUL__MFHA_copy)
	addi	a1, zero, 2
	lui	a4,%hi(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)
	addi	a3, zero, 3
	sw	t1,%lo(sc_FH_TUERMODUL_CTRL_2375_2)(a7)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a0)
	sb	a1,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a3,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a4)
	jal	zero, .L8
.L120:
	lui	a3,%hi(FH_TUERMODUL_CTRL__N_old)
	lw	a3,%lo(FH_TUERMODUL_CTRL__N_old)(a3)
	beq	a3,a4,.L8
	lui	a3,%hi(stable)
	lui	a4,%hi(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)
	sb	a0,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(stable)(a3)
	sb	a0,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a4)
	jal	zero, .L8
.L11:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	bne	a4,zero,.L8
	lui	a1,%hi(stable)
	lui	a2,%hi(FH_TUERMODUL__MFHA_copy)
	addi	a4, zero, 3
	sb	zero,%lo(stable)(a1)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a2)
	sb	a4,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	jal	zero, .L8
.L17:
	lui	a4,%hi(FH_TUERMODUL__MFHZ)
	lbu	a4,%lo(FH_TUERMODUL__MFHZ)(a4)
	beq	a4,zero,.L16
	lui	a4,%hi(time)
	lw	t1,%lo(time)(a4)
	lui	a7,%hi(sc_FH_TUERMODUL_CTRL_2352_1)
	lui	a6,%hi(stable)
	lui	a0,%hi(FH_TUERMODUL__MFHZ_copy)
	addi	a1, zero, 2
	lui	a4,%hi(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)
	addi	a3, zero, 3
	sw	t1,%lo(sc_FH_TUERMODUL_CTRL_2352_1)(a7)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a0)
	sb	a1,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a3,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a4)
	jal	zero, .L8
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
	addi	a2, zero, 1
	bne	a3,a2,.L49
	lui	a2,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)
	lw	a2,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)(a2)
	beq	a2,zero,.L47
	lui	a1,%hi(time)
	lw	a1,%lo(time)(a1)
	addi	a1,a1,-3
	bne	a1,a2,.L47
	lui	a2,%hi(FH_TUERMODUL__MFHZ)
	lui	a1,%hi(FH_TUERMODUL__MFHA)
	lbu	a2,%lo(FH_TUERMODUL__MFHZ)(a2)
	lbu	a1,%lo(FH_TUERMODUL__MFHA)(a1)
	or	a2,a2,a1
	bne	a2,zero,.L47
	lui	a1,%hi(FH_TUERMODUL_CTRL__N)
	lw	a2,%lo(FH_TUERMODUL_CTRL__N)(a1)
	bge	zero, a2, .L47
	addi	a2,a2,-1
	lui	a0,%hi(stable)
	sw	a2,%lo(FH_TUERMODUL_CTRL__N)(a1)
	sb	a3,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a0)
	jal	zero, .L47
.L13:
	lui	a4,%hi(stable)
	sb	a1,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	sb	zero,%lo(stable)(a4)
	jal	zero, .L8
.L12:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	bne	a4,zero,.L125
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	beq	a4,zero,.L8
	lui	a4,%hi(stable)
	sb	zero,%lo(stable)(a4)
	lui	a2,%hi(FH_TUERMODUL__MFHZ_copy)
	addi	a4, zero, 1
	sb	a4,%lo(FH_TUERMODUL__MFHZ_copy)(a2)
	sb	a4,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	jal	zero, .L8
.L20:
	lui	a4,%hi(stable)
	sb	a1,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a4)
	jal	zero, .L8
.L125:
	lui	a0,%hi(stable)
	lui	a4,%hi(FH_TUERMODUL__MFHA_copy)
	addi	a1, zero, 1
	sb	a2,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	sb	zero,%lo(stable)(a0)
	sb	a1,%lo(FH_TUERMODUL__MFHA_copy)(a4)
	jal	zero, .L8
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
	add	a4,a4,a2
	sw	a4,%lo(FH_TUERMODUL_CTRL__N)(a3)
	sb	zero,%lo(stable)(a0)
	sb	a2,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a1)
	jal	zero, .L47
.L19:
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	beq	a4,zero,.L43
	lui	a4,%hi(FH_TUERMODUL__SFHZ_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ_old)(a4)
	bne	a4,zero,.L43
	lui	a4,%hi(FH_TUERMODUL__POSITION)
	lw	a4,%lo(FH_TUERMODUL__POSITION)(a4)
	bge	zero, a4, .L43
	addi	a4, zero, 1
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
	jal	zero, .L8
.L18:
	lui	a2,%hi(FH_TUERMODUL__POSITION)
	lw	a2,%lo(FH_TUERMODUL__POSITION)(a2)
	bge	zero, a2, .L33
	lui	a0,%hi(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lbu	a2,%lo(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a0)
	addi	a1, zero, 1
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
	jal	zero, .L8
.L43:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	beq	a4,zero,.L8
	lui	a4,%hi(FH_TUERMODUL__SFHA_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHA_old)(a4)
	bne	a4,zero,.L8
	lui	a4,%hi(FH_TUERMODUL__POSITION)
	lw	a2,%lo(FH_TUERMODUL__POSITION)(a4)
	addi	a4, zero, 404
	blt	a4, a2, .L8
	lui	a4,%hi(stable)
	sb	zero,%lo(stable)(a4)
	lui	a0,%hi(FH_TUERMODUL__MFHA_copy)
	addi	a4, zero, 1
	lui	a2,%hi(OEFFNEN_FH_TUERMODUL_CTRL_next_state)
	addi	a1, zero, 2
	sb	a4,%lo(FH_TUERMODUL__MFHA_copy)(a0)
	sb	a4,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	sb	a1,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a2)
	jal	zero, .L8
.L33:
	lui	a1,%hi(stable)
	lui	a2,%hi(FH_TUERMODUL__MFHZ_copy)
	addi	a4, zero, 3
	sb	zero,%lo(stable)(a1)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a2)
	sb	a4,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	jal	zero, .L8
.L21:
	lui	a0,%hi(OEFFNEN_FH_TUERMODUL_CTRL_next_state)
	lbu	a1,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a0)
	beq	a1,a4,.L22
	beq	a1,a2,.L23
	lui	a4,%hi(stable)
	sb	a2,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	zero,%lo(stable)(a4)
	jal	zero, .L8
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
	addi	a4, zero, 1
	beq	a3,a4,.L35
	addi	a1, zero, 2
	beq	a3,a1,.L36
	lui	a3,%hi(stable)
	sb	a1,%lo(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a4,17(a5)
	sb	zero,%lo(stable)(a3)
	jal	zero, .L8
.L30:
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	bne	a4,zero,.L38
	lui	a4,%hi(FH_TUERMODUL__SFHZ_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ_old)(a4)
	bne	a4,zero,.L33
.L38:
	lui	a2,%hi(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lbu	a3,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	addi	a4, zero, 1
	beq	a3,a4,.L39
	addi	a1, zero, 2
	beq	a3,a1,.L40
	lui	a0,%hi(stable)
	lui	a3,%hi(FH_TUERMODUL__MFHZ_copy)
	sb	a1,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a4,17(a5)
	sb	zero,%lo(stable)(a0)
	sb	a4,%lo(FH_TUERMODUL__MFHZ_copy)(a3)
	jal	zero, .L8
.L23:
	lui	a2,%hi(FH_TUERMODUL__SFHZ)
	lbu	a2,%lo(FH_TUERMODUL__SFHZ)(a2)
	beq	a2,zero,.L27
	lui	a2,%hi(FH_TUERMODUL__SFHZ_old)
	lbu	a2,%lo(FH_TUERMODUL__SFHZ_old)(a2)
	bne	a2,zero,.L27
	lui	a3,%hi(stable)
	sb	a4,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	zero,%lo(stable)(a3)
	jal	zero, .L8
.L22:
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	beq	a4,zero,.L25
	lui	a4,%hi(FH_TUERMODUL__SFHZ_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ_old)(a4)
	bne	a4,zero,.L25
.L26:
	lui	a1,%hi(stable)
	lui	a2,%hi(FH_TUERMODUL__MFHA_copy)
	addi	a4, zero, 3
	sb	zero,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	zero,%lo(stable)(a1)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a2)
	sb	a4,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	jal	zero, .L8
.L27:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	bne	a4,zero,.L8
	lui	a4,%hi(FH_TUERMODUL__SFHA_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHA_old)(a4)
	bne	a4,zero,.L26
	jal	zero, .L8
.L25:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	beq	a4,zero,.L8
	lui	a4,%hi(FH_TUERMODUL__SFHA_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHA_old)(a4)
	bne	a4,zero,.L8
	jal	zero, .L26
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
	jal	zero, .L8
.L39:
	lbu	a4,22(a5)
	sb	zero,23(a5)
	beq	a4,zero,.L8
	lui	a7,%hi(stable)
	lui	a6,%hi(FH_TUERMODUL_CTRL__INREVERS1_copy)
	addi	a0, zero, 2
	lui	a1,%hi(FH_TUERMODUL__MFHA_copy)
	lui	a4,%hi(FH_TUERMODUL__MFHZ_copy)
	sb	a3,17(a5)
	sb	zero,%lo(stable)(a7)
	sb	zero,%lo(FH_TUERMODUL_CTRL__INREVERS1_copy)(a6)
	sb	a0,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a1)
	sb	a3,%lo(FH_TUERMODUL__MFHZ_copy)(a4)
	jal	zero, .L8
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
	jal	zero, .L8
.L35:
	lbu	a4,22(a5)
	sb	zero,23(a5)
	beq	a4,zero,.L8
	lui	a7,%hi(stable)
	lui	a6,%hi(FH_TUERMODUL__MFHZ_copy)
	lui	a0,%hi(FH_TUERMODUL_CTRL__INREVERS2_copy)
	addi	a1, zero, 2
	lui	a4,%hi(FH_TUERMODUL__MFHA_copy)
	sb	a3,17(a5)
	sb	zero,%lo(stable)(a7)
	sb	a3,%lo(FH_TUERMODUL__MFHZ_copy)(a6)
	sb	zero,%lo(FH_TUERMODUL_CTRL__INREVERS2_copy)(a0)
	sb	a1,%lo(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a4)
	jal	zero, .L8
.L42:
	lui	a3,%hi(FH_TUERMODUL__SFHA)
	lbu	a3,%lo(FH_TUERMODUL__SFHA)(a3)
	beq	a3,zero,.L8
	lui	a3,%hi(FH_TUERMODUL__SFHA_old)
	lbu	a3,%lo(FH_TUERMODUL__SFHA_old)(a3)
	bne	a3,zero,.L8
	lui	a3,%hi(stable)
	sb	a4,%lo(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	zero,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(stable)(a3)
	jal	zero, .L8
	.size	generic_FH_TUERMODUL_CTRL.part.0, .-generic_FH_TUERMODUL_CTRL.part.0
	.align	2
	.globl	rand_beebs
	.type	rand_beebs, @function
rand_beebs:
	lui	a4,%hi(seed)
	lw	a0,%lo(seed)(a4)
	lui	a5, 269413
	addi	a5,a5,-403
	mul	a0,a0,a5
	lui	a5, 3
	addi	a5,a5,57
	add	a0,a0,a5
	slli	a0,a0,1
	srli	a0,a0,1
	sw	a0,%lo(seed)(a4)
	srli	a0,a0,16
	jalr	zero, ra, 0
	.size	rand_beebs, .-rand_beebs
	.align	2
	.globl	srand_beebs
	.type	srand_beebs, @function
srand_beebs:
	lui	a5,%hi(seed)
	sw	a0,%lo(seed)(a5)
	jalr	zero, ra, 0
	.size	srand_beebs, .-srand_beebs
	.align	2
	.globl	init_heap_beebs
	.type	init_heap_beebs, @function
init_heap_beebs:
	add	a1,a0,a1
	lui	a3,%hi(heap_end)
	lui	a4,%hi(heap_ptr)
	lui	a5,%hi(heap_requested)
	sw	a1,%lo(heap_end)(a3)
	sw	a0,%lo(heap_ptr)(a4)
	sw	zero,%lo(heap_requested)(a5)
	jalr	zero, ra, 0
	.size	init_heap_beebs, .-init_heap_beebs
	.align	2
	.globl	check_heap_beebs
	.type	check_heap_beebs, @function
check_heap_beebs:
	lui	a5,%hi(heap_requested)
	lw	a4,%lo(heap_requested)(a5)
	lui	a5,%hi(heap_end)
	lw	a5,%lo(heap_end)(a5)
	add	a0,a0,a4
	sltu	a0,a5,a0
	xori	a0,a0,1
	jalr	zero, ra, 0
	.size	check_heap_beebs, .-check_heap_beebs
	.align	2
	.globl	malloc_beebs
	.type	malloc_beebs, @function
malloc_beebs:
	addi	a5, a0, 0
	beq	a0,zero,.L134
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a1,%lo(heap_requested)(a3)
	add	a4,a0,a5
	andi	a6,a4,3
	add	a5,a5,a1
	bne	a6,zero,.L138
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a1,a4,.L134
.L139:
	sw	a4,%lo(heap_ptr)(a2)
	jalr	zero, ra, 0
.L138:
	addi	a1, zero, 4
	sub	a1,a1,a6
	add	a5,a5,a1
	add	a4,a4,a1
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a1,a4,.L139
.L134:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	malloc_beebs, .-malloc_beebs
	.align	2
	.globl	calloc_beebs
	.type	calloc_beebs, @function
calloc_beebs:
	mul	a1,a0,a1
	beq	a1,zero,.L141
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a0,a1
	andi	a6,a4,3
	add	a5,a1,a5
	bne	a6,zero,.L166
.L142:
	lui	a6,%hi(heap_end)
	lw	a6,%lo(heap_end)(a6)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a6,a4,.L141
	sw	a4,%lo(heap_ptr)(a2)
	beq	a0,zero,.L141
	addi	a5,a1,-1
	addi	a4, zero, 5
	bgeu	a4, a5, .L150
	sub	a4, zero, a0
	andi	a5,a4,3
	addi	a3, zero, 0
	beq	a5,zero,.L144
	sb	zero,0(a0)
	andi	a4,a4,2
	addi	a3, zero, 1
	beq	a4,zero,.L144
	sb	zero,1(a0)
	addi	a4, zero, 3
	addi	a3, zero, 2
	bne	a5,a4,.L144
	sb	zero,2(a0)
	addi	a3, a5, 0
.L144:
	sub	a6,a1,a5
	andi	a2,a6,-4
	add	a5,a0,a5
	add	a4,a5,a2
.L146:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L146
	add	a5,a3,a2
	beq	a6,a2,.L140
.L143:
	add	a4,a0,a5
	sb	zero,0(a4)
	addi	a4,a5,1
	bgeu	a4, a1, .L140
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,2
	bgeu	a4, a1, .L140
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,3
	bgeu	a4, a1, .L140
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a4,a5,4
	bgeu	a4, a1, .L140
	add	a4,a0,a4
	sb	zero,0(a4)
	addi	a5,a5,5
	bgeu	a5, a1, .L140
	add	a5,a0,a5
	sb	zero,0(a5)
	jalr	zero, ra, 0
.L141:
	addi	a0, zero, 0
.L140:
	jalr	zero, ra, 0
.L166:
	addi	a7, zero, 4
	sub	a6,a7,a6
	add	a4,a4,a6
	add	a5,a5,a6
	jal	zero, .L142
.L150:
	addi	a5, zero, 0
	jal	zero, .L143
	.size	calloc_beebs, .-calloc_beebs
	.align	2
	.globl	realloc_beebs
	.type	realloc_beebs, @function
realloc_beebs:
	beq	a0,zero,.L168
	beq	a1,zero,.L168
	lui	a6,%hi(heap_ptr)
	lw	a2,%lo(heap_ptr)(a6)
	lui	a3,%hi(heap_requested)
	lw	a5,%lo(heap_requested)(a3)
	add	a4,a2,a1
	andi	a7,a4,3
	add	a5,a1,a5
	bne	a7,zero,.L193
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a7,a4,.L168
.L194:
	sw	a4,%lo(heap_ptr)(a6)
	beq	a2,zero,.L168
	addi	a5,a1,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L178
	or	a3,a0,a2
	andi	a3,a3,3
	addi	a4, a2, 0
	addi	a5, a0, 0
	bne	a3,zero,.L178
	addi	a3,a2,-1
	sub	a3,a3,a0
	sltiu	a3,a3,3
	bne	a3,zero,.L178
	andi	a7,a1,-4
	add	a6,a0,a7
.L171:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L171
	beq	a1,a7,.L167
	lbu	a3,0(a6)
	add	a4,a2,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a1, .L167
	add	a4,a0,a5
	lbu	a4,0(a4)
	add	a5,a2,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a1, .L167
	add	a0,a0,a7
	lbu	a5,0(a0)
	add	a7,a2,a7
	sb	a5,0(a7)
.L167:
	addi	a0, a2, 0
	jalr	zero, ra, 0
.L193:
	addi	t1, zero, 4
	sub	a7,t1,a7
	add	a5,a5,a7
	add	a4,a4,a7
	lui	a7,%hi(heap_end)
	lw	a7,%lo(heap_end)(a7)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a7,a4,.L194
.L168:
	addi	a2, zero, 0
	addi	a0, a2, 0
	jalr	zero, ra, 0
.L178:
	addi	a5, zero, 0
.L175:
	add	a4,a0,a5
	lbu	a3,0(a4)
	add	a4,a2,a5
	addi	a5,a5,1
	sb	a3,0(a4)
	bltu	a5, a1, .L175
	addi	a0, a2, 0
	jalr	zero, ra, 0
	.size	realloc_beebs, .-realloc_beebs
	.align	2
	.globl	free_beebs
	.type	free_beebs, @function
free_beebs:
	jalr	zero, ra, 0
	.size	free_beebs, .-free_beebs
	.align	2
	.globl	memset
	.type	memset, @function
memset:
	beq	a2,zero,.L209
	addi	a5,a2,-1
	addi	a4, zero, 5
	andi	a1,a1,0xff
	bgeu	a4, a5, .L205
	sub	a4, zero, a0
	andi	a5,a4,3
	addi	a6, zero, 0
	beq	a5,zero,.L199
	sb	a1,0(a0)
	andi	a4,a4,2
	addi	a6, zero, 1
	beq	a4,zero,.L199
	sb	a1,1(a0)
	addi	a4, zero, 3
	addi	a6, zero, 2
	bne	a5,a4,.L199
	sb	a1,2(a0)
	addi	a6, a5, 0
.L199:
	slli	a4,a1,8
	slli	a3,a1,16
	sub	t1,a2,a5
	or	a4,a1,a4
	or	a4,a4,a3
	add	a5,a0,a5
	slli	a3,a1,24
	andi	a7,t1,-4
	or	a4,a4,a3
	add	a3,a5,a7
.L201:
	sw	a4,0(a5)
	addi	a5,a5,4
	bne	a5,a3,.L201
	add	a5,a6,a7
	beq	t1,a7,.L209
.L198:
	add	a4,a0,a5
	sb	a1,0(a4)
	addi	a4,a5,1
	bgeu	a4, a2, .L209
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,2
	bgeu	a4, a2, .L209
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,3
	bgeu	a4, a2, .L209
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a4,a5,4
	bgeu	a4, a2, .L209
	add	a4,a0,a4
	sb	a1,0(a4)
	addi	a5,a5,5
	bgeu	a5, a2, .L209
	add	a5,a0,a5
	sb	a1,0(a5)
.L209:
	jalr	zero, ra, 0
.L205:
	addi	a5, zero, 0
	jal	zero, .L198
	.size	memset, .-memset
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	beq	a2,zero,.L214
	addi	a5,a2,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L215
	or	a3,a0,a1
	andi	a3,a3,3
	addi	a4, a0, 0
	addi	a5, a1, 0
	bne	a3,zero,.L215
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L215
	andi	a7,a2,-4
	add	a6,a1,a7
.L216:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L216
	beq	a2,a7,.L214
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a2, .L214
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a2, .L214
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	jalr	zero, ra, 0
.L215:
	add	a2,a1,a2
	addi	a5, a0, 0
.L218:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L218
.L214:
	jalr	zero, ra, 0
	.size	memcpy, .-memcpy
	.align	2
	.globl	memcmp
	.type	memcmp, @function
memcmp:
	beq	a2,zero,.L235
	add	a2,a0,a2
	jal	zero, .L234
.L233:
	beq	a0,a2,.L235
.L234:
	lbu	a5,0(a0)
	lbu	a4,0(a1)
	addi	a0,a0,1
	addi	a1,a1,1
	beq	a5,a4,.L233
	sub	a0,a5,a4
	jalr	zero, ra, 0
.L235:
	addi	a0, zero, 0
	jalr	zero, ra, 0
	.size	memcmp, .-memcmp
	.align	2
	.globl	memmove
	.type	memmove, @function
memmove:
	bgeu	a0,a1,.L238
	beq	a2,zero,.L239
	addi	a5,a2,-1
	addi	a4, zero, 6
	bgeu	a4, a5, .L240
	or	a3,a1,a0
	andi	a3,a3,3
	addi	a4, a0, 0
	addi	a5, a1, 0
	bne	a3,zero,.L240
	sub	a3,a0,a1
	addi	a3,a3,-1
	sltiu	a3,a3,3
	bne	a3,zero,.L240
	andi	a7,a2,-4
	add	a6,a1,a7
.L241:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a6,a5,.L241
	beq	a2,a7,.L239
	lbu	a3,0(a6)
	add	a4,a0,a7
	addi	a5,a7,1
	sb	a3,0(a4)
	bgeu	a5, a2, .L239
	add	a4,a1,a5
	lbu	a4,0(a4)
	add	a5,a0,a5
	addi	a7,a7,2
	sb	a4,0(a5)
	bgeu	a7, a2, .L239
	add	a1,a1,a7
	lbu	a5,0(a1)
	add	a7,a0,a7
	sb	a5,0(a7)
	jalr	zero, ra, 0
.L238:
	bltu	a1, a0, .L261
.L239:
	jalr	zero, ra, 0
.L261:
	beq	a2,zero,.L239
	addi	a2,a2,-1
	add	a5,a1,a2
	lbu	a4,0(a5)
	add	a5,a0,a2
	sb	a4,0(a5)
	jal	zero, .L261
.L240:
	add	a2,a1,a2
	addi	a5, a0, 0
.L243:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L243
	jalr	zero, ra, 0
	.size	memmove, .-memmove
	.align	2
	.globl	strlen
	.type	strlen, @function
strlen:
	lbu	a5,0(a0)
	beq	a5,zero,.L262
	addi	a5, zero, 0
.L264:
	addi	a5,a5,1
	add	a4,a0,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L264
.L262:
	addi	a0, a5, 0
	jalr	zero, ra, 0
	.size	strlen, .-strlen
	.align	2
	.globl	strchr
	.type	strchr, @function
strchr:
	lbu	a5,0(a0)
	beq	a5,zero,.L268
	andi	a4,a1,0xff
.L270:
	beq	a4,a5,.L267
	lbu	a5,1(a0)
	addi	a0,a0,1
	bne	a5,zero,.L270
.L268:
	sltiu	a1, a1, 1
	sub	a1, zero, a1
	and	a0,a0,a1
.L267:
	jalr	zero, ra, 0
	.size	strchr, .-strchr
	.align	2
	.globl	initialise_board
	.type	initialise_board, @function
initialise_board:
 #APP
# 15 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	addi	a0, zero, 0
# 0 "" 2
 #NO_APP
	jalr	zero, ra, 0
	.size	initialise_board, .-initialise_board
	.align	2
	.globl	start_trigger
	.type	start_trigger, @function
start_trigger:
 #APP
# 21 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	addi	a0, zero, 0
# 0 "" 2
 #NO_APP
	jalr	zero, ra, 0
	.size	start_trigger, .-start_trigger
	.align	2
	.globl	stop_trigger
	.type	stop_trigger, @function
stop_trigger:
 #APP
# 27 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	addi	a0, zero, 0
# 0 "" 2
 #NO_APP
	jalr	zero, ra, 0
	.size	stop_trigger, .-stop_trigger
	.align	2
	.globl	interface
	.type	interface, @function
interface:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lbu	a4,4(a5)
	bne	a4,zero,.L279
	lbu	a4,6(a5)
	bne	a4,zero,.L307
.L280:
	lui	a3,%hi(sc_FH_TUERMODUL_CTRL_2375_2)
	lw	a4,%lo(sc_FH_TUERMODUL_CTRL_2375_2)(a3)
	beq	a4,zero,.L282
	lui	a2,%hi(time)
	lw	a2,%lo(time)(a2)
	beq	a4,a2,.L282
	lui	a4,%hi(FH_TUERMODUL__MFHA_copy)
	sw	zero,%lo(sc_FH_TUERMODUL_CTRL_2375_2)(a3)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a4)
.L282:
	lui	a3,%hi(sc_FH_TUERMODUL_CTRL_2352_1)
	lw	a4,%lo(sc_FH_TUERMODUL_CTRL_2352_1)(a3)
	beq	a4,zero,.L283
	lui	a2,%hi(time)
	lw	a2,%lo(time)(a2)
	beq	a4,a2,.L283
	lui	a4,%hi(FH_TUERMODUL__MFHZ_copy)
	sw	zero,%lo(sc_FH_TUERMODUL_CTRL_2352_1)(a3)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a4)
.L283:
	lui	a3,%hi(sc_FH_TUERMODUL_CTRL_2329_1)
	lw	a4,%lo(sc_FH_TUERMODUL_CTRL_2329_1)(a3)
	beq	a4,zero,.L284
	lui	a2,%hi(time)
	lw	a2,%lo(time)(a2)
	beq	a4,a2,.L284
	lui	a4,%hi(FH_TUERMODUL__MFHZ_copy)
	sw	zero,%lo(sc_FH_TUERMODUL_CTRL_2329_1)(a3)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a4)
.L284:
	lui	a3,%hi(sc_FH_TUERMODUL_CTRL_1781_10)
	lw	a4,%lo(sc_FH_TUERMODUL_CTRL_1781_10)(a3)
	beq	a4,zero,.L285
	lui	a2,%hi(time)
	lw	a2,%lo(time)(a2)
	beq	a4,a2,.L285
	sw	zero,%lo(sc_FH_TUERMODUL_CTRL_1781_10)(a3)
.L285:
	lui	a3,%hi(sc_FH_TUERMODUL_CTRL_1739_10)
	lw	a4,%lo(sc_FH_TUERMODUL_CTRL_1739_10)(a3)
	beq	a4,zero,.L286
	lui	a2,%hi(time)
	lw	a2,%lo(time)(a2)
	beq	a4,a2,.L286
	sw	zero,%lo(sc_FH_TUERMODUL_CTRL_1739_10)(a3)
.L286:
	lbu	a5,0(a5)
	bne	a5,zero,.L287
	lui	a4,%hi(BLOCK_ERKENNUNG_CTRL__N)
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL__N_old)
	lw	a4,%lo(BLOCK_ERKENNUNG_CTRL__N)(a4)
	lw	a5,%lo(BLOCK_ERKENNUNG_CTRL__N_old)(a5)
	beq	a4,a5,.L278
.L287:
	lui	a5,%hi(time)
	lw	a4,%lo(time)(a5)
	lui	a5,%hi(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)
	sw	a4,%lo(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)(a5)
.L278:
	jalr	zero, ra, 0
.L279:
	lui	a4,%hi(time)
	lw	a4,%lo(time)(a4)
	lui	a3,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)
	sw	a4,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)(a3)
.L281:
	lui	a3,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)
	sw	a4,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)(a3)
	jal	zero, .L280
.L307:
	lui	a4,%hi(time)
	lw	a4,%lo(time)(a4)
	jal	zero, .L281
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
	jalr	zero, ra, 0
	.size	init, .-init
	.align	2
	.globl	generic_KINDERSICHERUNG_CTRL
	.type	generic_KINDERSICHERUNG_CTRL, @function
generic_KINDERSICHERUNG_CTRL:
	lui	a5,%hi(.LANCHOR0+10)
	lbu	a5,%lo(.LANCHOR0+10)(a5)
	beq	a5,zero,.L309
	lui	a4,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	lbu	a5,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	addi	a3, zero, 2
	beq	a5,a3,.L311
	addi	a2, zero, 3
	beq	a5,a2,.L312
	addi	a3, zero, 1
	bne	a5,a3,.L313
	lui	a3,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lbu	a3,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(a3)
	bne	a3,zero,.L314
	lui	a3,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lbu	a3,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(a3)
	beq	a3,zero,.L380
	lui	a4,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	lbu	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	bne	a3,a5,.L317
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL_old)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL_old)(a5)
	bne	a5,zero,.L381
.L338:
	lui	a5,%hi(stable)
	sb	zero,%lo(stable)(a5)
	lui	a3,%hi(FH_TUERMODUL__SFHZ_copy)
	addi	a5, zero, 1
	sb	a5,%lo(FH_TUERMODUL__SFHZ_copy)(a3)
	sb	a5,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	jalr	zero, ra, 0
.L312:
	lui	a5,%hi(FH_TUERMODUL__KL_50)
	lbu	a5,%lo(FH_TUERMODUL__KL_50)(a5)
	beq	a5,zero,.L382
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(a5)
	bne	a5,zero,.L383
.L309:
	jalr	zero, ra, 0
.L313:
	lui	a5,%hi(stable)
	sb	a2,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a5)
	jalr	zero, ra, 0
.L311:
	lui	a5,%hi(FH_TUERMODUL__SFHA_MEC)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_MEC)(a5)
	bne	a5,zero,.L320
	lui	a5,%hi(FH_TUERMODUL__SFHZ_MEC)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_MEC)(a5)
	beq	a5,zero,.L384
	lui	a5,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	lbu	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	addi	a3, zero, 1
	bne	a4,a3,.L317
	lui	a3,%hi(FH_TUERMODUL__SFHZ_MEC_old)
	lbu	a3,%lo(FH_TUERMODUL__SFHZ_MEC_old)(a3)
	bne	a3,zero,.L385
.L340:
	lui	a4,%hi(stable)
	sb	zero,%lo(stable)(a4)
	lui	a3,%hi(FH_TUERMODUL__SFHZ_copy)
	addi	a4, zero, 1
	sb	a4,%lo(FH_TUERMODUL__SFHZ_copy)(a3)
	sb	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	jalr	zero, ra, 0
.L314:
	lui	a4,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	lbu	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	beq	a3,a5,.L386
.L317:
	lui	a5,%hi(stable)
	sb	zero,%lo(stable)(a5)
	jalr	zero, ra, 0
.L320:
	lui	a5,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	lbu	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	addi	a3, zero, 1
	bne	a4,a3,.L317
	lui	a3,%hi(FH_TUERMODUL__SFHA_MEC_old)
	lbu	a3,%lo(FH_TUERMODUL__SFHA_MEC_old)(a3)
	bne	a3,zero,.L323
	lui	a2,%hi(stable)
	lui	a3,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	sb	zero,%lo(stable)(a2)
	sb	a4,%lo(FH_TUERMODUL__SFHA_copy)(a3)
	jalr	zero, ra, 0
.L382:
	lui	a5,%hi(FH_TUERMODUL__SFHZ_MEC)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_MEC)(a5)
	lui	a2,%hi(FH_TUERMODUL__SFHA_MEC)
	lbu	a2,%lo(FH_TUERMODUL__SFHA_MEC)(a2)
	beq	a5,zero,.L325
	bne	a2,zero,.L387
	lui	a1,%hi(stable)
	lui	a5,%hi(FH_TUERMODUL__SFHZ_copy)
	addi	a2, zero, 1
	sb	a3,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a1)
	sb	a2,%lo(FH_TUERMODUL__SFHZ_copy)(a5)
	jalr	zero, ra, 0
.L384:
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL__SFHZ_copy)
	lui	a2,%hi(FH_TUERMODUL__SFHA_copy)
	addi	a3, zero, 3
	lui	a5,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	sb	zero,%lo(stable)(a0)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(a1)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(a2)
	sb	a3,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	jalr	zero, ra, 0
.L380:
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL__SFHZ_copy)
	lui	a3,%hi(FH_TUERMODUL__SFHA_copy)
	lui	a5,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	sb	a2,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a0)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(a1)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(a3)
	sb	zero,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a5)
	jalr	zero, ra, 0
.L325:
	beq	a2,zero,.L388
	lui	a1,%hi(stable)
	lui	a5,%hi(FH_TUERMODUL__SFHA_copy)
	addi	a2, zero, 1
	sb	a3,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a1)
	sb	a2,%lo(FH_TUERMODUL__SFHA_copy)(a5)
	jalr	zero, ra, 0
.L383:
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(a5)
	bne	a5,zero,.L335
	jalr	zero, ra, 0
.L386:
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL_old)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL_old)(a5)
	bne	a5,zero,.L319
	lui	a2,%hi(stable)
	lui	a5,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a2)
	sb	a3,%lo(FH_TUERMODUL__SFHA_copy)(a5)
	jalr	zero, ra, 0
.L335:
	lui	a5,%hi(stable)
	sb	zero,%lo(stable)(a5)
	lui	a2,%hi(FH_TUERMODUL__SFHA_copy)
	addi	a5, zero, 1
	lui	a3,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	a5,%lo(FH_TUERMODUL__SFHA_copy)(a2)
	sb	a5,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	a5,%lo(FH_TUERMODUL__SFHZ_copy)(a3)
	jalr	zero, ra, 0
.L387:
	addi	a5, zero, 1
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL__SFHZ_copy)
	lui	a2,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a3,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a0)
	sb	a5,%lo(FH_TUERMODUL__SFHZ_copy)(a1)
	sb	a5,%lo(FH_TUERMODUL__SFHA_copy)(a2)
	jalr	zero, ra, 0
.L388:
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(a5)
	bne	a5,zero,.L327
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(a5)
	bne	a5,zero,.L328
	jalr	zero, ra, 0
.L327:
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(a5)
	bne	a5,zero,.L335
	lui	a5,%hi(stable)
	sb	zero,%lo(stable)(a5)
	lui	a3,%hi(FH_TUERMODUL__SFHZ_copy)
	addi	a5, zero, 1
	sb	a5,%lo(FH_TUERMODUL__SFHZ_copy)(a3)
	sb	a5,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	jalr	zero, ra, 0
.L328:
	lui	a5,%hi(stable)
	sb	zero,%lo(stable)(a5)
	lui	a3,%hi(FH_TUERMODUL__SFHA_copy)
	addi	a5, zero, 1
	sb	a5,%lo(FH_TUERMODUL__SFHA_copy)(a3)
	sb	a5,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	jalr	zero, ra, 0
.L323:
	lui	a3,%hi(FH_TUERMODUL__SFHZ_MEC)
	lbu	a3,%lo(FH_TUERMODUL__SFHZ_MEC)(a3)
	bne	a3,zero,.L389
	lui	a3,%hi(FH_TUERMODUL__SFHZ_MEC_old)
	lbu	a3,%lo(FH_TUERMODUL__SFHZ_MEC_old)(a3)
	beq	a3,zero,.L309
	lui	a2,%hi(stable)
	lui	a3,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(a3)
	jalr	zero, ra, 0
.L319:
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(a5)
	bne	a5,zero,.L390
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL_old)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL_old)(a5)
	beq	a5,zero,.L309
	lui	a2,%hi(stable)
	lui	a5,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(a5)
	jalr	zero, ra, 0
.L385:
	lui	a3,%hi(FH_TUERMODUL__SFHA_MEC_old)
	lbu	a3,%lo(FH_TUERMODUL__SFHA_MEC_old)(a3)
	beq	a3,zero,.L309
	lui	a2,%hi(stable)
	lui	a3,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(a3)
	jalr	zero, ra, 0
.L381:
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL_old)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL_old)(a5)
	beq	a5,zero,.L309
	lui	a2,%hi(stable)
	lui	a5,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(a5)
	jalr	zero, ra, 0
.L389:
	lui	a4,%hi(FH_TUERMODUL__SFHZ_MEC_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ_MEC_old)(a4)
	beq	a4,zero,.L340
	jalr	zero, ra, 0
.L390:
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL_old)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL_old)(a5)
	beq	a5,zero,.L338
	jalr	zero, ra, 0
	.size	generic_KINDERSICHERUNG_CTRL, .-generic_KINDERSICHERUNG_CTRL
	.align	2
	.globl	generic_FH_TUERMODUL_CTRL
	.type	generic_FH_TUERMODUL_CTRL, @function
generic_FH_TUERMODUL_CTRL:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lbu	a4,13(a5)
	beq	a4,zero,.L392
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_1:
	auipc	ra, %pcrel_hi(generic_FH_TUERMODUL_CTRL.part.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_1)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
.L392:
	lbu	a4,15(a5)
	beq	a4,zero,.L398
	lbu	a4,14(a5)
	bne	a4,zero,.L398
	sb	zero,4(a5)
	sb	zero,6(a5)
	jalr	zero, ra, 0
.L398:
	jalr	zero, ra, 0
	.size	generic_FH_TUERMODUL_CTRL, .-generic_FH_TUERMODUL_CTRL
	.align	2
	.globl	generic_EINKLEMMSCHUTZ_CTRL
	.type	generic_EINKLEMMSCHUTZ_CTRL, @function
generic_EINKLEMMSCHUTZ_CTRL:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lbu	a4,16(a5)
	beq	a4,zero,.L401
	lui	a3,%hi(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)
	lbu	a4,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a3)
	addi	a2, zero, 1
	beq	a4,a2,.L404
	addi	a1, zero, 2
	bne	a4,a1,.L418
	lui	a4,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV)
	lbu	a4,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV)(a4)
	sb	zero,24(a5)
	bne	a4,zero,.L401
	lui	a5,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV_old)
	lbu	a5,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV_old)(a5)
	beq	a5,zero,.L401
.L418:
	lui	a5,%hi(stable)
	sb	a2,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a5)
.L401:
	jalr	zero, ra, 0
.L404:
	lui	a4,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV)
	lbu	a4,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV)(a4)
	beq	a4,zero,.L401
	lui	a4,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV_old)
	lbu	a4,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV_old)(a4)
	bne	a4,zero,.L401
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	beq	a4,zero,.L408
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	bne	a4,zero,.L401
.L408:
	lui	a1,%hi(stable)
	addi	a2, zero, 1
	addi	a4, zero, 2
	sb	zero,%lo(stable)(a1)
	sb	a2,24(a5)
	sb	a4,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a3)
	jalr	zero, ra, 0
	.size	generic_EINKLEMMSCHUTZ_CTRL, .-generic_EINKLEMMSCHUTZ_CTRL
	.align	2
	.globl	generic_BLOCK_ERKENNUNG_CTRL
	.type	generic_BLOCK_ERKENNUNG_CTRL, @function
generic_BLOCK_ERKENNUNG_CTRL:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lbu	a4,19(a5)
	beq	a4,zero,.L420
	lui	a3,%hi(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)
	lbu	a4,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	addi	a2, zero, 1
	beq	a4,a2,.L421
	addi	a1, zero, 2
	bne	a4,a1,.L444
	lui	a4,%hi(FH_TUERMODUL__MFHA)
	lbu	a4,%lo(FH_TUERMODUL__MFHA)(a4)
	bne	a4,zero,.L427
	lui	a4,%hi(FH_TUERMODUL__MFHA_old)
	lbu	a4,%lo(FH_TUERMODUL__MFHA_old)(a4)
	bne	a4,zero,.L428
.L427:
	lui	a4,%hi(FH_TUERMODUL__MFHZ)
	lbu	a4,%lo(FH_TUERMODUL__MFHZ)(a4)
	bne	a4,zero,.L429
	lui	a4,%hi(FH_TUERMODUL__MFHZ_old)
	lbu	a4,%lo(FH_TUERMODUL__MFHZ_old)(a4)
	bne	a4,zero,.L428
.L429:
	lui	a3,%hi(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)
	lbu	a4,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	addi	a2, zero, 2
	beq	a4,a2,.L430
	addi	a1, zero, 3
	beq	a4,a1,.L431
	addi	a0, zero, 1
	beq	a4,a0,.L419
	lui	a7,%hi(stable)
	lui	a6,%hi(BLOCK_ERKENNUNG_CTRL__N)
	lui	a4,%hi(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)
	sb	a1,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	sb	a0,0(a5)
	sb	zero,%lo(stable)(a7)
	sw	zero,%lo(BLOCK_ERKENNUNG_CTRL__N)(a6)
	sw	a2,%lo(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)(a4)
	jalr	zero, ra, 0
.L420:
	lbu	a4,21(a5)
	beq	a4,zero,.L419
	lbu	a4,20(a5)
	bne	a4,zero,.L419
	sb	zero,0(a5)
	jalr	zero, ra, 0
.L444:
	lui	a5,%hi(stable)
	sb	a2,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a5)
.L419:
	jalr	zero, ra, 0
.L421:
	lui	a2,%hi(FH_TUERMODUL__I_EIN)
	lui	a1,%hi(FH_TUERMODUL__I_EIN_old)
	lw	a2,%lo(FH_TUERMODUL__I_EIN)(a2)
	lw	a1,%lo(FH_TUERMODUL__I_EIN_old)(a1)
	beq	a1,a2,.L419
	bge	zero, a2, .L419
	addi	a2, zero, 2
	lui	t3,%hi(stable)
	lui	t1,%hi(FH_TUERMODUL__BLOCK_copy)
	lui	a7,%hi(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)
	lui	a6,%hi(BLOCK_ERKENNUNG_CTRL__N)
	lui	a1,%hi(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)
	addi	a0, zero, 3
	sb	a4,0(a5)
	sb	zero,%lo(stable)(t3)
	sb	zero,%lo(FH_TUERMODUL__BLOCK_copy)(t1)
	sb	a2,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	sw	a2,%lo(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)(a7)
	sw	zero,%lo(BLOCK_ERKENNUNG_CTRL__N)(a6)
	sb	a0,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a1)
	jalr	zero, ra, 0
.L428:
	lui	a2,%hi(stable)
	addi	a4, zero, 1
	lui	a5,%hi(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)
	sb	zero,%lo(stable)(a2)
	sb	a4,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	sb	zero,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a5)
	jalr	zero, ra, 0
.L431:
	sb	zero,0(a5)
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL__N)
	lw	a5,%lo(BLOCK_ERKENNUNG_CTRL__N)(a5)
	addi	a4, zero, 11
	bne	a5,a4,.L419
	lui	a4,%hi(BLOCK_ERKENNUNG_CTRL__N_old)
	lw	a4,%lo(BLOCK_ERKENNUNG_CTRL__N_old)(a4)
	beq	a4,a5,.L419
	lui	a5,%hi(stable)
	sb	a2,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a5)
	jalr	zero, ra, 0
.L430:
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)
	lw	a5,%lo(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)(a5)
	lui	a4,%hi(FH_TUERMODUL__I_EIN)
	lw	a4,%lo(FH_TUERMODUL__I_EIN)(a4)
	addi	a5,a5,-1
	blt	a4, a5, .L419
	lui	a5,%hi(stable)
	sb	zero,%lo(stable)(a5)
	lui	a4,%hi(FH_TUERMODUL__BLOCK_copy)
	addi	a5, zero, 1
	sb	a5,%lo(FH_TUERMODUL__BLOCK_copy)(a4)
	sb	a5,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	jalr	zero, ra, 0
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
	addi	s1, zero, 1
	sw	s1,%lo(time)(a3)
	lui	a6,%hi(stable)
	addi	a3, zero, 0
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
.L494:
	addi	a3,a3,1
	lui	a7,%hi(step)
	sb	a3,%lo(step)(a7)
	lui	a3,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	lbu	a3,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(a3)
	sb	s1,%lo(stable)(a6)
	addi	a7, zero, 2
	beq	a3,a7,.L446
	addi	a7, zero, 3
	beq	a3,a7,.L447
	bne	a3,s1,.L448
	lbu	a3,%lo(FH_DU__MFHZ)(s2)
	bne	a3,zero,.L449
	lui	a3,%hi(FH_DU__MFHZ_old)
	lbu	a3,%lo(FH_DU__MFHZ_old)(a3)
	beq	a3,zero,.L449
.L448:
	lui	a3,%hi(FH_DU__MFH)
	sw	zero,%lo(FH_DU__MFH)(a3)
	addi	a7, zero, 2
	lui	a3,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	sb	zero,%lo(stable)(a6)
	sb	a7,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(a3)
.L449:
	bne	t5,zero,.L452
	lui	a3,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	addi	a7, zero, 3
	sb	a7,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a3)
.L452:
	bne	t4,zero,.L453
	lui	a3,%hi(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)
	sb	s1,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a3)
.L453:
	bne	t3,zero,.L454
	lui	a3,%hi(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)
	sb	zero,0(s0)
	sb	s1,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
.L454:
	bne	t1,zero,.L455
	lui	a7,%hi(FH_TUERMODUL_CTRL__N)
	lui	a3,%hi(B_FH_TUERMODUL_CTRL_next_state)
	sw	zero,%lo(FH_TUERMODUL_CTRL__N)(a7)
	addi	a7, zero, 2
	sb	a7,%lo(B_FH_TUERMODUL_CTRL_next_state)(a3)
	lui	a3,%hi(A_FH_TUERMODUL_CTRL_next_state)
	sb	s1,%lo(A_FH_TUERMODUL_CTRL_next_state)(a3)
	addi	a3, zero, 256
	sh	a3,4(s0)
	lui	a3,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	sb	zero,6(s0)
	sb	s1,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a3)
.L455:
	sb	s1,11(s0)
	sb	s1,17(s0)
	sb	s1,20(s0)
	sb	s1,14(s0)
	beq	t0,a5,.L561
	lui	a3,%hi(FH_DU__DOOR_ID)
	lbu	a3,%lo(FH_DU__DOOR_ID)(a3)
	bne	a3,zero,.L459
	lui	a3,%hi(FH_DU__S_FH_FTZU)
	sb	a5,%lo(FH_DU__S_FH_FTZU)(a3)
	beq	a2,t6,.L458
.L460:
	beq	a1,a4,.L559
.L500:
	sb	a4,%lo(FH_DU__S_FH_FTAUF)(s4)
.L463:
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
	beq	a0,zero,.L466
	lui	a7,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	lbu	a0,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a7)
	addi	t1, zero, 2
	beq	a0,t1,.L467
	addi	t1, zero, 3
	beq	a0,t1,.L468
	bne	a0,s1,.L469
	lui	a0,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	bne	a4,zero,.L470
	bne	a5,zero,.L471
	lui	t1,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(t1)
	lui	t1,%hi(FH_TUERMODUL__SFHA_copy)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(t1)
	addi	t1, zero, 3
	sb	zero,%lo(stable)(a6)
	sb	t1,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a7)
	sb	zero,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a0)
.L466:
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
	beq	t0,zero,.L492
.Lpcrel_2:
	auipc	ra, %pcrel_hi(generic_FH_TUERMODUL_CTRL.part.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_2)
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
.L492:
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
	auipc	ra, %pcrel_hi(generic_EINKLEMMSCHUTZ_CTRL)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_3)
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
	auipc	ra, %pcrel_hi(generic_BLOCK_ERKENNUNG_CTRL)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_4)
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
	bne	t6,zero,.L445
	lui	a4,%hi(step)
	lbu	a3,%lo(step)(a4)
	addi	t6, a2, 0
	addi	a4, a1, 0
	addi	t2, a0, 0
	addi	t0, a5, 0
	jal	zero, .L494
.L561:
	lui	a5,%hi(FH_DU__S_FH_FTZU)
	lbu	a5,%lo(FH_DU__S_FH_FTZU)(a5)
	beq	a2,t6,.L458
	lui	a3,%hi(FH_DU__DOOR_ID)
	lbu	a3,%lo(FH_DU__DOOR_ID)(a3)
	beq	a3,zero,.L460
.L502:
	lui	a3,%hi(FH_DU__S_FH_TMBFZUCAN)
	sb	t6,%lo(FH_DU__S_FH_TMBFZUCAN)(a3)
.L458:
	beq	a1,a4,.L461
	lui	a3,%hi(FH_DU__DOOR_ID)
	lbu	a3,%lo(FH_DU__DOOR_ID)(a3)
	beq	a3,zero,.L500
.L462:
	beq	a0,t2,.L559
.L499:
	lui	a4,%hi(FH_DU__S_FH_TMBFAUFCAN)
	sb	a0,%lo(FH_DU__S_FH_TMBFAUFCAN)(a4)
.L559:
	lbu	a4,%lo(FH_DU__S_FH_FTAUF)(s4)
	jal	zero, .L463
.L459:
	lui	a5,%hi(FH_DU__S_FH_FTZU)
	lbu	a5,%lo(FH_DU__S_FH_FTZU)(a5)
	bne	a2,t6,.L502
	bne	a1,a4,.L462
.L461:
	lbu	a4,%lo(FH_DU__S_FH_FTAUF)(s4)
	beq	a0,t2,.L463
	lui	a3,%hi(FH_DU__DOOR_ID)
	lbu	a3,%lo(FH_DU__DOOR_ID)(a3)
	bne	a3,zero,.L499
	jal	zero, .L463
.L447:
	lbu	a3,%lo(FH_DU__MFHA)(s3)
	bne	a3,zero,.L449
	lui	a3,%hi(FH_DU__MFHA_old)
	lbu	a3,%lo(FH_DU__MFHA_old)(a3)
	bne	a3,zero,.L448
	jal	zero, .L449
.L446:
	lbu	a3,%lo(FH_DU__MFHZ)(s2)
	beq	a3,zero,.L450
	lui	a3,%hi(FH_DU__MFHZ_old)
	lbu	a3,%lo(FH_DU__MFHZ_old)(a3)
	bne	a3,zero,.L450
	lui	a7,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	addi	a3, zero, -100
	sb	s1,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(a7)
	lui	a7,%hi(FH_DU__MFH)
	sb	zero,%lo(stable)(a6)
	sw	a3,%lo(FH_DU__MFH)(a7)
	jal	zero, .L449
.L450:
	lbu	a3,%lo(FH_DU__MFHA)(s3)
	beq	a3,zero,.L449
	lui	a3,%hi(FH_DU__MFHA_old)
	lbu	a3,%lo(FH_DU__MFHA_old)(a3)
	bne	a3,zero,.L449
	addi	a3, zero, 100
	lui	a7,%hi(FH_DU__MFH)
	sw	a3,%lo(FH_DU__MFH)(a7)
	addi	a3, zero, 3
	lui	a7,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	sb	zero,%lo(stable)(a6)
	sb	a3,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(a7)
	jal	zero, .L449
.L468:
	beq	a1,zero,.L562
	beq	a5,zero,.L466
	beq	a4,zero,.L466
.L490:
	addi	a0, zero, 1
	lui	a7,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a0,%lo(FH_TUERMODUL__SFHA_copy)(a7)
	lui	a7,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	a0,%lo(FH_TUERMODUL__SFHZ_copy)(a7)
	lui	a7,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	sb	zero,%lo(stable)(a6)
	sb	a0,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a7)
	jal	zero, .L466
.L467:
	bne	a3,zero,.L478
	bne	a2,zero,.L479
	lui	a7,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(a7)
	lui	a7,%hi(FH_TUERMODUL__SFHA_copy)
	addi	a0, zero, 3
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(a7)
	lui	a7,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	sb	a0,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a7)
	lui	a0,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	zero, .L466
.L469:
	lui	a0,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	addi	a7, zero, 3
	sb	zero,%lo(stable)(a6)
	sb	a7,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	zero, .L466
.L445:
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
	jalr	zero, ra, 0
.L562:
	bne	a2,zero,.L563
	bne	a3,zero,.L564
	bne	a5,zero,.L488
	beq	a4,zero,.L466
	addi	a0, zero, 1
	lui	a7,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a0,%lo(FH_TUERMODUL__SFHA_copy)(a7)
	lui	a7,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	sb	zero,%lo(stable)(a6)
	sb	a0,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a7)
	jal	zero, .L466
.L470:
	lbu	a7,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a0)
	beq	a7,s1,.L565
.L473:
	sb	zero,%lo(stable)(a6)
	jal	zero, .L466
.L478:
	lui	a0,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	lbu	a7,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a0)
	addi	t1, zero, 1
	bne	a7,t1,.L473
	lui	t1,%hi(FH_TUERMODUL__SFHA_MEC_old)
	lbu	t1,%lo(FH_TUERMODUL__SFHA_MEC_old)(t1)
	bne	t1,zero,.L481
	lui	t1,%hi(FH_TUERMODUL__SFHA_copy)
	sb	zero,%lo(stable)(a6)
	sb	a7,%lo(FH_TUERMODUL__SFHA_copy)(t1)
	sb	a7,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	zero, .L466
.L471:
	lbu	a7,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a0)
	bne	a7,s1,.L473
	lui	a7,%hi(FH_TUERMODUL__SFHZ_ZENTRAL_old)
	lbu	a7,%lo(FH_TUERMODUL__SFHZ_ZENTRAL_old)(a7)
	bne	a7,zero,.L566
.L495:
	addi	a7, zero, 1
	lui	t1,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(stable)(a6)
	sb	a7,%lo(FH_TUERMODUL__SFHZ_copy)(t1)
	sb	a7,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	zero, .L466
.L563:
	lui	a7,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	addi	t1, zero, 2
	addi	a0, zero, 1
	sb	t1,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a7)
	lui	a7,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(stable)(a6)
	sb	a0,%lo(FH_TUERMODUL__SFHZ_copy)(a7)
	beq	a3,zero,.L466
.L560:
	lui	a7,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a0,%lo(FH_TUERMODUL__SFHA_copy)(a7)
	jal	zero, .L466
.L479:
	lui	a0,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	lbu	a7,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a0)
	addi	t1, zero, 1
	bne	a7,t1,.L473
	lui	t1,%hi(FH_TUERMODUL__SFHZ_MEC_old)
	lbu	t1,%lo(FH_TUERMODUL__SFHZ_MEC_old)(t1)
	bne	t1,zero,.L567
.L497:
	addi	a7, zero, 1
	lui	t1,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(stable)(a6)
	sb	a7,%lo(FH_TUERMODUL__SFHZ_copy)(t1)
	sb	a7,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	zero, .L466
.L565:
	lui	a7,%hi(FH_TUERMODUL__SFHA_ZENTRAL_old)
	lbu	a7,%lo(FH_TUERMODUL__SFHA_ZENTRAL_old)(a7)
	bne	a7,zero,.L475
	lui	a7,%hi(FH_TUERMODUL__SFHA_copy)
	sb	zero,%lo(stable)(a6)
	sb	s1,%lo(FH_TUERMODUL__SFHA_copy)(a7)
	sb	s1,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	zero, .L466
.L481:
	lui	t1,%hi(FH_TUERMODUL__SFHZ_MEC_old)
	lbu	t1,%lo(FH_TUERMODUL__SFHZ_MEC_old)(t1)
	bne	a2,zero,.L568
	beq	t1,zero,.L466
	lui	t1,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(t1)
	sb	a7,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	zero, .L466
.L475:
	lui	a7,%hi(FH_TUERMODUL__SFHZ_ZENTRAL_old)
	lbu	a7,%lo(FH_TUERMODUL__SFHZ_ZENTRAL_old)(a7)
	bne	a5,zero,.L569
	beq	a7,zero,.L466
	lui	a7,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(a7)
	sb	s1,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	zero, .L466
.L564:
	lui	a7,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	addi	t1, zero, 2
	addi	a0, zero, 1
	sb	zero,%lo(stable)(a6)
	sb	t1,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a7)
	jal	zero, .L560
.L488:
	bne	a4,zero,.L490
	addi	a0, zero, 1
	lui	a7,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	a0,%lo(FH_TUERMODUL__SFHZ_copy)(a7)
	lui	a7,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	sb	zero,%lo(stable)(a6)
	sb	a0,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a7)
	jal	zero, .L466
.L566:
	lui	a7,%hi(FH_TUERMODUL__SFHA_ZENTRAL_old)
	lbu	a7,%lo(FH_TUERMODUL__SFHA_ZENTRAL_old)(a7)
	beq	a7,zero,.L466
	lui	a7,%hi(FH_TUERMODUL__SFHA_copy)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(a7)
	sb	s1,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	zero, .L466
.L567:
	lui	t1,%hi(FH_TUERMODUL__SFHA_MEC_old)
	lbu	t1,%lo(FH_TUERMODUL__SFHA_MEC_old)(t1)
	beq	t1,zero,.L466
	lui	t1,%hi(FH_TUERMODUL__SFHA_copy)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(t1)
	sb	a7,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a0)
	jal	zero, .L466
.L569:
	bne	a7,zero,.L466
	jal	zero, .L495
.L568:
	bne	t1,zero,.L466
	jal	zero, .L497
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
	addi	s0, zero, 1964
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
.L571:
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
	auipc	ra, %pcrel_hi(interface)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_5)
.Lpcrel_6:
	auipc	ra, %pcrel_hi(FH_DU)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_6)
	bne	s0,zero,.L571
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
	jalr	zero, ra, 0
	.size	benchmark_body.constprop.0.isra.0, .-benchmark_body.constprop.0.isra.0
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	bge	zero, a0, .L579
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
	addi	s0, zero, 0
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
.L576:
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
	auipc	ra, %pcrel_hi(interface)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_7)
.Lpcrel_8:
	auipc	ra, %pcrel_hi(FH_DU)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_8)
	lw	a5,12(sp)
	addi	s0,s0,1
	bne	s0,a5,.L576
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
	jalr	zero, ra, 0
.L579:
	jalr	zero, ra, 0
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.globl	warm_caches
	.type	warm_caches, @function
warm_caches:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_9:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_9)
	lw	ra,12(sp)
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	addi	sp,sp,-16
	sw	ra,12(sp)
.Lpcrel_10:
	auipc	ra, %pcrel_hi(benchmark_body.constprop.0.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_10)
	lw	ra,12(sp)
	addi	a0, zero, 0
	addi	sp,sp,16
	jalr	zero, ra, 0
	.size	benchmark, .-benchmark
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	jalr	zero, ra, 0
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a5,%hi(.LANCHOR0)
	addi	sp,sp,-64
	addi	a4, zero, 256
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
	addi	a4, sp, 0
	jal	zero, .L589
.L602:
	beq	a5,a1,.L601
.L589:
	lbu	a2,0(a5)
	lbu	a3,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	beq	a2,a3,.L602
.L598:
	addi	a0, zero, 0
.L587:
	addi	sp,sp,64
	jalr	zero, ra, 0
.L601:
	lui	a4,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)
	lui	a5,%hi(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)
	lw	a3,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)(a4)
	lw	a5,%lo(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)(a5)
	lui	a4,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)
	lw	a4,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)(a4)
	or	a5,a5,a3
	addi	a0, zero, 0
	or	a5,a5,a4
	bne	a5,zero,.L587
	lui	a5,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	lbu	a4,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a5)
	addi	a5, zero, 3
	bne	a4,a5,.L587
	lui	a5,%hi(B_FH_TUERMODUL_CTRL_next_state)
	lbu	a4,%lo(B_FH_TUERMODUL_CTRL_next_state)(a5)
	addi	a5, zero, 2
	bne	a4,a5,.L587
	lui	a5,%hi(A_FH_TUERMODUL_CTRL_next_state)
	lbu	a3,%lo(A_FH_TUERMODUL_CTRL_next_state)(a5)
	addi	a5, zero, 1
	bne	a3,a5,.L587
	lui	a5,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	lbu	a5,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a5)
	bne	a5,a3,.L587
	lui	a3,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	lbu	a3,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(a3)
	bne	a3,a4,.L587
	lui	a4,%hi(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)
	lbu	a4,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a4)
	bne	a4,a5,.L587
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
	bne	a5,zero,.L598
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)
	lbu	a0,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a5)
	addi	a0,a0,-1
	sltiu	a0, a0, 1
	jal	zero, .L587
	.size	verify_benchmark, .-verify_benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
 #APP
# 15 "/home/soxehli/work/egraph_isa_compiler_codesign/embench-iot/config/riscv32/boards/ri5cyverilator/boardsupport.c" 1
	addi	a0, zero, 0
# 0 "" 2
 #NO_APP
	addi	a0, zero, 1
.Lpcrel_11:
	auipc	ra, %pcrel_hi(benchmark_body.isra.0)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_11)
.Lpcrel_12:
	auipc	ra, %pcrel_hi(start_trigger)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_12)
.Lpcrel_13:
	auipc	ra, %pcrel_hi(benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_13)
	sw	zero,12(sp)
.Lpcrel_14:
	auipc	ra, %pcrel_hi(stop_trigger)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_14)
	lw	a0,12(sp)
.Lpcrel_15:
	auipc	ra, %pcrel_hi(verify_benchmark)
	jalr	ra, ra, %pcrel_lo(.Lpcrel_15)
	lw	ra,28(sp)
	xori	a0,a0,1
	addi	sp,sp,32
	jalr	zero, ra, 0
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
	.type	heap_requested, @object
	.size	heap_requested, 4
heap_requested:
	.zero	4
	.type	heap_end, @object
	.size	heap_end, 4
heap_end:
	.zero	4
	.type	heap_ptr, @object
	.size	heap_ptr, 4
heap_ptr:
	.zero	4
	.type	seed, @object
	.size	seed, 4
seed:
	.zero	4
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits


    .text
    .align 2
__mul:
    add    a2, a0, x0
    addi   a0, x0, 0
.Mul_loop:
    andi   a3, a1, 1
    beq    a3, x0, .Mul_skip
    add    a0, a0, a2
.Mul_skip:
    srli   a1, a1, 1
    slli   a2, a2, 1
    bne    a1, x0, .Mul_loop
    jalr   x0, ra, 0

.text
.align 2

# Signed 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_divsi3
__riscv_div_lib_divsi3:
    blt   a0, zero, __riscv_div_lib_L10      # bltz a0 -> blt a0, zero
    blt   a1, zero, __riscv_div_lib_L11      # bltz a1 -> blt a1, zero
    # Since the quotient is positive, fall into udivsi3

# Unsigned 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_udivsi3
__riscv_div_lib_udivsi3:
    addi  a2, a1, 0                           # mv a2, a1 -> addi a2, a1, 0
    addi  a1, a0, 0                           # mv a1, a0 -> addi a1, a0, 0
    addi  a0, zero, -1                        # li a0, -1 -> addi a0, zero, -1
    beq   a2, zero, __riscv_div_lib_L5       # beqz a2 -> beq a2, zero
    addi  a3, zero, 1                         # li a3, 1 -> addi a3, zero, 1
    bgeu  a2, a1, __riscv_div_lib_L2
__riscv_div_lib_L1:
    bge   zero, a2, __riscv_div_lib_L2       # blez a2 -> bge zero, a2
    slli  a2, a2, 1
    slli  a3, a3, 1
    bltu  a2, a1, __riscv_div_lib_L1         # bgtu a1, a2 -> bltu a2, a1
__riscv_div_lib_L2:
    addi  a0, zero, 0                         # li a0, 0 -> addi a0, zero, 0
__riscv_div_lib_L3:
    bltu  a1, a2, __riscv_div_lib_L4
    sub   a1, a1, a2
    or    a0, a0, a3
__riscv_div_lib_L4:
    srli  a3, a3, 1
    srli  a2, a2, 1
    bne   a3, zero, __riscv_div_lib_L3       # bnez a3 -> bne a3, zero
__riscv_div_lib_L5:
    jalr  zero, ra, 0                         # ret -> jalr zero, ra, 0

# Unsigned 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_umodsi3
__riscv_div_lib_umodsi3:
    # Call udivsi3(a0, a1), then return the remainder, which is in a1
    addi  t0, ra, 0                           # mv t0, ra -> addi t0, ra, 0
    jal   ra, __riscv_div_lib_udivsi3        # jal __riscv_div_lib_udivsi3
    addi  a0, a1, 0                           # mv a0, a1 -> addi a0, a1, 0
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0

# Handle negative arguments to divsi3
__riscv_div_lib_L10:
    sub   a0, zero, a0                        # neg a0, a0 -> sub a0, zero, a0
    # Zero is handled as a negative so that the result will not be inverted
    blt   zero, a1, __riscv_div_lib_L12      # bgtz a1 -> blt zero, a1

    sub   a1, zero, a1                        # neg a1, a1 -> sub a1, zero, a1
    jal   zero, __riscv_div_lib_udivsi3      # j __riscv_div_lib_udivsi3 -> jal zero
__riscv_div_lib_L11:                         # Compute udivsi3(a0, -a1), then negate
    sub   a1, zero, a1                        # neg a1, a1 -> sub a1, zero, a1
__riscv_div_lib_L12:
    addi  t0, ra, 0                           # mv t0, ra -> addi t0, ra, 0
    jal   ra, __riscv_div_lib_udivsi3        # jal __riscv_div_lib_udivsi3
    sub   a0, zero, a0                        # neg a0, a0 -> sub a0, zero, a0
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0

# Signed 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_modsi3
__riscv_div_lib_modsi3:
    addi  t0, ra, 0                           # mv t0, ra -> addi t0, ra, 0
    blt   a1, zero, __riscv_div_lib_L31      # bltz a1 -> blt a1, zero
    blt   a0, zero, __riscv_div_lib_L32      # bltz a0 -> blt a0, zero
__riscv_div_lib_L30:
    jal   ra, __riscv_div_lib_udivsi3        # jal __riscv_div_lib_udivsi3
    addi  a0, a1, 0                           # mv a0, a1 -> addi a0, a1, 0
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0
__riscv_div_lib_L31:
    sub   a1, zero, a1                        # neg a1, a1 -> sub a1, zero, a1
    bge   a0, zero, __riscv_div_lib_L30      # bgez a0 -> bge a0, zero
__riscv_div_lib_L32:
    sub   a0, zero, a0                        # neg a0, a0 -> sub a0, zero, a0
    jal   ra, __riscv_div_lib_udivsi3        # jal __riscv_div_lib_udivsi3
    sub   a0, zero, a1                        # neg a0, a1 -> sub a0, zero, a1
    jalr  zero, t0, 0                         # jr t0 -> jalr zero, t0, 0

# end of subrountine