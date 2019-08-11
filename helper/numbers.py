from functools import reduce
from itertools import count


def sum_digits(n):
    return reduce(lambda x, y: x + int(y), str(n), 0)


def triangular(n):
    return n * (n+1) // 2


def pentagonal(n):
    return n * (3*n - 1) // 2


def hexagonal(n):
    return n * (2*n - 1)


def is_triangular(n):
    for i in count(1):
        t = triangular(i)
        if t >= n:
            return t == n


# def is_pentagonal(n):
#     for i in count(1):
#         p = pentagonal(i)
#         if p >= n:
#             return p == n


# def is_hexagonal(n):
#     for i in count(1):
#         h = hexagonal(i)
#         if h >= n:
#             return h == n


def proper_divisors(num):
    divisor = []
    for i in range(1, num):
        if num % i == 0:
            divisor.append(i)
    return divisor
