------
-- How many reversible numbers are there below one-billion?
-- Problem 145
--
-- Some positive integers n have the property that the sum [ n + reverse(n) ] consists
-- entirely of odd (decimal) digits. For instance, 36 + 63 = 99 and 409 + 904 = 1313.
-- We will call such numbers reversible; so 36, 63, 409, and 904 are reversible.
-- Leading zeroes are not allowed in either n or reverse(n).
-- There are 120 reversible numbers below one-thousand.
-- How many reversible numbers are there below one-billion (10^9)?
------


main = do
    let notZeroEndedNums = filter (\x -> x `mod` 10 /= 0) [1..10 ^ 6]
        revs = filter reversible notZeroEndedNums
    -- print revs
    print (length revs)
    -- print $ length $ filter id $ map reversible notZeroEndedNums
    -- print $ [r2 - r1 | (r1, r2) <- zip revs (tail revs)]

-- countReversible :: Int -> Int
-- countReversible  = 0


reversible :: Int -> Bool
reversible x = allOddDigits (x + rx)
    where rx = read . reverse . show $ x

allOddDigits :: Int -> Bool
allOddDigits x
    | x `mod` 2 == 0 = False
    | x `div` 10 == 0 = True
    | otherwise = allOddDigits (x `div` 10)
