# Limpeza do ambiente
rm(list = ls())
graphics.off()

# Conjunto de dados (Tabela 2)
dados <- data.frame(
  Idade = c(28,34,46,26,37,29,51,31,39,43,58,44,25,23,52,42,48,33,38,46),
  Nacionalidade = c("Italiana","Inglesa","Belga","Espanhola","Italiana","Espanhola",
                    "Francesa","Belga","Italiana","Italiana","Italiana","Inglesa",
                    "Francesa","Espanhola","Italiana","Alema","Francesa","Italiana",
                    "Alema","Italiana"),
  Renda = c(2.3,1.6,1.2,0.9,2.1,1.6,1.8,1.4,1.2,2.8,3.4,2.7,1.6,1.2,1.1,2.5,
            2.0,1.7,2.1,3.2),
  Experiencia = c(2,8,21,1,15,3,28,5,13,20,32,23,1,0,29,18,19,7,12,23)
)

# Calculo das medias por nacionalidade
agrupamento <- aggregate(
  cbind(Renda, Experiencia) ~ Nacionalidade,
  data = dados,
  FUN = mean
)

# Arredondamento dos resultados
agrupamento$Renda <- round(agrupamento$Renda, 2)
agrupamento$Experiencia <- round(agrupamento$Experiencia, 2)
print(agrupamento)

# Identificacao das maiores medias
maior_renda <- agrupamento$Nacionalidade[which.max(agrupamento$Renda)]
maior_exp <- agrupamento$Nacionalidade[which.max(agrupamento$Experiencia)]

cat("Maior renda media:", maior_renda, "\n")
cat("Maior experiencia media:", maior_exp, "\n")


# Configuracoes visuais
par(
  mar = c(5, 5, 4, 2),
  font.lab = 2, cex.lab = 1.2,
  font.main = 2, cex.main = 1.5
)

# Dados para o grafico
bar_data <- t(as.matrix(agrupamento[, c("Renda", "Experiencia")]))
colnames(bar_data) <- agrupamento$Nacionalidade

# Grafico de barras duplo
barplot(
  bar_data,
  beside = TRUE,
  col = c("#4f70b6", "#ef3640"),
  border = "gray20",
  ylim = c(0, max(bar_data) + 5),
  ylab = "Media (Renda em mil euros / Experiencia em anos)",
  main = "Renda media e experiencia por nacionalidade",
  cex.names = 0.9
)

legend(
  "topleft",
  legend = c("Renda media (×10³ €)", "Experiencia media (anos)"),
  fill = c("#4f70b6", "#ef3640"),
  border = "gray20",
  cex = 0.9
)

grid(nx = NA, ny = NULL, col = "gray80", lty = "dotted")