#ifndef TABLE_C
#define TABLE_C

#define true 1
#define false 0


typedef struct table{
    int i;
    int min;
    int max;
    int dif;
    int* numeros;
    struct table* next;
}TABLE;

void printTableQTD(TABLE*, int);
int printRowQtd(TABLE*, int, int);
void printRow(TABLE*, int, int);
int rowLength(TABLE*, int, int);

TABLE* makeTable(){
    TABLE* t = (TABLE *)malloc(sizeof(TABLE));

    t->i = -1;
    t->min = -1;
    t->max = -1;
    t->dif = -1;
    t->numeros = (int*)-1;
    t->next = NULL;

    return t;
}

void printTableQTD(TABLE* t, int range){
    printf("\n\ndif\t\tqtd\n");

    for(int i = 0; i <= range; i++){
        printf("[%2d]----[%2d]\n", i, printRowQtd(t->next, i, 0));
    }
}

int printRowQtd(TABLE* t, int dif, int soma){
    if(t->dif == dif) soma++;

    if(t->next == NULL) return soma;

    return printRowQtd(t->next, dif, soma);
}

void printTable(TABLE* t, int tam, int impriNumeros){
    printf("\ti   min  max  dif");
    if(impriNumeros){
        printf("    numeros\n");
    }else{
        printf("\n");
    }

    int len = rowLength(t, tam, impriNumeros);

    for (int i = 0; i < len; i++){
        printf("■");
    }
    printf("\n", tam);

    printRow(t->next, tam, impriNumeros);

    for (int i = 0; i < len; i++){
        printf("■");
    }

}

void printRow(TABLE* t, int tam, int impriNumeros){

    printf("| %3d | %2d | %2d | %2d |", t->i, t->min, t->max, t->dif);

    if(impriNumeros){
        printf(" ");
        for(int i = 0; i < tam-1; i++){
            printf("%4d, ", t->numeros[i]);
        }
        printf("%4d |\n", t->numeros[tam-1]);
    }else{
        printf("\n");
    }

    if(t->next == NULL) return;

    printRow(t->next, tam, impriNumeros);
}

void pushTable(TABLE* t, int i, int min, int max, int* numeros, int qtd){
    for(int i = 0; i < qtd; i++){
        t = t->next;
    }

    TABLE* prox = makeTable();

    prox->i = i;
    prox->min = min;
    prox->max = max;
    prox->dif = max-min;
    prox->numeros = numeros;

    t->next = prox;
}

int tableIsEmpty(TABLE* t){
    if(t->next == NULL){
        return true;
    }
    return false;
}

int rowLength(TABLE* t, int tam, int impriNumeros){
    int i, len = 0;

    // printf("| %3d | %2d | %2d | %2d | ", t->i, t->min, t->max, t->dif);
    len += 14+3+2+2+2;

    if(impriNumeros){
        for(i = 0; i < tam-1; i++){
            // printf("%4d, ", t->numeros[i]);
            len += 4+1+1;
        }
        // printf("%4d |\n", t->numeros[i]);
        len += 4+2;
    }else{
        len -= 1;
    }

    return len;
}
#endif