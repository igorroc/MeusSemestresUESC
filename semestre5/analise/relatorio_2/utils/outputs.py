import csv
import os
import pandas as pd


def output_equations(index: float, history: list, header: list, method: str):
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


def output_system(index: float, zeros: any, method: str):
    directory = f"saidas/{method}"
    csv_filename = f"{directory}/result_{index}.csv"

    # Verifica se o diretório existe; se não, cria
    if not os.path.exists(directory):
        os.makedirs(directory)

    with open(csv_filename, mode="w", newline="") as file:
        writer = csv.writer(file)

        # Escreva o cabeçalho do CSV
        if type(zeros) == list:
            writer.writerow([f"X_{i}" for i in range(1, len(zeros) + 1)])
        else:
            writer.writerow(["X"])

        # Escreva os dados de 'x' no CSV
        if type(zeros) == list:
            writer.writerow(zeros)
        else:
            writer.writerow([zeros])


def print_table(index, a, b):
    # Criar um DataFrame com os valores antes do cálculo
    data = {f"X_{i+1}": a[:, i] for i in range(len(a[0]))}
    if b is not None:
        data["b"] = b

    df = pd.DataFrame(data)

    # Imprimir os valores antes do cálculo
    print(f"Sistema de equações ({index}):")
    print(df)


def clear_console(n = 50):
    print("\n" * n)


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
