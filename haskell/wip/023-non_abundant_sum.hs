-- Non-abundant sums
--
-- Problem 23
-- A perfect number is a number for which the sum of its proper divisors is exactly equal
-- to the number. For example, the sum of the proper divisors of 28 would be
-- 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
--
-- A number n is called deficient if the sum of its proper divisors is less than n and
-- it is called abundant if this sum exceeds n.
--
-- As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number
-- that can be written as the sum of two abundant numbers is 24. By mathematical analysis,
-- it can be shown that all integers greater than 28123 can be written as the sum of two
-- abundant numbers. However, this upper limit cannot be reduced any further by analysis
-- even though it is known that the greatest number that cannot be expressed as the sum
-- of two abundant numbers is less than this limit.
--
-- Find the sum of all the positive integers which cannot be written as the sum of two
-- abundant numbers.


import Data.List(nub)

main = do
    -- print (nub [n | n <- [1..28123], a <- abundants, a < n, n - a `notElem` abundants])
    -- print ([n | n <- [1..2812], notAbundantSum n])
    print (length filteredMultiples)
    -- print ([n | n <- filteredMultiples, notAbundantSum n])
    -- print (combkk



filteredMultiples = filter (\n -> n `notElem` abundantsMultiples) [1..20161]
abundantsMultiples = [a * x | a <- abundants, x <- [2..1700], a * x < 20161]

notAbundantSum :: Int -> Bool
notAbundantSum x
    | x > 28123= False
    | otherwise = findAbSum 0
    where findAbSum i
            | curr > x - 12 || i == length abundants = True
            | (x - curr) `elem` abundants = False
            | otherwise = findAbSum (i + 1)
            where curr = abundants !! i

abundants = [n | n <- [1..28123], divSum n > n]

divSum :: Int -> Int
divSum n = factorise 2
    where factorise d
            | d > nSqrt = 1
            | rest == 0 && d /= quotient = d + quotient + factorise (d + 1)
            | rest == 0 && d == quotient = quotient + factorise (d + 1)
            | otherwise = factorise (d + 1)
            where quotient = n `div` d
                  rest = n `mod` d
          nSqrt = floor $ sqrt $ fromIntegral n
