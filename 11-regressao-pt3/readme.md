

# Aula 11. Regressão linear, Parte 3

Atualizado em 30/nov/2022

Aula em 12/dez/2022

<br>

## Leituras

### Obrigatórias 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Agresti 2018, cap. 9 a 10](leituras/agresti-2018-cap9e10.pdf)


### Optativas

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Bussab e Morettin 2010, cap. 16](leituras/bussab-morettin-2010-cap16.pdf)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Huntington-Klein 2022, cap. 13](leituras/Huntington-Klein-2022-cap13.pdf)
<br>

## Slides
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [pdf para download](slides/MQ_2022_Aula_11.pdf)

<br> 

## Dados

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Dados da PNAD 2021](dados/pnadc2021_limpa.csv) 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Dados para a Atividade #6 (Swiss)](dados/swiss.csv) 
 
<br>

## Observações

Para ler arquivos ```.csv``` no R, faça o seguinte: 

 - Baixe o arquivo e salve em alguma pasta no seu computador: por exemplo, ```c:\mestrado\aula11\swiss.csv```
 - Diga para o R onde está o arquivo, usando o comando ```file.path```: por exemplo, ```local <- file.path('c:', 'mestrado', 'aula11', 'swiss.csv')
 - No R, carregue o pacote ```readr``` na memória e execute: ```swiss <- read_csv(local)```
 
 
<br>







