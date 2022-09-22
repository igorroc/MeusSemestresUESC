#ifndef VETORES_H
#define VETORES_H

struct VETOR{
    float a;
    float b;
};

typedef struct VETOR vetor;

vetor cria(float, float);
float modulo(vetor);
float produto(vetor, vetor);
float angulo(vetor, vetor);
int iguais(vetor, vetor);


#endif