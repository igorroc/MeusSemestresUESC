##===============================================================================
## Main   : Anatomy of boxplot
## Author : José Cláudio Faria
## Date   : 17/10/2016 08:15:11
## Version: v13
## Aim    : To show the boxplot anatomy
##===============================================================================
## - Allows to simulate any (x) data
## - Require package fdth
##===============================================================================

## Normal data
# Gerando uma distribuição normal
  # Quantidade de valores: 1000;
  # Media: 10;
  # Desvio padrão 2
x <- rnorm(1e3,
           m=10,
           sd=2)

## Calculo dos quartis
# Tipo do algoritimo de calculo de quartis: 2
# Intervalo 25% 50% 75%
q <- quantile(x,
              type=2)[2:4]

## Inter quartile range
# Desvio/Amplitude interquartilica
# Igual à diferença entre os percentis 75 e 25 ou entre quartis superiores inferiores
(iqr <- q[3] - q[1])

## Outlier limmits
out.low <- q[1] - 1.5*iqr
out.upp <- q[3] + 1.5*iqr

## Min e Max não outlier
min.no <- min(x[x >= out.low])
max.no <- max(x[x <= out.upp])

## The boxplot
#Preparando o layaut para a plotagem dos graficos
layout(matrix(1:2,
              ncol=2),
       widths=c(3,
                1),
       heights=c(3.5,
                 3.5),
       TRUE)
# Setando par com margem
# Inferior: 2, esquerda: 3.1, superior: 1, direita: 0
par(mar=c(2,
          3.1,
          1,
          0))

# Menor e Maior valor com outlier
min.y <- min(c(min(x), out.low))
max.y <- max(c(max(x), out.upp))

# Boxwex - deixar o aspecto das caixas proporcionais
# axes - se aparece ou não os valores de y
boxplot(x,
        xlim=c(0.5,
               1.5),
        ylim=c(min.y - .2*iqr,
               max.y + .2*iqr),
        boxwex=.4,
        at=1,
        col=gray(.8),
        axes=FALSE)

# Setando todos os valores obtidos em uma variavel para plotagem
at <- c(min(x),
        q[1],
        q[2],
        q[3],
        max(x))
at

# Plotando os eixos 
axis(2,
     at=at,
     labels=format(round(at, 1)),
     las=1)

## Texts of quantiles
## sep é para separar os termos
## cex é o tamanho da fonte
text(x=.85,
     y=q[1:3],
     paste('q',
           1:3,
           sep=''),
     cex=1)

## Texts of no outliers
## pos é a posição do texto na tela, pos 2 acima da 1
text(x=.95,
     y=c(min.no,
         max.no),
     paste(c('Min.',
             'Max.'),
           'no outlier'),
     cex=.9,
     pos=2,
     col='blue')

## Inserindo os valores max e min dos não outlier
## round usado para arredondar o numero de acordo com uma
##   quantidade de casas decimais
text(x=.80,
     y=c(min.no,
         max.no),
     paste('(',
           round(c(min.no,
                   max.no), 1),
            ')',
            sep=''),
     cex=.9,
     pos=1,
     col='blue')

## Segments of irq
## Hz
## Inserindo os segmentos que delimitam o iqr
## lty = line types
segments(x0=1.3,
         y0=c(q[1],
              q[3]),
         x1=1.4,
         y1=c(q[1],
              q[3]),
         lty=3,
         col='red')

## Vt
## Traçando as retas 
segments(x0=1.35,
         y0=c(q[1],
              q[3]),
         x1=1.35,
         y1=c(q[1] + .3*iqr,
              q[3] - .3*iqr),
         lty=3,
         col='red')

## Text of irq
text(x=1.35,
     y=q[2],
     'iqr = q3 - q1',
     col='red',
     cex=1)

## Upper limmit Vt
segments(x0=1.35,
         y0=q[3],
         x1=1.35,
         y1=out.upp,
         lty=3,
         col='red')

## Upper limmit Hz
segments(x0=1.3,
         y0=out.upp,
         x1=1.4,
         y1=out.upp,
         lty=3,
         col='red')

## Lower limmit Vt
segments(x0=1.35,
         y0=q[1],
         x1=1.35,
         y1=out.low,
         lty=3,
         col='red')

## Lower limmit Hz
segments(x0=1.3,
         y0=out.low,
         x1=1.4,
         y1=out.low,
         lty=3,
         col='red')

## Texto dos outliers
text(x=1.30,
     y=c(out.low,
         out.upp),
     paste(
           c('q1 - 1.5',
             'q3 + 1.5'),
           'iqr',
           sep=''),
     col='red',
     pos=2)

text(x=1.18,
     y=c(out.low,
         out.upp),
     paste('(',
           round(c(out.low,
                   out.upp), 1),
            ')',
            sep=''),
     cex=.9,
     pos=1,
     col='red')

## Segments of outliers
## Min
if (min(x) < min.no)
  segments(x0=1.4,
           y0=out.low,
           x1=1.5,
           y1=out.low,
           col='red')

## Max
if (max(x) > max.no)
  segments(x0=1.4,
           y0=out.upp,
           x1=1.5,
           y1=out.upp,
           col='red')

## Arrows of outliers
## Min
if (min(x) < min.no)
  arrows(x0=1.5,
         y0=out.low,
         x1=1.5,
         y1=min(x),
         length=.08,
         col='red')

## Max
if (max(x) > max.no)
  arrows(x0=1.5,
         y0=out.upp,
         x1=1.5,
         y1=max(x),
         length=.08,
         col='red')

## Texts of outliers
## Min
if (min(x) < out.low)
  text(x=1.35,
       y=out.low,
       'Outlier',
       col='red',
       pos=1,
       cex=.8)

# Max
if (max(x) > out.upp)
  text(x=1.35,
       y=out.upp,
       'Outlier',
       col='red',
       pos=3,
       cex=.8)

## Segments %
segments(x0=.65,
         y0=min(x),
         x1=.65,
         y1=max(x),
         col='darkgreen')

## pch = seta um símbolo de acordo com um determinado numero
points(x=rep(.65,
             5),
       y=c(min(x),
           q[1],
           q[2],
           q[3],
           max(x)),
       pch=19,
       col='darkgreen')

## Texts %
text(x=.55,
     y=c(min(x) + ((q[1] - min(x)) / 2),
         q[1] + ((q[2] - q[1]) / 2),
         q[2] + ((q[3] - q[2]) / 2),
         q[3] + ((max(x) - q[3]) / 2)),
     '25%',
     col='darkgreen',
     cex=1)

## The histogram
par(mar=c(2,
          .1,
          1,
          1))

#! Using functio hist instead of fdt
#ht <- hist(x,
#          breaks=50,
#          plot=FALSE)
#
#plot(NULL,
#     type = "n",
#     xlim = c(0,
#              max(ht$counts)),
#     ylim=c(min(x) - .1*iqr,
#            max(x) + .1*iqr),
#     axes=FALSE)
#
#rect(xleft=0,
#     ybottom=ht$breaks[1:(length(ht$breaks) - 1)],
#     xright=ht$counts,
#     ytop=ht$breaks[2:length(ht$breaks)],
#     col=gray(.8),
#     border='white')

## Chamando a biblioteca fdth
require(fdth)

## Criando uma tabela de frequencia
## k = número de intervalo de classes
tb <- fdt(x,
          k=5e1)

## Armazenando os intervalos
brk <- with(tb,
            seq(breaks["start"],
            breaks["end"],
            breaks["h"]))

## Obtendo todas as frequências
f <-   with(tb,
            table$f)

## Plotando o "esqueleto do histograma" (sem os dados)
plot(NULL,
     type = 'n',
     xlim = c(0,
              max(f)),
     ylim=c(min.y - .2*iqr,
            max.y + .2*iqr),
     axes=FALSE)

## Desenhando os retângulos
rect(xleft=0,
     ybottom=brk[-length(brk)],
     xright=f,
     ytop=brk[-1],
     col=gray(.8),
     border='white')


# Desenhando as linhas pontilhadas no histograma
## lwd = line width
abline(h=c(out.low,
           q[1],
           q[2],
           q[3],
           out.upp),
       lty=2,
       lwd=1.5,
       col='red')
