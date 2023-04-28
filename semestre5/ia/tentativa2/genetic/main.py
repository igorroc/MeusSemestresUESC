import random

class Gene:
    def __init__(self, name, calories, price, cod):
        self.name = name
        self.calories = calories
        self.price = price
        self.cod = cod
        
    def __str__(self):
        return self.name

class Protein:
    def __init__(self):
        self.lista = []
        self.lista.append(Gene('frango', 100, 5, 1))
        self.lista.append(Gene('carne', 200, 10, 2))
        self.lista.append(Gene('peixe', 150, 7, 3))
        self.lista.append(Gene('almondega', 250, 12, 4))
        
    def __str__(self):
        return str(self.lista)
    
    def get(self, cod):
        for protein in self.lista:
            if protein.cod == cod:
                return protein
            
    def get_random(self):
        return random.choice(self.lista)

class Carbohydrate:
    def __init__(self):
        self.lista = []
        self.lista.append(Gene('arroz', 100, 5, 1))
        self.lista.append(Gene('macarrão', 200, 10, 2))
        self.lista.append(Gene('pure', 150, 7, 3))
        self.lista.append(Gene('batata', 250, 12, 4))
        self.lista.append(Gene('farofa', 300, 15, 5))
        self.lista.append(Gene('feijão', 350, 17, 6))
        self.lista.append(Gene('salada', 50, 2, 7))
        self.lista.append(Gene('legumes', 100, 5, 8))
        
    def __str__(self):
        return str(self.lista)
    
    def get(self, cod):
        for carbohydrate in self.lista:
            if carbohydrate.cod == cod:
                return carbohydrate
            
    def get_random(self):
        return random.choice(self.lista)

class Drink:
    def __init__(self):
        self.lista = []
        self.lista.append(Gene('suco', 100, 5, 1))
        self.lista.append(Gene('refrigerante', 200, 10, 2))
        self.lista.append(Gene('água de coco', 20, 3, 3))
        self.lista.append(Gene('cerveja', 300, 15, 4))
        
    def __str__(self):
        return str(self.lista)
    
    def get(self, cod):
        for drink in self.lista:
            if drink.cod == cod:
                return drink
            
    def get_random(self):
        return random.choice(self.lista)

proteins = Protein()
carbohydrates = Carbohydrate()
drinks = Drink()

class Individuo:
    def __init__(self, protein, carbohydrate, drink):
        print("Criando individuo:", protein, carbohydrate, drink)
        self.protein = protein
        self.carbohydrate = carbohydrate
        self.drink = drink
        self.fitness = protein.calories + carbohydrate.calories + drink.calories + ((protein.price + carbohydrate.price + drink.price) * 10)
        
    def __str__(self):
        return str(self.protein) + ' + ' + str(self.carbohydrate) + ' + ' + str(self.drink) + ' = ' + str(self.fitness)
    
    def calcula_fitness(self):
        self.fitness = self.protein.calories + self.carbohydrate.calories + self.drink.calories + ((self.protein.price + self.carbohydrate.price + self.drink.price) * 10)
        
    def mutate(self):
        gene = random.randint(1, 3)
        if gene == 1:
            self.protein = proteins.get_random()
        elif gene == 2:
            self.carbohydrate = carbohydrates.get_random()
        else:
            self.drink = drinks.get_random()
        self.calcula_fitness()


class Population:
    def __init__(self, tamanho):
        self.tamanho = tamanho
        self.individuals = []
        self.melhor_individuo = None
        self.generation = 0
        print("Criando população inicial...", tamanho)
        
    def __str__(self):
        return str(self.individuals)
    
    def cria_population(self):
        for i in range(self.tamanho):
            protein = proteins.get_random()
            carbohydrate = carbohydrates.get_random()
            drink = drinks.get_random()
            individuo = Individuo(protein, carbohydrate, drink)
            self.individuals.append(individuo)
            
    def avalia_Population(self):
        for individuo in self.individuals:
            if self.melhor_individuo == None or individuo.fitness < self.melhor_individuo.fitness:
                self.melhor_individuo = individuo

pop = Population(32)
pop.cria_population()
pop.avalia_Population()

print("Melhor individuo:", pop.melhor_individuo)

pop.melhor_individuo.mutate()

print("Melhor individuo mutação:", pop.melhor_individuo)