#include <stdio.h>
#include <stdlib.h>

#define CXMAX 200
#define STACKSIZE 500

#define VALOR 52

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

  // Main:
    code[0].f = INT; code[0].l = 0; code[0].a = 3;
    code[1].f = LIT; code[1].l = 0; code[1].a = VALOR;  // Valor que será usado na função
    code[2].f = STO; code[2].l = 0; code[2].a = 3 + 3;  // Passa como parâmetro
    code[3].f = CAL; code[3].l = 0; code[3].a = 6;      // Chama a função
    code[4].f = LOD; code[4].l = 0; code[4].a = 3 + 4;  // Pega o resultado da função
    code[5].f = OPR; code[5].l = 0; code[5].a = 0;

  // Função: f(x) = 2x
    code[6].f = INT; code[6].l = 0; code[6].a = 5;
    code[7].f = LOD; code[7].l = 0; code[7].a = 3;     // Carrega o parâmetro
    code[8].f = LIT; code[8].l = 0; code[8].a = 2;     // Valor pelo qual será multiplicado
    code[9].f = OPR; code[9].l = 0; code[9].a = 4;     // Multiplica
    code[10].f = STO; code[10].l = 0; code[10].a = 4;  // Salva o return da função
    code[11].f = OPR; code[11].l = 0; code[11].a = 0;

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
            i = code[p];
            printf("\n|%2d | %2d | %2d | ", t, b, p);
            p++;
            switch (i.f){
                case LIT: // Coloca no topo o valor de 'i.a'
                    t++;
                    s[t] = i.a;
                    break;
                case OPR: // Realiza uma das seguintes operações
                    switch(i.a){
                        case 0: // Return
                            t = b - 1;
                            p = s[t + 3];
                            b = s[t + 2];
                            break;
                        case 1: // Inversor
                            s[t] = -s[t];
                            break;
                        case 2: // Soma
                            t--;
                            s[t] = s[t] + s[t + 1];
                            break;
                        case 3: // Subtração
                            t--;
                            s[t] = s[t] - s[t + 1];
                            break;
                        case 4: // Multiplicação
                            t--;
                            s[t] = s[t] * s[t + 1];
                            break;
                        case 5: // Divisão
                            t--;
                            s[t] = s[t] / s[t + 1];
                            break;
                        case 6: // Resto por 2
                            s[t] = (s[t]) % 2;
                            break;
                        case 8: // Igualdade
                            t--;
                            s[t] = (s[t] == s[t + 1]);
                            break;
                        case 9: // Diferença
                            t--;
                            s[t] = (s[t] != s[t + 1]);
                            break;
                        case 10: // Menor que
                            t--;
                            s[t] = (s[t] < s[t + 1]);
                            break;
                        case 11: // Maior igual
                            t--;
                            s[t] = (s[t] >= s[t + 1]);
                            break;
                        case 12: // Maior que
                            t--;
                            s[t] = (s[t] > s[t + 1]);
                            break;
                        case 13: // Menor igual
                            t--;
                            s[t] = (s[t] <= s[t + 1]);
                            break;
                    }
                    break;
                case LOD: // Carrega uma variável do endereço 'i.a' para o topo
                    t++;
                    s[t] = s[base(i.l) + i.a];
                    break;
                case STO: // Salva no endereço 'i.a' o valor do topo
                    s[base(i.l) + i.a] = s[t];
                    t--;
                    break;
                case CAL: // Pula para a instrução 'i.a', configurando corretamente a chamada da função
                    {
                        s[t + 1] = base(i.l);
                        s[t + 2] = b;
                        s[t + 3] = p;
                        b = t + 1;
                        p = i.a;
                    }
                    break;
                case INT: // "Aloca" uma quantidade 'i.a' de memória
                    t = t + i.a;
                    break;
                case JMP: // Pula para a instrução 'i.a'
                    p = i.a;
                    break;
                case JPC: // Pula para a instrução 'i.a' caso o topo seja 0
                    if (s[t] == 0){
                        p = i.a;
                        t--;
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