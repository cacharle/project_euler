-- Largest prime factor

-- Problem 3
-- The prime factors of 13195 are 5, 7, 13 and 29.

-- What is the largest prime factor of the number 600851475143 ?


main = do
    print (last $ factors 600851475143)

factors x = trial_division 2 x

trial_division :: Int -> Int -> [Int]
trial_division by x
    | x <= 1 = []
    | x `mod` by == 0 = by:trial_division by (x `div` by)
    | otherwise = trial_division (by + 1) x

