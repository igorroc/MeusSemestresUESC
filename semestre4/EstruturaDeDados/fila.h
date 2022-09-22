#ifndef FILAS_H
#define FILAS_H

typedef struct fila Fila;

Fila* abs_create(float x, float y);

void push(Fila* p, float* x, float* y);
void pop(Fila* p, float x, float y);


#endif