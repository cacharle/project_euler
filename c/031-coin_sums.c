/*
* Coin sums
* Problem 31
*
* In the United Kingdom the currency is made up of pound (£) and pence (p). There are eight coins in general circulation:
* 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p), and £2 (200p).
* It is possible to make £2 in the following way:
* 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
* How many different ways can £2 be made using any number of coins?
*/

#include <stdio.h>

static int count = 0;
static int coins[] = {200, 100, 50, 20, 10, 5, 2, 1};

void solve(int curr_pos)
{
	static int curr[2048] = {0};

	int sum = 0;
	for (int i = 0; i < curr_pos; i++)
		sum += curr[i];
	if (sum == 200)
	{
		count++;
		return;
	}
	if (sum > 200)
		return;
	for (unsigned int i = 0; i < sizeof(coins) / sizeof(coins[0]); i++)
	{
		if (curr_pos != 0 && curr[curr_pos - 1] < coins[i])
			continue;
		curr[curr_pos] = coins[i];
		solve(curr_pos + 1);
	}
}

int main(void)
{
	solve(0);
	printf("%d\n", count);
	return 0;
}
