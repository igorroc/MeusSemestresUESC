#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct horario {
    int hora, minuto, segundo;
};
struct data{
    int dia, mes, ano;
};
struct compromisso{
    struct data data_c;
    struct horario horario_c;
    char texto[256];
};

int validar_data(char*);
int validar_hora(char*);
void limpar(char*);
void add_data(struct compromisso*, char*);

int main()
{
    struct compromisso compromisso;
    char resp[256] = {'\0'};

    printf("Digite a data do seu compromisso (Exemplo -> 04/10/2019)\n");
    setbuf(stdin, NULL);
    scanf("%90[^\n]", resp);
    while(!validar_data(resp)){
        limpar(resp);
        printf("Digite uma data valida (Exemplo: 04/10/2019)\n");
        setbuf(stdin, NULL);
        scanf("%90[^\n]", resp);
    }
    add_data(&compromisso, resp);
    limpar(resp);

    printf("Digite o horario do seu compromisso (Exemplo -> 09:30:00)\n");
    setbuf(stdin, NULL);
    scanf("%90[^\n]", resp);
    while(!validar_hora(resp)){
        limpar(resp);
        printf("Digite um horario valido (Exemplo -> 09:30:00)\n");
        setbuf(stdin, NULL);
        scanf("%90[^\n]", resp);
    }
    add_hora(&compromisso, resp);
    limpar(resp);

    printf("Digite uma descricao para o seu compromisso (Exemplo -> Ir ao hospital)\n");
    setbuf(stdin, NULL);
    scanf("%90[^\n]", resp);
    strcpy(compromisso.texto, resp);
    printf("Compromisso marcado!\n%s no dia %02d/%02d/%04d as %02d:%02d:%02d.\n", compromisso.texto, compromisso.data_c.dia, compromisso.data_c.mes, compromisso.data_c.ano, compromisso.horario_c.hora, compromisso.horario_c.minuto, compromisso.horario_c.segundo);
    return 0;
}


int validar_data(char* texto){
    char aux[5] = {'\0'};
    int dia, mes, ano;
    if(strlen(texto) != 10){
        return 0;
    }

    if(texto[2] == '/' && texto[5] == '/'){
        aux[0] = texto[0];
        aux[1] = texto[1];
        sscanf(aux, "%d", &dia);
        aux[0] = texto[3];
        aux[1] = texto[4];
        sscanf(aux, "%d", &mes);
        aux[0] = texto[6];
        aux[1] = texto[7];
        aux[2] = texto[8];
        aux[3] = texto[9];
        sscanf(aux, "%d", &ano);

        if(ano >= 2019){
            if(mes >= 1 && mes <= 12){
                if(dia >= 1 && dia <= 31){
                    return 1;
                }else{
                    return 0;
                }
            }else{
                return 0;
            }
        }else{
            return 0;
        }
    }else{
        return 0;
    }
}

int validar_hora(char* texto){
    char aux[5] = {'\0'};
    int hora, minuto, segundo;
    if(strlen(texto) != 8){
        return 0;
    }

    if(texto[2] == ':' && texto[5] == ':'){
        aux[0] = texto[0];
        aux[1] = texto[1];
        sscanf(aux, "%d", &hora);
        aux[0] = texto[3];
        aux[1] = texto[4];
        sscanf(aux, "%d", &minuto);
        aux[0] = texto[6];
        aux[1] = texto[7];
        sscanf(aux, "%d", &segundo);

        if(hora >= 0 && hora <= 24){
            if(minuto >= 0 && minuto < 60){
                if(segundo >= 0 && segundo < 60){
                    return 1;
                }else{
                    return 0;
                }
            }else{
                return 0;
            }
        }else{
            return 0;
        }
    }else{
        return 0;
    }
}

void limpar(char* texto){
    char limpo[256] = {'\0'};
    strcpy(texto, limpo);
}

void add_data(struct compromisso* comp, char* texto){
    char aux[5] = {'\0'};
    int dia, mes, ano;

    aux[0] = texto[0];
    aux[1] = texto[1];
    sscanf(aux, "%d", &dia);
    aux[0] = texto[3];
    aux[1] = texto[4];
    sscanf(aux, "%d", &mes);
    aux[0] = texto[6];
    aux[1] = texto[7];
    aux[2] = texto[8];
    aux[3] = texto[9];
    sscanf(aux, "%d", &ano);

    comp->data_c.ano = ano;
    comp->data_c.mes = mes;
    comp->data_c.dia = dia;
}

void add_hora(struct compromisso* comp, char* texto){
    char aux[5] = {'\0'};
    int hora, minuto, segundo;

    aux[0] = texto[0];
    aux[1] = texto[1];
    sscanf(aux, "%d", &hora);
    aux[0] = texto[3];
    aux[1] = texto[4];
    sscanf(aux, "%d", &minuto);
    aux[0] = texto[6];
    aux[1] = texto[7];
    sscanf(aux, "%d", &segundo);

    comp->horario_c.hora = hora;
    comp->horario_c.minuto = minuto;
    comp->horario_c.segundo = segundo;
}
