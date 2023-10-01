import time
import pandas as pd
from utils.methods import *
from utils.outputs import *
import utils.graph as graph
from utils.questions import *
import os

print("\n" * 10)
print("Métodos Numéricos - Igor Rocha")
print("\n----------- Configurações -----------\n")

method = question_select_method()
print("\n")
showGraph = question_show_graph(method)

print("\n" * 10)


print(f"----------- Execução por {method.name} -----------")

if method in [
    Method.Bisseção,
    Method.PosiçãoFalsa,
    Method.NewtonRaphson,
    Method.Secante,
]:
    # Ler o arquivo CSV
    df = None
    path = f"./entradas/{method.value}.csv"
    try:
        df = pd.read_csv(path)
    except:
        print(f"Arquivo '{path}' não encontrado")
        exit()

    # Iterar pelas linhas do DataFrame
    for index, row in df.iterrows():
        zero = None
        history = [0]
        equation = None

        start_time = time.time()  # Registra o tempo de término
        if method == Method.Bisseção:
            equation = row["equation"]
            zero, history = calculateByBisseccao(
                equation, row["a"], row["b"], row["tolerance"], row["max_iterations"]
            )
            end_time = time.time()  # Registra o tempo de término
            outputEquations(
                index,
                history,
                ["Iteration", "a", "b", "f(a)", "f(b)", "b - a", "c", "f(c)"],
                method.value,
            )
            if showGraph:
                graph.plotHistory(
                    equation, float(row["a"]), float(row["b"]), history, zero
                )
        elif method == Method.PosiçãoFalsa:
            equation = row["equation"]
            zero, history = calculateByPosiçãoFalsa(
                equation, row["a"], row["b"], row["tolerance"], row["max_iterations"]
            )
            end_time = time.time()  # Registra o tempo de término
            outputEquations(
                index,
                history,
                ["Iteration", "a", "b", "f(a)", "f(b)", "b - a", "c", "f(c)"],
                method.value,
            )
            if showGraph:
                graph.plotHistory(
                    equation, float(row["a"]), float(row["b"]), history, zero
                )
        elif method == Method.NewtonRaphson:
            equation = row["equation"]
            zero, history = calculateByNewtonRaphson(
                equation, row["a"], row["tolerance"], row["max_iterations"]
            )
            end_time = time.time()  # Registra o tempo de término
            outputEquations(
                index,
                history,
                ["Iteration", "step", "f(step)", "f'(step)"],
                method.value,
            )
            if showGraph:
                graph.plotHistoryStep(equation, float(row["a"]), history, zero)
        elif method == Method.Secante:
            equation = row["equation"]
            zero, history = calculateBySecante(
                equation, row["a"], row["b"], row["tolerance"], row["max_iterations"]
            )
            end_time = time.time()  # Registra o tempo de término
            outputEquations(
                index, history, ["Iteration", "a", "f(a)", "b", "f(b)"], method.value
            )
            if showGraph:
                graph.plotHistoryStep(equation, float(row["a"]), history, zero)

        print(f"Tempo decorrido: {end_time - start_time} segundos\n")

else:
    # Ler o arquivo CSV
    diretorio = f"./entradas/{method.value}"
    arquivos = []
    try:
        arquivos = os.listdir(diretorio)
    except:
        print(f"Diretório '{diretorio}' não encontrado")
        exit()

    index = 1
    for arquivo in arquivos:
        full_path = os.path.join(diretorio, arquivo)
        # Verifique se é um arquivo (não é um diretório)
        if os.path.isfile(full_path):
            df = None
            try:
                df = pd.read_csv(full_path)
            except:
                print(f"Arquivo '{full_path}' não encontrado")
                exit()

            zeros = None

            a = df.iloc[:, :-1].values.astype(float).tolist()
            b = df.iloc[:, -1].values.astype(float).tolist()

            start_time = time.time()  # Registra o tempo de início
            if method == Method.EliminaçãoGauss:
                zeros = calculateByEliminaçãoGauss(index, a, b)
                end_time = time.time()  # Registra o tempo de término
                outputSystem(index, zeros, method.value)
            elif method == Method.LU:
                zeros = calculateByLU(index, a, b)
                end_time = time.time()  # Registra o tempo de término
                outputSystem(index, zeros, method.value)
            elif method == Method.Jacobi:
                zeros = calculateByJacobi(index, a, b)
                end_time = time.time()
                outputSystem(index, zeros, method.value)
            elif method == Method.GaussSeidel:
                zeros = calculateByGaussSeidel(index, a, b)
                end_time = time.time()
                outputSystem(index, zeros, method.value)

            print(f"Tempo decorrido: {end_time - start_time} segundos\n")
            index += 1
