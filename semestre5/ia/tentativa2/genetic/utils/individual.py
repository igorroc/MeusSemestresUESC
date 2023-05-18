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

    def __str__(self):
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
        gene = random.randint(1, 3)
        if gene == 1:
            self.protein = proteins.get_random()
        elif gene == 2:
            self.carbohydrate = carbohydrates.get_random()
        else:
            self.drink = drinks.get_random()
        self.calcula_fitness()
