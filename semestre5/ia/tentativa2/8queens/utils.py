QUEENS_QTD = 8
TABLE_SIZE = 8

TABLE = [[0 for x in range(TABLE_SIZE)] for y in range(TABLE_SIZE)]
WEIGHTS = [[0 for x in range(TABLE_SIZE)] for y in range(TABLE_SIZE)]


class bColors:
    HEADER = '\033[95m'
    BLUE = '\033[94m'
    CYAN = '\033[96m'
    GREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def colored_text(r, g, b, text):
    return "\033[38;2;{};{};{}m{} \033[38;2;255;255;255m".format(r, g, b, text)


def checkIfRowIsSafe(row):
    howManyQueens = 0
    for i in range(TABLE_SIZE):
        if TABLE[row][i] == 'Q':
            howManyQueens += 1

    return howManyQueens


def checkIfColumnIsSafe(column):
    howManyQueens = 0
    for i in range(TABLE_SIZE):
        if TABLE[i][column] == 'Q':
            howManyQueens += 1

    return howManyQueens


def checkIfDiagonalIsSafe(row, column):
    howManyQueens = 0

    # Diagonal inferior direita
    for i, j in zip(range(row, -1, -1), range(column, -1, -1)):
        if TABLE[i][j] == 'Q':
            howManyQueens += 1

    # Diagonal superior direita
    for i, j in zip(range(row, TABLE_SIZE, 1), range(column, -1, -1)):
        if TABLE[i][j] == 'Q':
            howManyQueens += 1

    # Diagonal inferior esquerda
    for i, j in zip(range(row, -1, -1), range(column, TABLE_SIZE, 1)):
        if TABLE[i][j] == 'Q':
            howManyQueens += 1

    # Diagonal superior esquerda
    for i, j in zip(range(row, TABLE_SIZE, 1), range(column, TABLE_SIZE, 1)):
        if TABLE[i][j] == 'Q':
            howManyQueens += 1

    return howManyQueens

def printTable(currentRow=-1, currentCol=-1):
    for i in range(TABLE_SIZE):
        for j in range(TABLE_SIZE):
            # Se a posição atual tiver peso 0, ela é da cor verde
            text = bColors.GREEN + '0' + bColors.ENDC

            # Se a posição atual tiver peso maior que 0, ela é da cor vermelha
            if WEIGHTS[i][j] > 0:
                # Se foi a ultima rainha a ser apagada, ela é um X
                if WEIGHTS[i][j] == float('inf'):
                    text = bColors.FAIL + bColors.UNDERLINE + bColors.BOLD + \
                    "X" + bColors.ENDC
                else:
                    text = bColors.FAIL + \
                    str(WEIGHTS[i][j]) + bColors.ENDC

            # Se a posição atual estiver sendo analisada, ela é da cor azul
            if currentRow == i and currentCol == j:
                if WEIGHTS[i][j] == float('inf'):
                    text = bColors.BLUE + bColors.UNDERLINE + bColors.BOLD + \
                    "X" + bColors.ENDC
                else:
                    text = bColors.BLUE + \
                    str(WEIGHTS[i][j]) + bColors.ENDC

            # Se a posição atual tiver uma rainha, ela é da cor amarela
            if TABLE[i][j] == 'Q':
                text = bColors.WARNING + bColors.BOLD + \
                    'Q' + bColors.ENDC

            print(text, end=' ')

        print()


def cleanWeights(lastQueenPositionX, lastQueenPositionY):
    for i in range(TABLE_SIZE):
        for j in range(TABLE_SIZE):
            # Se a posição atual for a posição da ultima rainha colocada, ela tem um peso maior
            if i == lastQueenPositionX and j == lastQueenPositionY:
                WEIGHTS[i][j] = float('inf')
            else:
                WEIGHTS[i][j] = 0


def checkWeight(lastQueenPositionX, lastQueenPositionY):
    cleanWeights(lastQueenPositionX, lastQueenPositionY)

    # Verifica todas as posições da tabela, e atribui um peso para cada uma
    # de acordo com a quantidade de rainhas que atacam aquela posição
    for i in range(TABLE_SIZE):
        for j in range(TABLE_SIZE):
            if TABLE[i][j] != 'Q':
                WEIGHTS[i][j] += checkIfColumnIsSafe(j)

                WEIGHTS[i][j] += checkIfRowIsSafe(i)

                WEIGHTS[i][j] += checkIfDiagonalIsSafe(i, j)
