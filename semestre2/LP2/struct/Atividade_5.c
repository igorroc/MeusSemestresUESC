#include <stdio.h>
#include <stdlib.h>
#include <string.h>


struct Pessoa{
    char nome[256];
    char endereco[256];
    char telefone[20];
};

void ordenar(struct Pessoa*);

int main(){
    struct Pessoa pessoas[5];
    for(int i = 0; i < 5; i++){
        setbuf(stdin, NULL);
        scanf("%255[^\n]", pessoas[i].nome);
        setbuf(stdin, NULL);
        scanf("%255[^\n]", pessoas[i].endereco);
        setbuf(stdin, NULL);
        scanf("%19[^\n]", pessoas[i].telefone);
    }

    ordenar(pessoas);
    for(int i = 0; i < 5; i++){
        printf("Nome: %s\nEndereco: %s\nNumero: %s\n\n", pessoas[i].nome, pessoas[i].endereco, pessoas[i].telefone);
    }
    return 0;
}

void ordenar(struct Pessoa* pessoas){
    struct Pessoa aux;
    for(int i = 0; i < 4; i++){
        if(pessoas[i].nome[0] > pessoas[i+1].nome[0]){
            aux = pessoas[i];
            pessoas[i] = pessoas[i+1];
            pessoas[i+1] = aux;
            i = -1;
        }else if(pessoas[i].nome[0] == pessoas[i+1].nome[0]){
            if(pessoas[i].nome[1] > pessoas[i+1].nome[1]){
                aux = pessoas[i];
                pessoas[i] = pessoas[i+1];
                pessoas[i+1] = aux;
                i = -1;
            }else if(pessoas[i].nome[1] == pessoas[i+1].nome[1]){
                if(pessoas[i].nome[2] > pessoas[i+1].nome[2]){
                    aux = pessoas[i];
                    pessoas[i] = pessoas[i+1];
                    pessoas[i+1] = aux;
                    i = -1;
                }
            }
        }
    }

}
