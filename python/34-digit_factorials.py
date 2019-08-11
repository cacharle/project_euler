from itertools import count
from math import factorial


def is_sum_factorial_digit(num):
    return sum([factorial(int(d)) for d in str(num)]) == num

# il n'y en a que deux, je ne sais pas quelle est la limite
for i in count(3):
    if is_sum_factorial_digit(i):
        print(i)
