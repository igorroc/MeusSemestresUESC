#include <stdio.h>
#include <stdlib.h>
#include "real.c"

void atv1(){

}

void atv2(){
   Real* num = real_create((float)5.67);

   Real* a = real_create(1.3), *b = real_create(3.7), *res;
   add(a, b, res);

}

int main(){
   atv2();
   return 0;
}
