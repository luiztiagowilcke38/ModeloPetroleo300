# mod16_modelo_ets.R
# Autor: Luiz Tiago Wilcke
# Descrição: Ajuste e previsão com Modelo ETS (Error, Trend, Seasonality)

cat("Executando modelo ETS...\n")

df <- readRDS("data/base_consolidada.rds")
ts_brent <- ts(df$Preco_Brent, start=c(1980, 1), frequency=12)

# Modelo ETS
modelo_ets <- ets(ts_brent)
print(summary(modelo_ets))

# Previsão curto prazo
prev_ets <- forecast(modelo_ets, h=24)

saveRDS(modelo_ets, "output/modelo_ets.rds")
png("output/grafico_previsao_ets.png")
plot(prev_ets, main="Previsão ETS (24 meses)")
dev.off()

cat("Modelo ETS ajustado e previsões salvas.\n")
