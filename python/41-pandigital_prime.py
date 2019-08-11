from helper.other import n_digits_pandidital
from helper.prime import is_prime

maximum = 0
for i in range(1, 10):
    for nb in n_digits_pandidital(i):
        if is_prime(nb) and nb > maximum:
            maximum = nb

print(maximum)
