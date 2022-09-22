#. Probabilidade e Estatistica - Ciencia da Computação 2019.1
#.. Tema: Apresentação Tabulares e gráficas
#.. Professor: José Claudio Faria
#.. Grupo: Luís Carlos e Mateus Reis

#... Carregando pacote necessário
# install.packages('fdth')
library('fdth')

#... Dados
# n: 1000;
# media: 5;
# desvio padrão 1
set.seed(1)
dados <- rnorm(n=1e3,
               mean=5,
               sd=1)
dados

#. TABELA DE DIST. FREQUÊNCIA
tb <- fdt(dados)
tb

#. HISTOGRAMAS
#.. Freq. Absoluta
plot(tb,
     type='fh',
     v=TRUE,
     x.round=3,
     xlab='Limites das Classes',
     ylab='Frequência')
           
#.. Freq. Relativa
plot(tb,
     type='rfh',
     v=TRUE,
     x.round=3,
     xlab='Limites das Classes',
     ylab='Frequência')


#.. Freq. Relativa (percentual)
plot(tb,
     type='rfph',
     v=TRUE,
     x.round=3,
     xlab='Limites das Classes',
     ylab='Frequência')

#.. Freq. Acumulada
plot(tb,
     type='cfh',
     v=TRUE,
     x.round=3,
     xlab='Limites das Classes',
     ylab='Frequência')
           
#.. Freq. Acumulada (percentual)
plot(tb,
     type='cfph',
     v=TRUE,
     x.round=3,
     xlab='Limites das Classes',
     ylab='Frequência')


#. POLÍGONO DE FREQUÊNCIA
#.. Frequência Absoluta
plot(tb,
     v=TRUE,
     type='fp',
     x.round=3,
     ylab='Frequência',
     xlab='Limites das classes')
            
#.. Frequência Relativa
plot(tb,
     v=TRUE,
     type='rfp',
     x.round=3,
     ylab='Frequência',
     xlab='Limites das classes')

#.. Frequência Relativa (percentual)
plot(tb,
     v=TRUE,
     type='rfpp',
     x.round=3,
     ylab='Frequência',
     xlab='Limites das classes')

#.. Frequência Acumulada
plot(tb,
     v=TRUE,
     type='cfp',
     x.round=3,
     ylab='Frequência',
     xlab='Limites das classes')
           
#.. Frequência Acumulada (percentual)
plot(tb,
     v=TRUE,
     type='cfpp',
     x.round=3,
     ylab='Frequência',
     xlab='Limites das classes')

#. BOXPLOT
# Informando algumas informações utilizadas no boxplot
(summary(dados))

# Motrando o boxplot referente à distribuição 'dados'
boxplot(dados,
        main='Boxplot')

#. DIAGRAMA DE PONTOS (DISPERSÃO)
# Obtendo uma amostra de 36 números limitando a escolha dentro do intervalo = -5:5,
# podendo haver repetições
amostra <- sample(-5:5, 36, TRUE)
amostra
  
# Gerando uma sequência de valores de 0 até 350 de 10 em 10
sequencia <- seq(0, 350, by=10)
sequencia
  
plot(amostra,
     main='Diagrama de Pontos amostra')

plot(sequencia,
     main='Diagrama de Pontos sequência')

plot(amostra ~ sequencia)

#. GRÁFICO POLAR
# install.packages('fdth')
library('plotrix')
  
# Gerando os gráficos polares para testlen e testpos
# - lwd = espessura da linha
# - line.col = cor da linha
  
polar.plot(amostra,
           rp.type='p',
           main='Amostra Polar Plot',
           lwd=2,
           line.col=4)

polar.plot(sequencia,
           rp.type='p',
           main='Sequencia Polar Plot',
           lwd=2,
           line.col=2)

#. GRÁFICO EM COLUNAS
# Gerando uma distribuição normal de 10 elementos
# com uma média de 727 e desvio padrão de 40
(salario <- rnorm(10, 727, 40))

# Informando a média dos valores
mean(salario)
  
# Gerando o barplot
barplot(salario,
        ylab='Valores',
        main='Salário Colunas',
        col='blue')

#. GRÁFICO EM BARRAS
# Gerando o gráfico em barras
barplot(salario,
        main='Salário Barras',
        horiz=TRUE,
        xlab='Valores',
        col='orange')

#. GRÁFICO EM SETORES (PIZZA)
# Criando um vetor
riqueza <- c(15, 18, 22, 24, 25)

# Setando uma letra para cada elemento do vetor
names(riqueza) <- letters[1:length(riqueza)]  
pie(riqueza)
  
# sum(riqueza) = soma todos os valores de riqueza
# Round = limita a quantidade de casas decimais após a vírgula
# Paste = concatena o vetor depois de transformar em caractere
pie(riqueza,
    paste(100 * round(riqueza/sum(riqueza), 2), '%'),
    col=rainbow(5),
    main='Gráfico em setores')
    
#. GRÁFICO EM CURVAS
# Criando um intervalo de -20 a 20
 
x <- -20:20

# Fazendo y como sendo uma função aplicada a todos os valores de x
y <- 2 + x^2
  
# Gerando o gráfico de curvas
plot(y ~ x,
     type='l',
     xlab='x',
     ylab='f(x)',
     main='Gráfico em curvas',
     lwd=2)
