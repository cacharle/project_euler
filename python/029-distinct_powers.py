nums_range = range(2, 101)

combinations = []
for a in nums_range:
    for b in nums_range:
        combinations.append(a ** b)

print(len(set(combinations)))
