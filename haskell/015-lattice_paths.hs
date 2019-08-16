-- Lattice paths
--
-- Problem 15
-- Starting in the top left corner of a 2×2 grid, and only being able to
-- move to the right and down, there are exactly 6 routes to the bottom right corner.
--
-- image: https://projecteuler.net/project/images/p015.png
--
-- How many such routes are there through a 20×20 grid?


main = do
    print (pascalTriangleEntry (20 + 20) 20)
    -- counting number of routes of problem 18
    -- print (sum [pascalTriangleEntry 14 k | k <- [0..14]])

-- https://stackoverflow.com/questions/15580291/how-to-efficiently-calculate-a-row-in-pascals-triangle
-- https://www.wikiwand.com/en/Pascal's_triangle#/Calculating_a_row_or_diagonal_by_itself

-- using the identity: C(n,k+1) = C(n,k) * (n-k) / (k+1)
pascalTriangleEntry :: Int -> Int -> Int
pascalTriangleEntry _ 0 = 1
pascalTriangleEntry n k = (pascalTriangleEntry n (k - 1)) * (n + 1 - k) `div` k


-- naive recursion (factorial are pretty slow)
-- pascalTriangleEntry :: Int -> Int -> Int
-- pascalTriangleEntry _ (-1) = 0
-- pascalTriangleEntry (-1) _ = 0
-- pascalTriangleEntry _ 0 = 1
-- pascalTriangleEntry 0 _ = 1
-- pascalTriangleEntry n k | k == n = 1
-- pascalTriangleEntry n k = pascalTriangleEntry (n - 1) (k - 1) + pascalTriangleEntry (n - 1) k
