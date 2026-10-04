#int main(int n, int k){
# if (k == 1)
#y=F1(n,k);
# else if (n &gt; k)
#y= F2(n);
# else
#y= F3(n);
#}
#int F1 (int x,int z){
#return (x 2 + z 2 );
#}
#int F2 (int z){
#return (z 3 );
#}
#int F3 (int w){
#return (w+5)
main:
    li a0, 10              # n = 10
    li a1, 20              # k = 20

    li t0, 1
    beq a1, t0, y1        
    blt a0, a1, y3      

y2:
    jal ra, F2           
    j display

y1:
    jal ra, F1             
    j display

y3:
    jal ra, F3            

display:
    addi a1, a0, 0         
    li a0, 1               
    ecall

    li a0, 10              
    ecall


F1:
    mul t0, a0, a0        
    mul t1, a1, a1         
    add a0, t0, t1         
    ret

F2:
    mul t0, a0, a0        
    mul a0, t0, a0         
    ret
F3:
    addi a0, a0, 5        
    ret