#!Script Auxiliar de resolução das atividades de V.A.D e V.A.C

#!VARIÁVEIS DISCRETAS
#!1.1 Bernoulli:
#A probabilidade de sucesso de uma VAD X é p = 1/6: X~Bin(n = 1, p = 1/6). Qual a probabilidade de X assumir (sucesso) os valores: 1. Um? 2. Dois? 3. Trˆes? 4. Quatro? 5. Cinco? 6. Seis?

#Se tratando de Bernoulli, eu só tenho 1 teste, é sempre um, logo a probabilidade dele X assumir qualquer um dos valóres será sempre a mesma. onde:
X <- 1 #Ela só pode assumir 1 valor, seja ele 1,2,3... a probabilidade é a mesma
n <- 1
prob <- 1/6
dbinom(X,n,prob)
(E <- prob)  #Esperança ou Média
(V <- prob*(1-prob)) #Variância = produto da prob de sucesso pela prob de fracasso

#!1.2 Binomial

##Suponha que numa linha de produ¸c˜ao a probabilidade de se obter uma peça defeituosa (sucesso) ´e p = 1/10. Toma-se uma amostra de 10 pe¸cas, para inspe¸c˜ao: X ~ Bin(n = 10, p = 0, 1). Qual a probabilidade de se obter:  

n <- 10
prob <- 1/10
(E <- n*prob) #Esperança ou Média
(V <- n*prob*(1-prob)) #Variância

#A) Uma peça defeituosa
X <- 1
dbinom(X,n,prob)

#B) Nenhuma peça defeituosa
X <- 0
dbinom(X,n,prob)

#C) Duas peça defeituosa
X <- 2
dbinom(X,n,prob)

#D) No mínimo duas peça defeituosa (Isso significa X>=2)
dbinom(2,n,prob)+dbinom(3,n,prob)+dbinom(4, n, prob)+dbinom(5, n, prob)+dbinom(6, n, prob)+dbinom(7, n, prob)+dbinom(8, n, prob)+dbinom(9, n, prob)+dbinom(10, n, prob)

#E) No máximo duas peça defeituosa (Isso significa X<=2)
dbinom(0,n,prob)+dbinom(1,n,prob)+dbinom(2, n, prob)

#!1.3 Poisson

#Considere um processo que têm uma taxa de 1/5 defeitos por unidade: X ~ Poisson(? = 0,2). Qual a probabilidade de uma unidade qualquer apresentar:

lambda <- 1/5
(E <- lambda)
(V <- lambda)

#A) Dois defeitos
X <- 2
dpois(X, lambda)

#B) Um defeitos
X <- 1
dpois(X, lambda)

#C) Zero defeitos
X <- 0
dpois(X, lambda)

#OBS POISSON: No caso da Poisson, se for pelo menos (X>=x) a probabilidade é a complementar, visto que é em um intervalo e não tem um fim, então é a complementar 1-P(X<x)
#Ex: Uma certa loja recebe em média 6 clientes por hora, qual a probabilidade de receber pelo menos 3 clientes em 25 minutos?

#Transforma 6 clientes por hora em minutos, logo:
lambda <- 2.5
#Pelo menos 3 clientes X>=3 = 1-P(X<3)
1 - (dpois(0, lambda)+dpois(1, lambda)+dpois(2, lambda))


#!VARIÁVEIS CONTÌNUAS
#!2.1 Normal

#Uma VAC X segue distribui¸c˜ao normal: X ~ N(µ = 10, s = 2). Qual a probabilidade de X assumir valores:  1. Menor que 10?  2. Entre 5 e 10?  3. Entre 12 e 15?  4. Maior que 11?  5. Qual o quantil que delimita 10% dos maiores valores?   6. Qual o quantil que delimita 10% dos menores valores?

m <- 10
dp <- 2

#1.Menor que 10? 
integrate(dnorm, -Inf, 10, m,dp)

#2. Entre 5 e 10?
integrate(dnorm, 5, 10, m,dp)

#3. Entre 12 e 15?
integrate(dnorm, 12, 15, m,dp)

#4. Maior que 11?
integrate(dnorm, 11, Inf, m,dp)

#5. Qual o quantil que delimita 10% dos maiores valores?
qnorm(0.10, m, dp, lower=FALSE) #lower=FALSE = (X>x)

#5. Qual o quantil que delimita 10% dos menores valores?
qnorm(0.10, m, dp, lower=TRUE) #lower=TRUE é padrão = (X<x)

#!2.2 T de Student

#Uma VAC X segue distribui¸c˜ao t: X ~ t(n = 10). Qual a probabilidade de X assumir valores:

n <- 10 #grau de liberdade

#1. Menor que 0?
integrate(dt, -Inf, 0, n)

#2. Entre -1 e 0?
integrate(dt, -1, 0, n)

#3. Entre 1 e 2?
integrate(dt, 1, 2, n)

#4. Menor que -2 e maior que 2?
r1 <- integrate(dt, -Inf, -2, n)$value
r2 <- integrate(dt, 2, Inf, n)$value
(r1 + r2)

#5. Qual o quantil que delimita 5% dos maiores valores? #0.05 -> 5%
qt(0.05, n, lower.tail=FALSE) ##Lower.tail=FALSE diz os valores à direita

#6. Qual o quantil que delimita 5% dos menores valores?
qt(0.05, n, lower.tail=TRUE) ##Lower.tail=FALSE diz os valores à esquerda

#!2.3 DISTRIBUIÇÃO QUI-QUADRADO

#Uma VAC X segue distribuiçao ?^2: X ~ ?^2 (n = 10). Qual a probabilidade de X assumir valores:
g_l <- 10

#1. Menor que 5?
integrate(dchisq, -Inf, 5, g_l)

#2. Entre 10 e 20?
integrate(dchisq, 10, 20, g_l)

#3. Entre 20 e 30?
integrate(dchisq, 20, 30, g_l)

#4. Maior que 25?
integrate(dchisq, 25, Inf, g_l)

#5. Qual o quantil que delimita 5% dos maiores valores?
qchisq(0.05, g_l, lower.tail=FALSE)

#6. Qual o quantil que delimita 5% dos menores valores?
qchisq(0.05, g_l, lower.tail=TRUE) #X<x

#!2.4 DISTRIBUIÇÃO F

#Uma VAC X segue distribui¸c˜ao F de Snedecor: X ~ F(n1 = 5, n2 = 12). Qual a probabilidade de X assumir valores:
g_l_num <- 5
g_l_den <- 12

#1. Menor que 0.5?
integrate(df, -Inf, 5, g_l_num, g_l_den)

#2. Entre 0 e 3?
integrate(df, 0, 3, g_l_num, g_l_den)

#3. Maior que 5?
integrate(df, 5, Inf, g_l_num, g_l_den)

#4. Qual o quantil que delimita 5% dos maiores valores?
qf(0.05, g_l_num, g_l_den, lower.tail = FALSE) #Por padrão lower.tail = TRUE

#5. Qual o quantil que delimita 5% dos menores valores?
qf(0.05, g_l_num, g_l_den, lower.tail = TRUE) #X<x

