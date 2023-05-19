import random
from utils.gene import Gene


class Drink:
    def __init__(self):
        self.lista = []
        self.lista.append(Gene("suco laranja", 14, 10, "0000"))
        self.lista.append(Gene("suco limão 3", 14, 8, "0001"))
        self.lista.append(Gene("água de coco", 20, 4, "0010"))
        self.lista.append(Gene("suco limão", 21, 5, "0011"))
        self.lista.append(Gene("suco laranja 2", 24, 9, "0100"))
        self.lista.append(Gene("suco laranja 3", 24, 12, "0101"))
        self.lista.append(Gene("água de coco 2", 25, 3, "0110"))
        self.lista.append(Gene("suco limão 2", 30, 7, "0111"))
        self.lista.append(Gene("suco limão 4", 31, 5, "1000"))
        self.lista.append(Gene("água de coco 4", 37, 6, "1001"))
        self.lista.append(Gene("água de coco 3", 38, 5, "1010"))
        self.lista.append(Gene("suco laranja 4", 44, 4, "1011"))
        self.lista.append(Gene("suco caju 4", 78, 2, "1100"))
        self.lista.append(Gene("suco caju", 80, 7, "1101"))
        self.lista.append(Gene("suco caju 2", 90, 1, "1110"))
        self.lista.append(Gene("suco caju 3", 92, 4, "1111"))
        
        self.code_size = 4

    def __str__(self):
        return str(self.lista)

    def get(self, cod):
        for drink in self.lista:
            if drink.cod == cod:
                return drink

    def get_random(self):
        return random.choice(self.lista)
