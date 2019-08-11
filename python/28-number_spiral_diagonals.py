from itertools import count

size = 1001
center = (size-1) // 2
grid = [[None for _ in range(size)] for _ in range(size)]

i = 1
x, y = center, center
for cycle_nb in count():
    grid[x][y] = i
    y += 1
    i += 1

    if grid[0][-1] != None:
        break

    for _ in range(cycle_nb * 2 - 1):
        grid[x][y] = i
        x += 1
        i += 1
    
    for _ in range(cycle_nb * 2):
        grid[x][y] = i
        y -= 1
        i += 1

    for _ in range(cycle_nb * 2):
        grid[x][y] = i
        x -= 1
        i += 1

    for _ in range(cycle_nb * 2):
        grid[x][y] = i
        y += 1
        i += 1


diag_sum = 0
for x, y in zip(range(size), range(size)):
    diag_sum += grid[x][y]

adiag_sum = 0
for x, y in zip(reversed(range(size)), range(size)):
    adiag_sum += grid[x][y]

print(diag_sum + adiag_sum - 1)
