from enum import Enum
from utils.equation import Equation


class Method(Enum):
    Bisseccao = "bisseccao"
    PosicaoFalsa = "posicao_falsa"
    NewtonRaphson = "newton_raphson"
    Secante = "secante"


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
            f"Nenhum zero encontrado para a equação {equation} no intervalo ({left}, {right})\n"
        )
    else:
        print(f"Zero encontrado: {zero} em {len(history)} iterações\n")
    return zero, history


def calculateByPosicaoFalsa(equation, a, b, epsilon, max_iterations):
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
            f"Nenhum zero encontrado para a equação {equation} no intervalo ({left}, {right})\n"
        )
    else:
        print(f"Zero encontrado: {zero} em {len(history)} iterações\n")

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
            f"Nenhum zero encontrado para a equação {equation} começando no ponto ({start})\n"
        )
    else:
        print(f"Zero encontrado: {zero} em {len(history)} iterações\n")

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

        if abs(f_step_next) <= epsilon:
            zero = step_next
            break

        aux = step_next
        step_next = (f_step_next * step - f_step * step_next) / (f_step_next - f_step)
        step = aux

    if zero is None:
        print(
            f"Nenhum zero encontrado para a equação {equation} começando nos pontos ({left}, {right})\n"
        )
    else:
        print(f"Zero encontrado: {zero} em {len(history)} iterações\n")

    return zero, history
