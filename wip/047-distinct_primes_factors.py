from itertools import count
from helper.prime import get_prime_factors, primes_loop

# TROP LENT

def as_four_distinct_prime_factors(num):
    return len(set(get_prime_factors(num))) == 3

def check_next_three(num):
    for i in range(1, 3):
        if not as_four_distinct_prime_factors(num + i):
            return False
    return True


for num in primes_loop():
    if as_four_distinct_prime_factors(num):
        if check_next_three(num):
            print(num)
            break
