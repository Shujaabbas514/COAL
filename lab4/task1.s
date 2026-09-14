.data
A: .word 5
B: .word 4

.text
lw t0,A
lw t1,B
add s2,t0,t1
sub s3,t0,t1
mul s4,t0,t1
mul s5,t0,t0
