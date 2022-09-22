## ===========================================================================
## Nome    : funcão geradora de dados: gerar_dados
## Autor   : José Cláudio Faria/DCET/UESC
## Data    : 18/07/2016 11:31:41
## Versão  : v8
## Objetivo: Gerar dados (data.frame, com estrutura de covariância) para as
##           avaliações práticas de análise exploratória de dados dos cursos 
##           introdutórios de estatística
## Require : Matrix, mvtnorm
## email   : <<<joseclaudio.faria@gmail.com>>>
## ===========================================================================
## Observações:
## 1- Muito cuidado ao informar as matrículas: a geração dos dados para
## análise (e subsequente correção) dependem dessa informação correta.
## As matrículas informadas devem ser obrigatoriamente as do grupo.
## 
## 2- Grupos com menos que 3 alunos: repetir a(s) última(s) matrícula(s)
## para a(s) matrícula(s) restante(s).
## 
## 3- Se encontrar algum problema com as matrículas informadas, tente alterar
## alguma das matrículas. Nesse caso não esquecer de comunicar ao professor
## (por escrito) no corpo da prova.
## 
## 4- A função está intencionalmente mal documentada.
## ===========================================================================

## Função
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

## Exemplo de uso: gerar_dados 
# dad <- gerar_dados(m1=201800001,
#                    m2=201800001,
#                    m3=201800001)
# str(dad)


## ===========================================================================
## Nome    : funcão geradora de dados: gerar_dados_rl
## Autor   : José Cláudio Faria/DCET/UESC
## Data    : 18/07/2016 11:49:18
## Versão  : v2
## Objetivo: Gerar dados (data.frame) para as avaliações práticas
##           de análise exploratória de dados referentes a regressão linear
##           introdutórios de estatística
## email   : <<<joseclaudio.faria@gmail.com>>>
## ===========================================================================

## Função
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

## Exemplo de uso: gerar_dados_rl
# dad_rl <- gerar_dados_rl(m1=201821032,
#                          m2=201820053,
#                          m3=201820046)
# str(dad_rl)
# plot(dad_rl,
#      pch=20)


## ===========================================================================
## Nome    : funcão geradora de dados: gerar_tdf
## Autor   : José Cláudio Faria/DCET/UESC
## Data    : 23/05/2018 11:49:18
## Versão  : v1
## Objetivo: Gerar dados para uma tabela de distribuição de frequências para  
##           avaliações práticas de análise exploratória de dados dos cursos
##           introdutórios de estatística
## email   : <<<joseclaudio.faria@gmail.com>>>
## ===========================================================================

## Função
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

## Exemplo de uso:  gerar_tdf
#tb <- gerar_tdf(m1=201821032,
                #m2=201820053,
                #m3=201820046)

#str(tb)
#tb

##---------------------RESPOSTAS--------------------##

