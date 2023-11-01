from enum import Enum
from utils.equation import Equation
import numpy as np

import utils.outputs as outputs


class Method(Enum):
    RegressaoLinear = "regressao_linear"


METHOD_MAPPING = {i: method for i, method in enumerate(Method)}


def solve_by_bisseccao(equation, a, b, epsilon, max_iterations):
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

def solve_by_linear_regression(x,y):
    # Calcular a média de x e y
    mean_x = np.mean(x)
    mean_y = np.mean(y)

    # Calcular os parâmetros a e b
    a = np.sum((x - mean_x) * (y - mean_y)) / np.sum((x - mean_x)**2)
    b = mean_y - a * mean_x

    # Calcular o Erro Quadrático Médio (EQM)
    EQM = np.mean((y - (a * x + b))**2)

    print(f"Parâmetros encontrados: a = {a}, b = {b}")
    print(f"Erro Quadrático Médio: {EQM}")

    return a, b, EQM