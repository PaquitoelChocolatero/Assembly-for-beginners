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



f:	# v[i] = n1 + n2 + n3 + n4 + n5 + n6

	#Save the old $fp value
	addu $sp $sp -4
	sw $fp ($sp)
	#Move $fp to the sp position
	move $fp $sp

	#Leave space for the int[4] array
	addu $sp $sp -16

	#Calculate n1 + n2 + n3 + n4 + n5 + n6
	add $t0 $a0 $a1 	#t0 = n1 + n2
	add $t0 $t0 $a2		#t0 = t0 + n3
	add $t0 $t0 $a3		#t0 = t0 + n4
	lw $t1 4($fp)		#Bring n5 from the fp
	add $t0 $t0 $t1		#t0 = t0 + n5
	lw $t1 8($fp)		#Bring n6 from the fp
	add $t0 $t0 $t1		#t0 = t0 +n6

	li $t1  0 	#index for loop
	li $t3  3	#array lenght

	#Copy the array initial direction from fp
	#This is needed because we can't manipulate fp value
	move $t2 $fp
	addi $t2 $t2 -16

loop:   bgt $t1 $t3 end 	# if (index = lenght) jump to end
	sw $t0 ($t2)		# v[i] = t0 (were sum of all nubers it's allocated)
	addi $t2 $t2 4		# t2 + 4 for going to next array element
	addi $t1 $t1 1		# index++
	b loop			# jump to lopp
end:
	lw $v0 -12($fp)		# Return the direction of first elemnt
	lw $fp ($fp)		# Restore the fp value
	addu $sp $sp 20		# Restore the sp position
	jr $ra
