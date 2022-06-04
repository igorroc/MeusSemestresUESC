#===============================================================================
# Título   : Análise quantitativa de dados - AQE - Ajustamento
# Autor    : José Cláudio Faria/UESC/DCET
# Data     : 08/06/2021 17:19:24
# Objetivos:
#===============================================================================
# a) Apresentar os recursos básicos do R para análise de regressão
# b) Fundamentação em regressão linear simples
# c) Fundamentação em álgebra de matrizes
# d) Fundamentação na função lm (stats)
#===============================================================================

#===============================================================================
#. Ênfase em álgebra de matrizes
#.. +----------------------+
#.. |             -1       |
#.. | b_est = (X'X) . X'Y  |
#.. +----------------------+
#... b_est: solução matricial do método dos mínimos quadrados dos erros.
#===============================================================================

#===============================================================================
# Operações matriciais abaixo permitem a obtenção das estimativas (b_est)
# dos parâmetros dos modelos lineares.
#===============================================================================

x <- c(10, 20, 30, 40, 50, 60, 70)
y <- c(1000, 2300, 3600, 4500, 5400, 5800, 5600)

(X <- cbind(1, x))        # Modelo linear de 1 grau: com intercepto        
# (X <- cbind(x))           # Modelo linear de 1 grau: forçando para a origem
# (X <- cbind(1, x, x^2))   # Modelo linear de 2 grau: com intercepto        
# (X <- cbind(x, x^2))      # Modelo linear de 2 grau: forçando para a origem

(Y <- cbind(y))

(XlX     <- t(X) %*% X)      # X'X

                             #     -1
(XlX_inv <- solve(XlX))      # (X'X) 

(XlY     <- t(X) %*% Y)      #  X'Y

                             #      -1     
(b_est   <- XlX_inv %*% XlY) # (X'X) . X'Y

(Y_est   <- X %*% b_est)     # Y: valores estimados pelo modelo ajustado

(res     <- Y - Y_est)       # Erros

# Visualizando os dados
plot(y ~ x,
     xlim=c(0, 70),
     ylim=c(0, 7000),
     pch=19,
     col='darkgreen')

# Sobrepondo os valores estimados pelo modelo ajustado (curva suavizada)
lines(spline(Y_est ~ x,
             n=1e3),
      col='red')

points(Y_est ~ x,
       col='red',
       pch=19)


#===============================================================================
#. Ênfase na função de alto nível do R - lm (package:stats)
#===============================================================================
rl <- lm(y ~ x)               # Modelo linear de 1 grau: com intercepto
# rl <- lm(y ~ 0 + x)           # Modelo linear de 1 grau: forçando para a origem 
# rl <- lm(y ~ x + I(x^2))      # Modelo linear de 2 grau: com intercepto                        
# rl <- lm(y ~ 0 + x + I(x^2))  # Modelo linear de 2 grau: forçando para a origem                       

summary(rl)
class(rl)
mode(rl)
names(rl)

# Visualizando os dados
plot(y ~ x,
     xlim=c(0, 70),
     ylim=c(0, 7000),
     pch=19,
     col='darkgreen')

# Sobrepondo o modelo ajustado
lines(spline(fitted(rl) ~ x,
             n=1e3),
      col='red')

points(fitted(rl) ~ x,
       col='red',
       pch=19)

#===============================================================================
#. Verificando apresentação gráfica com todos os modelos
#===============================================================================
plot(y ~ x,
     xlim=c(0, 70),
     ylim=c(0, 7000),
     pch=19,
     col='darkgreen')

# Modelo linear de 1 grau: com intercepto
lines(fitted(lm(y ~ x)) ~ x,
      col='blue')

# Modelo linear de 1 grau: ajustado para a origem
lines(fitted(lm(y ~ 0 + x)) ~ x,
      col='blue',
      lty=2)

# Modelo linear de 2 grau: com intercepto
lines(spline(fitted(lm(y ~ x + I(x^2))) ~ x,
             n=1e3),
      col='red',
      lw=2)

# Modelo linear de 2 grau: ajustado para a origem
lines(spline(fitted(lm(y ~ 0 + x + I(x^2))) ~ x, 
             n=1e3),
      col='red',
      lw=2,
      lty=2)
