import math


prime_numbers = []

num = 2
end = False
while not end:
    num_sqrt = math.ceil(math.sqrt(num))

    is_prime = True
    for prime_num in prime_numbers:
        if prime_num < num_sqrt + 1:
            if num % prime_num == 0:
                is_prime = False
        else:
            break

    if is_prime:
        prime_numbers.append(num)
    num += 1

    if len(prime_numbers) == 10001:
        break

print(prime_numbers[-1])
