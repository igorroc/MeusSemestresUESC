import matplotlib.pyplot as plt
import numpy as np
from utils.equation import Equation


def plotHistory(equation: str, a: float, b: float, history: list, zero: float):
    equation = Equation(equation)

    x = np.linspace(a, b, 100)
    y = equation.calculate_many(x)

    plt.plot(x, y, label=f"{equation}")

    for i in range(len(history)):
        plt.plot(history[i][6], history[i][7], "x", color="blue")

    if zero is not None:
        plt.plot(zero, 0, "o", label=f"Zero: {zero}", color="red")

    plt.title("Gráfico da Equação")
    plt.xlabel("x")
    plt.ylabel("y")

    if a < b:
        plt.xlim(a, b)

    plt.axhline(0, color="black", linewidth=0.5)
    plt.axvline(0, color="black", linewidth=0.5)
    plt.legend()
    plt.show()


def plotHistoryStep(equation: str, a: float, history: list, zero: float):
    equation = Equation(equation)

    b = 1.5 * a

    x = np.linspace(a - b, a + b, 100)
    y = equation.calculate_many(x)

    plt.plot(x, y, label=f"{equation}")

    for i in range(len(history)):
        plt.plot(history[i][1], history[i][2], "x", color="blue")

    if zero is not None:
        plt.plot(zero, 0, "o", label=f"Zero: {zero}", color="red")

    plt.title("Gráfico da Equação")
    plt.xlabel("x")
    plt.ylabel("y")

    plt.axhline(0, color="black", linewidth=0.5)
    plt.axvline(0, color="black", linewidth=0.5)
    plt.legend()
    plt.show()


def plotLines(A, b):
    A = np.array(A)
    b = np.array(b)

    n = len(A)

    for i in range(n):
        # Converte a linha i de a e o valor correspondente em b em arrays NumPy
        coeficientes = np.array(A[i])
        # Valores de x para o gráfico
        x_values = np.linspace(-10, 10, 100)

        # Valores de y calculados a partir da equação
        y_values = [np.dot(coeficientes, x) + b[i] for x in x_values]

        # Plota a equação
        plt.plot(x_values, y_values, label=f"Equação {i + 1}: {coeficientes}x = {b[i]}")

    # Configurações do gráfico
    plt.xlabel("x")
    plt.ylabel("y")
    plt.title("Gráfico das Equações")
    plt.legend()
    plt.grid(True)
    plt.show()
