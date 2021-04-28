[![made-with-R](https://img.shields.io/badge/Make%20with-R-blue)](https://www.r-project.org/) [![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)

# Script Anais-COMPOS-Scraper

*Projeto de script para web scraping da página de [Anais da Associação Nacional dos Programas de Pós-Graduação em Comunicação - COMPÓS](https://www.compos.org.br/anais.php) desenvolvido pelo [Laboratório de Humanidades Digitais da UFBA](http://labhd.ufba.br/).*

*O Script Anais-COMPÓS realiza a raspagem dos papers em pdf de toda a Biblioteca com os Anais dos Encontros entre 2000 até 2020 (disponíveis atualmente na site). Além disso, ele gera um base de dados com: edição COMPÓS, nome dos autores, título e link para o pdf.*
___

<center>

**A ferramenta foi desenvolvida apenas para pesquisas acadêmicas, sem fins lucrativos.**

</center>

___

Esse script foi pensado como uma ferramenta metodológica da pesquisa em humanidades digitais. Sua criação é fruto das reflexões e experiências empíricas de pesquisadores de diversas áreas das humanidades que têm enfrentado o [desafio de fazer ciências humanas no mundo digital](http://bibliotecadigital.fgv.br/ojs/index.php/reh/article/view/79933)

[Defendemos a importância da apropriação, uso, desenvolvimento e aprimoramento de ferramentas digitais para as humanidades, assim como a urgência na sofisticação teórica, metodológica e epistemológica sobre as chamadas Humanidades Digitais](https://www.scielo.br/scielo.php?script=sci_arttext&pid=S1517-45222016000100216&lng=en&nrm=iso&tlng=pt)

É crescente o número de repositórios de fontes e dados on-line, assim como o acesso, busca, pesquisa e, muitas vezes, dependência de pesquisadores/as a eles.

Os Encontros da COMPÓS acontecem anualmente como espaço de intercâmbio acadêmico entre os pesquisadores dos vários programas de pós-graduação em comunicação. Eles são estruturados sob a forma de Grupos de Trabalhos (GTs), onde são apresentados e debatidos estudos que buscam refletir sobre o avanço científico, tecnológico e cultural no campo da comunicação.
___

## Índice

- [Instalação](#instalação)
    - [R e RStudio](#ReRSTUDIO)
    - [Libraries](#biblioteca_e_módulos)
    - [Crohme Driver](#crohmedriver)
 - [Resultados](#resultados)
 - [Licença](#licença)


## Instalação

Para executar o Script Anais-Anpuh, você precisa acessar a pasta da ferramenta no [GitHub](https://github.com/LABHDUFBA/Anais-COMPOS-scraper). Clone ou faça download do repositório e salve na pasta que deseja que os resultados e seus respectivos arquivos sejam armazenados. Antes de executar o script, é preciso preparar seu computador, como mostramos abaixo.

### R e RStudio

O R e RStudio são gratuitos e possuem versões para Windows, Mac e Linux.

A instalação é bastante fácil e em geral você apenas tem que seguir as instruções da tela.

Para instalar o R, baixe a versão adequada para seu computador em: [https://cloud.r-project.org/](https://cloud.r-project.org/)

Para instalar o RStudio, baixe a versão adequada para seu computador em: [https://www.rstudio.com/products/rstudio/download/](https://www.rstudio.com/products/rstudio/download/)

Além disso, para ter um ambiente completo de desenvolvimento no R, recomendamos, adicionalmente, instalar:

– MikTex (para Windows:  [http://miktex.org/download](http://miktex.org/download) ou MacTex (para Mac:  [https://tug.org/mactex/downloading.html](https://tug.org/mactex/downloading.html) para relatórios em latex.

– RTools (para Windows: [https://cran.r-project.org/bin/windows/Rtools/](https://cran.r-project.org/bin/windows/Rtools/) ou Xcode com command line tools (para Mac na AppStore do Mac), para criar pacotes, usar C++ com R entre outras  coisas

Após a instalação, vc pode executar o arquivo **compos.R** que está na pasta **R** direto do RStudio.


### Bibliotecas e módulos

Vocêr vai precisar instalar as seguintes bibliotecas: 

1. [RSelenium](https://cran.r-project.org/web/packages/RSelenium/RSelenium.pdf)
2. [tidyverse](https://www.tidyverse.org/)
3. [rvest](https://cran.r-project.org/web/packages/rvest/rvest.pdf)

### Chromedriver

1. [Instruções sobre como instalar o Chromedriver no Windows 10 :](https://www.youtube.com/watch?v=dz59GsdvUF8) 

2. [Instruções sobre como instalar o Chromedriver no Ubuntu :](https://medium.com/@marco.conviccao/configurando-o-chromedriver-no-ubuntu-7baaf2be7c68)


## Resultados

O script retorna para o usuário **todos os pdfs disponíveis em todas as páginas de todos os anais da COMPÓS DE 2000 até 2020**. Os arquivos foram nomeados com o ano e o título do trabalho, então posteriormente podem ser criadas pastas com o nome do evento/ano e alocadas os pdfs em cada uma delas. 


O script também gera um arquivo **CSV** (*comma-separated values*) contendo as seguintes informações para cada paper: Ano, Edição, Nome do GT, Título, Autores, e Link do Arquivo. Esse arquivo pode ser aberto como uma planilha e trabalhado em banco de dados.


O script está funcionando perfeitamente. Qualquer alteração no site percebida pelos usuários ou sugestões de aprimoramento são bem vindas.

## Licença

MIT licensed

Copyright (C) 2021 [Leonardo F. Nascimento](https://github.com/leofn/), [Tarssio Barreto](https://github.com/tarssioesa), [LABHDUFBA](http://labhd.ufba.br/)
