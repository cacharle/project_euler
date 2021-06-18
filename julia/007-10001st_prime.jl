###
# 10001st prime
# Problem 7
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th
# prime is 13.
# What is the 10 001st prime number?
###

using Printf
using Base.Iterators

function is_prime(n)
    if n == 2 || n == 3 || n == 5
        return true
    end
    if n % 2 == 0 || n % 3 == 0 || n % 5 == 0
        return false
    end
    for d in 6:6:Int64(ceil(sqrt(n)) + 1)
        if n % (d - 1) == 0 || n % (d + 1) == 0
            return false
        end
    end
    true
end

counter = 0
for n in Iterators.countfrom(2)
    if is_prime(n)
        global counter += 1
        @printf "%5d: %d\n" counter n
    end
    if counter == 10_001
        break
    end
end
