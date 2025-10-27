# Limpeza
rm(list = ls())
graphics.off()

# Dados da Tabela 2
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

# HISTOGRAMAS
par(mfrow = c(2, 3)) # layout 2x3
for (pais in sort(unique(dados$Nacionalidade))) {
  hist(
    dados$Idade[dados$Nacionalidade == pais],
    main = paste("Distribuicao da Idade -", pais),
    xlab = "Idade (anos)",
    col = "lightblue",
    border = "gray40"
  )
}
par(mfrow = c(1,1))

par(mfrow = c(2, 3))
for (pais in sort(unique(dados$Nacionalidade))) {
  hist(
    dados$Renda[dados$Nacionalidade == pais],
    main = paste("Distribuicao da Renda -", pais),
    xlab = "Renda (x10³ euros)",
    col = "lightgreen",
    border = "gray40"
  )
}
par(mfrow = c(1,1))

# BOX-PLOTS COMPARATIVOS
par(mfrow = c(1, 2),
    mar = c(8, 4.8, 3.2, 1.5),   # margem inferior maior
    font.lab = 2, cex.lab = 1.1,
    font.main = 2, cex.main = 1.5,
    cex.axis = 0.9)

# Boxplot da idade por nacionalidade
boxplot(Idade ~ Nacionalidade, data = dados,
        col = "lightblue", border = "black",
        main = "Idade por nacionalidade",
        ylab = "Idade (anos)",
        xlab = "",          # remove o texto "Nacionalidade"
        las = 2)

# Boxplot da renda por nacionalidade
boxplot(Renda ~ Nacionalidade, data = dados,
        col = "lightgreen", border = "black",
        main = "Renda por nacionalidade",
        ylab = "Renda (x10³ euros)",
        xlab = "",          # remove o texto "Nacionalidade"
        las = 2)

par(mfrow = c(1,1))


# GRÁFICO DE BARRAS COM MÉDIAS
agrup <- aggregate(cbind(Idade, Renda) ~ Nacionalidade, data = dados, FUN = mean)
agrup$Idade <- round(agrup$Idade, 1)
agrup$Renda <- round(agrup$Renda, 2)

bar_data <- t(as.matrix(agrup[, c("Idade", "Renda")]))
colnames(bar_data) <- agrup$Nacionalidade

barplot(
  bar_data, beside = TRUE,
  col = c("#4f70b6", "#ef3640"),
  border = "gray30",
  ylim = c(0, max(bar_data) + 5),
  ylab = "Media (Idade em anos / Renda em x10³ euros)",
  main = "Medias de Idade e Renda por nacionalidade",
  cex.names = 0.9
)
legend("topleft",
       legend = c("Idade media", "Renda media (x10³ €)"),
       fill = c("#4f70b6", "#ef3640"),
       border = "gray30", cex = 0.9)
grid(nx = NA, ny = NULL, col = "gray85", lty = "dotted")