import csv
import numpy as np


def outputEquations(index: float, history: list, header: list, method: str):
    csv_filename = f"saidas/{method}/equation_{index}.csv"

    with open(csv_filename, mode="w", newline="") as file:
        writer = csv.writer(file)

        # Escreva o cabeçalho do CSV
        writer.writerow(header)

        # Escreva os dados de 'history' no CSV
        for row in history:
            writer.writerow(row)


def outputSystem(index: float, x: any, method: str):
    csv_filename = f"saidas/{method}/result_{index}.csv"

    with open(csv_filename, mode="w", newline="") as file:
        writer = csv.writer(file)

        # Escreva o cabeçalho do CSV
        writer.writerow([f"X_{i}" for i in range(1, len(x) + 1)])

        # Escreva os dados de 'x' no CSV
        writer.writerow(x)
