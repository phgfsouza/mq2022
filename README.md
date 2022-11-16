# Mestrado Profissional do Ipea <br> Políticas Públicas e Desenvolvimento <br> Métodos Quantitativos 2022

<br> 

Seja bem-vindo ao repositório central da turma de Métodos Quantitativos de 2022 do MPPPD/Ipea. 

O repositório contém as **versões mais atualizadas do plano de aulas, leituras, slides, scripts e bases de dados** usados em sala de aula. Caso você tenha problemas em carregar alguns dos links para o material de aula, por favor veja diretamente nas pastas acima e faça o download dos arquivos.

**Todas as atividades** (listas de exercícios, trabalhos, provas etc) **serão postadas na página da disciplina no [Google Classroom](http://classroom.google.com)**, como explicado no [programa](programa-completo.pdf). Essas tarefas serão postadas aqui somente **após** o prazo de entrega, junto com o gabarito.


<br>

## Informações gerais

Professor: Pedro H. G. Ferreira de Souza  &nbsp;&nbsp;  [[Lattes](http://lattes.cnpq.br/6550053913880063)] &nbsp;&nbsp; [[Google Scholar](https://scholar.google.com.br/citations?user=OO5-iGcAAAAJ&hl=pt-BR)]

Período: 12 de setembro a 12 de dezembro de 2022

Horário: segundas-feiras, 8h30-12h30

[Programa completo da disciplina](programa-completo.pdf)

<details><summary>Cronograma de aulas</summary>

---
 
| Aula | Data  | Tópico                                               | Aula prática? | Entrega de atividade? |
|------|-------|------------------------------------------------------|---------------|-----------------------|
| 1    | 12/09 | [Fundamentos de análises quantitativas](01-fundamentos/) | Não           | Não               |
| 2    | 19/09 | [Introdução à causalidade](02-causalidade/)              | Não           | Sim               |
| 3    | 26/09 | [Manipulação de dados no R, parte 1](03-04-introducao-R/)   | Sim        | Sim               |
| 4    | 03/10 | [Manipulação de dados no R, parte 2](03-04-introducao-R/)   | Sim        | Não               |
| -    | 10/10 | **AULA CANCELADA**                                   | -                 | Não               |
| 5    | 17/10 | [Estatísticas descritivas no R](05-estatistica-descritiva/) | Sim        | Não               |
| 6    | 24/10 | [Fundamentos de probabilidade](06-probabilidade/)    | Sim           | Sim                   |
| -    | 31/10 | **NÃO HAVERÁ AULA**                                  | -             | Não                   |
| 7    | 07/11 | [Inferência estatística](07-inferencia/)             | Sim           | Sim                   |
| 8    | 14/11 | [Testes de hipóteses](08-testes-hipoteses/)          | Sim           | Não                   |
| 9    | 21/11 | Regressao linear, parte 1                            | Sim           | Sim                   |
| -    | 28/11 | **NÃO HAVERÁ AULA**                                  | -             | Não                   |
| 10   | 05/12 | Regressão linear, parte 2                            | Sim           | Sim                   |
| 11   | 12/12 | Regressão linear, parte 3                            | Sim           | Sim                   |
| -    | 16/12 | **PRAZO PARA ENTREGA DO TRABALHO FINAL**             | -             | Sim                   |
 
---
  
</details>




<br>

## Plano de aulas

<details><summary>01. Fundamentos de análises quantitativas (12/set) </summary>

---
 
Leitura obrigatória

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Babbie 2021, cap. 4](01-fundamentos/leituras/babbie-2021-cap4.pdf)

Leituras optativas

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Babbie 2021, cap. 1](01-fundamentos/leituras/babbie-2021-cap1.pdf)
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Kellstedt e Whitten 2018, p. 1-42](01-fundamentos/leituras/kellstedt-whitten-2018-p1a42.pdf)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [King, Keohane e Verba 1994, cap. 1](01-fundamentos/leituras/king-keohane-verba-1994-cap1.pdf)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Ragin e Amoroso 2011, caps. 1 e 2](01-fundamentos/leituras/ragin-amoroso-2011-cap1e2.pdf)
 
Slides
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [pdf para download](01-fundamentos/slides/MQ_2022_Aula_01.pdf)

Atividade \#1

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Perguntas](01-fundamentos/atividade/atividade01.pdf)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Gabarito](01-fundamentos/atividade/atividade01-gabarito.pdf)

---
  
</details>

<details><summary>02. Introdução à causalidade (19/set) </summary>

---
 
Leituras obrigatórias

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Cunningham 2021, cap. 4](02-causalidade/leituras/cunningham-2021-cap4.pdf) 
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Kellstedt e Whitten 2018, cap. 3](02-causalidade/leituras/kellstedt-whitten-2018-cap3.pdf)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Kellstedt e Whitten 2018, cap. 4](02-causalidade/leituras/kellstedt-whitten-2018-cap4.pdf)

Leitura optativa

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Dowd e Town 2002](02-causalidade/leituras/dowd-town-2002.pdf)

Slides
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [pdf para download](02-causalidade/slides/MQ_2022_Aula_02.pdf)

Atividade \#2

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Perguntas](02-causalidade/atividade/atividade02.pdf)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Gabarito](02-causalidade/atividade/atividade02-gabarito.pdf)
 
---
  
</details>

<details><summary>03 e 04. Manipulação de dados no R (26/set e 03/out) </summary>

---
 
Leituras obrigatórias

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Curso-R, *Ciência de Dados em R*, capítulos 1 a 6 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [[versão web](https://livro.curso-r.com/index.html)] &nbsp;&nbsp; [[pdf completo](https://livro.curso-r.com/livro-curso-r.pdf)] &nbsp;&nbsp; [[pdf para aula](03-introducao-R/leituras/curso-r-livro-cap1a6.pdf)] 


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IBPAD, *Ciência de Dados em R - Introdução*, capítulos 1 a 5 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [[versão web](https://cdr.ibpad.com.br/index.html)] &nbsp;&nbsp; [[pdf completo](https://cdr.ibpad.com.br/cdr-intro.pdf)] &nbsp;&nbsp; [[pdf para aula](03-introducao-R/leituras/ibpad-livro-cap1a6.pdf)] 
 
Leituras optativas

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Roger Peng, *R Programming for Data Science*, capítulos 3 a 6 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [[versão web](https://bookdown.org/rdpeng/rprogdatascience/)] &nbsp;&nbsp; [[pdf completo](https://leanpub.com/rprogramming)] &nbsp;&nbsp; [[pdf para aula](03-introducao-R/leituras/roger-peng-cap3a6.pdf)] 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rafael Irizarry, *Introduction to Data Science*, capítulos 1 a 6  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [[versão web](https://rafalab.github.io/dsbook/)] &nbsp;&nbsp; [[pdf completo](https://leanpub.com/datasciencebook)] &nbsp;&nbsp; [[pdf para aula](03-introducao-R/leituras/rafael-irizarry-cap1a5.pdf)] 
 
Slides
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [pdf para download](03-04-introducao-R/slides/MQ_2022_Aula_03_04.pdf)
 
Material de apoio (scripts, dados e afins)
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [zip para download](03-04-introducao-R/material-apoio.zip)
 
Atividade \#3
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Perguntas](03-04-introducao-R/atividade/atividade03.r)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gabarito em [script de R](03-04-introducao-R/atividade/atividade03-respostas.r) e em [PDF](03-04-introducao-R/atividade/atividade03-respostas.pdf)

---
 
</details>


<details><summary>05. Estatísticas descritivas no R (17/out) </summary>

---
 
Leituras obrigatórias

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Agresti 2018 cap. 3](/05-estatistica-descritiva/leituras/agresti-2018-cap3.pdf)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Bussab e Morettin 2010 caps. 3 e 4](/05-estatistica-descritiva/leituras/bussab-morettin-2010-cap3e4.pdf)
 
Leituras optativas

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Huntington-Klein 2022 caps. 3 e 4](/05-estatistica-descritiva/leituras/huntington-klein-2022-cap3e4.pdf)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Kellstedt e Whitten 2018 cap. 6](/05-estatistica-descritiva/leituras/kellstedt-whitten-2018-cap6.pdf)
 
Slides
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [pdf para download](05-estatistica-descritiva/slides/MQ_2022_Aula_05.pdf)
 
Material de apoio (scripts, dados e afins)
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [zip para download](05-estatistica-descritiva/material-apoio.zip)
 
Atividade \#4
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Perguntas](05-estatistica-descritiva/atividade/atividade04.r)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gabarito em [script de R](05-estatistica-descritiva/atividade/atividade04-respostas.r) e em [PDF](05-estatistica-descritiva/atividade/atividade04-respostas.pdf)

---
 
  
</details>


<details><summary>06. Fundamentos de probabilidade (24/10) </summary>

--- 

Leituras obrigatórias 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Agresti 2018 caps. 2 e 4](06-probabilidade/leituras/agresti-2018-cap2e4.pdf)

Leituras optativas

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Bussab e Morettin 2010 caps. 5 a 8](06-probabilidade/leituras/bussab-morettin-2010-cap5a8.pdf)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Kellstedt e Whitten 2018 cap. 7](06-probabilidade/leituras/kellstedt-whitten-2018-cap7.pdf)

Slides
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [pdf para download](06-probabilidade/slides/MQ_2002_Aula_06.pdf)

---

</details>


<details><summary>07. Inferência estatística (07/11) </summary>

--- 

Leituras obrigatórias 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Agresti 2018 caps. 5](07-inferencia/leituras/agresti-2018-cap5.pdf)

Leituras optativas

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Bussab e Morettin 2010 caps. 10 e 11](07-inferencia/leituras/bussab-morettin-2010-cap10e11.pdf)

Slides
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [pdf para download](07-inferencia/slides/MQ_2002_Aula_07.pdf)

---

</details>



<details><summary>08. Testes de hipóteses (14/11) </summary>

--- 

Leituras obrigatórias 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Agresti 2018 caps. 6](08-testes-hipoteses/leituras/agresti-2018-cap6.pdf)

Leituras optativas

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Bussab e Morettin 2010 caps. 12 e 13](08-testes-hipoteses/leituras/bussab-morettin-2010-cap12e13.pdf)

Slides
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [pdf para download](08-testes-hipoteses/slides/MQ_2022_Aula_08.pdf)

---

</details>

<details><summary>09. Regressão linear, Parte 1 (21/11) </summary>

--- 

Leituras obrigatórias 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Agresti 2018, cap. 9 a 10](09-regressao-pt1/leituras/agresti-2018-cap9e10.pdf)

Leituras optativas

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Bussab e Morettin 2010, cap. 16](09-regressao-pt1/leituras/bussab-morettin-2010-cap16.pdf)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Huntington-Klein 2022, cap. 13](09-regressao-pt1/leituras/Huntington-Klein-2022-cap13.pdf)

Slides
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [pdf para download](09-regressao-pt1/slides/MQ_2022_Aula_09.pdf)

---

</details>
