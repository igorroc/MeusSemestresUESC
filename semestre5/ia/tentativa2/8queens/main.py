# Algoritmo: 8 Rainhas com pesos
# Autores: Beatriz Pereira, Igor Rocha, Thalles Cerqueira
# Link: https://replit.com/@IgorRoc/8queens#main.py

import utils

steps = 0

utils.QUEENS_QTD = 4
utils.TABLE_SIZE = utils.QUEENS_QTD

utils.TABLE = [[0 for x in range(utils.TABLE_SIZE)] for y in range(utils.TABLE_SIZE)]
utils.WEIGHTS = [[0 for x in range(utils.TABLE_SIZE)] for y in range(utils.TABLE_SIZE)]

# utils.TABLE = [
#     [0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0]]


class config:
    stepByStep = False  # Se True, o programa irá esperar o usuário apertar enter para continuar
    printInfo = True  # Se True, o programa irá imprimir informações sobre o processo



def getPositionQueensBeingAttacked(row, col):
    # Verifica a posição das rainhas que estão atacando a posição recebida
    positions = []

    # Coluna
    for i in range(utils.TABLE_SIZE):
        # Se a posição atual for a posição da rainha que está sendo analisada, ela não é atacante
        if (i == row and col == col):
            continue
        if utils.TABLE[i][col] == 'Q':
            positions.append([i, col])

    # Diagonal inferior direita
    for i, j in zip(range(row, -1, -1), range(col, -1, -1)):
        # Se a posição atual for a posição da rainha que está sendo analisada, ela não é atacante
        if (i == row and j == col):
            continue
        if utils.TABLE[i][j] == 'Q':
            positions.append([i, j])

    # Diagonal superior direita
    for i, j in zip(range(row, utils.TABLE_SIZE, 1), range(col, -1, -1)):
        # Se a posição atual for a posição da rainha que está sendo analisada, ela não é atacante
        if (i == row and j == col):
            continue
        if utils.TABLE[i][j] == 'Q':
            positions.append([i, j])

    # Diagonal inferior esquerda
    for i, j in zip(range(row, -1, -1), range(col, utils.TABLE_SIZE, 1)):
        # Se a posição atual for a posição da rainha que está sendo analisada, ela não é atacante
        if (i == row and j == col):
            continue
        if utils.TABLE[i][j] == 'Q':
            positions.append([i, j])

    # Diagonal superior esquerda
    for i, j in zip(range(row, utils.TABLE_SIZE, 1), range(col, utils.TABLE_SIZE, 1)):
        # Se a posição atual for a posição da rainha que está sendo analisada, ela não é atacante
        if (i == row and j == col):
            continue
        if utils.TABLE[i][j] == 'Q':
            positions.append([i, j])


    # Se não houver posições atacantes, retorna [-1, -1]
    if len(positions) == 0:
        return [-1, -1]

    return positions[0]


def checkIfSpotWasAttacked(row1, col1, row2, col2):
    # Verifica se esse espaço já foi atacado pela ultima rainha colocada
    if row2 == -1 and col2 == -1:
        return False

    # Verifica a coluna
    if col1 == col2:
        return True

    # Verifica a linha
    if row1 == row2:
        return True

    # Verifica as diagonais
    if abs(row1 - row2) == abs(col1 - col2):
        return True

    return False


def howManyQueensPlaced():
    # Verifica quantas rainhas estão no tabuleiro
    count = 0
    for i in range(utils.TABLE_SIZE):
        for j in range(utils.TABLE_SIZE):
            if utils.TABLE[i][j] == 'Q':
                count += 1

    return count


def resolve(row, lastQueenPositionX=-1, lastQueenPositionY=-1, lastQueenPutPositionX=-1, lastQueenPutPositionY=-1):
    global steps

    # Coloca peso em todas as casas da tabela
    utils.checkWeight(lastQueenPositionX, lastQueenPositionY)

    # Tenta colocar uma rainha em todas as colunas
    for i in range(utils.TABLE_SIZE):
        # Verifica quantas rainhas estão atacando a posição atual
        queensAttacking = utils.WEIGHTS[row][i]
        
        print()
        utils.printTable(row, i)

        if config.stepByStep:
            input()

        if config.printInfo:
            print("Rainhas atacando posição {} ({}, {}){}: {}".format(utils.bColors.BLUE, row, i, utils.bColors.ENDC, queensAttacking))


        steps += 1

        if queensAttacking == 0:
            # Se não tem rainhas atacando a posição atual, coloca uma rainha nela

            utils.TABLE[row][i] = 'Q'
            utils.WEIGHTS[row][i] = float('inf')

            if config.printInfo:
                print("Coloquei a rainha na posição ({}, {})".format(row, i))

            # Verifica se todas as N rainhas foram colocadas
            if howManyQueensPlaced() == utils.QUEENS_QTD:
                utils.printTable()
                print("Todas as rainhas foram colocadas!")
                return True

            # Verifica a proxima linha que está livre de rainhas
            nextRow = row + 1
            while nextRow < utils.TABLE_SIZE and utils.checkIfRowIsSafe(nextRow) != 0:
                nextRow += 1

            if nextRow == utils.TABLE_SIZE:
                # Se a próxima linha não existir, significa que não é possível colocar mais rainhas
                return False

            # Chama recursivamente para colocar a próxima rainha
            if resolve(nextRow) == True:
                return True

        else:
            if i == utils.TABLE_SIZE - 1:
                # Se a rainha não puder ser colocada, coloca a rainha na posição com menor peso,
                # remove a rainha da posição que está atacando e chama recursivamente para colocar a próxima rainha

                # Pega a posição com menor peso
                minWeight = float('inf')
                minWeightCol = 0
                print('Como não houve posição livre, buscando por posição com menor peso')

                for x in range(utils.TABLE_SIZE):
                    # Posição com menor peso e que não foi atacada pela última rainha colocada
                    if utils.WEIGHTS[row][x] < minWeight and not checkIfSpotWasAttacked(row, x, lastQueenPutPositionX, lastQueenPutPositionY):
                        minWeight = utils.WEIGHTS[row][x]
                        minWeightCol = x

                if config.printInfo:
                    print('Posição com menor peso: ({}, {})'.format(row, minWeightCol))

                # Coloca a rainha na posição com menor peso
                utils.TABLE[row][minWeightCol] = 'Q'

                # Verifica qual a posição da rainha que está atacando a posição com menor peso
                lastQueenPositionX, lastQueenPositionY = getPositionQueensBeingAttacked(
                    row, minWeightCol)

                if config.printInfo:
                    print("Rainha que está atacando a posição ({}, {}): ({}, {})".format(
                        row, minWeightCol, lastQueenPositionX, lastQueenPositionY))

                # Atualiza a posição da última rainha colocada
                lastQueenPutPositionX = row
                lastQueenPutPositionY = minWeightCol

                # Remove a rainha da posição que está atacando aquela posição
                utils.TABLE[lastQueenPositionX][lastQueenPositionY] = 0

                # Chama recursivamente para colocar a próxima rainha, salvando a posição da rainha que está sendo analisada e a posição da última rainha colocada
                if resolve(lastQueenPositionX,
                           lastQueenPositionX, lastQueenPositionY,
                           lastQueenPutPositionX, lastQueenPutPositionY) == True:
                    return True

    # Se nenhuma rainha puder ser colocada em nenhuma linha e coluna, retorna falso
    return False


def main():
    if resolve(0) == False:
        utils.printTable()
        print("Não posso continuar daqui")
        return False

    print("Steps: ", steps)
# ! ------------------


main()
