#include "questao1.h"

vetor cria(float x, float y){
    if(x != 0 && y != 0){
        vetor temporario;

        temporario.a = x;
        temporario.b = y;

        return temporario;
    }
}

float modulo(vetor v){
    return sqrt( v.a*v.a + v.b*v.b );
}

float produto(vetor v, vetor w){
    return v.a*w.a + v.b*w.b;
}

float angulo(vetor v, vetor w){
    return acos( produto(v, w) / modulo(v) * modulo(w) );
}

int iguais(vetor v, vetor w){
    // IGUAIS, RETORNA 1 TRUE
    if (v.a == w.a && v.b == w.b){
        return 1;
    }
    //DIFERENTES, RETORNA 0 FALSE
    else{
        return 0;
    }
    
}