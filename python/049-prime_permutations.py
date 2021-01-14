###
# Prime permutations
# Problem 49
#
# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
# What 12-digit number do you form by concatenating the three terms in this sequence?
###


import math


def is_prime(n):
    if n % 2 == 0 or n % 3 == 0 or n % 5 == 0:
        return False
    for d in range(6, math.floor(math.sqrt(n)) + 1, 6):
        if n % (d - 1) == 0 or n % (d + 1) == 0:
            return False
    return True


for n1 in range(1001, 10000, 2):
    for n2 in range(n1 + 2, 10000, 2):
        n3 = n2 + (n2 - n1)
        s = sorted(str(n1))
        if s != sorted(str(n2)) or s != sorted(str(n3)):
            continue
        if is_prime(n1) and is_prime(n2) and is_prime(n3):
            print(n1, n2, n3)


