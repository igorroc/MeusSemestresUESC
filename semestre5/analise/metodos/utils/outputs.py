import csv


def outputBisseccao(index: float, history: list):
    csv_filename = f"saida_bisseccao/equation_{index}.csv"

    with open(csv_filename, mode="w", newline="") as file:
        writer = csv.writer(file)

        # Escreva o cabeçalho do CSV
        writer.writerow(["Iteration", "a", "b", "f(a)", "f(b)", "b - a", "c", "f(c)"])

        # Escreva os dados de 'history' no CSV
        for row in history:
            writer.writerow(row)

    print(f"Arquivo {csv_filename} gerado com sucesso!\n")
