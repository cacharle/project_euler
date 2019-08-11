from helper.prime import primes_loop, is_prime


def is_truncatable(prime):
    p_str = str(prime)
    for i in range(1, len(p_str)):
        if not is_prime(int(p_str[i:])):
            return False
    for i in range(1, len(p_str)):
        if not is_prime(int(p_str[:-i])):
            return False
    if prime in [2, 3, 5, 7]:
        return False
    return True


trunc_p_list = []
for p in primes_loop():
    if is_truncatable(p):
        trunc_p_list.append(p)
    if len(trunc_p_list) == 11:
        break

print(trunc_p_list)
print(sum(trunc_p_list))
