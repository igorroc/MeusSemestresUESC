.data
	array: .space 16
	printBarra: .asciiz "|"
	F: .word 5

.globl main
.text

main:
	lw $t0, F
	li $t1, 1 # G
	la $t2, array # V[4]
	li $t3, 0 # i
	
	loop:
		bge $t3, 4, exitLoop
		sub $t5, $t0, $t1
		sw $t5, 0($t2)
		
		add $t1, $t1, $t3
		addi $t3, $t3, 1
		addi $t2, $t2, 4
		j loop
		
exitLoop:

	li $t0, 0
	la $t5, array
	
	loop2:
		bge $t0, 4, exitLoop2
		li $v0, 1 # Print int
		lw $t2, 0($t5)
		la $a0, ($t2)
		syscall
		
		li $v0, 4 # print string
		la $a0, printBarra
		syscall
		
		addi $t0, $t0, 1
		addi $t5, $t5, 4
		j loop2
		
exitLoop2:
	