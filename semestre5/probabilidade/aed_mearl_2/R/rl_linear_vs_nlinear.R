##===============================================================================
## Título   : Análise quantitativa de dados - AQE
## Autor    : José Cláudio Faria/UESC/DCET
## Data     : 2018/08/13 - 09:41:13
## Versão   : v3
## Objetivos:
##===============================================================================
## a) Apresentar os recursos básicos do R para análise de regressão
## b) Fundamentação em regressão linear
## c) Distinção dos modelos lineares dos não lineares
##===============================================================================

##===============================================================================
## Verificando se um modelo é ou não linear nos parâmetros
##===============================================================================
fl <- expression(a + b*x)            # polinômio de grau I
fq <- expression(a + b1*x + b2*x^2)  # polinômio de grau II
fe <- expression(a*exp(x/b))         # Exponencial - não linear

# Observar que as derivadas NÃO DEPENDEM do parâmetro b -> Linear  -> lm
deriv(fl,
      c('a',
        'b'))

# Observar que as derivadas NÃO DEPENDEM dos parâmetros b1 e b2 -> Linear -> lm
deriv(fq,
      c('a',
        'b1',
        'b2'))

# Observar que as derivadas DEPENDEM do parâmetro b1 -> Não linear -> nls
deriv(fe,
      c('a',
        'b'))

