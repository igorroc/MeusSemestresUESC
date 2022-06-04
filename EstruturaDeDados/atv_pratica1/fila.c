#ifndef FILAS_C
#define FILAS_C

#include <malloc.h>
#include <stdlib.h>
#include <stdio.h>

#include "fila.h"
#include "list.h"
#include "node.h"

FILA* createqueue(){
    FILA* x;

    x = (FILA*) malloc(sizeof(FILA));
    x->itens = createlist();
    x->itens->first = NULL;

    return x;
}

int q_isEmpty(FILA* p){
    if(p->itens->first == NULL) return 1;
    return 0;
}

void toQueue(FILA* ps, int x){
    if(q_isEmpty(ps)){
      insertfirst(ps->itens, x);
      ps->top = ps->itens->first;
      ps->base = ps->itens->first;
    }else{
      insertlast(ps->itens, x);
      ps->top = ps->top->next;
    }
}

int deQueue(FILA* ps){
    if(q_isEmpty(ps)){
        printf("\n\n----> stack empty <----\n\n");
        return 0;
    }

    ps->base = ps->base->next;
    
    return deletefirst(ps->itens);;
}

int q_getTop(FILA* ps){
    if(q_isEmpty(ps)){
        printf("\n\n----> stack empty <----\n\n");
        return 0;
    }

    return ps->top->info;
}

int q_getBase(FILA* ps){
    if(q_isEmpty(ps)){
        printf("\n\n----> stack empty <----\n\n");
        return 0;
    }

    return ps->base->info;
}

#endif