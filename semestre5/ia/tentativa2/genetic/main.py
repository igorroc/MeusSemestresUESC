import random
from utils.population import Population

# Trabalho de Inteligência Artificial
# Algoritmo Genético
# Alunos: Igor, Beatriz, Jefferson e Thalles

# ! Configurações

QTD_MUTATIONS = 0
QTD_OVERTAKING = 0
MUTATION_CHANCE = 15
POPULATION_SIZE = 10
GENERATION_SIZE = 10000
ELITE_SIZE = 1
ROULETTE_SIZE = POPULATION_SIZE - ELITE_SIZE
MAX_GENERATION_WITHOUT_CHANGE = GENERATION_SIZE
FIRST_BEST_SUBJECT = None
FIRST_WORST_SUBJECT = None

# ! Inicialização

pop = Population()
pop.define_size(POPULATION_SIZE)
pop.create_population()
pop.eval_population()

FIRST_BEST_SUBJECT = pop.best_subject.clone()
FIRST_WORST_SUBJECT = pop.worst_subject.clone()

print("\n\n")

print("• Iniciando algoritmo genético")


print("G", pop.generation, "\t Best:", pop.best_subject)

# ! Algoritmo Genético

while pop.generation < GENERATION_SIZE:
    pop.new_generation()

    elite = Population()
    elite.clone_individuals(pop.elitism(ELITE_SIZE))

    roulette = Population()
    roulette.clone_individuals(pop.roulette(ROULETTE_SIZE))

    pop.individuals = elite.individuals + roulette.cross_over()

    # ! Mutation
    if random.randint(1, 100) <= MUTATION_CHANCE:
        random_index = random.randint(0, len(pop.individuals) - 1)
        old = pop.individuals[random_index].clone()
        pop.individuals[random_index].mutate()
        print("• Mutação: ", old, "→", pop.individuals[random_index])
        QTD_MUTATIONS += 1

    QTD_OVERTAKING += pop.eval_population()

    if pop.generation - pop.best_generation > MAX_GENERATION_WITHOUT_CHANGE:
        print(
            f"• O melhor individuo não muda há {MAX_GENERATION_WITHOUT_CHANGE} gerações"
        )
        break

    print("G", pop.generation, "\t Best:", pop.best_subject.fitness)

# ! Resultados

print("\n")
print("• Relatórios")
print("Generations:", pop.generation)
print("PopulationSize:", POPULATION_SIZE)
print("MutationChance:", MUTATION_CHANCE)
print("EliteSize:", ELITE_SIZE)
print("----------------")
print("Mutations:", QTD_MUTATIONS)
print("Overtaking:", QTD_OVERTAKING)
print("----------------")
print("FirstBest:", FIRST_BEST_SUBJECT)
print("Best:", pop.best_subject)
print("FirstWorst:", FIRST_WORST_SUBJECT)
print("Worst:", pop.worst_subject)
print("\n\n")
