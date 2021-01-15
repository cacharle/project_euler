###
# Digit cancelling fractions
# Problem 33
#
# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify
# it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
#
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
# There are exactly four non-trivial examples of this type of fraction, less than one in value,
# and containing two digits in the numerator and denominator.
#
# If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
###

solution_n = 1
solution_d = 1

for n in range(10, 100):
    for d in range(10, 100):
        if n / d >= 1.0:
            continue
        if n % 10 == 0 or d % 10 == 0:
            continue
        sn = str(n)
        sd = str(d)
        if sn[0] in sd:
            sd = sd.strip(sn[0])
            sn = sn[1]
        elif sn[1] in sd:
            sd = sd.strip(sn[1])
            sn = sn[0]
        else:
            continue
        if len(sn) == 0 or len(sd) == 0 or float(sd) == 0:
            continue
        if int(sn)/ int(sd) == n / d:
            print(n, "/", d)
            solution_n *= n
            solution_d *= d


print(solution_n, "/", solution_d)
print("= 1 / 100")
