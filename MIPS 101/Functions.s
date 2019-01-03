#Let's do a simple example so you can see how this works, let's add two numbers and print the result

  .data

  .text
  .globl main

main:

  addu $sp, $sp, -4          #Create empty space in the stack
  sw $ra, ($sp)              #Transfer $ra to stack

  li $a0, 1                  #Load parameters
  li $a1, 2

  jal function               #Go to function

  move $a0, $v0              #Print the result of the function
  li $v0, 1
  syscall

  lw $ra, ($sp)              #Recover $ra
  addu $sp, $sp, 4           #Destroy empty space in stack
  
  jr $ra					 #Exit main

function:

  add $v0 $a0, $a1			 #Save as outcome the result of the operation

  jr $ra					 #Exit the subroutine
