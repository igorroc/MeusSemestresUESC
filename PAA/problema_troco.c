#include <stdio.h>
#include <time.h>

#define VALOR 43
// Valor a ser trocado

int universoMoedas[] = {1, 5, 10, 25, 50};
// Possíveis moedas para troco

const int QTD_MOEDAS = sizeof(universoMoedas) / sizeof(universoMoedas[0]);
// Quantidade das possíveis moedas para troco

int MENOR_MOEDA = -1;

int memoria[VALOR] = {-1};
// Armazenamento das verificações já realizadas

int problema_troco(int valor){
  int troco;

  if (valor == 0){
    troco = 0;
  }else if (valor < MENOR_MOEDA){
    printf("Valor (%d) é muito grande, menor moeda possível é %d\n", valor, MENOR_MOEDA);
    troco = 0;
  }else if (memoria[valor - 1] != -1){
    // Busca na memória se o troco para aquele valor ja foi calculado
    troco = memoria[valor - 1];
  }else{
    troco = valor + 1;
    // Configura o valor de troco acima do possivel, pois será verificado qual o valor de moeda gera menos moedas no final

    int i;
    for (i = 0; i < QTD_MOEDAS; i++){
      if (valor >= universoMoedas[i]){
        int possivelTroco = problema_troco(valor - universoMoedas[i]) + 1;
        // Busca o sub-problema de troco, e adiciona 1 pois 1 moeda foi utilizada

        if (possivelTroco < troco){
          // Escolhe a melhor opção de moeda (a que gera a menor quantidade de troco)
          troco = possivelTroco;
        }
      }
    }
    memoria[valor - 1] = troco;
    // Adiciona na memória o melhor troco relativo a aquele valor
  }

  return troco;
}

void configuracaoInicial(){
  for (int k = 0; k < VALOR; k++){
    memoria[k] = -1;
    // Limpa a memória colocando -1 em todos os espaços
  }

  MENOR_MOEDA = universoMoedas[0];
  for (int k = 1; k < QTD_MOEDAS; k++){
    if (universoMoedas[k] < MENOR_MOEDA){
      // Configura a menor moeda possível
      MENOR_MOEDA = universoMoedas[k];
    }
  }
}

int main(void){
  // Discente: Igor Lima Rocha

  // Para alterar os valores, vá para o início do documento e altere
  // a constante VALOR, e o universo de moedas.

  configuracaoInicial();

  int troco = problema_troco(VALOR);

  printf("São necessárias %d moedas de troco em %d\n", troco, VALOR);

  return 0;
}