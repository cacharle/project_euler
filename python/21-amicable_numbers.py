from helper.numbers import proper_divisors


amicable_nums = []
for a in range(1, 10_000):
    if a in amicable_nums:
        continue

    b = sum(proper_divisors(a))
    if a != b and sum(proper_divisors(b)) == a:
        amicable_nums.extend([a, b])

print(sum(amicable_nums))
