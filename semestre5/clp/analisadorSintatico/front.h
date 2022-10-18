#ifndef FRONT_H
#define FRONT_H

/* Character classes */
#define LETTER 0
#define DIGIT 1
#define UNKNOWN 99

/* Token codes */
#define INT_LIT 10
#define IDENT 11
#define ASSIGN_OP 20
#define ADD_OP 21
#define SUB_OP 22
#define MULT_OP 23
#define DIV_OP 24
#define EQ_OP 25
#define LESS_OP 26
#define MORE_OP 50
#define LEFT_PAREN 27
#define RIGHT_PAREN 28
#define LEFT_BRACK 29
#define RIGHT_BRACK 30
#define PONTO_VIRGULA 31
#define REL_OPS 32
#define MAIN_KEYW 40
#define IF_KEYW 41
#define FOR_KEYW 42

int lex();

#endif
