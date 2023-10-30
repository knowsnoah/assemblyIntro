#Write a program in assembly tbag takes two number inputs from a user.
# Have the user select from an output menu of 4 arthimetic options
# display the result in the output to the user

.data
prompt1: .asciiz "Input the first int: "
prompt2: .asciiz "Input the second int: "
prompt3: .asciiz "\nArthimetic Options: \n1) Add \n2) Sub \n3) Multi \n4) Div \nPlease enter your choice: "
prompt4: .asciiz "\nUser inputs are the same"
prompt5: .asciiz "\nUser inputs are different"
prompt6: .asciiz "\nUser ints are invalid."

.text
main:
#part 1
	#displaying the prompt 
	li $v0, 4
	la $a0, prompt1
	syscall

	#getting the first int
	li $v0, 5
	syscall
	move $t0, $v0

	#displaying the prompt2 
	li $v0, 4
	la $a0, prompt2
	syscall

	#getting the second int
	li $v0, 5
	syscall
	move $t1, $v0
	
	#displaying the ints back to the user
	li $v0, 1
   	move $a0, $t0
	syscall
    	move $a0, $t1
  	 syscall

	
#part 2
	#displaying prompt3
	li $v0, 4
	la $a0, prompt3
	syscall
	
	#getting the desired operation
	li $v0, 5
	syscall
	move $t4, $v0
	
	#check for all FOUR CASES (add (1), sub(2), multi(3), and div(4))
	#add
	beq $t4, 1, addition
	beq $t4, 2, substraction
	beq $t4, 3, multiplication
	beq $t4, 4, division
	
	#if the ints are invalid
	li $v0, 4
    	la $a0, prompt6
    	syscall
	j exit
	
addition:
	#add the two ints
	add $t2, $t0, $t1
	
	li $v0, 1
	la $a0, ($t2)
	syscall
	j checkEquality
	
substraction: 
	#minus the two ints
	sub $t2, $t0, $t1
	
	li $v0, 1
	la $a0, ($t2)
	syscall 
	j checkEquality
	
multiplication:
	#mulitply the two int
	mul $t2, $t0, $t1
	
	li $v0, 1
	la $a0, ($t2)
	syscall 
	j checkEquality
	
division:
	#divide the numbers
	div $t2, $t0, $t1
	
	la $v0, 1
	la $a0, ($t2)
	syscall
	j checkEquality
	
checkEquality:
#part 3
	#compares inputs 
	bne $t0, $t1, notEqual
	beq $t0, $t1, equal
equal:
	#if equal
	li $v0, 4
	la $a0, prompt4
	syscall	
	j exit
notEqual:
	#if not equal 	
	li $v0, 4
	la $a0, prompt5
	syscall	
	j exit
	
exit: 
	li $v0, 10
	syscall	
	
