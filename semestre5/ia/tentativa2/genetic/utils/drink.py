import random
from utils.gene import Gene


class Drink:
    def __init__(self):
        self.lista = []
        self.lista.append(Gene("suco laranja", 14, 10, 1))
        self.lista.append(Gene("suco limão", 21, 5, 2))
        self.lista.append(Gene("água de coco", 20, 4, 3))
        self.lista.append(Gene("suco caju", 80, 7, 4))

    def __str__(self):
        return str(self.lista)

    def get(self, cod):
        for drink in self.lista:
            if drink.cod == cod:
                return drink

    def get_random(self):
        return random.choice(self.lista)
