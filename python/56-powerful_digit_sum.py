from helper.numbers import sum_digits

max_sum = 0
for a in range(100):
    for b in range(100):
        s = sum_digits(a ** b)
        if s > max_sum:
            max_sum = s

print(max_sum)
