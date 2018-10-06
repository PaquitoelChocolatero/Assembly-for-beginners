
#  (70 - 37)^2

    .data

    .text
    .globl main
main:
    li $t0, 70                #Load each number into t registers
    li $t1, 37

    add $t3 $t0, $t1         #Add $t0 and $t1
    mul $t3 $t3, $t3         #Square $t3

    li $v0, 1                #Print an int
    move $a0, $t4
    syscall
    move $v0, $a0            #Move result to $v0
    jr $ra
