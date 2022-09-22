#include <math.h>
#include <stdlib.h>
#include "Abstratos.h"

struct abstrato{
    float x;
    float y;
};

Abstrato* abs_create(float x, float y){
    
    Abstrato* p = (Abstrato*) malloc(sizeof(Abstrato));
    if (p != NULL)
    {
        p->x = x;
        p->y = y;
    }

    return p;
}

void abs_get(Abstrato* p, float* x, float* y){
    *x = p->x;
    *y = p->y;
}

void abs_set(Abstrato* p, float x, float y){
    p->x = x;
    p->y = y;
}

float abs(Abstrato* a){
    return sqrt(pow(a->x,2)+pow(a->y,2));
}

void abs_soma(Abstrato* a, Abstrato* b, Abstrato* res){
    return (a->x + b->x)+(a->y + b->y);
}
