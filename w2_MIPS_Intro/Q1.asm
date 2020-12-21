.text
.globlmain
main:
# Print string msg1
  li $v0,4 # print_string syscall code = 4
  la $a0, msg1 # load the address of msg
  syscall

# Get input from user and save
  li $v0,5 # read_int syscall code = 5
  syscall
  move $t0, $v0 # syscall results returned in $v0
  addi $t1, $t0, 1

# Print string msg2
  li $v0,4 # print_string syscall code = 4
  la $a0, msg2 # load the address of msg
  syscall

# Print result
  li $v0,1 # print_int syscall code = 1
  move $a0, $t1 # int to print must be loaded into $a0
  syscall
# Start .data segment (data!)
.data
msg1: .asciiz "Enter number : "
msg2: .asciiz "Result after increased that number by 1 is : "
