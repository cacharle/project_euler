###
# Highly divisible triangular number
# Problem 12
#
# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th
# triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
# Let us list the factors of the first seven triangle numbers:
#  1: 1 3: 1,3 6: 1,2,3,610: 1,2,5,1015: 1,3,5,1521: 1,3,7,2128: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.
# What is the value of the first triangle number to have over five hundred divisors?
###


using Base.Iterators


# Eddie woo factors: https://www.youtube.com/watch?v=KRfv9pQCTDE
#
# we can skip the numbers after the square root since factors
# come in pairs reflected at the square root
# e.g: 24: 1, 2, 3, 4, 6, 8, 12, 24
#      1 - 24
#      2 - 12
#      3 - 8
#      4 - 6
#
# all non prime numbers have an even number of factors except for the squares
# since they have a "pair" that is the same number
# e.g 16: 1, 2, 4, 8, 16
#     1 - 16
#     2 - 8
#     4 - 4 <<<
#
# square numbers (i.e 4, 9, 16, 25, etc) have 3 divisors unless their root is also a square number
# 4: 1, 2, 4 (2 is prime)
# 9: 1, 3, 9 (3 is prime)
# 16: 1, 2, 4, 8, 16 (4 is square)

function divisor_count(n)
    count = 0
    s = 0
    while true
        s = floor(Integer, √n)
        (n != 1 && s * s == n) || break
        count += 1
        n = s
    end
    for d in 1:s
        if n % d == 0
            count += 2
        end
    end
    return count
end

total = 0
for n in countfrom(1)
    global total += n
    if divisor_count(total) > 500
        println(total)
        break
    end
end

# can't do  countfrom |> cumsum |> takewhile |> last because cumsum doesn't support infinite iterators
