class Gene:
    def __init__(self, name, calories, price, cod):
        self.name = name
        self.calories = calories
        self.price = price
        self.cod = cod
        self.code_size = len(cod)

    def __str__(self):
        return self.name
