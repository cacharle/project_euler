a, b, c = 1, 1, 0
i = 2
while len(str(c)) != 1000:
    c = a + b
    a, b = b, c
    i += 1

print(i)
