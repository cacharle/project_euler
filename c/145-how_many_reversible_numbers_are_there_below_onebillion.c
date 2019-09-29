/*
* How many reversible numbers are there below one-billion?
* Problem 145
*
* Some positive integers n have the property that the sum [ n + reverse(n) ] consists entirely of odd (decimal) digits. For instance, 36 + 63 = 99 and 409 + 904 = 1313. We will call such numbers reversible; so 36, 63, 409, and 904 are reversible. Leading zeroes are not allowed in either n or reverse(n).
* There are 120 reversible numbers below one-thousand.
* How many reversible numbers are there below one-billion (109)?
*/

#include <stdio.h>
#include <stdbool.h>

int reverse(int n);
bool is_reversible(int n);

int main(void)
{
    int counter = 0;
    for (int i = 0; i < 1000000000; i++)
    {
        if (i % 10 == 0)
            continue;
        if (is_reversible(i))
            counter++;
    }
    printf("%d\n", counter);
    return 0;
}

bool is_reversible(int n)
{
    int sum = n + reverse(n);
    while (sum > 0)
    {
        if ((sum % 10) % 2 == 0)
            return false;
        sum /= 10;
    }
    return true;
}

int reverse(int n)
{
    int rn = 0;
    while (n > 0)
    {
        rn *= 10;
        rn += n % 10;
        n /= 10;
    }
    return rn;
}
