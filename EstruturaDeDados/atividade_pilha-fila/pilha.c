#include <math.h>
#include <stdlib.h>
#include "pilha.h"

#define STACKSIZE 5

struct pilha{
    int top;
    float itens[STACKSIZE];
};

Pilha create(){
    Pilha x;
    x.top = -1;

    return x;
}

int isFull(Pilha* p){
    if(p->top + 1 == STACKSIZE) return 1;

    return 0;
}

int isEmpty(Pilha* p){
    if(p->top == -1) return 1;

    return 0;
}

int push(Pilha* ps, float x){
    if(isFull(ps)){
        printf("\n\n----> stack overflow <----\n\n");
        return 0;
    }
    ps->top++;
    ps->itens[ps->top] = x;

    return 1;
}

int pop(Pilha* ps, float* x){
    if(isEmpty(ps)){
        printf("\n\n----> stack empty <----\n\n");
        return 0;
    }

    *x = ps->itens[(ps->top)--];

    return 1;
}

float top(Pilha* ps){
    if(isEmpty(ps)){
        printf("\n\n----> stack empty <----\n\n");
        return 0;
    }

    float aux;

    pop(ps, &aux);
    push(ps, aux);

    return aux;
}