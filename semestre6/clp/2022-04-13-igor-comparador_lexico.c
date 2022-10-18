#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void printPonto(char*, int);
void printTableHead(int);

typedef struct{
    int index;
    char read;
    char pop;
    char push[10];
} Instrucao;

int main(){
    char equacao[50] = {'\0'};
    
    strcpy(equacao, "(h*(i+1))");

    int len = strlen(equacao);
    int passo = 0;

    printTableHead(len);
    for(int i = 0; i <= len; i++, passo++){
        printf("%5d | q1 | ", passo);
        printPonto(equacao, i);
        printf("  | ");


        printf("\n");
    }

    return 0;
}

void printPonto(char* string, int posicao){
    int j, len = strlen(string);
    for(j = 0; j < len; j++){
        if(j == posicao){
            printf(".");
        }
        printf("%c", string[j]);
    }
    if(posicao == len){
        printf(".");
    }
}

void printTableHead(int len){
    char spacing[30] = {'\0'};
    for(int i = 0; i < len; i++){
        if(i == len/2){
            strcat(spacing, ".W");
        }
        strcat(spacing, " ");
    }
    printf("Passo | q  | %s | Stack\t| Ti | Pi\n", spacing);
}