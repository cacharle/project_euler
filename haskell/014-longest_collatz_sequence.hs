-- Longest Collatz sequence
--
-- Problem 14
-- The following iterative sequence is defined for the set of positive integers:
--
-- n → n/2 (n is even)
-- n → 3n + 1 (n is odd)
--
-- Using the rule above and starting with 13, we generate the following sequence:
--
-- 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
-- It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
-- Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
--
-- Which starting number, under one million, produces the longest chain?
--
-- NOTE: Once the chain starts the terms are allowed to go above one million.


import Data.List

type Sequence = [Int]

main = do
    print (snd $ maximumBy (\(l0, n0) (l1, n1) -> compare l0 l1)
            [(length $ collatz n, n) | n <- [1..1000000]]) -- takes 7s
    -- can be optimise by keeping creating other collatz sequence with the numbers after n

    -- print ([(n, length n_seq) | n <- tails $ collatz 7, length n_seq != 0])
    -- print (collatzLenFrom 1000000)
    -- print (snd $ maximumBy (\(l0, n0) (l1, n1) -> compare l0 l1) (collatzLenBellow 10))
    -- print (collatzLenBellow 10)
    -- print (collatzUntil 10)

collatz :: Int -> [Int]
collatz 1 = [1]
collatz n = case n `mod` 2 of 0 -> n : collatz (n `div` 2)
                              1 -> n : odd_next : collatz (odd_next `div` 2)
            where odd_next = 3 * n + 1

-- need to build a tree, a sequence can merge in another one,
-- reduce calculation cost tremendously (probably)
--
-- collatzUntil :: Int -> [[Int]]
-- collatzUntil n = collatzRange 1 n

-- collatzRange :: Int -> Int -> [[Int]]
-- collatzRange lo hi
--     | lo >= hi = []
--     | otherwise = collatzBase lo

-- collatzLenBellow :: Int -> [(Int, Int)]
-- collatzLenBellow 1 = [(1, 1)]
-- collatzLenBellow up = (collatzLenFrom up) `union` collatzLenBellow (up - 1)

-- collatzLenFrom :: Int -> [(Int, Int)]
-- collatzLenFrom top = [(head seq, length seq) | seq <- init $ tails $ collatz top]
--
-- data Tree a = Empty | Tree a [Tree a]
