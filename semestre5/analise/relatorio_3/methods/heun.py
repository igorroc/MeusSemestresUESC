import math # Para a função eval()

def heun(f, x0, y0, h, interacao):
   
    x = x0
    y = y0
    solucao = [(x, y)]

    for _ in range(interacao):
        y_euler = y + h * f(x, y)
        y = y + (h / 2) * (f(x, y) + f(x + h, y_euler))
        x += h
        solucao.append((x, y))

    return solucao


def run():
    with open('entradas/heun2.txt', 'r') as file:
        equation = file.readline().strip()
        x0 = float(file.readline())
        y0 = float(file.readline())
        h = float(file.readline())
        interacao = int(file.readline())

    f = lambda x, y: eval(equation)

    solucao = heun(f, x0, y0, h, interacao)


    with open('saidas/heun2.txt', 'w') as f:
        for x, y in solucao:
            f.write(f"x = {x:.3f}, y = {y:.3f}\n")
        print("Solução pelo método de Euler Modificado:")
        print("x\t\ty")
        for x, y in solucao:
            print(f"{x:.3f}\t\t{y:.3f}")
