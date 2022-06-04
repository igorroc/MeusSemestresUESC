#include <stdio.h>
#include <stdlib.h>

int main()
{
    int num, p = 1, z, pot;
    scanf("%d", &num);
    for(int aux = num; num > 0; )
    {
        z = 0;
        pot = 1;
        printf("Num: %d | Aux: %d | Z: %d\n", num, aux, z);
        for( ; aux > 9; aux/=10, z++);
        printf("Num: %d | Aux: %d | Z: %d\n", num, aux, z);
        if(aux != num%10)
        {
            p = 0;
            break;
        }
        for( ; z > 0; z--, pot*=10);
        num -= aux*pot;
        num /= 10;
        aux = num;
        printf("Num: %d | Aux: %d | Z: %d\nfim do ciclo -----\n", num, aux, z);
    }
    if(p == 1)
    {
        printf("O numero eh palindromo");
    }
    else
    {
        printf("O numero nao eh palindromo");
    }
    return 0;
}
