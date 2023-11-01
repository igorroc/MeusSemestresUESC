from enum import Enum
from utils.equation import Equation
import numpy as np

import utils.outputs as outputs


class Method(Enum):
    RegressaoLinear = "regressao_linear"
    RegressaoQuadratica = "regressao_quadratica"


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