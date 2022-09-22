#include <stdio.h>
#include <stdlib.h>

/*
    Dado uma lista de "n" numeros,
    faça um programa que leia os numeros e
    determine os "x" maiores numeros.
*/
int main()
{
    int x;
    int max_num, max_maior;
    int vet[100] = { 0 };
    printf("Quantos numeros voce quer ler? \n");
    scanf("%d", &max_num);
    printf("Quantos maiores numeros voce quer descobrir? \n");
    scanf("%d", &max_maior);

    while(max_maior > max_num || max_maior == 0)
    {
        printf("\nVoce tem probleminha?\n");
        setbuf(stdin, NULL);
        getchar();
        setbuf(stdin, NULL);
        system("cls");
        printf("Quantos numeros voce quer ler? \n");
        scanf("%d", &max_num);
        printf("Quantos maiores numeros voce quer descobrir? \n");
        scanf("%d", &max_maior);
    }

    printf("\n");

    for(int i = 0; i < max_num; i++)
    {
        printf("Digite o numero [%d]: ", i+1);
        scanf("%d",  &x);
        vet[i] = x;
    }
    for(int i = 0; i < max_num-1; i++)
    {
        if(vet[i] < vet[i+1])
        {
            int aux = vet[i];
            vet[i] = vet[i+1];
            vet[i+1] = aux;
            i = -1;
        }
    }
    printf("\n\nOs %d maiores numeros foram:", max_maior);
    for(int i = 0; i < max_maior; i++)
    {
        printf(" [%d]", vet[i]);
    }
    return 0;
}
