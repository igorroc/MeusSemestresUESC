#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "utils.h"

#define TABLE_WIDTH 8
#define TABLE_HEIGHT 8
#define QUEENS_COUNT 8
#define QUEEN_CHARACTER 'X'
#define PRINT_COLOR true
#define STEP_BY_STEP false

typedef struct {
    int x, y;
    bool offTable;
} Queen;

bool peace(Queen* queens, int currentQueen, int queenX, int queenY, char** table) {
    // Check on same row
    for (int i = 0; i < currentQueen; i++) {
        if (queens[i].y == queenY) {
            return false;
        }
    }

    // Check on same column
    for (int i = 0; i < currentQueen; i++) {
        if (queens[i].x == queenX) {
            return false;
        }
    }

    // Check neighbors
    for (int i = 0; i < currentQueen; i++) {
        for (int j = 0; j < currentQueen; j++) {
            if (queens[i].x - 1 == queenX && queens[i].y - 1 == queenY) {
                return false;
            }
            if (queens[i].x == queenX && queens[i].y - 1 == queenY) {
                return false;
            }
            if (queens[i].x + 1 == queenX && queens[i].y - 1 == queenY) {
                return false;
            }
            if (queens[i].x - 1 == queenX && queens[i].y == queenY) {
                return false;
            }

            if (queens[i].x + 1 == queenX && queens[i].y == queenY) {
                return false;
            }
            if (queens[i].x - 1 == queenX && queens[i].y + 1 == queenY) {
                return false;
            }
            if (queens[i].x == queenX && queens[i].y + 1 == queenY) {
                return false;
            }
            if (queens[i].x + 1 == queenX && queens[i].y + 1 == queenY) {
                return false;
            }
        }
    }

    // Check lower right diagonal
    for (int i = 0; i < currentQueen; i++) {
        for (int j = 0; j < TABLE_HEIGHT; j++){
            if(queens[i].x + j == queenX && queens[i].y + j == queenY){
                return false;
            }
        }
    }
    // Check lower left diagonal
    for (int i = 0; i < currentQueen; i++) {
        for (int j = 0; j < TABLE_HEIGHT; j++){
            if(queens[i].x + j == queenX && queens[i].y - j == queenY){
                return false;
            }
        }
    }

    return true;
}

Queen* setupQueens() {
    Queen* queens = malloc(sizeof(Queen) * QUEENS_COUNT);

    for (int i = 0; i < QUEENS_COUNT; i++) {
        queens[i].x = i;
        queens[i].y = -10;
        queens[i].offTable = false;
    }

    return queens;
}

char** setupTable() {
    char** table = (char**)malloc(sizeof(char**) * TABLE_WIDTH);
    for (int i = 0; i < TABLE_WIDTH; i++) {
        table[i] = (char*)malloc(sizeof(char*) * TABLE_HEIGHT);
    }

    for (int i = 0; i < TABLE_WIDTH; i++) {
        for (int j = 0; j < TABLE_HEIGHT; j++) {
            table[i][j] = ' ';
        }
    }

    return table;
}

void printTable(char** table, Queen* queens, int currentQueen) {
    for (int i = 0; i < TABLE_WIDTH; i++) {
        for (int j = 0; j < TABLE_HEIGHT; j++) {
            if (queens[i].y == j && !queens[i].offTable) {
                if (PRINT_COLOR) colorMagenta();
                printf("[%c]", QUEEN_CHARACTER);
                if (PRINT_COLOR) colorReset();
            } else if (!peace(queens, currentQueen, i, j, table) && !queens[currentQueen].offTable) {
                if (PRINT_COLOR) colorRed();
                printf("[ ]");
                if (PRINT_COLOR) colorReset();
            } else {
                printf("[%c]", table[i][j]);
            }
        }
        printf("\n");
    }
}

int main() {
    Queen* queens = setupQueens();
    char** table = setupTable();
    int onBoardQueens = 0;
    int currentQueen = 0;
    int currentPosition = -1;
    int newPosition = -1;
    char aux;

    while (onBoardQueens < QUEENS_COUNT) {
		printf("\n\n");
        printTable(table, queens, currentQueen);

        table[queens[currentQueen].x][queens[currentQueen].y] = ' ';
        newPosition = currentPosition;
        do {
            queens[currentQueen].x = currentQueen;
            queens[currentQueen].y = ++newPosition;
        } while (!peace(queens, currentQueen, queens[currentQueen].x, queens[currentQueen].y, table) && newPosition < 8);

        if (newPosition >= 8) {
            printf("Precisa fazer backtrack\n");
            queens[currentQueen].offTable = true;
            currentQueen--;
            currentPosition = queens[currentQueen].y;
            onBoardQueens--;
        } else {
            table[queens[currentQueen].x][queens[currentQueen].y] = QUEEN_CHARACTER;
            currentQueen++;
            queens[currentQueen].offTable = false;
            currentPosition = -1;
            onBoardQueens++;
        }

		if(STEP_BY_STEP){
        	scanf("%c", &aux);
		}
    }
    printf("Resultado:\n");
    printTable(table, queens, currentQueen);
	printf("\n");
    for (int i = 0; i < QUEENS_COUNT; i++) {
        printf("Rainha %d na posição: [%d][%d]\n", i+1, queens[i].x, queens[i].y);
    }

    return 0;
}