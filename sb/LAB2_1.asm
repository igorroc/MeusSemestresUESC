.data
	printTamanho: .asciiz "Digite o tamanho do vetor: "
	printPedeValor: .asciiz "Digite os valores:\n"
	printFim: .asciiz "O menor valor do vetor é: "
	V:
		.align 2
		
.text	

	li $v0, 4 # printf
	la $a0, printTamanho
	syscall
	
	li $v0, 5 # scanf
	syscall

	move $t0, $v0 # contador
	
	li $v0, 4 # printf
	la $a0, printPedeValor
	syscall
	

	li $v0, 5 # scanf
	syscall
	move $s0, $v0 # pega o primeiro valor
	subi $t0, $t0, 1
	
	loop:
		blez $t0, fimLoop
		li $v0, 5 # scanf
		syscall
		bge $v0, $s0, naoAltera
		move $s0, $v0
		naoAltera:
		subi $t0, $t0, 1
		j loop
		
		
		
	fimLoop:
	la $a0, printFim
	li $v0, 4 # printf string
	syscall
	
	move $a0, $s0
	li $v0, 1 # printf int
	syscall
	