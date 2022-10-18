#include <stdio.h>

#include "list.h"
#include "pilha.h"
#include "fila.h"
#include "node.h"

#include "list.c"
#include "pilha.c"
#include "fila.c"
#include "node.c"

void testesFila();
void testesPilha();

int main() {
  // DISCENTES: 
  // → IGOR ROCHA
  // → ISAC LIMA
  // → JOÃO RUPP
  // → MARIA GABRIELLA

  // printf("\n---- FILA ----\n");
  // testesFila();

  printf("\n---- PILHA ----\n");
  testesPilha();
  
  return 0;
}

void testesFila(){
  FILA* fila1 = createqueue();

  toQueue(fila1, 3);
  toQueue(fila1, 7);
  toQueue(fila1, 1);
  toQueue(fila1, 9);

  showList(fila1->itens);

  printf("\nRemovido: %d\n", deQueue(fila1));
  
  showList(fila1->itens);

  printf("\nRemovido: %d\n", deQueue(fila1));
  
  showList(fila1->itens);

  toQueue(fila1, 5);
  printf("\nAdicionado: %d\n", 5);

  showList(fila1->itens);

  
  printf("\n(5) pertence: %d\n", onthelist(fila1->itens, 5));
  
}

void testesPilha(){
  PILHA* pilha1 = createstack();

  push(pilha1, 5);
  push(pilha1, 21);
  push(pilha1, 8);
  push(pilha1, 15);
  push(pilha1, 10);
  push(pilha1, 4);

  showList(pilha1->itens);
  
  printf("\nRemovido: %d\n", popn(pilha1, 2));
  
  showList(pilha1->itens);

  // printf("\nRemovido: %d\n", pop(pilha1));
  
  // showList(pilha1->itens);

  // push(pilha1, 7);
  // printf("\nAdicionado: %d\n", 7);

  // showList(pilha1->itens);

  
  // printf("\n(5) pertence: %d\n", onthelist(pilha1->itens, 5));
  
}