
#Translate the following into assembly:
#   int a = 6;
#   int b = 7;
#   int c = 3;
#   int d;
#   d = (a+b) * (a+b);

    .data

    .text
    .globl main
main:
    li $t0, 6                #Load each number into t registers
    li $t1, 7
    li $t2, 3

    add $t3 $t0, $t1         #Add $t0 and $t1
    mul $t3 $t3, $t3         #Square $t3

    li $v0, 1                #Print an int
    move $a0, $t4
    syscall
    move $v0, $a0            #Move the result to $v0
    jr $ra
