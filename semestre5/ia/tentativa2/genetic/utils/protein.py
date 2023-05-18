import random
from utils.gene import Gene


class Protein:
    def __init__(self):
        self.lista = []
        self.lista.append(Gene("frango", 128, 27, 1))
        self.lista.append(Gene("carne", 140, 35, 2))
        self.lista.append(Gene("peixe", 83, 27, 3))
        self.lista.append(Gene("almondega", 120, 20, 4))

    def __str__(self):
        return str(self.lista)

    def get(self, cod):
        for protein in self.lista:
            if protein.cod == cod:
                return protein

    def get_random(self):
        return random.choice(self.lista)
