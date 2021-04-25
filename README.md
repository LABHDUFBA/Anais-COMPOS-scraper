[![DOI:10.13140/RG.2.2.34653.03048](https://zenodo.org/badge/DOI/10.13140/RG.2.2.34653.03048.svg)](https://www.researchgate.net/publication/341804201_Script_Anais-Anpuh)
 [![made-with-R](https://img.shields.io/badge/Make%20with-R-blue)](https://www.r-project.org/) [![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)

# Script Anais-COMPÓS

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

- [Script Anais-COMPÓS](#script-anais-compos)
  - [Índice](#índice)
  - [Instalação](#instalação)
    - [R e RStudio](#ReRSTUDIO)
      - [Libraries](#bibliotecas)
   - [Crohme Driver](#crohmedriver)
  - [Resultados](#resultados)
  - [Licença](#licença)


## Instalação

Para executar o Script Anais-Anpuh, você precisa acessar a pasta da ferramenta no [GitHub](https://github.com/LABHDUFBA/Anais-ComPos). Clone ou faça download do repositório e salve na pasta que deseja que os resultados e seus respectivos arquivos sejam armazenados. Antes de executar o script, é preciso preparar seu computador, como mostramos abaixo.

### R e RStudio

O R e RStudio são gratuitos e possuem versões para Windows, Mac e Linux.

A instalação é bastante fácil e em geral você apenas tem que seguir as instruções da tela.

Para instalar o R, baixe a versão adequada para seu computador em: [https://cloud.r-project.org/](https://cloud.r-project.org/)

Para instalar o RStudio, baixe a versão adequada para seu computador em: [https://www.rstudio.com/products/rstudio/download/](https://www.rstudio.com/products/rstudio/download/)

Além disso, para ter um ambiente completo de desenvolvimento no R, recomendamos, adicionalmente, instalar:

– MikTex (para Windows:  [http://miktex.org/download](http://miktex.org/download) ou MacTex (para Mac:  [https://tug.org/mactex/downloading.html](https://tug.org/mactex/downloading.html) para relatórios em latex.

– RTools (para Windows: [https://cran.r-project.org/bin/windows/Rtools/](https://cran.r-project.org/bin/windows/Rtools/) ou Xcode com command line tools (para Mac na AppStore do Mac), para criar pacotes, usar C++ com R entre outras  coisas

Após a instalação, vc pode executar o arquivo **compos.R** que está na pasta **R** direto do RStudio.

Exemplo de como executar utilizando o terminal do Linux, após instalar o Python3.8:

1. Acesse o diretório em que o arquivo .py está salvo:
   ```sh
   $ cd user/local
   ```
1. Instale as bibliotecas requeridas:
   ```sh
   $ pip3 install -r requirements.txt
   ```
1. Execute o arquivo usando Python3.8
   ```sh
   $ python3.8 script-anais-anpuh.py
   ```


#### Bibliotecas e módulos



## Resultados

O script retorna para o usuário **todos os pdfs disponíveis em todas as páginas de todos os Simpósios Nacionais da Anpuh desde 1963 até 2017**. São criadas pastas com o número de cada evento para o armazenamento dos arquivos em PDF.

<p align="center"><img src="https://github.com/ericbrasiln/Anais-Anpuh/blob/master/images/pastas.png"/></p>

É importante notar que muitos papers não estão com pdf disponível no site, assim como nas edições mais antigas encontramos arquivos que contém vários papers num único PDF.

O script também gera um arquivo **CSV** (*comma-separated values*) contendo os seguintes valores para cada paper: Autor(es)/Instituições,Título, Tipo, Evento, Ano, Link do Arquivo. Esse arquivo pode ser aberto como uma planilha e trabalhado em banco de dados.

![exemplo de csv](images/exemplo-csv.png)

O script está funcionando perfeitamente. Qualquer alteração no site percebida pelos usuários ou sugestões de aprimoramento são bem vindas.

## Licença

MIT licensed

Copyright (C) 2020 [Eric Brasil](https://github.com/ericbrasiln), [Gabriel Andrade](https://github.com/gabrielsandrade), [Leonardo F. Nascimento](https://github.com/leofn/), [Vitor Mussa](https://github.com/vmussa), [LABHD-UFBA](http://labhd.ufba.br/
