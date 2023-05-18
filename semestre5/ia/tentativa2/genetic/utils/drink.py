import random
from utils.gene import Gene


class Drink:
    def __init__(self):
        self.lista = []
        self.lista.append(Gene("suco laranja", 14, 10, "00"))
        self.lista.append(Gene("suco limão", 21, 5, "01"))
        self.lista.append(Gene("água de coco", 20, 4, "10"))
        self.lista.append(Gene("suco caju", 80, 7, "11"))
        self.code_size = 2

    def __str__(self):
        return str(self.lista)

    def get(self, cod):
        for drink in self.lista:
            if drink.cod == cod:
                return drink

    def get_random(self):
        return random.choice(self.lista)
