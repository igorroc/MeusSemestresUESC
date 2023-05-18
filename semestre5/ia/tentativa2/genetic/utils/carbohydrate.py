import random
from utils.gene import Gene


class Carbohydrate:
    def __init__(self):
        self.lista = []
        self.lista.append(Gene("arroz", 124, 4, "000"))
        self.lista.append(Gene("macarrão", 81, 3, "001"))
        self.lista.append(Gene("ovo", 146, 8, "010"))
        self.lista.append(Gene("batata", 52, 5, "011"))
        self.lista.append(Gene("banana", 98, 2, "100"))
        self.lista.append(Gene("iogurte", 51, 3, "101"))
        self.lista.append(Gene("pão", 232, 2, "110"))
        self.lista.append(Gene("abacate", 96, 3, "111"))
        self.code_size = 3

    def __str__(self):
        return str(self.lista)

    def get(self, cod):
        for carbohydrate in self.lista:
            if carbohydrate.cod == cod:
                return carbohydrate

    def get_random(self):
        return random.choice(self.lista)
