#ifndef NODE_H
#define NODE_H

#define NULO 0

struct node{
    int matricula;
    double nota;
    struct node* next;
    struct node* previous;
};

typedef struct node NODE;

NODE* createnode();

void freenode(NODE*);

#endif //NODE_H