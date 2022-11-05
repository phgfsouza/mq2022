#------------------------------------------------------#
# ATIVIDADE #3. Manipulacao de dados no R
# Script com modelo para atividade
#------------------------------------------------------#


# INSTRUÇÕES ------------------------------------------#
# Para responder aos exercicios abaixo, simplesmente substituam 
# as reticencias (...) pelas funcoes e expressoes adequadas e, de
# preferencia, adicionem comentarios na mesma linha, apos o simbolo
# '#' explicando o objetivo de cada linha
# Se nao souberem responder a algum topico, por favor acrescentem um 
# comentario explicando sua duvida. 
#
# A pontuação será atribuída da seguinte forma:
#   A parte 01 vale até 10 pontos
#   A parte 02 vale até 50 pontos
#   A parte 03 vale até 40 pontos
#
# Boa sorte!
#------------------------------------------------------#



# 01. PREPARAÇÃO --------------------------------------#

# Para iniciar, limparemos o workspace, apagando os objetos carregados
rm(list = ...)    #

# Crie um vetor com a forma abaixo para identificar seu nome e email
aluno <- c(... , ...)   #
names(aluno) <- c('nome', 'email')  
print(aluno)

# Instale (se necessário) e carregue os pacotes: 'tidyverse' e 'gapminder'
#install.packages(c('tidyverse', 'gapminder'))
library(...)    #
library(...)    #


# 02. MANIPULAÇÃO DE DADOS DO GAPMINDER ---------------#

# Crie o data frame abaixo a partir do pacote gapminder
gapminder.df <- gapminder

# Verifique as caracterististicas de 'gapminder.df' com str, class e dim
...(...)      #
class(...)    #
...(...)      #

# Imprima no console as 15 primeiras linhas do data frame
...(..., ...)     #

# Adicione uma coluna ao gapminder.df com o PIB total em bilhoes de dolares. 
# Ou seja, multiplique o PIB per capita (gdpPercap) pela populacao (pop) e 
# divida o resultado por 1 bilhao.
gapminder.df <- 
  gapminder.df %>% 
    mutate(gdpTotal = ...)    #

# Use summarise() e group_by() para ver a soma do PIB total por continente em 2007:
gapminder.df %>%
  filter(year == 2007) %>%
    group_by(continent) %>%
      summarise(pib_continental = sum(gdpTotal))

# Seguindo os moldes acima, crie um objeto continentes.df que sera um data frame com uma linha 
# por continente e colunas para todos os anos, populacao total em milhoes e pib total em bilhoes. 
# Dica: é para usar o group_by por continente e ano, e nao usar o filter. 
continentes.df <-
  ... %>%     #
    group_by(...) %>%
      summarise(popTotal = ...,   #
                gdpTotal = ...)   #

# Crie uma variavel em continentes.df com o PIB per capita continental. 
# Dica: nao se esqueca de converter populacao e pib total de volta para as unidades originais. 
continentes.df <-
  ... %>%     #
    ...(gdpPercap = ... / ...)    #

# Crie uma variavel em continentes.df do tipo logical, que assume valor TRUE se o PIB per capita
# em um dado ano for o maior da serie para cada continente e FALSE caso não seja. 
# Dica: use group_by e mutate com a funcao max().
continentes.df <-
  continentes.df %>%
    ...(continent) %>%    #
      mutate(maior_gdpPercap = ...)   #

# Repita o exercicio acima, mas agora crie uma variavel logical para o MENOR PIB per capita
continentes.df <-
  ... %>%   #
    ...(...) %>%    #
      ...(menor_gdpPercap = ...)    #

# Crie um novo dataframe (com qualquer nome) incluindo somente as linhas de continentes.df em que
# cada continente teve o maior ou o menor PIB per capita da serie. O data frame devera ter apenas
# tres colunas: continent, year e gdpPercap.
# Dica: use a funcao filter e as variaveis que criamos acima e depois a funcao select.
... <-      #
  ... %>%   #
    filter(...) %>%   #
      ...(..., ..., ...)    #

# Imprima o objeto. Como se pode ver, em todos os casos o PIB per capita minimo foi em 1952
# e o maximo, em 2007. 
print(...)    #

# Qual continente teve a maior taxa de crescimento? Para saber, vamos criar novo dataframe com cinco 
# linhas (uma por continente) e apenas duas colunas: continente e a taxa de crescimento. 

# Como calcular essa taxa? É facil. Seja X = (renda final / renda inicial) e Y = (ano final - ano inicial),
# a formula é  TX = X^(1/Y). Para expressá-la em porcentagem, é só fazer TX = (TX - 1) * 100
# O codigo abaixo calcula o resultado: 
# Dica: use as funcoes min() e max() no mutate para obter valores iniciais e finais. 
taxascresc.df <-
  ... %>%     #
    group_by(...) %>%   #
      ...(renda_final_sobre_inicial = ... / ...),     #
             ano_final_menos_inicial = ... - ...,     #
             taxacresc = ...,     #
             taxacresc_pct = (... - 1)*100) %>%       #
      summarise(taxacresc_pct = ...)      #

# Por fim, vamos só ordenar nosso último objeto em ordem decrescente da taxa de crescimento
# Dica: use o arrange
taxascresc.df <- taxascresc.df %>% ...    #

# Use print para imprimir taxascresc.df no console
...   #

# Qual continente cresceu mais rapido? Preencha o objeto abaixo com a resposta
quem_cresceu_mais_rapido <- as.character(...$continent[...])   # 



# 03. MANIPULAÇÃO DE DADOS DOS ESTADOS ---------------#

# O R ja vem com dados pre-instalados. Vamos usar agora um deles: 
data(state)

# Observe que o comando acima criou varios objetos: cinco vetores separados e uma matriz. Vamos 
# transformar a matriz e um dos vetores em um dataframe:
states.df <- data.frame(state.x77)
states.df <- states.df %>% cbind(region = state.region)

# O dataframe states.df tem informacoes sobre os 50 estados americanos nos anos 1970.
# Imprima as ultimas 12 linhas do dataframe.
...

# Verifique as caracterististicas do dataframe com os comandos glimpse, class e dim
...
...
...

# O objetivo do exercicio é criar um banco de dados agregados por regiao (ou seja, com quatro linhas)
# e com as seguintes colunas: 
# a) pct_da_pop_total = % da populacao americana que vivia em cada regiao
# b) densidade = populacao total da regiao dividida pela area (em km2)
# c) expectativa de vida media de cada regiao (em anos)
# d) numero de estados em cada regiao

# Nao é tão simples quanto parece. Observe que:
# i. A variavel 'Area' esta em milhas quadradas e, portanto, precisa ser convertida para km2. Para isso, 
# multiplique o valor por 2.59. 
# ii. A variavel 'Population' esta em milhares e, portanto, precisa ser multiplicada por mil. 
# iii. É preciso calcular a média ponderada da expectativa de vida por regiões, pois as populações dos 
# estados são diferentes. Para isso, podemos usar a funcao weighted.mean()
# iv. Para obter o numero de linhas por regiao, podemos usar a funcao n(). 

# É possível fazer o procedimento com um unico comando, encadeando instrucoes por meio do pipe. 
# Observe que, no final, vamos ordenar o banco pelo numero de estados.
# Preencha as lacunas abaixo: 
regioes.df <-
    ... %>%
      mutate(pct_da_pop_total = Population / ...) %>%
        group_by(...) %>%
          summarise(pct_da_pop_total = ...,
                    densidade = ...,
                    expvida = ..., 
                    estados = ...) %>%
            arrange(...)
  
# Responda, preenchendo as lacunas abaixo:
regiao_com_menor_densidade <- filter(..., densidade == ...)$region[1]
print(regiao_com_menor_densidade)



