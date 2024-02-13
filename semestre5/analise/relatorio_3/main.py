import os
import importlib.util

# Função para listar os arquivos de métodos disponíveis na pasta "methods"
def list_available_methods():
    method_files = []
    for file in os.listdir("methods"):
        if file.endswith(".py") and file != "__init__.py":
            method_files.append(file[:-3])
    return method_files

# Função para carregar um método a partir do arquivo
def load_method(method_name):
    method_path = os.path.join("methods", f"{method_name}.py")
    spec = importlib.util.spec_from_file_location(method_name, method_path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module

# Função principal
def main():
    while True:
        print("\nMétodos disponíveis:")
        methods = list_available_methods()
        for i, method in enumerate(methods, start=1):
            print(f"{i}. {method}")

        print("0. Sair")
        choice = input("Escolha um método (digite o número): ")
        
        try:
            choice = int(choice)
            if(choice == 0):
                print("Saindo...")
                break
            if 1 <= choice <= len(methods):
                method_name = methods[choice - 1]
                method_module = load_method(method_name)
                method_module.run()
            else:
                print("Escolha inválida. Por favor, selecione um número válido.")
        except ValueError:
            print("Entrada inválida. Digite o número correspondente ao método desejado.")

if __name__ == "__main__":
    main()