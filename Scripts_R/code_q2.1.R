# Limpeza do ambiente
rm(list = ls())
graphics.off()

# DADOS DA QUESTÃO 2
idade <- c(28, 34, 46, 26, 37, 29, 51, 31, 39, 43, 58, 44, 25, 23, 52, 42, 48, 33, 38, 46)
renda <- c(2.3, 1.6, 1.2, 0.9, 2.1, 1.6, 1.8, 1.4, 1.2, 2.8, 3.4, 2.7, 1.6, 1.2, 1.1, 2.5, 2.0, 1.7, 2.1, 3.2)
experiencia <- c(2, 8, 21, 1, 15, 3, 28, 5, 13, 20, 32, 23, 1, 0, 29, 18, 19, 7, 12, 23)

# CÁLCULOS DESCRITIVOS
# Função auxiliar
resumo <- function(v){
  media <- mean(v)
  mediana <- median(v)
  desvio <- sd(v)
  data.frame(Media = round(media,2), Mediana = round(mediana,2), Desvio_Padrao = round(desvio,2))
}

# Aplicação para cada variável
tabela_resumo <- rbind(
  Idade = resumo(idade),
  Renda = resumo(renda),
  Experiencia = resumo(experiencia)
)

print(tabela_resumo)