#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* expression = "(+x*y-z+(0+1))";
char c;
char token;
int step = 0;
int errorCode = 0;

int expr();
int term();
int factor();
int erro(int);

int main() {
    printf("Expressao analisada:\n%s\n\n", expression);
    expr();
    if (errorCode == 0) {
        printf("A expressao analisada esta correta!\n");
    }
    return 0;
}

int expr() {
    term();
    c = expression[step++];
    while (c == '+' || c == '-') {
        token = c;
        term();
        c = expression[step++];
    }
    step--;
    return 0;
}

int term() {
    factor();
    c = expression[step++];

    while (c == '*' || c == '/') {
        token = c;
        factor();
        c = expression[step++];
    }

    step--;
    return 0;
}

int factor() {
    c = expression[step++];

    if (c == 'x' || c == 'y' || c == 'z' || c == '0' || c == '1') {
        token = c;
        return 0;
    } else if (c == '(') {
        token = c;
        expr();
        c = expression[step++];

        if (c == ')') {
            token = c;
            return 0;
        } else {
            erro(2);
        }
    } else {
        erro(1);
    }
}

int erro(int code) {
    switch (code) {
        case 1:
            printf("O caractere '%c' nao é uma variavel (x, y, z) ou uma constante (0, 1)\n", c);
            errorCode = 1;
            exit(1);
            break;
        case 2:
            printf("Nao foi encontrado o fechamento de parentese entre '%c' e '%c'\n", token, c);
            errorCode = 2;
            exit(2);
            break;
    }
}
