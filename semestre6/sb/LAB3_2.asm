.data
	printPergunta: .asciiz "Digite um numero: "
	printMultiplo: .asciiz "E multiplo!"
	printNaoMultiplo: .asciiz "Nao e multiplo!"

.text
	li $v0, 4 # print string
	la $a0, printPergunta
	syscall
	
	li $v0, 5 # scanf int
	syscall
	addi $t0, $v0, 0 # N
	
	li $t1, 3
	div $t0, $t1
	mfhi $t1
	beqz $t1, Multiplo
	
NaoMultiplo:
	li $v0, 4 # print string
	la $a0, printNaoMultiplo
	syscall
	j Exit
	
Multiplo:	
	li $v0, 4 # print string
	la $a0, printMultiplo
	syscall
	
	
Exit:
	
	
	
	
		