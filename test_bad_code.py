def add_numbers(a, b):
    return a + b

def calculate_average(numbers):
    total = 0
    count = 0
    for num in numbers:
        total += num
        count += 1
    return total/count

class BadClass:
    def __init__(self):
        self.value = None
    
    def set_value(self, val):
        self.value = val
    
    def get_value(self):
        return self.value

def unused_function():
    pass

def missing_type_hints(x):
    return x * 2

def wrong_type_hints(x: str) -> bool:
    return x + 1