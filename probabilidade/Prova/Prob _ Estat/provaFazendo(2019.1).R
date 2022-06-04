##Carrega as bibliotecas
library(mvtnorm)
library(Matrix)
library(fdth)

##FUNCOES FUNDAMENTARIS - FUNCAO GERADORA DE DADOS
gerar_dados <- function(m1=NULL,
                        m2=NULL,
                        m3=NULL,
                        n=2e3)
{
  stopifnot(is.numeric(m1) &
            is.numeric(m2) &
            is.numeric(m3))

  set.seed(m1 +
           m2 +
           m3)

  m_1 <- runif(1,
               min=20,
               max=40)

  m_2 <- runif(1,
               min=20,
               max=40)

  ## Categórica
  n_cat_1 <- n/10 * sample(4:8,
                           1)

  ## Matriz de variâncias e covariâncias
  sigma_1 <- matrix(c(m_1,
                      m_1 / 1.1,
                      m_1 / 1.1,
                      m_2),
                    ncol=2)

  sigma_2 <- matrix(c(m_1,
                      -1 * (m_2 / 1.2),
                      -1 * (m_2 / 1.2),
                      m_2),
                    ncol=2)

  require(Matrix) # S4
  near_1 <- nearPD(sigma_1)

  near_2 <- nearPD(sigma_2)

  sigma_1 <- matrix(near_1[['mat']]@x,
                    nc=ncol(sigma_1))

  sigma_2 <- matrix(near_2[['mat']]@x,
                    nc=ncol(sigma_2))

  ## Escala proporcional
  require(mvtnorm)
  v_pro_1 <- round(rmvnorm(n=n_cat_1,
                           mean=c(m_1,
                                  m_2),
                           sigma=sigma_1),
                   2)

  v_pro_2 <- round(rmvnorm(n=(n - n_cat_1),
                           mean=c(m_1,
                                  m_2),
                           sigma=sigma_2),
                   2)

  ## Escala categórica
  cat_1 <- rep('M',
               n_cat_1)

  cat_2 <- rep('F',
               n - n_cat_1)

  v_pro <- c('v_pro_1',
             'v_pro_2')

  v_cat <- c('cat_1',
             'cat_2')

  ord <- sample(1:2,
                2)

  sexo <- c(eval(parse(text=v_cat[ord[1]])),
            eval(parse(text=v_cat[ord[2]])))


  ## Frame de dados
  res <- as.data.frame(rbind(eval(parse(text=v_pro[ord[1]])),
                             eval(parse(text=v_pro[ord[2]]))))

  res <- cbind(res,
               sexo)

  colnames(res) <- c('Y1',
                     'Y2',
                     'Sexo')

  ## Outlier v_pro_1
  n_out_v1 <- sample(10:20,
                     1)

  out_v1 <- sample(1:length(res[, 1]),
                   n_out_v1)

  res[, 1][out_v1] <- sample(730:999,
                             n_out_v1)

  ## Outlier v_pro_2
  n_out_v2 <- sample(10:30,
                     1)

  out_v2 <- sample(1:length(res[, 2]),
                   n_out_v2)

  res[, 2][out_v2] <- sample(200:300,
                             n_out_v2)

  ## NAs
  res[, 1][sample(1:n, 
                  sample(10:20, 
                         1))] <- NA

  res[, 2][sample(1:n, 
                  sample(10:20, 
                         1))] <- NA

  res[, 3][sample(1:n, 
                  sample(10:20, 
                         1))] <- NA

  ## Negativos
  res[, 1][sample(1:n, 
                  sample(10:20, 
                         1))] <- -999

  res[, 2][sample(1:n, 
                  sample(10:20, 
                         1))] <- -999

  invisible(res)
}

##FUNCAO QUE GERA DADOS DE RELAÇÃO LINEAR
gerar_dados_rl <- function(m1=NULL,
                           m2=NULL,
                           m3=NULL,
                           n=10)
{
  stopifnot(is.numeric(m1) &
            is.numeric(m2) &
            is.numeric(m3))

  set.seed(sum(m1,
               m2,
               m3))

  X <- seq(0, 10, length=n)
  Y <- 1 + 2*X + -.08*X^2 + rnorm(n)

  res <- data.frame(X,
                    Y)

  invisible(res)
}

##FUNCAO QUE GERA UMA TABELA DE DISTRIBUIÇÃO DE FREQ. COMUM
gerar_tdf <- function(m1=NULL,
                      m2=NULL,
                      m3=NULL)
{
  stopifnot(is.numeric(m1) &
            is.numeric(m2) &
            is.numeric(m3))

  set.seed(sum(m1,
               m2,
               m3))

  classes <- c("[10, 020)",
               "[20, 030)",
               "[30, 040)",
               "[40, 050)",
               "[50, 060)",
               "[60, 070)",
               "[70, 080)",
               "[80, 090)",
               "[90, 100)")

  X <- c(seq(f=10, 
             t=50, 
             b=10), 
         seq(f=40, 
             t=10, 
             b=-10))

  Y <- sample(1:3,
              length(X),
              rep=T)

  f <- (X - Y)


  rfp <- round(100*f/sum(f),
               2)

  cfp <- round(100*cumsum(f/sum(f)),
               2)

  res <- data.frame(classes,
                    f,
                    rfp,
                    cfp)

  names(res) <- c('Classes',
                  'f',
                  'rf(%)',
                  'cf(%)')

  invisible(res)
}

##Função para remoção de outliers
rm.outlier <- function(x, type=2){     
  
  #remove NA (Not Available)
  x <- na.omit(x)
  
  while(TRUE){
    
    #Quartis
    qY1 <- quantile(x$Y1, type=type)[2:4]
    qY2 <- quantile(x$Y2, type=type)[2:4]
    
    #Distância interquartilica
    distY1 <- qY1[3] - qY1[1]
    distY2 <- qY2[3] - qY2[1]
    
    #Identificação dos outliers
    out <- subset(x,
                  Y1 >= qY1[3] + 1.5*distY1 |
                    Y1 <= qY1[1] - 1.5*distY1 |
                    Y1 < 0                  |
                    Y2 >= qY2[3] + 1.5*distY2 | 
                    Y2 <= qY2[1] - 1.5*distY2 | 
                    Y2 < 0)
    
    #Caso seja vazio, retorna os dados - não tem outlier
    if (dim(out)[1] == 0)
      return (x)
    
    #Remove outliers
    x <- subset(x,
                Y1 < qY1[3] + 1.5*distY1 &
                  Y1 > qY1[1] - 1.5*distY1 &
                  Y1 >= 0                &
                  Y2 < qY2[3] + 1.5*distY2 & 
                  Y2 > qY2[1] - 1.5*distY2 & 
                  Y2 >= 0)   
  }                
}

# Função para Amplitude Total
at <- function(x) {
  diff(range(x))
}

# Função para Coeficiente de Variação
cv <- function(x) {
  100 * sd(x)/mean(x)
}


##INCIO DA PROVA COM OS DADOS DE:
##JOAO HENRIQUE
##LUIS CARLOS
##MATEUS REIS
matricula1 = 201710737
matricula2 = 201610337
matricula3 = 201720304

##GERA OS DADOS
dad <- gerar_dados(matricula1, matricula2, matricula3)
dad_rl <- gerar_dados_rl(matricula1, matricula2, matricula3)
tdf <- gerar_tdf(matricula1, matricula2, matricula3)

##AED:Apresentações tabulares e grá?cas(2.0) 
##1.1 Diagramadecaixa(boxplot) para Y1 e Y2(1.0)
#PLOTA UM BOXPLOT ANTES DA REMOÇÃO DOS OUTLAIERS
boxplot(dad$Y1, dad$Y2, main = "Antes", names = c("Y1","Y2"))
##REMOVE OS OUTLAIERS
dad2=rm.outlier(dad)
##BOXPLOT APOS A REMOÇÃO DE OUTLAIERS
boxplot(dad2$Y1, dad2$Y2, main = "Depois", names = c("Y1","Y2"))

##CRIA UM BOXPLOT PARA Y1 e Y2 com distinção de sexo
##Masculino
masculino <- subset(dad2, Sexo == "M", select = c("Y1", "Y2"))
boxplot(masculino$Y1, masculino$Y2, main = "Masculino", names = c("Y1","Y2"), outline=FALSE)
#Feminino
feminino <- subset(dad2, Sexo == "F", select = c("Y1", "Y2"))
boxplot(feminino$Y1, feminino$Y2, main = "Feminino", names = c("Y1","Y2"), outline=FALSE)

#1.2 ParaY1(1.0) 
#Cria uma tabela de distribuição de frequencia para y1 masculino
tY1Masculino <- fdt(masculino$Y1)
tY1Masculino
#Cria uma tabela de distribuição de frequencia para y1 feminino
tY1Feminino <- fdt(feminino$Y1)
tY1Feminino

# Histograma - Masculino
plot(tY1Masculino, 
     xlab = " Y1", 
     ylab = "Frequência", 
     col = "grey")
# Polígono de frequência - Masculino
plot(tY1Masculino, 
     xlab = " Y1", 
     ylab = "Frequencia Acumulada", 
     col = "black", 
     type = "cfp")
     
# Histograma - Feminino
plot(tY1Feminino, 
     xlab = " Y1", 
     ylab = "Frequência", 
     col = "grey")
# Polígono de Frequência - Feminino
plot(tY1Feminino, 
     xlab = " Y1", 
     ylab = "Frequencia Acumulada", 
     col = "black", 
     type = "cfp")

##2 AED:Medidas estatísticas básicas(3.0) 
##2.1 AED:Medidas determinadas a partir dos vetores(1.5)
# 2.1.1 Tendência central - média, mediana e moda
summary(masculino)
# Média Y1 - Masculino
mean(masculino$Y1)
# Mediana Y1 - Masculino
median(masculino$Y1)
# Moda Y1 - Masculino
mfv(masculino$Y1)

# Média Y2 - Masculino
mean(masculino$Y2)
# Mediana Y2 - Masculino
median(masculino$Y2)
# Moda Y1 - Masculino
mfv(masculino$Y2)

summary(feminino)
# Média Y1 - Feminino
mean(feminino$Y1)
# Mediana Y1 - Feminino
median(feminino$Y1)
# Moda Y1 - Feminino
mfv(feminino$Y1)

# Média Y2 - Feminino
mean(feminino$Y2)
# Mediana Y2 - Feminino
median(feminino$Y2)
# Moda Y2 - Feminino
mfv(feminino$Y2) 

# 2.1.2 Posição - quartis e decis
# Quartis - Masculino Y1 e Y2
quantile(masculino$Y1, seq(.25,.75, by=0.25))
quantile(masculino$Y2, seq(.25,.75, by=0.25))
# Decis - Masculino Y1 e Y2
quantile(masculino$Y1, seq(0, 1, by=0.1))
quantile(masculino$Y2, seq(0, 1, by=0.1))

# Quartis - Feminino Y1 e Y2
quantile(feminino$Y1, seq(.25,.75, by=0.25))
quantile(feminino$Y2, seq(.25,.75, by=0.25))
#Decis - Feminino Y1 e Y2
quantile(feminino$Y1, seq(0, 1, by=0.1))
quantile(feminino$Y2, seq(0, 1, by=0.1))

#2.1.3 Dispersão - amplitude total, variância, desvio padrão e coeficiente de variação

# Amplitude Total - Masculino Y1 e Y2
at(masculino$Y1)
at(masculino$Y2)
# Variância - Masculino Y1 e Y2
var(masculino$Y1)
var(masculino$Y2)
# Desvio Padrão - Masculino Y1 e Y2
sd(masculino$Y1)
sd(masculino$Y2)
# Coeficiente de Variação - Masculino Y1 e Y2
cv(masculino$Y1)
cv(masculino$Y2)

# Amplitude Total - Feminino Y1 e Y2
at(feminino$Y1)
at(feminino$Y2)
# Variância - Feminino Y1 e Y2
var(feminino$Y1)
var(feminino$Y2)
# Desvio Padrão - Feminino Y1 e Y2
sd(feminino$Y1)
sd(feminino$Y2)
# Coeficiente de Variação - Feminino Y1 e Y2
cv(feminino$Y1)
cv(feminino$Y2)

# 2.2 AED: Medidas determinadas a partir de apresentações tabulares
# Elabore uma apresentação tabular contendo:
# Tendência central: média aritimética, mediana, moda
# Posição: quartis e decis
# Dispersão: variância; desvio padrão e coeficiente de variação

# Reconstituindo uma tdf baseado no tb
(tb1 <- make.fdt(f=c(7, 19, 28, 38, 47, 38, 27, 19, 7), start=10, end=100))

# Média aritimética, nesse casso é da mean.fdt
mean(tb1)
# Mediana, nesse casso é da median.fdt
median(tb1)
# Moda, do pacote fdth
mfv(tb1)

# Quartil
#Neste caso, muda-se o 1 para 1°, 2°, 3°, no caso 
#Da prova fica 10% 20% 30% em como ele colocou
quantile(tb1, i=1)
# Decil
#Aqui vai de 0 a 10, é só mudar o 1 para qual decil quer ver
quantile(tb1, i=1, probs=seq(0, 1, 0.1))

# Amplitude Total
at(tb1)
# Variância
var(tb1)
# Desvio Padrão
sd(tb1)
# Coeficiente de Variação
cv(tb1)



# 3 AED: Medidas estatísticas de associação e regressão linear
# 3.1 Associação

# 3.1.1 Estimativas: covariância e correlação linear simples 
# (para cada sexo: M seguido de F)

# Covariância - Masculino
cov(masculino$Y1, masculino$Y1) # Que é igual a variância de masculino$Y1
cov(masculino$Y1, masculino$Y2)
cov(masculino$Y2, masculino$Y1)
cov(masculino$Y2, masculino$Y2) # Que é igual a variância de masculino$Y2
# Correlação linear simples - Masculino
cor(masculino$Y1, masculino$Y1)
cor(masculino$Y1, masculino$Y2)
cor(masculino$Y2, masculino$Y1)
cor(masculino$Y2, masculino$Y2)

# Covariância - Feminino
cov(feminino$Y1, feminino$Y1) # Que é igual a variância de feminino$Y1
cov(feminino$Y1, feminino$Y2)
cov(feminino$Y2, feminino$Y1)
cov(feminino$Y2, feminino$Y2) # Que é igual a variância de feminino$Y2
# Corelação linear simples - Feminino
cor(feminino$Y1, feminino$Y1)
cor(feminino$Y1, feminino$Y2)
cor(feminino$Y2, feminino$Y1)
cor(feminino$Y2, feminino$Y2)

# 3.1.2 Diagramas de dispersão dos dados (para cada sexo: M seguido de F)
#       (Y2 no eixo das ordenadas e Y1 no eixo das abscissas)

plot(masculino, main = 'Masculino')
plot(feminino, main = 'Feminino')

# 3.2 Regressão linear

# 3.2.1 Ajuste aos dados quatro modelos de regressão linear: 
# polinômios de grau I 
# polinômios de grau II

X <- dad_rl$X
Y <- dad_rl$Y

# Grau I - normal
rl1 <- (lm(Y ~ X))
summary(rl1)$r.squared
# Grau II - normal
rl2 <- (lm(Y ~ X + I(X^2)))
summary(rl2)$r.squared



# 3.2.1 Diagrama de dispersão dos dados com os dois modelos sobrepostos

plot(Y ~ X)

# Modelo linear de 1 grau - normal
lines(fitted(rl1) ~ X,
      col='red')


# Modelo linear de 2 grau - normal
lines(fitted(rl2) ~ X,
      col='blue')

      
legend("topleft",
legend= c('Grau I - Normal', 'Grau II - Normal'),
col = c('red', 'blue'),lty=1, lwd=2, bty="n", bg = 'transparent')

# 3.2.1 Apresente um diagrama de dispersão dos dados ( Y no eixo das 
# ordenadas e X no eixo das abscissas) com o melhor modelo

plot(Y ~ X)

# Modelo linear de 2 grau - normal
lines(fitted(rl2) ~ X,
      col='blue')

