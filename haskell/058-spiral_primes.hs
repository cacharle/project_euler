------
-- Spiral primes
-- Problem 58
--
-- Starting with 1 and spiralling anticlockwise in the following way,
-- a square spiral with side length 7 is formed.
--
-- 37 36 35 34 33 32 31
-- 38 17 16 15 14 13 30
-- 39 18  5  4  3 12 29
-- 40 19  6  1  2 11 28
-- 41 20  7  8  9 10 27
-- 42 21 22 23 24 25 26
-- 43 44 45 46 47 48 49
--
-- It is interesting to note that the odd squares lie along the bottom right diagonal,
-- but what is more interesting is that 8 out of the 13 numbers lying along both diagonals
-- are prime; that is, a ratio of 8/13 ≈ 62%.
-- If one complete new layer is wrapped around the spiral above, a square spiral
-- with side length 9 will be formed. If this process is continued, what is the side
-- length of the square spiral for which the ratio of primes along both diagonals
-- first falls below 10%?
------


main = do
    print $ firstDropBellow 0.1 0 0

firstDropBellow :: Double -> Int -> Int -> Int
firstDropBellow percent counter n
    | counter /= 0 && primesRatio < percent = 2 * n + 1
    | otherwise = firstDropBellow percent (counter + countPrimes) (n + 1)
    where primesRatio =  (fromIntegral countPrimes + fromIntegral counter)
                         / fromIntegral (4 * n + 1)
          countPrimes = length $ filter id (map isPrime diags)
          diags = [dur, ddl, dul]
          dur = 4 * n ^ 2 - 2 * n + 1
          ddl = 4 * n ^ 2 + 2 * n + 1
          dul = 4 * n ^ 2 + 1

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
