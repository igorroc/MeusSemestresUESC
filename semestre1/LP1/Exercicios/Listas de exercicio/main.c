#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <math.h>

int main()
{

// ================== ***LISTA 1*** ==================
// ------------------- EXERCICIO 1 -------------------
{ /*
    float x[2], y[2];
    for(int i = 0; i < 2; i++)
    {
        printf("Digite o valor da coordenada x%d:  ", i+1);
        scanf("%f", &x[i]);
        printf("Digite o valor da coordenada y%d:  ", i+1);
        scanf("%f", &y[i]);
        printf("\n\n");
    }
    float aux1 = pow(x[1] - x[0], 2);
    float aux2 = pow(y[1] - y[0], 2);
    printf("Aux 1 = %.2f, Aux 2 = %.2f\n\n", aux1, aux2);
    float d = sqrt(aux1 + aux2);

    printf("A distancia entre os pontos digitados e de: %.2f", d);
    getch();
    system("cls"); */
}
// ------------------- EXERCICIO 2 -------------------
{ /*
    int a, b, c;
    printf("Digite o valor de a: ");
    scanf("%d", &a);
    printf("Digite o valor de b: ");
    scanf("%d", &b);
    printf("Digite o valor de c: ");
    scanf("%d", &c);

    int r = (a+b)*(a+b);
    int s = (b+c)*(b+c);
    float D = (r+s)/2.0;
    printf("Valor de R = %d, S = %d\n\n", r, s);
    printf("O resultado da expressao (r+s)/2 = %.2f", D);
    getch();
    system("cls"); */
}
// ------------------- EXERCICIO 3 -------------------
{ /*
    int ano, mes, dia, diatot;
    printf("Digite sua idade em ano: ");
    scanf("%d", &ano);
    printf("Digite sua idade em mes: ");
    scanf("%d", &mes);
    printf("Digite sua idade em dia: ");
    scanf("%d", &dia);

    diatot = (ano*360) + (mes*30) + dia;

    printf("Sua idade apenas em dias = %d", diatot);
    getch();
    system("cls"); */
}
// ------------------- EXERCICIO 4 -------------------
{ /*
    int diatot;
    int ano, mes, dia;
    printf("Digite sua idade em dias:  ");
    scanf("%d", &diatot);

    mes = diatot/30;
    ano = mes/12;
    mes = mes%12;
    dia = diatot%30;

    printf("Sua idade em ano: %d\n", ano);
    printf("Sua idade em mes: %d\n", mes);
    printf("Sua idade em dia: %d", dia);
    getch();
    system("cls"); */
}
// ------------------- EXERCICIO 5 -------------------
{ /*
    float n1, n2, n3;
    printf("Digite a nota 1:  ");
    scanf("%f", &n1);
    printf("Digite a nota 2:  ");
    scanf("%f", &n2);
    printf("Digite a nota 3:  ");
    scanf("%f", &n3);

    float media = ((n1*2)+(n2*3)+(n3*5))/10;
    printf("\n\nSua media ponderada foi de:  %.2f", media);
    getch();
    system("cls"); */
}
// ------------------- EXERCICIO 6 -------------------
{ /*
    int tempo, hor, min, seg;
    printf("Digite o tempo em segundos:  ");
    scanf("%d", &tempo);
    min = tempo/60;
    seg = tempo%60;
    hor = min/60;
    min = min%60;

    printf("\n\nA conversao foi de: %dhor, %dmin, %dseg.", hor, min, seg);
    getch();
    system("cls"); */
}
// ------------------- EXERCICIO 7 -------------------
{ /*
    float custofab, custoconsu;
    printf("Digite o custo de fabrica do produto:  ");
    scanf("%f", &custofab);

    custoconsu = (custofab + custofab*0.28 + custofab*0.45);
    printf("O custo final e de:  %.2f", custoconsu);
    getch();
    system("cls"); */
}
// ------------------- EXERCICIO 8 -------------------
{ /*
    int a, b;
    printf("Digite o valor de a:  ");
    scanf("%d", &a);
    printf("Digite o valor de b:  ");
    scanf("%d", &b);

    if(a%b == 0)
        printf("Sao multiplos!");
    else
        printf("Nao sao multiplos");
    getch();
    system("cls"); */
}
// ------------------- EXERCICIO 9 -------------------
{ /*
    int a, b, c;
    printf("Digite o valor A:  ");
    scanf("%d", &a);
    printf("Digite o valor B:  ");
    scanf("%d", &b);
    printf("Digite o valor C:  ");
    scanf("%d", &c);

    if(a > b && a > c)
        printf("O valor A: %d, eh o maior!", a);
    else if(b > a && b > c)
        printf("O valor B: %d, eh o maior!", b);
    else if(c > a && c > b)
        printf("O valor C: %d, eh o maior!", c);
    else if(a == b && b > c)
        printf("Os valores A e B: %d e %d, sao iguais e maiores que o valor C: %d!", a, b, c);
    else if(a == c && c > b)
        printf("Os valores A e C: %d e %d, sao iguais e maiores que o valor B: %d!", a, c, b);
    else if(b == c && b > a)
        printf("Os valores B e C: %d e %d, sao iguais e maiores que o valor A: %d!", b, c, a);
    else
        printf("Os valores sao iguais");
    getch();
    system("cls"); */
}
// ------------------- EXERCICIO 10 -------------------
{ /*
    int codigo;
    float nota[3];
    float media;

    printf("Digite seu codigo:  ");
    scanf("%d", &codigo);


    for(int i = 0; i < 3; i++)
    {
        printf("Digite sua nota  %d:  ", i+1);
        scanf("%f", &nota[i]);
    }
    if(nota[0] > nota[1] && nota[0] > nota[2])
        media = (nota[0]*4 + nota[1]*3 + nota[2]*3)/10;
    else if(nota[1] > nota[0] && nota[1] > nota[2])
        media = (nota[1]*4 + nota[0]*3 + nota[2]*3)/10;
    else if(nota[2] > nota[1] && nota[2] > nota[0])
        media = (nota[2]*4 + nota[1]*3 + nota[0]*3)/10;
    else if(nota[0] == nota[1] && nota[0] > nota[2])
        media = (nota[0]*4 + nota[1]*3 + nota[2]*3)/10;
    else if(nota[1] == nota[2] && nota[1] > nota[0])
        media = (nota[1]*4 + nota[0]*3 + nota[2]*3)/10;
    else if(nota[0] == nota[2] && nota[0] > nota[1])
        media = (nota[0]*4 + nota[1]*3 + nota[2]*3)/10;
    else
        media = (nota[0]*4 + nota[1]*3 + nota[2]*3)/10;

    printf("\n\nSeu codigo: %d\nSua nota 1: %.2f\nSua nota 2: %.2f\nSua nota 3: %.2f\nSua media eh:  %.2f", codigo, nota[0], nota[1], nota[2], media);
    if(media >= 5)
        printf("\nAPROVADO!");
    else
        printf("\nREPROVADO!");
    getch();
    system("cls"); */




}


// ================== ***LISTA 2*** ==================
// ------------------- EXERCICIO 1 -------------------
{
    printf("Exercicio 1: \n");
    printf("um\n     dois\n          tres");
    getch();
    system("cls");
}
// ------------------- EXERCICIO 2 -------------------
{
    printf("Exercicio 2:\n");
    printf("a)\n");
    printf("* * * *\n* * * *\n* * * *\n* * * *");
    getch();
    system("cls");
    printf("Exercicio 2:\n");
    printf("b)\n");
    printf("*   \n* *  \n* * * \n* * * *");
    getch();
    system("cls");
    printf("Exercicio 2:\n");
    printf("c)\n");
    printf("    *    \n  * * *  \n* * * * *");
    getch();
    system("cls");
    printf("Exercicio 2:\n");
    printf("d)\n");
    printf("    *    \n  * * *  \n* * * * *\n  * * *  \n    *    ");
    getch();
    system("cls");
    printf("Exercicio 2:\n");
    printf("e)\n");
    printf("* * * *\n*     *\n*     *\n* * * *");
    getch();
    system("cls");
}
// ------------------- EXERCICIO 3 -------------------
{
    int x;
    printf("Exercicio 3:\n");
    printf("Digite um valor inteiro:  ");
    scanf("%d", &x);
    printf("Decimal: %d\nOctal: %o\nHexadecimal: %x", x, x, x);
    getch();
    system("cls");
}
// ------------------- EXERCICIO 4 -------------------
{
    int a, b;
    printf("Exercicio 4:\n");
    printf("Digite dois valores para serem trocados:\n");
    scanf("%d%d", &a, &b);
    a = a + b;
    b = a - b;
    a = a - b;
    printf("Os valores de a e b: %d e %d", a, b);
    getch();
    system("cls");
}
// ------------------- EXERCICIO 5 -------------------
{
    int a1, b1, c1, d1;
    printf("Exercicio 5\n");
    printf("Digite 4 valores:\n");
    scanf("%d%d%d%d", &a1, &b1, &c1, &d1);
    printf("O valor da expressao (a+b+c)*d = %d", (a1+b1+c1)*d1);
    getch();
    system("cls");
}
// ------------------- EXERCICIO 6 -------------------
{
    float n1, n2, n3, n4;
    float media;
    printf("Exercicio 6\n");
    printf("Digite suas 4 notas:\n");
    scanf("%f%f%f%f", &n1, &n2, &n3, &n4);
    media = (n1+n2+n3+n4)/4;
    printf("Sua media e igual a: %.2f", media);
    getch();
    system("cls");
}
// ------------------- EXERCICIO 7 -------------------
{
    int c, l;
    printf("Exercicio 7\n");
    printf("Digite o comprimento e a largura do retangulo:\n");
    scanf("%d%d", &c, &l);

    int area = c*l, peri = (2*c)+(2*l);
    printf("O perimetro do retangulo eh: %d metros\nA area do retangulo eh: %d metros quadrados", peri, area);
    getch();
    system("cls");
}
// ------------------- EXERCICIO 8 -------------------
{
    float real, dolar;
    printf("Exercicio 8\n");
    printf("Digite o valor em real:\n");
    scanf("%f", &real);
    dolar = real/3.75;
    printf("O valor convertido em dolares eh: %.2f", dolar);
    getch();
    system("cls");
}
// ------------------- EXERCICIO 9 -------------------
{
    float kilo, altura;
    float imc;
    printf("Exercicio 9\n");
    printf("Digite seu peso em kg: ");
    scanf("%f", &kilo);
    printf("Digite sua altura em m:  ");
    scanf("%f", &altura);

    imc = kilo/(altura*altura);

    printf("Seu IMC eh de: %.2f", imc);
    getch();
    system("cls");
}
// ------------------- EXERCICIO 10 ------------------
{
    int matri1, matri2, matri3;
    float n1[3], n2[3], n3[3];
    printf("Exercicio 10\n");

    // ALUNO 1
    printf("Digite sua matricula: ");
    scanf("%d", &matri1);
    for(int j = 0; j < 3; j++)
    {
        printf("Digite sua %d nota: ", j+1);
        scanf("%f", &n1[j]);
    }

    // ALUNO 2
    printf("\nDigite sua matricula: ");
    scanf("%d", &matri2);
    for(int j = 0; j < 3; j++)
    {
        printf("Digite sua %d nota: ", j+1);
        scanf("%f", &n2[j]);
    }

    // ALUNO 3
    printf("\nDigite sua matricula: ");
    scanf("%d", &matri3);
    for(int j = 0; j < 3; j++)
    {
        printf("Digite sua %d nota: ", j+1);
        scanf("%f", &n3[j]);
    }

    float media1, media2, media3;
    media1 = (n1[0]+n1[1]+n1[2])/3;
    media2 = (n2[0]+n2[1]+n2[2])/3;
    media3 = (n3[0]+n3[1]+n3[2])/3;

    system("cls");
    printf("MATRICULA\t\tNOTA1\tNOTA2\tNOTA3\tMEDIA\n");
    printf("======================================================\n");
    printf("%d\t\t\t%.2f\t%.2f\t%.2f\t%.2f\n", matri1, n1[0], n1[1], n1[2], media1);
    printf("%d\t\t\t%.2f\t%.2f\t%.2f\t%.2f\n", matri2, n2[0], n2[1], n2[2], media2);
    printf("%d\t\t\t%.2f\t%.2f\t%.2f\t%.2f\n", matri3, n3[0], n3[1], n3[2], media3);

    getch();
}
    return 0;
}
