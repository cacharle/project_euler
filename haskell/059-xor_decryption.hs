-- XOR decryption
--
-- Problem 59
-- Each character on a computer is assigned a unique code and the preferred standard is
-- ASCII (American Standard Code for Information Interchange). For example,
-- uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.
--
-- A modern encryption method is to take a text file, convert the bytes to ASCII, then
-- XOR each byte with a given value, taken from a secret key. The advantage with the
-- XOR function is that using the same encryption key on the cipher text,
-- restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.
--
-- For unbreakable encryption, the key is the same length as the plain text message,
-- and the key is made up of random bytes. The user would keep the encrypted message
-- and the encryption key in different locations, and without both "halves",
-- it is impossible to decrypt the message.
--
-- Unfortunately, this method is impractical for most users, so the modified method is
-- to use a password as a key. If the password is shorter than the message,
-- which is likely, the key is repeated cyclically throughout the message. The balance
-- for this method is using a sufficiently long password key for security,
-- but short enough to be memorable.
--
-- Your task has been made easy, as the encryption key consists of three lower case characters.
-- Using p059_cipher.txt (right click and 'Save Link/Target As...'),
-- a file containing the encrypted ASCII codes, and the knowledge that the plain text
-- must contain common English words, decrypt the message and find the sum of
-- the ASCII values in the original text.


import Data.Bits(xor)
import Data.Char(ord, chr)
import qualified Data.Map as M

type Frequencies = M.Map Char Int

main = do
    content <- readFile "../data/059_cipher.txt"
    let formatted = map (\s -> read s :: Int) $
            (words $ map (\c -> if c == ',' then ' 'else c) content)
    let freqs = [((applyKey k formatted), frequency $ applyKey k formatted) | k <- keys]
        filtered = filterEnglish freqs
    print (sum (fst $ filtered !! 1))

filterEnglish :: [(a, Frequencies)] -> [(a, Frequencies)]
filterEnglish fs = filter (\(t, f) -> filt_ea (M.lookup 'e' f)) fs
    where filt_ea Nothing = False
          filt_ea (Just freq) = freq > 10

keys = [[ord a, ord b, ord c] | a <- low, b <- low, c <- low]
    where low = ['a'..'z']

applyKey :: [Int] -> [Int] -> [Int]
applyKey key code = zipWith (xor) (cycle key) code

frequency :: [Int] -> Frequencies
frequency code = M.map (\v -> v * 100 `div` length code) counter
    where counter = M.fromListWith (+) (map (\c -> (chr c, 1)) code)
