import random
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
        self.best_generation = 0

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
                self.best_generation = self.generation

    def order_by_fitness(self):
        self.individuals.sort(key=lambda x: x.fitness)

    def new_generation(self):
        self.generation += 1

    def elitism(self):
        self.order_by_fitness()
        elite = self.individuals[: int(self.tamanho / 8)]
        return elite

    def roulette(self):
        self.order_by_fitness()
        # sorteia aleatoriamente, com peso maior para quem tem menor fitness
        list = []
        max_individuals = int(self.tamanho * 7 / 8)

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
        # sorteia um ponto de corte
        ponto_corte = random.randint(0, self.individuals[0].code_size)

        children = []
        # percorre a lista de indivíduos de 2 em 2
        for i in range(0, len(self.individuals), 2):
            # verifica se existe um próximo individuo
            if i + 1 >= len(self.individuals):
                break
            # pega o código do primeiro individuo até o ponto de corte
            codigo_pai1 = self.individuals[i].code[:ponto_corte]
            # pega o código do segundo individuo após o ponto de corte
            codigo_mae1 = self.individuals[i + 1].code[ponto_corte:]
            # faz o mesmo para o segundo individuo
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

            # cria os novos individuos
            filho1 = Individual(protein1, carbohydrate1, drink1)
            filho2 = Individual(protein2, carbohydrate2, drink2)

            # adiciona os filhos na nova população
            children.append(filho1)
            children.append(filho2)

        return children
