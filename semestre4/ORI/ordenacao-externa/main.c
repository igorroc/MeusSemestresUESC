#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <string.h>

#define DATA_SIZE 25
#define MEMORY_SIZE 20
#define MIN_NUM 0
#define MAX_NUM 99999

#define FILES_QUANTITY 4

int* createFiles(int);
void generateRandom(FILE* );
void createNewFiles(int);
void sorting(int);

int main(){
    srand(time(NULL));

    createNewFiles(FILES_QUANTITY);

    sorting(FILES_QUANTITY);
    
    return 0;
}

void generateRandom(FILE* file){
    int i = 0, j = 0;
    int random;
    char buf[12];
    printf("Generating random numbers - ");
    for(j = 0; j < DATA_SIZE; j++){
        random = (rand() % (MAX_NUM - MIN_NUM + 1)) + MIN_NUM;

        snprintf(buf, 12, "%d\n", random); // puts string into buffer
        fputs(buf, file);
        printf("%d,", random);
    }
}

void createNewFiles(int quantity){
    FILE * fPtr;
    char buf[15];

    int i = 0;
    for(i = 0; i < quantity; i++){

        snprintf(buf, 15, "./input%d.txt", i); // puts string into buffer
        fPtr = fopen(buf, "w");

        if(fPtr == NULL){
            /* File not created hence exit */
            printf("Unable to create file %d.\n", i);
            exit(EXIT_FAILURE);
        }

        /* Write data to file */
        generateRandom(fPtr);

        /* Close file to save file data */
        fclose(fPtr);

        /* Success message */
        printf("\nFile %d created and saved successfully.\n", i);
    }
}

void sorting(int quantity){
    FILE* filePointer;
    int ram[MEMORY_SIZE] = {0};

    int bufferLength = 10;
    char buffer[bufferLength];

    int clearNumber;

    filePointer = fopen("input0.txt", "r");

    while( fgets(buffer, bufferLength, filePointer) ) {
        clearNumber = (int) strtol(buffer, (char **)NULL, bufferLength)
        printf("[%d]", clearNumber );
    }

    fclose(filePointer);
}
