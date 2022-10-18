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

void push(LIST*, int, double);

NODE* pop(LIST*);

NODE* findLast(NODE*);

int isEmpty(LIST*);

void showList(LIST*);

void showDuplas(LIST*);

NODE* partition(NODE*, NODE*, NODE**, NODE**);

void quickSort(NODE**);

NODE* quickSortRecur(NODE*, NODE*);

#endif