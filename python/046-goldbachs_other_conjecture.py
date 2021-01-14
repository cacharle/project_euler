###
# Goldbach's other conjecture
# Problem 46
#
# It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
# 9 = 7 + 2×1^2
# 15 = 7 + 2×2^2
# 21 = 3 + 2×3^2
# 25 = 7 + 2×3^2
# 27 = 19 + 2×2^2
# 33 = 31 + 2×1^2
# It turns out that the conjecture was false.
# What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
###


import itertools
import math


def is_prime(n):
    if n == 0 or n == 1:
        return False
    if n == 2 or n == 3 or n == 5 or n == 7:
        return True
    if n % 2 == 0 or n % 3 == 0:
        return False
    for d in range(6, math.ceil(math.sqrt(n)) + 2, 6):
        if n % (d - 1) == 0 or n % (d + 1) == 0:
            return False
    return True


for n in itertools.count(3, 2):
    if is_prime(n):
        continue
    found = False
    s = 0
    for x in itertools.count(1):
        s = 2 * (x * x)
        # print(n, s)
        # print(s)
        if s >= n:
            # if not found:
            #     print(">>>", n)
            break
        if is_prime(n - s):
            # print(n, math.sqrt(s / 2), n - s)
            found = True
            break
    if not found:
        print(n, math.sqrt(s / 2), n -s)
        break

