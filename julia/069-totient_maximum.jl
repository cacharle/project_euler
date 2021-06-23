###
# Totient maximum
# Problem 69
#
# Euler's Totient function, φ(n) [sometimes called the phi function], is used to determine
# the number of numbers less than n which are relatively prime to n. For example, as 1, 2,
# 4, 5, 7, and 8, are all less than nine and relatively prime to nine, φ(9)=6.
# n
# Relatively Prime
# φ(n)
# n/φ(n)
# 2  | 1           | 1 | 2
# 3  | 1,2         | 2 | 1.5
# 4  | 1,3         | 2 | 2
# 5  | 1,2,3,4     | 4 | 1.25
# 6  | 1,5         | 2 | 3
# 7  | 1,2,3,4,5,6 | 6 | 1.1666...
# 8  | 1,3,5,7     | 4 | 2
# 9  | 1,2,4,5,7,8 | 6 | 1.5
# 10 | 1,3,7,9     | 4 | 2.5
# It can be seen that n=6 produces a maximum n/φ(n) for n ≤ 10.
# Find the value of n ≤ 1,000,000 for which n/φ(n) is a maximum.
###


# euler product formula: https://en.wikipedia.org/wiki/Euler%27s_totient_function#Euler's_product_formula
# https://cp-algorithms.com/algebra/phi-function.html

# where p is prime:
# rule 1: ϕ(p)   = p - 1
# rule 2: ϕ(p^k) = p^k - p^(k - 1)    k - 1 is the number of times p^k is divisible by p
#                                     (exploit powers factors, same reason we can stop at √n when checking for prime)
#
# where a and b a relativly prime
# rule 3: ϕ(ab)  = ϕ(a)ϕ(b)


function totient_sieve(n)
    totients = Array(1:n)
    # if number is composed of multiple primes we use rule 3 to apply rule 2 multiple times
    for i in 2:n
        if totients[i] == i  # only enter for prime since other number were previously subtracted
            for j in i:i:n   # iterate over primes powers (see rule 2 above)
                totients[j] = totients[j] - totients[j] ÷ i
            end
        end
    end
    return totients
end


result = argmax([i / t for (i, t) in enumerate(totient_sieve(1_000_000))])

println(result)
