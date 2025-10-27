# Limpeza do ambiente
rm(list = ls())
graphics.off()

# Conjunto de dados (Tabela 1)
x <- c(
  15.8,22.7,26.8,19.1,18.5,14.4,8.3,25.9,26.4,9.8,21.9,10.5,
  17.3,6.2,18.0,22.9,24.6,19.4,12.3,15.9,20.1,17.0,22.3,27.5,
  23.9,17.5,11.0,20.4,16.2,20.8,20.9,21.4,18.0,24.3,11.8,17.9,
  18.7,12.8,15.5,19.2,13.9,28.6,19.4,21.6,13.5,24.6,20.0,24.1,
  9.0,17.6,25.7,20.1,13.2,23.7,10.7,19.0,14.5,18.1,31.8,28.5,
  22.7,15.2,23.0,29.6,11.2,14.7,20.5,26.6,13.3,18.1,24.8,26.1,
  7.7,22.5,19.3,19.4,16.7,16.9,23.5,18.4
)

# Cálculo dos quartis e do IQR
Q1 <- quantile(x, 0.25, type = 7)
Q2 <- quantile(x, 0.50, type = 7)
Q3 <- quantile(x, 0.75, type = 7)
IQR <- IQR(x, type = 7)

# Limites para detecção de outliers (regra 1,5*IQR)
LI <- Q1 - 1.5 * IQR
LS <- Q3 + 1.5 * IQR

# Exibição dos resultados
cat("Q1 =", Q1, "\n")
cat("Q2 =", Q2, "(Mediana)\n")
cat("Q3 =", Q3, "\n")
cat("IQR =", IQR, "\n")
cat("Limite inferior =", LI, "\n")
cat("Limite superior =", LS, "\n")
cat("Mínimo observado =", min(x), " | Máximo observado =", max(x), "\n")

# Verificação automática de possíveis outliers
outliers <- x[x < LI | x > LS]
if (length(outliers) == 0) {
  cat("Não foram identificados outliers pelo critério 1,5*IQR.\n")
} else {
  cat("Foram identificados outliers:", outliers, "\n")
}