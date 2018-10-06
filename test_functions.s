  .data

  .text
  .globl main

main:
  li $a0, 1                  #Load data
  li $a1, 2

  addu $sp, $sp, -4          #Create empty space in pile
  sw $ra, ($sp)              #Transfer $ra to pile

  jal function               #Go to function

  lw $ra, ($sp)              #Recover $ra
  addu $sp, $sp, 4           #Destroy empty space in pile

  move $a0, $v0              #Get result of function and print it
  li $v0, 1
  syscall

  jr $ra

function:
  add $v0 $a0, $a1
  jr $ra
