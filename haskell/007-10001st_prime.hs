-- 10001st prime

-- Problem 7
-- By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
-- we can see that the 6th prime is 13.

-- What is the 10 001st prime number?


main = do
    print ([x | x <- [1..150000], is_prime x] !! 10000) -- ugly and inefficient
    print (eratos_sieve [2..150000] !! 10000) -- still ugly and inefficient due
                                              -- to the arbirary range
    print (nth_prime 10000) -- better but meh since we're testing every divisor each time,
                            -- should keep a list of them
    -- print (primes !! 10000) -- from the haskell website, stream of numbers (takes forever)

nth_prime :: Int -> Int
nth_prime n = nth_check n 0
    where nth_check n x
            | is_prime x = if n == 0 then x else nth_check (n - 1) (x + 1)
            | otherwise = nth_check n (x + 1)

eratos_sieve :: [Int] -> [Int]
eratos_sieve [] = []
eratos_sieve (x:xs)
    | x * x > last xs = x:xs
    | otherwise = x:eratos_sieve [n | n <- xs, n `mod` x /= 0]

is_prime :: Int -> Bool
is_prime 0 = False
is_prime 1 = False
is_prime 2 = True
is_prime 3 = True
is_prime x
    | x `mod` 2 == 0 || x `mod` 3 == 0 = False
    | otherwise = trial_div 5
    where trial_div d
            | d * d > x = True
            | x `mod` d == 0 || x `mod` (d + 2) == 0 = False
            | otherwise = trial_div (d + 6)

primes :: [Int]
primes = filterPrimes [2..]
    where filterPrimes (p:xs) = p : filterPrimes [x | x <- xs, x `mod` p /= 0]
