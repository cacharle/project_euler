###
# 10001st prime
# Problem 7
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th
# prime is 13.
# What is the 10 001st prime number?
###

using Base.Iterators

# Can't use eratosthenes sieve since we don't know when to stop (no predefined list of numbers)
# A algorithm that caches the previous found primes should be faster
function is_prime(n)
    if n == 2 || n == 3 || n == 5
        return true
    end
    if n % 2 == 0 || n % 3 == 0 || n % 5 == 0
        return false
    end
    for d in 6:6:ceil(Integer, √n) + 1
        if n % (d - 1) == 0 || n % (d + 1) == 0
            return false
        end
    end
    true
end

const PRIME_INDEX = 10_001

result = (
    Iterators.countfrom(2)
    |> x -> Iterators.filter(is_prime, x)
    |> x -> Iterators.take(x, PRIME_INDEX)
    |> collect
)[end]

println(result)
