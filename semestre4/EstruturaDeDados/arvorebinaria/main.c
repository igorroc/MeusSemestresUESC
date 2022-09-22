#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <time.h>
#include <locale.h>

#define TAM 10 // Quantidade de números aleatórios gerados
#define RODADAS 1 // Quantidade de iterações feitas

#define RANGE_MIN 1 // Menor número a ser gerado
#define RANGE_MAX 1000 // Maior número a ser gerado

#define TABELA_MAX 3 // Diferença máxima a ser mostrada, de 0 a X

// Os seguintes são opções para printar na tela o que está sendo feito pelo programa
#define CRIAR_ARVORE_ALEATORIA 1
#define CRIAR_ARVORE_PERFEITA 0

#define IMPRIMIR_VETOR_NUMEROS 1
#define IMPRIMIR_VETOR_NUMEROS_ORDENADO 1
#define IMPRIMIR_ARVORE_2D 1
#define IMPRIMIR_MENOR_MAIOR_NO 0
#define IMPRIMIR_DIVISORIA 0

#define IMPRIMIR_TABELA 1
#define TABELA_IMPRIMIR_NUMEROS 0

#define true 1
#define false 0
#define OPC_PRE_ORDEM 1000
#define OPC_EM_ORDEM 1001
#define OPC_POS_ORDEM 1002

#include "node.c"
#include "tree.c"
#include "table.c"

int* geraRandom(int, int, int);
NODE* insereArvore(int*, int);
void printVec(int*, int);
void printOrd(NODE*, int);
void printEmOrd(NODE*);
void printPreOrd(NODE*);
void printPosOrd(NODE*);

int nodeMin(NODE*);
int nodeMax(NODE*);
int pegaNivelMax(NODE*, int*);
int pegaNivelMin(NODE*, int*);

int main(){
    /*
    *
        ! Não consegui implementar a função iterativa
        ? E como faz pra acessar tanto em nó dinâmico quanto em vetor?
    * 
    */


    srand(time(NULL));
    setlocale(LC_ALL, "Portuguese_Brasil");
    TABLE* table = makeTable();
    int table_qtd = 0;

    // ! ARVORE ALEATORIA
    if(CRIAR_ARVORE_ALEATORIA){
        for (int i = 0; i < RODADAS; i++){
            if(IMPRIMIR_DIVISORIA)
                printf("\n🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫\n");
            
            int* numeros = geraRandom(TAM, RANGE_MIN, RANGE_MAX);

            NODE* tree = insereArvore(numeros, TAM);
            
            int niveis[2] = {nodeMin(tree), nodeMax(tree)};
            
            if(IMPRIMIR_VETOR_NUMEROS)
                printVec(numeros, TAM);
            
            if(IMPRIMIR_ARVORE_2D)
                print2D(tree);

            if(IMPRIMIR_VETOR_NUMEROS_ORDENADO){
                printOrd(tree, OPC_EM_ORDEM);  // PERCORRER EM ORDEM
                printOrd(tree, OPC_PRE_ORDEM); // PERCORRER PRE ORDEM
                printOrd(tree, OPC_POS_ORDEM); // PERCORRER POS ORDEM
            }
            
            if(IMPRIMIR_MENOR_MAIOR_NO)
                printf("-> Menor nivel(nó) = %d\n-> Maior nivel(nó) = %d\n", niveis[0], niveis[1]);

            if(niveis[1] - niveis[0] <= TABELA_MAX){
                pushTable(table, i, niveis[0], niveis[1], numeros, table_qtd);
                table_qtd++;
            }

            if(IMPRIMIR_DIVISORIA)
                printf("🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫\n\n");
        }
    }
    
    if(!tableIsEmpty(table) && IMPRIMIR_TABELA){
        printTable(table, TAM, TABELA_IMPRIMIR_NUMEROS);
        printTableQTD(table, TABELA_MAX);
    }
    printf("\nTotal de indices com diferenca entre 0-%d: %d\n", TABELA_MAX, table_qtd);

    // ! ARVORE PERFEITA
    if(CRIAR_ARVORE_PERFEITA){
        printf("\n\nÁrvore Perfeita:");
        int numeros[7] = {4, 2, 1, 3, 6, 5, 7};
        
        NODE* ptree = insereArvore(numeros, 7);
        int niveis[2] = {nodeMin(ptree), nodeMax(ptree)};
        
        if(IMPRIMIR_VETOR_NUMEROS)
            printVec(numeros, 7);
        
        if(IMPRIMIR_ARVORE_2D)
            print2D(ptree);

        if(IMPRIMIR_VETOR_NUMEROS_ORDENADO)
            printOrd(ptree, OPC_EM_ORDEM);
        
        if(IMPRIMIR_MENOR_MAIOR_NO)
            printf("\nMenor nivel(nó) = %d\nMaior nivel(nó) = %d\n", niveis[0], niveis[1]);
    }

    return 0;
}


int* geraRandom(int qtd, int min, int max){
    int* vetor;
    vetor = (int*) malloc(sizeof(int)*qtd);
    for (int i = 0; i < qtd; i++){
        vetor[i] = (rand() % (max - min + 1)) + min;
    }
    return vetor;
}

NODE* insereArvore(int* vetor, int qtd){
    NODE* p, *q, *tree;
    tree = maketree(vetor[0]);

    int i = 1;

    while(i < qtd) {
        int nivel = 0;
        p = q = tree;
        while(vetor[i] != info(p) && q != NULL){
            p = q;
            nivel++;
            if (vetor[i] < info(p))
                q = left(p);

            else
                q = right(p);
        }

        if (vetor[i] < info(p))
            setleft(p, vetor[i], nivel);

        else
            setright(p, vetor[i], nivel);

        i++;
    }

    return tree;
}

void printVec(int* vetor, int qtd){
    for(int i = 0; i < qtd; i++){
        printf("[%d]", vetor[i]);
    }
    printf("\n");
}

void printOrd(NODE* p, int opcao){
    switch (opcao){
        case OPC_EM_ORDEM:
            printEmOrd(p);
            break;
        case OPC_PRE_ORDEM:
            printPreOrd(p);
            break;
        case OPC_POS_ORDEM:
            printPosOrd(p);
            break;
    }
    printf("\n");
}

void printEmOrd(NODE* p){
    if(p->left != NULL){
        printEmOrd(p->left);
    }
    
    printf("[%d]", p->info);
    
    if(p->right != NULL){
        printEmOrd(p->right);
    }
}

void printPosOrd(NODE* p){
    printf("[%d]", p->info);

    if(p->left != NULL){
        printPosOrd(p->left);
    }
    
    if(p->right != NULL){
        printPosOrd(p->right);
    }
}

void printPreOrd(NODE* p){
    if(p->left != NULL){
        printPreOrd(p->left);
    }
    
    if(p->right != NULL){
        printPreOrd(p->right);
    }

    printf("[%d]", p->info);
}

int nodeMin(NODE* n){
    if(n == NULL){
        return -1;
    }

    int nivel = TAM;
    pegaNivelMin(n, &nivel);

    return nivel;
}

int nodeMax(NODE* n){
    if(n == NULL){
        return -1;
    }

    int nivel = 0;
    pegaNivelMax(n, &nivel);

    return nivel;
}

int pegaNivelMin(NODE* n, int* nivelAtual){

    if(n->left == NULL && n->right == NULL){
        if(n->nivel == 0){
            return -1;
        }
        else{
            return n->nivel;
        }
    }

    if(n->right != NULL){
        int nivelR = pegaNivelMin(n->right, nivelAtual);
        if(nivelR != 0){
            *nivelAtual = (nivelR < *nivelAtual) ? nivelR : *nivelAtual;
        }
    }

    if(n->left != NULL){
        int nivelL = pegaNivelMin(n->left, nivelAtual);
        if(nivelL != 0){
            *nivelAtual = (nivelL < *nivelAtual) ? nivelL : *nivelAtual;
        }
    }
}

int pegaNivelMax(NODE* n, int* nivelAtual){

    if(n->left == NULL && n->right == NULL){
        if(n->nivel == 0)
            return -1;
        else
            return n->nivel;
    }

    if(n->right != NULL){
        int nivelR = pegaNivelMax(n->right, nivelAtual);

        *nivelAtual = (nivelR > *nivelAtual) ? nivelR : *nivelAtual;
    }

    if(n->left != NULL){
        int nivelL = pegaNivelMax(n->left, nivelAtual);

        *nivelAtual = (nivelL > *nivelAtual) ? nivelL : *nivelAtual;
    }
}

// Gerar 100 num aleatorio 1 - 1000
// Inserir numa ABB
// Imprimir o nivel da folha de maior nivel e o nivel da de menor nivel x50
// Imprimir uma tabela com uma contagem de quantas das 50 passagens acima resultaram numa diferenca de 0, 1, 2, 3

// Escreva um programa para fazer a seguinte experiência: gerar 100 número aleatórios entre 1 e 1000.
// À medida que cada número for gerado, insira-o numa ABB, inicialmente vazia.
// Quando todos os 100 números tiverem sido inseridos, imprima o nível da folha de maior nível e o nível da folha de menor nível. Repita isso 50 vezes.
// Imprima uma tabela com uma contagem de quantas das 50 passagens resultaram numa diferença entre o nível máximo e mínimo de folhas de 0, 1, 2, 3, e assim por diante.