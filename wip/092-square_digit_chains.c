#include <stdio.h>
#include <stdbool.h>
#include <math.h>


int lenHelper(int x)
{
    if (x >= 10000000)   return 8;
    if (x >= 1000000)    return 7;
    if (x >= 100000)     return 6;
    if (x >= 10000)      return 5;
    if (x >= 1000)       return 4;
    if (x >= 100)        return 3;
    if (x >= 10)         return 2;
    return 1;
}

int get_digit(int nb, int digit_index)
{
    if (digit_index == 1)
        return nb % 10;
    
    return (int)(nb / pow(10.0, (double)(digit_index-1))) % 10;
}

int next_iteration(int nb)
{
    int i, sum = 0;
    for (i = 0; i < lenHelper(nb); i++) {
        sum += pow(get_digit(nb, i), 2);
    }
    return sum;
}

bool end_of_square_digit_chain_is_89(int nb)
{
    bool once = false;
    int next_nb;
    for (int i = 0; i < 10; i++) {
        // printf("%d", next_nb);
        next_nb  = next_iteration(nb);
        if (next_nb == 89 || next_nb == 1) {
            if (once) {
                return next_nb == 89 ? true : false;
            }
            once = true;
        }
        nb = next_nb;
    }
    return false;
}


int main(void)
{
    int i, counter = 0;
    for (i = 1; i < 10000000; i++) {
        // printf("%d\n", i);
        if (end_of_square_digit_chain_is_89(i))
            counter++;
            if (i % 1000000 == 0)
                printf("%d\n", counter);
    }

    printf("%d\n", counter);

    return 0;
}



// def end_of_square_digit_chain_is_89(nb):
//     once = False
//     while True:
//         next_nb = sum([int(x)**2 for x in str(nb)])
//         if next_nb == 89 or next_nb == 1:
//             if once:
//                 return True if next_nb == 89 else False
//             once = True
//         nb = next_nb

// counter = 0
// for i in range(1, 10_000_000):
//     if end_of_square_digit_chain_is_89(i):
//         counter += 1
//         if i % 1000_000 == 0:
//             print(counter)
//             pass
// print(counter)
