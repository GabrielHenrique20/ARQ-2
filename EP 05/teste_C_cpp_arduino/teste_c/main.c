#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    clock_t inicio, fim, T;
    float Tempo, media = 0;
    int c;

    int k;

    char i = 3;
    char j = 1;
    
    T = CLOCKS_PER_SEC;
    for (k = 1; k <= 10; k = k + 1)
    {
        inicio = clock();
        for (c = 1; c <= 10000000; c = c + 1) i = i * 3;
        fim = clock();
        Tempo = ((fim - inicio) * 1000 / CLOCKS_PER_SEC);
        printf("\nTempo : %g ms.", Tempo);
        media = media + Tempo;
    }
    printf("\nTempo gasto media: %g ms.", media / 10);
}
