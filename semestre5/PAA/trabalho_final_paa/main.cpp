#include <malloc.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "mergeSort.c"
#include "quickSort.c"
#include "utils.c"

using namespace std;

// Discentes: Igor Lima Rocha e Isabelle Cruz

// ALGORITHMS
void bubbleSort(int array[], int len) {
    long long int comparisons = 0, movements = 0;

    for (int i = 0; i < len - 1; i++) {
        for (int j = 0; j < len - i - 1; j++) {
            // Verify if not in ascending order
            comparisons++;
            if (array[j] > array[j + 1]) {
                int temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
                movements++;
            }
        }
    }

    printf("Algorithm: BubbleSort\n");
    printf("Comparisons = %lld\n", comparisons);
    printf("Movements = %lld\n", movements);
}

void quickSort(int array[], int len) {
    long long int comparisons = 0, movements = 0;

    quickSortRecursive(array, 0, len - 1, &comparisons, &movements);

    printf("Algorithm: QuickSort\n");
    printf("Comparisons = %lld\n", comparisons);
    printf("Movements = %lld\n", movements);
}

void mergeSort(int array[], int length) {
    long long int comparisons = 0, movements = 0;

    mergeSortRecursive(array, 0, length - 1, &comparisons, &movements);

    printf("Algorithm: MergeSort\n");
    printf("Comparisons = %d\n", comparisons);
    printf("Movements = %d\n", movements);
}

int main() {
    int *array;
    int length = 10;
    char *filename;

    int aux = 1;
    char availableLetters[3] = {'A', 'C', 'D'};
    int currentLetter = 0;

    for (int i = 0; i < 12; i++) {
        if (i % 4 == 0 && i != 0) {
            length = 10;
            aux = 1;
            currentLetter++;
            if(currentLetter >= 3){
                currentLetter = 0;
            }
        }
        length *= pow(10, aux);
        filename = setFileName(availableLetters[currentLetter], length);
        array = getArrayFromFile(filename, length);

        printf("-------------\n");
        printf("Current File: \"%s\"\n", filename);
        printArray(array, length);

        clock_t start = clock();

        quickSort(array, length);

        clock_t finish = clock();

        double time_spent = (double)(finish - start) / CLOCKS_PER_SEC;

        printf("Time spent: %lfs\n", time_spent);
        printArray(array, length);
        printf("-------------\n");

        free(array);
    }

    return 0;
}