void swap(int *a, int *b) {
    int t = *a;
    *a = *b;
    *b = t;
}

int partition(int array[], int low, int high, long long int* comparisons, long long int* movements) {
    // select the rightmost element as pivot
    int pivot = array[high];

    // pointer for greater element
    int i = (low - 1);

    // traverse each element of the array
    // compare them with the pivot
    for (int j = low; j < high; j++) {
        (*comparisons)++;
        if (array[j] < pivot) {
            // if element smaller than pivot is found
            // swap it with the greater element pointed by i
            i++;

            // swap element at i with element at j
            swap(&array[i], &array[j]);
            (*movements)++;
        }
    }

    // swap the pivot element with the greater element at i
    swap(&array[i + 1], &array[high]);

    // return the partition point
    return (i + 1);
}

void quickSortRecursive(int array[], int low, int high, long long int* comparisons, long long int* movements) {
    if (low < high) {
        // find the pivot element such that
        // elements smaller than pivot are on left of pivot
        // elements greater than pivot are on right of pivot
        int pi = partition(array, low, high, comparisons, movements);

        // recursive call on the left of pivot
        quickSortRecursive(array, low, pi - 1, comparisons, movements);

        // recursive call on the right of pivot
        quickSortRecursive(array, pi + 1, high, comparisons, movements);
    }
}