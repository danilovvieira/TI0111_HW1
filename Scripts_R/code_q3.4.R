# Limpeza do ambiente
rm(list = ls())
graphics.off()

# Leitura do arquivo
setwd("C:/Users/DANILO/Downloads")
dados <- read.csv("HW1_bike_sharing.csv", stringsAsFactors = FALSE)

# Conversao da data
dados$dteday <- as.Date(dados$dteday)

# Conversao da temperatura para °C
dados$temp_real <- dados$temp * 41

# Calculo do total de usuarios por dia
dados$total_users <- dados$casual + dados$registered

# SERIES TEMPORAIS
par(mfrow = c(2, 1))

# Serie de temperatura
plot(dados$dteday, dados$temp_real, type = "l",
     col = "#ef3640", lwd = 2,
     main = "Temperatura diaria (°C)",
     xlab = "Data", ylab = "Temperatura (°C)")

# Serie de total de usuarios
plot(dados$dteday, dados$total_users, type = "l",
     col = "#4f70b6", lwd = 2,
     main = "Numero total de usuarios por dia",
     xlab = "Data", ylab = "Usuarios")

par(mfrow = c(1,1))