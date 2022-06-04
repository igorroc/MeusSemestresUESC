#include <stdio.h>
// #include "questao1.c"

float mediana(float*, int);

float mediana(float* v, int tam){
    float mediana;
    
    if (tam%2 == 0){
        mediana = (v[tam/2] + v[(tam/2)-1]) / 2;
    }else{
        mediana = v[tam/2];
    }
    
    return mediana;
}

#define TAMANHO 3

int main(){
    float x[TAMANHO];

    for (int i = 0; i < TAMANHO; i++){
        x[i] = (i+1)*10;
        printf("[%f]", x[i]);
    }

    printf("\nmediana: %f", mediana(x, TAMANHO));

    return 0;
}