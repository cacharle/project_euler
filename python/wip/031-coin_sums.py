coins = [200, 100, 50, 20, 10, 5, 2, 1]

TOTAL = 200
coin_index = 0
combinations = [200]
combination_nb = 1
while True:
    if sum(combinations) == 200:
        coin_index += 1
        combinations[0] = coins[coin_index]


