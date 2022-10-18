#include <stdio.h>
#include <stdlib.h>
#include "pilha.c"

int queue(Pilha*, float);
float dequeue(Pilha*, Pilha*, float*);

int main(){
    Pilha stack1 = create(), stack2 = create();


    return 0;
}

int queue(Pilha* stk, float valor){
    if(isFull(stk)){
        printf("\n\n----> queue overflow <----\n\n");
        return 0;
    }

    stk->itens[++(stk->top)] = valor;

    return 1;
}

float dequeue(Pilha* stk1, Pilha* stk2, float* valor){
    if(isEmpty(stk1)){
        printf("\n\n----> queue empty <----\n\n");
        return 0;
    }
    float aux;

    stk2->top = -1;
    
    while (!isEmpty(stk1)){
        pop(stk1, &aux);
        push(stk2, aux);
    }
    
    stk2->top -= 1;

    while (!isEmpty(stk1)){
        pop(stk1, &aux);
        push(stk2, aux);
    }

    return 1;
}