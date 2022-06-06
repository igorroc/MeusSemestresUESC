.data
	printTamanho: .asciiz "Digite o tamanho do vetor: "
	printPedeValor: .asciiz "Digite os valores:\n"
	V: 
		.align 2 
		
.text	

	li $v0, 4 # printf
	la $a0, printTamanho
	syscall
	
	li $v0, 5 # scanf
	syscall
	move $t0, $v0 # variavel N
	
	la $a0, printPedeValor
	li $v0, 4 # printf
	syscall
	

	loop: 
		blez $t0, fimLoop
		li $v0, 5 # scanf
		syscall
		
		move $t1, $v0
		sw $t1, V($t0)
		addi $t0, $t0, 4 # proxima posicao
		
		j loop
		
	fimLoop:
	
	la $a0, printFim
	li $v0, 4 # printf
	syscall
	
	addi $
	
	
	loopPrint: 
		blez $t0, fimLoop
		li $v0, 5 # scanf
		syscall
		
		move $t1, $v0
		lw $t1, V($t0)
		addi $t0, $t0, 4 # proxima posicao
		
		j loopPrint
		
	move $a0, $s0
	li $v0, 1
	syscall
	