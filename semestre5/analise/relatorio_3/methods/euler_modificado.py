import math # Para a função eval()

def modified_euler_method(f, x0, y0, h, n):
    pontos = [(x0, y0)]
    x = x0
    y = y0

    for _ in range(n):
        slope1 = f(x, y)
        y_temp = y + h * slope1
        slope2 = f(x + h, y_temp)
        y = y + (h / 2) * (slope1 + slope2)
        x = x + h
        pontos.append((x, y))

    return pontos

def run():
    try:
        with open("entradas/euler_modificado2.txt", "r") as file:
            equation = file.readline().strip()
            x0 = float(file.readline())
            y0 = float(file.readline())
            h = float(file.readline())
            n = int(file.readline())
    except FileNotFoundError:
        print("O arquivo euler_modificado.txt não foi encontrado.")
        exit(1)
    except (ValueError, IndexError):
        print("O arquivo euler_modificado.txt não está formatado corretamente.")
        exit(1)

    f = lambda x, y: eval(equation)
    solucao = modified_euler_method(f, x0, y0, h, n)

    # Escrita da saída no arquivo "saidas/euler_modificado.txt"
    with open("saidas/euler_modificado2.txt", "w") as file:
        for point in solucao:
            file.write(f"x = {point[0]:.3f}, y = {point[1]:.3f}\n")
        print("Solução pelo método de Euler Modificado:")
        print("x\t\ty")
        for point in solucao:
            print(f"{point[0]:.3f}\t\t{point[1]:.3f}")

if __name__ == "__main__":
    run()
