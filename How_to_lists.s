
# Go through a given list and  check if the element is 0
#
# i ----> $t0
# $a0 --> Direction of the first element
# $a1 --> Length of the list

  .data

  .text
  .globl main

main:
  li $t0, 0                                  #Meter to go through the list

loop:
  bge $t0, $a1, end                          #If $t0 is bigger than $a1 go to end
  lw $t1, ($a0)                              #Take each element
  li $t2, 0x7FFFFFFF                         #Charge 01111111...111
  and $t3, $t2, $t1                          #Compare without sign each element with 1's
  bneq $zero, $t3, not_zero                  #If not everything is 0 jump to not_zero
  addi $v0, $v0, 1                           #If everything is 0 add the meter

not_zero:                                    #If not zero increment the meter and move 4 positions forward (each element's size)
  addi $t0, $t0, 1
  addi $a0, $a0, 4
  b loop                                     #Go back to the loop

end:
  jr $ra                                     #End the function
