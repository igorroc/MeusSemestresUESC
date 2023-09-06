from enum import Enum
from utils.equation import Equation
from utils.graph import plotHistory


class Method(Enum):
    Bisseccao = "bisseccao"
    PosicaoFalsa = "posicao_falsa"


def calculateByBisseccao(equation, a, b, epsilon, max_iterations):
    print(f"Calculando por Bisseccao: {equation}")
    equation = Equation(equation)
    a = float(a)
    b = float(b)
    epsilon = float(epsilon)
    zero = None
    left = a
    right = b

    history = []

    for k in range(max_iterations):
        c = (a + b) / 2
        f_c = equation.calculate(c)
        f_a = equation.calculate(a)
        f_b = equation.calculate(b)
        b_a = b - a

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

    plotHistory(equation, left, right, history, zero)
    

    return zero, history
