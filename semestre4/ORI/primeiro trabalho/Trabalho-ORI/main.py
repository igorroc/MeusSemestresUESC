# ▮▮▮▮▮▮▮▮▮▮▮▮▮▮▮
# ▮                       ▮
# ▮   Trabalho de ORI     ▮
# ▮                       ▮
# ▮      Professor:       ▮
# ▮       - Elinaldo      ▮
# ▮      Discentes:       ▮
# ▮       - Igor          ▮
# ▮       - Isaac         ▮
# ▮       - Maira         ▮
# ▮       - Marcus        ▮
# ▮                       ▮
# ▮▮▮▮▮▮▮▮▮▮▮▮▮▮▮

# OBS: O programa automaticamente abre os arquivos "conjunto.txt",
# "desconsideradas.txt" e "consulta.txt"

# Link para o replit, pra uma maior facilidade de execução
# do programa: https://replit.com/join/qoseswqmem-igorroc

import Functions

# Abre os arquivos necessários
conjunto = open("conjunto.txt", "r").read()
desconsideradas = open("desconsideradas.txt", "r").read()
consulta = open("consulta.txt", "r").read()

# Separa por linha e coloca numa lista
palavrasDesconsideradas = desconsideradas.splitlines()

# Verifica se vai ser busca tipo "and" ou tipo "or"
tipoDeBusca = Functions.defineTipoDeBusca(consulta)

# Separa as palavras da consulta, ignorando o separador
palavrasConsultadas = consulta.replace(';', ',').split(',')

indice = Functions.acharIndice(conjunto, palavrasDesconsideradas)

f = open("indice.txt", "w")
f.write(indice)
f.close()

resposta = Functions.acharResposta(conjunto, palavrasConsultadas, tipoDeBusca)

f = open("resposta.txt", "w")
f.write(resposta)
f.close()