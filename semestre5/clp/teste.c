#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv){
    for(int i = 0; argv[i]; i++){
        printf("%s\n", argv[i]);
    }
    printf("%d", argc);
    return 0;
}