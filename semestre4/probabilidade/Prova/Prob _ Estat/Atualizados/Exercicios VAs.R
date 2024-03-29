#!Consideramos uma popula��o de uma cidade A e de uma outra cidade B. Suponhamos que todas as pessoas tenham informado as respectivas alturas (em cent�metros). E deseja-se fazer uma compra��o entre tais popula��es. As principais estat�sticas obtidas por essa pesquisa foram: Popula��o A: m�dia 174cm e Vari�ncias 64cm; Popula��o B: m�dia: 178cm e Vari�ncia 1.Um pesquisador deseja sortear aleatoriamente pessoas para fazer um teste sober DNA e crescimento, e para isso, gostaria de coletar (aleatoriamente) pessoas com mais de 1,80m (180cm). Em qual das duas popula��es ser� mais f�cil achar pessoas com tais caracter�sticas?

#Popula��o A (MELHOR ESCOLHA)
m_popA <- 174
v_popA <- 64
sd_popA <- sqrt(v_popA)

(r <- integrate(dnorm, 180, Inf, m_popA, sd_popA)$value)
(r*100)

#Popula��o B
m_popB <- 178
v_popB <- 1
sd_popB <- sqrt(v_popB)

(r2 <- integrate(dnorm, 180, Inf, m_popB, sd_popB)$value)
(r2*100)

#Agora temos interesse em opter pessoas que tenham entre 1,75 (175cm) e 1,80(180cm). QUal popula��o tem maior numero de habitantes nessa faixa de altura?

#Popula��o A
(r <- integrate(dnorm, 175, 180, m_popA, sd_popA)$value)
(r*100)

#Popula��o B  (MELHOR ESCOLHA)
(r2 <- integrate(dnorm, 175, 180, m_popB, sd_popB)$value)
(r2*100)


#! Suponha que o tempo necess�rio para o atendimento de clientes em uma central de atendimento telef�nico siga uma distribui��o normal de m�dia de 8 minutos e desvio padr�o de 2 minutos.

m <- 8
dp <- 2

#A) Qual a probabilidade de que um atendimento dure menos de 5 minutos?
integrate(dnorm, -Inf, 5, m, dp)

#B) E mais do que 9.5 minutos?
integrate(dnorm, 9.5, Inf, m, dp)

#C) Entre 7 e 10 minutos
integrate(dnorm, 7,10,m,dp)

#D) 75% das chamadas telef�nicas requerem pelo menos quanto tempo de atendimento?
qnorm(0.75)


#! Suponha que a altura dos homens em uma certa cidade tem distribui��o normal com m�dia m = 180cm e desvio padr�o dp = 10cm, calcule:

m <- 180
dp <- 10

#A probabilidade de um homem ter mais de 190cm.
integrate(dnorm, 190,Inf,m,dp)

#B O valor em metros abaixo do qual est�o as alturas de 30% desses homens
qnorm(0.3, m, dp)/100

 