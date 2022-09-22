.text

li $t0, 0xff0f0000
srl $t1, $t0, 2
#code 0x00084882
# 0000 0000 0000 1000 0100 1000 1000 0010
#formato R
# opcode  rs     rt     rd     shamt   funct
# 6bits  5bits  5bits  5bits   5bits   6bits
# 000000 00000  01000  01001   00010   000010
#   0      0      8      9       2       2

sw $t1, 0($gp)
#code 0xaf890000
# 1010 1111 1000 1001 0000 0000 0000 0000 
#formato I
# opcode  rs     rt    constante
# 6bits  5bits  5bits   16bits
# 101011 11100  01001  0000000000000000
#   43    28      5       0 