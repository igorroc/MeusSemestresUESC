import random
from utils.individual import Individual
from utils.population import Population

QTD_MUTATIONS = 0
MUTATION_CHANCE = 5
POPULATION_SIZE = 16
GENERATION_SIZE = 20

pop = Population()
pop.define_size(POPULATION_SIZE)
pop.create_population()
pop.eval_population()

print("\n\n")

print("• Iniciando algoritmo genético")


print("G", pop.generation, "\t Best:", pop.best_subject)


while pop.generation < GENERATION_SIZE:
    pop.new_generation()

    elite = Population()
    elite.clone_individuals(pop.elitism())

    roulette = Population()
    roulette.clone_individuals(pop.roulette())

    pop.individuals = elite.individuals + roulette.cross_over()

    # ! Mutation
    if random.randint(1, 100) <= MUTATION_CHANCE:
        random_index = random.randint(0, len(pop.individuals) - 1)
        old = pop.individuals[random_index].clone()
        pop.individuals[random_index].mutate()
        print("• Mutação: ", old, "->", pop.individuals[random_index])
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
