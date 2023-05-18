from utils.individual import Individual

from utils.protein import Protein
from utils.carbohydrate import Carbohydrate
from utils.drink import Drink


proteins = Protein()
carbohydrates = Carbohydrate()
drinks = Drink()


class Population:
    def __init__(self, tamanho):
        self.tamanho = tamanho
        self.individuals = []
        self.best_subject = None
        self.generation = 0
        print("Criando população inicial...", tamanho)

    def __str__(self):
        return str(self.individuals)

    def create_population(self):
        for i in range(self.tamanho):
            protein = proteins.get_random()
            carbohydrate = carbohydrates.get_random()
            drink = drinks.get_random()
            individuo = Individual(protein, carbohydrate, drink)
            self.individuals.append(individuo)

    def eval_population(self):
        for individuo in self.individuals:
            if (
                self.best_subject == None
                or individuo.fitness < self.best_subject.fitness
            ):
                self.best_subject = individuo

    def new_generation(self):
        # order by lowest fitness
        self.individuals.sort(key=lambda x: x.fitness)
        self.generation += 1
