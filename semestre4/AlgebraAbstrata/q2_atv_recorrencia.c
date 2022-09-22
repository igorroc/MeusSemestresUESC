#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define ln(x) log(x)

int funcao(int);

int main(){
    
    for (int n = 1; n <= 5; n++){
        printf("[%d] => %d", n, funcao(n));
        if(n*ln(n) <= funcao(n) <= 32*n*ln(n)){
            printf(" satisfaz as cotas n*ln(n) <= T(n) <= 32*n*ln(n)\n");
        }else{
            printf(" nao satisfaz as cotas\n");
        }
    }
    
    return 0;
}

int funcao(int n){
    if(n == 1) return 1;

    return 2*funcao(n/2) + 7*n + 2;
}