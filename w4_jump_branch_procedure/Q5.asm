.text
.globl main

main:
  li $v0,4 # print_string syscall code = 4
  la $a0, msg1 # load the address of msgsyscall
  syscall
  li $v0, 5 # read_int syscall code = 5
  syscall
  move $a0, $v0 #a0 = input
  jal fact
  j EXIT
  
fact:
  addi $sp, $sp, -8 # adjust stack for 2 items
  sw $ra, 4($sp) # save return address
  sw $a0, 0($sp) # save argument
  slti $t0, $a0, 1 # test for n < 1
  beq $t0, $zero, L1
  addi $v1, $zero, 1 # if so, result is 1
  addi $sp, $sp, 8 # pop 2 items from stack
  jr $ra # and return
  
L1:
  addi $a0, $a0, -1 # else decrement n
  jal fact # recursive call
  lw $a0, 0($sp) # restore original n
  lw $ra, 4($sp) # and return address
  addi $sp, $sp, 8 # pop 2 items from stack
  mul $v1, $a0, $v1 # multiply to get result
  jr $ra # and return
  
EXIT :
  li $v0, 1
  move $a0, $v1
  syscall
  
.data
msg1: .asciiz "Enter input : "
