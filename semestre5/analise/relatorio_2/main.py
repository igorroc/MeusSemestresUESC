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

    if method in [
        Method.RegressaoLinear,
        Method.RegressaoQuadratica,
        Method.InterpolacaoLagrange
    ]:
        diretorio = f"./entradas/{method.value}"
        
        # Ler o arquivo CSV
        df = None
        path = f"./entradas/{method.value}.csv"
        try:
            arquivos = os.listdir(diretorio)
            index = 1
            for arquivo in arquivos:
                full_path = os.path.join(diretorio, arquivo)
                
                if os.path.isfile(full_path):
                    df = None
                    try:
                        df = pd.read_csv(full_path)
                        
                        start_time = time.time()
                        if method == Method.RegressaoLinear:
                            a,b,eqm = solve_by_linear_regression(
                                df["x"],
                                df["y"],
                            )
                            end_time = time.time()
                            
                            # Previsão para o ano 2000
                            ano_previsao = 2000
                            previsao_acidentes = a * ano_previsao + b

                            print(f"Previsão de acidentes para o ano 2000: {previsao_acidentes} milhares")
                        elif method == Method.RegressaoQuadratica:
                            a,b,c,eqm = solve_by_quadratic_regression(
                                df["x"],
                                df["y"],
                            )
                            end_time = time.time()
                            
                            try:
                                predict = float(input("Digite o valor para previsão: "))
                                normalized_predict = normalize_single_value(predict, df["x"])
                                predicted_value = a * normalized_predict**2 + b * normalized_predict + c

                                print(f"Previsão para ({predict}): {denormalize_single_value(predicted_value, df['y'])}")
                            except:
                                print("Erro ao prever valor")
                        elif method == Method.InterpolacaoLagrange:
                            polynomial, psi, v0 = solve_by_lagrange_interpolation(
                                df["x"],
                                df["y"],
                            )
                            end_time = time.time()
                            
                            print(f"Polinômio: {polynomial}")
                            
                        print(f"Tempo decorrido: {end_time - start_time} segundos\n")
                    except:
                        print(f"Arquivo '{full_path}' não encontrado")
        except:
            print(f"Arquivo '{path}' não encontrado")
            exit()
    elif method in [
        Method.TrapezioSimples,
        Method.TrapezioMultiplo
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
            if method == Method.TrapezioSimples:
                equation = row["equation"]
                a = row["a"]
                b = row["b"]
                integer = solve_by_trapezio_simples(
                    equation,
                    a,
                    b
                )
                end_time = time.time()
                
                print(f"Integral da equação '{equation}' de ({a},{b}): {integer}")
            elif method == Method.TrapezioMultiplo:
                equation = row["equation"]
                a = row["a"]
                b = row["b"]
                step = row["n"]
                integer = solve_by_trapezio_multiplo(
                    equation,
                    a,
                    b,
                    step
                )
                end_time = time.time()
                
                print(f"Integral da equação '{equation}' de ({a},{b}) com passo {step}: {integer}")
        
            print(f"Tempo decorrido: {end_time - start_time} segundos\n")

    print("Pressione enter para continuar...")
    input()
    clear_console()
