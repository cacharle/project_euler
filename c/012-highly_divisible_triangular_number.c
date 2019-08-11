#include <stdio.h>
#include <math.h>


int triangle_number(int nb)
{
    int i, sum = 0;
    for (i = 0; i < nb + 1; i++)
        sum += i;
    return sum;
}

int count_divisors(int nb)
{
    int i, div_nb = 0;
    for (i = 1; i <= sqrt(nb); i++) {
        if (nb % i == 0)
            div_nb += (i != nb / i ? 2 : 1);
    }
    return div_nb;
}

int main(void)
{
    int i, t_nb;

    for (i = 0;; i++) {
        t_nb = triangle_number(i);
        if (count_divisors(t_nb) + 2 > 500)
            break;
    }
    printf("%d", t_nb);

    return 0;
}
