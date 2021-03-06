-- Factorial digit sum
--
-- Problem 20
-- n! means n × (n − 1) × ... × 3 × 2 × 1
--
-- For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
-- and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
--
-- Find the sum of the digits in the number 100!


import Data.Char

main = print (sum [ord x - ord '0' | x <- show $ factorial' 100])

factorial' :: Integer -> Integer
factorial' 0 = 0
factorial' 1 = 1
factorial' n = n * factorial' (n - 1)
