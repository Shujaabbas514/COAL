.text
main:
    li a0, 1
    li s0, 2500
    jal ra, procedure

    add t1, s0, a0       # t1 = 2500 + 1003 = 3503

    li a0, 1             # display command
    mv a1, t1            # value to display
    ecall

procedure:
    li t0, 3
    li t1, 1000
    add a0, t0, t1       # a0 = 1003
    jalr zero, ra, 0