import math

def euler_method(f, x0, y0, h, iterations):
    points = [(x0, y0)]
    x = x0
    y = y0
    
    # Implementa o Método de Euler para resolver uma equação diferencial.
    for _ in range(iterations):
        slope = f(x, y)
        y = y + h * slope
        x = x + h
        points.append((x, y))
    
    return points

def run():
    try:
        with open("entradas/euler2.txt", "r") as file:
            equation = file.readline().strip()
            x0 = float(file.readline())
            y0 = float(file.readline())
            h = float(file.readline())
            iterations = int(file.readline())
    except FileNotFoundError:
        print("O arquivo euler2.txt não foi encontrado.")
        exit(1)
    except (ValueError, IndexError):
        print("O arquivo euler2.txt não está formatado corretamente.")
        exit(1)

    f = lambda x, y: eval(equation)
    solution = euler_method(f, x0, y0, h, iterations)

    with open("saidas/euler2.txt", "w") as file:
        for point in solution:
            file.write(f"x = {point[0]:.3f}, y = {point[1]:.3f}\n")
            
        print("Solução usando o método de Euler:")
        print("x\t\ty")
        for point in solution:
            print(f"{point[0]:.3f}\t\t{point[1]:.3f}")

if __name__ == "__main__":
    run()
