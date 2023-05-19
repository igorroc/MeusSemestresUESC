import random
from utils.population import Population

# Trabalho de Inteligência Artificial
# Algoritmo Genético
# Alunos: Igor, Beatriz, Jefferson e Thalles

# ! Configurações

PRINT_RESULTS = False

MUTATION_CHANCE = 1 # Porcentagem
POPULATION_SIZE = 100
GENERATION_SIZE = 10000
ELITE_SIZE = 1
ROULETTE_SIZE = POPULATION_SIZE - ELITE_SIZE
MAX_GENERATION_WITHOUT_CHANGE = GENERATION_SIZE
KNOW_BEST_SUBJECT_FITNESS = 0 # Para desconhecido, use 0.

# Possível melhor fitness: 378

# ! Variáveis

qtd_mutations = 0
qtd_overtaking_grow = 0
qtd_overtaking_loss = 0
first_best_subject = None
first_worst_subject = None
overtaking_at_generations = []

# ! Inicialização

pop = Population()
pop.define_size(POPULATION_SIZE)
pop.create_population()
pop.eval_population()

first_best_subject = pop.best_subject.clone()
first_worst_subject = pop.worst_subject.clone()

print("\n\n")

print("• Iniciando algoritmo genético, rodando por no máximo", GENERATION_SIZE, "gerações")


if(PRINT_RESULTS):
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
    
    if random.random()*100 <= MUTATION_CHANCE:
        random_index = random.randint(0, len(pop.individuals) - 1)
        old = pop.individuals[random_index].clone()
        pop.individuals[random_index].mutate()
        if(PRINT_RESULTS):
            print("• Mutação: ", old, "→", pop.individuals[random_index])
        qtd_mutations += 1

    parcial_overtaking_grow, parcial_overtaking_loss = pop.eval_population()

    qtd_overtaking_grow += parcial_overtaking_grow
    qtd_overtaking_loss += parcial_overtaking_loss

    if parcial_overtaking_grow > 0:
        overtaking_at_generations.append(pop.generation)
    
    if pop.generation - pop.best_generation > MAX_GENERATION_WITHOUT_CHANGE:
        print(
            f"• O melhor individuo não muda há {MAX_GENERATION_WITHOUT_CHANGE} gerações"
        )
        break
    
    if pop.best_subject.fitness <= KNOW_BEST_SUBJECT_FITNESS:
        break;

    if PRINT_RESULTS:
        print("G", pop.generation, "\t Best:", pop.best_subject.fitness)


print("• Finalizando algoritmo genético")

# ! Resultados

print("\n")
print("• Relatórios")
print("Generations:", pop.generation)
print("PopulationSize:", POPULATION_SIZE)
print("EliteSize:", ELITE_SIZE)
print("MutationChance:", MUTATION_CHANCE)
print("----------------")
print("Mutations:", qtd_mutations)
print("OvertakingGrow:", qtd_overtaking_grow)
print("OvertakingGrowAtGenerations:", overtaking_at_generations)
print("OvertakingLoss:", qtd_overtaking_loss)
print("----------------")
print("FirstBest:", first_best_subject)
print("FirstWorst:", first_worst_subject)
print("----------------")
print("Best:", pop.best_subject)
print("Worst:", pop.worst_subject)
print("\n\n")
