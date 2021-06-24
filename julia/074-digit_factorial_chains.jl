###
# Digit factorial chains
# Problem 74
#
# The number 145 is well known for the property that the sum of the factorial of its digits
# is equal to 145:
# 1! + 4! + 5! = 1 + 24 + 120 = 145
# Perhaps less well known is 169, in that it produces the longest chain of numbers that
# link back to 169; it turns out that there are only three such loops that exist:
# 169 → 363601 → 1454 → 169
# 871 → 45361 → 871
# 872 → 45362 → 872
# It is not difficult to prove that EVERY starting number will eventually get stuck in a
# loop. For example,
# 69 → 363600 → 1454 → 169 → 363601 (→ 1454)
# 78 → 45360 → 871 → 45361 (→ 871)
# 540 → 145 (→ 145)
# Starting with 69 produces a chain of five non-repeating terms, but the longest non-
# repeating chain with a starting number below one million is sixty terms.
# How many chains, with a starting number below one million, contain exactly sixty non-
# repeating terms?
###


const DIGIT_FACTORIALS = Dict(
    n => factorial(n)
    for n in 0:9
)

digit_factorial_sum(n) = sum(DIGIT_FACTORIALS[d] for d in digits(n))

# 46s without cache
# 3s with cache
cache = Dict()
function digit_factorial_chain_length(n)
    if haskey(cache, n)
        return cache[n]
    end
    # put n in the cache to triger cache hit when we encounter n again (when the same cycle starts)
    # pretty neat
    cache[n] = 0
    cache[n] = 1 + digit_factorial_chain_length(digit_factorial_sum(n))
    return cache[n]
end

const CYCLE_LENGTH = 60
const MAX_NUMBER = 1_000_000 - 1

result = count(
    ==(CYCLE_LENGTH),
    digit_factorial_chain_length(n) for n in 1:MAX_NUMBER
)

println(result)

