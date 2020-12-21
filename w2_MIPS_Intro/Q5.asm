.text
.globl main

main:
  li $t0, 30 #load immediate 30 to $t1
  
  add $t1, $t0, $t0 #add 2 times of 30 to $t1
  add $t2, $t1, $t1 #add 2 times of $t1 (60) to $t2
  add $t2, $t2, $t2 #add 2 times of $t2 to itself (240)
  add $t2, $t2, $t1 #add 2 times of $t1 (60) to $t2, now $t2 is 300
  addi $t2, $t2, 66000 #add immediate 66000 to $t2, now $t2 is 66300
  subi $t2, $t2, 6000 #subtract immediate 6000 from $t2, now $t2 is 60300
  addi $a0, $t2, 25 #add immediate 25 to $t2, now $t2 is60325
  
  li $v0, 1 #syscall to print result out : 60325
  syscall
  li $v0, 10 #program termination
  syscall
