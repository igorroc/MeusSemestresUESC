#ifndef REAL_H
#define REAL_H

typedef struct real Real;

Real* real_create(float x);

float real_get(Real* p);

void add(Real* a, Real* b, Real* res);
void subtract(Real* a, Real* b, Real* res);
void multiply(Real* a, Real* b, Real* res);


#endif