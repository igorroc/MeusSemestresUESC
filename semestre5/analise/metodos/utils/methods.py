from enum import Enum
from utils.equation import Equation


class Method(Enum):
    Bisseccao = "bisseccao"
    PosicaoFalsa = "posicao_falsa"
    NewtonRaphson = "newton_raphson"


METHOD_MAPPING = {i: method for i, method in enumerate(Method)}


def calculateByBisseccao(equation, a, b, epsilon, max_iterations):
    print(f"Calculando por Bisseccao: {equation}")
    equation = Equation(equation)
    a = float(a)
    b = float(b)
    left = a
    right = b
    epsilon = float(epsilon)
    zero = None

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

    if zero is None:
        print(
            f"Nenhum zero encontrado para a equação {equation} no intervalo ({left}, {right})\n"
        )
    else:
        print(f"Zero encontrado: {zero} em {len(history)} iterações\n")
    return zero, history


def calculateByPosicaoFalsa(equation, a, b, epsilon, max_iterations):
    print(f"Calculando por Posição Falsa: {equation}")
    equation = Equation(equation)
    a = float(a)
    b = float(b)
    left = a
    right = b
    epsilon = float(epsilon)
    zero = None

    history = []

    for k in range(max_iterations):
        f_a = equation.calculate(a)
        f_b = equation.calculate(b)
        b_a = b - a

        c = (a * f_b - b * f_a) / (f_b - f_a)
        f_c = equation.calculate(c)

        print(f"c: {c}, f_c: {f_c} ")

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
            f"Nenhum zero encontrado para a equação {equation} no intervalo ({left}, {right})\n"
        )
    else:
        print(f"Zero encontrado: {zero} em {len(history)} iterações\n")

    return zero, history


def calculateByNewtonRaphson(equation, a, epsilon, max_iterations):
    print(f"Calculando por Posição Falsa: {equation}")
    equation = Equation(equation)
    derivative = Equation(equation.derivative())
    a = float(a)
    start = a
    epsilon = float(epsilon)
    zero = None

    history = []

    print(f"Derivada de {equation} = {derivative}")
