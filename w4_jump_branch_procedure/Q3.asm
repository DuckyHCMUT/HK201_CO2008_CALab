.text
.globl main

main:
  # Print string msg1
  li $v0,4 # print_string syscall code = 4
  la $a0, msg1 # load the address of msg1
  syscall
  
  # Get input A from user and save
  li $v0,5 # read_int syscall code = 5
  syscall
  move $t0,$v0
  
  # Initialize registers
  la $t3,arr
  add $t1, $t3, $zero
  add $t4, $zero, $zero
  add $t2, $zero, $zero
  
  # Main loop body
loop:
  beq $t4, 10, exit1 #
  lw $t2, 0($t1)
  beq $t2, $t0, found
  addi $t1, $t1, 4
  addi $t4, $t4, 1
  j loop
  
found:
  li $v0,1
  move $a0, $t4
  syscall
  j exit
  
exit1:
  li $v0,4 # print_string syscall code = 4
  la $a0, msg2 # load the address of msg
  syscall

exit:

.data
arr: .word 1, 12, 0, -3, 99, 48, -17, -9, 20, 15
msg1: .asciiz "Enter input: "
msg2: .asciiz "Input is not found in the array "
