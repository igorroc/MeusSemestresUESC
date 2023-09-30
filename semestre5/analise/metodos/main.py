import pandas as pd
from utils.methods import *
from utils.outputs import outputBisseccao, outputPosicaoFalsa
from utils.graph import plotHistory
from utils.questions import question_select_method, question_show_graph

print("\n" * 10)
print("Métodos Numéricos - Igor Rocha")
print("----------- Configurações -----------")

method = question_select_method()
print("\n")
showGraph = question_show_graph()

print("\n" * 10)
print("----------- Execução -----------")

# Ler o arquivo CSV
df = pd.read_csv(f"entrada_{method.value}.csv")

# Iterar pelas linhas do DataFrame
for index, row in df.iterrows():
    zero = None
    history = 0
    equation = row["equation"]
    if method == Method.Bisseccao or method == Method.Todas:
        zero, history = calculateByBisseccao(
            equation, row["a"], row["b"], row["tolerance"], row["max_iterations"]
        )
    elif method == Method.PosicaoFalsa or method == Method.Todas:
        zero, history = calculateByPosicaoFalsa(
            equation, row["a"], row["b"], row["tolerance"], row["max_iterations"]
        )
    elif method == Method.NewtonRaphson or method == Method.Todas:
        calculateByNewtonRaphson(
            equation, row["a"], row["tolerance"], row["max_iterations"]
        )

    if method == Method.Bisseccao:
        outputBisseccao(index, history)
    elif method == Method.PosicaoFalsa:
        outputPosicaoFalsa(index, history)

    if showGraph:
        plotHistory(equation, float(row["a"]), float(row["b"]), history, zero)
