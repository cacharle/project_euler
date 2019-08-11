# https://projecteuler.net/problem=36

sum = 0
for nb in range(1_000_000):
    if str(nb) == str(nb)[::-1] and f'{nb:b}' == f'{nb:b}'[::-1]:
        sum += nb

print(sum)
