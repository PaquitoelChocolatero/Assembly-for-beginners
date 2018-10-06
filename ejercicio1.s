    .data

    .text
    .globl main
main:
    li $t0, 6
    li $t1, 7
    li $t2, 3

    add $t3 $t0, $t1
    mul $t3 $t3, $t3

    li $v0, 1
    move $a0, $t4
    syscall
    move $v0, $a0
    jr $ra
