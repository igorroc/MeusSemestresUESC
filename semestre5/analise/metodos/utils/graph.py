import matplotlib.pyplot as plt
import numpy as np
from utils.equation import Equation


def plotHistory(equation: str, a: float, b: float, history: list, zero: float):
    equation = Equation(equation)
    
    x = np.linspace(a, b, 100)
    y = equation.calculate_many(x)

    plt.plot(x, y, label=f"{equation}")

    for i in range(len(history)):
        plt.plot(history[i][6], history[i][7], "x", color="lightblue")

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
