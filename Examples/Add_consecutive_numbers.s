
# Add between 50 and 230

  .data

  .text
  .globl main

main:
  li $t0 50                 #Meter
  li $t1 0                  #Result

loop:
  addi $t0 $t0, 1           #Increment meter
  add $t1 $t0, $t1          #Add meter to result
  ble $t0, 229 loop          #If less than 99 go back

  li $v0 1                  #Print int
  move $a0 $t1
  syscall
  move $v0, $a0             #Move result to $v0
  jr $ra
