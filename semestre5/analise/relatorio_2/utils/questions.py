from utils.methods import METHOD_MAPPING, Method
import utils.outputs as outputs


def question_select_method():
    print("Qual método você quer usar?")
    print("Digite o número correspondente:")
    while True:
        for i, method in METHOD_MAPPING.items():
            print(f"\t{i+1} - {method.value}")
        print("\n\ts - Sair")

        outputs.clear_console(5)

        print("→ ", end="", flush=True)
        user_input = input()

        if user_input == "s":
            outputs.clear_console()
            print("Obrigado por usar o programa!")
            print("Saindo...")
            exit()

        # Verifica se o input é um número
        if not user_input.isdigit():
            print("Método inválido, tente novamente.")
            continue

        method_index = int(user_input) - 1

        if method_index not in METHOD_MAPPING:
            print("Método inválido, tente novamente.")
            continue

        selected_method = METHOD_MAPPING[method_index]

        print("\n")

        return selected_method


def question_show_graph(method: Method):
    showGraph = False

    # if method in [
    #     Method.Bisseção,
    #     Method.PosiçãoFalsa,
    #     Method.NewtonRaphson,
    #     Method.Secante,
    # ]:
    #     print("Quer mostrar o gráfico? (s/n)")
    #     if input().lower() == "s":
    #         showGraph = True

    return showGraph
