## Pacotes necessários
library(RSelenium)
library(tidyverse)
library(rvest)

####### Criando um Webdriver(Chromedriver) para o Rselenium
driver <- rsDriver(browser = c("chrome"),
                   # Note bem: uma das maiores fontes de erro 
                   # está na linha abaixo.
                   # o Chromedriver deve estar no PATH e deve
                   # ser a mesma versão instalada em sua máquina
                   # veja isto (https://www.youtube.com/watch?v=dz59GsdvUF8) 
                   #  sobre como instalar e configurar.
                   # Lembre de reiniciar sua máquina depois de
                   # configurar o PATH  
                   chromever="98.0.4758.102",  
                   port = 4447L)

remote_driver <- driver[["client"]]

#### Caso dê erro de porta já em uso execute a linha abaixo
#### ( retirando o "#" da linha)

# system("taskkill /im java.exe /f", intern=FALSE, ignore.stdout=FALSE)

## Acessando o site da Compos
remote_driver$navigate("https://www.friboi.com.br/sustentabilidade/garantia-de-origem/?lang=pt")
########################

df <- data.frame()

# post sif
sif <- remote_driver$findElement(using = 'css selector', "#sif")
sif$sendKeysToElement(list('0042'))
# post date
date <- remote_driver$findElement(using = 'css selector', "#date")
date$sendKeysToElement(list('09/08/2019'))
### Função de para clicar no pesquisar
clica <- function(element){element$clickElement();  Sys.sleep(2);}
webElem <- remote_driver$findElements(using = 'css selector', "#sifSearch")  
clica(webElem[[1]])

