#include <stdio.h>
#include <stdlib.h>
#include <string.h>


struct aluno{
    char nome[256];
    char matricula[20];
    char curso[128];
};

int valida_matricula(char*);

int main()
{
    struct aluno alunos[5];
    char resp[256] = {'\0'};
    for(int i = 0; i < 5; i++){
        printf("Digite o nome do aluno [%d]:\n", i);
        setbuf(stdin, NULL);
        scanf("%200[^\n]", resp);
        strcpy(alunos[i].nome, resp);

        printf("Digite a matricula do aluno [%d]: (Exemplo -> 201910888)\n", i);
        setbuf(stdin, NULL);
        scanf("%90[^\n]", resp);
        while(!valida_matricula(resp)){
            limpa(resp);
            printf("Digite uma matricula valida:\n");
            setbuf(stdin, NULL);
            scanf("%90[^\n]", resp);
        }
        strcpy(alunos[i].matricula, resp);

        printf("Digite seu curso:\n");
        setbuf(stdin, NULL);
        scanf("%250[^\n]", resp);
        strcpy(alunos[i].curso, resp);
    }

    for(int i = 0; i < 5; i++){
        printf("Aluno [%d]:\nNome: %s\nMatricula: %s\nCurso: %s\n----------\n", i+1, alunos[i].nome, alunos[i].matricula, alunos[i].curso);
    }
    return 0;
}

int valida_matricula(char* texto){
    if(texto[9] != '\0'){
        return 0;
    }else{
        if(texto[8] == '\0'){
            return 0;
        }else{
            return 1;
        }
    }
}

void limpa(char* texto){
    char limpo[256] = {'\0'};
    strcpy(texto, limpo);
}
