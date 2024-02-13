import numpy as np

def verify_matrix(A, b):
    n = A.shape[0]
    if A.shape[1] != n:
        raise ValueError("A matriz A não é quadrada.")
    if len(b) != n:
        raise ValueError("O vetor b não tem o tamanho adequado para a matriz A.")

def solve_linear_system(A, b):
    n = A.shape[0]
    x = np.zeros(n)
    x[0] = b[0] / A[0, 0]

    for i in range(1, n):
        ratio = A[i, i-1] / A[i-1, i-1]
        A[i, i] -= ratio * A[i-1, i]
        b[i] -= ratio * b[i-1]
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
        verify_matrix(A, b)
    except ValueError as e:
        print(e)
        return

    solution = solve_linear_system(A, b)
    
    print("Resultado utilizando o método de Diferenças Finitas:")
    print(solution)

    np.savetxt("saidas/diferencas_finitas.txt", solution, fmt='%.8f', delimiter=', ')

if __name__ == "__main__":
    run()
