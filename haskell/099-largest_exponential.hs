------
-- Largest exponential
-- Problem 99
--
-- Comparing two numbers written in index form like 211 and 37 is not difficult,
-- as any calculator would confirm that 211 = 2048 < 37 = 2187.
-- However, confirming that 632382518061 > 519432525806 would be much more difficult,
-- as both numbers contain over three million digits.
-- Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file
-- containing one thousand lines with a base/exponent pair on each line, determine which
-- line number has the greatest numerical value.
-- NOTE: The first two lines in the file represent the numbers in the example given above.
------


import Data.List(elemIndex, maximumBy)
import Data.Maybe(fromJust)

main = do
    content <- readFile "../data/099_base_exp.txt"
    let base_exp = map (map (\s -> read s :: Integer) . split ',') $ lines content
    print (fst $ maximumBy (\(i, be1) (j, be2) -> compare be1 be2)
            $ map (\(i, be) -> (i, head be ^ last be)) $ zip [1..] base_exp)

split :: Eq a => a -> [a] -> [[a]]
split _ [] = [[]]
split delim str =
    let (before, remainder) = span (/= delim) str
    in  before : case remainder of [] -> []
                                   x  -> split delim $ tail x
