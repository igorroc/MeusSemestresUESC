from enum import Enum
from utils.equation import Equation
import numpy as np
import pandas as pd


class Method(Enum):
    Bisseção = "bisseccao"
    PosiçãoFalsa = "posicao_falsa"
    NewtonRaphson = "newton_raphson"
    Secante = "secante"
    EliminaçãoGauss = "eliminacao_gauss"
    LU = "lu"
    Jacobi = "jacobi"
    GaussSeidel = "gauss_seidel"


METHOD_MAPPING = {i: method for i, method in enumerate(Method)}


def calculateByBisseccao(equation, a, b, epsilon, max_iterations):
    zero = None
    history = []

    equation = Equation(equation)
    a = float(a)
    b = float(b)
    left = a
    right = b
    epsilon = float(epsilon)

    print(f"Equação: {equation}")
    print(f"Intervalo: ({a}, {b})")
    print(f"Tolerância: {epsilon}")

    for k in range(max_iterations):
        f_a = equation.calculate(a)
        f_b = equation.calculate(b)

        b_a = b - a

        c = (a + b) / 2
        f_c = equation.calculate(c)

        history.append([k, a, b, f_a, f_b, b_a, c, f_c])

        if abs(f_a) <= epsilon:
            zero = a
            break

        if abs(f_b) <= epsilon:
            zero = b
            break

        if abs(f_c) <= epsilon:
            zero = c
            break

        if f_a * f_c < 0:
            b = c
        else:
            a = c

    if zero is None:
        print(
            f"Nenhum zero encontrado para a equação {equation} no intervalo ({left}, {right})"
        )
    else:
        print(f"Zero encontrado: {zero} em {len(history)} iterações")
    return zero, history


def calculateByPosiçãoFalsa(equation, a, b, epsilon, max_iterations):
    zero = None
    history = []

    equation = Equation(equation)
    a = float(a)
    b = float(b)
    left = a
    right = b
    epsilon = float(epsilon)

    print(f"Equação: {equation}")
    print(f"Intervalo: ({a}, {b})")
    print(f"Tolerância: {epsilon}")

    for k in range(max_iterations):
        f_a = equation.calculate(a)
        f_b = equation.calculate(b)

        b_a = b - a

        c = (a * f_b - b * f_a) / (f_b - f_a)
        f_c = equation.calculate(c)

        history.append([k, a, b, f_a, f_b, b_a, c, f_c])

        if abs(f_a) <= epsilon:
            zero = a
            break

        if abs(f_b) <= epsilon:
            zero = b
            break

        if abs(f_c) <= epsilon:
            zero = c
            break

        if f_a * f_c < 0:
            b = c
        else:
            a = c

    if zero is None:
        print(
            f"Nenhum zero encontrado para a equação {equation} no intervalo ({left}, {right})"
        )
    else:
        print(f"Zero encontrado: {zero} em {len(history)} iterações")

    return zero, history


def calculateByNewtonRaphson(equation, a, epsilon, max_iterations):
    zero = None
    history = []

    equation = Equation(equation)
    step = float(a)
    start = step
    epsilon = float(epsilon)

    print(f"Equação: {equation}")
    print(f"Ponto inicial: ({a})")
    print(f"Tolerância: {epsilon}")

    for k in range(max_iterations):
        f_step = equation.calculate(step)
        derivative = Equation(equation.derivative()).calculate(step)

        history.append([k, step, f_step, derivative])

        if abs(f_step) <= epsilon:
            zero = step
            break

        if abs(derivative) == 0:  # Verifique se a derivada é muito próxima de zero
            step += 5
        else:
            step = step - (f_step / derivative)

    if zero is None:
        print(
            f"Nenhum zero encontrado para a equação {equation} começando no ponto ({start})"
        )
    else:
        print(f"Zero encontrado: {zero} em {len(history)} iterações")

    return zero, history


def calculateBySecante(equation, a, b, epsilon, max_iterations):
    zero = None
    history = []

    equation = Equation(equation)
    step = float(a)
    step_next = float(b)
    left = step
    right = step_next
    epsilon = float(epsilon)

    print(f"Equação: {equation}")
    print(f"Pontos iniciais: ({a}, {b})")
    print(f"Tolerância: {epsilon}")

    for k in range(max_iterations):
        f_step = equation.calculate(step)
        f_step_next = equation.calculate(step_next)

        history.append([k, step, f_step, step_next, f_step_next])

        if abs(f_step) <= epsilon:
            zero = step
            break

        aux = step_next
        step_next = (f_step_next * step - f_step * step_next) / (f_step_next - f_step)
        step = aux

    if zero is None:
        print(
            f"Nenhum zero encontrado para a equação {equation} começando nos pontos ({left}, {right})"
        )
    else:
        print(f"Zero encontrado: {zero} em {len(history)} iterações")

    return zero, history


def calculateByEliminaçãoGauss(index, X, y):
    X = np.array(X, dtype=float)
    y = np.array(y, dtype=float)

    # Criar um DataFrame com os valores antes do cálculo
    data = {f"X_{i+1}": X[:, i] for i in range(len(X[0]))}
    data["b"] = y
    df = pd.DataFrame(data)

    # Imprimir os valores antes do cálculo
    print(f"Sistema de equações ({index}):")
    print(df)

    n = len(y)

    # Montar a matriz aumentada [X|y]
    augmented_matrix = np.column_stack((X, y))

    # Aplica o método de eliminação de Gauss
    for pivot_row in range(n):
        # Encontra o pivô
        pivot = augmented_matrix[pivot_row, pivot_row]

        if pivot == 0:
            print("Pivô zero encontrado, o sistema não está preparado para isso.")
            return None

        # Normaliza a linha do pivô
        augmented_matrix[pivot_row, :] /= pivot

        # Elimina os elementos abaixo do pivô
        for i in range(pivot_row + 1, n):
            factor = augmented_matrix[i, pivot_row]
            augmented_matrix[i, :] -= factor * augmented_matrix[pivot_row, :]

    # Resolve as equações a partir da parte triangular superior da matriz
    x = np.zeros(n)
    for i in range(n - 1, -1, -1):
        x[i] = float(
            augmented_matrix[i, -1]
            - np.sum(augmented_matrix[i, i + 1 : n] * x[i + 1 :])
        )

    print(
        f"Os valores de X são: {np.array2string(x, separator=', ', formatter={'all': lambda x: f'{x:.8f}'})}"
    )

    return x


def calculateByLU(index, A, b):
    X_only_show = np.array(A)
    y_only_show = np.array(b)
    L, U = LU_factorization(A)

    n = len(A)

    y = np.zeros(n)
    x = np.zeros(n)

    # Criar um DataFrame com os valores antes do cálculo
    data = {f"X_{i+1}": X_only_show[:, i] for i in range(len(X_only_show[0]))}
    data["b"] = y_only_show
    df = pd.DataFrame(data)

    # Imprimir os valores antes do cálculo
    print(f"Sistema de equações ({index}):")
    print(df)

    # Solve Ly = b
    for i in range(n):
        y[i] = b[i]
        for j in range(i):
            y[i] -= L[i][j] * y[j]

    # Solve Ux = y
    for i in range(n - 1, -1, -1):
        x[i] = y[i]
        for j in range(i + 1, n):
            x[i] -= U[i][j] * x[j]
        x[i] /= U[i][i]

    print(
        f"Os valores de X são: {np.array2string(x, separator=', ', formatter={'all': lambda x: f'{x:.8f}'})}"
    )

    return x


def LU_factorization(A):
    n = len(A)
    L = np.zeros((n, n))
    U = np.zeros((n, n))

    for i in range(n):
        L[i][i] = 1

    for k in range(n):
        U[k][k] = A[k][k]

        for i in range(k + 1, n):
            L[i][k] = A[i][k] / U[k][k]
            U[k][i] = A[k][i]

        for i in range(k + 1, n):
            for j in range(k + 1, n):
                A[i][j] -= L[i][k] * U[k][j]

    return L, U


def calculateByJacobi(index, A, b):
    epsilon = 1e-10
    max_iterations = 1000

    A = np.array(A, dtype=float)
    b = np.array(b, dtype=float)

    X_only_show = A
    y_only_show = b

    # Criar um DataFrame com os valores antes do cálculo
    data = {f"X_{i+1}": X_only_show[:, i] for i in range(len(X_only_show[0]))}
    data["b"] = y_only_show
    df = pd.DataFrame(data)

    # Imprimir os valores antes do cálculo
    print(f"Sistema de equações ({index}):")
    print(df)

    n = A.shape[0]

    # Inicialização do vetor solução
    x = np.zeros(A.shape[0])

    # Loop principal para as iterações do método
    for k in range(max_iterations):
        # Vetor para armazenar os novos valores de x
        x_new = np.zeros(n)

        # Loop para calcular cada componente de x
        for i in range(n):
            # Calcula a soma dos termos a_ij * x_j para j != i
            s = np.sum(A[i, :i] * x[:i]) + np.sum(A[i, i + 1 :] * x[i + 1 :])

            # Atualiza o valor de x_i usando a fórmula de Jacobi
            x_new[i] = (b[i] - s) / A[i, i]

        # Verifica o critério de parada
        if np.linalg.norm(x_new - x, np.inf) < epsilon:
            x = x_new
            break

        # Atualiza o vetor x para a próxima iteração
        x = x_new

    print(
        f"Os valores de X são: {np.array2string(x, separator=', ', formatter={'all': lambda x: f'{x:.8f}'})}"
    )
    return x


def calculateByGaussSeidel(index, A, b):
    epsilon = 1e-10
    max_iterations = 1000

    A = np.array(A, dtype=float)
    b = np.array(b, dtype=float)

    X_only_show = A
    y_only_show = b

    # Criar um DataFrame com os valores antes do cálculo
    data = {f"X_{i+1}": X_only_show[:, i] for i in range(len(X_only_show[0]))}
    data["b"] = y_only_show
    df = pd.DataFrame(data)

    # Imprimir os valores antes do cálculo
    print(f"Sistema de equações ({index}):")
    print(df)

    n = A.shape[0]

    # Inicialização do vetor solução
    x = np.zeros(A.shape[0])

    # Loop principal para as iterações do método
    for k in range(max_iterations):
        # Vetor para armazenar os novos valores de x
        x_new = np.zeros(n)

        # Loop para calcular cada componente de x
        for i in range(n):
            # Calcula a soma dos termos a_ij * x_j para j != i
            # ! Já usa o X_new
            s = np.sum(A[i, :i] * x_new[:i]) + np.sum(A[i, i + 1 :] * x[i + 1 :])

            # Atualiza o valor de x_i usando a fórmula de Jacobi
            x_new[i] = (b[i] - s) / A[i, i]

        # Verifica o critério de parada
        if np.linalg.norm(x_new - x, np.inf) < epsilon:
            x = x_new
            break

        # Atualiza o vetor x para a próxima iteração
        x = x_new

    print(
        f"Os valores de X são: {np.array2string(x, separator=', ', formatter={'all': lambda x: f'{x:.8f}'})}"
    )
    return x
