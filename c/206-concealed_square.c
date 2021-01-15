/*
* Concealed Square
* Problem 206
*
* Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0, where each “_” is a single digit.
*/

#include <stdio.h>
#include <math.h>
#include <stdbool.h>

typedef long long unsigned int t_llu;

int main(void)
{
	t_llu n = (t_llu)floor(sqrt(1020304050607080900)) - 1000;

	while (true)
	{
		t_llu s = n * n;

		if ((s % 10llu)                   / 1llu                   == 0 &&
			(s % 1000llu)                 / 100llu                 == 9 &&
			(s % 100000llu)               / 10000llu               == 8 &&
			(s % 10000000llu)             / 1000000llu             == 7 &&
			(s % 1000000000llu)           / 100000000llu           == 6 &&
			(s % 100000000000llu)         / 10000000000llu         == 5 &&
			(s % 10000000000000llu)       / 1000000000000llu       == 4 &&
			(s % 1000000000000000llu)     / 100000000000000llu     == 3 &&
			(s % 100000000000000000llu)   / 10000000000000000llu   == 2 &&
			(s % 10000000000000000000llu) / 1000000000000000000llu == 1)
		{
			printf("%llu\n", n);
			printf("%llu\n", s);
			break;
		}
		n++;
	}

	return 0;
}
