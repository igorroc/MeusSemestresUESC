#ifndef PILHAS_H
#define PILHAS_H

#include "list.h"

struct pilha{
    NODE* top;
    LIST* itens;
};

typedef struct pilha PILHA;

PILHA* createstack();

int isEmpty(PILHA* p);

void push(PILHA* p, int x);
int pop(PILHA* p);

int getTop(PILHA* p);

#endif