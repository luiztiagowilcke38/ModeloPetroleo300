# mod26_analise_sensibilidade.R
# Autor: Luiz Tiago Wilcke
# Descrição: Sensibilidade do preço a variações nas variáveis explicativas

cat("Executando análise de sensibilidade...\n")

model <- readRDS("output/modelo_regressao_linear.rds")

# Coeficientes
coefs <- coef(model)
cat("Coeficientes do modelo linear:\n")
print(coefs)

# Calcular elasticidade média (aproximada) nas médias das variáveis
df <- readRDS("data/base_consolidada.rds")
media_x <- colMeans(df[, c("Producao_Global", "Demanda_Global", "Dolar_Index", "Indice_GPR")], na.rm=TRUE)
media_y <- mean(df$Preco_Brent, na.rm=TRUE)

elasticidades <- coefs[names(media_x)] * media_x / media_y

file_conn <- file("output/analise_sensibilidade.txt")
writeLines(c(
  "Análise de Sensibilidade (Elasticidades no Ponto Médio):",
  capture.output(elasticidades)
), file_conn)
close(file_conn)

cat("Análise de sensibilidade concluída.\n")
