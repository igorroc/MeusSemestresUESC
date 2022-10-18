li $s0, 35000		# ori $16, $0, 35000
# como esse número em binário nao passa de 16 bits, ele consegue fazer a operacao normalmente

li $s0, 56000		# ori $16, $0, 56000
# como esse número em binário nao passa de 16 bits, ele consegue fazer a operacao normalmente

li $s0, 300000		# lui $1, 4
			# ori $16, $1, 37856
			
# ja esse numero possui 20 bits, entao ele reserva os 4 primeiros com a operacao lui, e depois pega os outros 16 com a operacao ori