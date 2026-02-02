# mod18_rede_neural_ts.R
# Autor: Luiz Tiago Wilcke
# Descrição: Modelo Auto-Regressivo de Redes Neurais (NNAR)

cat("Executando modelo NNAR...\n")

df <- readRDS("data/base_consolidada.rds")
ts_brent <- ts(df$Preco_Brent, start=c(1980, 1), frequency=12)

set.seed(123)
# Ajuste NNAR
modelo_nnar <- nnetar(ts_brent)
print(modelo_nnar)

prev_nnar <- forecast(modelo_nnar, h=24)

saveRDS(modelo_nnar, "output/modelo_nnar.rds")
png("output/grafico_previsao_nnar.png")
plot(prev_nnar, main="Previsão Rede Neural (NNAR)")
dev.off()

cat("Modelo NNAR ajustado.\n")
