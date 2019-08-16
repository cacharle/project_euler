-- Number letter counts
--
-- Problem 17
-- If the numbers 1 to 5 are written out in words: one, two, three, four, five,
-- then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
--
-- If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words,
-- how many letters would be used?
--
-- NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two)
-- contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
-- The use of "and" when writing out numbers is in compliance with British usage.


-- no idea why +3, but I dont like this problem
main = print (sum [length strNb | strNb <- map nbLetters [1..1000]] + 3)

nbLetters :: Int -> String
nbLetters n =
    let nbLettersRec n key_i
         | fst key == 0 = []
         | n `div` (fst key) /= 0 = (if keyDiv == 100 || keyDiv == 1000
                                        then nbLettersRec (n `div` keyDiv) 0 else "")
                                    ++ (if keyDiv > 10 && keyDiv < 100 then "and" else "" )
                                    ++ snd key ++ nbLettersRec (n `mod` keyDiv) key_i
         | otherwise = nbLettersRec n (key_i + 1)
         where keyDiv = fst key
               key = keys !! key_i
    in nbLettersRec n 0

keys = reverse
    [ (0, "")
    , (1, "one")
    , (2, "two")
    , (3, "three")
    , (4, "four")
    , (5, "five")
    , (6, "six")
    , (7, "seven")
    , (8, "eight")
    , (9, "nine")
    , (10, "ten")
    , (11, "eleven")
    , (12, "twelve")
    , (13, "thirteen")
    , (14, "fourteen")
    , (15, "fifteen")
    , (16, "sixteen")
    , (17, "seventeen")
    , (18, "eighteen")
    , (19, "nineteen")
    , (20, "twenty")
    , (30, "thirty")
    , (40, "forty")
    , (50, "fifty")
    , (60, "sixty")
    , (70, "seventy")
    , (80, "eighty")
    , (90, "ninety")
    , (100, "hundred")
    , (1000, "thousand")
    ]
