a, b, c = 1, 1, 0
result = 0
while b < 4000000:
    c = a
    a = b
    b = b + c
    if b < 4000000 and b % 2 == 0:
        result += b

print(result)
