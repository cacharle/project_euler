from helper.prime import is_prime

prime_numbers = []
for num in range(2, 2_000_000):
    if is_prime(num):
        prime_numbers.append(num)
    num += 1

summation = sum(prime_numbers)
print(summation)
