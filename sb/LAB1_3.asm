.text

ori $t3, $0, 0xfeaa
# code: 0x340bfeaa
# 0011 0100 0000 1011 1111 1110 1010 1010
#formato I
# opcode  rs     rt    constante
# 6bits  5bits  5bits   16bits
#001101  00000  01011  1111111010101010
# 13      0      11       0xfeaa

addi $t4, $0, 0x00ff

or $s1, $t3, $t4
# code: 0x016c8825
# 0000 0001 0110 1100 1000 1000 0010 0101
#formato R
# opcode  rs     rt     rd     shamt   funct
# 6bits  5bits  5bits  5bits   5bits   6bits
#000000  01011  01100  10001   00000   100101
#  0      11      12     17      0       37
