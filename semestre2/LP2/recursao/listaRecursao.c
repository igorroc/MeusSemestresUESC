int digito_magico(int x) {
    int soma = 0;
    if (x > 9) {
        while (x > 9) {
            soma += x % 10;
            x /= 10;
        }
        soma += x;
        return digito_magico(soma);
    } else {
        return x;
    }
}

int triangulo_de_blocos(int x) {
    if (x == 0) {
        return 0;
    } else {
        return x + triangulo_de_blocos(x - 1);
    }
}