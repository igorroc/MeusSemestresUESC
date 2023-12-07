import numpy as np
from scipy.integrate import odeint

def system(y, t):
    # Variáveis do sistema
    j, k = y

    # Parâmetros do sistema
    a_value = 1.0
    b_value = 0.5

    # Equações diferenciais
    djdt = a_value * j - b_value * k
    dkdt = b_value * j - a_value * k

    return [djdt, dkdt]

def run():
    # Carrega os dados de entrada do arquivo 'entrada_edo.txt'
    with open('entradas/edo.txt', 'r') as file:
        lines = file.readlines()
        initial_conditions = [float(val) for val in lines[0].split()]
        t_start, t_end = [float(val) for val in lines[1].split()]
        num_points = int(lines[2])

        t = np.linspace(t_start, t_end, num_points)

    # Resolve o sistema de equações diferenciais usando odeint
    solution = odeint(system, initial_conditions, t)

    # Salva os resultados no arquivo 'saida_edo.txt'
    with open('saidas/edo.txt', 'w') as f:
        for i in range(len(t)):
            f.write(f"t = {t[i]:.3f}, j = {solution[i, 0]:.3f}, k = {solution[i, 1]:.3f}\n")
            
    print("Solução usando o método EDO:")
    print(solution)

if __name__ == "__main__":
    run()