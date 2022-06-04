#include <bits/stdc++.h>

using namespace std;

#define QTD_CASES 10

vector<string> cidades = {"Salvador", "Ilheus", "Itabuna"};
vector<string> tamanhos = {"Pequena", "Media", "Grande"};

class Case {
   public:
    string local;
    string tamCozinha;
    int quartos;
    int qtdArCondicionado;
    int preco;
    int foiVendido;
};

int randBetween(int start, int end) {
    return start + (rand() % end);
}

int randBool() {
    return randBetween(0, 2);
}

vector<Case> generateCases(int qtd) {
    vector<Case> casos(qtd);
    for (int i = 0; i < qtd; i++) {
        casos[i].local = cidades[randBetween(0, 2)];
        casos[i].tamCozinha = tamanhos[randBetween(0, 2)];
        casos[i].quartos = randBetween(1, 10);
        casos[i].qtdArCondicionado = randBetween(0, 3);
        casos[i].preco = randBetween(1000, 999999);
        casos[i].foiVendido = randBool();
    }
    return casos;
}

void showCases(vector<Case> casos) {
    int length = casos.size();

    for (int i = 0; i < length; i++) {
        cout << "Casa " << i + 1 << ":" << endl;
        cout << "\tLocal: " << casos[i].local << endl;
        cout << "\tQuartos: " << casos[i].quartos << endl;
        cout << "\tAr Condicionado: " << casos[i].qtdArCondicionado << endl;
        cout << "\tTamanho Cozinha: " << casos[i].tamCozinha << endl;
        cout << "\tPreco: " << casos[i].preco << endl;
        cout << "\tVendido: " << casos[i].foiVendido << endl;
    }
}

string concatenate(vector<Case> casos) {
    int length = casos.size();
    string txt;

    txt += "id,";
    txt += "local,";
    txt += "quartos,";
    txt += "tamCozinha,";
    txt += "qtdArCondicionado,";
    txt += "preco,";
    txt += "foiVendido\n";
    for (int i = 0; i < length; i++) {
        txt += to_string(i) + ",";
        txt += casos[i].local + ",";
        txt += to_string(casos[i].quartos) + ",";
        txt += casos[i].tamCozinha + ",";
        txt += to_string(casos[i].qtdArCondicionado) + ",";
        txt += to_string(casos[i].preco) + ",";
        txt += to_string(casos[i].foiVendido) + "\n";
    }

    return txt;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    srand((unsigned)time(NULL));

    vector<Case> casos(QTD_CASES);
    casos = generateCases(QTD_CASES);

    ofstream file;
    file.open("cases.txt");
    file << concatenate(casos);

    showCases(casos);

    file.close();
}