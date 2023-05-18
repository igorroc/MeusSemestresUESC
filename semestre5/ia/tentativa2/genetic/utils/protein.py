import random
from utils.gene import Gene


class Protein:
    def __init__(self):
        self.lista = []
        self.lista.append(Gene("frango", 128, 27, "00"))
        self.lista.append(Gene("carne", 140, 35, "01"))
        self.lista.append(Gene("peixe", 83, 27, "10"))
        self.lista.append(Gene("almondega", 120, 20, "11"))
        self.code_size = 2

    def __str__(self):
        return str(self.lista)

    def get(self, cod):
        for protein in self.lista:
            if protein.cod == cod:
                return protein

    def get_random(self):
        return random.choice(self.lista)
