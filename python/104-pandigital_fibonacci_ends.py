# ###
# Pandigital Fibonacci ends
# Problem 104
# 
# The Fibonacci sequence is defined by the recurrence relation:
# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
# It turns out that F541, which contains 113 digits, is the first Fibonacci number for which the last nine digits are 1-9 pandigital (contain all the digits 1 to 9, but not necessarily in order). And F2749, which contains 575 digits, is the first Fibonacci number for which the first nine digits are 1-9 pandigital.
# Given that Fk is the first Fibonacci number for which the first nine digits AND the last nine digits are 1-9 pandigital, find k.
# ###


from itertools import count


cache = {1: 1, 2: 1}

def fib(n):
    if n in cache.keys():
        return cache[n]
    cache[n] = fib(n - 1) + fib(n - 2)
    return cache[n]

# print(fib(200))

for n in count(1):
    s = str(fib(n))
    # print(s[:9])

    start = s[:9]
    if '1' in start and '2' in start and'3' in start and '4' in start and '5' in start and '6' in start and '7' in start and '8' in start and '9' in start:
        print(n)
        # print(s[-9:])
        if ''.join(sorted(s[-9:])) == "123456789":
            print(">>>", n)
            break
