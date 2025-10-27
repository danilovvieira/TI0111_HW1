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

# Calculo do coeficiente de correlacao de Pearson
r <- cor(dados$Experiencia, dados$Renda, method = "pearson")
cat("Coeficiente de correlacao de Pearson:", round(r, 2), "\n")

# GRAFICO DE DISPERSAO
par(
  mar = c(5, 5, 4, 2),
  font.lab = 2, cex.lab = 1.2,
  font.main = 2, cex.main = 1.5
)

plot(
  dados$Experiencia, dados$Renda,
  main = "Correlação entre experiência e renda desejada",
  xlab = "Experiência (anos)",
  ylab = "Renda desejada (mil euros)",
  pch = 19, col = "#4f70b6"
)

# Linha de tendencia linear
abline(lm(Renda ~ Experiencia, data = dados), col = "#ef3640", lwd = 2)

grid(nx = NA, ny = NULL, col = "gray80", lty = "dotted")