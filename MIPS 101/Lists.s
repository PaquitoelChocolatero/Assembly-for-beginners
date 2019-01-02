# In order to learn how lists work, let's check an example: we are going to go through a given list and  check if the current element is 0
# The agreement of parameters is:
# $a0 --> Direction of the first element
# $a1 --> Length of the list
# These should not be modified

  .data

list: .word 0, 4, 0, 3, 1

  .text
  .globl main

main:

  li $t0, 0                                  #Meter to go through the positions of the list (the one you'd have in high level language)

  la $a0 list
  li $a1 5

  move $t4 $a0								 #Meter to go through the memory positions of the list (the real one)

loop:

  bge $t0, $a1, end                          #If $t0 is bigger than $a1 go to end

  lw $t1, ($t4)                              #Take each element

  li $t2, 0x7FFFFFFF                         #Charge 01111111...111
  and $t3, $t2, $t1                          #Compare without sign each element with 1's
  bneq $zero, $t3, not_zero                  #If not everything is 0 jump to not_zero

  addi $v0, $v0, 1                           #If everything is 0 increment the result

not_zero:									 #If not zero increment the meter and move to the next position

  addi $t0, $t0, 1
  addi $t4, $t4, 4
# Each element inside a list is separated by its size, the size of a word element is 4 bits, so the next one is 4 memory positions ahead

  b loop

end:

  jr $ra                                     #End the function

# Read the guide for more information about data types such as .word or .asciiz
