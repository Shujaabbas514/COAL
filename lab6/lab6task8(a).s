main:
    li a0, 10
    jal ra, fib
    j exit

fib:
    beq a0, zero, base

    li t0, 0
    li t1, 1
    li t2, 2

loop:
    bgt t2, a0, done
    add t3, t0, t1
    add t0, t1, zero
    add t1, t3, zero
    addi t2, t2, 1
    j loop

done:
    add a0, t1, zero
    ret

base:
    addi a0, zero, 0
    ret

exit:
    addi a1, a0, 0
    li a0, 1
    ecall
    li a0, 10
    ecall