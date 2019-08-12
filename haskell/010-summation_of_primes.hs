-- Summation of primes

-- Problem 10
-- The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

-- Find the sum of all the primes below two million.


main = do
    print (sum $ eratos_sieve [2..1999999])

eratos_sieve :: [Int] -> [Int]
eratos_sieve [] = []
eratos_sieve (x:xs)
    | x * x > last xs = x:xs
    | otherwise = x:eratos_sieve [n | n <- xs, n `mod` x /= 0]
