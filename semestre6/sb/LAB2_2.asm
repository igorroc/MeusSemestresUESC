.data
	A: .space 400
	B: .space 400
	printTamanho: .asciiz "Digite o tamanho do vetor: "
	printPedeValor: .asciiz "Digite os valores:\n"
	printBarra: .asciiz "|"
	printFim: .asciiz "Fim\n"

.text

	li $v0, 4 # printf
	la $a0, printTamanho
	syscall

	li $v0, 5 # scanf int
	syscall
	addi $t7, $v0, 0 # N
	addi $t0, $t7, 0 # contador

	la $t5, B

	loop:
		blez $t0, exitLoop
		li $v0, 5 # Read int
		syscall
		sw $v0, 0($t5)
		subi $t0, $t0, 1
		addi $t5, $t5, 4
		j loop

exitLoop:

	li $v0, 4 # printf
	la $a0, printFim
	syscall

	li $t1, 0 # I
	
	for1: 
		bgt $t1, $t7, exitFor1
		
		addi $t2, $t1, 0 # J
		
		for2:
			bgt $t2, $t7, exitFor2
			la $t4, A
			la $t5, B
			
			addi $t3, $t1, 0
			sll $t3, $t3, 2
			add $t4, $t4, $t3
			lw $s2, 0($t4) # A[i]
			
			addi $t3, $t2, 0
			sll $t3, $t3, 2
			add $t5, $t5, $t3
			lw $s3, 0($t5) # B[j]
			
			add $s2, $s2, $s3
			sw $s2, 0($t4)
			
			addi $t2, $t2, 1
			
			j for2
			
			
	exitFor2:
		addi $t1, $t1, 1
		j for1
		
exitFor1:
	
	li $t0, 0
	la $t5, A
	
	
	loopPrint:
		bge $t0, $t7, exitLoopPrint
		li $v0, 1 # Print int
		lw $t2, 0($t5)
		la $a0, ($t2)
		syscall
		
		li $v0, 4 # print string
		la $a0, printBarra
		syscall
		
		addi $t0, $t0, 1
		addi $t5, $t5, 4
		j loopPrint

exitLoopPrint: