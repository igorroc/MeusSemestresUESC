palavrasConsulta = [{}]
tipo = ""
with open('consulta.txt','r') as f:
    for line in f:
        palavras = line.split(";")

        if(len(palavras) > 1):
            palavrasConsulta = palavras
            tipo = "or"
        else:
            palavrasConsulta = line.split(",")
            tipo = "and"

print(palavrasConsulta)
print(tipo)

if (tipo == "or"):
    for(palavra in palavrasConsulta):
        for(w in words):
            if(palavra.value == w.value):
                for(f in w.occurences):
                    if(f.file not in occ):
                        occ.append(f.file);

arquivos = ["a.txt", "b.txt", "c.txt"]
occ = [1, 2, 3]

print(len(occ))
for oc in occ:
    print(arquivos[oc])

if (tipo == "and"):




