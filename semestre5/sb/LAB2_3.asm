.data
	string: .space 256
	printString: .asciiz "\nDigite a string: "
	printTamanho: .asciiz "\nDigite o tamanho da string: "
	printFim: .asciiz "\nFim\n"

.text
	
	li $v0, 4
	la $a0, printTamanho
	syscall
	
	li $v0, 5
	syscall
	move $t7, $v0
	
	li $v0, 4
	la $a0, printString
	syscall
	
	li $v0, 8
	la $a0, string
	li $a1, 256
	syscall
	
	move $s5, $a0
	
	la $t5, string
	la $t6, string
	addi $t0, $t7, 0
	sll $t0, $t0, 2
	add $t6, $t6, $t0
	
	li $t0, 0
	addi $t1, $t7, 0
	
	
	loop1:
		bge $t0, $t1, exitLoop1
		
		lb $t3, ($t5)
		lb $t4, ($t6)
		
		sb $t4, ($t5)
		sb $t5, ($t6)
		
		addi $t0, $t0, 1
		subi $t1, $t1, 1
		addi $t5, $t5, 1
		subi $t6, $t6, 1
		j loop1
	exitLoop1:
	
	li $t0, 0
	la $t5, string
	
	
	loopPrint:
		bge $t0, $t7, exitLoopPrint
		li $v0, 11 # Print int
		lb $t2, 0($t5)
		la $a0, ($t2)
		syscall
		
		addi $t0, $t0, 1
		addi $t5, $t5, 1
		j loopPrint

exitLoopPrint:
	
	li $v0, 4
	la $a0, string
	syscall
	
	li $v0, 4
	la $a0, printFim
	syscall
	
	li $v0, 10
	syscall
	