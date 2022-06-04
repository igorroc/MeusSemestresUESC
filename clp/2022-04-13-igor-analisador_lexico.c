#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Discente: Igor Lima Rocha

#define EMPTY '@'
#define EMPTY_STRING "@"
#define TRUE 1
#define FALSE 0

#define SIZE_OF_INSTRUCTIONS 25 // Quantas instruções existem
#define SIZE_OF_STACK 200        // Qual o tamanho máximo da pilha
#define PRINT_TABLE TRUE        // Switch para escrever a tabela de passos
#define DOT "•"                 // Simbolo de ponto, para busca na expressao
char equacao[SIZE_OF_STACK] = "(h*(i+1))"; // ! ------------------------- EQUACAO "(i+(i+(i+(i+(i+(i+(i+(i+(i+(i+(i+(i+(i+(i+(i+(i+(i+(i+1))))))))))))))))))"

typedef struct{
    int index;  	// Indice da instrução
    char readP; 	// Leitura na pilha
    char readE; 	// Leitura na expressão
    char pop;		// Faz pop (TRUE/FALSE)
    char push[SIZE_OF_STACK];  // Faz push (valor do push)
} Instrucao;

typedef  struct{
	int topo;
	char stack[SIZE_OF_STACK];
} Pilha;

int len, headerLen;
Instrucao* instrucoes;
Pilha pilha;

void printPonto(char*, int);
void printTableHead(int);
void printPilha();
void printTableRow(int, char*, int, int);
void printLine();

char getLido(char*, int);

Pilha loadPilha();
void popPilha();
void pushPilha(char*);

Instrucao* createInstructions();
Instrucao findInstruction(char, char);

int main(){
	instrucoes = createInstructions();
	len = strlen(equacao);
	pilha = loadPilha();
	
	int passo = 0;
	char lidoEquacao;

	printf("\n→ Expressao avaliada: %s\n", equacao);
	printTableHead(len);
	for(int i = 0; i <= len; passo++){
		lidoEquacao = getLido(equacao, i); // Lê o caracter na string

		Instrucao task = findInstruction(lidoEquacao, pilha.stack[pilha.topo]); // Busca a instrução que deve ser feita

		printTableRow(passo, equacao, i, task.index);
		if(task.index == -1){  // Verifica se chegou ao fim
			printLine();
			if(i >= len && pilha.topo < 0){
				printf("ESSA EXPRESSAO E VALIDA!\n");
				return 0;
			}
			printf("A EXPRESSAO NAO E VALIDA\n");
			return 0;
		}

		if(lidoEquacao == pilha.stack[pilha.topo]){ // Pode ir para o proximo caractere da expressão
			i++;
		}

		if(task.pop){ // Faz o pop
			popPilha();
		}

		if(strcmp(task.push, EMPTY_STRING)){ // Faz o push (strcmp = 0 se for igual)
			pushPilha(task.push);
		}
	}
	

	return 0;
}

char getLido(char* string, int posicao){
	return string[posicao];
}

void printPonto(char* string, int posicao){
	int j, len = strlen(string);
	for(j = 0; j < len; j++){
		if(j == posicao){
			printf(DOT);
		}
		printf("%c", string[j]);
	}
	if(posicao == len){
		printf(DOT);
	}
}

void printTableHead(int len){
	if(!PRINT_TABLE) return;

    char text[SIZE_OF_STACK] = {'\0'}, spacing[SIZE_OF_STACK] = {'\0'}, spacing2[SIZE_OF_STACK] = {'\0'};
    for(int i = 0; i < len; i++){
        if(i == len/2){
            strcat(spacing, "•W");
        }
        strcat(spacing, " ");
    }
	
	for(int i = 0; i < len; i++){
		if(i == (len/2)-2){
            strcat(spacing2, "Stack");
			i+=5;
        }
        strcat(spacing2, " ");
	}
	strcat(text, "Passo | "); strcat(text, spacing); strcat(text, " | "); strcat(text, spacing2); strcat(text, " | ti \n");
	
	printf(text);
	headerLen = strlen(text);
	printLine();
}

void printTableRow(int passo, char* equacao, int i, int index){
	if(!PRINT_TABLE) return;
	printf("%5d | ", passo);
	printPonto(equacao, i);
	printf("  | ");
	printPilha();

	if(index == -1){
		printf(" | -\n");
	}else{
		printf(" | t%d\n", index);
	}
}

void printLine(){
	for(int i = 0; i < headerLen; i++){
		printf("-");
	}
	printf("\n");
}

void printPilha(){
	int j = 0;

	if(pilha.topo < 0){
		printf("∅");
		j++;
	}else{
		for(int i = pilha.topo; i >= 0; i--, j++){
			printf("%c", pilha.stack[i]);
		}
	}

	for(; j < len; j++){
		printf(" ");
	}
}

Instrucao* createInstructions(){
	Instrucao* instrucoes = (Instrucao*)malloc(sizeof(Instrucao) * SIZE_OF_INSTRUCTIONS);

	instrucoes[0].index = 0;   instrucoes[0].readP = EMPTY;	instrucoes[0].readE = '(';   instrucoes[0].pop = FALSE; strcpy(instrucoes[0].push,"E");
	instrucoes[1].index = 1;   instrucoes[1].readP = 'E';	instrucoes[1].readE = '(';	 instrucoes[1].pop = TRUE;  strcpy(instrucoes[1].push,"(EXE)");
	instrucoes[2].index = 2;   instrucoes[2].readP = 'X';	instrucoes[2].readE = '+';	 instrucoes[2].pop = TRUE;  strcpy(instrucoes[2].push,"+");
	instrucoes[3].index = 3;   instrucoes[3].readP = 'X';	instrucoes[3].readE = '-';	 instrucoes[3].pop = TRUE;  strcpy(instrucoes[3].push, "-");
	instrucoes[4].index = 4;   instrucoes[4].readP = 'X';	instrucoes[4].readE = '*';	 instrucoes[4].pop = TRUE;  strcpy(instrucoes[4].push, "*");
	instrucoes[5].index = 5;   instrucoes[5].readP = 'X';	instrucoes[5].readE = '/';	 instrucoes[5].pop = TRUE;  strcpy(instrucoes[5].push, "/");
	instrucoes[6].index = 6;   instrucoes[6].readP = 'E';	instrucoes[6].readE = 'h';	 instrucoes[6].pop = TRUE;  strcpy(instrucoes[6].push, "h");
	instrucoes[7].index = 7;   instrucoes[7].readP = 'E';	instrucoes[7].readE = 'i';	 instrucoes[7].pop = TRUE;  strcpy(instrucoes[7].push, "i");
	instrucoes[8].index = 8;   instrucoes[8].readP = 'E';	instrucoes[8].readE = 'j';	 instrucoes[8].pop = TRUE;  strcpy(instrucoes[8].push, "j");
	instrucoes[9].index = 9;   instrucoes[9].readP = 'E';	instrucoes[9].readE = 'k';	 instrucoes[9].pop = TRUE;  strcpy(instrucoes[9].push, "k");
	instrucoes[10].index = 10; instrucoes[10].readP = 'E';	instrucoes[10].readE = '0';	 instrucoes[10].pop = TRUE; strcpy(instrucoes[10].push, "0");
	instrucoes[11].index = 11; instrucoes[11].readP = 'E';	instrucoes[11].readE = '1';	 instrucoes[11].pop = TRUE; strcpy(instrucoes[11].push, "1");

	instrucoes[12].index = 12; instrucoes[12].readP = 'h';	instrucoes[12].readE = 'h';	 instrucoes[12].pop = TRUE; strcpy(instrucoes[12].push, EMPTY_STRING);
	instrucoes[13].index = 13; instrucoes[13].readP = 'i';	instrucoes[13].readE = 'i';	 instrucoes[13].pop = TRUE; strcpy(instrucoes[13].push, EMPTY_STRING);
	instrucoes[14].index = 14; instrucoes[14].readP = 'j';	instrucoes[14].readE = 'j';	 instrucoes[14].pop = TRUE; strcpy(instrucoes[14].push, EMPTY_STRING);
	instrucoes[15].index = 15; instrucoes[15].readP = 'k';	instrucoes[15].readE = 'k';	 instrucoes[15].pop = TRUE; strcpy(instrucoes[15].push, EMPTY_STRING);
	instrucoes[16].index = 16; instrucoes[16].readP = '0';	instrucoes[16].readE = '0';	 instrucoes[16].pop = TRUE; strcpy(instrucoes[16].push, EMPTY_STRING);
	instrucoes[17].index = 17; instrucoes[17].readP = '1';	instrucoes[17].readE = '1';	 instrucoes[17].pop = TRUE; strcpy(instrucoes[17].push, EMPTY_STRING);
	instrucoes[18].index = 18; instrucoes[18].readP = '+';	instrucoes[18].readE = '+';	 instrucoes[18].pop = TRUE; strcpy(instrucoes[18].push, EMPTY_STRING);
	instrucoes[19].index = 19; instrucoes[19].readP = '-';	instrucoes[19].readE = '-';	 instrucoes[19].pop = TRUE; strcpy(instrucoes[19].push, EMPTY_STRING);
	instrucoes[20].index = 20; instrucoes[20].readP = '*';	instrucoes[20].readE = '*';	 instrucoes[20].pop = TRUE; strcpy(instrucoes[20].push, EMPTY_STRING);
	instrucoes[21].index = 21; instrucoes[21].readP = '/';	instrucoes[21].readE = '/';	 instrucoes[21].pop = TRUE; strcpy(instrucoes[21].push, EMPTY_STRING);
	instrucoes[22].index = 22; instrucoes[22].readP = '(';	instrucoes[22].readE = '(';	 instrucoes[22].pop = TRUE; strcpy(instrucoes[22].push, EMPTY_STRING);
	instrucoes[23].index = 23; instrucoes[23].readP = ')';	instrucoes[23].readE = ')';	 instrucoes[23].pop = TRUE; strcpy(instrucoes[23].push, EMPTY_STRING);

	return instrucoes;
}

Instrucao findInstruction(char readE, char readP){
	if(pilha.topo == -1 && readE == '('){  // Primeira instrução
		return instrucoes[0];
	}
	
	for(int i = 0; i < SIZE_OF_INSTRUCTIONS; i++){
		if(instrucoes[i].readE == readE && instrucoes[i].readP == readP) return instrucoes[i];
	}

	Instrucao vazio;
	vazio.index = -1;
	return vazio;
}

Pilha loadPilha(){
	Pilha p;
	p.stack[0] = '\0';
	p.topo = -1;
	return p;
}

char *strrev(char *s)
{
    if (s && *s) {
        char *b = s, *e = s + strlen(s) - 1;
        while (b < e) {
            char t = *b;
            *b++ = *e;
            *e-- = t;
        }
    }
    return s;
}

void popPilha(){
	pilha.stack[pilha.topo--] = '\0';
}

void pushPilha(char* str){
	strcat(pilha.stack, strrev(str));
	pilha.topo += strlen(str);
}
