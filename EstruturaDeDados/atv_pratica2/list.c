#ifndef LIST_C
#define LIST_C

#include <malloc.h>
#include <stdio.h>
#include <string.h>

#include "list.h"

#include "node.c"
#include "node.h"

#define TRUE 1
#define FALSE 0

LIST* createlist(){
    LIST* l;

    l = (LIST*) malloc(sizeof(LIST));
    l->qt = 0;
    l->first = NULL;
    l->last = NULL;

    return l;
}

void insertstring(LIST* l, char* s){
  int tam = strlen(s);
  for (int i = 0; i < tam; i++){
      insertlast(l, s[i]);
  }
}

void insertlast(LIST* l, char v){
  NODE* a;

  a = createnode();

  a->info = v;

  a->next = NULL;

  l->qt++;

  if(l->first != NULL){
    a->previous = l->last;

    l->last->next = a;

  }else{
    a->previous = NULL;

    l->first = a;
  }
  
  l->last = a;
}

NODE* findLast(NODE* n){
  if(n->next == NULL){
    return n;
  }
  return findLast(n->next);
}

void showList(LIST* l){
  if(l->first == NULL){
      printf("\nERRO: LISTA VAZIA\n");
      return;
  }

  NODE* aux = l->first;
  
  for(int i = 0; i < l->qt; i++){
    printf("%c", aux->info);
    aux = aux->next;
  }
}

#endif