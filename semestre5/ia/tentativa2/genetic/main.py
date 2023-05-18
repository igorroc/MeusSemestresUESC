from utils.individual import Individual
from utils.population import Population

pop = Population(32)
pop.create_population()
pop.eval_population()

print("1- Melhor individuo:", pop.best_subject)


while pop.generation < 1000:
    
    pop.new_generation()

print("2- Melhor individuo:", pop.best_subject)


# mutation = Individual(
#         pop.best_subject.protein,
#         pop.best_subject.carbohydrate,
#         pop.best_subject.drink,
#     )
#     mutation.mutate()
#     if mutation.fitness < pop.best_subject.fitness:
#         pop.best_subject = mutation
