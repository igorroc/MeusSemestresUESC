#include <stdio.h>
#include <stdlib.h>
#include <string.h>


struct Carro{
    char marca[20];
    int ano;
    float preco;
};

int valida_ano(char*);
int valida_preco(char*);
void limpa(char*);

int main()
{
    struct Carro carros[5] = {0};
    char resp[30] = {'\0'};
    float p;
    for(int i =  0; i < 5; i++){
        printf("Digite a marca do carro:\n");
        setbuf(stdin, NULL);
        scanf("%25[^\n]", resp);
        strcpy(carros[i].marca, resp);

        printf("Digite o ano carro:\n");
        setbuf(stdin, NULL);
        scanf("%25[^\n]", resp);
        while(!valida_ano(resp)){
            limpa(resp);
            printf("Digite um ano valido:\n");
            setbuf(stdin, NULL);
            scanf("%25[^\n]", resp);
        }
        sscanf(resp, "%d", &carros[i].ano);

        printf("Digite o preco do carro:\n");
        setbuf(stdin, NULL);
        scanf("%25[^\n]", resp);
        while(!valida_preco(resp)){
            limpa(resp);
            printf("Digite um preco valido:\n");
            setbuf(stdin, NULL);
            scanf("%25[^\n]", resp);
        }
        sscanf(resp, "%f", &carros[i].preco);
    }

    printf("Digite o preco maximo que voce deseja buscar:\n");
    setbuf(stdin, NULL);
    scanf("%25[^\n]", resp);
    while(!valida_preco(resp)){
        limpa(resp);
        printf("Digite um preco valido:\n");
        setbuf(stdin, NULL);
        scanf("%25[^\n]", resp);
    }
    sscanf(resp, "%f", &p);
    for(int i = 0; i < 5; i++){
        if(carros[i].preco <= p){
            printf("Marca: %s\nAno: %d\nPreco: R$ %.2f\n\n", carros[i].marca, carros[i].ano, carros[i].preco);
        }
    }

    return 0;
}


int valida_ano(char* texto){
    if(texto[0] < '0' || texto[0] > '9'){
        return 0;
    }
    if(texto[1] < '0' || texto[1] > '9'){
        return 0;
    }
    if(texto[2] < '0' || texto[2] > '9'){
        return 0;
    }
    if(texto[3] < '0' || texto[3] > '9'){
        return 0;
    }
    if(texto[4] != '\0'){
        return 0;
    }
    return 1;
}

int valida_preco(char* texto){
    for(int i = 0; texto[i]; i++){
        if(texto[i] < '0' || texto[i] > '9'){
            if(texto[i] != '.'){
                return 0;
            }
        }
    }
    return 1;
}

void limpa(char* texto){
    for(int i = 0; texto[i]; i++){
        texto[i] = '\0';
    }
}
