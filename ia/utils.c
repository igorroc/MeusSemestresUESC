char numberToChar(int valor){
    return valor + '0';
}

int randomNumber(int min, int max){
    return (rand() % (max - min)) + min;
}

void colorRed() {
    printf("\x1b[31m");
}
void colorYellow() {
    printf("\x1b[33m");
}
void colorGreen() {
    printf("\x1b[32m");
}
void colorBlue() {
    printf("\x1b[34m");
}
void colorMagenta() {
    printf("\x1b[35m");
}
void colorCyan() {
    printf("\x1b[36m");
}
void colorReset() {
    printf("\x1b[0m");
}

void clearScreen(){
    system("@cls||clear");
}