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

    if method:
        # Ler o arquivo CSV
        df = None
        path = f"./entradas/{method.value}.csv"
        try:
            df = pd.read_csv(path)
        except:
            print(f"Arquivo '{path}' não encontrado")
            exit()

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
            
            # Previsão para o ano 2000
            ano_previsao = normalize_single_value(2000, df["x"])
            previsao_acidentes = a * ano_previsao**2 + b * ano_previsao + c

            print(f"Previsão de acidentes por 10,000 veículos para o ano 2000: {denormalize_single_value(previsao_acidentes, df['y'])}")

        
        print(f"Tempo decorrido: {end_time - start_time} segundos\n")

    print("Pressione enter para continuar...")
    input()
    clear_console()
