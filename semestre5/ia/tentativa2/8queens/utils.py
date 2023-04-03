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
    for i in range(TABLE_SIZE):
        if TABLE[row][i] == 'Q':
            return False
    return True

def checkIfColumnIsSafe(column):
    for i in range(TABLE_SIZE):
        if TABLE[i][column] == 'Q':
            return False
    return True

def checkIfDiagonalIsSafe(row, column):
    for i, j in zip(range(row, -1, -1), range(column, -1, -1)):
        if TABLE[i][j] == 'Q':
            return False
        
    for i, j in zip(range(row, TABLE_SIZE, 1), range(column, -1, -1)):
        if TABLE[i][j] == 'Q':
            return False
        
    return True
