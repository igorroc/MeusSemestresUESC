#ifndef NODE_H
#define NODE_H

#define NULO 0

struct node{
    int info;
    struct node* next;
};

typedef struct node NODE;

NODE* createnode();

void freenode(NODE*);

#endif //NODE_H