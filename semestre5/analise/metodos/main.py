import pandas as pd
from utils.methods import Method, calculateByBisseccao
from utils.outputs import outputBisseccao
from utils.graph import plotHistory

method = Method.Bisseccao
showGraph = True

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
        

    if zero is None:
        print(
            f"Nenhum zero encontrado para a equação {equation} no intervalo ({row['a']}, {row['b']})\n"
        )
    else:
        print(f"Zero encontrado: {zero} em {len(history)} iterações\n")
        
    
    outputBisseccao(index, history)
    if showGraph:
        plotHistory(equation, float(row["a"]), float(row["b"]), history, zero)
