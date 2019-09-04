------
-- Pandigital products
-- Problem 32
--
-- We shall say that an n-digit number is pandigital if it makes use of all the digits
-- 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
-- The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand,
-- multiplier, and product is 1 through 9 pandigital.
-- Find the sum of all products whose multiplicand/multiplier/product identity can
-- be written as a 1 through 9 pandigital.
-- HINT: Some products can be obtained in more than one way so be sure to only
-- include it once in your sum.
------


import Data.List(sort, nubBy, nub)

main = do
    print (sum $ nub [a * b | a <- [1..2000], b <- [1..2000], isPandigitalProd a b])

isPandigitalProd :: Int -> Int -> Bool
isPandigitalProd a b = sort (revDigits a ++ revDigits b ++ revDigits (a * b)) == [1..9]

revDigits :: Int -> [Int]
revDigits 0 = []
revDigits x = x `mod` 10 : revDigits (x `div` 10)
