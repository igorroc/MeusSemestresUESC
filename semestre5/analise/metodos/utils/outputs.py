import csv
import os
import pandas as pd


def outputEquations(index: float, history: list, header: list, method: str):
    directory = f"saidas/{method}"
    csv_filename = f"{directory}/result_{index}.csv"

    # Verifica se o diretório existe; se não, cria
    if not os.path.exists(directory):
        os.makedirs(directory)

    with open(csv_filename, mode="w", newline="") as file:
        writer = csv.writer(file)

        # Escreva o cabeçalho do CSV
        writer.writerow(header)

        # Escreva os dados de 'history' no CSV
        for row in history:
            writer.writerow(row)


def outputSystem(index: float, x: any, method: str):
    directory = f"saidas/{method}"
    csv_filename = f"{directory}/result_{index}.csv"

    # Verifica se o diretório existe; se não, cria
    if not os.path.exists(directory):
        os.makedirs(directory)

    with open(csv_filename, mode="w", newline="") as file:
        writer = csv.writer(file)

        # Escreva o cabeçalho do CSV
        writer.writerow([f"X_{i}" for i in range(1, len(x) + 1)])

        # Escreva os dados de 'x' no CSV
        writer.writerow(x)


def printTable(index, a, b):
    # Criar um DataFrame com os valores antes do cálculo
    data = {f"X_{i+1}": a[:, i] for i in range(len(a[0]))}
    data["b"] = b
    df = pd.DataFrame(data)

    # Imprimir os valores antes do cálculo
    print(f"Sistema de equações ({index}):")
    print(df)


def clearConsole():
    print("\n" * 50)


def spaceConsole():
    print("\n" * 5)


def welcome():
    print("Bem-vindo!")
    print(
        "Este programa foi desenvolvido para a disciplina de Análise Numérica do curso de Ciência da Computação da Universidade Estadual de Santa Cruz (UESC)."
    )
    print("Desenvolvido por:")
    print("\t- Igor Rocha")

    print("\n")

    print("Instruções:")
    print("\t- Os arquivos de entrada devem estar na pasta 'entradas'")
    print("\t- Os arquivos de saída serão gerados na pasta 'saidas'")

    print("\n")
