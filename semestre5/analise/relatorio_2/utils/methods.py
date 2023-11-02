from enum import Enum
from utils.equation import Equation
import numpy as np
from sympy import symbols, solve, tan, cos
from sympy import sympify, symbols, Symbol
import sympy as sp 

import utils.outputs as outputs
class Method(Enum):
    RegressaoLinear = "regressao_linear"
    RegressaoQuadratica = "regressao_quadratica"
    MMQ = "mmq"
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
    x, y = normalize_data(x, y)
    
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

def solve_by_mmq(x, y):
    n = len(x)
    sum_x = np.sum(x)
    sum_y = np.sum(y)
    sum_x_squared = np.sum(x**2)
    sum_xy = np.sum(x * y)
    
    a = (n * sum_xy - sum_x * sum_y) / (n * sum_x_squared - sum_x**2)
    b = (sum_y - a * sum_x) / n
    
    print(f"Parâmetros encontrados: a = {a}, b = {b}")
    
    return a, b

def solve_by_lagrange_interpolation(X, FX):
    # Número de pontos dados
    tamanho = len(X)
    
    # Inicializa o símbolo x para cálculos simbólicos
    symbolX = Symbol('x')
    
    # Inicializa a lista de polinômios Li(x)
    L = []
    
    # Loop para calcular cada Li(x)
    for i in range(tamanho):
        aux = np.arange(tamanho)
        aux = list(aux)
        aux.remove(i)

        numLi = 1
        denLi = 1

        for j in aux:
            numLi = numLi * (symbolX - X[j])
            denLi = denLi * (X[i] - X[j])
        Li = numLi/denLi

        L.append(sp.expand(Li))
    
    # Calcula o polinômio interpolador P(x)
    p = np.sum(FX*np.array(L))
    
    return p, symbolX

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
