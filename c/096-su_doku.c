/*
 *
 * Su Doku (Japanese meaning number place) is the name given to a popular puzzle concept.
 * Its origin is unclear, but credit must be attributed to Leonhard Euler who invented a
 * similar, and much more difficult, puzzle idea called Latin Squares. The objective of
 * Su Doku puzzles, however, is to replace the blanks (or zeros) in a 9 by 9 grid in such
 * that each row, column, and 3 by 3 box contains each of the digits 1 to 9. Below is an
 * example of a typical starting puzzle grid and its solution grid.
 *
 * https://projecteuler.net/problem=96
 *
 * A well constructed Su Doku puzzle has a unique solution and can be solved by logic,
 * although it may be necessary to employ "guess and test" methods in order to eliminate
 * options (there is much contested opinion over this). The complexity of the search
 * determines the difficulty of the puzzle; the example above is considered easy because
 * it can be solved by straight forward direct deduction.
 *
 * The 6K text file, sudoku.txt (right click and 'Save Link/Target As...'), contains
 * fifty different Su Doku puzzles ranging in difficulty, but all with unique solutions
 * (the first puzzle in the file is the example above).
 *
 * By solving all fifty puzzles find the sum of the 3-digit numbers found in the top left
 * corner of each solution grid; for example, 483 is the 3-digit number found in the top
 */

#include <stdio.h>
#include <stdbool.h>

bool solve(int square[9][9]);
bool find_next_unassigned(int square[9][9], int *row, int *col);
bool is_alone(int square[9][9], int value, int row, int col);
void parse_data(FILE *f, int sudokus[50][9][9]);

int main(void)
{
    /* int sudoku[9][9] = { */
    /*     {0, 0, 3, 0, 2, 0, 6, 0, 0}, */
    /*     {9, 0, 0, 3, 0, 5, 0, 0, 1}, */
    /*     {0, 0, 1, 8, 0, 6, 4, 0, 0}, */
    /*     {0, 0, 8, 1, 0, 2, 9, 0, 0}, */
    /*     {7, 0, 0, 0, 0, 0, 0, 0, 8}, */
    /*     {0, 0, 6, 7, 0, 8, 2, 0, 0}, */
    /*     {0, 0, 2, 6, 0, 9, 5, 0, 0}, */
    /*     {8, 0, 0, 2, 0, 3, 0, 0, 9}, */
    /*     {0, 0, 5, 0, 1, 0, 3, 0, 0} */
    /* }; */
    /* for (int i = 0; i < 9; i++) */
    /* { */
    /*     for (int j = 0; j < 9; j++) */
    /*         printf("%d ", sudoku[i][j]); */
    /*     printf("\n"); */
    /* } */
    /* printf("%d\n", solve(sudoku)); */
    /* for (int i = 0; i < 9; i++) */
    /* { */
    /*     for (int j = 0; j < 9; j++) */
    /*         printf("%d ", sudoku[i][j]); */
    /*     printf("\n"); */
    /* } */
    int sudokus[50][9][9];
    char *filename = "../data/096_sudoku.txt";
    FILE *f = fopen(filename, "r");
    if (f == NULL)
    {
        fprintf(stderr, "Error: cannot open %s", filename);
        return 1;
    }
    parse_data(f, sudokus);
    for (int i = 0; i < 50; i++)
        printf("%d %d\n", i, solve(sudokus[i]));

    for (int k = 0; k < 50; k++)
    {
        for (int i = 0; i < 9; i++)
        {
            for (int j = 0; j < 9; j++)
                printf("%d ", sudokus[k][i][j]);
            printf("\n");
        }
        printf("\n");
    }
    int total = 0;
    for (int i = 0; i < 50; i++)
        total += 100 * sudokus[i][0][0] + 10 * sudokus[i][0][1] + sudokus[i][0][2];
    printf("total = %d", total);
    fclose(f);
    return 0;
}

bool solve(int square[9][9])
{
	int row, col;

	if (!find_next_unassigned(square, &row, &col))
		return true;
    for (int i = 1; i <= 9; i++)
	{
		if (!is_alone(square, i, row, col))
			continue ;
		square[row][col] = i;
		if (solve(square))
			return true;
		square[row][col] = 0;
	}
	return false;
}

bool find_next_unassigned(int square[9][9], int *row, int *col)
{
    for (*row = 0; *row < 9; (*row)++)
    {
        for (*col = 0; *col < 9; (*col)++)
			if (square[*row][*col] == 0)
				return true;
    }
	return false;
}

bool is_alone(int square[9][9], int value, int row, int col)
{
    int i, j;
    for (i = 0; i < 9; i++)
		if (i != col && square[row][i] == value)
			return false;
    for (i = 0; i < 9; i++)
		if (i != row && square[i][col] == value)
			return false;
    int sub_i = row / 3;
    int sub_j = col / 3;
    for (i = 0; i < 3; i++)
        for (j = 0; j < 3; j++)
            if (square[sub_i * 3 + i][sub_j * 3 + j] == value)
                return false;
	return true;
}

void parse_data(FILE *f, int sudokus[50][9][9])
{
    char c;
    int sudoku_i = 0;
    int i = 0;
    int j = 0;
    fseek(f, 8, SEEK_SET);
    /* printf("%d\n", ftell(f)); */
    while ((c = fgetc(f)) != EOF)
    {
        /* printf("%c\n", c); */
        /* printf("i%d, j%d\n", i, j); */
        /* if (i == 2) */
        /*     break; */
        if (c == '\n')
        {
            j = 0;
            i++;
        }
        else if (c == 'G')
        {
            fseek(f, 7, SEEK_CUR);
            sudoku_i++;
            i = 0;
            j = 0;
        }
        else
        {
            sudokus[sudoku_i][i][j] = c - '0';
            j++;
        }
    }
}
