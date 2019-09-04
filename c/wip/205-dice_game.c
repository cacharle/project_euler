/*
 * Dice Game
 *
 * Problem 205
 * Peter has nine four-sided (pyramidal) dice, each with faces numbered 1, 2, 3, 4.
 * Colin has six six-sided (cubic) dice, each with faces numbered 1, 2, 3, 4, 5, 6.
 *
 * Peter and Colin roll their dice and compare totals: the highest total wins. The
 * result is a draw if the totals are equal.
 *
 * What is the probability that Pyramidal Pete beats Cubic Colin? Give your answer
 * rounded to seven decimal places in the form 0.abcdefg
 */


#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int rand_peter(void);
int rand_colin(void);
int rand_range(int lo, int hi);

int main(void)
{
    srand(time(NULL));

    int i, j, peter_total, colin_total;
    long unsigned int n = 400000;
    long unsigned int score = 0;
    for (j = 0; j < n; j++)
    {
        peter_total = 0;
        for (i = 0; i < 9; i++)
            peter_total += rand() % 4;

        colin_total = 0;
        for (int i = 0; i < 6; i++)
            colin_total += rand() % 6;

        if (peter_total > colin_total)
            score++;
    }

    double ratio = (double)score / (double)n;
    printf("%.7f", ratio);
    return 0;
}


// other retarded try

/* #include <stdio.h> */
/* #include <time.h> */
/* #include <stdlib.h> */
/*  */
/* #define PETER_SIZE (4 * 4 * 4 * 4 * 4 * 4 * 4 * 4 * 4) */
/* #define COLIN_SIZE (6 * 6 * 6 * 6 * 6 * 6) */
/*  */
/* void init_peter(int peter[PETER_SIZE]); */
/* void init_colin(int colin[COLIN_SIZE]); */
/*  */
/* int main(void) */
/* { */
/*     int i; */
/*     int peter[PETER_SIZE]; */
/*     int colin[COLIN_SIZE]; */
/*     init_peter(peter); */
/*     init_colin(colin); */
/*  */
/*     long int sum_peter = 0; */
/*     for (i = 0; i < PETER_SIZE; i++) */
/*         sum_peter += peter[i]; */
/*     #<{(| for (i = 0; i < 100; i++) |)}># */
/*     #<{(|     printf("%d ", peter[i]); |)}># */
/*  */
/*     long int sum_colin = 0; */
/*     for (i = 0; i < COLIN_SIZE; i++) */
/*         sum_colin += colin[i]; */
/*  */
/*     printf("%d, %d\n", sum_peter, sum_colin); */
/*     printf("%d, %d\n", PETER_SIZE, COLIN_SIZE); */
/*  */
/*     double avg_peter = (double)sum_peter / (double)PETER_SIZE; */
/*     double avg_colin = (double)sum_colin / (double)COLIN_SIZE; */
/*     printf("%f, %f\n", avg_peter, avg_colin); */
/*  */
/*     printf("%.7f", avg_colin / avg_peter); */
/*  */
/*     return 0; */
/* } */
/*  */
/* void init_peter(int peter[PETER_SIZE]) */
/* { */
/*     int j = 0; */
/*     int a, b, c, d, e, f, g, h, i; */
/*     for (a = 1; a <= 4; a++) */
/*     for (b = 1; b <= 4; b++) */
/*     for (c = 1; c <= 4; c++) */
/*     for (d = 1; d <= 4; d++) */
/*     for (e = 1; e <= 4; e++) */
/*     for (f = 1; f <= 4; f++) */
/*     for (g = 1; g <= 4; g++) */
/*     for (h = 1; h <= 4; h++) */
/*     for (i = 1; i <= 4; i++, j++) */
/*         peter[j] = a + b + c + d + e + f + g + h + i; */
/* } */
/*  */
/* void init_colin(int colin[COLIN_SIZE]) */
/* { */
/*     int j = 0; */
/*     int a, b, c, d, e, f; */
/*     for (a = 1; a <= 6; a++) */
/*     for (b = 1; b <= 6; b++) */
/*     for (c = 1; c <= 6; c++) */
/*     for (d = 1; d <= 6; d++) */
/*     for (e = 1; e <= 6; e++) */
/*     for (f = 1; f <= 6; f++, j++) */
/*         colin[j] = a + b + c + d + e + f; */
/* } */
