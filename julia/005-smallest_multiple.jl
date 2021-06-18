###
# Smallest multiple
# Problem 5
#
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10
# without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from
# 1 to 20?
###

using Base.Iterators

for n in Iterators.countfrom(2, 2)
    # any(d -> n % d != 0, reverse(2:20)) && continue
    found = true
    for d in reverse(2:20)
        if n % d != 0
            found = false
            break
        end
    end
    if found
        println(n)
        break
    end
end
