#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include "front.h"
#include "parser.h"

/* Global Variable */
int nextToken;
char nextChar;
/* Local Variables */
static int charClass;
static char lexeme [100];
static int lexLen;
static FILE *in_fp;
static char mainKW[]="main";
static char ifKW[]="if";
static char forKW[]="for";

/* Local Function declarations */
static void addChar();
static void getChar();
static void getNonBlank();

int main() 
{
    /* Open the input data file and process its contents */
    if ((in_fp = fopen("front-in.txt", "r")) == NULL) {
        printf("ERROR - cannot open front.in \n");
    } else {
        getChar();
        do {
            lex();
            program();
        } while (nextToken != EOF);
    }

    return 0;
}
/*****************************************************/
/* lookup - a function to lookup operators and parentheses and return the 
 * token */
static int lookup(char ch) {
    switch (ch) {
        case '(':
            addChar();
            nextToken = LEFT_PAREN;
            break;
        case ')':
            addChar();
            nextToken = RIGHT_PAREN;
            break;
        case '+':
            addChar();
            nextToken = ADD_OP;
            break;
        case '-':
            addChar();
            nextToken = SUB_OP;
            break;
        case '*':
            addChar();
            nextToken = MULT_OP;
            break;
        case '/':
            addChar();
            nextToken = DIV_OP;
            break;
        case '{':
        	addChar();
        	nextToken = LEFT_BRACK;
        	break;
        case '}':
        	addChar();
        	nextToken=	RIGHT_BRACK;
        	break;
        case ';':
        	addChar();
        	nextToken = PONTO_VIRGULA;
        	break;
        case '=':
            addChar();
            nextToken = EQ_OP;
            break;
        case '&':
            addChar();
            nextToken = REL_OPS;
            break;
        case '!':
            addChar();
            nextToken = REL_OPS;
            break;
        case '<':
            addChar();
            nextToken = LESS_OP;
            break;
        case '>':
            addChar();
            nextToken = REL_OPS;
            break;
        default:
            addChar();
            nextToken = EOF;
            break;
    }
    return nextToken;
}

/*****************************************************/
/* addChar - a function to add nextChar to lexeme */
static void addChar() {
    if (lexLen <= 98) {
        lexeme[lexLen++] = nextChar;
        lexeme[lexLen] = 0;
    } else {
        printf("Error - lexeme is too long \n");
    }
}

/*****************************************************/
/* getChar - a function to get the next character of input and determine its 
 * character class */
static void getChar() {
    if ((nextChar = getc(in_fp)) != EOF) {
        if (isalpha(nextChar))
            charClass = LETTER;
        else if (isdigit(nextChar))
            charClass = DIGIT;
        else charClass = UNKNOWN;
    } else {
        charClass = EOF;
    }
}

/*****************************************************/
/* getNonBlank - a function to call getChar until it returns a non-whitespace 
 * character */
static void getNonBlank() {
    while (isspace(nextChar)) getChar();
}

/*****************************************************/
/* lex - a simple lexical analyzer for arithmetic expressions */
int lex() {
    lexLen = 0;
    getNonBlank();

    switch (charClass) {
        /* Parse identifiers */
        case LETTER:
            addChar();
            getChar();
            while (charClass == LETTER || charClass == DIGIT) {
                addChar();
                getChar();
            }
            nextToken = IDENT;
            if(strcmp(mainKW,lexeme)==0){
            	nextToken = MAIN_KEYW;
            }
            else if(strcmp(ifKW,lexeme)==0){
            	nextToken = IF_KEYW;

            }
            else if(strcmp(forKW,lexeme)==0){
            	nextToken = FOR_KEYW;
            }
            break;

        /* Parse integer literals */
        case DIGIT:
            addChar();
            getChar();
            while (charClass == DIGIT) {
                addChar();
                getChar();
            }
            nextToken = INT_LIT;
            break;

        /* Parentheses and operators */
        case UNKNOWN:
            lookup(nextChar);
            getChar();
            break;

        /* EOF */
        case EOF:
            nextToken = EOF;
            lexeme[0] = 'E';
            lexeme[1] = 'O';
            lexeme[2] = 'F';
            lexeme[3] = 0;
            break;
    } /* End of switch */

    printf("Next token is: %d, Next lexeme is %s\n", nextToken, lexeme);
    return nextToken;
} /* End of function lex */
