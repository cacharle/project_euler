-- Digit fifth powers
--
-- Problem 30
-- Surprisingly there are only three numbers that can be written as the sum of fourth
-- powers of their digits:
--
-- 1634 = 14 + 64 + 34 + 44
-- 8208 = 84 + 24 + 04 + 84
-- 9474 = 94 + 44 + 74 + 44
-- As 1 = 14 is not a sum it is not included.
--
-- The sum of these numbers is 1634 + 8208 + 9474 = 19316.
--
-- Find the sum of all the numbers that can be written as the sum of fifth powers of
-- their digits.


-- there is a limit but who cares (me but im lazy)
main = do
    let pow5 = [x | x <- [2..300000], digitsSumPow 5 x == x]
    -- print (pow5)
    print (sum pow5)

digitsSumPow :: Int -> Int -> Int
digitsSumPow power nb = sum $ map (^power) (digits nb)

digits x = reverse $ revDigits x

revDigits :: Int -> [Int]
revDigits 0 = []
revDigits x = x `mod` 10 : revDigits (x `div` 10)

