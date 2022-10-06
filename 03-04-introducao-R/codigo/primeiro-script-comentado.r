#------------------------------------------------------#
# AULA 03. MANIPULACAO DE DADOS NO R 
# Primeiro script de R 
#------------------------------------------------------#
# Pedro H. G. Ferreira de Souza
# 16/setembro/2022
#------------------------------------------------------#


# PARTE 1. OBTENDO A ESTRUTURA DE PASTAS --------------#

# O objetivo dessa primeira parte eh fazer um exercicio pratico para acostumar voces ao R,
# em especial quanto a funcoes, objetos e sintaxe. No exercicio, vamos usar comandos que 
# retornarao como output a estrutura da pasta de trabalho do projeto.

# 01. Instalacao de pacotes 
# Essa instalacao so precisa ser feita uma vez. Como eu ja tinha instalado os dois pacotes,
# coloquei o simbolo '#' na frente do codigio. Dessa forma, o R sabe que nao eh para executa-lo
# install.packages(c("here", "fs")) 
  
# 02, Carregando os pacotes
# Agora vamos carregar os pacotes nas duas linhas abaixo. Cada pacote tem que ser carregado
# separadamente. Repare que tambem podemos colocar comentarios (comecando com '#') APOS os
# comandos, na mesma linha
library(fs)     # cada pacote precisa ser
library(here)   # carregado separadamente


# 03. Testando funcoes nativas do R.
# Para evitar problemas no futuro, queremos nos assegurar que a pasta de trabalho do R de fato
# eh a pasta de trabalho do projeto. Vamos primeiro usar as funcoes nativas getwd() e setwd()
# para obter e depois alterar a pasta atual do R
getwd() 
setwd("c:")
getwd()
 
# 04. Usando o pacote 'here' para obter a pasta de trabalho
# Em vez das funcoes originais, eu prefiro usar o pacote 'here', porque eh mais automatico e 
# mais facil para usuarios de outros sistemas operacionais. Ao ser carregado, o pacote grava 
# a pasta de trabalho designada ao projeto, que pode ser obtida novamente pela funcao here()
here()

# 05. Salvando o caminho da pasta de trabalho em um objeto
# No R tudo pode ser transformado em objeto para ser manipulado depois. Por exemplo, vamos
# salvar o caminho da pasta de trabalho em um objeto do tipo CHARACTER (ou seja, texto). 
# Depois, vamos investigar os atributos do objeto com as funcoes class() e str()
pasta_do_projeto <- here()
pasta_do_projeto
class(pasta_do_projeto)
str(pasta_do_projeto)

# 06. Usando um objeto como input de outras funcoes
# So para fins didaticos, vamos designar o conteudo do objeto pasta_do_projeto como caminho
# para o R usando a funcao setwd(). Repare como os dois comandos abaixo sao equivalentes:
setwd(pasta_do_projeto)
setwd(here())

# 07. Obtendo a estrutura de pastas com a funcao dir_tree() do pacote 'fs'
# A funcao dir_tree() nos da a estrutura de determinada pasta. Repare que os dois comandos
# abaixo sao identicos
dir_tree(here())
dir_tree(pasta_do_projeto)

# 08. Outra forma de usar funcoes de pacotes
# Tambem podemos chamar as funcoes de um pacote ja instalado usando pacote::funcao(). Nesse 
# caso, nao precisamos pre-carregar o pacote usando library(), o que pode poupar memoria em alguns
# casos. Nesse momento, recomendo que voces sempre pre-carreguem as funcoes. 
fs::dir_tree(here())
fs::dir_tree(pasta_do_projeto)

# 09. Versao rapidinha
# Na pratica, podemos condensar tudo das etapas 01 a 08 nos comandos abaixo:
library(fs)
library(here)
fs::dir_tree(here())



# PARTE 2. OBJETOS ------------------------------------#

# 01. O R tem cinco tipos de classes 'atomicas' de objetos, que sao os elementos mais basicos com que
# a linguagem trabalha: character, integer, numeric, complex, e logical. Vamos examina-los em 
# seguida, mas antes perceba que as regras para nomear os objetos se aplicam a todos os tipos:
#   a) O R eh case-sensitive, diferenciando entre maiusculas e minusculas. 
#   b) Nomes de objetos nao podem conter espacos, somente letras, numeros, _ e . 
#   c) Nomes de objetos nao podem comecar com numeros nem _ nem .
#   d) Evite usar acentos nos nomes de objetos para evitar problemas de encoding
#   e) De nomes intuitivos aos objetos


# 02. Objetos da classe CHARACTER sao objetos de texto
# Para cria-los precisamos sempre usar aspas simples ou duplas, como no exemplo abaixo, que, 
# quebra, mostra como nomes nao intuitivos sao confusos
suco <- "Coca-cola"
print(suco)
class(suco)
str(suco)
agua <- 'Pepsi'
print(agua)
class(agua)
str(agua)
# A funcao paste() concatena objetos do tipo character
concatenando <- paste(suco, agua, sep = " ou ")
print(concatenando)
print(paste(concatenando, "?", sep = ""))
# Acentos as vezes sao lidos erroneamente pelo R por problemas de 'encoding', ou seja, 
# da forma como os simbolos graficos sao associados a bits e bytes. Ha funcoes para corrigir
# isso, mas eu prefiro evitar uso de acentos em scripts. Veja o exemplo abaixo:
bebida <- paste(suco, "é muito melhor", sep = " ")
print(bebida)
Encoding(bebida) <- "latin1"
print(bebida)
# Para usar aspas dentro de um objeto character, o jeito mais facil eh alternar entre aspas
# simples e aspas duplas. No exemplo abaixo, alem disso, mostro como o R eh case-sensitive,
# diferenciando maiusculas de minusculas
Suco <- "O lobo 'ama' o bolo."
SUCO <- 'O lobo "ama" o bolo.'
print(suco)
print(Suco)
print(SUCO)
# Por fim, repare que o uso de aspas torna qualquer input em texto, ou seja, tudo vira objeto
# character. No exemplo abaixo, tambem mostro como eh possivel combinar letras e numeros e 
# simbolos no nome de objetos, e como eh ruim usar nomes pouco intuitivos
xpto42_alfa.0 <- "1982"
print(xpto42_alfa.0)
class(xpto42_alfa.0)
outro.exemplo.ch <- "TRUE"
class(outro.exemplo.ch)
  
  
# 03. Objetos das classes INTEGER, NUMERIC e COMPLEX sao numeros
# A diferenca entre eles eh simples: INTEGERs sao numeros inteiros, NUMERIC sao numeros racionais
# (gravados com precisao double) e COMPLEX sao numeros complexos como a raiz quadrada de -1. Como
# esses ultimos quase nunca aparecem em analise de dados, vou so falar dos dois primeiros.
# Numeros inteiros sao gravados como INTEGER quando acrescentamos o sufixo L e como NUMERIC sem o sufixo
# A diferenca entre os dois tipos o espaco em memoria ocupado.
a <- 2022L
b <- 2022
str(a)
str(b)
# O que acontece quando tentamos criar um objeto NUMERIC nao inteiro como INTEGER? Nada, o R ignora
# gera um objeto numeric
c <- 1.81L
d <- 1.81
str(c)
str(d)
# Podemos usar expressoes para criar objetos tambem. No exemplo abaixo, observe como os novos objetos
# substituem os objetos que ja criamos:
a <- (1 + 2 + sqrt(9) + (4/2)^2 + (26 %/% 5) + 27 %% 7) * 2
b <- a^(-1)
str(a)
str(b)


# 04. Objetos da classe LOGICAL
# Objetos LOGICAL sao os operadores booleanos de verdadeiro ou falso (TRUE/FALSE). O exemplo mais 
# simples, mas pouco util, eh quando criamos algo ja diretamente como TRUE ou FALSE. No exemplo abaixo,
# repare tambem como o uso de aspas muda o tipo de objeto
nome_aleatorio <- TRUE
print(nome_aleatorio)
str(nome_aleatorio)
class(nome_aleatorio)
nome_aleatorio_com_aspas <- "TRUE"
print(nome_aleatorio_com_aspas)
str(nome_aleatorio_com_aspas)
class(nome_aleatorio_com_aspas)
# Objetos LOGICAL sao muito mais uteis quando obtidos a partir de... operacoes logicas. Para isso, 
# podemos usar os operadores de costume como >, >=, <, <= e !=, bem como & e | para denotar, 
# respectivamente, "e" e "ou"
nome_aleatorio <- nome_aleatorio == FALSE
print(nome_aleatorio)
print(a)
print(b)
teste1 <- a >= b & a > 0  # avalia se 'a' eh maior ou igual a b E maior do que 0
str(teste1)
teste2 <- a != b | b < 0 # avalia se 'a' eh diferente de b OU se b eh menor do que 0
str(teste2)
# As funcoes nativas is.* sao funcoes que retornam objetos LOGICAL. Elas pegam algum outro 
# objeto ou expressao como input e avaliam se o input eh de uma classe especifica. Por exemplo:
is.character("vamos que vamos")
is.character(42)
teste_ch <- is.character("vamos que vamos")
str(teste_ch)
ddd.df <- "061"
is.numeric(ddd.df)
is.logical(ddd.df)
is.character(ddd.df)


# 05. Conversao entre classes de objetos
# As funcoes nativas as.* sao funcoes que tomam um objeto como input e tentam converte-lo 
# para alguma outra classe. Podemos, por exemplo, converter numeros gravados como character
# em objetos do tipo numeric. 
# Tome cuidado para nao ser enganado pelo str(): no exemplo abaixo parece que ele converteu
# para integer nos dois casos, mas eh so a forma de exibicao mesmo:
as.integer("2022.5")
str(as.integer("2022.5"))
class(as.integer("2022.5"))
as.numeric("2022.5")
str(as.numeric("2022.5"))
class(as.numeric("2022.5"))
as.numeric(ddd.df)
as.integer(ddd.df)
# Evidentemente, voce vai ter mensagem de erro se tentar algo do tipo:
as.numeric("texto")
# Por outro lado, todos os formatos podem ser convertidos para character
str(as.character(42))
str(as.character(3.14))
str(as.character(TRUE))
# A conversao para objetos LOGICAL eh pouco intuitiva: se o objeto for numerico, entao
# ele passa a ser FALSE se for igual a zero e vira TRUE para qualquer outro valor:
str(as.logical(0))
str(as.logical(-0.1))
str(as.logical(0.1))
# Se o objeto for character, ele so eh convertido se o texto for TRUE ou FALSE. Caso contrario, vira NA. 
str(as.logical("TRUE"))
str(as.logical("texto"))

# 06. Erros NA e Inf
# NA sao valores ausentes, desconhecidos ou disponiveis; basicamente, eh quando algo da errado e nao eh
# possivel atribuir qualquer valor ao objeto criado. Por exemplo:
as.numeric("ih, rapaz, danou-se")
as.numeric("TRUE")
as.logical("piracicaba")
10 + "oito"
2 + "dois"
# Todas as operacoes com um objeto NA retornam NA, inclusive se voce perguntar se NA eh igual a si mesmo!
NA > 10
(1 + NA) > 0
NA == NA
# Para testar se algum objeto ou valor eh NA, use a funcao is.na(), que retorna um objeto LOGICAL
is.na(NA)
is.na(agua)
is.na(ddd.df)
# Inf é o infinito (positivo ou negativo). Mas, nesse caso,  eh possivel fazer algumas operacoes com ele,
# mas os algumas operacoes logicas.
1/0
(1/0) > 0
(1/0) + 1
(1/0) == Inf
# Podemos usar as funcoes is.finite() e is.infinite() para avaliar logicamente se um objeto tem valor valido
is.finite(1/0)
is.infinite(1/0)
# Essas funcoes tambem pode ser usadas em objetos de outras classes, mas tome cuidado:
is.finite("3")
is.infinite("1/0")


# 07. Gerenciando o workspace
# Criamos um montao de objetos ate agora: repare como a janela de Environment esta cheia. A funcao
# nativa ls() ajuda a gerenciar todos os objetos criados -- ela nao precisa de nenhum input, e retorna
# como output uma colecao de objetos character (veremos mais sobre isso adiante):
ls()
lista_de_objetos <- ls()
class(lista_de_objetos)
str(lista_de_objetos)
# Muitas vezes, desejamos limpar o workspace, jogando fora os objetos que nao vamos mais usar. Podemos
# fazer isso para liberar memoria (cada objeto ocupa memoria, mas no nosso caso isso nao eh problema
# porque todos os objetos sao muito simples) ou simplesmente para dar uma organizada no nosso trabalho.
# A funcao nativa rm() remove objetos do workspace. Ela toma como input ou o nome de UM objeto ou uma
# lista de objetos (veremos mais sobre listas adiante)
# Por exemplo, vamos jogar fora o objeto ddd.df:
print(ddd.df)
rm(ddd.df)
print(ddd.df)
# Combinando as funcoes ls() e rm() podemos limpar completamente o workspace:
rm(list = ls())
ls()


