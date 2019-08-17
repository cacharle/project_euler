from itertools import count
from helper.prime import is_prime


ab_iter = [(a, b) for b in range(1_001) for a in range(1_000)]

max_product = 0
max_prime_seq = 0
for a, b in ab_iter:
    for n in count():
        if (not is_prime(n**2 + a*n + b)) and n > max_prime_seq:
            max_prime_seq = n
            max_product = a * b
            print(max_product)
            break


