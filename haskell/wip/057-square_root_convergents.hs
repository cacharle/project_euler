------
-- Square root convergents
-- Problem 57
--
-- It is possible to show that the square root of two can be expressed as an infinite
-- continued fraction.
-- √ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...
-- By expanding this for the first four iterations, we get:
-- 1 + 1/2 = 3/2 = 1.5
-- 1 + 1/(2 + 1/2) = 7/5 = 1.4
-- 1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
-- 1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...
-- The next three expansions are 99/70, 239/169, and 577/408, but the eighth expansion,
-- 1393/985, is the first example where the number of digits in the numerator exceeds
-- the number of digits in the denominator.
-- In the first one-thousand expansions, how many fractions contain a numerator
-- with more digits than denominator?
------


data Fraction = Numerator Int | Fraction Fraction Fraction deriving (Show)

main = do
    print (mulF (Fraction (Numerator 1) (Numerator 4)) (Numerator 8))
    -- print (sqrt2Fraction 4)

-- sqrt2Fraction :: Int -> Fraction
-- sqrt2Fraction 1 = Fraction 3 2
-- sqrt2Fraction x = addF (Numerator 1) d
--     where d = Fraction 1 (addF (Numerator 1) (sqrt2Fraction (x - 1)))

-- addF :: Fraction -> Fraction -> Fraction
-- addF (Numerator n1) (Numerator n2) = Numerator (n1 + n2)
-- addF (Numerator n) f = addF (Fraction (Numerator n) (Numerator 1)) f
-- addF f (Numerator n) = addF f (Fraction (Numerator n) (Numerator 1))
-- addF (Fraction n1 d1) (Fraction n2 d2) = Fraction n d
--     where n = addF (mulF n1 d2) (mulF n2 d1)
--           d = mulF d1 d2

mulF :: Fraction -> Fraction -> Fraction
mulF (Numerator n1) (Numerator n2) = Numerator (n1 * n2)
mulF (Numerator n) f = mulF (numToFrac n) f
mulF f (Numerator n) = mulF f (numToFrac n)
mulF f (Numerator n) = mulF f (Fraction (Numerator n) (Numerator 1))
mulF (Fraction n1 d1) (Fraction n2 d2) = Fraction n d
    where n = mulF n1 n2
          d = mulF d1 d2


numToFrac :: Fraction -> Fraction
numToFrac (Numerator n) = Fraction (Numerator n) (Numerator 1)
numToFrac f = f

