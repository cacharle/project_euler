-- Square digit chains
--
-- Problem 92
-- A number chain is created by continuously adding the square of the digits in a
-- number to form a new number until it has been seen before.
--
-- For example,
--
-- 44 → 32 → 13 → 10 → 1 → 1
-- 85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89
--
-- Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop.
-- What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.
--
-- How many starting numbers below ten million will arrive at 89?


-- 2m31s (pretty bad)
-- digits concatenating at the end probably takes a lot of time
-- we can stop computing the chain when we hit a previously computed number
-- (from: https://projecteuler.net/thread=92)
main = print (length [n | n <- [1..10000000], chainEnd n == 89])

chainEnd :: Int -> Int
chainEnd n
    | n == 1 || n == 89 = n
    | otherwise = chainEnd (sum $ map (^2) (digits n))
    where digits x
            | x < 10 = [x]
            | otherwise = digits (x `div` 10) ++ [x `mod` 10]
