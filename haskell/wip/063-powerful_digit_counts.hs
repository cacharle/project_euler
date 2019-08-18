-- Powerful digit counts
--
-- Problem 63
-- The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit number,
-- 134217728=8^9, is a ninth power.
--
-- How many n-digit positive integers exist which are also an nth power?


-- when should i stop ? (maybe stop searching when x ^ y has more than y digits)
main = do
    -- print (numbers)
    print (length numbers)

numbers = [x ^ y| x <- [1..200], y <- [1..x], digitCount (x ^ y) == y]

digitCount :: Integer -> Integer
digitCount n
  | n < 10 = 1
  | otherwise = 1 + digitCount (n `div` 10)
