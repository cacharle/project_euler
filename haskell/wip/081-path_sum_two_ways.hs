-- Path sum: two ways
--
-- Problem 81
-- In the 5 by 5 matrix below, the minimal path sum from the top left to the bottom right,
-- by only moving to the right and down, is indicated in bold red and is equal to 2427.
--
-- 131 673 234 103 18
-- 201 96  342 965 150
-- 630 803 746 422 111
-- 537 699 497 121 956
-- 805 732 524 37  331
--
-- Find the minimal path sum, in matrix.txt (right click and "Save Link/Target As..."),
-- a 31K text file containing a 80 by 80 matrix, from the top left to the
-- bottom right by only moving right and down.

main = do
    content <- readFile "../data/081_matrix.txt"
    -- print (content)
    let rhombus = parseMatrix content
    print (rhombus)


rectToRhombus :: [[Int]] -> [[Int]]


parseMatrix :: String -> [[Int]]
parseMatrix str = map (map (\x -> read x :: Int)) strList
    where strList = map (split ',') (lines str)

-- https://gist.github.com/yamanobori-old/0f74739f2a97d31ebe05
split :: Eq a => a -> [a] -> [[a]]
split _ [] = [[]]
split delim str =
    let (before, remainder) = span (/= delim) str
    in  before : case remainder of [] -> []
                                   x  -> split delim $ tail x

