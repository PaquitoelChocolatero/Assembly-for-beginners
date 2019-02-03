
# Add between 50 and 230

  .data

  .text
  .globl main

main:
  li $t0 50                  #Meter
  li $v0 0                   #Result

loop:
  addi $t0 1          		 #Increment meter
  add $v0 $t0 $v0            #Add meter to result
  ble $t0, 229 loop          #If less than 229 go back

  move $a0 $v0
  li $v0 1                   #Print int
  syscall
  move $v0 $a0               #Move result to $v0
  jr $ra
