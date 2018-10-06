  .data                                #Posible results
m_e: .asciiz "The number is even"
m_ne: .asciiz "The number is odd"

  .text
  .globl main

main:

  li $v0 5                             #First number
  syscall
  move $t0 $v0

  li $t1, 2

  rem $t2 $t0, $t1                     #Reminder of the division

  beqz $t2 even                        #If the reminder is 0 the number is even

  la $a0 m_ne                          #Load desired outcome
  b end

even:
  la $a0 m_e
  b end

end:
  li $v0 4                             #Print the result
  syscall

  jr $ra
