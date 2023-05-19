import random

from utils.protein import Protein
from utils.carbohydrate import Carbohydrate
from utils.drink import Drink

proteins = Protein()
carbohydrates = Carbohydrate()
drinks = Drink()


class Individual:
    def __init__(self, protein, carbohydrate, drink):
        self.protein = protein
        self.carbohydrate = carbohydrate
        self.drink = drink
        self.fitness = (
            protein.calories
            + carbohydrate.calories
            + drink.calories
            + ((protein.price + carbohydrate.price + drink.price) * 10)
        )
        self.gene_size = 3
        self.code_size = (
            self.protein.code_size + self.carbohydrate.code_size + self.drink.code_size
        )
        self.code = self.protein.cod + self.carbohydrate.cod + self.drink.cod

    def __str__(self):
        # return self.code + " = " + str(self.fitness)

        return (
            str(self.protein)
            + " + "
            + str(self.carbohydrate)
            + " + "
            + str(self.drink)
            + " = "
            + str(self.fitness)
        )

    def calcula_fitness(self):
        self.fitness = (
            self.protein.calories
            + self.carbohydrate.calories
            + self.drink.calories
            + ((self.protein.price + self.carbohydrate.price + self.drink.price) * 10)
        )

    def mutate(self):
        gene = random.randint(1, self.gene_size)
        if gene == 1:
            random_protein = proteins.get_random()
            while self.protein == random_protein:
                random_protein = proteins.get_random()
            self.protein = random_protein
        elif gene == 2:
            random_carbohydrate = carbohydrates.get_random()
            while self.carbohydrate == random_carbohydrate:
                random_carbohydrate = carbohydrates.get_random()
            self.carbohydrate = random_carbohydrate
        else:
            random_drink = drinks.get_random()
            while self.drink == random_drink:
                random_drink = drinks.get_random()
            self.drink = random_drink
        self.calcula_fitness()

    def clone(self):
        return Individual(self.protein, self.carbohydrate, self.drink)
