.text
.globl main

main:
  #Create temp register for array
  la $s1, array
  addi $s0, $zero, 0
  add $s0, $s1, $zero
  addi $t2, $zero, 0 #counter
  addi $t3, $zero, 0 #sum register
  
  #Print string to require input array
  li $v0, 4 # print_string syscall code = 4
  la $a0, msg1 # load the address of msg
  syscall
  
  # Get input A from user and save
Loop : 
  li $v0, 5 # read_int syscall code = 5
  syscall
  move $t1, $v0
  sw $t1, 0($s0)
  add $t3, $t3, $t1
  addi $s0, $s0, 4
  addi $t2, $t2, 1
  beq $t2, 10, Exit
  j Loop
  
Exit :
  li $v0,4 # print_string syscall code = 4
  la $a0, msg2 # load the address of msgsyscall
  syscall
  
  li $v0, 1
  move $a0, $t3
  syscall
  
.data
array: .word 0:10
msg1: .asciiz "Enter 10 array's elements : "
msg2: .asciiz "Sum of 10 array's elements is : "
