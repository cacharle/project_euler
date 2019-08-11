from itertools import permutations


first_primes = [2, 3, 5, 7, 11, 13, 17]
all_pandigital = [int(''.join(map(lambda n: str(n), x))) for x in permutations(range(10)) if x[0] != 0]


def property_check(nb):
    str_nb = str(nb)
    indexs = [1, 2, 3]
    for i in range(7):
        if int(''.join([str_nb[i] for i in indexs])) % first_primes[i] != 0:
            return False
        indexs = [x + 1 for x in indexs]

    return True


nb_sum = 0
for nb in all_pandigital:
    if property_check(nb):
        nb_sum += nb

print(nb_sum)
