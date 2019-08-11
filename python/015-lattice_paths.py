def build_pascal_triangle(rows):
    triangle = [[0, 1, 0]]
    for i in range(1, rows + 1):
        next_row = [0, 0]
        previous_row = triangle[i - 1]
        for j in range(len(previous_row) - 1):
            next_row.insert(j + 1, previous_row[j] + previous_row[j + 1])
        triangle.append(next_row)
    return triangle


lattice_len = 20
print([
        x[len(x) // 2]
        for i, x in enumerate(build_pascal_triangle(lattice_len * 2))
        if i % 4 == 0
    ][-1])
