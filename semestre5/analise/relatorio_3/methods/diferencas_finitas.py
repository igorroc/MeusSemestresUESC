import numpy as np

def checkMatrix(A, b):
    n = A.shape[0]
    if n != A.shape[1]:
        raise ValueError("A matriz A não é quadrada.")
    if n != b.shape[0]:
        raise ValueError("O vetor b não tem o tamanho adequado para a matriz A.")

def solveEquation(A, b):
    n = A.shape[0]
    x = np.zeros(n)
    x[0] = b[0] / A[0, 0]

    for i in range(1, n):
        m = A[i, i-1] / A[i-1, i-1]
        A[i, i] -= m * A[i-1, i]
        b[i] -= m * b[i-1]
        x[i] = b[i] / A[i, i]

    for i in range(n-2, -1, -1):
        x[i] = (b[i] - A[i, i+1] * x[i+1]) / A[i, i]

    return x

def run():
    data = np.loadtxt("entradas/diferencas_finitas.txt")
    if len(data.shape) == 1:
        A = data[:-1]
        b = data[-1]
    else:
        A = data[:, :-1]
        b = data[:, -1]

    try:
        checkMatrix(A, b)
    except ValueError as e:
        print(e)
        return

    solution = solveEquation(A, b)
    
    print("Solução pelo método de Diferenças finitas:")
    print(solution)

    # Salvar resultado em um arquivo de texto
    np.savetxt("saidas/diferencas_finitas.txt", solution, fmt='%.8f', delimiter=', ')

if __name__ == "__main__":
    run()