from enum import Enum
from utils.equation import Equation
import numpy as np
from sympy import symbols
from sympy import sympify, symbols, Symbol
import sympy as sp 

class Method(Enum):
    RegressaoLinear = "regressao_linear"
    RegressaoQuadratica = "regressao_quadratica"
    MMQ = "mmq"
    InterpolacaoLagrange = "interpolacao_lagrange"
    DiferencaNewton = "diferenca_newton"
    TrapezioSimples = "trapezio_simples"
    TrapezioMultiplo = "trapezio_multiplo"
    DerivadaPrimeira = "derivada_primeira"
    DerivadaSegunda = "derivada_segunda"
    Simpson1_3 = "simpson_1_3"
    Simpson3_8 = "simpson_3_8"
    Richard = "richard"
    Gauss = "gauss"


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
    
    mean_x = np.mean(x)
    mean_y = np.mean(y)

    a = np.sum((x - mean_x) * (y - mean_y)) / np.sum((x - mean_x)**2)
    b = mean_y - a * mean_x

    EQM = np.mean((y - (a * x + b))**2)

    print(f"Parâmetros encontrados: a = {a}, b = {b}")
    print(f"Erro Quadrático Médio: {EQM}")

    return a, b, EQM

def solve_by_quadratic_regression(x, y):
    x, y = normalize_data(x, y)
    X = np.column_stack((x**2, x, np.ones(x.shape)))

    params = np.linalg.inv(X.T.dot(X)).dot(X.T).dot(y)

    a, b, c = params

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
    tamanho = len(X)
    
    symbolX = Symbol('x')
    
    L = []
    
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
    
    p = np.sum(FX*np.array(L))
    
    return p, symbolX

def solve_by_diferenca_newton(X, FX, x_lido):
    n = len(X)
    div_diff = np.zeros((n, n))
    div_diff[:,0] = FX

    for j in range(1, n):
        for i in range(n-j):
            div_diff[i][j] = (div_diff[i+1][j-1] - div_diff[i][j-1]) / (X[i+j] - X[i])
    
    p_interpolador = div_diff[0][0]
    for j in range(1, n):
        termo = div_diff[0][j]
        for i in range(j):
            termo *= (x_lido - X[i])
        p_interpolador += termo
    
    return p_interpolador

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

def solve_by_simpson_1_3(eq, a, b):
    func = Equation(eq)
    h = (b - a) / 2
    soma = func.calculate(a) + 4 * func.calculate((a + b) / 2) + func.calculate(b)
    
    return h * soma / 3

def solve_by_simpson_3_8(eq, a, b):
    func = Equation(eq)
    
    h = (b - a) / 3
    integral = (3 * h / 8) * (func(a) + 3 * func(a + h) + 3 * func(a + 2 * h) + func(b))
    return integral

def solve_by_richard(x, y, x_extrap):
    n = len(x)
    A = np.zeros((n, n))

    for i in range(n):
        A[i, 0] = 1
        for j in range(1, n):
            A[i, j] = A[i, j-1] * (x[i] - x[j-1])

    a = np.linalg.solve(A, y)

    y_extrap = [sum(a[j] * (xe - x[-1])**(j+1) for j in range(n)) for xe in x_extrap]

    return y_extrap

def solve_by_gauss(eq, a, b):
    x = Symbol('x')
    func = sympify(eq)

    # Coeficientes de Gauss
    coefficients = [-0.5773502692, 0.5773502692]

    # Pesos de Gauss
    weights = [1.0, 1.0]

    # Transformação dos limites a e b para [-1, 1]
    t = lambda u: ((b - a) * u + (b + a)) / 2.0

    # Fórmula de quadratura de Gauss
    integral = sum(weights[i] * func.subs(x, t(coefficients[i])) for i in range(len(coefficients)))
    integral *= (b - a) / 2.0

    return integral
