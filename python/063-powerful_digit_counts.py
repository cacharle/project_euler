###
# Powerful digit counts
# Problem 63
#
# The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit number, 134217728=8^9, is a ninth power.
# How many n-digit positive integers exist which are also an nth power?
###

import itertools

count = 0

for n in itertools.count(1):
    for e in range(1, 400):
        x = n ** e
        l = len(str(x))
        if l == e:
            print(n, "^", e, "=", x)
            count += 1
            print(count)
        elif l > e:
            break
