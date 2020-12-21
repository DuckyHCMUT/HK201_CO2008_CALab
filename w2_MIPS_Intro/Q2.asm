.text
.globlmain

main:
  # Print string msg1
  li $v0,4 # print_string syscall code = 4
  la $a0, msg1 # load the address of msg
  syscall
  
  # Get input A from user and saveli $v0,5 # read_int syscall code = 5
  syscall
  move $t0, $v0 # syscall results returned in $v0
  
  # Print string msg2
  li $v0,4 # print_string syscall code = 4
  la $a0, msg2 # load the address of msg
  syscall
  
  # Get input B from user and save
  li $v0,5 # read_int syscall code = 5
  syscall
  move $t1, $v0 # syscall results returned in $v0
  
  # Add Processing
  add $a1, $t0, $t1
  # Print string msg3
  li $v0,4 # print_string syscall code = 4
  la $a0, msg3 # load the address of msg
  syscall

  # Print sum
  li $v0,1 # print_int syscall code = 1
  move $a0, $a1 # int to print must be loaded into $a0
  syscall

# Start .data segment (data!)
.data
msg1: .asciiz "Enter A: "
msg2: .asciiz "Enter B: "
msg3: .asciiz "Sum of A and B: "
