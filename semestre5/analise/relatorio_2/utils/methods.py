from enum import Enum
from utils.equation import Equation
import numpy as np
from sympy import symbols, solve, tan, cos
from sympy import sympify, symbols

import utils.outputs as outputs
class Method(Enum):
    RegressaoLinear = "regressao_linear"
    RegressaoQuadratica = "regressao_quadratica"
    InterpolacaoLagrange = "interpolacao_lagrange"
    TrapezioSimples = "trapezio_simples"
    TrapezioMultiplo = "trapezio_multiplo"
    DerivadaPrimeira = "derivada_primeira"
    DerivadaSegunda = "derivada_segunda"


METHOD_MAPPING = {i: method for i, method in enumerate(Method)}

def normalize_data(X, Y):
    X_min, X_max = np.min(X), np.max(X)
    Y_min, Y_max = np.min(Y), np.max(Y)

    X_norm = (X - X_min) / (X_max - X_min)
    Y_norm = (Y - Y_min) / (Y_max - Y_min)

    return X_norm, Y_norm

def normalize_single_value(value, column_data):
    min_value = np.min(column_data)
    max_value = np.max(column_data)
    return (value - min_value) / (max_value - min_value)

def denormalize_single_value(normalized_value, column_data):
    min_value = np.min(column_data)
    max_value = np.max(column_data)
    return normalized_value * (max_value - min_value) + min_value


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

def solve_by_quadratic_regression(x, y):
    x, y = normalize_data(x, y)
    # Construir a matriz X para equações normais
    X = np.column_stack((x**2, x, np.ones(x.shape)))

    # Resolver as equações normais
    params = np.linalg.inv(X.T.dot(X)).dot(X.T).dot(y)

    a, b, c = params

    # Calcular o Erro Quadrático Médio (EQM)
    EQM = np.mean((y - (a * x**2 + b * x + c))**2)

    print(f"Parâmetros encontrados: a = {a}, b = {b}, c = {c}")
    print(f"Erro Quadrático Médio: {EQM}")

    return a, b, c, EQM

def solve_by_lagrange_interpolation(x_values, y_values):
    try:
        x = symbols('x')
        n = len(x_values)
        if len(y_values) != n:
            raise ValueError("x_values and y_values should have the same length")

        # Initialize the polynomial as 0
        polynomial = 0

        # Calculate each term of the Lagrange polynomial
        for i in range(n):
            term = y_values[i]
            for j in range(n):
                if i != j:
                    term *= (x - x_values[j]) / (x_values[i] - x_values[j])
            polynomial += term

        print("1")
        # Simplify the polynomial
        polynomial = polynomial.simplify()

        # Constants for projectile motion
        g = 9.81  # acceleration due to gravity (m/s^2)
        psi, v0 = symbols('psi v0')

        print("2")
        # Extract coefficients from the polynomial
        coef_x2 = polynomial.coeff(x, 2)
        coef_x = polynomial.coeff(x, 1)
        print("3")

        # Equation for tan(psi)
        eq1 = tan(psi) - coef_x

        # Equation for (g / 2v0^2cos^2(psi))
        eq2 = (g / (2 * v0 ** 2 * cos(psi) ** 2)) - abs(coef_x2)
        print("4")

        # Solve for psi and v0
        solutions = solve((eq1, eq2), (psi, v0))
        print(solutions)
        
        psi_value, v0_value = solutions[0]
        print("6")

        return polynomial, psi_value, v0_value
    except:
        print("Erro ao calcular a interpolação de Lagrange")
        return None, None, None

def solve_by_trapezio_simples(equation_str, a, b):
    x = symbols('x') 
    f = sympify(equation_str)
    integral = (b - a) * (f.subs(x, a) + f.subs(x, b)) / 2
    return integral.evalf()

def solve_by_trapezio_multiplo(equation_str, a, b, n):
    x = symbols('x') 
    f = sympify(equation_str)
    h = (b - a) / n
    integral = f.subs(x, a) + f.subs(x, b)
    
    for i in range(1, n):
        integral += 2 * f.subs(x, a + i * h)

    integral *= h / 2
    return integral.evalf()

def solve_by_derivada_primeira(eq: str, xi: float, h: float) -> float:
    eq = Equation(eq)
    
    return (eq.calculate(xi + h) - eq.calculate(xi - h)) / (2 * h)

def solve_by_derivada_segunda(eq: str, xi: float, h: float) -> float:
    eq = Equation(eq)
    
    return (eq.calculate(xi + h) - 2 * eq.calculate(xi) + eq.calculate(xi - h)) / (h ** 2)

