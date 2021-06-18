###
# Largest palindrome product
# Problem 4
#
# A palindromic number reads the same both ways. The largest palindrome made from the
# product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.
###

function is_palindrom(n)
    s = string(n)
    s == reverse(s)
end


top = -1

for x in 100:999
    for y in 100:999
        if is_palindrom(x * y)
            global top = max(top, x * y)
        end
    end
end

println(top)
