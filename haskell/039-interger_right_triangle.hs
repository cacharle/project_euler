-- Integer right triangles
--
-- Problem 39
-- If p is the perimeter of a right angle triangle with integral length sides,
-- {a,b,c}, there are exactly three solutions for p = 120.
--
-- {20,48,52}, {24,45,51}, {30,40,50}
--
-- For which value of p ≤ 1000, is the number of solutions maximised?


import Data.List(maximumBy)

-- 4m20s stucks
main = do
    print (maximumBy (\(_, xs) (_, ys) -> compare (length xs) (length ys)) [
                (p,
                [(a, b, p - a - b) | a <- [1..p], b <- [1..(p-a)],
                validRightTriangle a b (p - a - b)])
            | p <- [1..1000]
          ])

validRightTriangle :: Int -> Int -> Int -> Bool
validRightTriangle a b c = a ^ 2 + b ^ 2 == c ^ 2
