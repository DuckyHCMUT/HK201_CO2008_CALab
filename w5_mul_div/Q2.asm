.text
.globl main

main:
  # Print out msg1
  li $v0, 4
  la $a0, msg1
  syscall
  
  #Read input and save to
  li $v0, 5
  syscall
  move $t0, $v0
  
  #Initialize register 
  addi $t1, $zero, 0 #Counter for log 2
  addi $t2, $zero, 0 #int ret = 0;
  
loop :
  div $t3, $t0, 2
  beq $t3, 0, Exit
  div $t0, $t0, 2
  addi $t2, $t2, 1
  j loop
  
Exit :
  li $v0, 4
  la $a0, msg2
  syscall
  li $v0, 1
  move $a0, $t2
  syscall
  
.data
msg1 : .asciiz "Enter Input : "
msg2 : .asciiz "Result is : "
