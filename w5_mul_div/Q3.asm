.text
.globl main

main:
  li $t1, 0 #a
  li $t2, 10 #b
  li $t3, 7 #c
  li $v0,4 # print_string syscall code = 4
  la $a0, msg1 # load the address of msgsyscall
  syscall
  
  li $v0, 5 # read_int syscall code = 5
  syscall
  move $t0, $v0 #t0 = input
  beq $t0, 0, case0 #check if input == 0
  beq $t0, 1, case1 #check if input == 1
  beq $t0, 2, case2 #check if input == 2
  beq $t0, 3, case3 #check if input == 3
  beq $t0, 4, case4 #check if input == 4
  
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
  mult $t2, $t3
  #print high
  li $v0,4 # print_string syscall code = 4
  la $a0, msg3 # load the address of msgsyscall
  syscall
  
  li $v0, 1
  mfhi $a0
  syscall
  
  #print low
  li $v0,4 # print_string syscall code = 4
  la $a0, msg4 # load the address of msgsyscall
  syscall
  
  li $v0, 1
  mflo $a0
  syscall
  j EXIT
  
case3:
  div $t2, $t3
  mflo $t1
  j END
case4:
  div $t2, $t3
  mfhi $t1
  j END
  
END :
  li $v0, 1
  move $a0, $t1
  syscall
EXIT :

.data
msg1: .asciiz "Enter input : "
msg2: .asciiz "please input an another integer number\n"
msg3: .asciiz "HI word is : "
msg4: .asciiz "\nLO word is : "
