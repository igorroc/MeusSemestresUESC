#ifndef NODE_C
#define NODE_C

#include <malloc.h>

#include "node.h"

NODE* createnode(){
    NODE* p;
    p = (NODE*) malloc(sizeof(NODE));
    p->next = NULL;
    p->info = -1;
    return p;
}

void freenode(NODE* p){
    free(p);
}

#endif