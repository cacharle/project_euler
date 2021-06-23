###
# Cubic permutations
# Problem 62
#
# The cube, 41063625 (345^3), can be permuted to produce two other cubes: 56623104 (384^3)
# and 66430125 (405^3). In fact, 41063625 is the smallest cube which has exactly three
# permutations of its digits which are also cube.
# Find the smallest cube for which exactly five permutations of its digits are cube.
###


using Base.Iterators

cache = Dict()

const PERMUTATIONS_COUNT = 5

for n in countfrom(2)
    cube = n ^ 3
    key = sort(collect(string(cube)))
    if !haskey(cache, key)
        cache[key] = [cube]
    else
        push!(cache[key], cube)
    end
    for v in values(cache)
        if length(v) == PERMUTATIONS_COUNT
            println(minimum(v))
            exit(0)
        end
    end
end
