#ifndef LIST_C
#define LIST_C

#include <malloc.h>
#include <stdio.h>

#include "list.h"

LIST* createlist(){
    LIST* l;

    l = (LIST*) malloc(sizeof(LIST));
    l->qt = 0;
    l->first = NULL;

    return l;
}

void insertfirst(LIST* l, int n){
    NODE* a;

    a = createnode();

    a->info = n;

    a->next = l->first;

    l->first = a;

    l->qt++;
}

int deletefirst(LIST* l){

    NODE* temp;
    int i;

    if(l->first == NULL){
        printf("\n\nERRO: LISTA VAZIA\n\n");
        return -1;
    }

    temp = l->first;
    i = temp->info;

    l->first = temp->next;

    l->qt--;

    freenode(temp);

    return i;

}

int onthelist(LIST* l, int v){
    NODE* aux = l->first;
    for(int i = 0; i<l->qt; i++){
      if(aux->info == v){
        return 1; //PERTENCE    
      }
      aux = aux->next;
    }
    return 0; //NAO PERTENCE
}

void insertafter(LIST* l, NODE* p, int x){
    if(p == NULL || !onthelist(l,x)){
        printf("parametro *NODE* invalido!");
        // exit(-1);
        return;
    }
    NODE* q;
    q = createnode();
    q->info = x;
    q->next = p->next;
    p->next = q;

    l->qt++;
}

int deleteafter(LIST* l, NODE* p){
    NODE* q;
    int aux;
    if((p==NULL)||(p->next==NULL)){
        printf("Erro: impossivel remover");
        // exit(1);
        return 0;
    }
    q = p->next;
    aux = q->info;
    p->next = q->next;

    l->qt--;
    freenode(q);

    return aux;
}

void insertlast(LIST* l, int v){
    NODE* last = findLast(l->first);

    NODE* a;

    a = createnode();

    a->info = v;

    a->next = NULL;

    last->next = a;

    l->qt++;
}

int deletelast(LIST* l){
    int i;

    if(l->first == NULL){
        printf("\n\nERRO: LISTA VAZIA\n\n");
        return -1;
    }
    if(l->first->next == NULL){
      NODE* aux = l->first;
      i = aux->info;
      freenode(aux);
      l->first = NULL;
      return i;
    }

    NODE* prelast = findPreLast(l->first);

    i = prelast->next->info;

    freenode(prelast->next);

    prelast->next = NULL;

    l->qt--;

    return i;
}

NODE* findLast(NODE* n){
  if(n->next == NULL){
    return n;
  }
  return findLast(n->next);
}

NODE* findPreLast(NODE* n){
  if(n->next == NULL){
    return NULL;
  }
  if(n->next->next == NULL){
    return n;
  }
  return findPreLast(n->next);
}

void showList(LIST* l){
  if(l->first == NULL){
      printf("\nERRO: LISTA VAZIA\n");
      return;
  }

  NODE* aux = l->first;
  
  for(int i = 0; i < l->qt; i++){
    printf("[%d]", aux->info);
    aux = aux->next;
  }
}

#endif