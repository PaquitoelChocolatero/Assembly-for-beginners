#A brach is a loop (while, for) in high level languages such as C or Java
#The little twist is that the execution is linear, so bear in mind which branches you want to run
#Let's for example make a program that prints whether a number is even or not

 .data
message_even: .asciiz "The number is even"
message_odd: .asciiz "The number is odd"
 
 .text
 .globl main

main:

	li $t0 5							#Number to be checked

	li $t1, 2
	rem $t2 $t0, $t1                    #If the reminder of 2 is 0 the number is even
	beqz $t2 even						#If the condition is correct the execution will jump to the even tag (ln 27)
	#If the condition was incorrect the execution will continue

	la $a0 message_odd					#Load desired outcome
	b end								#You can also branch without any condition

#If you didn't write the 'b end' line the program would have followed to the even branch which in this case we don't want to because the number was odd
even:

	la $a0 message_even

end:

	li $v0 4                            #Print the result
	syscall

	jr $ra

#Read the guides for more conditionals
