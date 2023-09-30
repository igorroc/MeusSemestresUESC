import pandas as pd
from utils.methods import *
from utils.outputs import *
import utils.graph as graph
from utils.questions import *

print("\n" * 10)
print("Métodos Numéricos - Igor Rocha")
print("----------- Configurações -----------")

method = question_select_method()
print("\n")
showGraph = question_show_graph(method)

print("\n" * 10)

# Ler o arquivo CSV
df = None
try:
    df = pd.read_csv(f"entrada_{method.value}.csv")
except:
    print(f"Arquivo entrada_{method.value}.csv não encontrado")
    exit()

print(f"----------- Execução por {method.name} -----------")

if method in [
    Method.Bisseção,
    Method.PosiçãoFalsa,
    Method.NewtonRaphson,
    Method.Secante,
]:
    # Iterar pelas linhas do DataFrame
    for index, row in df.iterrows():
        zero = None
        history = [0]
        equation = None

        if method == Method.Bisseção:
            equation = row["equation"]
            zero, history = calculateByBisseccao(
                equation, row["a"], row["b"], row["tolerance"], row["max_iterations"]
            )
            outputBisseccao(index, history)
            if showGraph:
                graph.plotHistory(
                    equation, float(row["a"]), float(row["b"]), history, zero
                )
        elif method == Method.PosiçãoFalsa:
            equation = row["equation"]
            zero, history = calculateByPosiçãoFalsa(
                equation, row["a"], row["b"], row["tolerance"], row["max_iterations"]
            )
            outputPosicaoFalsa(index, history)
            if showGraph:
                graph.plotHistory(
                    equation, float(row["a"]), float(row["b"]), history, zero
                )
        elif method == Method.NewtonRaphson:
            equation = row["equation"]
            zero, history = calculateByNewtonRaphson(
                equation, row["a"], row["tolerance"], row["max_iterations"]
            )
            outputNewtonRaphson(index, history)
            if showGraph:
                graph.plotHistoryStep(equation, float(row["a"]), history, zero)
        elif method == Method.Secante:
            equation = row["equation"]
            zero, history = calculateBySecante(
                equation, row["a"], row["b"], row["tolerance"], row["max_iterations"]
            )
            outputSecante(index, history)
            if showGraph:
                graph.plotHistoryStep(equation, float(row["a"]), history, zero)


else:
    zeros = None
    a = df.iloc[:, :-1].values.astype(float).tolist()
    b = df.iloc[:, -1].values.astype(float).tolist()

    if method == Method.EliminaçãoGauss:
        zeros = calculateByEliminaçãoGauss(a, b)
        outputEliminaçãoGauss(zeros)

    if showGraph:
        graph.plotLines(a, b)
