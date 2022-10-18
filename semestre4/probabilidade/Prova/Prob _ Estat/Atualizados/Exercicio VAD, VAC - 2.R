#!Script Auxiliar de resolução das atividades de V.A.D e V.A.C

#!VARIÁVEIS DISCRETAS
#!1.1 Bernoulli:

#A probabilidade de sucesso de uma VAD X (que pode assumir valores entre 1 e 5) é p = 1/5: X ~ Bin(n = 1, p = 1/5). Qual a probabilidade de X assumir (sucesso) o valor 5?

x <- 1
n <- 1
p <- 1/5

(r <- dbinom(x, n, p))
r*100

#x = 1 porque quando se trata de Bernoulli estamos falando de 1 teste e 1 resultado, ou seja, a probabilidade é a mesma para valores entre 1 e 5.

#!1.2 Binomial:

#Suponha que numa linha de produção a probabilidade de se obter uma peçaa defeituosa (sucesso) ´e p = 1/20. Tomase uma amostra de 10 peças, para inspeção: X ~ Bin(n = 10, p = 1/20). Qual a probabilidade de se obter 2 peças defeituosas?

x <- 2
n <- 10
p <- 1/20

(r <- dbinom(x, n, p))
r*100

#!1.3 Poisson: 

#Considere um processo que têm uma taxa de 1/4 defeitos por unidade: X ~ Poisson(? = 1/4). Qual a probabilidade de uma unidade qualquer apresentar 1 defeito?

x <- 1
lambda <- 1/4

(r <- dpois(x, lambda))
r*100

#!VARIÁVEIS CONTÍNUAS
#!2.1 Normal:

#Uma VAC X segue distribuição normal: X ~ N(µ = 11, s = 3). Qual a probabilidade de X assumir valores entre 12 e 15?

m <- 11
dp <- 3

(r <- integrate(dnorm, 12,15, m, dp)$value)
r*100

#!2.2 T:

#Uma VAC X segue distribuição t: X ~ t(n = 20). Qual o quantil que delimita 5% dos maiores valores?

g_l <- 20

qt(0.05, g_l, lower.tail = FALSE)


#!2.2 QUI-QUADRADO:

#Uma VAC X segue distribuição ?^2 : X ~ X^2(n = 10). Qual a probabilidade de X assumir valores menores que 5?

g_l <- 10

integrate(dchisq, -Inf, 5, g_l)

#!2.3 F:

#Uma VAC X segue distribuição F de Snedecor: X ~ F(n1 = 5, n2 = 12). Qual o quantil que delimita 5% dos maiores valores?

gl1 <- 5
gl2 <- 12

qf(0.05, gl1, gl2, lower.tail = FALSE)

 