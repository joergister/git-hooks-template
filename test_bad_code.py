from typing import List


# Add a comment to trigger git hooks
def add_numbers(a: float, b: float) -> float:
    return a + b


def calculate_average(numbers: List[float]) -> float:
    total = 0
    count = 0
    for num in numbers:
        total += num
        count += 1
    return total / count


class BadClass:
    def __init__(self) -> None:
        self.value = None

    def set_value(self, val: object) -> None:
        self.value = val

    def get_value(self) -> object:
        return self.value


def unused_function() -> None:
    pass


def missing_type_hints(x: float) -> float:
    return x * 2


def wrong_type_hints(x: str) -> bool:
    return False
