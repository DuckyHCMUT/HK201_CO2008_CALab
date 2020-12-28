.text
.globl main

main :
#######Struct memory allocation, no instance yet#######
	li $v0, 9  #syscall code = 9 for memory allocation
	li $a0, 44 #allocate 44 bytes for struct (4 + 25 (+3 pad) + 4 + 4 + 4 = 44)
	syscall
	move $s1, $v0 #move the allocated bytes to s1, now s1 is storing base address of struct
	
	# initialize the first struct 
        li $t0, 1953097       # ID
        sw $t0, 0($s1)        # store ID in struct
        
	#Read name string by a loop
	addi $s1, $s1, 4 #increase the address of s1 after allocate 4 bytes for student's ID
	la $t0, name  #load address of name sample
	addi $t2, $t2, 0 #counter
	
CopyName : 	
	lb $t1, 0($t0) 
	sb $t1, 0($s1)  
	addiu $t0, $t0, 1 #increment the source register of name
	addiu $s1, $s1, 1 #increment the address of string in struct by byte
	addi $t2, $t2, 1  #increment counter, for the purpose of checking 28 bytes 
	beq $t2, 25, padding
	bne $t1, $zero, CopyName #exit loop if it reads NULL (\0) character
	
padding : 
	sb $zero, 0($s1) #store '\0' after the string, and before next data
	addiu $s1, $s1, 1 #increment the address of string in struct by byte
	addi $t2, $t2, 1 #increment counter
	beq $t2, 28, copyEnd #28 bytes (25 + 3 padding bytes)
	j padding
	
copyEnd : #copy string finish, now read next data in a struct

	li $t0, 10  #Age
	sw $t0, 0($s1)
	li $t0, 1 # is_male, 0 = female, 1 = male
	sw $t0, 4($s1)
	addi $s1, $s1, 8
	l.s $f0, score
	s.s $f0, 0($s1)
#######End of struct allocation#######


#######Struct's instance allocation#######
	addi $t3, $zero, 0 #array counter
arr :
	addi $s1, $s1, 4
	beq $t3, 0, first
	beq $t3, 1, second
	beq $t3, 2, third
	beq $t3, 3, fourth
	beq $t3, 4, fifth
first :
	li $s4, 1111111 #$s4 to save ID
	la $t4, name1   #$t4 to save name
	li $t5, 10      #$t5 to save age
	l.s $f4, score1	#$f4 to save score in FP
	li $t6, 1       #$t6 to save gender (0 or 1 = female / male)
	j start
second :
	li $s4, 2222222
	la $t4, name2
	li $t5, 11   
	l.s $f4, score2
	li $t6, 0  
	j start
third :
	li $s4, 3333333
	la $t4, name3
	li $t5, 9   
	l.s $f4, score3
	li $t6, 1  
	j start
fourth :
	li $s4, 4444444
	la $t4, name4
	li $t5, 12
	l.s $f4, score4
	li $t6, 0
	j start
fifth :
	li $s4, 5555555
	la $t4, name5
	li $t5, 15
	l.s $f4, score5
	li $t6, 1  
	j start

start:
	addi $t2, $zero, 0
	li $v0, 9  #syscall code = 9 for memory allocation
	li $a0, 44 #allocate 44 bytes for struct (4 + 25 (+3 pad) + 4 + 4 + 4 = 44)
	syscall
	move $s1, $v0 #move the allocated bytes to s1, now s1 is storing base address of struct
	
	# initialize the first struct 
        sw $s4, 0($s1)        # store ID in struct
        
	#Read name string by a loop
	addi $s1, $s1, 4 #increase the address of s1 after allocate 4 bytes for student's ID
	move $t0, $t4
	addi $t2, $t2, 0 #counter
	
CopyName_inst : 	
	lb $t1, 0($t0) 
	sb $t1, 0($s1)  
	addiu $t0, $t0, 1 #increment the source register of name
	addiu $s1, $s1, 1 #increment the address of string in struct by byte
	addi $t2, $t2, 1  #increment counter, for the purpose of checking 28 bytes 
	beq $t2, 25, padding_inst
	bne $t1, $zero, CopyName_inst #exit loop if it reads NULL (\0) character
	
padding_inst : 
	sb $zero, 0($s1) #store '\0' after the string, and before next data
	addiu $s1, $s1, 1 #increment the address of string in struct by byte
	addi $t2, $t2, 1 #increment counter
	beq $t2, 28, copyEnd_inst #28 bytes (25 + 3 padding bytes)
	j padding_inst
	
copyEnd_inst : #copy string finish, now read next data in a struct

	sw $t5, 0($s1)
	addi $s1, $s1, 4
	sw $t6, 0($s1)
	addi $s1, $s1, 4
	s.s $f4, 0($s1)
#######End of struct's instance allocation#######
	addi $t3, $t3, 1
	beq $t3, 5, Exit
	j arr
	
Exit :
	li $v0, 10
	syscall
		
.data
	msg1 : .asciiz "This is a list of students\n"
	name : .asciiz "this is name" #sample name
	name1 : .asciiz "Nguyen Van A"
	name2 : .asciiz "Nguyen Van B"
	name3 : .asciiz "Nguyen Thi C"
	name4 : .asciiz "Tran Van D"
	name5 : .asciiz "Le Thi E"
	
	score : .float 2.2 #sample score
	score1 : .float 7.5
	score2 : .float 8.0
	score3 : .float 8.5
	score4 : .float 9.4
	score5 : .float 10.0

