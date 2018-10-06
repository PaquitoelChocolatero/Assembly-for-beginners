  .data
.globl main

  .text

main:
  li $v0 5
  syscall
  move $t0, $v0           #Set the number of inputs
  li $t1 1
loop:
  li $v0 5
  syscall
  addu $sp $sp, -4
  sw $v0 ($sp)
  addi $t1 $t1, 1

  lw $t2 ($sp)
  addu $sp $sp 4
  mul $t2 $t2, $t2
  add $t3 $t3, $t2

  ble $t1, $t0, loop

  li $v0 1
  move $a0 $t3
  syscall

jr $ra
