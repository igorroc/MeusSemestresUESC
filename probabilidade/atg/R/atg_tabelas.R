#. Probabilidade e Estatistica - Ciencia da Computação 2019.1
#.. Tema: Apresentação Tabulares e gráficas
#.. Professor: José Claudio Faria
#.. Grupo: Luís Carlos e Mateus Reis

# Exemplo do slide:
# Em um hospital foram contabilizados o número de pessoas com diabetes
# em 20 grupos de 1000 pessoas cada. Neste caso, obtemos os seguintes
# dados: 10, 12, 9, 11, 10, 8, 9, 10, 7, 10, 8, 9, 9, 10, 10, 11, 9, 11, 10,10

# Criando vetor com os dados obtidos e em seguida
# mostra os dados
dados <- c(10, 12, 9, 11, 10,  8, 9, 10,  7, 10,
            8,  9, 9, 10, 10, 11, 9, 11, 10, 10)
dados

# Ver resumo dos dados obtidos
summary(dados)

#. Opção gradual
# Conta a frequencia de ocorrencia de determinado dado e
# mostra os dados em seguida
freq <- table(dados)
freq

# Soma das frequencias
somaFreq <- sum(freq)
somaFreq

# Conta a frequencia relativa dos dados e mostra os dados
freq_relativa <- prop.table(freq)
freq_relativa

# Frequencia percentual dos dados, mostando-os em seguida
freq_percentual <- 100*freq_relativa
freq_percentual

# Frequencia percentual acumulada
freq_percentualA <- cumsum(freq_percentual)
freq_percentualA

# Criando uma tabela com todos os dados
tabela <- cbind(freq,
                freq_relativa,
                freq_percentual,
                freq_percentualA)

# Mostrando a tabela criada
tabela

#. Opção utilizando o pacote fdth
library(fdth)
tb <- fdt(dados,
          start=7,
          end=13,
          h=1)
tb
