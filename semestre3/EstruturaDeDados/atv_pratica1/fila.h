#ifndef FILAS_H
#define FILAS_H

#include "list.h"

struct filas{
    NODE* top;
    NODE* base;
    LIST* itens;
};

typedef struct filas FILA;

FILA* createqueue();

int q_isEmpty(FILA*);

void toQueue(FILA*, int);
int deQueue(FILA*);

int q_getTop(FILA*);
int q_getBase(FILA*);

#endif