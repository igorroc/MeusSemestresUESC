#include <stdio.h>
#include <stdlib.h>

#include "list.h"
#include "node.h"

#include "list.c"
#include "node.c"

int main(){
    // * Inicia a lista encadeada
    LIST* turma = createlist();

    // * Insere as matriculas e as notas na lista
    push(turma, 20201251, 8.5);
    push(turma, 20201252, 5.5);
    push(turma, 20201253, 8.0);
    push(turma, 20201254, 9.0);
    push(turma, 20201255, 4.5);
    push(turma, 20201256, 2.5);
    push(turma, 20201257, 7.5);

    // ? Printa a lista encadeada
    showList(turma);

    // ! Ordena a lista utilizando o metodo QuickSort
    quickSort(&turma->first);

    // ? Printa a lista já ordenada na ordem crescente
    showList(turma);

    // * Devido ao método de ordenação, é necessário recolocar os previous de cada nó
    resetPrevious(turma);

    // ! Printa a lista, de 2 em 2 alunos, aqueles com n-ésima melhor e n-ésima pior notas
    showDuplas(turma);
    
    return 0;
}