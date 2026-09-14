.data 
array: .word 10, 20, 30 
 
.text 
main: 
    la a0, array 
    li a1, 3 
     jal ra, arraysum 
 j done 
    # When we get here, a0 should be 60 
arraysum: 
    # a0 = int a[] 
    # a1 = int size 
    # t0 = ret 
    # t1 = i 
    li    t0, 0 # ret = 0 
    li    t1, 0 # i = 0 
loop: # For loop 
    bge   t1, a1, finish # if i >= size, break 
    slli  t2, t1, 2 # Multiply i by 4 (1 << 2 = 4) 
    add   t2, a0, t2 # Update memory address 
    lw    t2, 0(t2) # Dereference address to get integer 
    add   t0, t0, t2 # Add integer value to ret 
    addi  t1, t1, 1 # Increment the iterator 
    j     loop # Jump back to start of loop (1 backwards) 
finish: 
    mv    a0, t0 # Move t0 (ret) into a0 
    ret # Return via return address register 
done: 
    mv a1, a0 
    li a0, 1 
    ecall