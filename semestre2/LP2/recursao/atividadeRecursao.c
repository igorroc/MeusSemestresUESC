#include <stdio.h>
#include <stdlib.h>

int fatorial(int);
int somatorio(int);
void crescente(int);
void decrescente(int);
int menor(int*, int);
int soma_vet(int*, int);
int repeticoes(int, int);

int main() {
    int valor = 10, valor2, k;
    int vetor[10];
    printf("Fatorial de %d = %d\n", valor, fatorial(valor));
    printf("Somatorio de %d = %d\n", valor, somatorio(valor));
    crescente(valor);
    printf("\n");
    decrescente(valor);
    printf("\nDigite o vetor de 10 casas: ");
    for (int i = 0; i < 10; i++) {
        scanf("%d", &vetor[i]);
    }
    printf("Menor valor: %d\n", menor(vetor, 10));
    printf("Soma dos valores: %d\n", soma_vet(vetor, 10));
    printf("Digite o numero:");
    scanf("%d", &valor2);
    printf("Digite o valor para pesquisar:");
    scanf("%d", &k);
    printf("O numero %d se repete %d vezes em %d", k, repeticoes(valor2, k), valor2);

    return 0;
}

int fatorial(int n) {
    if (n == 1) {
        return 1;
    } else {
        return n * fatorial(n - 1);
    }
}

int somatorio(int n) {
    if (n == 1) {
        return 1;
    } else {
        return n + somatorio(n - 1);
    }
}

void crescente(int n) {
    if (n == 0) {
        printf("[0]");
    } else {
        crescente(n - 1);
        printf("[%d]", n);
    }
}

void decrescente(int n) {
    if (n == 0) {
        printf("[%d]\n", n);
    } else {
        printf("[%d]", n);
        decrescente(n - 1);
    }
}

int menor(int* vet, int qtd) {
    int m;
    if (qtd == 1) {
        return vet[0];
    }
    m = menor(vet + 1, qtd - 1);
    if (m < vet[0]) {
        return m;
    }
}

int soma_vet(int* vet, int qtd) {
    int soma;
    if (qtd == 1) {
        return vet[0];
    } else {
        return vet[0] + soma_vet(vet + 1, qtd - 1);
    }
}

int repeticoes(int n, int k) {
    int repet = 0;
    if (n < 10) {
        if (n == k) {
            repet = 1;
        }
        return repet;
    } else {
        if (n % 10 == k) {
            return 1 + repeticoes(n / 10, k);
        }
        repeticoes(n / 10, k);
    }
}
