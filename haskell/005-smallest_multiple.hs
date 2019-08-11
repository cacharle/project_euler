-- Smallest multiple

-- Problem 5
-- 2520 is the smallest number that can be divided by each of the numbers
-- from 1 to 10 without any remainder.

-- What is the smallest positive number that is evenly divisible by all of
-- the numbers from 1 to 20?


main = do
    print (first_divisible 2520 [1..20])  -- takes 16s

first_divisible :: Int -> [Int] -> Int
first_divisible x divs
    | divisible x divs = x
    | otherwise = first_divisible (x + 2) divs

divisible :: Int -> [Int] -> Bool
divisible _ [] = True
divisible x (d:divs)
    | x `mod` d /= 0 = False
    | otherwise = divisible x divs
