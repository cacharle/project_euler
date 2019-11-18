/*
 * Non-abundant sums
 * Problem 23
 * 
 * A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
 * A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
 * As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
 * Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
 */

#include <stdio.h>
#include <math.h>

int div_sum(int num) 
{ 
	int result = 0; 

	for (int i = 2; i <= sqrt(num); i++) 
	{ 
		if (num % i == 0) 
		{ 
			if (i == num / i) 
				result += i; 
			else
				result += (i + num / i); 
		} 
	} 
	return (result + 1); 
} 

int has_two_sum(int *nums, int nums_size, int target)
{
	for (int i = 0; i < nums_size; i++)
	{
		if (nums[i] >= target)
			return 0;
		for (int j = i; j < nums_size; j++)
			if (nums[i] + nums[j] == target)
				return 1;
	}
	return 0;
}

int main(void)
{
	int nums[28123 + 10];
	int start = 0;
	for (int n = 1; n < 28123; n++)
		if (div_sum(n) > n)
			nums[start++] = n;

	int sum = 0;
	for (int n = 1; n < 28123; n++)
		if (!has_two_sum(nums, start, n))
			sum += n;

	printf("%d\n", sum);

	return 0;
}
