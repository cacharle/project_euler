import math

for a in range(0, 1000):
    for b in range(1, 1000):
        c = math.sqrt(a ** 2 + b ** 2)
        if a < b < c and a + b + c == 1000:
            print(f'{a} + {b} + {int(c)} = 1000')
            print(f'a × b × c = {int(a * b * c)}')
            break
