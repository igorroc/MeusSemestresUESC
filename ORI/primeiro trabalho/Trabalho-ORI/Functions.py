import Utils

def defineTipoDeBusca(consulta):
  achouAnd = consulta.find(",")
  achouOr = consulta.find(";")

  if(achouAnd != -1):
    return "and"
  elif(achouOr != -1):
    return "or"

def acharResposta(conjunto, consulta, tipo):
  quantidade = 0
  arquivos = []

  # Verifica cada linha do conjunto e abre os seus respectivos arquivos
  for linha in conjunto.splitlines():
    linha = linha.rstrip()
    arquivo = open(linha, "r")
    texto = str(arquivo.read()).strip()

    achouPalavras = 0
    for palavra in consulta:
      if(palavra in texto):
        achouPalavras += 1

    # Verifica o tipo de consulta e o seu respectivo parametro
    if(tipo == "and" and achouPalavras == len(consulta)):
      quantidade += 1
      arquivos.append(linha)
    elif(tipo == "or" and achouPalavras > 0):
      quantidade += 1
      arquivos.append(linha)

    arquivo.close()

  # Retorna da maneira expecificada
  return str(quantidade)+"\n"+"\n".join(arquivos)


    
def acharIndice(conjunto, desconsiderados):
  indexArquivo = 1
  listaPalavras = []
  qtdFiles = len(conjunto.splitlines())

  # Verifica cada linha do conjunto e abre os seus respectivos arquivos
  for linha in conjunto.splitlines():
    linha = linha.rstrip()
    arquivo = open(linha, "r")
    texto = Utils.clearText(str(arquivo.read())).split()
    
    for palavra in texto:
      # Verifica se a palavra não está nas palavras desconsideradas
      if(palavra not in desconsiderados):
        # Pega o index da palavra na lista
        index = Utils.contains(listaPalavras, lambda x: x.palavra == palavra)
        if index != -1: # Caso já exista essa palavra na lista, incrementa o seu valor
          listaPalavras[index].addIndex(indexArquivo-1)
        else: # Caso a palavra ainda não esteja na lista, appenda ela
          p = Word(palavra, indexArquivo-1, qtdFiles)
          listaPalavras.append(p)

    arquivo.close()
    indexArquivo += 1

  # Ordena a lista pelo nome da palavra
  listaPalavras.sort(key=lambda x: x.palavra)

  indiceResposta = ""
  for obj in listaPalavras:
    index = 1
    string = ""

    # Coloca na string esperada
    for qtd in obj.quantity:
      if(qtd > 0):
        string += str(index)+","+str(qtd)+" "
      index += 1
    
    indiceResposta += (obj.palavra+": "+ string[:-1])+"\n"

  return indiceResposta[:-1]


class Word:
  palavra = ""
  quantity = []
  
  def __init__(self, name, index, qtdFiles):
    self.palavra = name
    self.quantity = [0] * qtdFiles
    self.quantity[index] += 1

  def addIndex(self, index):
    self.quantity[index] += 1
      
