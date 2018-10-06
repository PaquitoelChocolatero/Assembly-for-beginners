
#Add the first 100 numbers

  .data

  .text
  .globl main

main:
  li $t0 0                  #Meter
  li $t1 0                  #Result

loop:
  addi $t0 $t0, 1           #Increment meter
  add $t1 $t0, $t1          #Add meter to result
  ble $t0, 99 loop          #If less than 99 go back

  li $v0 1                  #Print int
  move $a0 $t1
  syscall
  move $v0, $a0             #Move result to $v0
  jr $ra
