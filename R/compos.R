#########################################################################
###  Projeto de script para web scraping da pagina de Anais da COMPÓS ###
###                               LABHDUFBA                           ### 
###                Leonardo Nascimento e Tarssio Barreto              ###    
#########################################################################
## Pacotes necessários
library(RSelenium)
library(tidyverse)
library(rvest)
####### Craindo um Webdriver Rselenium
driver <- rsDriver(browser = c("chrome"), port = 4446L)
remote_driver <- driver[["client"]]
## Acessando o site da Compos
remote_driver$navigate("https://www.compos.org.br/anais_encontros.php")
########################
### Pegando os links dos encontros
html <- remote_driver$getPageSource()[[1]]
links_enc <- html %>% 
  read_html() %>% 
  html_nodes(xpath = "//label/a") %>% 
  html_attr("href")
encontros <- html %>% 
  read_html() %>% 
  html_nodes(xpath = "//label/a") %>% 
  html_text()
### Colando o endereço básico do site ("https://www.compos.org.br/") 
### da COMPÓS nos links dos encontros
links_enc <- paste0("https://www.compos.org.br/", links_enc, "")
### Criandos links para os GTs
links_gts <- gsub("menu_anais.php", "anais_texto_por_gt.php", links_enc)
### Criando um data-frame vazio para os links
df <- data.frame()
### Função de para clicar nos GTs
clica <- function(element){element$clickElement();  Sys.sleep(2);}
################################################################################
#### Loop para entrar nos GTs dos diferentes encontros, clicar nos diferentes ##
#### GT's e pegar a lista paras os PDF's                                      ##
################################################################################
for (i in 1:21){
  print(links_gts[i])
  url <- links_gts[i]
  Sys.sleep(1)
  remote_driver$navigate(url)
  html1 <- remote_driver$getPageSource()[[1]]
  ### pega o nome dos encontros
  encontros <- html1 %>% 
    read_html() %>% 
    html_nodes(xpath = "//*[@id='divResultado1']/div/h2/text()") %>% 
    html_text()
  Sys.sleep(1)
  webElem <- remote_driver$findElements(using = 'css selector', "h2 > a")  
  for(j in 1:length(webElem)){
    clica(webElem[[j]])
    html <- remote_driver$getPageSource()[[1]]
    ## peha os nomes do GTs
    nome_gt <- html %>% 
      read_html() %>% 
      html_nodes(xpath = "//*[@id='divResultado1']/div/h1") %>% 
      html_text
    ## pega os títulos
    titulo <- html %>% 
      read_html() %>% 
      html_nodes(xpath =  "//label/a") %>% 
      html_text
   ## pega os autores
    autores <- html %>% 
      read_html() %>% 
      html_nodes(xpath =  "//p[2]/text()") %>% 
      html_text
    # pega links em pdf
    links <- html %>% 
    read_html() %>% 
    html_nodes(xpath = "//label/a") %>% 
    html_attr("href")
    ## (repetindo) Encontros
    encontros2 <- rep(encontros, length(links))
    ## (repetindo) Gts
    nome_gt2 <- rep(nome_gt, length(links))
    #    
    df <- rbind(df, cbind(encontros2, nome_gt2, titulo, autores, links))}}


df <- readRDS("./csv e RDS/compos.RDS")
### Renomeando as colunas 
colnames(df)[1] <- "Edição"
colnames(df)[2] <- "Nome do GT"
colnames(df)[3] <- "Título"
colnames(df)[4] <- "Autores"
colnames(df)[5] <- "Links"
### Limpando um pouco a base de dados
edicao <- df$Edição
edicao <- noquote(edicao)
edicao <- gsub("Seja bem-vindo\\(a) aos anais do ", "", edicao)
edicao <- gsub(" - ISSN: 2236-4285", "", edicao)
df$Edição <- edicao
### Salvando a a base de dados coletada
write.csv(df, "./csv e RDS/compos.csv")
saveRDS(df, "./csv e RDS/compos.RDS")
###########################################
#######     Download em Massa   ###########
###########################################
# Gerando links para download
links <- df$links

# Escolhando a pasta de destinio dos arquivos
setwd("./PDFs/")

# Loop para download em massa de todos os links 
for (url in links) {
  newName <- paste(format(Sys.time(), "%Y%m%d%H%M%S"), "-", basename(url), sep =" ")
  download.file(url, destfile = newName, mode="wb")
}
######################################
## Renomeando os arquivos em massa ###
#####################################

# Desabilite o comentário caso não queira ter que baixar tudo novamente 
## df <- readRDS("./csv e RDS/compos.RDS")

## Eliminando símbolos que o windows não aceita
titulo <- df$titulo
titulo <- gsub("\\:|\\?|\\/|*|ñ|\\(|\\)|\"|'", "", titulo)

### Renomenando em massa
oldNames<-list.files(".") #
newNames <- titulo
for (i in 1:length(oldNames))file.rename(oldNames[i],newNames[i])

oldNames<-list.files(".") #
newNames<-paste(sep="",oldNames,".pdf")
for (i in 1:length(oldNames)) file.rename(oldNames[i],newNames[i])




