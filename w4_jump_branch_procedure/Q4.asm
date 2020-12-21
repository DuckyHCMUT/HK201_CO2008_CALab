.text
.globl main

main:
  # Print string msg1li $v0,4 # print_string syscall code = 4
  la $a0, msg1 # load the address of msg1
  syscall
  
  # Get input A from user and save
  li $v0,5 # read_int syscall code = 5
  syscall
  move $a1,$v0
  
  # Initialize registers
  la $a0, arr
  add $a2, $zero, $a0 #clone array
  addi $t3, $zero, 0 #counter
  jal swap
  j Loop
  
swap:
  sll $t1, $a1, 2
  add $t1, $a2, $t1
  lw $t0, 0($t1)
  lw $t2, 4($t1)
  sw $t2, 0($t1)
  sw $t0, 4($t1)
  jr $ra
  
  li $v0,4 # print_string syscall code = 4
  la $a0, msg2 # load the address of msgsyscall
  syscall
  
Loop:
  lw $t0, 0($a2)
  li $v0, 1
  move $a0, $t0
  syscall
  
  li $v0,4 # print_string syscall code = 4
  la $a0, msg3 # load the address of msg1
  syscall
  
  addi $a2, $a2, 4
  addi $t3, $t3, 1
  beq $t3, 10, End
  j Loop
 
End:

.data
arr: .word 1, 3, 8, 5, 12, 99, 15, 25, 0, 23
msg1: .asciiz "Enter input k: "
msg2: .asciiz "Array after swapped : "
msg3: .asciiz " | "
