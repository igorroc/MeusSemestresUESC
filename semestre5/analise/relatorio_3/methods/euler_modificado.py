import math # Para a função eval()

def modified_euler_method(f, x0, y0, h, iterations):
    points = [(x0, y0)]
    x = x0
    y = y0
    
    # Implementa o Método de Euler Modificado para resolver uma equação diferencial.
    for _ in range(iterations):
        slope1 = f(x, y)
        y_temp = y + h * slope1
        slope2 = f(x + h, y_temp)
        y = y + (h / 2) * (slope1 + slope2)
        x = x + h
        points.append((x, y))

    return points

def run():
    try:
        with open("entradas/euler_modificado2.txt", "r") as file:
            equation = file.readline().strip()
            x0 = float(file.readline())
            y0 = float(file.readline())
            h = float(file.readline())
            iterations = int(file.readline())
    except FileNotFoundError:
        print("O arquivo euler_modificado.txt não foi encontrado.")
        exit(1)
    except (ValueError, IndexError):
        print("O arquivo euler_modificado.txt não está formatado corretamente.")
        exit(1)

    f = lambda x, y: eval(equation)
    solution = modified_euler_method(f, x0, y0, h, iterations)

    with open("saidas/euler_modificado2.txt", "w") as file:
        for point in solution:
            file.write(f"x = {point[0]:.3f}, y = {point[1]:.3f}\n")
        print("Solução pelo método de Euler Modificado:")
        print("x\t\ty")
        for point in solution:
            print(f"{point[0]:.3f}\t\t{point[1]:.3f}")

if __name__ == "__main__":
    run()