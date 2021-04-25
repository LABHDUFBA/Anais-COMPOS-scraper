#########################################################################
###  Projeto de script para web scraping da pagina de Anais da COMPÓS ###
###                               LABHDUFBA                           ### 
###                Leonardo Nascimento e Tarssio Barreto              ###    
#########################################################################
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
### Colando link básico do site compos nos links dos encontros
links_enc <- paste0("https://www.compos.org.br/", links_enc, "")
### Criandos links para os GTs
links_gts <- gsub("menu_anais.php", "anais_texto_por_gt.php", links_enc)
### Criando um data-frame vazio para os links
df <- data.frame()
### Função de para clicar nos elementos
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
  ### encontros
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

### Salvando a a base de dados
write.csv(df, "compos.csv")
saveRDS(df, "compos.RDS")
### Download em Massa
links <- df$links

for (url in links) {
  newName <- paste(format(Sys.time(), "%Y%m%d%H%M%S"), "-", basename(url), sep =" ")
  download.file(url, destfile = newName, mode="wb")
}

df <- readRDS("compos.RDS")
titulo <- df$titulo
titulo <- gsub("\\:|\\?|\\/|*|ñ|\\(|\\)|\"|'", "", titulo)


### Renomenando em massa
oldNames<-list.files(".") #some argument here
newNames <- titulo
for (i in 1:length(oldNames))file.rename(oldNames[i],newNames[i])

oldNames<-list.files(".") #some argument here
newNames<-paste(sep="",oldNames,".pdf")
for (i in 1:length(oldNames)) file.rename(oldNames[i],newNames[i])




