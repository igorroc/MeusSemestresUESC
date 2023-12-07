import math # Para a função eval()

def ralston_method(f, x0, y0, h, n):
    points = [(x0, y0)]
    x = x0
    y = y0

    for _ in range(n):
        slope1 = f(x, y)
        slope2 = f(x + (2 / 3) * h, y + (2 / 3) * h * slope1)
        y = y + (1 / 4) * h * (slope1 + 3 * slope2)
        x = x + h
        points.append((x, y))

    return points

def run():
    try:
        with open("entradas/ralston2.txt", "r") as file:
            equation = file.readline().strip()
            x0 = float(file.readline())
            y0 = float(file.readline())
            h = float(file.readline())
            n = int(file.readline())
    except FileNotFoundError:
        print("O arquivo ralston2.txt não foi encontrado.")
        exit(1)
    except (ValueError, IndexError):
        print("O arquivo ralston2.txt não está formatado corretamente.")
        exit(1)

    f = lambda x, y: eval(equation)

    ralston_solution = ralston_method(f, x0, y0, h, n)

    # Escrita da saída no arquivo "saidas/ralston2.txt"
    with open("saidas/ralston2.txt", "w") as file:
        for point in ralston_solution:
            file.write(f"x = {point[0]:.3f}, y = {point[1]:.3f}\n")
        print("Solução usando o método de Ralston:")
        print("x\t\ty")
        for point in ralston_solution:
            print(f"{point[0]:.3f}\t\t{point[1]:.3f}")

if __name__ == "__main__":
    run()
