#include <locale.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_SIZE 50
#define PRINT_INFO false

typedef struct {
    char primeiraSingular[MAX_SIZE];
    char segundaSingular[MAX_SIZE];
    char terceiraSingular[MAX_SIZE];
    char primeiraPlural[MAX_SIZE];
    char segundaPlural[MAX_SIZE];
    char terceiraPlural[MAX_SIZE];
} PalavraConjugacoes;

typedef struct {
    int len;
    char palavra[MAX_SIZE];
    char* sufixo;
    char semSufixo[MAX_SIZE];
    PalavraConjugacoes pessoa;
} PalavraInfo;

typedef struct {
    char palavra[MAX_SIZE];
    PalavraConjugacoes pessoa;
} Dicionario;

bool conjugarVerbo(char*);
void verificaErro(char*);
void insereSufixo(char*, char*, char*);
bool buscarDicionario(char*);
void printarTabelaConjugacao(PalavraConjugacoes);

enum { PRIMEIRASINGULAR,
	SEGUNDASINGULAR,
	TERCEIRASINGULAR,
	PRIMEIRAPLURAL,
	SEGUNDAPLURAL,
	TERCEIRAPLURAL
};

Dicionario dicionario[100];
int indiceAtualDicionario = 0;

int main() {
    setlocale(LC_ALL, "Portuguese");

    char palavra[MAX_SIZE] = {'\0'};

    printf("-------------------\n");
    printf("◉ Conjugador de Verbos ◉\n");
    printf("Oi! Eu sou o Jorge 🥸\n");
    printf("Digite a palavra desejada e eu vou tentar conjugar ela pra você.\n");
    printf("Digite 'exit' para fechar o programa corretamente.\n");
    printf("-------------------\n\n→ ");

    scanf("%s", palavra);

    while (strcmp(palavra, "exit")) {
        bool encontrou = buscarDicionario(palavra);
        if (!encontrou) {
            bool conjugou = conjugarVerbo(palavra);
            if (conjugou) {
                verificaErro(palavra);
            }
        }
        printf("\n→ ");

        scanf("%s", palavra);
    }

    printf("\n👋 Tchau, até a próxima!\n");

    return 0;
}

bool conjugarVerbo(char* palavra) {
    PalavraInfo entrada = {'\0'};
    bool naoExiste = false;
    strcpy(entrada.palavra, palavra);
    entrada.len = strlen(entrada.palavra);
    entrada.sufixo = &entrada.palavra[entrada.len - 2];
    strncpy(entrada.semSufixo, entrada.palavra, entrada.len - 2);

    if (PRINT_INFO) {
        printf("Palavra: %s\n", entrada.palavra);
        printf("Tamanho: %d\n", entrada.len);
        printf("Prefixo: %s\n", entrada.semSufixo);
        printf("Sufixo: %s\n\n", entrada.sufixo);
    }

    switch (entrada.sufixo[0]) {
        case 'a':
            // Eu
            insereSufixo(entrada.pessoa.primeiraSingular, entrada.semSufixo, "o");
            // Tu
            insereSufixo(entrada.pessoa.segundaSingular, entrada.semSufixo, "as");
            // Ele/Ela
            insereSufixo(entrada.pessoa.terceiraSingular, entrada.semSufixo, "a");
            // Nós
            insereSufixo(entrada.pessoa.primeiraPlural, entrada.semSufixo, "amos");
            // Vós
            insereSufixo(entrada.pessoa.segundaPlural, entrada.semSufixo, "ais");
            // Eles/Elas
            insereSufixo(entrada.pessoa.terceiraPlural, entrada.semSufixo, "am");
            break;
        case 'e':
            // Eu
            insereSufixo(entrada.pessoa.primeiraSingular, entrada.semSufixo, "o");
            // Tu
            insereSufixo(entrada.pessoa.segundaSingular, entrada.semSufixo, "es");
            // Ele/Ela
            insereSufixo(entrada.pessoa.terceiraSingular, entrada.semSufixo, "e");
            // Nós
            insereSufixo(entrada.pessoa.primeiraPlural, entrada.semSufixo, "emos");
            // Vós
            insereSufixo(entrada.pessoa.segundaPlural, entrada.semSufixo, "eis");
            // Eles/Elas
            insereSufixo(entrada.pessoa.terceiraPlural, entrada.semSufixo, "em");
            break;
        case 'i':
            // Eu
            insereSufixo(entrada.pessoa.primeiraSingular, entrada.semSufixo, "o");
            // Tu
            insereSufixo(entrada.pessoa.segundaSingular, entrada.semSufixo, "es");
            // Ele/Ela
            insereSufixo(entrada.pessoa.terceiraSingular, entrada.semSufixo, "e");
            // Nós
            insereSufixo(entrada.pessoa.primeiraPlural, entrada.semSufixo, "imos");
            // Vós
            insereSufixo(entrada.pessoa.segundaPlural, entrada.semSufixo, "is");
            // Eles/Elas
            insereSufixo(entrada.pessoa.terceiraPlural, entrada.semSufixo, "em");
            break;
        default:
            naoExiste = true;
    }

    if (naoExiste || entrada.sufixo[1] != 'r') {
        printf("A palavra '%s' não pode ser conjugada! Tente novamente com outra palavra.\n", entrada.palavra);
        return false;
    } else {
        printarTabelaConjugacao(entrada.pessoa);
    }

    printf("\n");

    return true;
}

void insereSufixo(char* conjugacao, char* semSufixo, char* novoSufixo) {
    strcpy(conjugacao, semSufixo);
    strcat(conjugacao, novoSufixo);
}

void verificaErro(char* palavra) {
    char resposta[MAX_SIZE] = {'\0'};
    printf("🤔 Errei alguma coisa? (y/n)\n");
    scanf("%s", resposta);
    printf("\n");

    if (resposta[0] == 'n') {
        printf("😁 Boa! Manda mais um verbo!\n");
        return;
    }

    printf("😥 Sério que eu errei? Como seria a conjugação certa de '%s'?\n", palavra);
    printf("Digite as conjugações separadas por vírgula. Ex:\n");
    printf("ando,andas,anda,andamos,andais,andam\n\n");

    char novaConjugacao[MAX_SIZE * 6];
    char* delim = ",";

    scanf("%s", novaConjugacao);

    strcpy(dicionario[indiceAtualDicionario].palavra, palavra);

    char* ptr = strtok(novaConjugacao, delim);
    for (int i = 0; ptr != NULL; i++) {
        switch (i) {
            case PRIMEIRASINGULAR:
                strcpy(dicionario[indiceAtualDicionario].pessoa.primeiraSingular, ptr);
                break;
            case SEGUNDASINGULAR:
                strcpy(dicionario[indiceAtualDicionario].pessoa.segundaSingular, ptr);
                break;
            case TERCEIRASINGULAR:
                strcpy(dicionario[indiceAtualDicionario].pessoa.terceiraSingular, ptr);
                break;
            case PRIMEIRAPLURAL:
                strcpy(dicionario[indiceAtualDicionario].pessoa.primeiraPlural, ptr);
                break;
            case SEGUNDAPLURAL:
                strcpy(dicionario[indiceAtualDicionario].pessoa.segundaPlural, ptr);
                break;
            case TERCEIRAPLURAL:
                strcpy(dicionario[indiceAtualDicionario].pessoa.terceiraPlural, ptr);
                break;
        }
        if (PRINT_INFO) {
            printf("|%s", ptr);
        }
        ptr = strtok(NULL, delim);
    }
    if (PRINT_INFO) {
        printf("\n");
    }
    indiceAtualDicionario++;

    printf("\n📝 Anotei aqui! Bora pra próxima.\n");
}

bool buscarDicionario(char* palavra) {
    for (int i = 0; i < indiceAtualDicionario; i++) {
        if (!strcmp(dicionario[i].palavra, palavra)) {
            printf("\n⭐ Eu já sei conjugar '%s'!\n", palavra);
            printarTabelaConjugacao(dicionario[i].pessoa);
            return true;
        }
    }
    return false;
}

void printarTabelaConjugacao(PalavraConjugacoes pessoa) {
    printf("------------------------------\n");
    printf("Eu         | %15s |\n", pessoa.primeiraSingular);
    printf("Tu         | %15s |\n", pessoa.segundaSingular);
    printf("Ele(a)     | %15s |\n", pessoa.terceiraSingular);
    printf("Nós        | %15s |\n", pessoa.primeiraPlural);
    printf("Vós        | %15s |\n", pessoa.segundaPlural);
    printf("Eles(as)   | %15s |\n", pessoa.terceiraPlural);
    printf("------------------------------\n");
}