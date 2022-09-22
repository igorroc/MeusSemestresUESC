#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>

            /**  **  **  **  **  **  **  **  **  **  **  **
            *                                             *
            *                                             *
            *          => PROJETO FEITO POR: <=           *
            *           --> FERNANDA LEITE <--            *
            *             --> IGOR ROCHA <--              *
            *                                             *
            *               => PROFESSOR <=               *
            *           --> HÉLDER ALMEIDA <--            *
            *                                             *
            *        * * * * * * * * * * * * * * *        *
            *        * PROGRAMA PARA ARMAZENAR E *        *
            *        *    CALCULAR CONTAS DE     *        *
            *        *      BAR/RESTAURANTE      *        *
            *        * * * * * * * * * * * * * * *        *
            *                                             *
            *       SERÁ NECESSARIO RODAR O PROGRAMA      *
            *         NO WINDOWS, DEVIDO A ALGUMAS        *
            *               FUNCIONALIDADES.              *
            *                                             *
            *                                             *
            *                  25/05/2019                 *
            *                                             *
            **  **  **  **  **  **  **  **  **  **  **  **/


void primeiraInstrucao(); // FUNÇÃO PARA APARECER AS PRIMEIRAS INSTRUÇÕES DO PROGRAMA
void printMenu(); // FUNÇÃO PARA MOSTRAR O MENU PRINCIPAL
void printCardapio(); // FUNÇÃO PARA MOSTRAR O CARDÁPIO
void addPedido(FILE*); // FUNÇÃO PARA FAZER O PEDIDO
void showConta(FILE*); // FUNÇÃO PARA MOSTRAR OS PEDIDOS JA FEITOS
void finishConta(FILE*); // FUNÇÃO PARA MOSTRAR QUANTO CADA UM VAI PAGAR
void closeConta(FILE*); // FUNÇÃO PARA ZERAR A CONTA ATUAL
void showInfo(); // FUNÇÃO QUE MOSTRA AS INFORMAÇÕES E O TUTORIAL DO PROGRAMA
float somarConta(int, int); // FUNÇÃO QUE TEM OS PREÇOS DOS ITENS
char* minusculo(char*); // FUNÇÃO PARA DEIXAR A PRIMEIRA LETRA DO NOME EM MAIÚSCULO E O RESTO EM MINÚSCULO
char* nomeComposto(char*); // FUNÇÃO PARA JUNTAR UM NOME COMPOSTO

int main() // MAIN
{
    system("mode con:cols=41 lines=35");
    // DEIXA O CONSOLE QUE RODA O PROGRAMA FORMATADO EM 41 COLUNAS E 35 LINHAS

    primeiraInstrucao();

    FILE *conta = fopen("conta.txt", "r+");
    // ARQUIVO ONDE SERÁ SALVO A CONTA DO CLIENTE

    if(conta == NULL)
    {
        printf("Erro na abertura do arquivo!");
        return 1;
    }
    int respuser = 1;
    // RESPOSTA DO USUÁRIO NO MENU

    while(respuser != 0)
    {
        printMenu();
        scanf("%d", &respuser);
        while(respuser > 6 || respuser < 0) // VALOR INVÁLIDO
        {
            printf("Digite um valor valido.");
            printf("\n  -> Digite o que voce deseja: ");
            scanf("%d", &respuser);
        }
        switch(respuser)
        {
            case 0:
                // SAIR DO PROGRAMA
                break;

            case 1:
                // MOSTRAR CARDÁPIO
                printCardapio();
                printf("\n  [ Tecle 'enter' para voltar ao menu ]");
                setbuf(stdin, NULL);
                getchar();
                break;

            case 2:
                // FAZER PEDIDO
                addPedido(conta);
                break;

            case 3:
                // MOSTRAR TODOS OS PEDIDOS JÁ FEITOS
                showConta(conta);
                break;

            case 4:
                // MOSTRAR QUANTO CADA UM VAI PAGAR
                finishConta(conta);
                break;

            case 5:
                // ZERAR CONTA ATUAL
                closeConta(conta);
                FILE* conta = fopen("conta.txt", "w");
                getchar();
                break;

            case 6:
                // INFORMAÇÕES DO PROGRAMA E TUTORIAL DE COMO USAR
                showInfo();
                break;
            default:
                // APENAS PARA NÃO DAR ERRO
                break;
        }
    }
    fclose(conta);
    printf("\tPrograma finalizado!\n");
    printf("\t  Arquivo fechado\n");
    return 0;
}

void primeiraInstrucao() // FUNÇÃO PARA APARECER AS PRIMEIRAS INSTRUÇÕES DO PROGRAMA
{
    printf("\tPara o funcionamento do programa,\n");
    printf("eh necessario criar um arquivo na mesma\n");
    printf("pasta do codigo chamado: \"conta.txt\"\n");
    printf("\tAlem disso, eh necessario da\n");
    printf("biblioteca \"windows.h\"\n");
    printf("\tApos criado, basta continuar a\n");
    printf("rodar o codigo e seguir o menu principal.\n");
    printf("\tPara mais informacoes, digite 6 \n");
    printf("no proximo menu.\n");
    printf("\n\n");
    printf("        [ PRESSIONE ENTER APOS ]\n");
    printf("        [ TER CRIADO O ARQUIVO ]\n\t\t");
    getchar();
    setbuf(stdin, NULL);
}

void printMenu() // FUNÇÃO PARA MOSTRAR O MENU PRINCIPAL
{
    system("cls");
    for(int i = 0; i < 41; i++)
    {
        printf("%c", 219);
    }
    // CARACTERE UTILIZADO PRA DEIXAR O PROGRAMA MAIS VISUAL
    printf("\n%c\t\t\t\t\t%c", 219, 219);
    printf("\n%c\t  Menu do Programa:\t\t%c\n", 219, 219);
    printf("%c\t1 - Mostrar Cardapio\t\t%c\n", 219, 219);
    printf("%c\t2 - Fazer Pedido\t\t%c\n", 219, 219);
    printf("%c\t3 - Mostrar seus Pedidos\t%c\n", 219, 219);
    printf("%c\t4 - Calcular Conta Total\t%c\n", 219, 219);
    printf("%c\t5 - Apagar conta anterior\t%c\n", 219, 219);
    printf("%c\t6 - Sobre o programa\t\t%c\n", 219, 219);
    printf("%c\t0 - Sair\t\t\t%c\n", 219, 219);
    printf("%c\t\t\t\t\t%c", 219, 219);
    for(int i = 0; i < 41; i++)
    {
        printf("%c", 219);
    }
    printf("\n  -> Digite o que voce deseja: ");
}

void printCardapio() // FUNÇÃO PARA MOSTRAR O CARDÁPIO
{
    system("cls");
    for(int i = 0; i < 41; i++)
    {
        printf("%c", 219);
    }
    printf("\n%c\t\t\t\t\t%c\n", 219, 219);
    printf("%c%4s%17s%16s  %c\n", 219, "ID", "Nome", "Valor", 219);
    printf("%c%5s%23s%10s %c\n", 219, "001", "Misto Quente", "R$  5,00", 219);
    printf("%c%5s%23s%10s %c\n", 219, "002", "Hamburger", "R$  6,00", 219);
    printf("%c%5s%23s%10s %c\n", 219, "003", "X-Salada", "R$  7,00", 219);
    printf("%c%5s%23s%10s %c\n", 219, "004", "X-Burguer", "R$  9,00", 219);
    printf("%c%5s%23s%10s %c\n", 219, "005", "X-Egg", "R$  9,50", 219);
    printf("%c%5s%23s%10s %c\n", 219, "006", "X-Egg Bacon", "R$ 11,99", 219);
    printf("%c%5s%23s%10s %c\n", 219, "007", "X-Frango", "R$  9,99", 219);
    printf("%c%5s%23s%10s %c\n", 219, "008", "X-Bacon", "R$ 10,00", 219);
    printf("%c%5s%23s%10s %c\n", 219, "009", "X-Tudo", "R$ 15,00", 219);
    printf("%c%5s%23s%10s %c\n", 219, "010", "Acai (500 ml)", "R$ 16,00", 219);
    printf("%c%5s%23s%10s %c\n", 219, "011", "Fritas (300 g)", "R$ 19,99", 219);
    printf("%c%5s%23s%10s %c\n", 219, "012", "Refrigerante(350 ml)", "R$  3,50", 219);
    printf("%c%5s%23s%10s %c\n", 219, "013", "Refrigerante(1 litro)", "R$  8,00", 219);
    printf("%c%5s%23s%10s %c\n", 219, "014", "Cerveja (350 ml)", "R$  3,39", 219);
    printf("%c%5s%23s%10s %c\n", 219, "015", "Agua Mineral (500 ml)", "R$  2,00", 219);
    printf("%c\t\t\t\t\t%c", 219, 219);
    printf("\n");
    for(int i = 0; i < 41; i++)
    {
        printf("%c", 219);
    }

}

void addPedido(FILE* conta) // FUNÇÃO PARA FAZER O PEDIDO
{
    int pedido, quant;
    // PEDIDO = CÓDIGO DO PRODUTO, QUANT = QUANTIDADE DE ITENS

    char nome[20] = { '\0' };
    // NOME = NOME DA PESSOA QUE FEZ O PEDIDO

    printCardapio();
    while(strcmp(nome, "n"))
    {
        printf("  -> Digite o codigo do item: ");
        scanf("%d", &pedido);
        setbuf(stdin, NULL);
        if(pedido == 0) // FLAG PARA SAIR DA ABA DE PEDIDOS E VOLTAR AO MENU INICIAL
        {
            break;
        }
        while(pedido > 15 || pedido < 0) // TESTE PARA VER SE A PESSOA DIGITOU UM CÓDIGO QUE EXISTE
        {
            printf("Nao existe esse item no cardapio,\ndigite outro codigo: ");
            scanf("%d", &pedido);
            setbuf(stdin, NULL);
        }
        printf("  -> Digite a quantidade: ");
        scanf("%d", &quant);
        setbuf(stdin, NULL);
        while(quant < 1) // TESTE PARA UMA QUANTIDADE INVÁLIDA
        {
            printf("  -> Digite um valor valido: ");
            scanf("%d", &quant);
            setbuf(stdin, NULL);
        }
        printf("  -> Digite o nome do participante (menos de 20 letras): ");
        scanf("%20[^\n]", &nome);
        setbuf(stdin, NULL);
        *nome = minusculo(nome);
        *nome = nomeComposto(nome);
        // UTILIZANDO A FUNÇÃO QUE DEIXA TODAS AS LETRAS EM MINÚSCULO, EXCETO A PRIMEIRA

        fprintf(conta, "%s ", nome);
        fprintf(conta, "%d %d ", pedido, quant);
        fprintf(conta, "\n");
        printf("  -> Deseja fazer outro pedido?\n");
        printf("    ( Digite \"n\" para sair, tecle )\n");
        printf("    (     enter para continuar    )\n\t\t");
        scanf("%20[^\n]", &nome);
        setbuf(stdin, NULL);
    }
}

void showConta(FILE* conta) // FUNÇÃO PARA MOSTRAR OS PEDIDOS JA FEITOS
{
    char nome[20] = { '\0' };
    // NOME = NOME DO PARTICIPANTE QUE IRÁ APARECER NA TELA

    int quant, codigo;
    // QUANT = QUANTIDADE, CODIGO = CÓDIGO

    fclose(conta);
    fopen("conta.txt", "r+");
    // FIZEMOS ISSO POIS SE A GENTE RODASSE O CÓDIGO SEM ISSO,
    // ELE NÃO CONSEGUIRIA PEGAR AS INFORMAÇÕES ATUALIZADAS

    char conta_cliente = fscanf(conta, "%s %d %d", &nome, &codigo, &quant);
    // LÊ AS INFORMAÇÕES DO ARQUIVO

    int i = 0;

    printf("\n\n-------------- [ PEDIDOS ] --------------\n\n");
    if(conta_cliente == EOF)
    {
        printf("       Nenhum pedido feito ainda,\n");
        printf("\t     volte ao menu.\n");
        printf("\n-- [ TECLE 'ENTER' PARA CONTINUAR... ] --");
        setbuf(stdin, NULL);
        getchar();
        setbuf(stdin, NULL);
    }
    else
    {
        while(conta_cliente != EOF) // TESTE PARA VER SE CHEGOU AO FIM
        {
            i++;
            printf("\n\t\tPedido %d:\n", i);
            printf("\n\tCodigo do produto: %d", codigo);
            printf("\n\tQuantidade: %d", quant);
            printf("\n\tParticipante: %s", nome);
            printf("\n\n\n------------ [ TECLE ENTER ] ------------\n");
            setbuf(stdin, NULL);
            getchar();
            conta_cliente = fscanf(conta, "%s %d %d", &nome, &codigo, &quant);
            // LÊ AS INFORMAÇÕES DO ARQUIVO
        }
        printf("\n-------------- FIM DA CONTA -------------");
        printf("\n-- [ TECLE 'ENTER' PARA CONTINUAR... ] --");
        setbuf(stdin, NULL);
        getchar();
        setbuf(stdin, NULL);
    }
}

void finishConta(FILE* conta) // FUNÇÃO PARA MOSTRAR QUANTO CADA UM VAI PAGAR
{
    fclose(conta);
    fopen("conta.txt", "r+");
    // NOVAMENTE, PEGA AS INFORMAÇÕES ATUALIZADAS

    char nome[20][20] = { '\0' };
    // MATRIZ PARA SALVAR TODOS OS PARTICIPANTES

    char aux[20] = { '\0' };
    // STRING QUE PEGA OS NOMES DO ARQUIVO

    float contaf[20] = { 0 };
    // VETOR QUE TERÁ TODOS OS VALORES FINAIS DA CONTA,
    // PARA CADA PARTICIPANTE

    char vazio[20] = { '\0' };
    // TIVEMOS QUE CRIAR ESSA STRING VAZIA PARA PODER TESTAR COM
    // AS CASAS DA MATRIZ NOME, E VER SE ELA ESTÁ VAZIA TAMBÉM

    int codigo, quant;

    int z = 0;
    while(fscanf(conta, "%s %d %d", &aux, &codigo, &quant) != EOF) // PEGA OS VALORES DO ARQUIVO
    {
        for(int i = 0; i < 20; i++)
        {
            if(!strcmp(nome[i], vazio)) // COMPARA SE A MATRIZ ESTÁ VAZIA, SE SIM:
            {
                strcpy(nome[i], aux); // SALVA O NOME "AUX" DENTRO DA MATRIZ
                contaf[i] = somarConta(codigo, quant); // CALCULA O VALOR PARA AQUELA PESSOA
                break;
            }
            else if(!strcmp(nome[i], aux)) // COMPARA SE O NOME NA MATRIZ É O MESMO QUE ESTÁ SENDO LIDO, SE SIM:
            {
                contaf[i] += somarConta(codigo, quant); // JÁ QUE É O MESMO NOME, VAI SOMAR À CONTA DAQUELA PESSOA
                break;
            }
        }
        z++;
        for(int k = 0; k < 20; k++) // ZERA A STRING QUE PEGA OS NOMES DO ARQUIVO
            aux[k] = 0;
    }
    printf("\n\n-------------- [ CONTA ] ----------------\n\n");
    if(nome[0][0] == '\0') // SE A MATRIZ NOME ESTIVER VAZIA, SIGNIFICA QUE ELE NÃO LEU NADA NO ARQUIVO, OU SEJA:
    {
        printf("\tNenhum pedido feito ainda,\n");
        printf("\t      volte ao menu.\n");
    }
    else
    {
        for(int i = 0; i < 20; i++)
        {
            if(strcmp(nome[i], vazio))
                printf("%17s === R$ %.2f\n", nome[i], contaf[i]); // MOSTRA O NOME E O VALOR QUE AQUELA PESSOA VAI PAGAR
        }
    }

    printf("\n-- [ TECLE 'ENTER' PARA CONTINUAR... ] --");
    setbuf(stdin, NULL);
    getchar();

}

void closeConta(FILE* conta) // FUNÇÃO PARA ZERAR A CONTA ATUAL
{
    fclose(conta);
    remove("conta.txt");
    printf("\n\t        Apagado!");
    printf("\n\t   [Pressione enter]");
    getchar();
}

void showInfo() // FUNÇÃO QUE APARECE AS INFORMAÇÕES E O TUTORIAL DO PROGRAMA
{
    system("cls");
    setbuf(stdin, NULL);
    for(int i = 0; i < 41; i++)
    {
        printf("%c", 219);
    }
    printf("\n%c\t\t\t\t\t%c", 219, 219);
    printf("\n%c\t -> Programa criado por:        %c", 219, 219);
    printf("\n%c      \\\\ Fernanda Leite                %c", 219, 219);
    printf("\n%c      \\\\ Igor Rocha                    %c", 219, 219);
    printf("\n%c\t\t\t\t\t%c", 219, 219);
    printf("\n%c\t -> Orientador:                 %c", 219, 219);
    printf("\n%c      \\\\ Helder Conceicao Almeida      %c", 219, 219);
    printf("\n%c\t\t\t\t\t%c", 219, 219);
    printf("\n%c\t -> Tutorial:                   %c", 219, 219);
    printf("\n%c      1\\ Ao clicar nessa opcao, voce   %c", 219, 219);
    printf("\n%c     tera acesso a todo o cardapio,    %c", 219, 219);
    printf("\n%c     com o preco, nome e codigo de     %c", 219, 219);
    printf("\n%c     cada.                             %c", 219, 219);
    printf("\n%c      2\\ Para fazer um pedido, voce    %c", 219, 219);
    printf("\n%c     deve digitar o codigo do          %c", 219, 219);
    printf("\n%c     pedido, informar a quantidade,    %c", 219, 219);
    printf("\n%c     e digitar o nome de quem quer     %c", 219, 219);
    printf("\n%c     esse pedido.                      %c", 219, 219);
    printf("\n%c     OBS: Voce pode digitar 0 no       %c", 219, 219);
    printf("\n%c     codigo do produto para cancelar.  %c", 219, 219);
    printf("\n%c      3\\ Nessa opcao, voce pode ver    %c", 219, 219);
    printf("\n%c     todos os pedidos ja feitos.       %c", 219, 219);
    printf("\n%c      4\\ Aqui sera dividido todo o     %c", 219, 219);
    printf("\n%c     preco final da conta, para todos  %c", 219, 219);
    printf("\n%c     os participantes.                 %c", 219, 219);
    printf("\n%c      5\\ Opcao para limpar todo o      %c", 219, 219);
    printf("\n%c     arquivo anterior. Nao sera        %c", 219, 219);
    printf("\n%c     necessario criar o arquivo        %c", 219, 219);
    printf("\n%c     novamente.                        %c", 219, 219);
    printf("\n%c      6\\ Voce esta aqui!               %c", 219, 219);
    printf("\n%c      0\\ Fechar o programa.            %c", 219, 219);
    printf("\n%c\t\t\t\t\t%c", 219, 219);
    printf("\n%c  [ TECLE ENTER PARA VOLTAR AO MENU ]  %c", 219, 219);
    for(int i = 0; i < 41; i++)
    {
        printf("%c", 219);
    }

    getchar();
    setbuf(stdin, NULL);
}

float somarConta(int cod, int quant) // FUNÇÃO QUE TEM OS PREÇOS DOS ITENS
{
    float tot;
    switch (cod) // CALCULA O TOTAL DAQUELE PEDIDO EM RELAÇÃO AO SEU CÓDIGO E A QUANTIDADE
    {
        case 1:
            tot = quant*5;
            break;
        case 2:
            tot = quant*6;
            break;
        case 3:
            tot = quant*7;
            break;
        case 4:
            tot = quant*9;
            break;
        case 5:
            tot = quant*9.5;
            break;
        case 6:
            tot = quant*11.99;
            break;
        case 7:
            tot = quant*9.99;
            break;
        case 8:
            tot = quant*10;
            break;
        case 9:
            tot = quant*15;
            break;
        case 10:
            tot = quant*16;
            break;
        case 11:
            tot = quant*19.99;
            break;
        case 12:
            tot = quant*3.5;
            break;
        case 13:
            tot = quant*8;
            break;
        case 14:
            tot = quant*3.39;
            break;
        case 15:
            tot = quant*2;
            break;
    }
    return tot;
}

char *minusculo(char* frase) // FUNÇÃO PARA DEIXAR A PRIMEIRA LETRA DO NOME EM MAIUSCULO E O RESTO EM MINUSCULO
{
    if(frase[0] >= 'a' && frase[0] <= 'z') // MUDA A PRIMEIRA LETRA PARA MAIÚSCULA
    {
        frase[0] -= 32;
    }

    for(int i = 1; i < 19; i++) // MUDA AS LETRAS SUBSEQUENTES PARA MINÚSCULA
    {
        if(frase[i] >= 'A' && frase[i] <= 'Z')
        {
            frase[i] += 32;
        }
    }
    return *frase;
}

char* nomeComposto(char* nome) // FUNÇÃO PARA JUNTAR UM NOME COMPOSTO
{
    for (int i = 0; nome[i]; i++)
    {
        if(nome[i] == ' ') // TESTA SE O CARACTERE É UM ESPAÇO. SE FOR:
        {
            if(nome[i+1] >= 'a' && nome[i+1] <= 'z') // TESTA SE A LETRA DEPOIS DO ESPAÇO É MINÚSCULA, SE SIM, MUDA PARA MAIÚSCULA E COLOCA NO LUGAR DO ESPAÇO
            {
                nome[i] = nome[i+1] - 32;
            }
            else // SE NÃO, APENAS MUDA DE LUGAR COM O ESPAÇO
            {
                nome[i] = nome[i+1];
            }
            for(int j = i+1; nome[j]; j++) // PUXA TODAS AS LETRAS SUBSEQUENTES UMA CASA PARA TRÁS
            {
                nome[j] = nome[j+1];
            }
        }
    }
    return *nome;
}

