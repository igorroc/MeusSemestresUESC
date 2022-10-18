#ifndef ABSTRATOS_H
#define ABSTRATOS_H

typedef struct abstrato Abstrato;

Abstrato* abs_create(float x, float y);

void abs_get(Abstrato* p, float* x, float* y);
void abs_set(Abstrato* p, float x, float y);


#endif