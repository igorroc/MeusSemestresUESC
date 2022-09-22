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

void push(LIST* l, int mat, double nota){
  NODE* a;

  a = createnode();

  a->matricula = mat;
  a->nota = nota;

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

NODE* pop(LIST* l){
  if(isEmpty(l)){
    return 0;
  }
  NODE* last = findLast(l->first);

  last->previous->next = NULL;

  return last;
}

NODE* findLast(NODE* n){
  if(n->next == NULL){
    return n;
  }
  return findLast(n->next);
}

int isEmpty(LIST* p){
    if(p->first == NULL) return 1;
    return 0;
}

void resetPrevious(LIST* l){
  if(l->first == NULL){
      printf("\nERRO: LISTA VAZIA\n");
      return;
  }

  NODE* previous = NULL;
  NODE* cur = l->first;
  while(cur != NULL){
    cur->previous = previous;
    previous = cur;
    cur = cur->next;
  }
}

void showList(LIST* l){
  if(l->first == NULL){
      printf("\nERRO: LISTA VAZIA\n");
      return;
  }

  NODE* aux = l->first;
  
  for(int i = 0; i < l->qt; i++){
    printf("[%d] -> [%.1f]\n", aux->matricula, aux->nota);
    aux = aux->next;
  }
  printf("--------------------------------\n");
}

void showDuplas(LIST* l){
  if(l->first == NULL){
      printf("\nERRO: LISTA VAZIA\n");
      return;
  }

  NODE* first = l->first;
  NODE* last = findLast(l->first);
  for(int i = 0; i < l->qt/2; i++){
    printf("[%d] -> [%.1f]", last->matricula, last->nota);
    if(first != last){
      printf(" | [%d] -> [%.1f]\n", first->matricula, first->nota);
    }
    first = first->next;
    last = last->previous;
  }
  if(first == last){
    printf("[%d] -> [%.1f]", first->matricula, first->nota);
  }
}
 
// Partitions the list taking the last element as the pivot
NODE* partition(NODE* head, NODE* end, NODE** newHead, NODE** newEnd){
    NODE* pivot = end;
    NODE *prev = NULL, *cur = head, *tail = pivot;
 
    // During partition, both the head and end of the list
    // might change which is updated in the newHead and
    // newEnd variables
    while (cur != pivot) {
        if (cur->nota < pivot->nota) {
            // First NODE that has a value less than the
            // pivot - becomes the new head
            if ((*newHead) == NULL)
                (*newHead) = cur;
 
            prev = cur;
            cur = cur->next;
        }
        else // If cur NODE is greater than pivot
        {
            // Move cur NODE to next of tail, and change
            // tail
            if (prev)
                prev->next = cur->next;
            NODE* tmp = cur->next;
            cur->next = NULL;
            tail->next = cur;
            tail = cur;
            cur = tmp;
        }
    }
 
    // If the pivot data is the smallest element in the
    // current list, pivot becomes the head
    if ((*newHead) == NULL)
        (*newHead) = pivot;
 
    // Update newEnd to the current last NODE
    (*newEnd) = tail;
 
    // Return the pivot NODE
    return pivot;
}
 
// here the sorting happens exclusive of the end NODE
NODE* quickSortRecur(NODE* head, NODE* end){
    // base condition
    if (!head || head == end)
        return head;
 
    NODE *newHead = NULL, *newEnd = NULL;
 
    // Partition the list, newHead and newEnd will be
    // updated by the partition function
    NODE* pivot
        = partition(head, end, &newHead, &newEnd);
 
    // If pivot is the smallest element - no need to recur
    // for the left part.
    if (newHead != pivot) {
        // Set the NODE before the pivot NODE as NULL
        NODE* tmp = newHead;
        while (tmp->next != pivot)
            tmp = tmp->next;
        tmp->next = NULL;
 
        // Recur for the list before pivot
        newHead = quickSortRecur(newHead, tmp);
 
        // Change next of last NODE of the left half to
        // pivot
        tmp = findLast(newHead);
        tmp->next = pivot;
    }
 
    // Recur for the list after the pivot element
    pivot->next = quickSortRecur(pivot->next, newEnd);
 
    return newHead;
}
 
// The main function for quick sort. This is a wrapper over
// recursive function quickSortRecur()
void quickSort(NODE** headRef){
  if(*headRef == NULL){
      printf("\nERRO: LISTA VAZIA\n");
      return;
  }
    (*headRef)
        = quickSortRecur(*headRef, findLast(*headRef));
    return;
}

#endif