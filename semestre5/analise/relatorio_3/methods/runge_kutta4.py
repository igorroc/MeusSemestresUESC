import math # Para a função eval()

def runge_kutta(f, x0, y0, h, n):
    points = [(x0, y0)]
    x = x0
    y = y0

    for _ in range(n):
        k1 = h * f(x, y)
        k2 = h * f(x + h/2, y + k1/2)
        k3 = h * f(x + h/2, y + k2/2)
        k4 = h * f(x + h, y + k3)

        y = y + (1/6) * (k1 + 2*k2 + 2*k3 + k4)
        x = x + h
        points.append((x, y))

    return points

def run():
    try:
        with open("entradas/runge_kutta4_2.txt", "r") as file:
            equation = file.readline().strip()
            x0 = float(file.readline())
            y0 = float(file.readline())
            h = float(file.readline())
            n = int(file.readline())
    except FileNotFoundError:
        print("O arquivo runge_kutta4_2.txt não foi encontrado.")
        exit(1)
    except (ValueError, IndexError):
        print("O arquivo runge_kutta4_2.txt não está formatado corretamente.")
        exit(1)

    f = lambda x, y: eval(equation)

    # Chamada da função do método de Runge-Kutta de 4ª ordem
    final_solution = runge_kutta(f, x0, y0, h, n)

    with open("saidas/runge_kutta4_2.txt", "w") as file:
        for point in final_solution:
            file.write(f"x = {point[0]:.3f}, y = {point[1]:.3f}\n")
        print("Solução usando o método de Runge-Kutta de 4ª ordem:")
        print("x\t\ty")
        for point in final_solution:
            print(f"{point[0]:.3f}\t\t{point[1]:.3f}")

if __name__ == "__main__":
    run()
