import random
from utils.individual import Individual

from utils.protein import Protein
from utils.carbohydrate import Carbohydrate
from utils.drink import Drink


proteins = Protein()
carbohydrates = Carbohydrate()
drinks = Drink()


class Population:
    def __init__(self):
        self.tamanho = 0
        self.individuals = []
        self.best_subject = None
        self.worst_subject = None
        self.generation = 0
        self.best_generation = 0
        self.code_size = 0

    def __str__(self):
        msg = ""

        for individuo in self.individuals:
            msg += str(individuo) + "\n"

        return msg

    def define_size(self, tamanho):
        self.tamanho = tamanho

    def clone_individuals(self, individuals):
        if len(individuals) == 0:
            return []
        self.individuals = []
        self.tamanho = len(individuals)
        self.code_size = individuals[0].code_size
        for individuo in individuals:
            self.individuals.append(individuo.clone())

    def create_population(self):
        for i in range(self.tamanho):
            protein = proteins.get_random()
            carbohydrate = carbohydrates.get_random()
            drink = drinks.get_random()
            individuo = Individual(protein, carbohydrate, drink)
            self.individuals.append(individuo)
            self.code_size = individuo.code_size

    def eval_population(self):
        overtaking = 0
        for individuo in self.individuals:
            if (
                self.best_subject == None
                or individuo.fitness < self.best_subject.fitness
            ):
                self.best_subject = individuo
                self.best_generation = self.generation
                overtaking += 1
            if (
                self.worst_subject == None
                or individuo.fitness > self.worst_subject.fitness
            ):
                self.worst_subject = individuo
        return overtaking

    def order_by_fitness(self):
        self.individuals.sort(key=lambda x: x.fitness)

    def new_generation(self):
        self.generation += 1

    def elitism(self, size):
        self.order_by_fitness()
        elite = self.individuals[:size]
        return elite

    def roulette(self, size):
        self.order_by_fitness()
        # sorteia aleatoriamente, com peso maior para quem tem menor fitness
        list = []
        max_individuals = size

        # soma todos os fitness
        total_fitness = 0
        for individuo in self.individuals:
            total_fitness += individuo.fitness

        while len(list) < max_individuals:
            # sorteia um número entre 0 e o total de fitness
            sorteio = random.randint(0, total_fitness)

            # percorre a lista de indivíduos, somando o fitness de cada um
            # quando a soma for maior que o sorteio, retorna o individuo
            soma = 0
            for individuo in self.individuals:
                soma += individuo.fitness
                if soma > sorteio:
                    list.append(individuo)

            # se não encontrar nenhum individuo, retorna o último
            list.append(self.individuals[-1])

        return list

    def cross_over(self):
        children = []
        # percorre a lista de indivíduos de 2 em 2
        for i in range(0, self.tamanho, 2):
            # verifica se existe um próximo individuo
            if i + 1 >= self.tamanho:
                break

            # sorteia um ponto de corte
            ponto_corte = random.randint(0, self.code_size)

            codigo_pai1 = self.individuals[i].code[:ponto_corte]
            codigo_mae1 = self.individuals[i + 1].code[ponto_corte:]

            codigo_pai2 = self.individuals[i + 1].code[:ponto_corte]
            codigo_mae2 = self.individuals[i].code[ponto_corte:]

            # define os genes dos filhos
            filho1_code = codigo_pai1 + codigo_mae1
            filho2_code = codigo_pai2 + codigo_mae2

            filho1_protein = filho1_code[:2]
            filho1_carbohydrate = filho1_code[2:5]
            filho1_drink = filho1_code[5:]

            filho2_protein = filho2_code[:2]
            filho2_carbohydrate = filho2_code[2:5]
            filho2_drink = filho2_code[5:]

            protein1 = proteins.get(filho1_protein)
            carbohydrate1 = carbohydrates.get(filho1_carbohydrate)
            drink1 = drinks.get(filho1_drink)

            protein2 = proteins.get(filho2_protein)
            carbohydrate2 = carbohydrates.get(filho2_carbohydrate)
            drink2 = drinks.get(filho2_drink)

            # cria os novos indivíduos
            filho1 = Individual(protein1, carbohydrate1, drink1)
            filho2 = Individual(protein2, carbohydrate2, drink2)

            # adiciona os filhos na nova população
            children.append(filho1)
            children.append(filho2)

        return children
