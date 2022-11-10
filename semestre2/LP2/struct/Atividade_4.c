#include <stdio.h>
#include <stdlib.h>
#include <string.h>


struct Vetor{
    float x;
    float y;
    float z;
};

int valida(char*, char*, char*);
void limpa(char*, char*, char*);

int main()
{
    struct Vetor vetor1, vetor2, vetor3;
    char resp1[256], resp2[256], resp3[256];
    printf("Digite 3 valores float:\n");
    setbuf(stdin, NULL);
    scanf("%250[^\n] %250[^\n] %250[^\n]", resp1, resp2, resp3);
    if(!valida(resp1, resp2, resp3)){
        limpa(resp1, resp2, resp3);
        printf("Digite 3 valores float validos:\n");
        setbuf(stdin, NULL);
        scanf("%250[^\n] %250[^\n] %250[^\n]", resp1, resp2, resp3);
    }
    sscanf(resp1, "f", &vetor1.x);
    sscanf(resp2, "f", &vetor1.y);
    sscanf(resp3, "f", &vetor1.z);
    limpa(resp1, resp2, resp3);

    printf("Digite mais 3 valores float:\n");
    setbuf(stdin, NULL);
    scanf("%250[^\n] %250[^\n] %250[^\n]", resp1, resp2, resp3);
    if(!valida(resp1, resp2, resp3)){
        limpa(resp1, resp2, resp3);
        printf("Digite 3 valores float validos:\n");
        setbuf(stdin, NULL);
        scanf("%250[^\n] %250[^\n] %250[^\n]", resp1, resp2, resp3);
    }
    sscanf(resp1, "f", &vetor1.x);
    sscanf(resp2, "f", &vetor1.y);
    sscanf(resp3, "f", &vetor1.z);

    printf("A soma de [%f][%f][%f] com [%f][%f][%f] é:\n", vetor1.x, vetor1.y, vetor1.z, vetor2.x, vetor2.y, vetor2.z);
    return 0;
}

int valida(char* texto1, char* texto2, char* texto3){
    float a, b, c;
    sscanf(texto1, "%f", &a);
    sscanf(texto1, "%f", &b);
    sscanf(texto1, "%f", &c);
    if(!a || !b || !c){
        return 0;
    }else{
        return 1;
    }
}

void limpa(char* texto1, char* texto2, char* texto3){
    for(int i =0; i < 256; i++){
        texto1[i] = '\0';
        texto2[i] = '\0';
        texto3[i] = '\0';
    }
}
