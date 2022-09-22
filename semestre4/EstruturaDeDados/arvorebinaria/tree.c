#ifndef TREE_C
#define TREE_C

#include <malloc.h>

#include "tree.h"
#include "node.c"

#define ESPACAMENTO_PRINT_2D 7

NODE* maketree(int x){
    NODE* p = createnode();
    p->info = x;
    p->nivel = 0;
    return p;
}

void setright(NODE* p, int x, int n){
    if(p == NULL || p->right != NULL){
        return;
    }
    p->right = createnode();
    p->right->info = x;
    p->right->nivel = n;
    p->right->father = p;
}

void setleft(NODE* p, int x, int n){
    if(p == NULL || p->left != NULL){
        return;
    }
    p->left = createnode();
    p->left->info = x;
    p->left->nivel = n;
    p->left->father = p;
}

int info(NODE* p){
    if(p == NULL || p->info == -1){
        return -1;
    }
    return p->info;
}

NODE* right(NODE* p){
    if(p == NULL || p->right == NULL){
        return NULL;
    }
    return p->right;
}

NODE* left(NODE* p){
    if(p == NULL || p->left == NULL){
        return NULL;
    }
    return p->left;
}

NODE* father(NODE* p){
    if(p == NULL || p->father == NULL){
        return NULL;
    }
    return p->father;
}

void showTree(NODE* p){
    printf("[%x] = %d\n", p, p->info);
    if(p->left != NULL){
        printf("[%x] -> [LEFT] -> ", p);
        showTree(p->left);
    }
    if(p->right != NULL){
        printf("[%x] -> [RIGHT] ->", p);
        showTree(p->right);
    }
}

void print2DRec(NODE *n, int espaco)
{
    if (n == NULL)
        return;

    espaco += ESPACAMENTO_PRINT_2D;

    // Começa pela subarvore da direita, pra uma visualização final melhor
    print2DRec(n->right, espaco);

    // Printa o valor atual, espaçado dos outros
    for (int i = ESPACAMENTO_PRINT_2D; i < espaco; i++){
        printf("-");
    }
    printf("⛔ %d(%d)\n", n->info, n->nivel);

    // Vai pra subarvore esquerda
    print2DRec(n->left, espaco);
}

void print2D(NODE* p){
    printf("\n");
    print2DRec(p, 0);
    printf("\n");
}

#endif // TREE_C