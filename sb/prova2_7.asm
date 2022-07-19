addi $s3, $0, 1
addi $s7, $0, 1

Loop1: 	sll $t1, $s3, 2
	add $t1, $t1, $s7
	lw $t0, 0($t1)
	bne $t0, $s5, Saida
	addi $s3, $s3, -3
	j Loop1
Saida: