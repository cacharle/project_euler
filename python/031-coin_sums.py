# ###
# Coin sums
# Problem 31
#
# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:
# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
# How many different ways can £2 be made using any number of coins?
# ###


count = 0

def solve(coins):
    s = sum(coins)
    if s == 200:
        global count
        print(count, coins)
        count += 1
        return
    if s > 200:
        return
    for coin in [200, 100, 50, 20, 10, 5, 2, 1]:
        if len(coins) != 0 and coins[-1] < coin:
            continue
        solve(coins + [coin])

solve([])
print(count)
