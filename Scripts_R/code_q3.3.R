# Limpeza do ambiente
rm(list = ls())
graphics.off()

# Leitura do arquivo
setwd("C:/Users/DANILO/Downloads")
dados <- read.csv("HW1_bike_sharing.csv", stringsAsFactors = FALSE)

# Atribuição dos níveis descritivos
dados$season <- factor(dados$season,
                       levels = c(1, 2, 3, 4),
                       labels = c("Inverno", "Primavera", "Verao", "Outono"))

dados$weathersit <- factor(dados$weathersit,
                           levels = c(1, 2, 3, 4),
                           labels = c("Céu limpo", "Nublado/Nevoeiro",
                                      "Chuva leve/Neve leve", "Chuva forte/Neve intensa"))

# Cálculo do total de usuários
dados$total_users <- dados$casual + dados$registered

# Média de usuários por estação
media_estacao <- aggregate(total_users ~ season, data = dados, FUN = mean)
media_clima <- aggregate(total_users ~ weathersit, data = dados, FUN = mean)

# Arredondamento
media_estacao$total_users <- round(media_estacao$total_users, 2)
media_clima$total_users <- round(media_clima$total_users, 2)

# Gráficos de barras
par(mfrow = c(1, 2))
barplot(media_estacao$total_users, names.arg = media_estacao$season,
        col = "#4f70b6", border = "gray30",
        main = "Uso medio por estacao",
        ylab = "Numero medio de usuarios")
barplot(media_clima$total_users, names.arg = media_clima$weathersit,
        col = "#ef3640", border = "gray30",
        main = "Uso medio por condicao climatica",
        ylab = "Numero medio de usuarios",
        las = 2)
par(mfrow = c(1,1))