#include <stdio.h>

#define N 5
#define M 6

void process(int matrix[N][M], int *positive, int *negative)
{
    *positive = 0;
    *negative = 0;

    for (int i = 0; i < N; i++)
        for (int j = 0; j < M; j++)
            if (matrix[i][j] > 0)
                (*positive)++;
            else if (matrix[i][j] < 0)
                (*negative)++;
}

int main()
{
    int matrix[N][M] = {
        {1, -2, 3, 0, -5, 6},
        {-7, 8, 9, -10, 0, 12},
        {13, -14, 15, -16, 17, -18},
        {-19, 20, -21, 22, -23, 24},
        {25, 0, -27, 28, -29, 30}};

    int positive;
    int negative;

    process(matrix, &positive, &negative);

    printf("%d\n", positive);
    printf("%d\n", negative);

    return 0;
}