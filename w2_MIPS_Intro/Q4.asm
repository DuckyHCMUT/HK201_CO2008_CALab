.text
.globl main
main:

  # Print string msg1
  li $v0,4 # print_string syscall code = 4
  la $a0, msg1 # load the address of msg
  syscall
  
  # Get input A from user and save
  li $v0,5 # read_int syscall code = 5
  syscall
  move $t0,$v0 # syscall results returned in $v0
  
  # Print string msg2
  li $v0,4 # print_string syscall code = 4
  la $a0, msg2 # load the address of msg2
  syscall
  
  # Get input B from user and save
  li $v0,5 # read_int syscall code = 5
  syscall
  move $t1,$v0 # syscall results returned in $v0
  
  # Print string msg3
  li $v0,4 # print_string syscall code = 4
  la $a0, msg3 # load the address of msg
  syscall
  
  # Get input C from user and save
  li $v0,5 # read_int syscall code = 5
  syscall
  move $t2,$v0 # syscall results returned in $v0
  
  # Print string msg4
  li $v0,4 # print_string syscall code = 4
  la $a0, msg4 # load the address of msg2
  syscall
  
  # Get input D from user and save
  li $v0,5 # read_int syscall code = 5
  syscall
  move $t3,$v0 # syscall results returned in $v0
  
  # Print string msg5
  li $v0,4 # print_string syscall code = 4
  la $a0, msg5 # load the address of msg2
  syscall
  
  # Get input E from user and save
  li $v0,5 # read_int syscall code = 5
  syscall
  move $t4,$v0 # syscall results returned in $v0
  
  # Print sum
  li $v0,1 # print_int syscall code = 1
  move $a0, $t4 # int to print must be loaded into $a0
  syscall
  # Print \n
  li $v0,4 # print_string syscall code = 4
  la $a0, newline
  syscall
  # Print sum
  li $v0,1 # print_int syscall code = 1
  move $a0, $t3 # int to print must be loaded into $a0
  syscall
  # Print \n
  li $v0,4 # print_string syscall code = 4
  la $a0, newline
  syscall
  # Print sum
  li $v0,1 # print_int syscall code = 1
  move $a0, $t2 # int to print must be loaded into $a0
  syscall
  # Print \n
  li $v0,4 # print_string syscall code = 4
  la $a0, newline
  syscall
  # Print sum
  li $v0,1 # print_int syscall code = 1
  move $a0, $t1 # int to print must be loaded into $a0
  syscall
  # Print \n
  li $v0,4 # print_string syscall code = 4
  la $a0, newlinesyscall
  # Print sum
  li $v0,1 # print_int syscall code = 1
  move $a0, $t0 # int to print must be loaded into $a0
  syscall
# Start .data segment (data!)
.data
msg1: .asciiz "Enter A: "
msg2: .asciiz "Enter B: "
msg3: .asciiz "ENTER C: "
msg4: .asciiz "ENTER D: "
msg5: .asciiz "ENTER E: "
newline: .asciiz "\n
