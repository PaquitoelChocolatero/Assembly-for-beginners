  .data

  .text
  .globl main
main:
  li $t0 0
  li $t1 0
loop:
  addi $t0 $t0, 1
  add $t1 $t0, $t1
  ble $t0, 99 loop

  move $a0 $t1
  li $v0 1
  syscall
  move $v0, $a0
  jr $ra
