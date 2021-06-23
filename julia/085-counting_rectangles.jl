###
# Counting rectangles
# Problem 85
#
# By counting carefully it can be seen that a rectangular grid measuring 3 by 2 contains
# eighteen rectangles:
# Although there exists no rectangular grid that contains exactly two million rectangles,
# find the area of the grid with the nearest solution.
###


# blackpenredpend: https://www.youtube.com/watch?v=Uq9OXC0Gzgw

using Base.Iterators


const TARGET_RECTANGLES = 2_000_000

combinations_2(n) = (n * (n - 1)) / 2
dist = Inf
for width in countfrom(1), height in 1:width
    count = combinations_2(width + 1) * combinations_2(height + 1)
    global dist = min(dist, abs(TARGET_RECTANGLES - count))
    if dist < 3  # I just tested a bunch of different threshold
        println(width * height)
        break
    end
end
