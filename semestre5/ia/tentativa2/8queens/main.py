# Algoritmo: 8 Rainhas
# Autores: Beatriz Pereira, Igor Rocha, Thalles Cerqueira

import utils

def printTable():
    utils.TABLE = [[0 for x in range(utils.TABLE_SIZE)] for y in range(utils.TABLE_SIZE)]
    utils.WEIGHTS = [[0 for x in range(utils.TABLE_SIZE)] for y in range(utils.TABLE_SIZE)]
    
    for i in range(utils.TABLE_SIZE):
        for j in range(utils.TABLE_SIZE):
            if utils.checkIfColumnIsSafe(j) == False or utils.checkIfRowIsSafe(i) == False or utils.checkIfDiagonalIsSafe(i, j) == False:
                utils.WEIGHTS[i][j] += 1
                utils.TABLE[i][j] = utils.bColors.FAIL + str(utils.WEIGHTS[i][j]) + utils.bColors.ENDC
            else:
                utils.TABLE[i][j] = 'Q'
                                
            print(utils.TABLE[i][j], end=' ')
            
        print()
        
def isSafe(row, col):
    # Verifica se a coluna está vazia
    utils.checkIfColumnIsSafe(col)
        
    # Verifica se a diagonal está vazia
    utils.checkIfDiagonalIsSafe(row, col)
    
    # Verifica se a linha está vazia
    utils.checkIfRowIsSafe(row)
    
    return True

def solveNQUtil(col):
    # Todas as rainhas foram colocadas
    if col >= utils.QUEENS_QTD:
        return True
    
    # Tenta colocar uma rainha em todas as linhas
    for i in range(utils.TABLE_SIZE):
        # Verifica se a rainha pode ser colocada na tabela
        if isSafe(i, col):
            utils.TABLE[i][col] = 'Q'
            
            # Chama recursivamente para colocar a próxima rainha
            if solveNQUtil(col + 1) == True:
                return True
            
            printTable()
            # Espera pelo enter do usuário
            # input()
            
            utils.TABLE[i][col] = 0
    
    # Se nenhuma rainha puder ser colocada em uma coluna, retorna falso
    return False

def main():
    if solveNQUtil(0) == False:
        print("Não há solução")
        return False
    
    printTable()
    
    
    
    
    
main()