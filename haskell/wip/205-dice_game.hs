-- Dice Game
--
-- Problem 205
-- Peter has nine four-sided (pyramidal) dice, each with faces numbered 1, 2, 3, 4.
-- Colin has six six-sided (cubic) dice, each with faces numbered 1, 2, 3, 4, 5, 6.
--
-- Peter and Colin roll their dice and compare totals: the highest total wins. The
-- result is a draw if the totals are equal.
--
-- What is the probability that Pyramidal Pete beats Cubic Colin? Give your answer
-- rounded to seven decimal places in the form 0.abcdefg


import System.Random
import Data.List

main = do
    gen <- getStdGen
    let n = 20000
        peter = map sum $ splitIndex 9 $ randN (1, 4) gen (9 * n)
        colin = map sum $ splitIndex 6 $ randN (1, 6) gen (6 * n)
    let score = length $ filter (\(p, c) -> p > c) (zip peter colin)
    print ((fromIntegral score) / (fromIntegral n))

splitIndex :: Int -> [Int] -> [[Int]]
splitIndex n xs
    | length xs < n = []
    | otherwise = h : splitIndex n t
    where (h, t) = splitAt n xs

randN :: (Int, Int) -> StdGen -> Int -> [Int]
randN _ _ 0 = []
randN r gen n = fst next : randN r (snd next) (n - 1)
    where next = randomR r gen :: (Int, StdGen)

