# matrix = [
#     [131, 673, 234, 103, 18],
#     [201, 96,  342, 965, 150],
#     [630, 803, 746, 422, 111],
#     [537, 699, 497, 121, 956],
#     [805, 732, 524, 37,  331],
# ]

matrix = open(f -> read(f, String), "data/081_matrix.txt") |>
         split |>
         m -> map(l -> map(x -> parse(Int, x), split(l, ",")), m)

for (i, _) in enumerate(matrix)
    for (j, _) in enumerate(matrix[i])
        if i == 1 && j == 1
            continue
        end
        if i == 1
            up = Inf
        else
            up = matrix[i - 1][j]
        end
        if j == 1
            left = Inf
        else
            left = matrix[i][j - 1]
        end
        matrix[i][j] += min(up, left)
    end
end

result = matrix[length(matrix)][length(matrix[1])]

println(result)
