##########################################
# TCC Kelly
# Aleatorização e análise do experimento
# script: Neylson Crepalde
##########################################

library(readxl)
library(dplyr)
library(writexl)

dados = read_xlsx("matriculados_musica_20181.xlsx")

dados$PERÍODO = as.integer(dados$PERÍODO)

head(dados)

turma = dados %>% filter(PERÍODO == 5 | PERÍODO == 4 | PERÍODO == 1 | PERÍODO == 3) %>% 
  filter(`SITUAÇÃO ACADÊMICA` == "Cursando")

set.seed(170)
aleatorizacao = rnorm(nrow(turma))

turma$aleatorizacao = aleatorizacao

selecao = turma %>% arrange(aleatorizacao) %>% select(aleatorizacao, NOME, PERÍODO) %>% 
  mutate(tratamento = c(rep(1, times = nrow(turma)%/%2), rep(0, nrow(turma)%/%2), 0))
#View(selecao)

#nrow(selecao)

# Selecionando mais um caso aleatoriamente para compor a ultima dupla
set.seed(100)
mais_um = selecao %>% sample_n(1)
mais_um

selecao = rbind(selecao, mais_um)

nrow(selecao)
selecao$aleatorizacao[60] = NA
selecao$tratamento[60] = 0
View(selecao)

write_xlsx(selecao, "selecao_duplas_tcc_kelly.xlsx")
