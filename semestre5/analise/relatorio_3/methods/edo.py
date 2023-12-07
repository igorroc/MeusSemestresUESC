import numpy as np
from scipy.integrate import odeint

# Define as equações do sistema de EDO
def system_equations(y, t):
    var1, var2 = y
    param1 = 1.0
    param2 = 0.5

    # Define as equações diferenciais do sistema
    eq1 = param1 * var1 - param2 * var2
    eq2 = param2 * var1 - param1 * var2

    return [eq1, eq2]

def run():
    with open('entradas/edo.txt', 'r') as file:
        lines = file.readlines()
        initial_conditions = [float(val) for val in lines[0].split()]
        t_start, t_end = [float(val) for val in lines[1].split()]
        num_points = int(lines[2])

        t = np.linspace(t_start, t_end, num_points)

    solution = odeint(system_equations, initial_conditions, t)

    with open('saidas/edo.txt', 'w') as f:
        for i in range(len(t)):
            f.write(f"t = {t[i]:.3f}, j = {solution[i, 0]:.3f}, k = {solution[i, 1]:.3f}\n")
            
    print("Resultado utilizando o método EDO:")
    print(solution)

if __name__ == "__main__":
    run()
