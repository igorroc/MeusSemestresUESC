import math # Para a função eval()

def heun_method(f, x0, y0, h, iterations):
    x = x0
    y = y0
    solution = [(x, y)]

    for _ in range(iterations):
        y_euler = y + h * f(x, y)
        y = y + (h / 2) * (f(x, y) + f(x + h, y_euler))
        x += h
        solution.append((x, y))

    return solution


def run():
    try:
        with open('entradas/heun.txt', 'r') as file:
            equation = file.readline().strip()
            x0 = float(file.readline())
            y0 = float(file.readline())
            h = float(file.readline())
            iterations = int(file.readline())
    except FileNotFoundError:
        print("O arquivo heun.txt não foi encontrado.")
        exit(1)
    except (ValueError, IndexError):
        print("O arquivo heun.txt não está formatado corretamente.")
        exit(1)

    f = lambda x, y: eval(equation)

    solution = heun_method(f, x0, y0, h, iterations)

    with open('saidas/heun.txt', 'w') as f:
        for x, y in solution:
            f.write(f"x = {x:.3f}, y = {y:.3f}\n")
        print("Solução pelo método de Heun:")
        print("x\t\ty")
        for x, y in solution:
            print(f"{x:.3f}\t\t{y:.3f}")

if __name__ == "__main__":
    run()