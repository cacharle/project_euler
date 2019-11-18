# ###
# Consecutive prime sum
# Problem 50
# 
# The prime 41, can be written as the sum of six consecutive primes:
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
# Which prime, below one-million, can be written as the sum of the most consecutive primes?
# ###


from helper.prime import primes_loop, is_prime


sumed = []
ps = []
max_len = 0
for p in primes_loop():
    if p > 20000:
        break
    ps.append(p)
    for i in range(len(ps)):
        s = sum(ps[i:])
        if s > 1000000:
            break
        if is_prime(s) and len(ps) > max_len:
            sumed.append(s)
            max_len = len(ps)

print(sumed[-1])
