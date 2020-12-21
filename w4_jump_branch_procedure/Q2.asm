.text
.globl main
main:
  addi $t1, $zero, 0 #a
  addi $t2, $t2, 10 #b
  addi $t3, $t3, 5 #c
  li $v0,4 # print_string syscall code = 4
  la $a0, msg1 # load the address of msgsyscall
  syscall
  li $v0, 5 # read_int syscall code = 5
  syscall
  move $t0, $v0 #t0 = input
  
  beq $t0, 0, case0 #check if input == 0
  beq $t0, 1, case1 #check if input == 1
  beq $t0, 2, case2 #check if input == 2
  li $v0,4 # print_string syscall code = 4
  la $a0, msg2 # load the address of msgsyscall
  syscall
  j EXIT
  
case0 :
  add $t1, $t2, $t3
  j END
case1 :
  sub $t1, $t2, $t3
  j END
case2 :
  sub $t1, $t3, $t2
  j END
  
END :
  li $v0, 1
  move $a0, $t1
  syscall
EXIT :
  
.data
msg1: .asciiz "Enter input : "
msg2: .asciiz "please input an another integer number\n"
