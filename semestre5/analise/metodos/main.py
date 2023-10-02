import time
import pandas as pd
from utils.methods import *
from utils.outputs import *
import utils.graph as graph
from utils.questions import *
import os

clear_console()

welcome()

while True:
    print("\n----------- Configurações -----------\n")

    method = question_select_method()
    showGraph = question_show_graph(method)

    clear_console()

    print(f"----------- Execução por {method.name} -----------\n")

    if method in [  # Métodos que não são de sistemas
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

            start_time = time.time()
            if method == Method.Bisseção:
                equation = row["equation"]
                zero, history = solve_by_bisseccao(
                    equation,
                    row["a"],
                    row["b"],
                    row["tolerance"],
                    row["max_iterations"],
                )
                end_time = time.time()
                output_equations(
                    index,
                    history,
                    ["Iteration", "a", "b", "f(a)", "f(b)", "b - a", "c", "f(c)"],
                    method.value,
                )
                if showGraph:
                    graph.plot_history(
                        equation, float(row["a"]), float(row["b"]), history, zero
                    )
            elif method == Method.PosiçãoFalsa:
                equation = row["equation"]
                zero, history = solve_by_posicao_falsa(
                    equation,
                    row["a"],
                    row["b"],
                    row["tolerance"],
                    row["max_iterations"],
                )
                end_time = time.time()
                output_equations(
                    index,
                    history,
                    ["Iteration", "a", "b", "f(a)", "f(b)", "b - a", "c", "f(c)"],
                    method.value,
                )
                if showGraph:
                    graph.plot_history(
                        equation, float(row["a"]), float(row["b"]), history, zero
                    )
            elif method == Method.NewtonRaphson:
                equation = row["equation"]
                zero, history = solve_by_newton_raphson(
                    equation, row["a"], row["tolerance"], row["max_iterations"]
                )
                end_time = time.time()
                output_equations(
                    index,
                    history,
                    ["Iteration", "step", "f(step)", "f'(step)"],
                    method.value,
                )
                if showGraph:
                    graph.plot_history_step(equation, float(row["a"]), history, zero)
            elif method == Method.Secante:
                equation = row["equation"]
                zero, history = solve_by_secante(
                    equation,
                    row["a"],
                    row["b"],
                    row["tolerance"],
                    row["max_iterations"],
                )
                end_time = time.time()
                output_equations(
                    index,
                    history,
                    ["Iteration", "a", "f(a)", "b", "f(b)"],
                    method.value,
                )
                if showGraph:
                    graph.plot_history_step(equation, float(row["a"]), history, zero)

            print(f"Tempo decorrido: {end_time - start_time} segundos\n")

    else:  # Métodos que são de sistemas
        # Ler o arquivo CSV
        diretorio = f"./entradas/{method.value}"
        try:
            arquivos = os.listdir(diretorio)
            index = 1
            for arquivo in arquivos:
                full_path = os.path.join(diretorio, arquivo)
                # Verifique se é um arquivo (não é um diretório)
                if os.path.isfile(full_path):
                    df = None
                    try:
                        df = pd.read_csv(full_path)
                        zeros = None

                        start_time = time.time()  # Registra o tempo de início

                        if method == Method.EliminaçãoGauss:
                            a = df.iloc[:, :-1].values.astype(float).tolist()
                            b = df.iloc[:, -1].values.astype(float).tolist()
                            zeros = solve_by_eliminacao_gauss(index, a, b)
                            end_time = time.time()
                            output_system(index, zeros, method.value)
                        elif method == Method.LU:
                            a = df.iloc[:, :-1].values.astype(float).tolist()
                            b = df.iloc[:, -1].values.astype(float).tolist()
                            zeros = solve_by_lu(index, a, b)
                            end_time = time.time()
                            output_system(index, zeros, method.value)
                        elif method == Method.Jacobi:
                            a = df.iloc[:, :-1].values.astype(float).tolist()
                            b = df.iloc[:, -1].values.astype(float).tolist()
                            zeros = solve_by_jacobi(index, a, b)
                            end_time = time.time()
                            output_system(index, zeros, method.value)
                        elif method == Method.GaussSeidel:
                            a = df.iloc[:, :-1].values.astype(float).tolist()
                            b = df.iloc[:, -1].values.astype(float).tolist()
                            zeros = solve_by_gauss_seidel(index, a, b)
                            end_time = time.time()
                            output_system(index, zeros, method.value)
                        elif method == Method.Inversao:
                            a = df.iloc[:, :-1].values.astype(float).tolist()
                            b = df.iloc[:, -1].values.astype(float).tolist()
                            zeros = solve_by_invercao(index, a, b)
                            end_time = time.time()
                            output_system(index, zeros, method.value)
                        elif method == Method.Condicao:
                            a = df.iloc[:, :].values.astype(float).tolist()
                            condition = solve_by_numero_condicao(index, a)
                            end_time = time.time()
                            output_system(index, condition, method.value)

                        print(f"Tempo decorrido: {end_time - start_time} segundos\n")
                        index += 1
                    except:
                        print(f"Arquivo '{full_path}' não encontrado")

        except:
            os.makedirs(diretorio)
            print(f"Diretório '{diretorio}' não encontrado")
            print(
                "Acabei de criar-lo para você, coloque os arquivos de entrada lá e tente novamente\n\n"
            )

    print("Pressione enter para continuar...")
    input()
    clear_console()
