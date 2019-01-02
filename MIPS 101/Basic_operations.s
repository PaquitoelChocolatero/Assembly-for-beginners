#Let's learn how to add up some numbers
#For example: 70 + 37

 .data

 .text
 .globl main
main:

	li $t0, 70               #Load each number into t registers
    li $t1, 37

    add $t0 $t0, $t1         #Add $t0 and $t1 and save the result in $t0

    li $v0, 1                #Select we want to print a number
    move $a0, $t0
    syscall

    move $v0, $a0            #Move the result to $v0

    jr $ra					 #Exit the function

#The rest of operations have different tags such as mul, div or sub
#To square a number you will multiply it by itself
