  .data                                              #Posible results
    m_m: .asciiz "They are multiples"
    m_nm: .asciiz "They are not multiples"

  .text
  .globl main

main:

  li $v0 5                                          #First number
  syscall
  move $t0 $v0

  li $v0 5                                          #Second number
  syscall
  move $t1 $v0

  rem $t2 $t0, $t1                                  #Reminder of the division

  beqz $t2 multiple                                 #If the reminder is 0 the numbers are multiples

  la $a0 m_nm                                       #Load desired outcome
  b end

multiple:
  la $a0 m_m
  b end

end:
  li $v0 4                                         #Print the result
  syscall

  jr $ra
