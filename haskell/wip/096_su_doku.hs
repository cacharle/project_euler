-- Su Doku (Japanese meaning number place) is the name given to a popular puzzle concept.
-- Its origin is unclear, but credit must be attributed to Leonhard Euler who invented a
-- similar, and much more difficult, puzzle idea called Latin Squares. The objective of
-- Su Doku puzzles, however, is to replace the blanks (or zeros) in a 9 by 9 grid in such
-- that each row, column, and 3 by 3 box contains each of the digits 1 to 9. Below is an
-- example of a typical starting puzzle grid and its solution grid.
--
-- https://projecteuler.net/problem=96
--
-- A well constructed Su Doku puzzle has a unique solution and can be solved by logic,
-- although it may be necessary to employ "guess and test" methods in order to eliminate
-- options (there is much contested opinion over this). The complexity of the search
-- determines the difficulty of the puzzle; the example above is considered easy because
-- it can be solved by straight forward direct deduction.
--
-- The 6K text file, sudoku.txt (right click and 'Save Link/Target As...'), contains
-- fifty different Su Doku puzzles ranging in difficulty, but all with unique solutions
-- (the first puzzle in the file is the example above).
--
-- By solving all fifty puzzles find the sum of the 3-digit numbers found in the top left
-- corner of each solution grid; for example, 483 is the 3-digit number found in the top
-- left corner of the solution grid above.


import Data.List(transpose, nub, elemIndex)
import Data.Maybe(isJust, fromJust)

main = do
    -- print (reject sudoku)
    -- print (isFull sudoku)
    print sudoku
    -- print (drop 4 sudoku)
    -- print (replaceAt 4 2 sudoku 9)
    print (backtrack $ Just sudoku)

backtrack :: Maybe [[Int]] -> Maybe [[Int]]
backtrack Nothing = Nothing
backtrack (Just square)
    | reject square = Nothing
    | isFull square = Just square
    | otherwise = head $ filter isJust (map backtrack (iterateSquare))
    where iterateSquare = [Just (replaceAt i j square n) | n <- [1..9]]
           where j = fromJust $ head $ filter isJust (map (elemIndex 0) square)
                 i = fromJust $ elemIndex True (map (elem 0) square)

replaceAt :: Int -> Int -> [[Int]] -> Int -> [[Int]]
replaceAt i j xs n = beforeRows ++ middleRow ++ afterRows
    where beforeRows = take i xs
          afterRows = reverse $ take (8 - i) (reverse xs)
          middleRow = [take j row ++ [n] ++ (reverse $ take (8 - i) (reverse row))]
          row = xs !! i

reject :: [[Int]] -> Bool
reject square = not $ all isUniqLine square && all isUniqLine (transpose square)
    where isUniqLine line = length (nub line) == length line

isFull :: [[Int]] -> Bool
isFull square = not $ or $ map (any (/= 0)) square

next :: [[Int]] -> Maybe [[Int]]
next square = Just [[]]


sudoku = [ [0, 0, 3, 0, 2, 0, 6, 0, 0]
         , [9, 0, 0, 3, 0, 5, 0, 0, 1]
         , [0, 0, 1, 8, 0, 6, 4, 0, 0]
         , [0, 0, 8, 1, 0, 2, 9, 0, 0]
         , [7, 0, 0, 0, 0, 0, 0, 0, 8]
         , [0, 0, 6, 7, 0, 8, 2, 0, 0]
         , [0, 0, 2, 6, 0, 9, 5, 0, 0]
         , [8, 0, 0, 2, 0, 3, 0, 0, 9]
         , [0, 0, 5, 0, 1, 0, 3, 0, 0]
         ]

