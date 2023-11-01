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
        Method.RegressaoLinear,
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
        zero = None
        history = [0]
        equation = None

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
        
        print(f"Tempo decorrido: {end_time - start_time} segundos\n")

    print("Pressione enter para continuar...")
    input()
    clear_console()