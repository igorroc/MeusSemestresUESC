#ifndef PILHAS_H
#define PILHAS_H

typedef struct pilha Pilha;

Pilha create();

int isFull(Pilha* ps);
int isEmpty(Pilha* ps);

int push(Pilha* p, float x);
int pop(Pilha* p, float* x);

float top(Pilha* ps);

#endif