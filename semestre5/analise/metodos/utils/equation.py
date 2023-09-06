import sympy as sp
from sympy.abc import x


class Equation:
    def __init__(self, expression_str):
        self.expression_str = expression_str
        self.expression = sp.sympify(expression_str)

    def calculate(self, x_value: float) -> float:
        result = self.expression.subs("x", x_value)
        return result

    def calculate_many(self, x_values: list) -> list:
        result = []
        for x_value in x_values:
            result.append(self.calculate(x_value))
        return result

    def __str__(self):
        return self.expression_str
