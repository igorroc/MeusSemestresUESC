#include <stdio.h>
#include <stdlib.h>

#include "list.h"
#include "node.h"

#include "list.c"
#include "node.c"

int ehPalindromoInte(LIST*);
int ehPalindromoRec(NODE*, NODE*);


int main(){
    LIST* palavra = createlist();

    // PALAVRA NÃO PALINDROMO
    // insertstring(palavra, "batata");

    // FRASE PALINDROMO
    insertstring(palavra, "socorrammesubinoonibusemmarrocos"); 

    // PRINTA A LISTA
    showList(palavra);
    
    // RETORNA 0 SE FOR FALSE E 1 SE FOR TRUE
    printf("\n(Iterativo) Eh palindromo: %d", ehPalindromoInte(palavra));
    printf("\n(Recursivo) Eh palindromo: %d", ehPalindromoRec(palavra->first, palavra->last));

    return 0;
}

int ehPalindromoInte(LIST* l){
  if (l->first == NULL) return FALSE; // RETORNA FALSO QUANDO NAO EXISTE LISTA
  
  int tam = l->qt/2;
  NODE* aux1 = l->first;
  NODE* aux2 = l->last;

  for (int i = 0; i < tam; i++){
    if (aux1->info != aux2->info){
      return FALSE;
    }
    aux1 = aux1->next;
    aux2 = aux2->previous;
  }
  
  return TRUE;
}

int ehPalindromoRec(NODE* first, NODE* last){
  if (first == NULL) return FALSE;
  if (first->info != last->info) return FALSE;
  if(first->next == last) return TRUE;
  if(first == last) return TRUE;
  return ehPalindromoRec(first->next, last->previous);
}
