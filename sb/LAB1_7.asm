.data
	array: .space 32
	printVetor: .asciiz "\nVetor:\n"
	printScanf: .asciiz "\nDigite os 8 elementos do vetor:\n"
	printSoma: .asciiz "\nSoma:\n"
	printBarra: .asciiz "|"

.globl main
.text

main:
	li $t0, 0
	la $t5, array
	li $v0, 4 # Print string
	la $a0, printScanf
	syscall
	
	loop:
		bge $t0, 8, exitLoop
		li $v0, 5 # Read int
		syscall
		sw $v0, 0($t5)
		addi $t0, $t0, 1
		addi $t5, $t5, 4
		j loop
		
exitLoop:
	li $v0, 4 # Print string
	la $a0, printVetor
	syscall
	
	li $t0, 0
	la $t5, array
	
	loop2:
		bge $t0, 8, exitLoop2
		li $v0, 1 # Print int
		lw $t2, 0($t5)
		la $a0, ($t2)
		syscall
		
		li $v0, 4
		la $a0, printBarra
		syscall
		
		addi $t0, $t0, 1
		addi $t5, $t5, 4
		j loop2
		
exitLoop2:

	li $s0, 0
	li $t0, 0
	la $t5, array
	
	loop3:
		bge $t0, 8, exitLoop3
		lw $t1, 0($t5)
		add $s0, $s0, $t1
		addi $t0, $t0, 2
		addi $t5, $t5, 8
		j loop3
		
exitLoop3:
	
	li $v0, 4 # Print string
	la $a0, printSoma
	syscall
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	