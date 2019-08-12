-- Special Pythagorean triplet
--
-- Problem 9
-- A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
--
-- a^2 + b^2 = c^2
-- For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
--
-- There exists exactly one Pythagorean triplet for which a + b + c = 1000.
-- Find the product abc.


main = do
    print (truncate (pyth_triplet 1 1))

pyth_triplet :: Float -> Float -> Float
pyth_triplet a b
    | a + b + c == 1000 = a * b * c
    | b >= 1000 = pyth_triplet (a + 1) 0
    | otherwise = pyth_triplet a (b + 1)
    where c = sqrt (a ^ 2 + b ^ 2)
