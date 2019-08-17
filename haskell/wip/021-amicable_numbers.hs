-- Amicable numbers
--
-- Problem 21
-- Let d(n) be defined as the sum of proper divisors of n
-- (numbers less than n which divide evenly into n).
-- If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable
-- pair and each of a and b are called amicable numbers.
--
-- For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
-- therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
--
-- Evaluate the sum of all the amicable numbers under 10000.


-- 5s isnt pretty, divSum is probably the root of evil
main = print (sum $ map fst (filterAmicable [2..10000]))

filterAmicable :: [Int] -> [(Int, Int)]
filterAmicable xs = filter (\(n, s) -> n /= s && any ((==)(s, n)) sums) sums
    where sums = [(x, divSum x) | x <- xs]

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
