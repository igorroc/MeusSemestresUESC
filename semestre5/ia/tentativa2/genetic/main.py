# problema: encontrar o prato menos calórico e mais barato, utilizando algoritmo genético

# as caracteristicas dos pratos são:
# 1 - proteina
# 2 - carboidrato
# 3 - bebida

# um prato é representado por uma lista de 3 elementos, onde cada elemento é um binário

# o objetivo é encontrar o prato com menor valor de fitness

# o valor de fitness é calculado da seguinte forma:

# valor de fitness = calorias + (preço * 10)

# a lista de proteinas é:
# 1 - frango: 100 calorias, 5 reais
# 2 - carne: 200 calorias, 10 reais
# 3 - peixe: 150 calorias, 7 reais
# 4 - almondega: 250 calorias, 12 reais

# a lista de carboidratos é:
# 1 - arroz: 100 calorias, 5 reais
# 2 - macarrao: 200 calorias, 10 reais
# 3 - pure: 150 calorias, 7 reais
# 4 - batata: 250 calorias, 12 reais
# 5 - farofa: 300 calorias, 15 reais
# 6 - feijao: 350 calorias, 17 reais
# 7 - salada: 50 calorias, 2 reais
# 8 - legumes: 100 calorias, 5 reais

# a lista de bebidas é:
# 1 - suco: 100 calorias, 5 reais
# 2 - refrigerante: 200 calorias, 10 reais
# 3 - agua de coco: 20 calorias, 3 reais
# 4 - cerveja: 300 calorias, 15 reais

# o ponto de parada é quando o valor de fitness do melhor individuo não for alterado por 10 gerações

# o valor de fitness do melhor individuo é o menor valor de fitness entre todos os individuos da população

# a população inicial é composta por 32 individuos

# o crossover é feito utilizando um ponto de corte aleatório

# a mutação é feita alterando um bit aleatório

# inicio do codigo

import random

class Gene:
    def __init__(self, nome, calorias, preco, cod):
        self.nome = nome
        self.calorias = calorias
        self.preco = preco
        self.cod = cod
        
    def __str__(self):
        return self.nome

class Proteinas:
    def __init__(self):
        self.lista = []
        self.lista.append(Gene('frango', 100, 5, 1))
        self.lista.append(Gene('carne', 200, 10, 2))
        self.lista.append(Gene('peixe', 150, 7, 3))
        self.lista.append(Gene('almondega', 250, 12, 4))
        
    def __str__(self):
        return str(self.lista)
    
    def get(self, cod):
        for proteina in self.lista:
            if proteina.cod == cod:
                return proteina
            
    def get_random(self):
        return random.choice(self.lista)

class Carboidratos:
    def __init__(self):
        self.lista = []
        self.lista.append(Gene('arroz', 100, 5, 1))
        self.lista.append(Gene('macarrao', 200, 10, 2))
        self.lista.append(Gene('pure', 150, 7, 3))
        self.lista.append(Gene('batata', 250, 12, 4))
        self.lista.append(Gene('farofa', 300, 15, 5))
        self.lista.append(Gene('feijao', 350, 17, 6))
        self.lista.append(Gene('salada', 50, 2, 7))
        self.lista.append(Gene('legumes', 100, 5, 8))
        
    def __str__(self):
        return str(self.lista)
    
    def get(self, cod):
        for carboidrato in self.lista:
            if carboidrato.cod == cod:
                return carboidrato
            
    def get_random(self):
        return random.choice(self.lista)

class Bebidas:
    def __init__(self):
        self.lista = []
        self.lista.append(Gene('suco', 100, 5, 1))
        self.lista.append(Gene('refrigerante', 200, 10, 2))
        self.lista.append(Gene('agua de coco', 20, 3, 3))
        self.lista.append(Gene('cerveja', 300, 15, 4))
        
    def __str__(self):
        return str(self.lista)
    
    def get(self, cod):
        for bebida in self.lista:
            if bebida.cod == cod:
                return bebida
            
    def get_random(self):
        return random.choice(self.lista)

class Individuo:
    def __init__(self, proteina, carboidrato, bebida):
        print("Criando individuo:", proteina, carboidrato, bebida)
        self.proteina = proteina
        self.carboidrato = carboidrato
        self.bebida = bebida
        self.fitness = proteina.calorias + carboidrato.calorias + bebida.calorias + ((proteina.preco + carboidrato.preco + bebida.preco) * 10)
        
    def __str__(self):
        return str(self.proteina) + ' + ' + str(self.carboidrato) + ' + ' + str(self.bebida) + ' = ' + str(self.fitness)
    
    def calcula_fitness(self):
        self.fitness = self.proteina.calorias + self.carboidrato.calorias + self.bebida.calorias + ((self.proteina.preco + self.carboidrato.preco + self.bebida.preco) * 10)
        
    def mutacao(self):
        gene = random.randint(1, 3)
        if gene == 1:
            self.proteina = proteinas.get_random()
        elif gene == 2:
            self.carboidrato = carboidratos.get_random()
        else:
            self.bebida = bebidas.get_random()
        self.calcula_fitness()

proteinas = Proteinas()
carboidratos = Carboidratos()
bebidas = Bebidas()

class Populacao:
    def __init__(self, tamanho):
        self.tamanho = tamanho
        self.individuos = []
        self.melhor_individuo = None
        self.geracao = 0
        print("Criando população inicial...", tamanho)
        
    def __str__(self):
        return str(self.individuos)
    
    def cria_populacao(self):
        for i in range(self.tamanho):
            proteina = proteinas.get_random()
            carboidrato = carboidratos.get_random()
            bebida = bebidas.get_random()
            individuo = Individuo(proteina, carboidrato, bebida)
            self.individuos.append(individuo)
            
    def avalia_populacao(self):
        for individuo in self.individuos:
            if self.melhor_individuo == None or individuo.fitness < self.melhor_individuo.fitness:
                self.melhor_individuo = individuo

pop = Populacao(32)
pop.cria_populacao()
pop.avalia_populacao()

print("Melhor individuo:", pop.melhor_individuo)

pop.melhor_individuo.mutacao()

print("Melhor individuo mutação:", pop.melhor_individuo)