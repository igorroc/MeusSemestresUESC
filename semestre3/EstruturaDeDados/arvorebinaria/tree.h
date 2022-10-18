#ifndef TREE_H
#define TREE_H

#include "node.h"

NODE* maketree();

void setright(NODE*, int, int);

void setleft(NODE*, int, int);

int info(NODE*);

NODE* right(NODE*);

NODE* left(NODE*);

NODE* father(NODE*);

void showTree(NODE*);

#endif // TREE_H