from math import floor, sqrt
from itertools import count


def is_prime(number):
    if number == 1:
        return False

    if number == 2:
        return True
    if number > 2 and number % 2 == 0:
        return False

    boundary = floor(sqrt(number)) + 1
    for div in range(3, boundary, 2):
        if number % div == 0:
            return False
    return True


def primes_until(max_range):
    for x in range(2, max_range):
        if is_prime(x):
            yield x


def primes_loop():
    for i in count(2):
        if is_prime(i):
            yield i


def get_prime_factors(num):
    factors = []
    while num > 1:
        for i in primes_loop():
            if num % i == 0:
                factors.append(i)
                num = num // i
                break
    return factors
