###
# Summation of primes
# Problem 10
#
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.
###

function eratosthenes_sieve(stop)
    ns = Array(reverse(2:stop))
    primes = []
    while true
        prime = pop!(ns)
        push!(primes, prime)
        if prime > ceil(Integer, √stop)
            return append!(primes, ns)
            break
        end
        filter!(n -> n % prime != 0, ns)
    end
end

result = eratosthenes_sieve(2_000_000 - 1) |> sum

println(result)
