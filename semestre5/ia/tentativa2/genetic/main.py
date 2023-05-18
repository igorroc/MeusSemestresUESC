import random
from utils.individual import Individual
from utils.population import Population

QTD_MUTATIONS = 0
MUTATION_CHANCE = 5
POPULATION_SIZE = 16
GENERATION_SIZE = 20

pop = Population(POPULATION_SIZE)
pop.create_population()
pop.eval_population()

print("\n\n")

print("• Iniciando algoritmo genético")


print("G", pop.generation, "\t Best:", pop.best_subject)

while pop.generation < GENERATION_SIZE:
    pop.new_generation()

    elite = pop.elitism()
    roulette = pop.roulette()

    new_population = Population(pop.tamanho * 7 / 8)
    new_population.individuals = roulette
    pop.individuals = elite + new_population.cross_over()

    # ! Mutation
    if random.randint(1, 100) <= MUTATION_CHANCE:
        random_index = random.randint(0, len(pop.individuals) - 1)
        pop.individuals[random_index].mutate()
        QTD_MUTATIONS += 1

    pop.eval_population()

    if pop.best_generation - 10 > pop.generation:
        print("• O melhor individuo não muda há 10 gerações")
        break

    print("G", pop.generation, "\t Best:", pop.best_subject)


print("\n")
print("• Relatórios")
print("Mutations:", QTD_MUTATIONS)
print("\n\n")
