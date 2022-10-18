#ifndef NODE_C
#define NODE_C

#include <malloc.h>

#include "node.h"

NODE* createnode(){
    NODE* p;
    p = (NODE*) malloc(sizeof(NODE));
    p->left = NULL;
    p->right = NULL;
    p->father = NULL;
    p->info = -1;
    p->nivel = -1;
    return p;
}

void freenode(NODE* p){
    free(p);
}

#endif // NODE_C