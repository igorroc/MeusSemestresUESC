import matplotlib.pyplot as plt
import numpy as np
from utils.equation import Equation


def plotHistory(equation: Equation, a: float, b: float, history: list, zero: float):
    x = np.linspace(a, b, 100)
    y = equation.calculate_many(x)

    plt.plot(x, y, label=f"{equation}")

    for i in range(len(history)):
        plt.plot(
            history[i][6],
            history[i][7],
            "ro",
        )

    plt.plot(0, zero, "x", label=f"Zero: {zero}")
    plt.title("Gráfico da Equação")
    plt.xlabel("x")
    plt.ylabel("y")
    plt.axhline(0, color="black", linewidth=0.5)
    plt.axvline(0, color="black", linewidth=0.5)
    plt.legend()
    plt.show()
