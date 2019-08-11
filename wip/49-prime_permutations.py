from itertools import permutations
from helper.prime import is_prime


def constant_inscrease(perms):
    


def get_prime_permutations(nb):
    return sorted([
        int(''.join(x))
        for x in permutations(str(nb), 4)
        if (is_prime(int(''.join(x)))
            and len(str(int(''.join(x)))) == 4)
    ])

# print(get_prime_permutations(1487))
for i in range(1000, 10_000):
    if not is_prime(i):
        continue
    print(get_prime_permutations(i))
#     if all([is_prime(p) for p in permutations]):
#         print(sorted(permutations))
