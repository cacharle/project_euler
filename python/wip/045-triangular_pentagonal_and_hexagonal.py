from itertools import count
from helper.numbers import triangular, is_pentagonal, is_hexagonal


for i in count(286):
    t = triangular(i)
    if is_pentagonal(t) and is_hexagonal(t):
        print(t)
        break
