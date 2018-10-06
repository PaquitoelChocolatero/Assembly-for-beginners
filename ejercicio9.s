  .data

  .text
  .globl main

main:

  li $v0 5              #Scan number of elements
  syscall

  move $t0, $v0         #Save the previous number
  li $t1, 1             #Meter
scan:
  li $v0 5              #Scan a number
  syscall

  mul $v0 $v0, $v0      #Squared the previous number
  add $t2 $t2, $v0      #Add the result to the solution
  addi $t1 $t1, 1       #Increment the meter

  ble $t1, $t0 scan     #If the meter is lower than the first number go back

  move $a0, $t2         #Print the solution
  li $v0, 1
  syscall

  jr $ra
