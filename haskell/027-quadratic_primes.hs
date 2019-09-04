------
-- Quadratic primes
-- Problem 27
--
-- Euler discovered the remarkable quadratic formula:
-- $n^2 + n + 41$
-- It turns out that the formula will produce 40 primes for the consecutive integer values
-- $0 \le n \le 39$. However, when $n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41$
-- is divisible by 41, and certainly when $n = 41, 41^2 + 41 + 41$ is clearly divisible by 41.
-- The incredible formula $n^2 - 79n + 1601$ was discovered, which produces 80 primes
-- for the consecutive values $0 \le n \le 79$. The product of the coefficients,
-- −79 and 1601, is −126479.
-- Considering quadratics of the form:
--
-- $n^2 + an + b$, where $|a| < 1000$ and $|b| \le 1000$where $|n|$ is the modulus/absolute
-- value of $n$e.g. $|11| = 11$ and $|-4| = 4$
--
-- Find the product of the coefficients, $a$ and $b$, for the quadratic expression that
-- produces the maximum number of primes for consecutive values of $n$, starting with $n = 0$.
------


import Data.List(maximumBy)

main = do
    let maxTuple = fst $ maximumBy (\(_, l1) (_, l2) -> compare l1 l2)
            [((a, b), length (quadraticPrimes a b)) | a <- [-999..999], b <- [-1000..1000]]
    print (fst maxTuple * snd maxTuple)

quadraticPrimes :: Int -> Int -> [Int]
quadraticPrimes a b = takeWhile isPrime [n ^ 2 + a * n + b | n <- [0..]]

isPrime :: Int -> Bool
isPrime 2 = True
isPrime 3 = True
isPrime x
    | x < 2 = False
    | x `mod` 2 == 0 || x `mod` 3 == 0 = False
    | otherwise = divCheck 5
    where divCheck d
            | d * d > x = True
            | x `mod` d == 0 || x `mod` (d + 2) == 0 = False
            | otherwise = divCheck (d + 6)
