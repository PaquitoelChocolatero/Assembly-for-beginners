# If we call a function, and we need to use the local variables from the main in the function, we use the stack pointer($sp),
# but if we need to use the local variables from the function on the main, then we can use the stack frame($fp), the mechanism is:

# 1. Store the old $fp value into the top of the stack
# 2. Move the $fp to the current $sp position
# 3. Move the $sp, for  leaving space for the data


.text
.globl main

main:

	li $a0 2	
	li $a1 5
	li $a2 8
	li $a3 12
	
	#Push
	addu $sp $sp -8
	li $t0 8
	sw $t0 ($sp)
	li $t0 4
	sw $t0 4($sp)
	jal f
	#Pop

f:	# v[i] = n1 + n2 + n3 + n4 + n5 + n6

	#Save the old $fp value
	addu $sp $sp -4
	sw $fp ($sp)
	#Move $fp to the sp position
	move $fp $sp

	#Leave space for the int[4] array
	addu $sp $sp -16
	
	#Calculate n1 + n2 + n3 + n4 + n5 + n6
	add $t0 $a0 $a1
	add $t0 $t0 $a2
	add $t0 $t0 $a3
	lw $t1 4($fp)
	add $t0 $t0 $t1
	lw $t1 8($fp)
	add $t0 $t0 $t1

	li $t1, 0
	li $t3, 3
	
	move $t2 $fp
	addi $t2 $t2 -16
	li $t3 3

bucle: bgt $t1 $t3 fin
	sw $t0 ($t2)
	addi $t0 $t0 4
	addi $t1 $t1 1
	b bucle
fin:
	lw $v0 -12($fp)
	lw $fp ($fp)
	addu $sp $sp 20
	jr $ra
	
	


