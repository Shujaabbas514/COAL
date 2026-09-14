.data  
tableoftwo: .word 2,4,6,8,10,12,14,16,18,20 
 
.text 
main: 
la t0, tableoftwo 
lw t1, 0(t0) 
lw t2, 4(t0) 
lw t3, 8(t0) 
lw t4, 12(t0) 
lw t5, 16(t0) 
lw t6, 20(t0) 
lw s1, 24(t0) 
lw s2, 28(t0) 
lw s3, 32(t0) 
lw s4, 36(t0) 