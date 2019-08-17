-- An irrational decimal fraction is created by concatenating the positive integers:
--
-- 0.123456789101112131415161718192021...
--
-- It can be seen that the 12th digit of the fractional part is 1.
--
-- If dn represents the nth digit of the fractional part,
-- find the value of the following expression.
--
-- d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000


-- main = print (1 + sum [9 * 10 ^ i | i <- [0..5]])
main = do
    print (product [champernowne !! (10 ^ i - 1) | i <- [0..6]])

champernowne = concat [showNbr n | n <- [1..]]

showNbr :: Integer -> [Integer]
showNbr x
    | x < 10 = [x]
    | otherwise = showNbr (x `div` 10) ++ [x `mod` 10]
