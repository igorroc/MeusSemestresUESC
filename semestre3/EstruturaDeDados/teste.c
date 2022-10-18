#include <stdio.h>

void moda(float*, int);

int main(){
    float v[6] = {5,3,4,5,4,5};
    moda(v, 6);
}

void moda(float* v, int MAX){
    int aux[6] = {0}, vezes = 0, indice = 0;

    for(int i=0;i<MAX;i++){
        for(int j=i+1;j<MAX;j++){
            if(v[i] == v[j])
                aux[i] += 1;
        }
    }
    printf("%d | ", aux[0]);
    printf("%d | ", aux[1]);
    printf("%d | ", aux[2]);
    printf("%d | ", aux[3]);
    printf("%d | ", aux[4]);

    vezes = aux[0];

    for(int i=0;i<MAX;i++){
        if(aux[i] > vezes){
            vezes = aux[i];
            indice = i;
        }
    }

    printf("\n%f", v[indice]);
}
