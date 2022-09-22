.data
	tres: .float 3.0
	sete: .float 7.0
	printProva1: .asciiz "Digite quanto voce tirou na primeira prova: "
	printProva2: .asciiz "Digite quanto voce tirou na segunda prova: "
	printProva3: .asciiz "Digite quanto voce tirou na terceira prova: "
	printAprovado: .asciiz "Você foi aprovado!"
	printReprovado: .asciiz "Infelizmente você nao passou..."

.text
	li $v0, 4 # print string
	la $a0, printProva1
	syscall
	
	li $v0, 6 # scanf float
	syscall
	add.s $f1, $f1, $f0 # N

	
	li $v0, 4 # print string
	la $a0, printProva2
	syscall
	
	li $v0, 6 # scanf float
	syscall
	add.s $f1, $f1, $f0 # N
	
		
	li $v0, 4 # print string
	la $a0, printProva3
	syscall
	
	li $v0, 6 # scanf float
	syscall
	add.s $f1, $f1, $f0 # N
		
	lwc1 $f3, tres
	div.s $f1, $f1, $f3
	lwc1 $f7, sete
	c.lt.s $f1, $f7
	bc1f Passou

NaoPassou:
	li $v0, 4 # print string
	la $a0, printReprovado
	syscall
	j Exit
	
Passou:
	li $v0, 4 # print string
	la $a0, printAprovado
	syscall
	

		
Exit:	