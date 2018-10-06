
#Read two numbers and decide wether they are multiples or not

  .data                                              #Posible results
    msg_mult: .asciiz "They are multiples"
    msg_no_mult: .asciiz "They are not multiples"

  .text
  .globl main

main:

  li $v0 5                                          #Read first number
  syscall
  move $t0 $v0

  li $v0 5                                          #Read second number
  syscall
  move $t1 $v0

  rem $t2 $t0, $t1                                  #Reminder of the division

  beqz $t2 multiple                                 #If the reminder is 0 the numbers are multiples

  la $a0 msg_no_mult                                #Load desired outcome
  b end

multiple:
  la $a0 msg_mult
  b end

end:
  li $v0 4                                          #Print the result
  syscall

  jr $ra
