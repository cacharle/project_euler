###
# Largest prime factor
# Problem 3
#
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?
###

const NUMBER = 600851475143

function factors(n)
    factors = []
    while n > 1
        for d in 2:n
            if n % d == 0
                n ÷= d
                push!(factors, d)
                break
            end
        end
    end
    factors
end

println(maximum(factors(NUMBER)))
