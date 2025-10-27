# Limpeza do ambiente
rm(list = ls())
graphics.off()

# Leitura do arquivo CSV 
setwd("C:/Users/DANILO/Downloads")
dados <- read.csv("HW1_bike_sharing.csv", stringsAsFactors = FALSE)

# Conversão de data, se necessário
if ("dteday" %in% names(dados)) {
  dados$dteday <- as.Date(dados$dteday)
}

# Seleção das variáveis numéricas relevantes
variaveis <- c("temp", "casual", "registered")
subset_dados <- dados[, variaveis]

# Cálculo das medidas
resultados <- data.frame(
  Variavel = variaveis,
  Media = sapply(subset_dados, mean),
  Mediana = sapply(subset_dados, median),
  Q1 = sapply(subset_dados, quantile, 0.25),
  Q3 = sapply(subset_dados, quantile, 0.75)
)

# Arredondamento
resultados[, -1] <- round(resultados[, -1], 2)

# Exibição
print(resultados)

# Opcional: exportar tabela para conferência (não obrigatório)
# write.csv(resultados, "medidas_q32.csv", row.names = FALSE)