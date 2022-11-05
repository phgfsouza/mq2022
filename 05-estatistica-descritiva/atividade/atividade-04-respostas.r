#------------------------------------------------------#
# ATIVIDADE #4. Estatisticas descritivas no R
# Script com modelo para atividade
#------------------------------------------------------#


# INSTRUÇÕES ------------------------------------------#
# Para responder aos exercicios abaixo, simplesmente substituam 
# as reticencias (...) pelas funcoes e expressoes adequadas e 
# respondam 'as perguntas inseridas.
#
# A pontuacao=o será atribuída da seguinte forma:
# 01. Preparacao:  10 pontos
# 02. Titanic:     30 pontos
# 03. Crimes:      30 pontos
# 04. Tempestades: 30 pontos
#
# Boa sorte!
#------------------------------------------------------#



# 01. PREPARAÇÃO --------------------------------------#

# LIMPANDO O WORKSPACE
# Para iniciar, limparemos o workspace, apagando os objetos carregados
rm(list = ls())

# IDENTIFICACAO DO ALUNO 
# Crie um vetor com a forma abaixo para identificar seu nome e email
aluno <- c("Pedro Souza", "pedro.ferreira@ipea.gov.br")
names(aluno) <- c('nome', 'email')
print(aluno)

# PACOTES
# Instale (se necessario) e carregue os pacotes: 'tidyverse' e 'summarytools', 
library(tidyverse)
library(summarytools)


# DATA FRAMES
# Utilizaremos data frames que vem com pacotes. E' so executar o codigo abaixo.
crimes.df <- USArrests
tempestades.df <- storms
titanic.df <- data.frame(Titanic)


# 02. PASSAGEIROS DO TITANIC --------------------------#
# O data frame 'titanic.df' contem informacoes sobre o destino
# dos passageiros do Titanic, conforme classe, sexo, idade e sobrevivencia.

# DICIONARIO
# 'Class' =  classe no navio (1st, 2nd, 3rd, Crew -> 1a, 2a, 3a, Tripulacao)
# 'Sex' = sexo (Male, Female -> homem, mulher
# 'Age' = faixa etaria (Child, Adult -> crianca, adulto)
# 'Survived' = se sobreviveu (Yes, No -> sim, nao)
# 'Freq' = numero de passageiros em cada categoria

# TABELAS DE FREQUENCIA COM E SEM PONDERACAO
# Execute os dois comandos abaixo 
freq(titanic.df$Class)
freq(titanic.df$Class, weights = titanic.df$Freq)

# PERGUNTA: 
# Por que eh necessario ponderar pela frequencia como no segundo comando? 
# RESPOSTA: 
# Porque os dados estao agregados por categorias e as frequencias estao em uma coluna.

# PERGUNTA: 
# Qual a categoria com maior percentual de pessoas? 
# RESPOSTA: 
# Tripulacao

# GRAFICO DE BARRAS
# Faca um grafico de barras com a distribuicao RELATIVA de sobreviventes por classe.
# DICA: veja os slides 28 e 29 da aula 05, mas nao se esqueca de incluir os pesos. 
Class_pct.df <- freq(titanic.df$Class, weights = titanic.df$Freq) %>% tb(na.rm = TRUE)
qplot(data = Class_pct.df, x = Class, y = pct, geom = 'col')

# TABELA CRUZADA
# Faca duas tabelas cruzadas de 'Class' com 'Survived': uma somando 100% nas colunas e 
# outra somando 100% nas linhas. Nao se esqueca de ponderar pelos pesos.
with(titanic.df, ctable(x = Class, y = Survived, weights = Freq, prop = 'r'))
with(titanic.df, ctable(x = Class, y = Survived, weights = Freq, prop = 'c'))

# PERGUNTA: 
# Qual categoria de Class teve o maior percentual de sobreviventes? Qual foi esse percentual? 
# RESPOSTA
# 1a Classe, com 62.5%

# PERGUNTA:
# Entre os que morreram, qual categoria de Class foi mais numerosa? Com qual percentual? 
# RESPOSTA
# Tripulacao, com 45.2%


# 03. CRIMES NOS ESTADOS DOS EUA ----------------------#
# O data frame 'crimes.df' contem estatisticas de prisoes para os 50 estados americanos em 1973. 

# DICIONARIO
# 'Murder' = taxa de prisoes por homicido (por 100,000 habitantes)
# 'Assault' = taxa de prisoes por agressao (por 100,000 habitantes)
# 'Rape' = taxa de prisoes por estupro (por 100,000 habitantes)
# 'UrbanPop' = percentual da populacao que vive em areas urbanas

# CRIANDO COLUNA COM O NOME DOS ESTADOS
# Para comecar, vamos transformar os nomes das linhas em uma coluna chamada 'states'
crimes.df <- rownames_to_column(crimes.df, var = 'states')

# MEDIA, MEDIANA E DESVIO PADRAO
# Calcule a media, mediana e desvio padrao das variaveis quantitativas
crimes.df %>% descr(stats = c('mean', 'med', 'sd'))

# NOVA VARIAVEL
# Crie uma variavel logical com valor TRUE se UrbanPop estiver acima da mediana
# e FALSE caso esteja abaixo. 
crimes.df <- crimes.df %>% mutate(muito_urbanizado = UrbanPop > median(UrbanPop))

# MEDIA, MEDIANA E DESVIO PADRAO
# Produza tabela com o numero de estados, a media de UrbanPop pelas categorias da variavel
# criada acima
crimes.df %>% group_by(muito_urbanizado) %>% descr(UrbanPop, stats = c('n.valid', 'mean'))
# Agora calcule a mediana, mediana e desvio padrao de Murder, Assault e Rape pelas categorias
# dessa variavel
crimes.df %>% group_by(muito_urbanizado) %>% select(Murder, Assault, Rape) %>% descr(stats = c('mean','med','sd'))

# PERGUNTA
# Estados mais urbanizados eram MAIS ou MENOS violentos que estados nao urbanizados? 
# RESPOSTA:
# Mais violentos para as tres variaveis.
                                  
# CORRELACAO
# Qual a correlacao entre as taxas de homicidio, agressao e estupro? 
crimes.df %>% select(Murder, Assault, Rape) %>% cor()

# PERGUNTA:
# As tres correlacoes sao positivas ou negativaS? O que isso significa?
# RESPOSTA:
# Todas sao positivas e relativamente fortes, acima de 0.5. Isso significa que
# estados com maior taxa de homicidios tambem tem maiores taxas de agressao e estupro.

# HISTOGRAMA
# Faca histogramas da taxa de homicidio com 5, 10 e 15 bins
qplot(data = crimes.df, x = Murder, geom = 'histogram', bins = 5)
qplot(data = crimes.df, x = Murder, geom = 'histogram', bins = 10)
qplot(data = crimes.df, x = Murder, geom = 'histogram', bins = 15)

# PERGUNTA
# QUal dos tres graficos acima eh o seu preferido? Por que? 
# RESPOSTA
# Prefiro o de 15 bins, pois mostra um padrao sem simplificar excessivamente.

# DENSIDADE
# Faca um grafico de densidade kernel para homicidios 
qplot(data = crimes.df, x= Murder, geom = 'density', bw = 1)

# SCATTER PLOT
# Faca um scatter plot da taxa de urbanizacao no eixo X e da taxa de homicidos no eixo Y,
# depois calcule a correlacao entre ambas
qplot(data = crimes.df, x = UrbanPop, y = Murder, geom = 'point')
crimes.df %>% select(UrbanPop, Murder) %>% cor()

# PERGUNTA: 
# Qual o grau de correlacao linear entre as variaveis? Em termos descritivos, o que isso implica? 
# RESPOSTA
# Correlacao de 0.07, bem fraco. Nao ha nenhuma relacao linear bivariada aparente entre ambas. 


# 04. TEMPESTADES -------------------------------------#
# O data frame 'tempestades.df' contem uma amostra de tempestades atlanticas
# entre 1975 e 2020

# DICIONARO
# 'name' = nome da tempestade
# 'year', 'month', 'day', 'hour' = data de mensuracao
# 'lat', 'long' = latitude e longitude
# 'status' =  Tropical Depression, Tropical Storm ou Hurricane (Depressao Tropica, Tempestade Tropical, Furacao)
# 'category' = intensidade da tempestade, entre -1 (mais fraco) e 4 (furacao mais forte)
# 'wind' = velocidade maxima do vento em nós
# 'pressure' = pressao no centro da tempestade, em milibars
# 'tropicalstorm_force_diameter'= diametro em milhas nauticas da area afetada por ventos de 34 nós ou mais
# 'hurricane_force_diameter'= diametro em milhas nauticas da area afetada por ventos de 64 nós ou mais

# FILTRANDO E CONDENSANDO OS DADOS
# A partir de 'tempestades.df', crie um novo dataframe 'furacoes.df' a partir das seguintes etapas:
# a) Filtre o dataframe de tempestades para manter SOMENTE os furacoes (ver variavel status)
# b) Calcule o valor medio de 'wind' e 'pressure' e o valor maximo de 'category' para cada furacao
# Observe que cada furacao sera uma linha no novo dataframe, que tera as colunas wind, pressure e category
furacoes.df <- 
  tempestades.df %>% 
    filter(status == 'hurricane') %>% 
      group_by(name) %>%
        summarise(wind = mean(wind), 
                  pressure = mean(pressure), 
                  category = max(as.numeric(category)))

# FACTOR
# Converta a variavel 'category' em FACTOR com as.factor()
furacoes.df$category <- as.factor(furacoes.df$category)

# N.VALID, MEDIA, DESVIO PADRAO, MEDIANA, MINIMO E MAXIMO
# Calcule essas estatisticas para as variaveis wind e pressure
furacoes.df %>% select(wind, pressure) %>% descr(stats = c('n.valid','mean','sd','med', 'min', 'max'))
# Agora calcule essas estatisticas por categoria de furacao
furacoes.df %>% select(category,wind, pressure) %>% 
  group_by(category) %>% descr(stats = c('n.valid','mean','sd','med', 'min', 'max'))

# PERGUNTA
# Qual a razao entre a mediana de wind da categoria 7 e da categoria 3? 
# RESPOSTA:
print(105.11 / 68.68)

# PERGUNTA: o que isso significa? 
# RESPOSTA
# O furacao 'tipico' da categoria 7 tem ventos mais de 50% mais fortes do que da categoria 3

# PERCENTIS 10, 25, 75 e 90
# Calcule os percentis acima para a variavel wind
furacoes.df %>% select(wind, pressure) %>% summarise(p10 = quantile(wind, prob = .10),
                                                     p25 = quantile(wind, prob = .25),
                                                     p75 = quantile(wind, prob = .75),
                                                     p90 = quantile(wind, prob = .90))

# BOX PLOT
# Faca um box plot da variavel 'wind' pelas categorias da variavel 'category'
qplot(data = furacoes.df, x = category, y = wind, geom = 'boxplot')
# Faca um box plot da variavel 'pressure' pelas categorias da variavel 'category'
qplot(data = furacoes.df, x = category, y = pressure, geom = 'boxplot')

# PERGUNTA
# A comparacao entre os dois box plot sugere que tipo de correlacao entre wind e pressure? 
# RESPOSTA
# Correlacao negativa forte. 

# CORRELACAO
# Calcule entao a correlacao entre wind e pressure.
cor(furacoes.df$wind, furacoes.df$pressure)

# SCATTER PLOT
# Faca um scatter plot entre wind (eixo x) e pressure (eixo y) para furacoes da categoria 4 ou superior
furacoes4mais.df <- furacoes.df %>% filter(as.numeric(category) >= 4)
qplot(data = furacoes4mais.df, x = wind, y = pressure, geom = 'point')
