.text
.globl main

main:
  #Create temp register for array
  la $s1, array
  add $s0, $s1, $zero
  
  #Print string to require input array
  li $v0, 4 # print_string syscall code = 4
  la $a0, msg1 # load the address of msgsyscall
  li $v0, 5 # read_int syscall code = 5
  syscall
  
  move $t1, $v0 #$t1 now store the index
  addi $t2, $zero, 4
  mul $t1, $t1, $t2
  add $s0, $s0, $t1
  lw $t2, 0($s0)
  
Exit :
  li $v0,4 # print_string syscall code = 4
  la $a0, msg2 # load the address of msgsyscall
  syscall
  
  li $v0, 1
  move $a0, $t2
  syscall
  
.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
msg1: .asciiz "Enter the index : "
msg2: .asciiz "\nThe element is : "
