# mod11_testes_estacionariedade.R
# Autor: Luiz Tiago Wilcke
# Descrição: Testes de raiz unitária (ADF e KPSS)

cat("Realizando testes de estacionariedade...\n")

df <- readRDS("data/base_consolidada.rds")
ts_brent <- ts(df$Preco_Brent)

# Teste ADF (Augmented Dickey-Fuller)
# H0: Série NÃO é estacionária
adf_test <- adf.test(ts_brent)
cat("Resultado ADF Test:\n")
print(adf_test)

# Teste KPSS
# H0: Série É estacionária
kpss_test <- kpss.test(ts_brent, null="Trend")
cat("Resultado KPSS Test:\n")
print(kpss_test)

file_conn <- file("output/resultados_estacionariedade.txt")
writeLines(c(
  capture.output(adf_test),
  "\n--------------------------------\n",
  capture.output(kpss_test)
), file_conn)
close(file_conn)

cat("Resultados dos testes salvos em 'output/resultados_estacionariedade.txt'.\n")
