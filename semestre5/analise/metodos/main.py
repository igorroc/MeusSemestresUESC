import pandas as pd
from utils.methods import Method, calculateByBisseccao
from utils.outputs import outputBisseccao

method = Method.Bisseccao

# Ler o arquivo CSV
df = pd.read_csv(f"entrada_{method.value}.csv")

# Iterar pelas linhas do DataFrame
for index, row in df.iterrows():
    zero = None
    history = 0
    equation = row["equation"]
    if method == Method.Bisseccao:
        zero, history = calculateByBisseccao(
            equation, row["a"], row["b"], row["tolerance"], row["max_iterations"]
        )
        outputBisseccao(index, history)

    if zero is None:
        print(
            f"Nenhum zero encontrado para a equação {equation} no intervalo ({row['a']}, {row['b']})\n"
        )
    else:
        print(f"Zero encontrado: {zero} em {len(history)} iterações\n")
