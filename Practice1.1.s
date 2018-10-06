	.data:

	 WordSearch: .byte ‘H’, ‘O’, ‘l’, ‘A’, ‘K’, ‘O’, ‘N’, ‘X’,
	‘a’, ‘g’, ‘h’, ‘k’, ‘k’, ‘m’,‘e’, ‘E’,
	 ‘B’, ‘x’, ‘O’, ‘L’, ‘C’, ‘c’, ‘C’, ‘D’,
	 ‘I’, ‘O’, ‘L’. ‘X’, ‘A, ‘L’, ‘O’, ‘H’,
	‘A’, ‘L’, ‘a’, ‘s’, ‘I’, ‘O’, ‘u’, ‘K’,
	‘L’, ‘B’, ‘B’, ‘Y’, ‘U’, ‘J’, ‘X’, ‘O’,
	‘O’, ‘H’, ‘O’, ‘L’, ‘A, ‘O’, ‘H’, ‘i’,
	‘H’, ‘J’, ‘K’, ‘J’, ‘T’, ‘F’, ‘J’, ‘c’

	 Word: .asciiz “Hola”
	 N: .word 8 																		# dimensión de la sopa de letras

	 .text:

	 la $a0 WordSearch
	 li $a1 N
	 la $a2 Word


 find:
 	lw $t0 ($a0)																		#Load the first first word of the matrix
 	beqz $t0 end																	  #if the word is empty we just end the program

 	jal compare

 	#Compare words

 	addi $a0, $a0, 1																#After comparing words we go for the next one
 	b find


 compare:
 	beq ($a0) ($a2)


end:
	jr $ra
