# Original instruction: div a5, a3, a4  (signed division: a5 = a3 / a4)
    addi  sp, sp, -24        # Allocate stack space
    sw    ra, 20(sp)         # Save return address
    sw    a0, 16(sp)         # Save a0 (clobbered by subroutine)
    sw    a1, 12(sp)         # Save a1 (clobbered by subroutine)
    sw    a2, 8(sp)          # Save a2 (clobbered internally)
    sw    a3, 4(sp)          # Save a3 (clobbered internally)

    mv    a0, a3             # Move dividend to a0
    mv    a1, a4             # Move divisor to a1
    jal   __riscv_div_lib_divsi3  # Call signed division subroutine
    mv    a5, a0             # Move result to destination register

    lw    a3, 4(sp)          # Restore a3
    lw    a2, 8(sp)          # Restore a2
    lw    a1, 12(sp)         # Restore a1
    lw    a0, 16(sp)         # Restore a0
    lw    ra, 20(sp)         # Restore return address
    addi  sp, sp, 24         # Deallocate stack space