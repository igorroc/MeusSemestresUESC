#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include <algorithm>
#include <iostream>
#include <cstdlib>

using namespace std;

typedef struct{
    float size, price, pricePerSize;
}QUEIJO;

void calculatePricePerSize(QUEIJO*, int);
int getCubesQuantity(QUEIJO*, int, int);
bool compare(QUEIJO, QUEIJO);

int main(void){
    int quantity, budget, result;
    int aux, i;

    scanf("%d %d", &quantity, &budget);

    QUEIJO *q = (QUEIJO* ) malloc(quantity * sizeof(QUEIJO) );

    for (i = 0; i < quantity; i++) {
        scanf("%f", &q[i].size);
    }

    for (i = 0; i < quantity; i++) {
        scanf("%f", &q[i].price);
    }

    calculatePricePerSize(q, quantity);

    sort(q, q+quantity, compare);

    aux = getCubesQuantity(q, quantity, budget);

    result = (-0.5 + sqrt(0.25 + (2*aux)) );

    printf("%d\n", result);
    return 0;
}

void calculatePricePerSize(QUEIJO *q, int size){
    int i;

    for (i = 0; i < size; i++) {
        q[i].pricePerSize = (q[i].price)/(q[i].size);
    }
}

int getCubesQuantity(QUEIJO *q, int size, int value){
    int cubes = 0, i = 0;
    float aux = 0;

    if (value < q[0].pricePerSize)
        return 0;

    for(i = 0; i < size; i++) {
        if (q[i].price <= value) {
            cubes += q[i].size;
            value -= q[i].price;
        } else {
            aux = value/q[i].pricePerSize;
            value -= q[i].pricePerSize * aux; 
            cubes += aux;

            return cubes;
        }
    }
    return cubes;
}

bool compare(QUEIJO a, QUEIJO b){
    if (a.pricePerSize < b.pricePerSize)
        return true;    
    else
        return false;
}