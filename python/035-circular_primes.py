from helper.prime import primes_until, is_prime

def rotate_num(l, x):
    l = str(l)
    return int(l[-x:] + l[:-x])

c_nb_list = []
for p in primes_until(1_000_000):
    circular = True
    for k in range(1, len(str(p))):
        if not is_prime(rotate_num(p, k)):
            circular = False
            break
    
    if circular:
        c_nb_list.append(p)

print(c_nb_list)
print(len(c_nb_list))
