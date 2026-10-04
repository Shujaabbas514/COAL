#int main(int n, int k){
# if (k == 0)
#y=fun1(n);
# else if (n == k)
#y= fun2(n);
# else
#y= fun3(n);
#}
#int fun1 (int x){
#return (x 2 );
#}
#int fun2 (int z){
#return (z 3 );
#}
#int fun3 (int w){
#return (w+1);
#}
main:
    li a0, 10
    li a1, 0
    beq a1, zero, y1
    beq a0, a1, y2
    jal ra, fun3
    j exit

y1:
    jal ra, fun1
    j exit

y2:
    jal ra, fun2

exit:
    addi a1, a0, 0
    li a0, 1
    ecall
    li a0, 10
    ecall

fun1:
    mul a0, a0, a0
    ret

fun2:
    mul t0, a0, a0
    mul a0, t0, a0
    ret

fun3:
    addi a0, a0, 1
    ret