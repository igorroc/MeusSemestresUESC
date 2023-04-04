# Algoritmo: 8 Rainhas com pesos
# Autores: Beatriz Pereira, Igor Rocha, Thalles Cerqueira

import utils

steps = 0


class config:
    stepByStep = False  # Se True, o programa irá esperar o usuário apertar enter para continuar
    printInfo = False  # Se True, o programa irá imprimir informações sobre o processo


def printTable(row=-1, col=-1):
    for i in range(utils.TABLE_SIZE):
        for j in range(utils.TABLE_SIZE):
            text = utils.bColors.GREEN + '0' + utils.bColors.ENDC

            if utils.WEIGHTS[i][j] > 0:
                text = utils.bColors.FAIL + \
                    str(utils.WEIGHTS[i][j]) + utils.bColors.ENDC

            if row == i and col == j:
                text = utils.bColors.BLUE + \
                    str(utils.WEIGHTS[i][j]) + utils.bColors.ENDC

            if utils.TABLE[i][j] == 'Q':
                text = utils.bColors.WARNING + utils.bColors.BOLD + \
                    'Q' + utils.bColors.ENDC

            print(text, end=' ')

        print()


def isSafe(row, col):
    # Verifica se a rainha pode ser colocada na tabela
    if utils.WEIGHTS[row][col] != 0:
        return False

    return True


def cleanWeights(lastQueenPositionX, lastQueenPositionY):
    for i in range(utils.TABLE_SIZE):
        for j in range(utils.TABLE_SIZE):
            if i == lastQueenPositionX and j == lastQueenPositionY:
                utils.WEIGHTS[i][j] = 6
            else:
                utils.WEIGHTS[i][j] = 0


def checkWeight(lastQueenPositionX, lastQueenPositionY):
    # Verifica todas as posições da tabela, e atribui um peso para cada uma
    # de acordo com a quantidade de rainhas que atacam aquela posição
    cleanWeights(lastQueenPositionX, lastQueenPositionY)

    for i in range(utils.TABLE_SIZE):
        for j in range(utils.TABLE_SIZE):
            if utils.TABLE[i][j] != 'Q':
                utils.WEIGHTS[i][j] += utils.checkIfColumnIsSafe(j)

                utils.WEIGHTS[i][j] += utils.checkIfRowIsSafe(i)

                utils.WEIGHTS[i][j] += utils.checkIfDiagonalIsSafe(i, j)


def getPositionQueensBeingAttacked(row, col):
    # Verifica a posição das rainhas que estão atacando a posição passada
    positions = []

    # Coluna
    for i in range(utils.TABLE_SIZE):
        if (i == row and col == col):
            continue
        if utils.TABLE[i][col] == 'Q':
            positions.append([i, col])

    # Diagonal inferior direita
    for i, j in zip(range(row, -1, -1), range(col, -1, -1)):
        if (i == row and j == col):
            continue
        if utils.TABLE[i][j] == 'Q':
            positions.append([i, j])

    # Diagonal superior direita
    for i, j in zip(range(row, utils.TABLE_SIZE, 1), range(col, -1, -1)):
        if (i == row and j == col):
            continue
        if utils.TABLE[i][j] == 'Q':
            positions.append([i, j])

    # Diagonal inferior esquerda
    for i, j in zip(range(row, -1, -1), range(col, utils.TABLE_SIZE, 1)):
        if (i == row and j == col):
            continue
        if utils.TABLE[i][j] == 'Q':
            positions.append([i, j])

    # Diagonal superior esquerda
    for i, j in zip(range(row, utils.TABLE_SIZE, 1), range(col, utils.TABLE_SIZE, 1)):
        if (i == row and j == col):
            continue
        if utils.TABLE[i][j] == 'Q':
            positions.append([i, j])

    if config.printInfo:
        print("Posições atacantes: ", positions)

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
    print()
    # Todas as rainhas foram colocadas
    if row >= utils.QUEENS_QTD:
        return True

    # Coloca peso em todas as casas da tabela
    checkWeight(lastQueenPositionX, lastQueenPositionY)

    # Tenta colocar uma rainha em todas as colunas
    for i in range(utils.TABLE_SIZE):
        queensAttacking = utils.WEIGHTS[row][i]
        if config.printInfo:
            print("Rainhas atacando posição (" + str(row) +
                  ", " + str(i) + "): " + str(queensAttacking))

        # Verifica se a rainha pode ser colocada na tabela
        printTable(row, i)

        if config.stepByStep:
            input("\n→\n")
        else:
            print("\n\n")

        global steps
        steps += 1

        if queensAttacking == 0:
            # Espera pelo enter do usuário

            utils.TABLE[row][i] = 'Q'
            utils.WEIGHTS[row][i] = float('inf')

            if config.printInfo:
                print("Coloquei a rainha na posição ({}, {})".format(row, i))

            # Verifica se todas as N rainhas foram colocadas
            if howManyQueensPlaced() == utils.QUEENS_QTD:
                printTable()
                print("Todas as rainhas foram colocadas!")
                return True

            # Verifica a proxima linha que está livre de rainhas
            nextRow = row + 1
            while nextRow < utils.TABLE_SIZE and utils.checkIfRowIsSafe(nextRow) != 0:
                nextRow += 1

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

                for x in range(utils.TABLE_SIZE):
                    if utils.WEIGHTS[row][x] < minWeight and not checkIfSpotWasAttacked(row, x, lastQueenPutPositionX, lastQueenPutPositionY):
                        minWeight = utils.WEIGHTS[row][x]
                        minWeightCol = x

                if config.printInfo:
                    print('Coluna com menor peso: ' + str(minWeightCol))

                # Coloca a rainha na posição com menor peso
                utils.TABLE[row][minWeightCol] = 'Q'

                # Verifica qual a posição da rainha que está atacando a posição com menor peso
                lastQueenPositionX, lastQueenPositionY = getPositionQueensBeingAttacked(
                    row, minWeightCol)

                if config.printInfo:
                    print("Rainha que está atacando a posição ({}, {}): ({}, {})".format(
                        row, minWeightCol, lastQueenPositionX, lastQueenPositionY))

                lastQueenPutPositionX = row
                lastQueenPutPositionY = minWeightCol

                # Remove a rainha da posição que está atacando aquela posição
                utils.TABLE[lastQueenPositionX][lastQueenPositionY] = 0

                # Chama recursivamente para colocar a próxima rainha
                if resolve(lastQueenPositionX,
                           lastQueenPositionX, lastQueenPositionY,
                           lastQueenPutPositionX, lastQueenPutPositionY) == True:
                    return True

    # Se nenhuma rainha puder ser colocada em nenhuma linha e coluna, retorna falso
    return False


def main():
    utils.TABLE = [
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0]]

    utils.WEIGHTS = [
        [0 for x in range(utils.TABLE_SIZE)]
        for y in range(utils.TABLE_SIZE)]

    if resolve(0) == False:
        printTable()
        print("Não posso continuar daqui")
        return False

    print("Steps: ", steps)
# ! ------------------


main()
