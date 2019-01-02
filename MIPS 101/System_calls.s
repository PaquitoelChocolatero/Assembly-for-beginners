#To either read or print from screen we will need to give specific values to either $v0, $a0 or both depending on the desired operation
#Please read the provided guides for further information
#Let's do what every programmer should know how to do: print 'Hello World'

 .data
message: .asciiz "Hello World"	#Provide the function with something to print in the data section
 .text
 .globl main
main:
	
	li $v0 4					#As shown in the guide load a 4 in $v0 for printing strings
	la $a0 message				#You should load in $a0 the string you want to print
	syscall						#Call the system

	jr $ra
