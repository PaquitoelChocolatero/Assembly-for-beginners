
#Function that recives two numbers, adds them and returns the result
#
#Parameters go to $a0...$a3 (except doubles, who go to $f12...$f15)
#Returns go to $v0...$v2
#Do not change $s, $fp registers
#Registers $ra, $t are overwritten each time you jump to a new function
#Pile is used to save overwritten registers: $sp is the top of the pile, lower it to create space,
# add the desired register and then leave it as it was in the beginning

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
