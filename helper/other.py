from itertools import permutations


def n_digits_pandigital(n, front_zero=False):
    return [
        int(''.join(map(lambda n: str(n), x)))
        for x in permutations(range(n)) if front_zero or x[0] != 0
    ]
