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
	beq $t2, 28, copyEnd #from 0 to 27 is 28 bytes (25 + 3 padding bytes)
	sb $zero, 0($s1) #store '\0' after the string, and before next data
	addiu $s1, $s1, 1 #increment the address of string in struct by byte
	addi $t2, $t2, 1 #increment counter
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
	
	
	
.data
	name : .asciiz "This is the name" #sample name
	score : .float 5.5 #sample score


