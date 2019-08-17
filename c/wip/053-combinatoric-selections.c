#include <stdio.h>
#include <stdlib.h>


typedef long long unsigned int Natural;

Natural factorial(Natural n)
{
    if (n == 1 || n == 0) return 1;
    else return n * factorial(n - 1);
}

Natural combination(Natural n, Natural r)
{
    if (r > n) exit(1);
    Natural num = 0;
    /* for (Natural i = 0; i < r - 1; i++) */
    /*     num *= n - i; */
    /* return num / factorial(r); */
    /* if (factorial(r) * factorial(n - r) == 0) return 0; */
    return (factorial(n) / (factorial(r) * factorial(n - r)));
    /* return  (factorial(r) * factorial(n - r)); */
}

int main(void)
{
    printf("10! = %llu\n", factorial(10));
    printf("23! = %llu\n", factorial(23));
    printf("(23 - 10)! = %llu\n", factorial(23 - 10));
    int counter = 0;
    Natural comb = 0, n, r;
    /* for (n = 1; n <= 24; n++) */
    /*     for (r = 1; r <= n; r++) { */
    /*         comb = combination(n, r); */
    /*         if (comb > 1000000) { */
    /*             counter++; */
    /* comb = combination(23, 10); */
                printf("%llu C %llu = %llu\n", n, r, comb);
            /* } */
        /* } */
    printf("counter = %d", counter);
    return 0;
}
