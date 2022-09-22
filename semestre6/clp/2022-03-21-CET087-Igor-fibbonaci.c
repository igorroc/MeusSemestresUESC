#include <stdio.h>
#include <stdlib.h>

// Aluno: Igor Lima Rocha

#define CXMAX 200
#define STACKSIZE 500
#define LIMITE_MAX 15

const int amax = 2047, levmax = 3;

enum fct {LIT, OPR, LOD, STO, CAL, INT, JMP, JPC};
typedef struct {
    enum fct f;
    int l;
    int a;
}  Instruction;

Instruction code[CXMAX];
int s[STACKSIZE];
int p, b, t;

int base(int l){
    int b1;
    b1 = b;
    while(l > 0){
        b1 = s[b1];
        l = l-1;
    }
    return b1;
}

int main(){
  // Instructions:
  code[0].f = INT; code[0].l = 0; code[0].a = 8;     // Inicia memoria
  code[1].f = LIT; code[1].l = 0; code[1].a = 0;     // Inicia T1
  code[2].f = STO; code[2].l = 0; code[2].a = 3;     // Salva T1
  code[3].f = LIT; code[3].l = 0; code[3].a = 1;     // Inicia T2
  code[4].f = STO; code[4].l = 0; code[4].a = 4;     // Salva T2
  code[5].f = LIT; code[5].l = 0; code[5].a = 2;     // Inicia Contador
  code[6].f = STO; code[6].l = 0; code[6].a = 6;     // Salva contador
  code[7].f = LIT; code[7].l = 0; code[7].a = LIMITE_MAX;   // Configura máximo
  code[8].f = STO; code[8].l = 0; code[8].a = 7;     // Salva max
  code[9].f = LOD; code[9].l = 0; code[9].a = 3;     // Inicio do loop (load T1)-----
  code[10].f = LOD; code[10].l = 0; code[10].a = 4;     // Load T2
  code[11].f = OPR; code[11].l = 0; code[11].a = 2;     // T1 + T2
  code[12].f = STO; code[12].l = 0; code[12].a = 5;     // Salva o fib
  code[13].f = LOD; code[13].l = 0; code[13].a = 4;  // Load T2
  code[14].f = STO; code[14].l = 0; code[14].a = 3;  // T1 = T2
  code[15].f = LOD; code[15].l = 0; code[15].a = 5;  // Load Fib
  code[16].f = STO; code[16].l = 0; code[16].a = 4;  // T2 = Fib
  code[17].f = LOD; code[17].l = 0; code[17].a = 6;  // Load Contador
  code[18].f = LOD; code[18].l = 0; code[18].a = 7;  // Load Máximo
  code[19].f = OPR; code[19].l = 0; code[19].a = 10; // Menor que
  code[20].f = JPC; code[20].l = 0; code[20].a = 25; // Saida do loop -------
  code[21].f = LOD; code[21].l = 0; code[21].a = 6;  // Load Contador
  code[22].f = OPR; code[22].l = 0; code[22].a = 2;  // Contador + 1
  code[23].f = STO; code[23].l = 0; code[23].a = 6;  // Salva Contador
  code[24].f = JMP; code[24].l = 0; code[24].a = 9;  // Fim do loop
  code[25].f = OPR; code[25].l = 0; code[25].a = 0;

  // PCode Machine:
  Instruction i;
  {
      printf(" start pl/0 ");
      t = 0;
      b = 1;
      p = 0;
      s[1] = 0;
      s[2] = 0;
      s[3] = 0;
      printf("\n| t |  b |  p |");
      do {
          i =  code[p];
          printf("\n|%2d | %2d | %2d | ", t, b, p); 
          p = p+1;
          switch (i.f){
              case LIT:
                  t = t+1;
                  s[t] = i.a;
                  break;
              case OPR:
                  switch(i.a){
                      case 0: // Return
                          t = b - 1;
                          p = s[t + 3];
                          b = s[t + 2];
                          break;
                      case 1: // Negativo
                          s[t] = -s[t];
                          break;
                      case 2: // Soma
                          t = t - 1;
                          s[t] = s[t] + s[t + 1];
                          break;
                      case 3: // Subtração
                          t = t - 1;
                          s[t] = s[t] - s[t + 1];
                          break;
                      case 4: // Multiplicação
                          t = t - 1;
                          s[t] = s[t] * s[t + 1];
                          break;
                      case 5: // Divisão
                          t = t - 1;
                          s[t] = s[t] / s[t + 1];
                          break;
                      case 6:
                          s[t] = (s[t]) % 2;
                          break;
                      case 8:
                          t = t - 1;
                          s[t] = (s[t] == s[t + 1]);
                          break;
                      case 9:
                          t = t - 1;
                          s[t] = (s[t] != s[t + 1]);
                          break;
                      case 10:
                          t = t - 1;
                          s[t] = (s[t] < s[t + 1]);
                          break;
                      case 11:
                          t = t - 1;
                          s[t] = (s[t] >= s[t + 1]);
                          break;
                      case 12: 
                          t = t - 1;
                          s[t] = (s[t] > s[t + 1]);
                          break;
                      case 13: 
                          t = t - 1;
                          s[t] = (s[t] <= s[t + 1]);
                          break;
                  }
                  break;
              case LOD:
                  t = t + 1;
                  s[t] = s[base(i.l) + i.a];
                  break;
              case STO:
                  s[base(i.l) + i.a] = s[t];
                  t = t - 1;
                  break;
              case CAL:
                  {
                    s[t + 1] = base(i.l);
                    s[t + 2] = b;
                    s[t + 3] = p;
                    b = t + 1;
                    p = i.a;
                  }
                  break;
              case INT:
                  t = t + i.a;
                  break;
              case JMP:
                  p = i.a;
                  break;
              case JPC:
                  if (s[t] == 0){
                      p = i.a;
                      t = t - 1;
                  }
                  break;
          }
          for(int j = 1; j <= t; j++){
              printf("[%d]", s[j]); 
          }
      } while(p != 0);
  }
  return 0;
}