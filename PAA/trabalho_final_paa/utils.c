#include <malloc.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

char *intToString(int number) {
    char *str = (char*) malloc(sizeof(char) * 20);
    sprintf(str, "%d", number);
    return str;
}

int stringToInt(char *string) {
    return atoi(string);
}

char *setFileName(char letter, int size) {
    char *string = (char*) malloc(sizeof(char) * 20);
    char newLetter[2] = {letter};
    string[0] = '\0';
    strcat(string, newLetter);
    strcat(string, "_");
    strcat(string, intToString(size));
    strcat(string, ".txt");
    return string;
}

void printArray(int array[], int len) {
    for (int i = 0; i < len; i++) {
        printf("[%d]", array[i]);
    }
    printf("\n");
}

int *getArrayFromFile(char *filename, int length) {
    FILE *file;
    int *array = (int*) malloc(sizeof(int) * (length + 1));
    char *line = NULL;
    size_t len = 0;
    size_t read;

    file = fopen(filename, "r");
    if (file == NULL) {
        return NULL;
    }

    int i = 0;
    while ((read = getline(&line, &len, file)) != -1) {
        array[i++] = stringToInt(line);
    }

    fclose(file);
    if (line) {
        free(line);
    }

    return array;
}