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


main = do
    print ( [x0 + x1 * 10 + x2 * 100 + x3 * 1000 |
               x0 <- [0..9], x1 <- [0..9], x2 <- [0..9], x3 <- [1..9],
               (sum $ map (^4) [x0, x1, x2, x3])
                 == x0 + x1 * 10 + x2 * 100 + x3 * 1000])

    print ( [x0 + x1 * 10 + x2 * 100 + x3 * 1000 + x4 * 10000 |
               x0 <- [0..9], x1 <- [0..9], x2 <- [0..9], x3 <- [0..9], x4 <- [1..9],
               (sum $ map (^5) [x0, x1, x2, x3, x4])
                 == x0 + x1 * 10 + x2 * 100 + x3 * 1000 + x4 * 10000])

-- allPower :: Int -> [Int]
-- allPower
