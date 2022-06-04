#include <locale.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "utils.c"

#define MAP_SIZE 10
#define BOMB_QUANTITY 10
#define BOMB_CHARACTER 'X'
#define EMPTY_CHARACTER ' '
#define MAX_TRIES_ERROR 30
#define PRINT_COLOR true
#define PLAYER_INPUT true
#define ITERATION_COUNT 1

typedef struct {
    char value;
    bool wasClicked;
} Slot;

Slot** setupMap(int);
Slot** addBombs(Slot**, int, int);
void printMap(Slot**, int, bool);

char playerChoose(Slot**, int, int, int);
bool checkGameWin(Slot**, int, int);
void checkNeighbours(Slot**, int, int, int);
int countBombs(Slot**, int, int);

int main() {
    setlocale(LC_ALL, "");
    srand(time(NULL));
    clearScreen();
    int botGameWins = 0;
    int botGameLoses = 0;
    for (int k = 0; k < ITERATION_COUNT; k++) {
        Slot** map = setupMap(MAP_SIZE);
        bool gameLose = false;
        bool gameWin = false;
        int stepsPlayed = 0;

        map = addBombs(map, MAP_SIZE, BOMB_QUANTITY);

        while (!gameLose && !gameWin) {
            if (!PLAYER_INPUT) {
                if (PRINT_COLOR) colorYellow();
                printf("INTERACAO %d → %d/%d\n", k, botGameWins, botGameLoses);
                if (PRINT_COLOR) colorReset();
            }
            int playerX, playerY;
            char choice;

            if (PLAYER_INPUT) {
                printMap(map, MAP_SIZE, false);
                printf("Escolha → ");
                scanf("%d %d", &playerX, &playerY);

                while (playerX < 0 || playerX >= MAP_SIZE || playerY < 0 || playerY >= MAP_SIZE) {
                    printf("Escolha → ");
                    scanf("%d %d", &playerX, &playerY);
                }
            } else {
                playerX = randomNumber(0, MAP_SIZE);
                playerY = randomNumber(0, MAP_SIZE);
            }

            choice = playerChoose(map, playerX, playerY, MAP_SIZE);
            stepsPlayed++;

            printf("CHOICE: [%d][%d] = %c\n", playerX, playerY, choice);
            printf("\n--------------------\n\n");

            if (choice == BOMB_CHARACTER) {
                gameLose = true;
                printMap(map, MAP_SIZE, false);
            } else {
                gameWin = checkGameWin(map, MAP_SIZE, BOMB_QUANTITY);
            }

            clearScreen();
        }

        printf("\n\n");
        printMap(map, MAP_SIZE, true);
        if (gameWin) {
            printf("\nParabéns! Você venceu o jogo!\n");
            botGameWins++;
        } else {
            printf("\nQue pena! Você perdeu o jogo em %d tentativas!\n", stepsPlayed);
            botGameLoses++;
        }
    }

    if (!PLAYER_INPUT) {
        clearScreen();
        if (PRINT_COLOR) colorYellow();
        printf("Total de %d interações\n", botGameWins + botGameLoses);
        if (PRINT_COLOR) colorReset();
        if (PRINT_COLOR) colorGreen();
        printf("Partidas Ganhas → %d\n", botGameWins);
        if (PRINT_COLOR) colorReset();
        if (PRINT_COLOR) colorRed();
        printf("Partidas Perdidas → %d\n", botGameLoses);
        if (PRINT_COLOR) colorReset();
    }
    return 0;
}

Slot** setupMap(int mapSize) {
    Slot** map = (Slot**)malloc(mapSize * sizeof(Slot*));
    for (int i = 0; i < mapSize; i++) {
        map[i] = (Slot*)malloc(mapSize * sizeof(Slot));
    }

    for (int i = 0; i < mapSize; i++) {
        for (int j = 0; j < mapSize; j++) {
            map[i][j].value = EMPTY_CHARACTER;
            map[i][j].wasClicked = false;
        }
    }

    return map;
}

Slot** addBombs(Slot** map, int mapSize, int bombQuantity) {
    for (int i = 0; i < bombQuantity; i++) {
        int x = randomNumber(0, mapSize);
        int y = randomNumber(0, mapSize);

        int tries = 0;
        while (map[x][y].value == BOMB_CHARACTER) {
            x = randomNumber(0, mapSize);
            y = randomNumber(0, mapSize);
            if (tries++ > MAX_TRIES_ERROR) {
                printf("\nERRO: Muitas tentativas sem achar um lugar vago.\n");
                return NULL;
            }
        }

        map[x][y].value = BOMB_CHARACTER;
    }

    for (int i = 0; i < mapSize; i++) {
        for (int j = 0; j < mapSize; j++) {
            int bombs = 0;
            if (map[i][j].value == BOMB_CHARACTER) continue;

            bombs = countBombs(map, i, j);

            if (bombs == 0) {
                map[i][j].value = EMPTY_CHARACTER;
            } else {
                map[i][j].value = numberToChar(bombs);
            }
        }
    }

    return map;
}

bool checkGameWin(Slot** map, int mapSize, int bombQuantity) {
    int emptySlots = mapSize * mapSize;
    for (int i = 0; i < mapSize; i++) {
        for (int j = 0; j < mapSize; j++) {
            if (map[i][j].wasClicked) emptySlots--;
        }
    }
    if (emptySlots == bombQuantity)
        return true;
    else
        return false;
}

void printMap(Slot** map, int mapSize, bool printFull) {
    if (PRINT_COLOR) colorMagenta();
    printf(" -- ");
    for (int i = 0; i < mapSize; i++) {
        printf(" %d ", i);
    }
    if (PRINT_COLOR) colorReset();
    printf("\n");
    for (int i = 0; i < mapSize; i++) {
        if (PRINT_COLOR) colorMagenta();
        printf("%3d ", i);
        if (PRINT_COLOR) colorReset();
        for (int j = 0; j < mapSize; j++) {
            if (map[i][j].wasClicked || printFull) {
                if (map[i][j].value == BOMB_CHARACTER) {
                    if (PRINT_COLOR) colorRed();
                } else {
                    if (PRINT_COLOR) colorBlue();
                }
                printf("[%c]", map[i][j].value);
                if (PRINT_COLOR) colorReset();
            } else {
                printf("[H]");
            }
        }
        printf("\n");
    }
}

char playerChoose(Slot** map, int x, int y, int mapSize) {
    checkNeighbours(map, x, y, MAP_SIZE);
    map[x][y].wasClicked = true;
    return map[x][y].value;
}

int countBombs(Slot** map, int x, int y) {
    int bombs = 0;
    for (int xoff = -1; xoff <= 1; xoff++) {
        for (int yoff = -1; yoff <= 1; yoff++) {
            int i = x + xoff;
            int j = y + yoff;
            if (i >= 0 && i < MAP_SIZE && j >= 0 && j < MAP_SIZE) {
                if (map[i][j].value == BOMB_CHARACTER) {
                    bombs++;
                }
            }
        }
    }
    return bombs;
}

void checkNeighbours(Slot** map, int x, int y, int mapSize) {
    if (x < 0 || y < 0 || x >= mapSize || y >= mapSize) {
        return;
    }
    if (map[x][y].wasClicked) return;
    map[x][y].wasClicked = true;
    if (map[x][y].value == EMPTY_CHARACTER) {
        if (x + 1 < mapSize) {
            checkNeighbours(map, x + 1, y, mapSize);
        }
        if (y + 1 < mapSize) {
            checkNeighbours(map, x, y + 1, mapSize);
        }
        if (x - 1 >= 0) {
            checkNeighbours(map, x - 1, y, mapSize);
        }
        if (y - 1 >= 0) {
            checkNeighbours(map, x, y - 1, mapSize);
        }
    }
    return;
}