#ifndef PARSER_H
#define PARSER_H


void program();
void expr();
void term();
void factor();
void atr();
void logic_expr();
void Y();
void stmt();
void stmts();
void var();
void if_stmt();
void for_stmt();


extern int nextToken;
extern char nextChar;
#endif
