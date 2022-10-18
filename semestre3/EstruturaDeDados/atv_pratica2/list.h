#ifndef LIST_H
#define LIST_H

#include "node.h"

struct list_c{
    int qt;
    NODE* first;
    NODE* last;
};

typedef struct list_c LIST;

LIST* createlist();

void insertstring(LIST*, char*);

void insertlast(LIST*, char);

NODE* findLast(NODE*);

void showList(LIST*);

#endif