#ifndef LIST_H
#define LIST_H

#include "node.h"

struct list_c{
    int qt;
    NODE* first;
};

typedef struct list_c LIST;

LIST* createlist();

void insertfirst(LIST*, int);

int deletefirst(LIST*);

void insertafter(LIST*, NODE*, int);

int deleteafter(LIST*, NODE*);

void insertlast(LIST*, int);

int deletelast(LIST*);

NODE* findLast(NODE*);

NODE* findPreLast(NODE*);

NODE* findIndex(NODE*, int);

void showList(LIST*);

#endif