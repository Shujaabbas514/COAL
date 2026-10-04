#Write RISC-V assembly code for given C code:
#int main(){
#y=EqSolver(x);
#}
#int EqSolver (int x){
#return (x^3+5x^2+6x);
#}

main:
li a1,10
jal ra,EqSolver
li a0,10
ecall

EqSolver:
addi t0,a1,0 #t0=x
mul t1,t0,t0 #t1=x^2
mul t2,t1,a1 #t2=x^3
li t3,5
li t4,6
mul t1,t3,t1 #t1=5*x^2
mul t0,t0,t4 #t0=6x
add t5,t1,t0
add t5,t2,t5
add a1,t5,zero
ret

