#include <stdio.h>
// 1



// 2
int retornaMenor(int n, int menor){
    if(n/10 == 0){
        if(n < menor){
            return n;
        }else{
            return menor;
        }
    }

    printf("%d | %d | %d | %d\n", n, menor, n/10, n%10);
    if(n%10 < menor){
        retornaMenor(n/10, n%10);
    }else{
        retornaMenor(n/10, menor);
    }
}

//3

int inverteRec(int numero, int inverso){
    if(numero == 0)
        return inverso;

    return inverteRec(numero/10, inverso*10+numero%10);

}




// MAIN

int main(){
    printf("menor: %d", retornaMenor(1345, 10));
    return 0;
}