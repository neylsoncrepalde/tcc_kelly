###################################
### TCC - Kelly Paiva
### Análise de Dados
### Scipt: Prof. Neylson Crepalde
###################################

library(readr)
library(dplyr)

dados = read_csv("tcc_kelly_dados.csv")
dados

t.test(dados$nt_afinacao ~ dados$tratamento)
t.test(dados$nt_articulacao ~ dados$tratamento)
t.test(dados$nt_dinamica ~ dados$tratamento)
t.test(dados$nt_diminuendo ~ dados$tratamento)


t.test(dados$nt_afinacao ~ dados$tratamento, alternative = "less")
t.test(dados$nt_articulacao ~ dados$tratamento, alternative = "less")
t.test(dados$nt_dinamica ~ dados$tratamento, alternative = "less")
t.test(dados$nt_diminuendo ~ dados$tratamento, alternative = "less")


# Tentando com um score único
library(FactoMineR)

res = PCA(dados[4:7], scale.unit = F, ncp = 3)
dimdesc(res = res)
print(res)
summary(res)

scores = res$ind$dist
scores

dados$scores = scores
t.test(dados$scores ~ dados$tratamento)
t.test(dados$scores ~ dados$tratamento, alternative = "less")




