#include <stdio.h>
#include <stdlib.h>
#include <string.h>



struct pessoa{
    char idade[4];
    char nome[256];
    char endereco[256];
};

int valida_idade(char*);
//void add_idade(struct pessoa*, char*);
void limpa(char*);

int main()
{
    struct pessoa pessoa;
    char resp[256] = {'\0'};

    printf("Digite seu nome:\n");
    setbuf(stdin, NULL);
    scanf("%90[^\n]", resp);
    strcpy(pessoa.nome, resp);

    printf("Digite sua idade:\n");
    setbuf(stdin, NULL);
    scanf("%90[^\n]", resp);
    while(!valida_idade(resp)){
        limpa(resp);
        printf("Digite uma idade valida:\n");
        setbuf(stdin, NULL);
        scanf("%90[^\n]", resp);
    }
    strcpy(pessoa.idade, resp);

    printf("Digite seu endereco:\n");
    setbuf(stdin, NULL);
    scanf("%250[^\n]", resp);
    strcpy(pessoa.endereco, resp);

    printf("Informacoes salvas!\n%s tem %s anos e possui como endereco: %s\n", pessoa.nome, pessoa.idade, pessoa.endereco);
    return 0;
}

int valida_idade(char* texto){
    char aux[5] = {'\0'};
    int idade;
    aux[0] = texto[0];
    aux[1] = texto[1];
    aux[2] = texto[2];
    sscanf(aux, "d", &idade);
    if(aux[0] >= '0' && aux[0] <= '9'){
        if(aux[1] >= '0' && aux[1] <= '9'){
            if(aux[2] >= '0' && aux[2] <= '9'){
                if(idade >= 0 && idade <= 150){
                    return 1;
                }else{
                    return 0;
                }
            }else if(aux[2] == '\0'){
                return 1;
            }else{
                return 0;
            }
        }else if(aux[1] == '\0'){
            return 1;
        }else{
            return 0;
        }
    }else{
        return 0;
    }
}

void limpa(char* texto){
    char limpo[256] = {'\0'};
    strcpy(texto, limpo);
}




