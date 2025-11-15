addi   sp, sp, -8          
sw     a0, 0(sp)           
sw     a1, 4(sp)           
add    a0, x2, x0          
add    a1, x3, x0          
.Lpcrel_mul:
    auipc  ra, %pcrel_hi(__mul)
    jalr   ra, ra, %pcrel_lo(.Lpcrel_mul)        
add    x1, a0, x0          
lw     a0, 0(sp)           
lw     a1, 4(sp)          
addi   sp, sp, 8   
