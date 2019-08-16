-- Power digit sum
--
-- Problem 16
-- 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
--
-- What is the sum of the digits of the number 2^1000?


import Data.Char

main = print (sum [ord x - ord '0' | x <- show (2 ^ 1000)])
