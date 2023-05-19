import random
from utils.gene import Gene

        # self.lista.append(Gene("teste", 30, 2, "110"))

class Carbohydrate:
    def __init__(self):
        self.lista = []
        self.lista.append(Gene("iogurte", 51, 3, "0000"))
        self.lista.append(Gene("batata", 52, 5, "0001"))
        self.lista.append(Gene("macarrão", 81, 3, "0010"))
        self.lista.append(Gene("iogurte 2", 82, 5, "0011"))
        self.lista.append(Gene("arroz 2", 90, 5, "0100"))
        self.lista.append(Gene("batata 2", 92, 6, "0101"))
        self.lista.append(Gene("abacate", 96, 3, "0110"))
        self.lista.append(Gene("banana", 98, 2, "0111"))
        self.lista.append(Gene("ovo 2", 100, 5, "1000"))
        self.lista.append(Gene("banana 2", 102, 5, "1001"))
        self.lista.append(Gene("macarrão 2", 111, 6, "1010"))
        self.lista.append(Gene("arroz", 124, 4, "1011"))
        self.lista.append(Gene("abacate 2", 136, 2, "1100"))
        self.lista.append(Gene("ovo", 146, 8, "1101"))
        self.lista.append(Gene("pão 2", 220, 1, "1110"))
        self.lista.append(Gene("pão", 232, 2, "1111"))

        self.code_size = 4

    def __str__(self):
        return str(self.lista)

    def get(self, cod):
        for carbohydrate in self.lista:
            if carbohydrate.cod == cod:
                return carbohydrate

    def get_random(self):
        return random.choice(self.lista)
