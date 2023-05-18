class Gene:
    def __init__(self, name, calories, price, cod):
        self.name = name
        self.calories = calories
        self.price = price
        self.cod = cod

    def __str__(self):
        return self.name
