from utils.methods import METHOD_MAPPING, Method


def question_select_method():
    print("Qual método você quer usar? Digite o número correspondente:")
    while True:
        for i, method in METHOD_MAPPING.items():
            print(f"{i} - {method.value}")

        user_input = input()

        # Verifica se o input é um número
        if not user_input.isdigit():
            print("Método inválido, tente novamente.")
            continue

        method_index = int(user_input)

        if method_index not in METHOD_MAPPING:
            print("Método inválido, tente novamente.")
            continue

        selected_method = METHOD_MAPPING[method_index]

        return selected_method


def question_show_graph(method: Method):
    showGraph = False

    if method in [
        Method.Bisseção,
        Method.PosiçãoFalsa,
        Method.NewtonRaphson,
        Method.Secante,
    ]:
        print("Quer mostrar o gráfico? (s/n)")
        if input().lower() == "s":
            showGraph = True

    return showGraph
