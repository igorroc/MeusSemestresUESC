#ifndef NODE_H
#define NODE_H

#define NULO 0

struct node{
    int info;
    int nivel;
    struct node* left;
    struct node* right;
    struct node* father;
};

typedef struct node NODE;

NODE* createnode();

void freenode(NODE*);

#endif // NODE_H