import csv


def outputBisseccao(index: float, history: list):
    csv_filename = f"saidas/bisseccao/equation_{index}.csv"

    with open(csv_filename, mode="w", newline="") as file:
        writer = csv.writer(file)

        # Escreva o cabeçalho do CSV
        writer.writerow(["Iteration", "a", "b", "f(a)", "f(b)", "b - a", "c", "f(c)"])

        # Escreva os dados de 'history' no CSV
        for row in history:
            writer.writerow(row)


def outputPosicaoFalsa(index: float, history: list):
    csv_filename = f"saidas/posicao_falsa/equation_{index}.csv"

    with open(csv_filename, mode="w", newline="") as file:
        writer = csv.writer(file)

        # Escreva o cabeçalho do CSV
        writer.writerow(["Iteration", "a", "b", "f(a)", "f(b)", "b - a", "c", "f(c)"])

        # Escreva os dados de 'history' no CSV
        for row in history:
            writer.writerow(row)


def outputNewtonRaphson(index: float, history: list):
    csv_filename = f"saidas/newton_raphson/equation_{index}.csv"

    with open(csv_filename, mode="w", newline="") as file:
        writer = csv.writer(file)

        # Escreva o cabeçalho do CSV
        writer.writerow(["Iteration", "step", "f(step)", "f'(step)"])

        # Escreva os dados de 'history' no CSV
        for row in history:
            writer.writerow(row)


def outputSecante(index: float, history: list):
    csv_filename = f"saidas/secante/equation_{index}.csv"

    with open(csv_filename, mode="w", newline="") as file:
        writer = csv.writer(file)

        # Escreva o cabeçalho do CSV
        writer.writerow(["Iteration", "a", "f(a)", "b", "f(b)"])

        # Escreva os dados de 'history' no CSV
        for row in history:
            writer.writerow(row)


def outputEliminaçãoGauss(x: any):
    csv_filename = f"saidas/eliminacao_gauss/result.csv"

    with open(csv_filename, mode="w", newline="") as file:
        writer = csv.writer(file)

        # Escreva o cabeçalho do CSV
        writer.writerow(["X"])

        # Escreva os dados de 'x' no CSV
        writer.writerow([x])
