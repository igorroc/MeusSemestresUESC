## **Resolva utilizando funções**

1. Escreva uma função que recebe como parâmetros 2 números inteiros e retorna o maior entre eles.

2. Faça uma função para verificar se um número é positivo ou negativo. Sendo que o valor de retorno será 1 se positivo, -1 se negativo e 0 se o número for igual a 0.

3. Escreva uma função para verificar se um número é um quadrado perfeito. Um quadrado perfeito é um número inteiro positivo que pode ser expresso como o quadrado de outro número inteiro. Ex.: 1 e 9 são quadrados perfeitos, já 2 não.

4. Escreva uma função que receba 3 números inteiros como parâmetro, representando horas, minutos e segundos, converta-os em segundos e retorne esse valor.

5. Escreva uma função que recebe um número inteiro positivo e retorne a soma de todos os seus algarismos. Por exemplo, ao passar o número 251 retorne 8 (2 + 5 + 1). Se o número passado para a função for negativo, retorne -1.

6. Escreva uma função que recebe como parâmetro um número inteiro positivo, a função deve desenhar na tela um quadrado de asteriscos com as dimensões iguais ao número passado. Ex.: Ao passar o valor 5 a função deve desenhar:

7. Faça uma função que recebe um número inteiro positivo n e retorna o seu fatorial, n!.

8. Escreva uma função que recebe um número inteiro positivo n e calcula o somatório de 1 ate n.

9. Faça uma função que recebe um inteiro positivo N, calcule e retorne o resultado da seguinte serie:

    - `R = 2/5 + 5/6 + 10/7 + ... + (N*N + 1)/(N + 4)`

10. Faça uma função que recebe duas variáveis reais A e B e troca o valor delas. Ex.: A recebe o valor de B e B recebe o valor de A.

11. Faça uma função que receba um vetor de inteiros e retorne quantos valores pares ele possui.

12. Faça uma função que receba um vetor de inteiros e o preencha com a versão negada dos números.

    - Ex.: A o receber `{-1, 3, 0, 5}`, retornar `{1, -3, 0, -5}`

13. Escreva uma função que receba os vetores A, B e C. O vetor A possui 10 elementos. Sua função deve preencher o vetor B com os valores pares de A e o vetor C com os valores ímpares de A.

14. Faça uma função que receba uma matriz 4 x 4 e retorne quantos valores maiores do que 10 ela possui.

15. Faça uma função que recebe um vetor de 7 posições e um elemento X a ser inserido no vetor na posição P. P = X % 7. Retorne P.

16. Faça uma função que recebe uma letra qualquer por referência e converte essa letra para maiúscula.

17. Escreva uma função que recebe duas estruturas do tipo coelho A e B. Caso a distância entre os dois seja menor que 5 e a energia dos dois seja maior que 10 retorne uma estrutura coelho com os pontos x e y iguais aos pontos médios de A e B e energia igual a 20. Caso contrário retorne o novo coelho C com x, y e energia iguais a 0.

```c
struct coelho{
    float x, y;
    float energia;
};
```

18. Escreva uma função que recebe duas estruturas do tipo coelho A e B por referência. Caso a distância entre A e B seja menor que 5 faça com que os pontos x e y de B se afastem em uma posição dos pontos x e y de A.

19. Escreva uma função que recebe um vetor de coelhos e a estrutura area. Verifique os coelhos que estão sobre a área e faça com que sua energia seja igual a 20 se a área for do tipo 1 e igual a 0 caso a área seja do tipo 2.

```c
struct area{
    float x1, x2, x3, x4;
    int tipo;
}
```

20. Escreva uma função chamada aposta que recebe uma estrutura conta por referência. Sua função deve verificar o resultado da aposta e modificar o saldo da conta. Gere um número aleatório entre 0 e 6, caso este número seja igual à "escolha" o saldo = saldo + valor_apostado \* risco. Caso contrário o saldo = saldo. valor_apostado

```c
struct conta{
    float saldo, valor_apostado, risco;
    int escolha;
}
```
