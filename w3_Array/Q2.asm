.text
.globl main

main:
  #Create temp register for array
  la $s1, array
  addi $s0, $zero, 0
  add $s0, $s1, $zero
  addi $s2, $zero, 0
  addi $s2, $s1, 4
  addi $t2, $zero, 0 #counter
  addi $t3, $zero, 0 #sum register for even
  addi $t4, $zero, 0 #sum register for odd
  
Loop :
  lw $t0, 0($s0)
  lw $t1, 0($s2)
  add $t3, $t3, $t0
  add $t4, $t4, $t1
  addi $s0, $s0, 8
  addi $s2, $s2, 8
  addi $t2, $t2, 1
  beq $t2, 5, Exit
  j Loop
  
Exit :
  li $v0,4 # print_string syscall code = 4
  la $a0, msg1 # load the address of msgsyscall
  syscall
  
  li $v0, 1
  move $a0, $t3
  syscall
  
  li $v0,4 # print_string syscall code = 4
  la $a0, msg2 # load the address of msgsyscall
  syscall
  
  li $v0, 1
  move $a0, $t4
  syscall
  
.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
msg1: .asciiz "Sum of even array's elements is : "
msg2: .asciiz "\nSum of odd array's elements is : "
