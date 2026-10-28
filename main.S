.data

matrix:
    .word 1, -2, 3, 0, -5, 6
    .word -7, 8, 9, -10, 0, 12
    .word 13, -14, 15, -16, 17, -18
    .word -19, 20, -21, 22, -23, 24
    .word 25, 0, -27, 28, -29, 30

positive:
    .word 0

negative:
    .word 0

.text

main:
    la a2, matrix
    la a3, positive
    la a4, negative

    call process

    la a2, positive
    call print

    la a2, negative
    call print

    call exit

process:
    addi t0, x0, 0
    addi t1, x0, 0
    addi t2, x0, 0

cycle:
    lw t3, 0(a2)
    addi a2, a2, 4

    blt t3, x0, negative_value
    beq t3, x0, next

    addi t0, t0, 1
    j next

negative_value:
    addi t1, t1, 1

next:
    addi t2, t2, 1
    addi t4, x0, 30
    blt t2, t4, cycle

    sw t0, 0(a3)
    sw t1, 0(a4)

    ret

print:
    addi a0, x0, 1
    lw a1, 0(a2)
    ecall
    ret

exit:
    addi a0, x0, 10
    ecall