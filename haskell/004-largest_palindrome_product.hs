-- Largest palindrome product

-- Problem 4
-- A palindromic number reads the same both ways.
-- The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

-- Find the largest palindrome made from the product of two 3-digit numbers.


main = do
    print (maximum [x * y | x <- [0..999], y <- [0..999], is_palindrome (x * y)])

is_palindrome :: Int -> Bool
is_palindrome x = all (\(y, z) -> y == z) $ zip (show x) (rev' $ show x)

rev' :: [a] -> [a]
rev' [] = []
rev' (x:xs) = (rev' xs) ++ [x]
