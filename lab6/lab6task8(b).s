main:
    li a0, 10
    jal ra, fib
    j exit

fib:
    beq a0, zero, base0
    li t0, 1
    beq a0, t0, base1

    addi sp, sp, -12
    sw ra, 8(sp)
    sw a0, 4(sp)

    addi a0, a0, -1
    jal ra, fib
    sw a0, 0(sp)

    lw a0, 4(sp)
    addi a0, a0, -2
    jal ra, fib

    lw t0, 0(sp)
    add a0, a0, t0

    lw ra, 8(sp)
    addi sp, sp, 12
    ret

base0:
    li a0, 0
    ret

base1:
    li a0, 1
    ret

exit:
    addi a1, a0, 0
    li a0, 1
    ecall
    li a0, 10
    ecall