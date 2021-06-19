###
# Special Pythagorean triplet
# Problem 9
#
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#  a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.Find the product
# abc.
###


using Base.Iterators


for c in countfrom(1)
    for b in 1:(c - 1)
        for a in 1:(b - 1)
            if  a ^ 2 + b ^ 2 == c ^ 2 && a + b + c == 1000
                println(a * b * c)
                exit(0)
            end
        end
    end
end


