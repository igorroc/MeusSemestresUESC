#include <stdio.h>
#include <stdlib.h>

/// QUESTAO 1

void main() {
    int N;
    float *array = NULL, soma = 0;
    scanf("%d", &N);
    array = (float *)calloc(N, sizeof(float));
    for (int i = 0; i < N; i++) {
        scanf("%f", &array[i]);
        soma += array[i];
    }
    printf("Media: %.2f\n", soma / N);
    free(array);
}

/// QUESTAO 2

struct produto {
    char nome[30];
    int codigo;
    float preco;
};

void main() {
    double *array = (double *)calloc(1024 / sizeof(double), sizeof(double));
    int **tabela = (int **)calloc(10, sizeof(int *));
    for (int i = 0; i < 10; i++) {
        tabela[i] = (int *)calloc(10, sizeof(int));
    }
    struct produto *Produto = (struct produto *)calloc(10, sizeof(struct produto));
    free(array);
    free(Produto);
    for (int i = 0; i < 10; i++) {
        free(tabela[i]);
    }
    free(tabela);
}

// QUESTAO 3

void main() {
    int *array = (int *)calloc(1000, sizeof(int));
    int zeros = 0;
    for (int i = 0; i < 1000; i++) {
        if (array[i] == 0) {
            zeros++;
        }
    }
    printf("Contem %d zeros\n", zeros);
    zeros = 0;
    for (int i = 0; i < 1000; i++) {
        array[i] = i;
    }
    for (int i = 0; i < 1000; i++) {
        if (array[i] == 0) {
            zeros++;
        }
    }
    printf("Contem %d zeros\n", zeros);
    for (int i = 0; i < 10; i++) {
        printf("[%d]", array[i]);
    }
    for (int i = 990; i < 1000; i++) {
        printf("[%d]", array[i]);
    }
}

// QUESTAO 4

void aloca_array(int tam, int *array) {
    array = (int *)calloc(tam, sizeof(int));
    for (int i = 0; i < tam; i++) {
        scanf("%d", &array[i]);
    }
}

void maior(int *array, int tam, int *maior, int *menor) {
    int temp_maior, temp_menor;
    temp_maior = temp_menor = array[0];
    for (int i = 1; i < tam; i++) {
        if (array[i] > temp_maior) {
            temp_maior = array[i];
        } else if (array[i] < temp_menor) {
            temp_menor = array[i];
        }
    }
    *maior = temp_maior;
    *menor = temp_menor;
}
