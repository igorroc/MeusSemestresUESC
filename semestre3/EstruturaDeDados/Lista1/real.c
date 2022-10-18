#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include "Real.h"

#define N_DECIMAL_PRECISION 1000

struct real{
    int left;
    int right;
};

Real* real_create(float x){
    
    Real* p = (Real*) malloc(sizeof(Real));
    if (p != NULL)
    {
        p->left = (int)x;
        p->right = (int)(x*N_DECIMAL_PRECISION)%N_DECIMAL_PRECISION;
    }

    return p;
}

float real_get(Real* p){
    int left = p->left;
    float right = (float)p->right/N_DECIMAL_PRECISION;
    return left+right;
}

void add(Real* a, Real* b, Real* res){
    printf("%d||%d", a->right, b->right);
    int sobra = (a->right+b->right)%N_DECIMAL_PRECISION;
    printf("\n%d", sobra);

}