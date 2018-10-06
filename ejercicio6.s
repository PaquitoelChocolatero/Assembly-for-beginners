  .data                                 #Posible results
greater: .asciiz " is greater than "
equal: .asciiz   " is equal to "
  .text
  .globl main

main:
  li $v0 5                              #First number
  syscall
  move $t0 $v0

  li $v0 5                              #Second number
  syscall
  move $t1 $v0

  bgt $t0, $t1 first                    #If first is greater
  beq $t0, $t1 equals                   #If they are equal

  li $v0 1                              #If second is greater
  move $a0 $t1
  syscall                               #Print big number
  li $v0 4
  la $a0 greater
  syscall                               #Print string
  li $v0 1
  move $a0 $t0
  syscall                               #Print little number
  b end                                 #Go to end of code

first:
  li $v0 1
  move $a0, $t0
  syscall
  li $v0 4
  la $a0 greater
  syscall
  li $v0 1
  move $a0 $t1
  syscall
  b end

equals:
  li $v0 1
  move $a0 $t0
  syscall
  li $v0 4
  la $a0 equal
  syscall
  li $v0 1
  move $a0 $t1
  syscall
  b end

end:
  jr $ra
