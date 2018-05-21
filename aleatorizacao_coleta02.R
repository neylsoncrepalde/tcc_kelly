#### Coleta 02

library(readxl)
library(dplyr)

dados = read_xlsx("coleta02.xlsx", col_names = F)
names(dados) = "nome"

set.seed(17)
dados$random = rnorm(nrow(dados))
dados

dados = dados %>% arrange(random)
dados$tratamento = c(rep(1, nrow(dados)%/%2), rep(0, nrow(dados)%/%2))

dados
