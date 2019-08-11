names = []
with open('./helper/data/names.txt', 'r') as file:
    names = sorted([n[1:-1] for n in file.read().split(',')])

total = 0
for i, name in enumerate(names):
    total += sum([ord(s) - 64 for s in name]) * (i + 1)

print(total)
