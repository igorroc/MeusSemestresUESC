from enum import Enum
from utils.equation import Equation


class Method(Enum):
    Bisseccao = "bisseccao"
    PosicaoFalsa = "posicao_falsa"
    NewtonRaphson = "newton_raphson"


METHOD_MAPPING = {i: method for i, method in enumerate(Method)}


def calculateByBisseccao(equation, a, b, epsilon, max_iterations):
    print(f"Equação: {equation}")
    print(f"Intervalo: ({a}, {b})")
    print(f"Tolerância: {epsilon}")
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
    print(f"Equação: {equation}")
    print(f"Ponto inicial: ({a})")
    equation = Equation(equation)
    step = float(a)
    start = step
    epsilon = float(epsilon)
    zero = None

    history = []

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
            f"Nenhum zero encontrado para a equação {equation} começando no ponto ({start})\n"
        )
    else:
        print(f"Zero encontrado: {zero} em {len(history)} iterações\n")

    return zero, history
