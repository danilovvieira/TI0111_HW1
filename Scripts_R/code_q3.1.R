# Limpeza
rm(list = ls())
graphics.off()

setwd("C:/Users/DANILO/Downloads")

# Leitura do CSV (ajuste o caminho se necessario)
dados <- read.csv("HW1_bike_sharing.csv", stringsAsFactors = FALSE)

# Se existir uma coluna-indice "Unnamed: 0", remove-la
if ("Unnamed..0" %in% names(dados)) {
  dados$Unnamed..0 <- NULL
}
if ("Unnamed: 0" %in% names(dados)) {
  dados$`Unnamed: 0` <- NULL
}

# Converter dteday para Date
if ("dteday" %in% names(dados)) {
  dados$dteday <- as.Date(dados$dteday)
}

# Numero de observacoes e intervalo de datas
n <- nrow(dados)
data_min <- min(dados$dteday, na.rm = TRUE)
data_max <- max(dados$dteday, na.rm = TRUE)

cat("n =", n, "\n")
cat("Periodo =", format(data_min), "ate", format(data_max), "\n")

# Classificacao de variaveis (tabela amigavel)
tipos <- c(
  instant     = "numerica discreta (indice)",
  dteday      = "data (calendar date)",
  season      = "categorica ordinal (1-4)",
  weathersit  = "categorica ordinal (1-4)",
  temp        = "numerica continua",
  casual      = "numerica discreta (contagem)",
  registered  = "numerica discreta (contagem)"
)

# Mostrar apenas colunas que existem no seu arquivo
present <- intersect(names(tipos), names(dados))
classificacao <- data.frame(
  Variavel = present,
  Tipo = unname(tipos[present]),
  stringsAsFactors = FALSE
)
print(classificacao, row.names = FALSE)