def bubble_sort(vetor, n):
    for k in range(1, n):
        print ("\n[%d] ") % k,
        for j in range(0, n - 1):
            print ("%d, ") % j,
            if vetor[j] > vetor[j + 1]:
                aux = vetor[j]
                vetor[j] = vetor[j + 1]
                vetor[j + 1] = aux

vetor = [1, 3, 5, 7, 9, 2, 4, 6, 8, 0]
bubble_sort(vetor, 10)
print (vetor)