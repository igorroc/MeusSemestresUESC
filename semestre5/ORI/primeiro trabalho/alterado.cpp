#include <iostream>
#include<fstream>
#include<stdlib.h>
#include <cstring>
#include <vector>
#include <algorithm>

using namespace std;


Word palavra1 = new Word();
Word palavra2 = new Word();

class Word
{
    public:
    int frequency;     
    string value;
    vector<pair<int, int>> frequencyList; // fileNumber - quantity

    // casa: [{1,2}]
    // amor: [{1,2}]

    Word(string s, int fileNumber)
    {
        value = s;
        frequencyList.push_back(make_pair(fileNumber, 0)); // fileNumber - quantity
        frequency = 0;
    }

    bool operator>(const Word& w)
    {
        return this->frequency < w.frequency; 
    }

    bool operator<(const Word& w)
    {
        return this->frequency > w.frequency; 
    }

    void insertCase(int fileNumber)
    {
        frequency++;
        for (auto&& f :  frequencyList)
        {        
            if (f.first == fileNumber)
            {
                f.second += 1;
                return;
            }
        }    
        frequencyList.push_back(make_pair(fileNumber, 1));    // fileNumber - quantity
    }

    void printVector()
    {        
        cout << value << ":  ";        

        for (auto&& f :  frequencyList)
        {
            cout << f.first << ", " << f.second << "  "; // fileNumber - quantity
        }
        cout << endl;        
    }
};

Word *findWord(vector<Word> *w, string word, int fileNumber)
{
    for (auto&& f : *w)
    {        
        if (f.value == word)
        {         
            return &f;
        }
    }
    w->push_back(Word(word, fileNumber));
    return &w->back(); 
}

bool isStopWord(vector<string> stopWords, string word)
{
    for (auto&& f : stopWords)
    {        
        if (f == word)
        {
            return true;
        }
    }
    return false;
}

// void readFile(vector<string> *stopWords, char *file)
// {
//     ifstream fp;  
//     fp.open(file);

//     string word;

//     while(fp >> word)
//     {
//         stopWords->push_back(word);
//     }
//     fp.close();
// }

void readFile(vector<Word> *w, char* file, int fileNumber, vector<string> stopWords)
{
    ifstream fp;   
    
    fp.open(file);
    string word;

    while(fp >> word)
    {        
        word = strtok(&word[0], ".-,!?_:");
        if (!isStopWord(stopWords, word))
        {
            findWord(w, word, fileNumber)->insertCase(fileNumber);
        }
    }

    fp.close();
}

void readFile(char *fileName, vector<Word> *w, vector<string> stopWords)
{
    vector<string> paths;

    ifstream fp;
    string buffer;
    int i = 1;

    fp.open(fileName);

    while(fp >> buffer)
    {
        paths.push_back(buffer);
    }

    for (auto&& f : paths)
    {   
        readFile(w, &f[0], i, stopWords);
        i++;        
    }
}

void writeFileIndex(vector<Word> w)
{
    ofstream fp;
    fp.open ("output.txt", std::ofstream::out);

    sort(w.begin(), w.end());

    for (auto&& f : w)
    {   
        fp << f.value << ":  ";        

        for (auto&& g :  f.frequencyList)
        {
            fp << g.first << ", " << g.second << "  "; // fileNumber - quantity
        }
        fp << "\r\n";                    
    }
}

void funcaoLerArquivoConsulta(string arquivo, vector<string> palavras, bool tipo)
{
    with open('consulta.txt','r') as f:
        for line in f:
            for word in line.split(";"):
                print(word) 
            for word in line.split(","):
                print(word)     
}

int main(int argc, char *argv[])
{    
    if (argc != 4)
    {
        cout << "\nERROR: Invalid number of parameters! \n" << endl;
        return 0;
    }

    vector<Word> words;
    vector<string> stopWords;

    vector<string> palavrasConsulta;
    bool tipoConsulta;

    readFile(&stopWords, argv[2]);

    readFile(argv[1], &words, stopWords);

    funcaoLerArquivoConsulta(argv[3], &palavrasConsulta, &tipoConsulta);

    writeFileIndex(words);   

    return 0;
}