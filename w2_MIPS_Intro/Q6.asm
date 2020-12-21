.text
.globlmain

main:
  # Print string msg1
  li $v0,4 # print_string syscall code = 4
  la $a0, msg1 # load the address of msg
  syscall
  
  # Get input a from user and save
  li $v0,5 # read_int syscall code = 5syscall
  move $t0, $v0 # syscall results returned in $v0
  
  # Print string msg2
  li $v0,4 # print_string syscall code = 4
  la $a0, msg2 # load the address of msg
  syscall
  
  # Get input b from user and save
  li $v0,5 # read_int syscall code = 5
  syscall
  move $t1, $v0 # syscall results returned in $v0
  
  # Print string msg3
  li $v0,4 # print_string syscall code = 4
  la $a0, msg3 # load the address of msg
  syscall
  
  # Get input c from user and save
  li $v0,5 # read_int syscall code = 5
  syscall
  move $t2, $v0 # syscall results returned in $v0
  
  # Print string msg4
  li $v0,4 # print_string syscall code = 4
  la $a0, msg4 # load the address of msg
  syscall
  
  # Get input d from user and save
  li $v0,5 # read_int syscall code = 5
  syscall
  move $t3, $v0 # syscall results returned in $v0
  
  # Print string msg5
  li $v0,4 # print_string syscall code = 4
  la $a0, msg5 # load the address of msg
  syscall
  
  # Get input x from user and save
  li $v0,5 # read_int syscall code = 5
  syscall
  move $t4, $v0 # syscall results returned in $v0
  
  #Math
  mul $t5, $t4, $t4 # t5 = x^2
  mul $t6, $t5, $t4 # t6 = x^3
  mul $t7, $t0, $t6 # t7 = a*x^3
  mul $t8, $t1, $t5 # t8 = b*x^2
  mul $t9, $t2, $t4 # t9 = c*x
  add $t7, $t7, $t8 # t7 = a*x^3 + b*x^2
  add $t7, $t7, $t9 # t7 = a*x^3 + b*x^2 + c*x
  add $t7, $t7, $t3 # t7 = a*x^3 + b*x^2 + c*x + d# Print string msg6
  li $v0, 4 # print_string syscall code = 4
  la $a0, msg6 # load the address of msg
  syscall
  
  # Print sum
  li $v0,1 # print_int syscall code = 1
  move $a0, $t7 # int to print must be loaded into $a0
  syscall
  
# Start .data segment (data!)
.data
msg1: .asciiz "Enter a: "
msg2: .asciiz "Enter b: "
msg3: .asciiz "Enter c: "
msg4: .asciiz "Enter d: "
msg5: .asciiz "Enter x: "
msg6: .asciiz "f = "
newline: .asciiz "\n"
