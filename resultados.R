###################################
### TCC - Kelly Paiva
### Análise de Dados
### Scipt: Prof. Neylson Crepalde
###################################

library(readr)
library(dplyr)
library(xtable)

dados = read_csv("tcc_kelly_dados.csv")
dados

t.test(dados$nt_afinacao ~ dados$tratamento)
t.test(dados$nt_articulacao ~ dados$tratamento)
t.test(dados$nt_dinamica ~ dados$tratamento)
t.test(dados$nt_diminuendo ~ dados$tratamento)


t1 = t.test(dados$nt_afinacao ~ dados$tratamento, alternative = "less")
t2 = t.test(dados$nt_articulacao ~ dados$tratamento, alternative = "less")
t3 = t.test(dados$nt_dinamica ~ dados$tratamento, alternative = "less")
t4 = t.test(dados$nt_diminuendo ~ dados$tratamento, alternative = "less")


xtable(cbind(c(t1$statistic, t1$parameter, t1$p.value),
             c(t2$statistic, t2$parameter, t2$p.value),
             c(t3$statistic, t3$parameter, t3$p.value),
             c(t4$statistic, t4$parameter, t4$p.value)))

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
t5 = t.test(dados$scores ~ dados$tratamento, alternative = "less")

xtable(cbind(c(t1$statistic, t1$parameter, t1$p.value),
             c(t2$statistic, t2$parameter, t2$p.value),
             c(t3$statistic, t3$parameter, t3$p.value),
             c(t4$statistic, t4$parameter, t4$p.value),
             c(t5$statistic, t5$parameter, t5$p.value)))


