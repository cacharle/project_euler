###
# Distinct primes factors
# Problem 47
#
# The first two consecutive numbers to have two distinct prime factors are:
#
# 14 = 2 × 7
# 15 = 3 × 5
#
# The first three consecutive numbers to have three distinct prime factors are:
#
# 644 = 2² × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19.
#
# Find the first four consecutive integers to have four distinct prime factors each. What is the first of these numbers?
###


import itertools


# from: https://en.wikipedia.org/wiki/Trial_division
def count_prime_factors(num):
    factors = []
    if num % 2 == 0:
        factors.append(2)
    while num % 2 == 0:
        num //= 2
    f = 3
    while f * f <= num:
        if num % f == 0:
            if not f in factors:
                factors.append(f)
            num //= f
        else:
            f += 2
    if num != 1:
        factors.append(num)
    return len(factors)


for n in itertools.count(1):
    if (count_prime_factors(n) == 4 and
        count_prime_factors(n + 1) == 4 and
        count_prime_factors(n + 2) == 4 and
        count_prime_factors(n + 3) == 4):
            print(n)
            break
