.text
.globl main

main:
  #Create temp register for array
  la $s1, array
  addi $s0, $zero, 0
  add $s0, $s1, $zero
  addi $t2, $zero, 0 #counter
  
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
  addi $s0, $s0, 4
  addi $t2, $t2, 1
  beq $t2, 10, Exit
  j Loop
  
Exit :
  addi $t2, $zero, 0 #re-initialize counter
  addi $s2, $s1, 0
  subi $s0, $s0, 4
  
Loop2: #swap
  lw $t3, 0($s2)
  lw $t4, 0($s0)
  sw $t3, 0($s0)
  sw $t4, 0($s2)
  addi $s2, $s2, 4
  subi $s0, $s0, 4
  addi $t2, $t2, 1
  beq $t2, 5, Exit1
  j Loop2
  
Exit1:
  li $v0,4 # print_string syscall code = 4
  la $a0, msg2 # load the address of msgsyscall
  syscall
  
  addi $t2, $zero, 0 #counter

Loop3:
  lw $t5, 0($s1)
  li $v0, 1
  move $a0, $t5
  syscall
  
  li $v0,4 # print_string syscall code = 4
  la $a0, msg3 # load the address of msgsyscall
  syscall
  
  addi $s1, $s1, 4
  addi $t2, $t2, 1
  beq $t2, 10, End
  j Loop3
End :

.data
msg: .asciiz "a"
array: .word 0:10
msg1: .asciiz "Enter 10 array's elements : "
msg2: .asciiz "Array after reversed : "
msg3: .asciiz " | "
