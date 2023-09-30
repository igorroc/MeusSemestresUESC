import pandas as pd
from utils.methods import *
from utils.outputs import outputBisseccao, outputPosicaoFalsa, outputNewtonRaphson
from utils.graph import plotHistory
from utils.questions import question_select_method, question_show_graph

print("\n" * 10)
print("Métodos Numéricos - Igor Rocha")
print("----------- Configurações -----------")

method = question_select_method()
print("\n")
showGraph = question_show_graph()

print("\n" * 10)

# Ler o arquivo CSV
df = None
try:
    df = pd.read_csv(f"entrada_{method.value}.csv")
except:
    print(f"Arquivo entrada_{method.value}.csv não encontrado")
    exit()

print(f"----------- Execução por {method.name} -----------")

# Iterar pelas linhas do DataFrame
for index, row in df.iterrows():
    zero = None
    history = 0
    equation = row["equation"]
    if method == Method.Bisseccao:
        zero, history = calculateByBisseccao(
            equation, row["a"], row["b"], row["tolerance"], row["max_iterations"]
        )
    elif method == Method.PosicaoFalsa:
        zero, history = calculateByPosicaoFalsa(
            equation, row["a"], row["b"], row["tolerance"], row["max_iterations"]
        )
    elif method == Method.NewtonRaphson:
        zero, history = calculateByNewtonRaphson(
            equation, row["a"], row["tolerance"], row["max_iterations"]
        )

    if method == Method.Bisseccao:
        outputBisseccao(index, history)
    elif method == Method.PosicaoFalsa:
        outputPosicaoFalsa(index, history)
    elif method == Method.NewtonRaphson:
        outputNewtonRaphson(index, history)

    if showGraph:
        plotHistory(equation, float(row["a"]), float(row["b"]), history, zero)
