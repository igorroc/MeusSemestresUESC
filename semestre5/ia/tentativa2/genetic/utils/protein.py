import random
from utils.gene import Gene


class Protein:
    def __init__(self):
        self.lista = []
        self.lista.append(Gene("peixe 2", 43, 32, "0000"))
        self.lista.append(Gene("peixe 4", 50, 24, "0001"))
        self.lista.append(Gene("peixe", 83, 27, "0010"))
        self.lista.append(Gene("frango 3", 88, 22, "0011"))
        self.lista.append(Gene("peixe 3", 93, 21, "0100"))
        self.lista.append(Gene("frango 2", 100, 17, "0101"))
        self.lista.append(Gene("almondega 2", 105, 33, "0110"))
        self.lista.append(Gene("almondega 4", 115, 37, "0111"))
        self.lista.append(Gene("almondega", 120, 20, "1000"))
        self.lista.append(Gene("carne 3", 120, 36, "1001"))
        self.lista.append(Gene("frango 4", 121, 30, "1010"))
        self.lista.append(Gene("frango", 128, 27, "1011"))
        self.lista.append(Gene("carne", 140, 35, "1100"))
        self.lista.append(Gene("carne 4", 147, 25, "1101"))
        self.lista.append(Gene("almondega 3", 162, 8, "1110"))
        self.lista.append(Gene("carne 2", 197, 15, "1111"))
        self.code_size = 4

    def __str__(self):
        return str(self.lista)

    def get(self, cod):
        for protein in self.lista:
            if protein.cod == cod:
                return protein

    def get_random(self):
        return random.choice(self.lista)
