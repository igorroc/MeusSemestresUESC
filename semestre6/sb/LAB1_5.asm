.data

a: .word 2,-6,2,4,10,3,7
c: .word 3,0,1,-15,-20    
b: .word

.text

li $t0, 2 # indice 2
sll $t1, $t0, 2 # $t0x4
la $t2, c # carrega o endereço do label em $t2
add $t2, $t2, $t1 # endereço total onde esta c[2]
lw $t3, 0($t2) # $t3=c[2]
sll $t4, $t3, 4 # $t3x16
li $t5, 3 # indice 3
sll $t6, $t5, 2 # $t5x4
la $t7, a # carrega o endereço do label em $t7
add $t7, $t7, $t6 # endereço total onde esta a[3]
lw $t8, 0($t7) # $t8=a[3]
li $s0, 2 # indice 2
sll $s1, $s0, 2 # $s0x4
la $s2, b # carrega o endereço do label em $s2
add $s2, $s2, $s1 # endereço total onde esta b[2]
lw $s3, 0($s2) # $s3=b[2]
add $s3, $t8, $t4


