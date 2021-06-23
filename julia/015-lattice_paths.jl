###
# Lattice paths
# Problem 15
#
# Starting in the top left corner of a 2×2 grid, and only being able to move to the right
# and down, there are exactly 6 routes to the bottom right corner.
# How many such routes are there through a 20×20 grid?
###


# memoization is not enough for going deeper in the triangle,
# there is a formula to get the nth row without computing the previous ones
cache = Dict()

function pascal_triangle(n, k)
    key = (n, k)
    if haskey(cache, key)
        return cache[key]
    end
    if n == 0 || k == 0 || n == k
        return 1
    end
    cache[key] = pascal_triangle(n - 1, k - 1) + pascal_triangle(n - 1, k)
    return cache[key]
end

const LATTICE_LENGTH = 20
result = pascal_triangle(2LATTICE_LENGTH, LATTICE_LENGTH)

println(result)
