# Limpeza do ambiente e fechamento de janelas gráficas
rm(list = ls())
graphics.off()

# CARREGAMENTO DOS DADOS (TABELA 2)
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

# FILTRAGEM DOS CANDIDATOS
# Condicoes: Renda < 2.0 e Experiencia >= 10
subconjunto <- subset(dados, Renda < 2.0 & Experiencia >= 10)

# Exibe o subconjunto filtrado
print(subconjunto)

# CALCULO DAS MEDIAS DESCRITIVAS
media_renda <- mean(subconjunto$Renda)
media_exp <- mean(subconjunto$Experiencia)
media_idade <- mean(subconjunto$Idade)
cat("Renda media:", round(media_renda,3),
    "Experiencia media:", round(media_exp,2),
    "Idade media:", round(media_idade,1), "\n")

# DISTRIBUICAO POR NACIONALIDADE
contagem <- table(subconjunto$Nacionalidade)
print(contagem)