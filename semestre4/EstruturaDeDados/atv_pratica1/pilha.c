#ifndef PILHAS_C
#define PILHAS_C


#include <math.h>
#include <malloc.h>
#include <stdlib.h>
#include <stdio.h>

#include "pilha.h"
#include "list.h"
#include "node.h"

PILHA* createstack(){
    PILHA* x;

    x = (PILHA*) malloc(sizeof(PILHA));
    x->itens = createlist();
    x->itens->first = NULL;

    return x;
}

int isEmpty(PILHA* p){
    if(p->itens->first == NULL) return 1;
    return 0;
}

void push(PILHA* ps, int x){
    if(isEmpty(ps)){
        insertfirst(ps->itens, x);
        ps->top = ps->itens->first;
    }else{
        insertlast(ps->itens, x);
        ps->top = ps->top->next;
    }
}

int pop(PILHA* ps){
    if(isEmpty(ps)){
        printf("\n\n----> stack empty <----\n\n");
        return 0;
    }
    int aux = ps->top->info;

    ps->top = findPreLast(ps->itens->first);
    deletelast(ps->itens);

    return aux;
}

int popn(PILHA* ps, int n){
    PILHA* aux = createstack();

    int removerAte = ps->itens->qt - n;

    for(int i = 0; i < removerAte; i++){
        push(aux, pop(ps));
    }

    int retirado = pop(aux);


    while(!isEmpty(aux)){
        push(ps, pop(aux));
    }

    return retirado;
}

int top(PILHA* ps){
    if(isEmpty(ps)){
        printf("\n\n----> stack empty <----\n\n");
        return 0;
    }

    int aux = pop(ps);

    push(ps, aux);

    return aux;
}

#endif