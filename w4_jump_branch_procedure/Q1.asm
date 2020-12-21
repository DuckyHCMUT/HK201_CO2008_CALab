.text
.globl main

main:
  addi $t1, $zero, 0 #sum register
  li $v0, 4 # print_string syscall code = 4
  la $a0, msg1 # load the address of msg
  syscall

loop :
  li $v0, 5 # read_int syscall code = 5
  syscall
  move $t0, $v0 #t0 = input
  bltz $t0, EXIT #compare if input is greater than 0
  
  add $t1, $t1, $t0
  li $v0, 4 # print_string syscall code = 4
  la $a0, msg2 # load the address of msg
  syscall
  j loop

EXIT :
  li $v0, 4 # print_string syscall code = 4
  la $a0, msg3 # load the address of msg
  syscall
  li $v0, 1
  move $a0, $t1
  syscall
  
.data
msg1: .asciiz "Enter input : "
msg2: .asciiz "please input an another integer number : "
msg3: .asciiz "Sum of previous inputs is : "
